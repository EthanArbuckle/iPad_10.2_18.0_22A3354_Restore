@implementation MDLSubmesh

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIndexing, 0);
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_topology, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_indexBuffer, 0);
  objc_storeStrong((id *)&self->_material, 0);
}

- (MDLSubmesh)initWithName:(NSString *)name indexBuffer:(id)indexBuffer indexCount:(NSUInteger)indexCount indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType material:(MDLMaterial *)material topology:(MDLSubmeshTopology *)topology
{
  return (MDLSubmesh *)objc_msgSend_initWithName_indexBuffer_indexCount_indexType_faceIndexing_geometryType_material_topology_(self, a2, (uint64_t)name, indexBuffer, indexCount, indexType, 0, geometryType, material, topology);
}

- (MDLSubmesh)initWithName:(id)a3 indexBuffer:(id)a4 indexCount:(unint64_t)a5 indexType:(unint64_t)a6 faceIndexing:(id)a7 geometryType:(int64_t)a8 material:(id)a9 topology:(id)a10
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  MDLMeshBufferAllocator *allocator;
  MDLSubmesh *v26;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSString *name;
  void *v35;
  MDLMeshBufferAllocator *v36;
  MDLSubmesh *v37;
  objc_super v41;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a9;
  v17 = a10;
  if (objc_msgSend_type(v14, v18, v19) == 2 && (!v15 || v17) && (!v15 || a8 == 5))
  {
    v41.receiver = self;
    v41.super_class = (Class)MDLSubmesh;
    v37 = -[MDLSubmesh init](&v41, sel_init);
    self = v37;
    if (v37)
    {
      objc_msgSend_null(MEMORY[0x1E0C99E38], v20, v21);
      v36 = (MDLMeshBufferAllocator *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqual_(v14, v22, (uint64_t)v36) & 1) != 0)
      {
        allocator = v36;
      }
      else
      {
        objc_msgSend_allocator(v14, v23, v24);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v35)
        {
LABEL_14:
          objc_storeStrong((id *)&v37->_indexBuffer, a4);
          objc_storeStrong((id *)&v37->_material, a9);
          objc_storeStrong((id *)&v37->_topology, a10);
          objc_storeStrong((id *)&v37->_faceIndexing, a7);
          v33 = objc_msgSend_copy(v13, v31, v32);
          name = v37->_name;
          v37->_name = (NSString *)v33;

          v37->_indexCount = a5;
          v37->_geometryType = a8;
          v37->_indexType = a6;
          self = v37;
          v26 = self;
          goto LABEL_10;
        }
        objc_msgSend_allocator(v14, v28, v29);
        v30 = objc_claimAutoreleasedReturnValue();
        allocator = v37->_allocator;
        v37->_allocator = (MDLMeshBufferAllocator *)v30;
      }

      goto LABEL_14;
    }
  }
  v26 = 0;
LABEL_10:

  return v26;
}

- (MDLMaterial)material
{
  return self->_material;
}

- (NSArray)faceIndexing
{
  return self->_faceIndexing;
}

- (MDLGeometryType)geometryType
{
  return self->_geometryType;
}

- (MDLSubmeshTopology)topology
{
  return self->_topology;
}

- (NSUInteger)indexCount
{
  return self->_indexCount;
}

- (id)indexBuffer
{
  return self->_indexBuffer;
}

- (MDLIndexBitDepth)indexType
{
  return self->_indexType;
}

- (MDLSubmesh)initWithName:(NSString *)name indexBuffer:(id)indexBuffer indexCount:(NSUInteger)indexCount indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType material:(MDLMaterial *)material
{
  NSString *v12;
  id v13;
  MDLMaterial *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  MDLSubmesh *v19;
  void *allocator;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSString *v31;
  MDLSubmesh *v32;
  objc_super v36;

  v12 = name;
  v13 = indexBuffer;
  v14 = material;
  if (objc_msgSend_type(v13, v15, v16) != 2
    || (v36.receiver = self,
        v36.super_class = (Class)MDLSubmesh,
        v19 = -[MDLSubmesh init](&v36, sel_init),
        (self = v19) == 0))
  {
    v32 = 0;
    goto LABEL_9;
  }
  objc_msgSend_null(MEMORY[0x1E0C99E38], v17, v18);
  allocator = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v13, v21, (uint64_t)allocator) & 1) != 0)
    goto LABEL_6;
  objc_msgSend_allocator(v13, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_allocator(v13, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    allocator = v19->_allocator;
    v19->_allocator = (MDLMeshBufferAllocator *)v27;
LABEL_6:

  }
  objc_storeStrong((id *)&v19->_indexBuffer, indexBuffer);
  objc_storeStrong((id *)&v19->_material, material);
  v30 = objc_msgSend_copy(v12, v28, v29);
  v31 = v19->_name;
  v19->_name = (NSString *)v30;

  v19->_indexCount = indexCount;
  v19->_geometryType = geometryType;
  v19->_indexType = indexType;
  self = v19;
  v32 = self;
LABEL_9:

  return v32;
}

- (MDLSubmesh)initWithIndexBuffer:(id)indexBuffer indexCount:(NSUInteger)indexCount indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType material:(MDLMaterial *)material
{
  return (MDLSubmesh *)objc_msgSend_initWithName_indexBuffer_indexCount_indexType_geometryType_material_(self, a2, (uint64_t)&stru_1EA577998, indexBuffer, indexCount, indexType, geometryType, material);
}

- (MDLSubmesh)initWithMDLSubmesh:(MDLSubmesh *)submesh indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType
{
  MDLSubmesh *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  MDLSubmesh *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  char v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  _BYTE *v77;
  id v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  _BYTE *v91;
  id v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE *v101;
  _BYTE *v102;
  id v103;
  const char *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  id v114;
  const char *v115;
  void *v116;
  const char *v117;
  void *v118;
  id v119;
  const char *v120;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  char v132;
  MDLSubmesh *v133;
  void *context;
  void *v135;
  void *__p;
  _BYTE *v137;
  uint64_t v138;

  v8 = submesh;
  if (objc_msgSend_indexType(v8, v9, v10) != indexType || objc_msgSend_geometryType(v8, v11, v12) != geometryType)
  {
    v36 = MEMORY[0x1DF0D25C8]();
    objc_storeStrong((id *)&self->_allocator, v8->_allocator);
    objc_msgSend_indexBuffer(v8, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)v36;
    objc_msgSend_map(v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v135 = v42;
    v45 = objc_msgSend_bytes(v42, v43, v44);
    if (objc_msgSend_geometryType(v8, v46, v47) == 5)
    {
      objc_msgSend_topology(v8, v48, v49);
      v35 = (MDLSubmesh *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        v68 = 0;
        v55 = 0;
        goto LABEL_32;
      }
      objc_msgSend_topology(v8, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_faceTopology(v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_topology(v8, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend_faceCount(v58, v59, v60);

      if (v55)
      {
        objc_msgSend_map(v55, v48, v49);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v62;
        if (v62)
          v66 = objc_msgSend_bytes(v62, v63, v64);
        else
          v66 = 0;

        v67 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      v61 = 0;
      v55 = 0;
    }
    v66 = 0;
    v67 = 1;
LABEL_14:
    switch(indexType)
    {
      case MDLIndexBitDepthUInt32:
        v133 = self;
        v132 = v67;
        __p = 0;
        v137 = 0;
        v138 = 0;
        v83 = objc_msgSend_indexCount(v8, v48, v49);
        v86 = objc_msgSend_indexType(v8, v84, v85);
        v89 = objc_msgSend_geometryType(v8, v87, v88);
        sub_1DCC1903C(&__p, v45, v83, v66, v61, v86, v89, geometryType);
        v91 = __p;
        v90 = v137;
        v92 = objc_alloc(MEMORY[0x1E0C99D50]);
        v68 = (void *)objc_msgSend_initWithBytes_length_(v92, v93, (uint64_t)__p, v137 - (_BYTE *)__p);
        v82 = (v90 - v91) >> 2;
        goto LABEL_20;
      case MDLIndexBitDepthUInt16:
        v133 = self;
        v132 = v67;
        __p = 0;
        v137 = 0;
        v138 = 0;
        v94 = objc_msgSend_indexCount(v8, v48, v49);
        v97 = objc_msgSend_indexType(v8, v95, v96);
        v100 = objc_msgSend_geometryType(v8, v98, v99);
        sub_1DCC17334(&__p, v45, v94, v66, v61, v97, v100, geometryType);
        v102 = __p;
        v101 = v137;
        v103 = objc_alloc(MEMORY[0x1E0C99D50]);
        v68 = (void *)objc_msgSend_initWithBytes_length_(v103, v104, (uint64_t)__p, v137 - (_BYTE *)__p);
        v82 = (v101 - v102) >> 1;
        goto LABEL_20;
      case MDLIndexBitDepthUInt8:
        v133 = self;
        v132 = v67;
        __p = 0;
        v137 = 0;
        v138 = 0;
        v69 = objc_msgSend_indexCount(v8, v48, v49);
        v72 = objc_msgSend_indexType(v8, v70, v71);
        v75 = objc_msgSend_geometryType(v8, v73, v74);
        sub_1DCC15294(&__p, v45, v69, v66, v61, v72, v75, geometryType);
        v77 = __p;
        v76 = v137;
        v78 = objc_alloc(MEMORY[0x1E0C99D50]);
        v68 = (void *)objc_msgSend_initWithBytes_length_(v78, v79, (uint64_t)__p, v137 - (_BYTE *)__p);
        v82 = v76 - v77;
LABEL_20:
        if (__p)
        {
          v137 = __p;
          operator delete(__p);
        }
        objc_msgSend_indexBuffer(v8, v80, v81);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allocator(v105, v106, v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = (void *)objc_msgSend_newBufferWithData_type_(v108, v109, (uint64_t)v68, 2);

        if (objc_msgSend_conformsToProtocol_(v110, v111, (uint64_t)&unk_1F03B6D88))
        {
          v114 = v110;
          objc_msgSend_stringByAppendingString_(CFSTR("mesh"), v115, (uint64_t)CFSTR("-Indices"));
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setName_(v114, v117, (uint64_t)v116);

        }
        if (((geometryType == MDLGeometryTypeVariableTopology) & v132) != 0)
          v118 = 0;
        else
          v118 = v55;
        if (v118 && objc_msgSend_conformsToProtocol_(v118, v112, (uint64_t)&unk_1F03B6D88))
        {
          v119 = v118;
          objc_msgSend_stringByAppendingString_(CFSTR("mesh"), v120, (uint64_t)CFSTR("-Indices"));
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setName_(v119, v122, (uint64_t)v121);

        }
        objc_msgSend_name(v8, v112, v113);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_material(v8, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_topology(v8, v127, v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        self = (MDLSubmesh *)(id)objc_msgSend_initWithName_indexBuffer_indexCount_indexType_geometryType_material_topology_(v133, v130, (uint64_t)v123, v110, v82, indexType, geometryType, v126, v129);

        v35 = self;
        v55 = v118;
        goto LABEL_32;
    }
    v35 = 0;
    v68 = 0;
LABEL_32:

    objc_autoreleasePoolPop(context);
    goto LABEL_33;
  }
  objc_msgSend_name(v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexBuffer(v8, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_indexCount(v8, v19, v20);
  v24 = objc_msgSend_indexType(v8, v22, v23);
  v27 = objc_msgSend_geometryType(v8, v25, v26);
  objc_msgSend_material(v8, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topology(v8, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  self = (MDLSubmesh *)(id)objc_msgSend_initWithName_indexBuffer_indexCount_indexType_geometryType_material_topology_(self, v34, (uint64_t)v15, v18, v21, v24, v27, v30, v33);

  v35 = self;
LABEL_33:

  return v35;
}

- (id)indexBufferAsIndexType:(MDLIndexBitDepth)indexType
{
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int *v13;
  const char *v14;
  unint64_t v15;
  _DWORD *v16;
  int v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unint64_t indexCount;
  _DWORD *v23;
  int v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  unsigned __int16 *v28;
  unint64_t v29;
  _DWORD *v30;
  int v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  _WORD *v53;
  const char *v54;
  uint64_t v55;
  unint64_t v56;
  int *v57;
  int v58;
  void *v59;
  const char *v60;
  const char *v61;
  id v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *__src;
  void *v67;
  uint64_t v68;

  if (self->_indexType == indexType)
    return self->_indexBuffer;
  v6 = (void *)MEMORY[0x1DF0D25C8]();
  __src = 0;
  v67 = 0;
  v68 = 0;
  sub_1DCB231F4((uint64_t)&__src, self->_indexCount);
  v9 = self->_indexType;
  switch(v9)
  {
    case 8uLL:
      objc_msgSend_map(self->_indexBuffer, v7, v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (unsigned __int8 *)objc_msgSend_bytes(v18, v19, v20);

      indexCount = self->_indexCount;
      if (indexCount)
      {
        v23 = __src;
        do
        {
          v24 = *v21++;
          *v23++ = v24;
          --indexCount;
        }
        while (indexCount);
      }
      break;
    case 0x10uLL:
      objc_msgSend_map(self->_indexBuffer, v7, v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (unsigned __int16 *)objc_msgSend_bytes(v25, v26, v27);

      v29 = self->_indexCount;
      if (v29)
      {
        v30 = __src;
        do
        {
          v31 = *v28++;
          *v30++ = v31;
          --v29;
        }
        while (v29);
      }
      break;
    case 0x20uLL:
      objc_msgSend_map(self->_indexBuffer, v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (int *)objc_msgSend_bytes(v10, v11, v12);

      v15 = self->_indexCount;
      if (v15)
      {
        v16 = __src;
        do
        {
          v17 = *v13++;
          *v16++ = v17;
          --v15;
        }
        while (v15);
      }
      break;
    default:
      goto LABEL_25;
  }
  switch(indexType)
  {
    case MDLIndexBitDepthUInt32:
      objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v14, 8 * self->_indexCount);
      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v45 = (void *)objc_msgSend_mutableBytes(v32, v43, v44);
      memcpy(v45, __src, 4 * self->_indexCount);
      objc_msgSend_allocator(self->_indexBuffer, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend_newBufferWithData_type_(v48, v49, (uint64_t)v32, 2);

      if (!objc_msgSend_conformsToProtocol_(v41, v50, (uint64_t)&unk_1F03B6D88))
      {
LABEL_33:

        goto LABEL_34;
      }
LABEL_32:
      v62 = v41;
      objc_msgSend_stringByAppendingString_(CFSTR("mesh"), v63, (uint64_t)CFSTR("-Indices"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setName_(v62, v65, (uint64_t)v64);

      v41 = v62;
      goto LABEL_33;
    case MDLIndexBitDepthUInt16:
      objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v14, 8 * self->_indexCount);
      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v53 = (_WORD *)objc_msgSend_mutableBytes(v32, v51, v52);
      v56 = self->_indexCount;
      if (v56)
      {
        v57 = (int *)__src;
        do
        {
          v58 = *v57++;
          *v53++ = v58;
          --v56;
        }
        while (v56);
      }
      objc_msgSend_allocator(self->_indexBuffer, v54, v55);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend_newBufferWithData_type_(v59, v60, (uint64_t)v32, 2);

      if (!objc_msgSend_conformsToProtocol_(v41, v61, (uint64_t)&unk_1F03B6D88))
        goto LABEL_33;
      goto LABEL_32;
    case MDLIndexBitDepthUInt8:
      objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v14, 8 * self->_indexCount);
      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v35 = objc_msgSend_mutableBytes(v32, v33, v34);
      if (self->_indexCount)
      {
        v38 = 0;
        do
        {
          *(_BYTE *)(v35 + v38) = *((_DWORD *)__src + v38);
          ++v38;
        }
        while (self->_indexCount > v38);
      }
      objc_msgSend_allocator(self->_indexBuffer, v36, v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend_newBufferWithData_type_(v39, v40, (uint64_t)v32, 2);

      if (!objc_msgSend_conformsToProtocol_(v41, v42, (uint64_t)&unk_1F03B6D88))
        goto LABEL_33;
      goto LABEL_32;
  }
LABEL_25:
  v41 = 0;
LABEL_34:
  if (__src)
  {
    v67 = __src;
    operator delete(__src);
  }
  objc_autoreleasePoolPop(v6);
  return v41;
}

- (void)debugPrintToFile:(__sFILE *)a3
{
  unint64_t indexType;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  fprintf(a3, "%lu ", self->_indexCount);
  indexType = self->_indexType;
  switch(indexType)
  {
    case 0x20uLL:
      fwrite("32Bit Indices:\n", 0xFuLL, 1uLL, a3);
      objc_msgSend_map(self->_indexBuffer, v11, v12);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend_bytes(v21, v13, v14);
      sub_1DCBA8518(v15, self->_indexCount);
      goto LABEL_7;
    case 0x10uLL:
      fwrite("16Bit Indices:\n", 0xFuLL, 1uLL, a3);
      objc_msgSend_map(self->_indexBuffer, v16, v17);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_bytes(v21, v18, v19);
      sub_1DCBA8498(v20, self->_indexCount);
      goto LABEL_7;
    case 8uLL:
      fwrite("8Bit Indices:\n", 0xEuLL, 1uLL, a3);
      objc_msgSend_map(self->_indexBuffer, v6, v7);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend_bytes(v21, v8, v9);
      sub_1DCBA8418(v10, self->_indexCount);
LABEL_7:

      return;
  }
  fwrite("INVALID INDEX TYPE!!!\n", 0x16uLL, 1uLL, a3);
}

- (void)boundingBoxForMesh:(float32x4_t *)a3@<X8>
{
  id v5;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  unsigned __int16 *v34;
  uint64_t v35;
  uint64_t k;
  unsigned int v37;
  unint64_t v38;
  float32x4_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  unsigned int v43;
  unint64_t v44;
  float32x4_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  unsigned int v49;
  unint64_t v50;
  float32x4_t v51;
  uint64_t v52;
  uint64_t v53;
  float32x4_t v54;
  float32x4_t v55;

  v5 = a2;
  a3[1].i64[0] = 0;
  a3[1].i64[1] = 0;
  __asm { FMOV            V0.4S, #-1.0 }
  *a3 = _Q0;
  objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(v5, v10, (uint64_t)CFSTR("position"), 786435);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  if (v11 && objc_msgSend_format(v11, v12, v13))
  {
    v17 = objc_msgSend_dataStart(v14, v15, v16);
    v20 = objc_msgSend_stride(v14, v18, v19);
    v23 = v20;
    if (v17 && v20 != 0)
    {
      v25 = (void *)a1[3];
      if (v25)
      {
        objc_msgSend_map(v25, v21, v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v26;
        if (v26 && objc_msgSend_bytes(v26, v27, v28))
        {
          v34 = (unsigned __int16 *)objc_msgSend_bytes(v29, v30, v31);
          v35 = a1[6];
          switch(v35)
          {
            case 8:
              for (i = a1[2]; i; --i)
              {
                v49 = *(unsigned __int8 *)v34;
                v34 = (unsigned __int16 *)((char *)v34 + 1);
                v50 = objc_msgSend_bufferSize(v14, v32, v33);
                v52 = v23 * v49;
                if (v52 + 12 <= v50)
                {
                  v53 = v17 + v52;
                  v51.i64[0] = *(_QWORD *)v53;
                  v51.i32[2] = *(_DWORD *)(v53 + 8);
                  v54 = v51;
                  v55 = v51;
                  sub_1DCB22B5C(a3, &v54);
                }
              }
              break;
            case 16:
              for (j = a1[2]; j; --j)
              {
                v43 = *v34++;
                v44 = objc_msgSend_bufferSize(v14, v32, v33);
                v46 = v23 * v43;
                if (v46 + 12 <= v44)
                {
                  v47 = v17 + v46;
                  v45.i64[0] = *(_QWORD *)v47;
                  v45.i32[2] = *(_DWORD *)(v47 + 8);
                  v54 = v45;
                  v55 = v45;
                  sub_1DCB22B5C(a3, &v54);
                }
              }
              break;
            case 32:
              for (k = a1[2]; k; --k)
              {
                v37 = *(_DWORD *)v34;
                v34 += 2;
                v38 = objc_msgSend_bufferSize(v14, v32, v33);
                v40 = v23 * v37;
                if (v40 + 12 <= v38)
                {
                  v41 = v17 + v40;
                  v39.i64[0] = *(_QWORD *)v41;
                  v39.i32[2] = *(_DWORD *)(v41 + 8);
                  v54 = v39;
                  v55 = v39;
                  sub_1DCB22B5C(a3, &v54);
                }
              }
              break;
          }
        }

      }
    }
  }

}

- (void)setMaterial:(MDLMaterial *)material
{
  objc_storeStrong((id *)&self->_material, material);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 32);
}

- (void)setTopology:(MDLSubmeshTopology *)topology
{
  objc_storeStrong((id *)&self->_topology, topology);
}

- (void)setFaceIndexing:(id)a3
{
  objc_storeStrong((id *)&self->_faceIndexing, a3);
}

@end
