@implementation REDirectMeshPayload

- (AABB)aabb
{
  __int128 v4;
  void *v5;
  uint64_t PartCount;
  uint64_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  AABB *result;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;

  *(_QWORD *)&v4 = 0x7F0000007FLL;
  *((_QWORD *)&v4 + 1) = 0x7F0000007FLL;
  *(int32x4_t *)&retstr->var0.var0.var0.var0 = vdupq_n_s32(0x7F800000u);
  *(_OWORD *)&retstr->var1.var0.var1[1] = v4;
  -[REDirectMeshPayload directMesh](self, "directMesh");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    PartCount = DRMeshGetPartCount();
    v17.i32[2] = 0;
    v17.i64[0] = 0;
    v16.i32[2] = 0;
    v16.i64[0] = 0;
    if (PartCount)
    {
      v7 = 0;
      v8.i64[0] = 0x7F0000007FLL;
      v8.i64[1] = 0x7F0000007FLL;
      v14 = v8;
      v15 = (float32x4_t)vdupq_n_s32(0x7F800000u);
      do
      {
        if (DRMeshGetPartAt())
        {
          v10 = v16;
          v9 = v17;
          v12 = v14;
          v11 = v15;
          v11.i32[3] = 0;
          v9.i32[3] = 0;
          v12.i32[3] = 0;
          v10.i32[3] = 0;
          v14 = vmaxnmq_f32(v12, v10);
          v15 = vminnmq_f32(v11, v9);
          *(float32x4_t *)&retstr->var0.var0.var0.var0 = v15;
          *(float32x4_t *)&retstr->var1.var0.var1[1] = v14;
        }
        ++v7;
      }
      while (PartCount != v7);
    }
  }

  return result;
}

- (MeshCollection)makeMeshCollection:(SEL)a3
{
  void *v5;
  unint64_t PartCount;
  id v7;
  void *v8;
  _anonymous_namespace_ *VertexAttributeCount;
  uint64_t IndexType;
  char v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  _anonymous_namespace_ *VertexLayout;
  void *v18;
  const char *v19;
  void **v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  int v29;
  int v30;
  uint64_t v31;
  id v32;
  int v33;
  _anonymous_namespace_ *v34;
  size_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  id *v41;
  AABB *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  MeshCollection *result;
  MeshCollection *v49;
  int32x4_t v50;
  _anonymous_namespace_ *v51;
  uint64_t v53[2];
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  unint64_t v61;
  int v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  id v67[2];
  int32x4_t v68;
  id v69[2];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  _QWORD v86[3];
  __int128 v87;
  _QWORD v88[4];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  int32x4_t v93;
  __int128 v94;
  uint64_t v95;
  char v96;
  __int16 v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD v101[4];
  char v102;
  uint64_t v103;
  _BYTE __str[12];
  __int16 v105;
  int v106;
  __int16 v107;
  unint64_t v108;
  __int16 v109;
  uint64_t v110;
  _BYTE v111[38];
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  -[REDirectMeshPayload directMesh](self, "directMesh");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (_anonymous_namespace_ *)DRMeshCopyDescriptor();
  v64 = 0uLL;
  v65 = 0;
  PartCount = DRMeshGetPartCount();
  v7 = v5;
  v8 = (void *)DRMeshCopyDescriptor();
  v63 = 0;
  v60[1] = 0;
  v61 = 0;
  v60[0] = 0;
  v62 = 0;
  VertexAttributeCount = (_anonymous_namespace_ *)DRMeshDescriptorGetVertexAttributeCount();
  if (VertexAttributeCount != (_anonymous_namespace_ *)-1)
    VertexAttributeCount = (_anonymous_namespace_ *)re::DynamicArray<re::NamedVertexBuffer>::setCapacity(v60, (unint64_t)VertexAttributeCount + 1);
  IndexType = DRMeshDescriptorGetIndexType();
  if (IndexType == 1)
    v11 = 36;
  else
    v11 = 0;
  if (!IndexType)
    v11 = 49;
  LOBYTE(v69[0]) = v11;
  BYTE1(v69[0]) = 1;
  v12 = (void *)*((_QWORD *)a4 + 4);
  v69[1] = 0;
  v69[1] = v12;
  *(_QWORD *)&v70 = 0;
  DWORD2(v70) = 0;
  v13 = DRMeshDescriptorGetIndexType();
  v14 = 4 * (v13 == 1);
  if (!v13)
    v14 = 2;
  HIDWORD(v70) = v14;
  re::DynamicArray<re::NamedVertexBuffer>::add((_anonymous_namespace_ *)v60, (uint64_t)v67);
  if (v69[1])
  {

    v69[1] = 0;
  }
  v49 = retstr;
  if (v67[0] && ((uint64_t)v67[1] & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)v67[0] + 40))();
  v15 = DRMeshDescriptorGetVertexAttributeCount();
  if (v15)
  {
    for (i = 0; i != v15; ++i)
    {
      LODWORD(v59) = 0;
      *(_QWORD *)&v112 = 0;
      *(_QWORD *)__str = 0;
      *(_QWORD *)v111 = 0;
      *(_QWORD *)&v55 = 0;
      *(_QWORD *)&v54 = 0;
      v66 = 0;
      if (DRMeshDescriptorGetVertexAttributeFormat())
      {
        VertexLayout = (_anonymous_namespace_ *)DRMeshDescriptorGetVertexLayout();
        if ((_DWORD)VertexLayout)
        {
          v18 = (void *)*((_QWORD *)a4 + v55);
          v19 = (const char *)*((_QWORD *)*(&off_24ED3B5C0 + (int)v59) + 1);
          LOBYTE(v69[0]) = v112;
          BYTE1(v69[0]) = 1;
          v69[1] = 0;
          v69[1] = v18;
          *(_QWORD *)&v70 = v54;
          *((_QWORD *)&v70 + 1) = __PAIR64__(v66, *(unsigned int *)v111);
          re::DynamicArray<re::NamedVertexBuffer>::add((_anonymous_namespace_ *)v60, (uint64_t)v67);
          if (v69[1])
          {

            v69[1] = 0;
          }
          if (v67[0] && ((uint64_t)v67[1] & 1) != 0)
            (*(void (**)(void))(*(_QWORD *)v67[0] + 40))();
        }
      }
    }
  }

  if (v61)
  {
    v20 = (void **)(v63 + 40);
    v21 = v61 << 6;
    while (1)
    {
      v22 = ((unint64_t)*(v20 - 4) & 1) != 0 ? (const char *)*(v20 - 3) : (char *)v20 - 31;
      if (!strcmp(v22, "indexTriangles"))
        break;
      v20 += 8;
      v21 -= 64;
      if (!v21)
        goto LABEL_32;
    }
    v23 = DRMeshGetPartCount();
    if (v23)
    {
      v24 = 0;
      v25 = 0;
      v50 = vdupq_n_s32(0x7F800000u);
      do
      {
        v58 = 0;
        v59 = 0;
        v56 = 0;
        v57 = 0;
        DWORD2(v55) = 0;
        *(_QWORD *)&v55 = 0;
        DWORD2(v54) = 0;
        *(_QWORD *)&v54 = 0;
        if (DRMeshGetPartAt())
        {
          v26 = v23;
          v27 = v7;
          v28 = (void *)*((_QWORD *)a4 + 4);
          v30 = v58;
          v29 = v59;
          v31 = DRMeshDescriptorGetIndexType();
          v67[0] = 0;
          v32 = v28;
          v33 = 4 * (v31 == 1);
          if (!v31)
            v33 = 2;
          v67[0] = v32;
          LODWORD(v67[1]) = v29;
          HIDWORD(v67[1]) = v33 * v30;
          NS::SharedPtr<MTL::Texture>::operator=(v20, v67);
          v20[1] = v67[1];
          v7 = v27;
          v23 = v26;
          if (v67[0])

          v34 = (_anonymous_namespace_ *)snprintf(__str, 0x40uLL, "Part%zu", v25);
          v53[0] = 0;
          v53[1] = (uint64_t)&str_110;
          v35 = strlen(__str);
          *(_OWORD *)v111 = v55;
          *(_OWORD *)&v111[16] = v54;
          v112 = xmmword_2260E5F10;
          v113 = xmmword_2260E5F20;
          v114 = xmmword_2260E5F40;
          v115 = xmmword_2260E5D70;
          WORD2(v66) = 0;
          LODWORD(v66) = 0;
          re::MeshPart::MeshPart((uint64_t)v67, v53, v57, v63, v61, v58, v58, 1, v111, v25, &v112, (re::MeshPartFlags *)&v66, -1, 0);
          re::StringID::destroyString((re::StringID *)v53);
          v102 = v56;
          v36 = *((_QWORD *)&v64 + 1);
          if (*((_QWORD *)&v64 + 1) <= v25)
          {
            v66 = 0;
            v115 = 0u;
            v116 = 0u;
            v113 = 0u;
            v114 = 0u;
            v112 = 0u;
            os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            *(_DWORD *)v111 = 136315906;
            *(_QWORD *)&v111[4] = "operator[]";
            *(_WORD *)&v111[12] = 1024;
            *(_DWORD *)&v111[14] = 468;
            *(_WORD *)&v111[18] = 2048;
            *(_QWORD *)&v111[20] = v25;
            *(_WORD *)&v111[28] = 2048;
            *(_QWORD *)&v111[30] = v36;
            _os_log_send_and_compose_impl();
            _os_crash_msg();
            __break(1u);
LABEL_51:
            *(_QWORD *)v111 = 0;
            v115 = v37;
            v116 = v37;
            v113 = v37;
            v114 = v37;
            v112 = v37;
            os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            *(_DWORD *)__str = 136315906;
            *(_QWORD *)&__str[4] = "operator[]";
            v105 = 1024;
            v106 = 468;
            v107 = 2048;
            v108 = v25;
            v109 = 2048;
            v110 = v36;
            _os_log_send_and_compose_impl();
            _os_crash_msg();
            __break(1u);
LABEL_52:
            re::internal::assertLog((re::internal *)4, v43, "assertion failure: '%s' (%s:line %i) ", "!isInitialized() || m_allocator == other.m_allocator", "operator=", 296);
            _os_crash();
            __break(1u);
          }
        }
        else
        {
          v37 = 0uLL;
          v87 = 0u;
          v84 = 0;
          v82 = 0uLL;
          v80 = 1uLL;
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          *(_OWORD *)v69 = 0u;
          *(_OWORD *)v67 = 0u;
          v81 = 0uLL;
          v83 = 0uLL;
          v85 = 0u;
          memset(v86, 0, sizeof(v86));
          memset(v88, 0, 24);
          v89 = xmmword_2260E5F10;
          v90 = xmmword_2260E5F20;
          v91 = xmmword_2260E5F40;
          v92 = xmmword_2260E5D70;
          *(_QWORD *)&v38 = 0x7F0000007FLL;
          *((_QWORD *)&v38 + 1) = 0x7F0000007FLL;
          v93 = v50;
          v94 = v38;
          v97 = 0;
          v96 = 0;
          v95 = 0;
          v101[0] = 0;
          v101[1] = &str_110;
          v101[3] = 0;
          v102 = 3;
          v103 = 0x180197E00000001;
          v98 = -1;
          v99 = -1;
          v100 = -1;
          v36 = *((_QWORD *)&v64 + 1);
          if (*((_QWORD *)&v64 + 1) <= v25)
            goto LABEL_51;
        }
        re::MeshPart::operator=((uint64_t *)(v65 + v24), (uint64_t *)v67);
        re::StringID::destroyString((re::StringID *)v101);
        re::FixedArray<re::StringID>::deinit(v88);
        re::AttributeTable::~AttributeTable((re::AttributeTable *)v67);
        ++v25;
        v24 += 560;
      }
      while (v23 != v25);
    }
    v39 = 0;
    v67[0] = 0;
    v67[1] = &str_110;
    *(_QWORD *)&v40 = 0x7F0000007FLL;
    *((_QWORD *)&v40 + 1) = 0x7F0000007FLL;
    v68 = vdupq_n_s32(0x7F800000u);
    *(_OWORD *)v69 = v40;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    do
    {
      v41 = &v67[v39];
      v41[12] = 0;
      v41[16] = 0;
      v39 += 5;
    }
    while (v39 != 90);
    re::StringID::destroyString((re::StringID *)v67);
    v67[0] = (id)149034514;
    v67[1] = "Model";
    v42 = -[REDirectMeshPayload aabb](self, "aabb");
    v68 = (int32x4_t)v112;
    *(_OWORD *)v69 = v113;
    v44 = v70;
    if ((_QWORD)v70 && (_QWORD)v70 != (_QWORD)v64)
      goto LABEL_52;
    v45 = *((_QWORD *)&v70 + 1);
    v46 = v71;
    v70 = v64;
    *(_QWORD *)&v64 = v44;
    *((_QWORD *)&v64 + 1) = v45;
    *(_QWORD *)&v71 = v65;
    v65 = v46;
    v49->var0.var4 = 0;
    v49->var0.var1 = 0;
    v49->var0.var2 = 0;
    v49->var0.var3 = 0;
    re::DynamicArray<re::MeshModel>::setCapacity(v49, 1uLL);
    ++v49->var0.var3;
    re::DynamicArray<re::MeshModel>::add((_anonymous_namespace_ *)v49, (uint64_t *)v67);
    re::MeshModel::~MeshModel((re::MeshModel *)v67);
  }
  else
  {
LABEL_32:
    v49->var0.var4 = 0;
    v49->var0.var1 = 0;
    v49->var0.var2 = 0;
    v49->var0.var0 = 0;
    v49->var0.var3 = 0;
  }
  re::DynamicArray<re::NamedVertexBuffer>::deinit((uint64_t)v60);
  re::FixedArray<re::MeshPart>::deinit(&v64);

  return result;
}

- (void)makeBoundingBoxes:(void *)a3 perPartPerInstanceBoundingBoxes:(void *)a4
{
  _OWORD *v7;
  void *v8;
  unint64_t PartCount;
  _anonymous_namespace_ *v10;
  uint64_t v11;
  unint64_t v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;

  -[REDirectMeshPayload aabb](self, "aabb");
  if (!*((_QWORD *)a3 + 1))
    goto LABEL_8;
  v7 = (_OWORD *)*((_QWORD *)a3 + 2);
  *v7 = v14;
  v7[1] = v15;
  -[REDirectMeshPayload directMesh](self, "directMesh");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PartCount = DRMeshGetPartCount();

  if (PartCount)
  {
    v11 = 0;
    v12 = 0;
    while (1)
    {
      -[REDirectMeshPayload aabb](self, "aabb");
      if (*((_QWORD *)a4 + 1) <= v12)
        break;
      v13 = (_OWORD *)(*((_QWORD *)a4 + 2) + v11);
      *v13 = v14;
      v13[1] = v15;
      ++v12;
      v11 += 32;
      if (PartCount == v12)
        return;
    }
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_8:
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (const)identifier
{
  return (const unsigned __int8 (*)[16])self->_identifier;
}

- (REDirectMeshPayload)initWithDirectMesh:(id)a3
{
  id v4;
  REDirectMeshPayload *v5;
  REDirectMeshPayload *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REDirectMeshPayload;
  v5 = -[RESharedResourcePayload init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[REDirectMeshPayload setDirectMesh:](v5, "setDirectMesh:", v4);
    DRMeshAsResource();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DRResourceGetIdentifier();

  }
  return v6;
}

- (REDirectMeshPayload)initWithCoder:(id)a3
{
  id v4;
  REDirectMeshPayload *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  REDirectMeshPayload *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REDirectMeshPayload;
  v5 = -[RESharedResourcePayload initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v11);

LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (!v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v12);

    goto LABEL_8;
  }
  objc_msgSend(v7, "getUUIDBytes:", v5->_identifier);

LABEL_5:
  v10 = v5;
LABEL_9:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t isKindOfClass;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", self->_identifier);
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  }
  else
  {
    v7 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_224FE9000, v7, OS_LOG_TYPE_FAULT, "REDirectMeshPayload requires an NSXPCCoder", v8, 2u);
    }
  }

}

- (FixedInlineArray<unsigned)payloadBufferSizes
{
  void *v4;
  FixedInlineArray<unsigned long, 8UL> *result;

  v4 = (void *)DRMeshCopyDescriptor();
  DRMeshDescriptorCalculateBufferSizes();

  retstr->var0[6] = 0;
  retstr->var0[7] = 0;
  retstr->var0[4] = 0;
  retstr->var0[5] = 0;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  return result;
}

- (unint64_t)totalPayloadSize
{
  void *v2;
  int64x2_t v3;

  v2 = (void *)DRMeshCopyDescriptor();
  DRMeshDescriptorCalculateBufferSizes();

  v3.i64[0] = 0;
  return vaddvq_s64(vaddq_s64((int64x2_t)0, vaddq_s64((int64x2_t)0, v3)));
}

- (FixedInlineArray<NS::SharedPtr<MTL::Buffer>,)meshPayloadBuffersWithDevice:(REDirectMeshPayload *)self
{
  FixedInlineArray<NS::SharedPtr<MTL::Buffer>, 8UL> *result;
  void *v6;
  id v7;
  uint64_t v8;
  FixedInlineArray<NS::SharedPtr<MTL::Buffer>, 8UL> *v9;
  void *v10;
  id v11;
  id v12;

  result = (FixedInlineArray<NS::SharedPtr<MTL::Buffer>, 8UL> *)self->_directMesh;
  *(_OWORD *)&retstr->var0[0].var0 = 0u;
  *(_OWORD *)&retstr->var0[2].var0 = 0u;
  *(_OWORD *)&retstr->var0[4].var0 = 0u;
  *(_OWORD *)&retstr->var0[6].var0 = 0u;
  if (result)
  {
    DRMeshReadIndicesUsing();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    v7 = v6;
    NS::SharedPtr<MTL::Texture>::operator=((void **)&retstr->var0[4].var0, &v12);
    if (v12)
    {

      v12 = 0;
    }

    v8 = 0;
    v9 = retstr;
    do
    {
      DRMeshReadVerticesUsing();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v11 = v10;
      NS::SharedPtr<MTL::Texture>::operator=((void **)v9, &v12);
      if (v12)
      {

        v12 = 0;
      }

      ++v8;
      v9 = (FixedInlineArray<NS::SharedPtr<MTL::Buffer>, 8UL> *)((char *)v9 + 8);
    }
    while (v8 != 4);
  }
  return result;
}

- (unint64_t)estimatePayloadContainerOverheadSize
{
  return 0;
}

- (BOOL)isShareable
{
  return 1;
}

- (BOOL)isLimitedRenderAsset
{
  return 0;
}

- (NSArray)parts
{
  NSArray *result;

  re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "!\"Unreachable code\", "-[REDirectMeshPayload parts]", 171);
  result = (NSArray *)_os_crash();
  __break(1u);
  return result;
}

- (NSArray)models
{
  NSArray *result;

  re::internal::assertLog((re::internal *)4, (uint64_t)a2, "assertion failure: '%s' (%s:line %i) ", "!\"Unreachable code\", "-[REDirectMeshPayload models]", 177);
  result = (NSArray *)_os_crash();
  __break(1u);
  return result;
}

- (NSArray)instances
{
  REMeshInstanceDescriptor *v2;
  REMeshInstanceDescriptor *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_directMesh)
    return (NSArray *)MEMORY[0x24BDBD1A8];
  v2 = [REMeshInstanceDescriptor alloc];
  v3 = -[REMeshInstanceDescriptor initWithName:modelIndex:transform:lodSelectOptions:](v2, "initWithName:modelIndex:transform:lodSelectOptions:", CFSTR("Model"), 0, 0x3F80000000000000, *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48));
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)skeletons
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (DRMesh)directMesh
{
  return self->_directMesh;
}

- (void)setDirectMesh:(id)a3
{
  objc_storeStrong((id *)&self->_directMesh, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directMesh, 0);
}

@end
