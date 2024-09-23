@implementation REMeshBlendShapeBufferDescriptor

- (REMeshBlendShapeBufferDescriptor)initWithBlendShapeBufferPayload:(void *)a3 indexType:(unint64_t)a4 payloadBuilder:(void *)a5
{
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  REMeshBlendShapeBufferDescriptor *v17;
  uint64_t v19;
  void *v20;
  void *v21;

  if (a4)
    v7 = 4;
  else
    v7 = 2;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v13 = *((_QWORD *)a3 + 3);
  if (v13)
  {
    v14 = (_QWORD *)(*((_QWORD *)a3 + 4) + 8);
    v15 = 16 * v13;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v16);

      v14 += 2;
      v15 -= 16;
    }
    while (v15);
  }
  *(_WORD *)((char *)&v19 + 1) = *(_WORD *)((char *)a3 + 13);
  LOBYTE(v19) = *((_BYTE *)a3 + 12);
  v17 = -[REMeshBlendShapeBufferDescriptor initWithBlendShapeNames:floatDeltaBuffer:blendShapeConstantsBuffer:indexBuffer:floatSliceBuffer:coefficientIndexBuffer:renormalizationBuffer:hasNormals:hasTangents:hasBitangents:](self, "initWithBlendShapeNames:floatDeltaBuffer:blendShapeConstantsBuffer:indexBuffer:floatSliceBuffer:coefficientIndexBuffer:renormalizationBuffer:hasNormals:hasTangents:hasBitangents:", v12, v20, v21, v8, v9, v10, v11, v19);

  return v17;
}

- (void)addToBlendShapeModelBuilder:(BlendShapeModelBuilder *)a3 blendShapeIndex:(unint64_t)a4 blendShapeGroupName:(const StringID *)a5 payloadBuffers:(const void *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _anonymous_namespace_ *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t i;
  void *v22;
  id v23;
  _anonymous_namespace_ *v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  char *v29;
  unint64_t v30;
  uint64_t j;
  void *v32;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _OWORD v40[6];
  uint64_t v41;
  int v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  unint64_t v49;
  StringID v50[5];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  memset(v40, 0, sizeof(v40));
  -[REMeshBlendShapeBufferDescriptor floatDeltaBuffer](self, "floatDeltaBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMeshBlendShapeBufferDescriptor blendShapeConstantsBuffer](self, "blendShapeConstantsBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMeshBlendShapeBufferDescriptor indexBuffer](self, "indexBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMeshBlendShapeBufferDescriptor floatSliceBuffer](self, "floatSliceBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMeshBlendShapeBufferDescriptor coefficientIndexBuffer](self, "coefficientIndexBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMeshBlendShapeBufferDescriptor renormalizationBuffer](self, "renormalizationBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMeshBlendShapeBufferDescriptor blendShapeNames](self, "blendShapeNames");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  re::StringID::invalid((re::StringID *)v50);
  v37 = 0;
  v38 = 0;
  v39 = 0;
  re::StringID::destroyString((re::StringID *)v50);

  -[REMeshBlendShapeBufferDescriptor blendShapeNames](self, "blendShapeNames");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v20 = 0;
    for (i = 0; i != v19; ++i)
    {
      -[REMeshBlendShapeBufferDescriptor blendShapeNames](self, "blendShapeNames");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", i);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = (_anonymous_namespace_ *)objc_msgSend(v23, "UTF8String");
      v35 = 0;
      v36 = &str_110;
      v25 = v38;
      if (v38 <= i)
      {
        v41 = 0;
        memset(v50, 0, sizeof(v50));
        os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        v42 = 136315906;
        v43 = "operator[]";
        v44 = 1024;
        v45 = 468;
        v46 = 2048;
        v47 = i;
        v48 = 2048;
        v49 = v25;
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
      }
      v26 = (_QWORD *)(v39 + v20);
      v27 = v35;
      v28 = v36;
      v35 = 0;
      v36 = &str_110;
      v29 = *(char **)(v39 + v20 + 8);
      v30 = v27 & 0xFFFFFFFFFFFFFFFELL | *(_QWORD *)(v39 + v20) & 1;
      v26[1] = v28;
      *(_QWORD *)&v50[0].var0 = v30;
      v50[0].var1 = v29;
      *v26 = v27;
      re::StringID::destroyString((re::StringID *)v50);
      re::StringID::destroyString((re::StringID *)&v35);

      v20 += 16;
    }
  }
  re::BlendShapeModelBuilder::addBlendShapeGroup((uint64_t)a3, a4, (uint64_t)v40, (uint64_t *)a5, (uint64_t)&v37, -[REMeshBlendShapeBufferDescriptor hasNormals](self, "hasNormals"), -[REMeshBlendShapeBufferDescriptor hasTangents](self, "hasTangents"), -[REMeshBlendShapeBufferDescriptor hasBitangents](self, "hasBitangents"));
  re::FixedArray<re::StringID>::deinit(&v37);
  for (j = 5; j != -1; --j)
  {
    v32 = *(void **)&v40[j];
    if (v32)
    {

      *(_QWORD *)&v40[j] = 0;
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshBlendShapeBufferDescriptor)initWithBlendShapeNames:(id)a3 floatDeltaBuffer:(id)a4 blendShapeConstantsBuffer:(id)a5 indexBuffer:(id)a6 floatSliceBuffer:(id)a7 coefficientIndexBuffer:(id)a8 renormalizationBuffer:(id)a9 hasNormals:(BOOL)a10 hasTangents:(BOOL)a11 hasBitangents:(BOOL)a12
{
  id v18;
  id v19;
  REMeshBlendShapeBufferDescriptor *v20;
  REMeshBlendShapeBufferDescriptor *v21;
  uint64_t v22;
  NSArray *blendShapeNames;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v18 = a8;
  v19 = a9;
  v30.receiver = self;
  v30.super_class = (Class)REMeshBlendShapeBufferDescriptor;
  v20 = -[REMeshBlendShapeBufferDescriptor init](&v30, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_floatDeltaBuffer, a4);
    objc_storeStrong((id *)&v21->_blendShapeConstantsBuffer, a5);
    objc_storeStrong((id *)&v21->_indexBuffer, a6);
    objc_storeStrong((id *)&v21->_floatSliceBuffer, a7);
    objc_storeStrong((id *)&v21->_coefficientIndexBuffer, a8);
    objc_storeStrong((id *)&v21->_renormalizationBuffer, a9);
    v22 = objc_msgSend(v29, "copy");
    blendShapeNames = v21->_blendShapeNames;
    v21->_blendShapeNames = (NSArray *)v22;

    v21->_hasNormals = a10;
    v21->_hasTangents = a11;
    v21->_hasBitangents = a12;
  }

  return v21;
}

- (REMeshBlendShapeBufferDescriptor)initWithCoder:(id)a3
{
  id v4;
  REAttributeDescriptor *v5;
  REAttributeDescriptor *floatDeltaBuffer;
  REAttributeDescriptor *v7;
  REAttributeDescriptor *blendShapeConstantsBuffer;
  REAttributeDescriptor *v9;
  REAttributeDescriptor *indexBuffer;
  REAttributeDescriptor *v11;
  REAttributeDescriptor *floatSliceBuffer;
  REAttributeDescriptor *v13;
  REAttributeDescriptor *coefficientIndexBuffer;
  REAttributeDescriptor *v15;
  REAttributeDescriptor *renormalizationBuffer;
  void *v17;
  uint64_t v18;
  void *v19;
  NSArray *v20;
  NSArray *blendShapeNames;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("floatDeltaBuffer"));
  v5 = (REAttributeDescriptor *)objc_claimAutoreleasedReturnValue();
  floatDeltaBuffer = self->_floatDeltaBuffer;
  self->_floatDeltaBuffer = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blendShapeConstantsBuffer"));
  v7 = (REAttributeDescriptor *)objc_claimAutoreleasedReturnValue();
  blendShapeConstantsBuffer = self->_blendShapeConstantsBuffer;
  self->_blendShapeConstantsBuffer = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("indexBuffer"));
  v9 = (REAttributeDescriptor *)objc_claimAutoreleasedReturnValue();
  indexBuffer = self->_indexBuffer;
  self->_indexBuffer = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("floatSliceBuffer"));
  v11 = (REAttributeDescriptor *)objc_claimAutoreleasedReturnValue();
  floatSliceBuffer = self->_floatSliceBuffer;
  self->_floatSliceBuffer = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coefficientIndexBuffer"));
  v13 = (REAttributeDescriptor *)objc_claimAutoreleasedReturnValue();
  coefficientIndexBuffer = self->_coefficientIndexBuffer;
  self->_coefficientIndexBuffer = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("renormalizationBuffer"));
  v15 = (REAttributeDescriptor *)objc_claimAutoreleasedReturnValue();
  renormalizationBuffer = self->_renormalizationBuffer;
  self->_renormalizationBuffer = v15;

  v17 = (void *)MEMORY[0x24BDBCF20];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("blendShapeNames"));
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  blendShapeNames = self->_blendShapeNames;
  self->_blendShapeNames = v20;

  self->_hasNormals = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasNormals"));
  self->_hasTangents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasTangents"));
  self->_hasBitangents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasBitangents"));

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasNormals, CFSTR("hasNormals"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasTangents, CFSTR("hasTangents"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasBitangents, CFSTR("hasBitangents"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_floatDeltaBuffer, CFSTR("floatDeltaBuffer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_blendShapeConstantsBuffer, CFSTR("blendShapeConstantsBuffer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_indexBuffer, CFSTR("indexBuffer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_floatSliceBuffer, CFSTR("floatSliceBuffer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_coefficientIndexBuffer, CFSTR("coefficientIndexBuffer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_renormalizationBuffer, CFSTR("renormalizationBuffer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_blendShapeNames, CFSTR("blendShapeNames"));

}

- (BOOL)validateWithPayloadSize:(const void *)a3 error:(id *)a4
{
  REAttributeDescriptor *floatDeltaBuffer;

  floatDeltaBuffer = self->_floatDeltaBuffer;
  if (floatDeltaBuffer)
  {
    {
    }
  }
  else
  {
  }
  return 0;
}

- (unint64_t)estimateContainerSize
{
  objc_class *v3;
  size_t InstanceSize;
  REAttributeDescriptor *floatDeltaBuffer;
  REAttributeDescriptor *blendShapeConstantsBuffer;
  uint64_t v7;
  REAttributeDescriptor *indexBuffer;
  uint64_t v9;
  REAttributeDescriptor *floatSliceBuffer;
  uint64_t v11;
  REAttributeDescriptor *coefficientIndexBuffer;
  uint64_t v13;
  REAttributeDescriptor *renormalizationBuffer;
  uint64_t v15;
  objc_class *v16;
  size_t v17;
  NSArray *blendShapeNames;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  objc_class *v26;
  uint64_t v27;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v3);
  floatDeltaBuffer = self->_floatDeltaBuffer;
  if (floatDeltaBuffer)
    v29 = -[REAttributeDescriptor estimateContainerSize](floatDeltaBuffer, "estimateContainerSize");
  else
    v29 = 0;
  blendShapeConstantsBuffer = self->_blendShapeConstantsBuffer;
  if (blendShapeConstantsBuffer)
    v7 = -[REAttributeDescriptor estimateContainerSize](blendShapeConstantsBuffer, "estimateContainerSize");
  else
    v7 = 0;
  indexBuffer = self->_indexBuffer;
  if (indexBuffer)
    v9 = -[REAttributeDescriptor estimateContainerSize](indexBuffer, "estimateContainerSize");
  else
    v9 = 0;
  floatSliceBuffer = self->_floatSliceBuffer;
  if (floatSliceBuffer)
    v11 = -[REAttributeDescriptor estimateContainerSize](floatSliceBuffer, "estimateContainerSize");
  else
    v11 = 0;
  coefficientIndexBuffer = self->_coefficientIndexBuffer;
  if (coefficientIndexBuffer)
    v13 = -[REAttributeDescriptor estimateContainerSize](coefficientIndexBuffer, "estimateContainerSize");
  else
    v13 = 0;
  renormalizationBuffer = self->_renormalizationBuffer;
  if (renormalizationBuffer)
    v15 = -[REAttributeDescriptor estimateContainerSize](renormalizationBuffer, "estimateContainerSize");
  else
    v15 = 0;
  if (self->_blendShapeNames)
  {
    v16 = (objc_class *)objc_opt_class();
    v17 = class_getInstanceSize(v16);
    blendShapeNames = self->_blendShapeNames;
  }
  else
  {
    blendShapeNames = 0;
    v17 = 0;
  }
  v19 = -[NSArray count](blendShapeNames, "count");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = self->_blendShapeNames;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v22 = InstanceSize + 48 + v29 + v7 + v9 + v11 + v13 + v15 + v17 + 8 * v19;
  if (v21)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v24);
        if (v25)
        {
          v26 = (objc_class *)objc_opt_class();
          v22 += class_getInstanceSize(v26);
          v27 = objc_msgSend(v25, "lengthOfBytesUsingEncoding:", 4) + 1;
        }
        else
        {
          v27 = 0;
        }
        v22 += v27;
        ++v24;
      }
      while (v21 != v24);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v21);
  }

  return v22;
}

- (REAttributeDescriptor)floatDeltaBuffer
{
  return self->_floatDeltaBuffer;
}

- (REAttributeDescriptor)blendShapeConstantsBuffer
{
  return self->_blendShapeConstantsBuffer;
}

- (REAttributeDescriptor)indexBuffer
{
  return self->_indexBuffer;
}

- (REAttributeDescriptor)floatSliceBuffer
{
  return self->_floatSliceBuffer;
}

- (REAttributeDescriptor)coefficientIndexBuffer
{
  return self->_coefficientIndexBuffer;
}

- (REAttributeDescriptor)renormalizationBuffer
{
  return self->_renormalizationBuffer;
}

- (NSArray)blendShapeNames
{
  return self->_blendShapeNames;
}

- (BOOL)hasNormals
{
  return self->_hasNormals;
}

- (BOOL)hasTangents
{
  return self->_hasTangents;
}

- (BOOL)hasBitangents
{
  return self->_hasBitangents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendShapeNames, 0);
  objc_storeStrong((id *)&self->_renormalizationBuffer, 0);
  objc_storeStrong((id *)&self->_coefficientIndexBuffer, 0);
  objc_storeStrong((id *)&self->_floatSliceBuffer, 0);
  objc_storeStrong((id *)&self->_indexBuffer, 0);
  objc_storeStrong((id *)&self->_blendShapeConstantsBuffer, 0);
  objc_storeStrong((id *)&self->_floatDeltaBuffer, 0);
}

@end
