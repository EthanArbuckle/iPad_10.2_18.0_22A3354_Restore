@implementation FigMetalAllocatorBackend

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_utils, 0);
  objc_storeStrong((id *)&self->_rangeAllocator, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)makeBufferAliasable:(id *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a3)
  {
    if (*a3)
    {
      v5 = *a3;
      objc_getAssociatedObject(v5, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (self->_allocatorType != 3)
        -[CMIRangeAllocator freeRangeWithOffset:size:](self->_rangeAllocator, "freeRangeWithOffset:size:", -[FigMetalAllocatorImpl bufferOffset:](self->_storage, "bufferOffset:", v5), *(_QWORD *)(v6 + 16));

      v8 = *a3;
    }
    else
    {
      v8 = 0;
    }
    *a3 = 0;

  }
}

- (id)newTextureWithDescriptor:(id)a3 sizeAlign:(id *)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t largestOccupiedOffset;
  uint64_t v17;

  v6 = a3;
  v17 = 0;
  if (!v6)
  {
    FigSignalErrorAt();
    goto LABEL_7;
  }
  v7 = -[FigMetalAllocatorImpl getSizeAndAlignForDescriptor:](self->_storage, "getSizeAndAlignForDescriptor:", v6);
  v9 = v7;
  v10 = v8;
  if (a4)
  {
    a4->var0 = v7;
    a4->var1 = v8;
  }
  v11 = objc_msgSend(v6, "allocationHint");
  if (self->_allocatorType == 3)
  {
    v12 = 0;
    goto LABEL_9;
  }
  if (-[CMIRangeAllocator allocateWithSize:alignment:outputOffset:allocationHint:](self->_rangeAllocator, "allocateWithSize:alignment:outputOffset:allocationHint:", v9, v10, &v17, v11 == 1))
  {
LABEL_7:
    v13 = 0;
    goto LABEL_14;
  }
  v12 = v17;
LABEL_9:
  v13 = (void *)-[FigMetalAllocatorImpl newTextureWithDescriptor:offset:](self->_storage, "newTextureWithDescriptor:offset:", v6, v12);
  if (v13)
  {
    objc_msgSend(v6, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLabel:", v14);

    objc_msgSend(v13, "compressionFeedback");
    if (self->_allocatorType != 3)
    {
      largestOccupiedOffset = v17 + v9;
      if (self->_largestOccupiedOffset > v17 + v9)
        largestOccupiedOffset = self->_largestOccupiedOffset;
      self->_largestOccupiedOffset = largestOccupiedOffset;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_14:

  return v13;
}

- (id)newBufferWithDescriptor:(id)a3 sizeAlign:(id *)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t largestOccupiedOffset;
  uint64_t v17;

  v6 = a3;
  v17 = 0;
  if (!objc_msgSend(v6, "length"))
  {
    FigSignalErrorAt();
    goto LABEL_7;
  }
  v7 = -[FigMetalAllocatorImpl getSizeAndAlignForBufferDescriptor:](self->_storage, "getSizeAndAlignForBufferDescriptor:", v6);
  v9 = v7;
  v10 = v8;
  if (a4)
  {
    a4->var0 = v7;
    a4->var1 = v8;
  }
  v11 = objc_msgSend(v6, "allocationHint");
  if (self->_allocatorType == 3)
  {
    v12 = 0;
    goto LABEL_9;
  }
  if (-[CMIRangeAllocator allocateWithSize:alignment:outputOffset:allocationHint:](self->_rangeAllocator, "allocateWithSize:alignment:outputOffset:allocationHint:", v9, v10, &v17, v11 == 1))
  {
LABEL_7:
    v13 = 0;
    goto LABEL_14;
  }
  v12 = v17;
LABEL_9:
  v13 = (void *)-[FigMetalAllocatorImpl newBufferWithDescriptor:offset:](self->_storage, "newBufferWithDescriptor:offset:", v6, v12);
  if (v13)
  {
    objc_msgSend(v6, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLabel:", v14);

    if (self->_allocatorType != 3)
    {
      largestOccupiedOffset = v17 + v9;
      if (self->_largestOccupiedOffset > v17 + v9)
        largestOccupiedOffset = self->_largestOccupiedOffset;
      self->_largestOccupiedOffset = largestOccupiedOffset;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_14:

  return v13;
}

- (unint64_t)memSize
{
  return self->_memSize;
}

- (int)setupWithDescriptor:(id)a3
{
  id v4;
  NSString *v5;
  NSString *label;
  void *v7;
  int v8;

  v4 = a3;
  if (objc_msgSend(v4, "memSize"))
  {
    self->_memSize = objc_msgSend(v4, "memSize");
    objc_msgSend(v4, "label");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    label = self->_label;
    self->_label = v5;

    self->_resourceOptions = objc_msgSend(v4, "resourceOptions");
    objc_msgSend(v4, "externalBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isExternalMemory = v7 != 0;

    self->_largestOccupiedOffset = 0;
    if (-[FigMetalAllocatorImpl setupWithDescriptor:](self->_storage, "setupWithDescriptor:", v4))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v8 = 0;
    }
    else
    {
      v8 = -[CMIRangeAllocator setupWithMemSize:alignment:strategyType:](self->_rangeAllocator, "setupWithMemSize:alignment:strategyType:", self->_memSize, -[FigMetalAllocatorImpl alignment](self->_storage, "alignment"), FigGetCFPreferenceNumberWithDefault());
      if (v8)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        -[FigMetalAllocatorBackend reset](self, "reset");
      }
    }
  }
  else
  {
    v8 = FigSignalErrorAt();
  }

  return v8;
}

- (FigMetalAllocatorBackend)initWithDevice:(id)a3 allocatorType:(int)a4
{
  id v6;
  FigMetalAllocatorBackend *v7;
  FigMetalUtils *v8;
  FigMetalUtils *utils;
  CMIRangeAllocator *v10;
  CMIRangeAllocator *rangeAllocator;
  int allocatorType;
  __objc2_class *v13;
  FigMetalAllocatorImpl *v14;
  FigMetalAllocatorImpl *storage;
  FigMetalAllocatorBackend *v16;
  objc_super v18;

  v6 = a3;
  if ((a4 - 4) <= 0xFFFFFFFC)
    goto LABEL_15;
  v18.receiver = self;
  v18.super_class = (Class)FigMetalAllocatorBackend;
  v7 = -[FigMetalAllocatorBackend init](&v18, sel_init);
  self = v7;
  if (v7)
  {
    v7->_largestOccupiedOffset = 0;
    v7->_allocatorType = a4;
    v8 = -[FigMetalUtils initWithDevice:]([FigMetalUtils alloc], "initWithDevice:", v6);
    utils = self->_utils;
    self->_utils = v8;

    if (self->_utils)
    {
      v10 = (CMIRangeAllocator *)objc_opt_new();
      rangeAllocator = self->_rangeAllocator;
      self->_rangeAllocator = v10;

      if (self->_rangeAllocator)
      {
        allocatorType = self->_allocatorType;
        switch(allocatorType)
        {
          case 1:
            v13 = FigMetalBufferAllocator;
            break;
          case 3:
            v13 = FigMetalNoAliasingAllocator;
            break;
          case 2:
            v13 = FigMetalHeapAllocator;
            break;
          default:
LABEL_12:
            self->_isExternalMemory = 0;
            -[FigMetalAllocatorBackend reset](self, "reset");
            goto LABEL_13;
        }
        v14 = (FigMetalAllocatorImpl *)objc_msgSend([v13 alloc], "initWithMetalUtils:", self->_utils);
        storage = self->_storage;
        self->_storage = v14;

        goto LABEL_12;
      }
    }
LABEL_15:
    FigSignalErrorAt();
    v16 = 0;
    goto LABEL_14;
  }
LABEL_13:
  self = self;
  v16 = self;
LABEL_14:

  return v16;
}

- (void)reset
{
  -[CMIRangeAllocator reset](self->_rangeAllocator, "reset");
  self->_largestOccupiedOffset = 0;
}

- (BOOL)hasCreatedResource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  FigMetalAllocatorImpl *storage;
  char v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_getAssociatedObject(v4, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v8 = *(_QWORD *)(v6 + 32);
      storage = self->_storage;
      if (v8)
        v10 = -[FigMetalAllocatorImpl hasCreatedBuffer:](storage, "hasCreatedBuffer:", v5);
      else
        v10 = -[FigMetalAllocatorImpl hasCreatedTexture:](storage, "hasCreatedTexture:", v5);
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[FigMetalAllocatorImpl memSize](self->_storage, "memSize");
  v6 = -[FigMetalAllocatorImpl alignment](self->_storage, "alignment");
  -[FigMetalAllocatorImpl description](self->_storage, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: Storage: Size:%lu, Alignment:%lu, Description:%@"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)maxContiguousFreeSize
{
  return -[CMIRangeAllocator getMaxFreeSize](self->_rangeAllocator, "getMaxFreeSize");
}

- (void)purgeResources
{
  -[FigMetalAllocatorImpl purgeResources](self->_storage, "purgeResources");
  -[FigMetalAllocatorBackend reset](self, "reset");
}

- (unint64_t)usedSize
{
  unint64_t memSize;

  memSize = self->_memSize;
  return memSize - -[CMIRangeAllocator getTotalFreeMemorySize](self->_rangeAllocator, "getTotalFreeMemorySize");
}

- (int)setupWithDescriptor:(id)a3 allocatorBackend:(id)a4
{
  return -1;
}

- (void)makeTextureAliasable:(id *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a3)
  {
    if (*a3)
    {
      v5 = *a3;
      objc_getAssociatedObject(v5, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (self->_allocatorType != 3)
        -[CMIRangeAllocator freeRangeWithOffset:size:](self->_rangeAllocator, "freeRangeWithOffset:size:", -[FigMetalAllocatorImpl textureOffset:](self->_storage, "textureOffset:", v5), *(_QWORD *)(v6 + 16));

      v8 = *a3;
    }
    else
    {
      v8 = 0;
    }
    *a3 = 0;

  }
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)getSizeAndAlignForDescriptor:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v3 = -[FigMetalAllocatorImpl getSizeAndAlignForDescriptor:](self->_storage, "getSizeAndAlignForDescriptor:", a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)getSizeAndAlignForBufferDescriptor:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v3 = -[FigMetalAllocatorImpl getSizeAndAlignForBufferDescriptor:](self->_storage, "getSizeAndAlignForBufferDescriptor:", a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (unint64_t)largestOccupiedOffset
{
  return self->_largestOccupiedOffset;
}

- (int)allocatorType
{
  return self->_allocatorType;
}

- (unint64_t)resourceOptions
{
  return self->_resourceOptions;
}

@end
