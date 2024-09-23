@implementation REMeshSkinningPartDescriptor

- (REMeshSkinningPartDescriptor)initWithAttributeDescriptor:(const void *)a3 payloadBuilder:(void *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  REMeshSkinningPartDescriptor *v11;
  unint64_t v13;
  const char *v14;

  v13 = 0xA7268F0C3B45D55ELL;
  v14 = "skinningInfluences";
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  re::StringID::destroyString((re::StringID *)&v13);
  v13 = 0xF98D22D8F2059642;
  v14 = "influenceEndIndices";
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  re::StringID::destroyString((re::StringID *)&v13);
  v13 = 0x9E5069BE2D47B84ELL;
  v14 = "simplifiedSkinningInfluences";
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  re::StringID::destroyString((re::StringID *)&v13);
  v13 = 0xE79E9E6540401152;
  v14 = "simplifiedInfluenceEndIndices";
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  re::StringID::destroyString((re::StringID *)&v13);
  v11 = -[REMeshSkinningPartDescriptor initWithSkeletonIndexAndInfluences:packedInfluence:simplifiedPackedInfluence:influencePerVertex:simplifiedInfluencePerVertex:skinningInfluences:influenceEndIndices:simplifiedSkinningInfluences:simplifiedInfluenceEndIndices:](self, "initWithSkeletonIndexAndInfluences:packedInfluence:simplifiedPackedInfluence:influencePerVertex:simplifiedInfluencePerVertex:skinningInfluences:influenceEndIndices:simplifiedSkinningInfluences:simplifiedInfluenceEndIndices:", *(unsigned int *)a3, *((unsigned __int8 *)a3 + 4), *((unsigned __int8 *)a3 + 5), *((unsigned __int8 *)a3 + 6), *((unsigned __int8 *)a3 + 7), v7, v8, v9, v10);

  return v11;
}

- (void)addToSkinningModelBuilder:(void *)a3 payloadBuffers:(const void *)a4
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  id v34;
  id v35;
  int v36;
  int v37;
  StringID v38;
  _OWORD v39[2];
  int v40;
  uint64_t v41;

  v40 = 0;
  memset(v39, 0, sizeof(v39));
  v41 = 0x7FFFFFFFLL;
  -[REMeshSkinningPartDescriptor skinningInfluences](self, "skinningInfluences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)&v38.var0 = 0xA7268F0C3B45D55ELL;
    v38.var1 = "skinningInfluences";
    v8 = (void *)*((_QWORD *)a4 + 5);
    -[REMeshSkinningPartDescriptor skinningInfluences](self, "skinningInfluences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "payloadOffset");
    -[REMeshSkinningPartDescriptor skinningInfluences](self, "skinningInfluences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "bufferSize");
    v13 = v8;
    v35 = v13;
    v36 = v10;
    v37 = v12;
    re::HashTable<re::StringID,re::BufferSlice,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::addNew((uint64_t)v39, &v38, (uint64_t)&v35);
    if (v13)

    re::StringID::destroyString((re::StringID *)&v38);
  }
  -[REMeshSkinningPartDescriptor influenceEndIndices](self, "influenceEndIndices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    *(_QWORD *)&v38.var0 = 0xF98D22D8F2059642;
    v38.var1 = "influenceEndIndices";
    v15 = (void *)*((_QWORD *)a4 + 5);
    -[REMeshSkinningPartDescriptor influenceEndIndices](self, "influenceEndIndices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "payloadOffset");
    -[REMeshSkinningPartDescriptor influenceEndIndices](self, "influenceEndIndices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "bufferSize");
    v20 = v15;
    v35 = v20;
    v36 = v17;
    v37 = v19;
    re::HashTable<re::StringID,re::BufferSlice,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::addNew((uint64_t)v39, &v38, (uint64_t)&v35);
    if (v20)

    re::StringID::destroyString((re::StringID *)&v38);
  }
  -[REMeshSkinningPartDescriptor simplifiedSkinningInfluences](self, "simplifiedSkinningInfluences");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    *(_QWORD *)&v38.var0 = 0x9E5069BE2D47B84ELL;
    v38.var1 = "simplifiedSkinningInfluences";
    v22 = (void *)*((_QWORD *)a4 + 5);
    -[REMeshSkinningPartDescriptor simplifiedSkinningInfluences](self, "simplifiedSkinningInfluences");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "payloadOffset");
    -[REMeshSkinningPartDescriptor simplifiedSkinningInfluences](self, "simplifiedSkinningInfluences");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "bufferSize");
    v27 = v22;
    v35 = v27;
    v36 = v24;
    v37 = v26;
    re::HashTable<re::StringID,re::BufferSlice,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::addNew((uint64_t)v39, &v38, (uint64_t)&v35);
    if (v27)

    re::StringID::destroyString((re::StringID *)&v38);
  }
  -[REMeshSkinningPartDescriptor simplifiedInfluenceEndIndices](self, "simplifiedInfluenceEndIndices");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    *(_QWORD *)&v38.var0 = 0xE79E9E6540401152;
    v38.var1 = "simplifiedInfluenceEndIndices";
    v29 = (void *)*((_QWORD *)a4 + 5);
    -[REMeshSkinningPartDescriptor simplifiedInfluenceEndIndices](self, "simplifiedInfluenceEndIndices");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "payloadOffset");
    -[REMeshSkinningPartDescriptor simplifiedInfluenceEndIndices](self, "simplifiedInfluenceEndIndices");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "bufferSize");
    v34 = v29;
    v35 = v34;
    v36 = v31;
    v37 = v33;
    re::HashTable<re::StringID,re::BufferSlice,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::addNew((uint64_t)v39, &v38, (uint64_t)&v35);
    if (v34)

    re::StringID::destroyString((re::StringID *)&v38);
  }
  re::SkinningModelBuilder::addSkinnedMeshPartData((uint64_t)a3, -[REMeshSkinningPartDescriptor skeletonIndex](self, "skeletonIndex"), -[REMeshSkinningPartDescriptor packedInfluence](self, "packedInfluence"), -[REMeshSkinningPartDescriptor influencePerVertex](self, "influencePerVertex"), -[REMeshSkinningPartDescriptor simplifiedPackedInfluence](self, "simplifiedPackedInfluence"), -[REMeshSkinningPartDescriptor simplifiedInfluencePerVertex](self, "simplifiedInfluencePerVertex"), (uint64_t)v39);
  re::HashTable<re::StringID,re::BufferSlice,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::deinit((uint64_t *)v39);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshSkinningPartDescriptor)initWithSkeletonIndexAndInfluences:(unsigned int)a3 packedInfluence:(BOOL)a4 simplifiedPackedInfluence:(BOOL)a5 influencePerVertex:(unsigned __int8)a6 simplifiedInfluencePerVertex:(unsigned __int8)a7 skinningInfluences:(id)a8 influenceEndIndices:(id)a9 simplifiedSkinningInfluences:(id)a10 simplifiedInfluenceEndIndices:(id)a11
{
  id v16;
  id v17;
  REMeshSkinningPartDescriptor *v18;
  REMeshSkinningPartDescriptor *v19;
  id v23;
  id v24;
  objc_super v25;

  v24 = a8;
  v23 = a9;
  v16 = a10;
  v17 = a11;
  v25.receiver = self;
  v25.super_class = (Class)REMeshSkinningPartDescriptor;
  v18 = -[REMeshSkinningPartDescriptor init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_skeletonIndex = a3;
    v18->_packedInfluence = a4;
    v18->_influencePerVertex = a6;
    objc_storeStrong((id *)&v18->_skinningInfluences, a8);
    objc_storeStrong((id *)&v19->_influenceEndIndices, a9);
    v19->_simplifiedPackedInfluence = a5;
    v19->_simplifiedInfluencePerVertex = a7;
    objc_storeStrong((id *)&v19->_simplifiedSkinningInfluences, a10);
    objc_storeStrong((id *)&v19->_simplifiedInfluenceEndIndices, a11);
  }

  return v19;
}

- (REMeshSkinningPartDescriptor)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  REAttributeDescriptor *v7;
  REAttributeDescriptor *skinningInfluences;
  REAttributeDescriptor *v9;
  REAttributeDescriptor *influenceEndIndices;
  uint64_t v11;
  BOOL v12;
  int v13;
  REAttributeDescriptor *v14;
  REAttributeDescriptor *simplifiedSkinningInfluences;
  REAttributeDescriptor *v16;
  REAttributeDescriptor *simplifiedInfluenceEndIndices;
  NSString *v18;
  void *v19;
  REMeshSkinningPartDescriptor *v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("skeletonIndex"));
  self->_skeletonIndex = v5;
  self->_packedInfluence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("packedInfluence"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("influencePerVertex"));
  self->_influencePerVertex = v6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skinningInfluences"));
  v7 = (REAttributeDescriptor *)objc_claimAutoreleasedReturnValue();
  skinningInfluences = self->_skinningInfluences;
  self->_skinningInfluences = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("influenceEndIndices"));
  v9 = (REAttributeDescriptor *)objc_claimAutoreleasedReturnValue();
  influenceEndIndices = self->_influenceEndIndices;
  self->_influenceEndIndices = v9;

  self->_simplifiedPackedInfluence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("simplifiedPackedInfluence"));
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("simplifiedInfluencePerVertex"));
  self->_simplifiedInfluencePerVertex = v11;
  if (HIDWORD(v5))
    v12 = 1;
  else
    v12 = (v11 | (unint64_t)v6) > 0xFF;
  v13 = v12;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("simplifiedSkinningInfluences"));
  v14 = (REAttributeDescriptor *)objc_claimAutoreleasedReturnValue();
  simplifiedSkinningInfluences = self->_simplifiedSkinningInfluences;
  self->_simplifiedSkinningInfluences = v14;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("simplifiedInfluenceEndIndices"));
  v16 = (REAttributeDescriptor *)objc_claimAutoreleasedReturnValue();
  simplifiedInfluenceEndIndices = self->_simplifiedInfluenceEndIndices;
  self->_simplifiedInfluenceEndIndices = v16;

  if (v13)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v19);

    v20 = 0;
  }
  else
  {
    v20 = self;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->_skeletonIndex, CFSTR("skeletonIndex"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_packedInfluence, CFSTR("packedInfluence"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_influencePerVertex, CFSTR("influencePerVertex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_skinningInfluences, CFSTR("skinningInfluences"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_influenceEndIndices, CFSTR("influenceEndIndices"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_simplifiedPackedInfluence, CFSTR("simplifiedPackedInfluence"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_simplifiedInfluencePerVertex, CFSTR("simplifiedInfluencePerVertex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_simplifiedSkinningInfluences, CFSTR("simplifiedSkinningInfluences"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_simplifiedInfluenceEndIndices, CFSTR("simplifiedInfluenceEndIndices"));

}

- (BOOL)validateWithPayloadSize:(const void *)a3 skeletonCount:(unint64_t)a4 vertexCount:(unint64_t)a5 simplifiedVertexCount:(unint64_t)a6 error:(id *)a7
{
  REAttributeDescriptor *skinningInfluences;
  _BOOL4 v13;
  REAttributeDescriptor *influenceEndIndices;
  _BOOL4 packedInfluence;
  void *v16;
  unint64_t v17;
  char v18;
  __CFString *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  REAttributeDescriptor *simplifiedSkinningInfluences;
  REAttributeDescriptor *simplifiedInfluenceEndIndices;
  _BOOL4 simplifiedPackedInfluence;
  void *v26;
  unint64_t v27;
  char v28;
  void *v29;
  void *v30;
  unint64_t v31;

  if (self->_skeletonIndex >= a4)
    goto LABEL_28;
  skinningInfluences = self->_skinningInfluences;
  if (!skinningInfluences)
  {
    v19 = CFSTR("REMeshSkinningPartDescriptor: is missing skinningInfuences");
    goto LABEL_12;
  }
  v13 = -[REAttributeDescriptor validateWithPayloadSize:error:](skinningInfluences, "validateWithPayloadSize:error:", *((_QWORD *)a3 + 5), a7);
  if (v13)
  {
    influenceEndIndices = self->_influenceEndIndices;
    if (!influenceEndIndices
      || (v13 = -[REAttributeDescriptor validateWithPayloadSize:error:](influenceEndIndices, "validateWithPayloadSize:error:", *((_QWORD *)a3 + 5), a7)))
    {
      packedInfluence = self->_packedInfluence;
      -[REMeshSkinningPartDescriptor skinningInfluences](self, "skinningInfluences");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "bufferSize");

      if (self->_influencePerVertex)
      {
        v18 = 2;
        if (!packedInfluence)
          v18 = 3;
        if (v17 >> v18 != self->_influencePerVertex * a5)
        {
          v19 = CFSTR("REMeshSkinningPartDescriptor: incorrect influence count");
LABEL_12:
          LOBYTE(v13) = 0;
          return v13;
        }
      }
      else
      {
        -[REMeshSkinningPartDescriptor influenceEndIndices](self, "influenceEndIndices");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          v19 = CFSTR("REMeshSkinningPartDescriptor: is missing influenceEndIndices");
          goto LABEL_12;
        }
        -[REMeshSkinningPartDescriptor influenceEndIndices](self, "influenceEndIndices");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "bufferSize");

        if (a5 != v22 >> 2)
        {
          v19 = CFSTR("REMeshSkinningPartDescriptor: incorrect number of influenceEndIndices");
          goto LABEL_12;
        }
      }
      simplifiedSkinningInfluences = self->_simplifiedSkinningInfluences;
      if (!simplifiedSkinningInfluences)
      {
LABEL_28:
        LOBYTE(v13) = 1;
        return v13;
      }
      v13 = -[REAttributeDescriptor validateWithPayloadSize:error:](simplifiedSkinningInfluences, "validateWithPayloadSize:error:", *((_QWORD *)a3 + 5), a7);
      if (v13)
      {
        simplifiedInfluenceEndIndices = self->_simplifiedInfluenceEndIndices;
        if (!simplifiedInfluenceEndIndices
          || (v13 = -[REAttributeDescriptor validateWithPayloadSize:error:](simplifiedInfluenceEndIndices, "validateWithPayloadSize:error:", *(_QWORD *)re::FixedInlineArray<unsigned long,8ul>::operator[]((uint64_t)a3, 5uLL), a7)))
        {
          simplifiedPackedInfluence = self->_simplifiedPackedInfluence;
          -[REMeshSkinningPartDescriptor simplifiedSkinningInfluences](self, "simplifiedSkinningInfluences");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "bufferSize");

          if (self->_simplifiedInfluencePerVertex)
          {
            v28 = 2;
            if (!simplifiedPackedInfluence)
              v28 = 3;
            if (v27 >> v28 != self->_simplifiedInfluencePerVertex * a6)
            {
              v19 = CFSTR("REMeshSkinningPartDescriptor: incorrect simplified influence count");
              goto LABEL_12;
            }
          }
          else
          {
            -[REMeshSkinningPartDescriptor simplifiedInfluenceEndIndices](self, "simplifiedInfluenceEndIndices");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v29)
            {
              v19 = CFSTR("REMeshSkinningPartDescriptor: is missing simplifiedInfluenceEndIndices");
              goto LABEL_12;
            }
            -[REMeshSkinningPartDescriptor simplifiedInfluenceEndIndices](self, "simplifiedInfluenceEndIndices");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "bufferSize");

            if (a6 != v31 >> 2)
            {
              v19 = CFSTR("REMeshSkinningPartDescriptor: incorrect number of simplifiedInfluenceEndIndices");
              goto LABEL_12;
            }
          }
          goto LABEL_28;
        }
      }
    }
  }
  return v13;
}

- (unint64_t)estimateContainerSize
{
  objc_class *v3;
  unint64_t v4;
  REAttributeDescriptor *skinningInfluences;
  REAttributeDescriptor *influenceEndIndices;
  REAttributeDescriptor *simplifiedSkinningInfluences;
  REAttributeDescriptor *simplifiedInfluenceEndIndices;

  v3 = (objc_class *)objc_opt_class();
  v4 = class_getInstanceSize(v3) + 16;
  skinningInfluences = self->_skinningInfluences;
  if (skinningInfluences)
    v4 += -[REAttributeDescriptor estimateContainerSize](skinningInfluences, "estimateContainerSize");
  influenceEndIndices = self->_influenceEndIndices;
  if (influenceEndIndices)
    v4 += -[REAttributeDescriptor estimateContainerSize](influenceEndIndices, "estimateContainerSize");
  simplifiedSkinningInfluences = self->_simplifiedSkinningInfluences;
  if (simplifiedSkinningInfluences)
    v4 += -[REAttributeDescriptor estimateContainerSize](simplifiedSkinningInfluences, "estimateContainerSize");
  simplifiedInfluenceEndIndices = self->_simplifiedInfluenceEndIndices;
  if (simplifiedInfluenceEndIndices)
    v4 += -[REAttributeDescriptor estimateContainerSize](simplifiedInfluenceEndIndices, "estimateContainerSize");
  return v4;
}

- (BOOL)packedInfluence
{
  return self->_packedInfluence;
}

- (BOOL)simplifiedPackedInfluence
{
  return self->_simplifiedPackedInfluence;
}

- (unsigned)influencePerVertex
{
  return self->_influencePerVertex;
}

- (unsigned)simplifiedInfluencePerVertex
{
  return self->_simplifiedInfluencePerVertex;
}

- (unsigned)skeletonIndex
{
  return self->_skeletonIndex;
}

- (REAttributeDescriptor)skinningInfluences
{
  return self->_skinningInfluences;
}

- (REAttributeDescriptor)influenceEndIndices
{
  return self->_influenceEndIndices;
}

- (REAttributeDescriptor)simplifiedSkinningInfluences
{
  return self->_simplifiedSkinningInfluences;
}

- (REAttributeDescriptor)simplifiedInfluenceEndIndices
{
  return self->_simplifiedInfluenceEndIndices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simplifiedInfluenceEndIndices, 0);
  objc_storeStrong((id *)&self->_simplifiedSkinningInfluences, 0);
  objc_storeStrong((id *)&self->_influenceEndIndices, 0);
  objc_storeStrong((id *)&self->_skinningInfluences, 0);
}

@end
