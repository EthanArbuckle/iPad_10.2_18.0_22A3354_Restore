@implementation REMultiBufferMeshPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMultiBufferMeshPayload)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  NSArray *parts;
  void *v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  NSArray *models;
  void *v16;
  uint64_t v17;
  void *v18;
  NSArray *v19;
  NSArray *instances;
  void *v21;
  uint64_t v22;
  void *v23;
  NSArray *v24;
  NSArray *skeletons;
  void *v26;
  DRMemoryResource *v27;
  DRMemoryResource *privatePayload;
  void *v29;
  void *v30;
  DRMemoryResource *v31;
  DRMemoryResource *sharedPayload;
  NSString *v33;
  NSString *v34;
  uint64_t Bytes;
  unint64_t Length;
  NSString *v37;
  REMultiBufferMeshPayload *v38;
  uint64_t v40;
  unint64_t v41;
  objc_super v42;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42.receiver = self;
    v42.super_class = (Class)REMultiBufferMeshPayload;
    self = -[RESharedResourcePayload initWithCoder:](&v42, sel_initWithCoder_, v4);
    if (self)
    {
      v6 = (void *)MEMORY[0x24BDBCF20];
      v7 = objc_opt_class();
      objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("parts"));
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      parts = self->_parts;
      self->_parts = v9;

      v11 = (void *)MEMORY[0x24BDBCF20];
      v12 = objc_opt_class();
      objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("models"));
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
      models = self->_models;
      self->_models = v14;

      v16 = (void *)MEMORY[0x24BDBCF20];
      v17 = objc_opt_class();
      objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("instances"));
      v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
      instances = self->_instances;
      self->_instances = v19;

      v21 = (void *)MEMORY[0x24BDBCF20];
      v22 = objc_opt_class();
      objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("skeletons"));
      v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
      skeletons = self->_skeletons;
      self->_skeletons = v24;

      objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFA0], CFSTR("private"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (DRMemoryResource *)DRMemoryResourceCreateFromXPC();
        privatePayload = self->_privatePayload;
        self->_privatePayload = v27;
      }
      else
      {
        privatePayload = self->_privatePayload;
        self->_privatePayload = 0;
      }

      objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFA0], CFSTR("shared"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (DRMemoryResource *)DRMemoryResourceCreateFromXPC();
        sharedPayload = self->_sharedPayload;
        self->_sharedPayload = v31;
      }
      else
      {
        sharedPayload = self->_sharedPayload;
        self->_sharedPayload = 0;
      }

      self->_isLimitedRenderAsset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLimitedRenderAsset"));
      if (!self->_privatePayload && !self->_sharedPayload
        || !self->_parts
        || !self->_models
        || !self->_instances
        || !self->_skeletons
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v29);
        goto LABEL_22;
      }
      if (self->_privatePayload)
      {
        if ((DRMemoryResourceIsPrivateToProcess() & 1) == 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "failWithError:", v29);
          goto LABEL_22;
        }
        Bytes = DRMemoryResourceGetBytes();
        Length = DRMemoryResourceGetLength();
          goto LABEL_20;
      }
      else
      {
        v40 = DRMemoryResourceGetBytes();
        v41 = DRMemoryResourceGetLength();
        {
LABEL_20:
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "failWithError:", v29);
          goto LABEL_22;
        }
      }
    }
    self = self;
    v38 = self;
    goto LABEL_23;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v29);
LABEL_22:

  v38 = 0;
LABEL_23:

  return v38;
}

- (REMultiBufferMeshPayload)initWithPayload:(id)a3 privatePayload:(id)a4 parts:(id)a5 models:(id)a6 instances:(id)a7 skeletons:(id)a8 isLimitedRenderAsset:(BOOL)a9
{
  id v16;
  REMultiBufferMeshPayload *v17;
  REMultiBufferMeshPayload *v18;
  uint64_t *p_privatePayload;
  uint64_t v20;
  NSArray *parts;
  uint64_t v22;
  NSArray *models;
  uint64_t v24;
  NSArray *instances;
  uint64_t v26;
  NSArray *skeletons;
  uint64_t IsPrivateToProcess;
  NSObject *v29;
  const char *v30;
  REMultiBufferMeshPayload *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[16];
  objc_super v39;

  v34 = a3;
  v33 = a4;
  v37 = a5;
  v36 = a6;
  v16 = a7;
  v35 = a8;
  v39.receiver = self;
  v39.super_class = (Class)REMultiBufferMeshPayload;
  v17 = -[RESharedResourcePayload init](&v39, sel_init);
  v18 = v17;
  if (v17)
  {
    p_privatePayload = (uint64_t *)&v17->_privatePayload;
    objc_storeStrong((id *)&v17->_privatePayload, a4);
    objc_storeStrong((id *)&v18->_sharedPayload, a3);
    v20 = objc_msgSend(v37, "copy");
    parts = v18->_parts;
    v18->_parts = (NSArray *)v20;

    v22 = objc_msgSend(v36, "copy");
    models = v18->_models;
    v18->_models = (NSArray *)v22;

    v24 = objc_msgSend(v16, "copy");
    instances = v18->_instances;
    v18->_instances = (NSArray *)v24;

    v26 = objc_msgSend(v35, "copy");
    skeletons = v18->_skeletons;
    v18->_skeletons = (NSArray *)v26;

    v18->_isLimitedRenderAsset = a9;
    IsPrivateToProcess = *p_privatePayload;
    if (*p_privatePayload)
    {
      IsPrivateToProcess = DRMemoryResourceIsPrivateToProcess();
      if ((IsPrivateToProcess & 1) == 0)
      {
        v29 = *re::assetTypesLogObjects((re *)IsPrivateToProcess);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v30 = "Private data is expected to be private";
LABEL_16:
          _os_log_fault_impl(&dword_224FE9000, v29, OS_LOG_TYPE_FAULT, v30, buf, 2u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else if (!v18->_sharedPayload)
    {
      v29 = *re::assetTypesLogObjects(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v30 = "Expected at least one of private and shared data to be non-nil";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    if (!v18->_parts || !v18->_models || !v18->_instances || !v18->_skeletons)
    {
      v29 = *re::assetTypesLogObjects((re *)IsPrivateToProcess);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v30 = "Expected non-nil arrays for mesh parts, models, instances, and skeletons";
        goto LABEL_16;
      }
LABEL_17:
      v31 = 0;
      goto LABEL_18;
    }
  }
  v31 = v18;
LABEL_18:

  return v31;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t isKindOfClass;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    if (self->_privatePayload)
    {
      v6 = (void *)DRMemoryResourceCopyToXPC();
      objc_msgSend(v4, "encodeXPCObject:forKey:", v6, CFSTR("private"));

    }
    if (self->_sharedPayload)
    {
      v7 = (void *)DRMemoryResourceCopyToXPC();
      objc_msgSend(v4, "encodeXPCObject:forKey:", v7, CFSTR("shared"));

    }
    objc_msgSend(v4, "encodeObject:forKey:", self->_parts, CFSTR("parts"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_models, CFSTR("models"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_instances, CFSTR("instances"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_skeletons, CFSTR("skeletons"));
    objc_msgSend(v4, "encodeBool:forKey:", self->_isLimitedRenderAsset, CFSTR("isLimitedRenderAsset"));
  }
  else
  {
    v8 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_224FE9000, v8, OS_LOG_TYPE_FAULT, "REMultiBufferMeshPayload requires an NSXPCCoder", v9, 2u);
    }
  }

}

- (FixedInlineArray<NS::SharedPtr<MTL::Buffer>,)meshPayloadBuffersWithDevice:(REMultiBufferMeshPayload *)self
{
  id v6;
  DRMemoryResource *sharedPayload;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  FixedInlineArray<NS::SharedPtr<MTL::Buffer>, 8UL> *v12;
  void **v13;
  FixedInlineArray<NS::SharedPtr<MTL::Buffer>, 8UL> *result;
  id v15;
  id v16;
  id v17;

  v6 = a4;
  {
    *(_OWORD *)&retstr->var0[4].var0 = 0u;
    *(_OWORD *)&retstr->var0[6].var0 = 0u;
    *(_OWORD *)&retstr->var0[0].var0 = 0u;
    *(_OWORD *)&retstr->var0[2].var0 = 0u;
    goto LABEL_23;
  }
  v16 = 0;
  v17 = 0;
  sharedPayload = self->_sharedPayload;
  if (self->_privatePayload)
  {
    if (sharedPayload)
    {
      v8 = (void *)DRMemoryResourceCopyBuffer();
      v15 = v8;
      NS::SharedPtr<MTL::Texture>::operator=(&v17, &v15);
      if (v15)
      {

        v15 = 0;
      }

      v9 = (void *)DRMemoryResourceCopyBuffer();
      v15 = 0;
      v15 = v9;
      NS::SharedPtr<MTL::Texture>::operator=(&v16, &v15);
      if (v15)
      {

        v15 = 0;
      }

LABEL_13:
      v11 = 0;
      *(_OWORD *)&retstr->var0[4].var0 = 0u;
      *(_OWORD *)&retstr->var0[6].var0 = 0u;
      *(_OWORD *)&retstr->var0[0].var0 = 0u;
      *(_OWORD *)&retstr->var0[2].var0 = 0u;
      v12 = retstr;
      do
      {
        if ((v11 & 0xFFFFFFFC) == 4)
          v13 = &v17;
        else
          v13 = &v16;
        NS::SharedPtr<MTL::Texture>::operator=((void **)v12, v13);
        ++v11;
        v12 = (FixedInlineArray<NS::SharedPtr<MTL::Buffer>, 8UL> *)((char *)v12 + 8);
      }
      while (v11 != 8);
      if (v16)

      goto LABEL_21;
    }
LABEL_11:
    v15 = (id)DRMemoryResourceCopyBuffer();
    v10 = NS::SharedPtr<MTL::Texture>::operator=(&v16, &v15);
    NS::SharedPtr<MTL::Texture>::operator=(&v17, v10);
    if (v15)

    goto LABEL_13;
  }
  if (sharedPayload)
    goto LABEL_11;
  *(_OWORD *)&retstr->var0[4].var0 = 0u;
  *(_OWORD *)&retstr->var0[6].var0 = 0u;
  *(_OWORD *)&retstr->var0[0].var0 = 0u;
  *(_OWORD *)&retstr->var0[2].var0 = 0u;
LABEL_21:
  if (v17)

LABEL_23:
  return result;
}

- (unint64_t)estimatePayloadContainerOverheadSize
{
  objc_class *v3;
  REMultiBufferMeshPayload *v4;
  objc_class *v5;
  objc_class *v6;
  size_t v7;
  objc_class *v8;
  size_t v9;
  objc_class *v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  size_t InstanceSize;
  size_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v3);
  v4 = self;
  v5 = (objc_class *)objc_opt_class();
  v39 = class_getInstanceSize(v5);
  v6 = (objc_class *)objc_opt_class();
  v7 = class_getInstanceSize(v6);
  v8 = (objc_class *)objc_opt_class();
  v9 = class_getInstanceSize(v8);
  v10 = (objc_class *)objc_opt_class();
  v11 = class_getInstanceSize(v10);
  -[REMultiBufferMeshPayload parts](v4, "parts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  -[REMultiBufferMeshPayload models](v4, "models");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  -[REMultiBufferMeshPayload instances](v4, "instances");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  -[REMultiBufferMeshPayload skeletons](v4, "skeletons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[REMultiBufferMeshPayload parts](v4, "parts");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  v22 = v7 + v39 + v9 + v11 + 8 * (v15 + v13 + v17) + 8 * v19;
  if (v21)
  {
    v23 = *(_QWORD *)v53;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v53 != v23)
          objc_enumerationMutation(v20);
        v22 += objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v24++), "estimateContainerSize", InstanceSize);
      }
      while (v21 != v24);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    }
    while (v21);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[REMultiBufferMeshPayload models](v4, "models");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v49;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v49 != v27)
          objc_enumerationMutation(v25);
        v22 += objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v28++), "estimateContainerSize", InstanceSize);
      }
      while (v26 != v28);
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v26);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[REMultiBufferMeshPayload instances](v4, "instances");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v45;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(v29);
        v22 += objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v32++), "estimateContainerSize", InstanceSize);
      }
      while (v30 != v32);
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    }
    while (v30);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[REMultiBufferMeshPayload skeletons](v4, "skeletons");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v41;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v41 != v35)
          objc_enumerationMutation(v33);
        v22 += objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v36++), "estimateContainerSize", InstanceSize);
      }
      while (v34 != v36);
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    }
    while (v34);
  }

  return v22 + InstanceSize;
}

- (FixedInlineArray<unsigned)payloadBufferSizes
{
  FixedInlineArray<unsigned long, 8UL> *result;
  unint64_t Length;
  uint64_t v6;
  int8x16_t v7;
  int64x2_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int64x2_t v11;
  int64x2_t v12;

  *(_OWORD *)&retstr->var0[4] = 0u;
  *(_OWORD *)&retstr->var0[6] = 0u;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  if (self->_sharedPayload || (result = (FixedInlineArray<unsigned long, 8UL> *)self->_privatePayload) != 0)
  {
    Length = DRMemoryResourceGetLength();
    result = (FixedInlineArray<unsigned long, 8UL> *)DRMemoryResourceGetLength();
    v6 = 0;
    v7 = (int8x16_t)vdupq_n_s64((unint64_t)result);
    v8 = (int64x2_t)xmmword_2260E7EE0;
    v9 = (int8x16_t)vdupq_n_s64(Length);
    v10 = (int8x16_t)vdupq_n_s64(0xFFFFFFFCuLL);
    v11 = vdupq_n_s64(4uLL);
    v12 = vdupq_n_s64(2uLL);
    do
    {
      *(int8x16_t *)&retstr->var0[v6] = vbslq_s8((int8x16_t)vceqq_s64((int64x2_t)vandq_s8((int8x16_t)v8, v10), v11), v7, v9);
      v8 = vaddq_s64(v8, v12);
      v6 += 2;
    }
    while (v6 != 8);
  }
  return result;
}

- (unint64_t)totalPayloadSize
{
  uint64_t Length;
  uint64_t privatePayload;

  if (self->_sharedPayload)
    Length = DRMemoryResourceGetLength();
  else
    Length = 0;
  privatePayload = (uint64_t)self->_privatePayload;
  if (privatePayload)
    privatePayload = DRMemoryResourceGetLength();
  return privatePayload + Length;
}

- (BOOL)isShareable
{
  return 1;
}

- (NSArray)parts
{
  return self->_parts;
}

- (NSArray)models
{
  return self->_models;
}

- (NSArray)instances
{
  return self->_instances;
}

- (NSArray)skeletons
{
  return self->_skeletons;
}

- (BOOL)isLimitedRenderAsset
{
  return self->_isLimitedRenderAsset;
}

- (DRMemoryResource)privatePayload
{
  return self->_privatePayload;
}

- (DRMemoryResource)sharedPayload
{
  return self->_sharedPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeletons, 0);
  objc_storeStrong((id *)&self->_instances, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_sharedPayload, 0);
  objc_storeStrong((id *)&self->_privatePayload, 0);
}

@end
