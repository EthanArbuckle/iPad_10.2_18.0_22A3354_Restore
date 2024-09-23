@implementation FigMetalAllocator

- (unint64_t)usedSize
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_currentResources;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_getAssociatedObject(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), 0);
        v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v8)
          v9 = v8[2];
        else
          v9 = 0;

        v5 += v9;
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)newBufferDescriptor
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setOptions:", self->_resourceOptions);
  objc_msgSend(v3, "setAllocationHint:", self->_allocationHint);
  return v3;
}

- (id)newTextureDescriptor
{
  void *v3;
  unint64_t resourceOptions;
  void *v5;
  void *v6;
  uint64_t compressionLevel;
  void *v8;

  v3 = (void *)objc_opt_new();
  resourceOptions = self->_resourceOptions;
  objc_msgSend(v3, "desc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResourceOptions:", resourceOptions);

  if (!self->_forceDisableCompression && self->_compressionLevel <= 3u)
  {
    objc_msgSend(v3, "desc");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompressionMode:", 1);

    compressionLevel = self->_compressionLevel;
    objc_msgSend(v3, "desc");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompressionFootprint:", compressionLevel);

  }
  objc_msgSend(v3, "setAllocationHint:", self->_allocationHint);
  return v3;
}

- (id)newBufferWithDescriptor:(id)a3
{
  id v4;
  BOOL v5;
  FigMetalAllocatorMetadata *v6;
  FigMetalAllocatorMetadata *v7;
  void *v8;
  id v9;
  int v11;
  _QWORD v12[2];

  v12[0] = 0;
  v12[1] = 0;
  v4 = -[FigMetalAllocatorBackend newBufferWithDescriptor:sizeAlign:](self->_backendAllocator, "newBufferWithDescriptor:sizeAlign:", a3, v12);
  if (v4)
    v5 = v12[0] == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = -[FigMetalAllocatorMetadata initWithFigMetalAllocator:]([FigMetalAllocatorMetadata alloc], "initWithFigMetalAllocator:", self);
    if (v6)
    {
      v7 = v6;
      v6->_size = v12[0];
      v6->_type = 1;
      objc_setAssociatedObject(v4, 0, v6, (void *)1);

      -[NSMutableSet addObject:](self->_currentResources, "addObject:", v4);
    }
    else
    {
      v11 = FigSignalErrorAt();
      v8 = 0;
      if (v11)
        goto LABEL_8;
    }
  }
  v8 = v4;
LABEL_8:
  v9 = v8;

  return v9;
}

- (id)newTextureWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  FigMetalUtils *utils;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  FigMetalAllocator *v14;
  FigMetalAllocator *v15;
  float v16;
  BOOL v17;
  FigMetalAllocatorMetadata *v18;
  FigMetalAllocatorMetadata *v19;
  FigMetalAllocator *v20;
  FigMetalAllocator *v21;
  FigMetalAllocator *v22;
  int v24;
  _QWORD v25[2];

  v25[0] = 0;
  v25[1] = 0;
  v4 = a3;
  v5 = v4;
  if (!self->_autoUseSubAllocators)
  {
LABEL_8:
    v15 = -[FigMetalAllocatorBackend newTextureWithDescriptor:sizeAlign:](self->_backendAllocator, "newTextureWithDescriptor:sizeAlign:", v5, v25);
    if (v15)
      v17 = v25[0] == 0;
    else
      v17 = 1;
    if (!v17)
    {
      v18 = -[FigMetalAllocatorMetadata initWithFigMetalAllocator:]([FigMetalAllocatorMetadata alloc], "initWithFigMetalAllocator:", self);
      if (v18)
      {
        v19 = v18;
        v18->_size = v25[0];
        v18->_type = 0;
        objc_setAssociatedObject(v15, 0, v18, (void *)1);

        -[NSMutableSet addObject:](self->_currentResources, "addObject:", v15);
      }
      else
      {
        v24 = FigSignalErrorAt();
        v20 = 0;
        if (v24)
          goto LABEL_15;
      }
    }
    v20 = v15;
LABEL_15:
    v21 = v20;
    goto LABEL_16;
  }
  objc_msgSend(v4, "desc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "height");
  utils = self->_utils;
  objc_msgSend(v5, "desc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "width");
  objc_msgSend(v5, "desc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FigMetalUtils computeLinearTextureStride:format:](utils, "computeLinearTextureStride:format:", v10, objc_msgSend(v11, "pixelFormat"))* v7;

  v13 = 0;
  while (1)
  {
    v14 = self->subAllocator[v13];
    v15 = v14;
    if (v14)
    {
      v16 = (float)-[FigMetalAllocator memSize](v14, "memSize") / (float)(unint64_t)v12;
      if (v16 >= 1.0 && v16 <= self->_texSizeRatioThreshold && !-[FigMetalAllocator usedSize](v15, "usedSize"))
        break;
    }

    if (++v13 == 10)
      goto LABEL_8;
  }
  v21 = -[FigMetalAllocator newTextureWithDescriptor:](v15, "newTextureWithDescriptor:", v5);
LABEL_16:
  v22 = v21;

  return v22;
}

- (int)setupWithDescriptor:(id)a3 allocatorBackend:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSString *v9;
  NSString *label;
  void *v11;
  int v12;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_backendAllocator, a4);
  if (-[FigMetalAllocatorBackend memSize](self->_backendAllocator, "memSize")
    && (v8 = -[FigMetalAllocatorBackend memSize](self->_backendAllocator, "memSize"), v8 == objc_msgSend(v6, "memSize")))
  {
    self->_isExternalBackendAllocator = 1;
    self->_memSize = -[FigMetalAllocatorBackend memSize](self->_backendAllocator, "memSize");
    objc_msgSend(v6, "label");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    label = self->_label;
    self->_label = v9;

    self->_resourceOptions = objc_msgSend(v6, "resourceOptions");
    self->_compressionLevel = objc_msgSend(v6, "compressionLevel");
    self->_allocationHint = objc_msgSend(v6, "allocationHint");
    objc_msgSend(v6, "externalBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isExternalMemory = v11 != 0;

    self->_allowFallBack = objc_msgSend(v6, "allowFallback");
    self->_autoUseSubAllocators = objc_msgSend(v6, "autoUseSubAllocators");
    -[FigMetalAllocator reset](self, "reset");
    v12 = 0;
  }
  else
  {
    v12 = FigSignalErrorAt();
  }

  return v12;
}

- (FigMetalAllocator)initWithDevice:(id)a3 allocatorType:(int)a4
{
  uint64_t v4;
  id v6;
  FigMetalAllocator *v7;
  FigMetalTextureDescriptor *v8;
  FigMetalTextureDescriptor *texDesc;
  FigMetalBufferDescriptor *v10;
  FigMetalBufferDescriptor *bufDesc;
  FigMetalUtils *v12;
  FigMetalUtils *utils;
  uint64_t i;
  void *v15;
  NSMutableSet *v16;
  NSMutableSet *currentResources;
  FigMetalAllocatorBackend *v18;
  FigMetalAllocatorBackend *backendAllocator;
  FigMetalAllocatorBackend *v20;
  FigMetalAllocator *v21;
  objc_super v23;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if ((v4 - 4) <= 0xFFFFFFFC)
    goto LABEL_14;
  v23.receiver = self;
  v23.super_class = (Class)FigMetalAllocator;
  v7 = -[FigMetalAllocator init](&v23, sel_init);
  self = v7;
  if (v7)
  {
    v7->_allocatorType = v4;
    *(_QWORD *)&v7->_compressionLevel = 0xFFFFFFFFLL;
    v8 = (FigMetalTextureDescriptor *)objc_opt_new();
    texDesc = self->_texDesc;
    self->_texDesc = v8;

    if (self->_texDesc)
    {
      v10 = (FigMetalBufferDescriptor *)objc_opt_new();
      bufDesc = self->_bufDesc;
      self->_bufDesc = v10;

      if (self->_bufDesc)
      {
        v12 = -[FigMetalUtils initWithDevice:]([FigMetalUtils alloc], "initWithDevice:", v6);
        utils = self->_utils;
        self->_utils = v12;

        if (self->_utils)
        {
          for (i = 56; i != 136; i += 8)
          {
            v15 = *(Class *)((char *)&self->super.isa + i);
            *(Class *)((char *)&self->super.isa + i) = 0;

          }
          v16 = (NSMutableSet *)objc_opt_new();
          currentResources = self->_currentResources;
          self->_currentResources = v16;

          if (self->_currentResources)
          {
            v18 = -[FigMetalAllocatorBackend initWithDevice:allocatorType:]([FigMetalAllocatorBackend alloc], "initWithDevice:allocatorType:", v6, v4);
            backendAllocator = self->_backendAllocator;
            self->_backendAllocator = v18;

            v20 = self->_backendAllocator;
            if (v20)
            {
              self->_isExternalBackendAllocator = 0;
              self->_forceDisableCompression = 0;
              -[FigMetalAllocatorBackend reset](v20, "reset");
              self->_texSizeRatioThreshold = 4.0;
              goto LABEL_11;
            }
            fig_log_get_emitter();
            FigDebugAssert3();
          }
        }
      }
    }
LABEL_14:
    FigSignalErrorAt();
    v21 = 0;
    goto LABEL_12;
  }
LABEL_11:
  self = self;
  v21 = self;
LABEL_12:

  return v21;
}

- (int)setupWithDescriptor:(id)a3
{
  id v4;
  NSString *v5;
  NSString *label;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  if (objc_msgSend(v4, "memSize"))
  {
    self->_memSize = objc_msgSend(v4, "memSize");
    objc_msgSend(v4, "label");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    label = self->_label;
    self->_label = v5;

    self->_resourceOptions = objc_msgSend(v4, "resourceOptions");
    self->_compressionLevel = objc_msgSend(v4, "compressionLevel");
    self->_allocationHint = objc_msgSend(v4, "allocationHint");
    objc_msgSend(v4, "externalBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isExternalMemory = v7 != 0;

    self->_allowFallBack = objc_msgSend(v4, "allowFallback");
    self->_autoUseSubAllocators = objc_msgSend(v4, "autoUseSubAllocators");
    v8 = (void *)objc_opt_new();
    objc_msgSend(v4, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLabel:", v9);

    objc_msgSend(v8, "setMemSize:", objc_msgSend(v4, "memSize"));
    objc_msgSend(v8, "setResourceOptions:", objc_msgSend(v4, "resourceOptions"));
    objc_msgSend(v8, "setWireMemory:", objc_msgSend(v4, "wireMemory"));
    objc_msgSend(v4, "externalBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExternalBuffer:", v10);

    if (-[FigMetalAllocatorBackend setupWithDescriptor:](self->_backendAllocator, "setupWithDescriptor:", v8))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      -[FigMetalAllocator reset](self, "reset");
    }

    v11 = 0;
  }
  else
  {
    v11 = FigSignalErrorAt();
  }

  return v11;
}

- (void)reset
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableSet copy](self->_currentResources, "copy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v11 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_getAssociatedObject(v11, 0);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
        {
          if (*(_QWORD *)(v9 + 32))
            -[FigMetalAllocator makeBufferAliasable:](self, "makeBufferAliasable:", &v11);
          else
            -[FigMetalAllocator makeTextureAliasable:](self, "makeTextureAliasable:", &v11);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  self->_forceDisableCompression = 0;
}

- (void)makeBufferAliasable:(id *)a3
{
  if (a3 && *a3)
  {
    if (-[FigMetalAllocatorBackend hasCreatedResource:](self->_backendAllocator, "hasCreatedResource:"))
    {
      -[NSMutableSet removeObject:](self->_currentResources, "removeObject:", *a3);
      -[FigMetalAllocatorBackend makeBufferAliasable:](self->_backendAllocator, "makeBufferAliasable:", a3);
    }
  }
}

- (FigMetalAllocatorBackend)backendAllocator
{
  return self->_backendAllocator;
}

- (int)allocatorType
{
  return self->_allocatorType;
}

- (id)description
{
  void *v2;
  NSString *label;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  label = self->_label;
  -[FigMetalAllocatorBackend description](self->_backendAllocator, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_%@"), label, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)largestOccupiedOffset
{
  return -[FigMetalAllocatorBackend largestOccupiedOffset](self->_backendAllocator, "largestOccupiedOffset");
}

- (unint64_t)maxContiguousFreeSize
{
  return -[FigMetalAllocatorBackend maxContiguousFreeSize](self->_backendAllocator, "maxContiguousFreeSize");
}

- (void)purgeResources
{
  if (!self->_isExternalBackendAllocator)
    -[FigMetalAllocatorBackend purgeResources](self->_backendAllocator, "purgeResources");
  -[FigMetalAllocator reset](self, "reset");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FigMetalAllocator;
  -[FigMetalAllocator dealloc](&v2, sel_dealloc);
}

- (void)forgoOwnership:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_currentResources, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_currentResources, "removeObject:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v12;
      while (1)
      {
        if (*(_QWORD *)v12 != v10)
          objc_enumerationMutation(v7);
        if (!--v9)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (!v9)
            break;
        }
      }
    }

  }
}

- (int)compressionLevel
{
  if (self->_forceDisableCompression)
    return -1;
  else
    return self->_compressionLevel;
}

- (int)allocationHint
{
  return self->_allocationHint;
}

- (void)makeTextureAliasable:(id *)a3
{
  if (a3 && *a3)
  {
    if (-[FigMetalAllocatorBackend hasCreatedResource:](self->_backendAllocator, "hasCreatedResource:"))
    {
      -[NSMutableSet removeObject:](self->_currentResources, "removeObject:", *a3);
      -[FigMetalAllocatorBackend makeTextureAliasable:](self->_backendAllocator, "makeTextureAliasable:", a3);
    }
  }
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)getSizeAndAlignForDescriptor:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v3 = -[FigMetalAllocatorBackend getSizeAndAlignForDescriptor:](self->_backendAllocator, "getSizeAndAlignForDescriptor:", a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)getSizeAndAlignForBufferDescriptor:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v3 = -[FigMetalAllocatorBackend getSizeAndAlignForBufferDescriptor:](self->_backendAllocator, "getSizeAndAlignForBufferDescriptor:", a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)setForceDisableCompression:(BOOL)a3
{
  self->_forceDisableCompression = a3;
}

- (BOOL)forceDisableCompression
{
  return self->_forceDisableCompression;
}

- (id)newTextureDescriptor:(unsigned int)a3
{
  if (a3 == 255)
    return -[FigMetalAllocator newTextureDescriptor](self, "newTextureDescriptor");
  if (a3 <= 9)
  {
    self = self->subAllocator[a3];
    return -[FigMetalAllocator newTextureDescriptor](self, "newTextureDescriptor");
  }
  return 0;
}

- (id)newBufferDescriptor:(unsigned int)a3
{
  if (a3 == 255)
    return -[FigMetalAllocator newBufferDescriptor](self, "newBufferDescriptor");
  if (a3 <= 9)
  {
    self = self->subAllocator[a3];
    return -[FigMetalAllocator newBufferDescriptor](self, "newBufferDescriptor");
  }
  return 0;
}

- (int)addExternalMetalBuffer:(id)a3 atSubAllocatorID:(unsigned int)a4
{
  id v6;
  FigMetalAllocator **subAllocator;
  int v8;
  uint64_t v10;
  int allocatorType;
  FigMetalAllocator *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  FigMetalAllocator *v16;
  void *v17;
  void *v18;

  v6 = a3;
  if (a4 > 9 || (subAllocator = self->subAllocator, self->subAllocator[a4]))
  {
    v8 = -1;
  }
  else
  {
    v10 = a4;
    allocatorType = self->_allocatorType;
    v12 = [FigMetalAllocator alloc];
    -[FigMetalUtils device](self->_utils, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (allocatorType == 3)
      v14 = 3;
    else
      v14 = 1;
    v15 = -[FigMetalAllocator initWithDevice:allocatorType:](v12, "initWithDevice:allocatorType:", v13, v14);
    v16 = subAllocator[v10];
    subAllocator[v10] = (FigMetalAllocator *)v15;

    if (subAllocator[v10] && (v17 = (void *)objc_opt_new()) != 0)
    {
      v18 = v17;
      objc_msgSend(v17, "setMemSize:", objc_msgSend(v6, "length"));
      objc_msgSend(v18, "setExternalBuffer:", v6);
      v8 = -[FigMetalAllocator setupWithDescriptor:](subAllocator[v10], "setupWithDescriptor:", v18);

    }
    else
    {
      v8 = FigSignalErrorAt();
    }
  }

  return v8;
}

- (id)newTextureWithDescriptor:(id)a3 subAllocatorID:(unsigned int)a4
{
  id v6;
  unint64_t v7;
  FigMetalAllocator *v8;
  id v9;

  v6 = a3;
  if (a4 != 255)
  {
    if (a4 > 9)
      goto LABEL_9;
    v7 = -[FigMetalAllocator maxContiguousFreeSize](self->subAllocator[a4], "maxContiguousFreeSize");
    if (-[FigMetalAllocator getSizeAndAlignForDescriptor:](self->subAllocator[a4], "getSizeAndAlignForDescriptor:", v6) <= v7)
    {
      v8 = self->subAllocator[a4];
      goto LABEL_7;
    }
    if (!self->_allowFallBack)
    {
LABEL_9:
      v9 = 0;
      goto LABEL_8;
    }
  }
  v8 = self;
LABEL_7:
  v9 = -[FigMetalAllocator newTextureWithDescriptor:](v8, "newTextureWithDescriptor:", v6);
LABEL_8:

  return v9;
}

- (id)newBufferWithDescriptor:(id)a3 subAllocatorID:(unsigned int)a4
{
  id v6;
  unint64_t v7;
  FigMetalAllocator *v8;
  id v9;

  v6 = a3;
  if (a4 != 255)
  {
    if (a4 > 9)
      goto LABEL_9;
    v7 = -[FigMetalAllocator maxContiguousFreeSize](self->subAllocator[a4], "maxContiguousFreeSize");
    if (-[FigMetalAllocator getSizeAndAlignForBufferDescriptor:](self->subAllocator[a4], "getSizeAndAlignForBufferDescriptor:", v6) <= v7)
    {
      v8 = self->subAllocator[a4];
      goto LABEL_7;
    }
    if (!self->_allowFallBack)
    {
LABEL_9:
      v9 = 0;
      goto LABEL_8;
    }
  }
  v8 = self;
LABEL_7:
  v9 = -[FigMetalAllocator newBufferWithDescriptor:](v8, "newBufferWithDescriptor:", v6);
LABEL_8:

  return v9;
}

- (unint64_t)usedSize:(unsigned int)a3
{
  if (a3 == 255)
    return -[FigMetalAllocator usedSize](self, "usedSize");
  if (a3 <= 9)
  {
    self = self->subAllocator[a3];
    return -[FigMetalAllocator usedSize](self, "usedSize");
  }
  return 0;
}

- (unint64_t)largestOccupiedOffset:(unsigned int)a3
{
  if (a3 == 255)
    return -[FigMetalAllocator largestOccupiedOffset](self, "largestOccupiedOffset");
  if (a3 <= 9)
  {
    self = self->subAllocator[a3];
    return -[FigMetalAllocator largestOccupiedOffset](self, "largestOccupiedOffset");
  }
  return 0;
}

- (unint64_t)memSize:(unsigned int)a3
{
  if (a3 == 255)
    return -[FigMetalAllocator memSize](self, "memSize");
  if (a3 <= 9)
  {
    self = self->subAllocator[a3];
    return -[FigMetalAllocator memSize](self, "memSize");
  }
  return 0;
}

- (void)reset:(unsigned int)a3
{
  if (a3 != 255)
  {
    if (a3 > 9)
      return;
    self = self->subAllocator[a3];
  }
  -[FigMetalAllocator reset](self, "reset");
}

- (void)purgeResources:(unsigned int)a3
{
  id *v3;
  id v4;

  if (a3 == 255)
  {
    -[FigMetalAllocator purgeResources](self, "purgeResources");
  }
  else if (a3 <= 9)
  {
    v3 = (id *)(&self->super.isa + a3);
    objc_msgSend(v3[7], "purgeResources");
    v4 = v3[7];
    v3[7] = 0;

  }
}

- (void)purgeAllSubAllocatorsResources
{
  uint64_t v2;
  FigMetalAllocator **subAllocator;
  FigMetalAllocator *v4;

  v2 = 0;
  subAllocator = self->subAllocator;
  do
  {
    -[FigMetalAllocator purgeResources](subAllocator[v2], "purgeResources");
    v4 = subAllocator[v2];
    subAllocator[v2] = 0;

    ++v2;
  }
  while (v2 != 10);
}

- (unint64_t)usedSizeAll
{
  unint64_t v3;
  uint64_t v4;
  FigMetalAllocator **subAllocator;

  v3 = -[FigMetalAllocator usedSize](self, "usedSize");
  v4 = 0;
  subAllocator = self->subAllocator;
  do
    v3 += -[FigMetalAllocator usedSizeAll](subAllocator[v4++], "usedSizeAll");
  while (v4 != 10);
  return v3;
}

- (unint64_t)memSize
{
  return self->_memSize;
}

- (unint64_t)resourceOptions
{
  return self->_resourceOptions;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_label, 0);
  for (i = 128; i != 48; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_currentResources, 0);
  objc_storeStrong((id *)&self->_bufDesc, 0);
  objc_storeStrong((id *)&self->_texDesc, 0);
  objc_storeStrong((id *)&self->_utils, 0);
  objc_storeStrong((id *)&self->_backendAllocator, 0);
}

@end
