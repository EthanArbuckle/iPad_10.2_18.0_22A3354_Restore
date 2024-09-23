@implementation REMeshSkinningModelDescriptor

- (REMeshSkinningModelDescriptor)initWithMeshSkinningData:(const void *)a3 meshParts:(Slice<re:(id)a5 :(void *)a6 MeshAssetPart>)a4 inverseBindPoseAttributes:(void *)a7 deformerBuilders:payloadBuilder:
{
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  const char *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  REMeshSkinningModelDescriptor *v29;
  uint64_t *v32;
  _anonymous_namespace_ *v33;
  const void *v35;
  uint64_t v36;
  char *v37;
  int v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v33 = (_anonymous_namespace_ *)a5;
  *((_QWORD *)a6 + 1) = 0;
  *((_QWORD *)a6 + 2) = 0;
  v37 = (char *)a6 + 24;
  v32 = (uint64_t *)a6;
  v36 = *((_QWORD *)a3 + 2);
  if (v36)
  {
    v10 = 0;
    v11 = "simplifiedAnimationSkinningInfluences";
    v35 = a3;
    do
    {
      if (*((_QWORD *)a3 + 2) <= v10)
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v44 = 0u;
        os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
LABEL_20:
        re::internal::assertLog((re::internal *)6, v9, "assertion failure: '%s' (%s:line %i) Index out of range. index = %zu, size = %zu", "index < size()", "operator[]", 251, a4.var1, a4.var1);
        _os_crash();
        __break(1u);
      }
      if (v10 == a4.var1)
        goto LABEL_20;
      v42 = *((_QWORD *)a3 + 4);
      v12 = (char *)a4.var0 + 256 * v10;
      v13 = *((_QWORD *)v12 + 2);
      if (v13)
      {
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = (uint64_t *)(*((_QWORD *)v12 + 4) + 64);
        v19 = 80 * v13;
        do
        {
          if ((*(v18 - 7) & 1) != 0)
            v20 = (const char *)*(v18 - 6);
          else
            v20 = (char *)v18 - 55;
          if (!strcmp(v20, "simplifiedAnimationInfluenceEndIndices"))
          {
            v15 = *v18;
            v14 = (unint64_t)*(v18 - 2) >> 2;
          }
          else if (!strcmp(v20, v11))
          {
            v17 = *v18;
            v16 = (unint64_t)*(v18 - 2) >> 3;
          }
          v18 += 10;
          v19 -= 80;
        }
        while (v19);
      }
      else
      {
        v17 = 0;
        v16 = 0;
        v15 = 0;
        v14 = 0;
      }
      v40 = v16;
      v39 = *(_DWORD *)(v42 + 144 * v10);
      v21 = (_QWORD *)(v42 + 144 * v10);
      v23 = v21[2];
      v22 = v21[3];
      v24 = v17;
      v25 = v11;
      v26 = v21[5];
      v27 = v21[6];
      v41 = v21[8];
      v43 = v21[9];
      v28 = re::BucketArray<re::SkinningModelBuilder::RawSkinnedMeshPartData,4ul>::addUninitialized((uint64_t)v37);
      *(_DWORD *)v28 = v39;
      *(_QWORD *)(v28 + 8) = v22;
      *(_QWORD *)(v28 + 16) = v23;
      *(_QWORD *)(v28 + 24) = v27;
      *(_QWORD *)(v28 + 32) = v26;
      v11 = v25;
      *(_QWORD *)(v28 + 40) = v24;
      *(_QWORD *)(v28 + 48) = v40;
      *(_QWORD *)(v28 + 56) = v15;
      *(_QWORD *)(v28 + 64) = v14;
      ++v10;
      *(_QWORD *)(v28 + 72) = v43;
      *(_QWORD *)(v28 + 80) = v41;
      a3 = v35;
    }
    while (v10 != v36);
  }
  *(_QWORD *)&v46 = 0;
  v44 = 0u;
  v45 = 0u;
  re::SkinningModelBuilder::buildAttributeDescriptor(v32, (uint64_t)&v44);
  v29 = -[REMeshSkinningModelDescriptor initWithSkinningAttributeDescriptor:inverseBindPoseAttributes:payloadBuilder:](self, "initWithSkinningAttributeDescriptor:inverseBindPoseAttributes:payloadBuilder:", &v44, v33, a7);
  re::FixedArray<re::SkinningModelBuilder::AttributeDescriptor::SkinnedPartAttribute>::deinit(&v45);

  return v29;
}

- (REMeshSkinningModelDescriptor)initWithSkinningData:(const void *)a3 inverseBindPoseAttributes:(id)a4 deformerBuilders:(void *)a5 payloadBuilder:(void *)a6
{
  uint64_t v9;
  int *v10;
  int *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  REMeshSkinningModelDescriptor *v18;
  _anonymous_namespace_ *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v21 = (_anonymous_namespace_ *)a4;
  *((_QWORD *)a5 + 1) = 0;
  *((_QWORD *)a5 + 2) = 0;
  v9 = *((_QWORD *)a3 + 2);
  if (v9)
  {
    v10 = (int *)*((_QWORD *)a3 + 4);
    v11 = &v10[14 * v9];
    do
    {
      v12 = *v10;
      v22 = *(_OWORD *)(v10 + 2);
      v13 = *((_QWORD *)v10 + 3);
      v14 = *((_QWORD *)v10 + 4);
      v16 = *((_QWORD *)v10 + 5);
      v15 = *((_QWORD *)v10 + 6);
      v17 = re::BucketArray<re::SkinningModelBuilder::RawSkinnedMeshPartData,4ul>::addUninitialized((uint64_t)a5 + 24);
      *(_DWORD *)v17 = v12;
      *(_OWORD *)(v17 + 8) = v22;
      *(_QWORD *)(v17 + 24) = v13;
      *(_QWORD *)(v17 + 32) = v14;
      *(_OWORD *)(v17 + 40) = 0u;
      *(_OWORD *)(v17 + 56) = 0u;
      v10 += 14;
      *(_QWORD *)(v17 + 72) = v16;
      *(_QWORD *)(v17 + 80) = v15;
    }
    while (v10 != v11);
  }
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  re::SkinningModelBuilder::buildAttributeDescriptor((uint64_t *)a5, (uint64_t)&v23);
  v18 = -[REMeshSkinningModelDescriptor initWithSkinningAttributeDescriptor:inverseBindPoseAttributes:payloadBuilder:](self, "initWithSkinningAttributeDescriptor:inverseBindPoseAttributes:payloadBuilder:", &v23, v21, a6);
  re::FixedArray<re::SkinningModelBuilder::AttributeDescriptor::SkinnedPartAttribute>::deinit(&v24);

  return v18;
}

- (REMeshSkinningModelDescriptor)initWithSkinningAttributeDescriptor:(const void *)a3 inverseBindPoseAttributes:(id)a4 payloadBuilder:(void *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  REMeshSkinningPartDescriptor *v13;
  REMeshSkinningModelDescriptor *v14;

  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = *((_QWORD *)a3 + 3);
  if (v10)
  {
    v11 = *((_QWORD *)a3 + 4);
    v12 = 56 * v10;
    do
    {
      v13 = -[REMeshSkinningPartDescriptor initWithAttributeDescriptor:payloadBuilder:]([REMeshSkinningPartDescriptor alloc], "initWithAttributeDescriptor:payloadBuilder:", v11, a5);
      objc_msgSend(v9, "addObject:", v13);

      v11 += 56;
      v12 -= 56;
    }
    while (v12);
  }
  v14 = -[REMeshSkinningModelDescriptor initWithInverseBindPoseAttributes:skinningParts:](self, "initWithInverseBindPoseAttributes:skinningParts:", v8, v9);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshSkinningModelDescriptor)initWithInverseBindPoseAttributes:(id)a3 skinningParts:(id)a4
{
  id v6;
  id v7;
  REMeshSkinningModelDescriptor *v8;
  uint64_t v9;
  NSArray *inverseBindPoseAttributes;
  uint64_t v11;
  NSArray *skinningParts;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMeshSkinningModelDescriptor;
  v8 = -[REMeshSkinningModelDescriptor init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    inverseBindPoseAttributes = v8->_inverseBindPoseAttributes;
    v8->_inverseBindPoseAttributes = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    skinningParts = v8->_skinningParts;
    v8->_skinningParts = (NSArray *)v11;

  }
  return v8;
}

- (REMeshSkinningModelDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSArray *v8;
  NSArray *inverseBindPoseAttributes;
  void *v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  NSArray *skinningParts;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("inverseBindPoseAttributes"));
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inverseBindPoseAttributes = self->_inverseBindPoseAttributes;
  self->_inverseBindPoseAttributes = v8;

  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("skinningParts"));
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  skinningParts = self->_skinningParts;
  self->_skinningParts = v13;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_inverseBindPoseAttributes, CFSTR("inverseBindPoseAttributes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_skinningParts, CFSTR("skinningParts"));

}

- (BOOL)validateWithPayloadSize:(const void *)a3 parts:(id)a4 partIndices:(id)a5 skeletonCount:(unint64_t)a6 error:(id *)a7
{
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  char v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  char v29;
  uint64_t v30;
  id v31;
  id v32;
  REMeshSkinningModelDescriptor *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v31 = a4;
  v32 = a5;
  v33 = self;
  if (-[NSArray count](self->_inverseBindPoseAttributes, "count") > a6)
  {
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = self->_inverseBindPoseAttributes;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "validateWithPayloadSize:error:", *(_QWORD *)a3, a7) & 1) == 0)
        {

          goto LABEL_14;
        }
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v13)
        continue;
      break;
    }
  }

  v16 = -[NSArray count](v33->_skinningParts, "count");
  if (v16 > objc_msgSend(v32, "count"))
  {
    goto LABEL_14;
  }
  v19 = -[NSArray count](v33->_skinningParts, "count");
  if (v19)
  {
    v20 = 0;
    v30 = v19 - 1;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v33->_skinningParts, "objectAtIndexedSubscript:", v20, v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", objc_msgSend(v22, "unsignedLongLongValue"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "simplifiedVertexPositions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "customAttributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
        v27 = objc_msgSend(v26, "count");
      else
        v27 = 0;
      v17 = objc_msgSend(v21, "validateWithPayloadSize:skeletonCount:vertexCount:simplifiedVertexCount:error:", a3, -[NSArray count](v33->_inverseBindPoseAttributes, "count"), objc_msgSend(v23, "vertexCount"), v27, a7);

      if (v30 == v20++)
        v29 = 0;
      else
        v29 = v17;
    }
    while ((v29 & 1) != 0);
  }
  else
  {
    v17 = 1;
  }
LABEL_15:

  return v17;
}

- (unint64_t)estimateContainerSize
{
  objc_class *v3;
  size_t InstanceSize;
  objc_class *v5;
  size_t v6;
  objc_class *v7;
  size_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSArray *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v3);
  if (self->_inverseBindPoseAttributes)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = class_getInstanceSize(v5);
  }
  else
  {
    v6 = 0;
  }
  if (self->_skinningParts)
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = class_getInstanceSize(v7);
  }
  else
  {
    v8 = 0;
  }
  v9 = -[NSArray count](self->_inverseBindPoseAttributes, "count");
  v10 = -[NSArray count](self->_skinningParts, "count");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = self->_inverseBindPoseAttributes;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  v13 = v6 + InstanceSize + v8 + 8 * v9 + 8 * v10;
  if (v12)
  {
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v13 += objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v15++), "estimateContainerSize");
      }
      while (v12 != v15);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v12);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_skinningParts;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v16);
        v13 += objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v19++), "estimateContainerSize", (_QWORD)v21);
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

  return v13;
}

- (NSArray)inverseBindPoseAttributes
{
  return self->_inverseBindPoseAttributes;
}

- (NSArray)skinningParts
{
  return self->_skinningParts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skinningParts, 0);
  objc_storeStrong((id *)&self->_inverseBindPoseAttributes, 0);
}

@end
