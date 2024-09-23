@implementation SCNGeometryVDMCDeformerInstance

- (id)initWithNode:(uint64_t)a3 deformer:(uint64_t)a4 outputs:(uint64_t)a5 computeVertexCount:(void *)a6 context:
{
  uint64_t Geometry;
  void *v8;
  unsigned int TotalTriangleCount;
  int v10;
  long double v11;
  CFIndex v12;
  const void *ElementAtIndex;
  unsigned int Type;
  NSObject *v15;
  SCNMTLMeshElement *v16;
  signed int v17;
  uint64_t PrimitiveCount;
  void *v19;
  void *v20;
  SCNMTLBuffer *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  std::vector<int>::pointer end;
  int *v26;
  std::vector<int>::pointer begin;
  uint64_t v28;
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  char *v32;
  int *v33;
  int v34;
  SCNGeometryVDMCDeformerMeshElementData *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  uint64_t v42;
  NSMutableArray *triangleBufferChain;
  const char *v44;
  void *v45;
  unint64_t v46;
  char *v47;
  char *v48;
  NSObject *v49;
  void *v50;
  NSMutableArray *configBufferChain;
  const char *v52;
  void *v53;
  uint64_t v54;
  NSMutableArray *maxTrianglesAtLevel;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSMutableArray *v60;
  int Size;
  void *v62;
  NSMutableArray *v63;
  void *v64;
  NSMutableArray *v65;
  void *v66;
  const char *v67;
  NSMutableArray *v68;
  void *v69;
  const char *v70;
  SEL v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  SCNMTLBuffer *v77;
  NSMutableArray *v78;
  SCNMTLMeshElement *v79;
  void *v80;
  void *v81;
  std::vector<int>::pointer v82;
  int64_t v83;
  std::vector<unsigned int>::pointer v84;
  const void *v85;
  int64_t v86;
  char *v87;
  const void *v88;
  int64_t v89;
  char *v90;
  const void *v91;
  int64_t v92;
  char *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  const __CFArray *i;
  void *v106;
  const char *v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  void *v112;
  const char *v113;
  SCNMTLMesh *v114;
  int v116;
  id v117;
  id newValue;
  __C3DMesh *Mesh;
  unint64_t v121;
  const __CFArray *ElementsCount;
  CFIndex v123;
  id v124;
  uint64_t v125;
  char v126[12];
  int v127;
  int v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  uint64_t v137;
  std::vector<unsigned int> __x;
  void *__p;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint64_t v168;
  _QWORD v169[8];
  _QWORD v170[4];
  void *v171;
  void *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  uint64_t v179;
  std::vector<int> v180;
  objc_super v181;
  uint8_t v182[4];
  uint64_t v183;
  uint8_t v184[4];
  _QWORD v185[5];

  *(_QWORD *)((char *)&v185[2] + 4) = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v181.receiver = a1;
  v181.super_class = (Class)SCNGeometryVDMCDeformerInstance;
  v124 = objc_msgSendSuper2(&v181, sel_init);
  if (!v124)
    return 0;
  Geometry = C3DNodeGetGeometry(objc_msgSend(a2, "nodeRef"));
  Mesh = (__C3DMesh *)C3DGeometryGetMesh(Geometry);
  v8 = (void *)objc_msgSend(a6, "_currentResourceManager");
  if (!C3DEntityGetName((uint64_t)Mesh))
    C3DEntityGetName(Geometry);
  ElementsCount = C3DMeshGetElementsCount((uint64_t)Mesh);
  v117 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ElementsCount);
  *((_QWORD *)v124 + 2) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ElementsCount);
  newValue = (id)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)v8, (20 * (_DWORD)ElementsCount), 32);
  memset(&v180, 0, sizeof(v180));
  v177 = 0;
  v178 = 0;
  v179 = 0;
  v174 = 0;
  v175 = 0;
  v176 = 0;
  v172 = 0;
  v171 = 0;
  v173 = 0;
  TotalTriangleCount = getTotalTriangleCount(Mesh);
  v10 = (logf(3000000.0 / (float)TotalTriangleCount) / 1.38629436);
  v11 = exp2((double)v10 + (double)v10);
  v116 = v10;
  printf("Original mesh has %d triangles, will reach a maximum of %d after %d levels of subdivision\n", TotalTriangleCount, (int)(v11 * (double)TotalTriangleCount), v10);
  if ((uint64_t)ElementsCount >= 1)
  {
    v12 = 0;
    v121 = v10 + 1;
    v125 = (v10 + 1);
    do
    {
      v123 = v12;
      ElementAtIndex = C3DMeshGetElementAtIndex((uint64_t)Mesh, v12, 1);
      Type = C3DMeshElementGetType((uint64_t)ElementAtIndex);
      if ((C3DMeshElementTypeMapsToMTLPrimitiveType(Type) & 1) != 0)
      {
        if (C3DMeshElementGetType((uint64_t)ElementAtIndex))
        {
          v15 = scn_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            -[SCNGeometryVDMCDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:].cold.1(v182, &v183, v15);
        }
        v16 = -[SCNMTLResourceManager renderResourceForMeshElement:]((uint64_t)v8, (uint64_t)ElementAtIndex);
        v17 = -[SCNMTLResourceManager commandQueue]((uint64_t)v16);
        PrimitiveCount = C3DMeshElementGetPrimitiveCount((uint64_t)ElementAtIndex);
        std::vector<unsigned int>::reserve(&v180, v180.__end_ - v180.__begin_ + v17);
        if (!-[SCNMTLMesh elements]((uint64_t)v16))
        {
          v19 = (void *)objc_msgSend((id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v16), "buffer");
          objc_msgSend(a6, "currentBlitEncoder");
          v20 = (void *)newUInt32BufferFromUInt16Buffer(v19, v17, (uint64_t)v8);
          v21 = objc_alloc_init(SCNMTLBuffer);
          -[SCNMTLMeshElement setIndexBuffer:](v16, (char *)v21);
          objc_msgSend((id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v16), "setBuffer:", v20);

        }
        v22 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v16), "contents");
        if (v17 >= 1)
        {
          v23 = v22;
          v24 = 0;
          end = v180.__end_;
          do
          {
            if (end >= v180.__end_cap_.__value_)
            {
              begin = v180.__begin_;
              v28 = end - v180.__begin_;
              v29 = v28 + 1;
              if ((unint64_t)(v28 + 1) >> 62)
                abort();
              v30 = (char *)v180.__end_cap_.__value_ - (char *)v180.__begin_;
              if (((char *)v180.__end_cap_.__value_ - (char *)v180.__begin_) >> 1 > v29)
                v29 = v30 >> 1;
              if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL)
                v31 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v31 = v29;
              if (v31)
              {
                v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v180.__end_cap_, v31);
                begin = v180.__begin_;
                end = v180.__end_;
              }
              else
              {
                v32 = 0;
              }
              v33 = (int *)&v32[4 * v28];
              *v33 = *(_DWORD *)(v23 + 4 * v24);
              v26 = v33 + 1;
              while (end != begin)
              {
                v34 = *--end;
                *--v33 = v34;
              }
              v180.__begin_ = v33;
              v180.__end_ = v26;
              v180.__end_cap_.__value_ = (int *)&v32[4 * v31];
              if (begin)
                operator delete(begin);
            }
            else
            {
              *end = *(_DWORD *)(v23 + 4 * v24);
              v26 = end + 1;
            }
            v180.__end_ = v26;
            ++v24;
            end = v26;
          }
          while (v24 != v17);
        }
        v35 = objc_alloc_init(SCNGeometryVDMCDeformerMeshElementData);
        __p = 0;
        v140 = 0uLL;
        std::vector<float>::__vallocate[abi:nn180100](&__p, v121);
        v36 = v140;
        bzero((void *)v140, 4 * v121);
        *(_QWORD *)&v140 = v36 + 4 * v121;
        *(_DWORD *)__p = PrimitiveCount;
        v37 = (void *)objc_msgSend(a6, "currentBlitEncoder");
        v39 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)__p, v140 - (_QWORD)__p, v37);
        if (v35)
          objc_setProperty_nonatomic(v35, v38, v39, 72);

        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v121);
        if (v35)
          objc_setProperty_nonatomic(v35, v40, v41, 40);
        v42 = objc_msgSend((id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v16), "buffer");
        if (v35)
          triangleBufferChain = v35->_triangleBufferChain;
        else
          triangleBufferChain = 0;
        -[NSMutableArray setObject:atIndexedSubscript:](triangleBufferChain, "setObject:atIndexedSubscript:", v42, 0);

        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v121);
        if (v35)
          objc_setProperty_nonatomic(v35, v44, v45, 48);

        v46 = (int)PrimitiveCount;
        if (PrimitiveCount << 32)
        {
          if (PrimitiveCount << 32 < 0)
            abort();
          v47 = (char *)operator new((int)PrimitiveCount);
          memset(v47, 7, (int)PrimitiveCount);
          v48 = &v47[(int)PrimitiveCount];
        }
        else
        {
          v48 = 0;
          v47 = 0;
        }
        v50 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)v47, v48 - v47, (void *)objc_msgSend(a6, "currentBlitEncoder"));
        objc_msgSend(v50, "setLabel:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VDMC] ConfigBuffer%d"), 0));
        if (v35)
          configBufferChain = v35->_configBufferChain;
        else
          configBufferChain = 0;
        -[NSMutableArray setObject:atIndexedSubscript:](configBufferChain, "setObject:atIndexedSubscript:", v50, 0);

        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v121);
        if (v35)
          objc_setProperty_nonatomic(v35, v52, v53, 88);
        v54 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PrimitiveCount);
        if (v35)
          maxTrianglesAtLevel = v35->_maxTrianglesAtLevel;
        else
          maxTrianglesAtLevel = 0;
        -[NSMutableArray setObject:atIndexedSubscript:](maxTrianglesAtLevel, "setObject:atIndexedSubscript:", v54, 0);

        if (v116 >= 1)
        {
          v56 = (double)(int)PrimitiveCount;
          v57 = 1;
          do
          {
            v58 = (exp2((double)(int)v57 + (double)(int)v57) * v56);
            v59 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v58);
            if (v35)
              v60 = v35->_maxTrianglesAtLevel;
            else
              v60 = 0;
            -[NSMutableArray setObject:atIndexedSubscript:](v60, "setObject:atIndexedSubscript:", v59, v57);
            Size = SCNMTLIndexTypeGetSize(1);
            v62 = (void *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)v8, (3 * v58 * Size), 32);
            objc_msgSend(v62, "setLabel:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VDMC] TriangleBuffer%d"), v57));
            if (v35)
              v63 = v35->_triangleBufferChain;
            else
              v63 = 0;
            -[NSMutableArray setObject:atIndexedSubscript:](v63, "setObject:atIndexedSubscript:", v62, v57);

            v64 = (void *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)v8, v58, 32);
            objc_msgSend(v64, "setLabel:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VDMC] ConfigBuffer%d"), v57));
            if (v35)
              v65 = v35->_configBufferChain;
            else
              v65 = 0;
            -[NSMutableArray setObject:atIndexedSubscript:](v65, "setObject:atIndexedSubscript:", v64, v57);

            ++v57;
          }
          while (v125 != v57);
        }
        if (v35)
          v35->_originalPrimitiveCount = v46;
        v66 = (void *)-[SCNMTLMeshElement indexBuffer]((uint64_t)v16);
        if (v35)
        {
          objc_setProperty_nonatomic(v35, v67, v66, 16);
          v68 = v35->_triangleBufferChain;
        }
        else
        {
          v68 = 0;
        }
        v69 = (void *)-[NSMutableArray objectAtIndexedSubscript:](v68, "objectAtIndexedSubscript:", v116);
        if (v35)
        {
          objc_setProperty_nonatomic(v35, v70, v69, 32);
          objc_setProperty_nonatomic(v35, v71, newValue, 112);
          v72 = 20 * v123;
          v35->_drawIndexedPrimitivesIndirectBufferOffset = 20 * v123;
        }
        else
        {
          v72 = 20 * v123;
        }
        v73 = (void *)objc_msgSend(v8, "computePipelineStateForKernel:", CFSTR("VMeshAtomicSubdivisionKernel"));
        if (v35)
          objc_setProperty_nonatomic(v35, v74, v73, 136);
        v75 = (void *)objc_msgSend(v8, "computePipelineStateForKernel:", CFSTR("VMeshUpdateCountersAndArgumentsKernel"));
        if (v35)
        {
          objc_setProperty_nonatomic(v35, v76, v75, 144);
          v35->_maxLevel = v116;
        }
        v77 = objc_alloc_init(SCNMTLBuffer);
        if (v35)
          v78 = v35->_triangleBufferChain;
        else
          v78 = 0;
        -[SCNMTLBuffer setBuffer:](v77, "setBuffer:", -[NSMutableArray objectAtIndexedSubscript:](v78, "objectAtIndexedSubscript:", v116));
        v79 = objc_alloc_init(SCNMTLMeshElement);
        -[SCNMTLMeshElement setIndexType:]((uint64_t)v79, 1);
        -[SCNMTLMeshElement setIndexBuffer:](v79, (char *)v77);
        -[SCNMTLMeshElement setIndexCount:]((uint64_t)v79, 0);
        -[SCNMTLMeshElement setInstanceCount:]((uint64_t)v79, 0);
        -[SCNMTLMesh setMutabilityTimestamp:]((uint64_t)v79, 3);
        -[SCNMTLMeshElement setDrawIndexedPrimitivesIndirectBuffer:](v79, (char *)newValue);
        -[SCNMTLMesh setVolatileOffset:]((uint64_t)v79, v72);

        objc_msgSend(v117, "addObject:", v79);
        objc_msgSend(*((id *)v124 + 2), "addObject:", v35);

        if (v47)
          operator delete(v47);
        if (__p)
        {
          *(_QWORD *)&v140 = __p;
          operator delete(__p);
        }
      }
      else
      {
        v49 = scn_default_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
          -[SCNGeometryVariableTopologySampleDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:].cold.1(v184, v185, v49);
      }
      v12 = v123 + 1;
    }
    while ((const __CFArray *)(v123 + 1) != ElementsCount);
  }

  v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", C3DMeshGetSourcesCount((uint64_t)Mesh));
  v81 = (void *)objc_msgSend(MEMORY[0x1E0CC6BD8], "vertexDescriptor");
  v170[0] = 0;
  v170[1] = v170;
  v170[2] = 0x2020000000;
  v170[3] = 0;
  v169[0] = MEMORY[0x1E0C809B0];
  v169[1] = 3221225472;
  v169[2] = __92__SCNGeometryVDMCDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke;
  v169[3] = &unk_1EA5A3EE8;
  v169[4] = v170;
  v169[5] = &v177;
  v169[6] = &v174;
  v169[7] = &v171;
  C3DMeshApplySources((uint64_t)Mesh, 1, (uint64_t)v169);
  LODWORD(__p) = 0;
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v168 = 0;
  memset(&__x, 0, sizeof(__x));
  v82 = v180.__begin_;
  v83 = (char *)v180.__end_ - (char *)v180.__begin_;
  if (v180.__end_ != v180.__begin_)
  {
    std::vector<float>::__vallocate[abi:nn180100](&__x, v83 >> 2);
    v84 = __x.__end_;
    memmove(__x.__end_, v82, v83);
    __x.__end_ = &v84[v83 >> 2];
  }
  vmesh::DisplacedSubdivisionMesh::loadBaseMeshFromVectors((uint64_t)&__p, (uint64_t *)&v177, (uint64_t *)&v174, (uint64_t *)&v171, &__x);
  if (__x.__begin_)
  {
    __x.__end_ = __x.__begin_;
    operator delete(__x.__begin_);
  }
  vmesh::DisplacedSubdivisionMesh::preprocessForSCN((vmesh::DisplacedSubdivisionMesh *)&__p, v116);
  v135 = 0;
  v136 = 0;
  v137 = 0;
  v85 = (const void *)*((_QWORD *)&v141 + 1);
  v86 = v142 - *((_QWORD *)&v141 + 1);
  if ((_QWORD)v142 != *((_QWORD *)&v141 + 1))
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8nn180100Em(&v135, v86 >> 4);
    v87 = (char *)v136;
    memmove(v136, v85, v86);
    v136 = &v87[16 * (v86 >> 4)];
  }
  v132 = 0;
  v133 = 0;
  v134 = 0;
  v88 = (const void *)*((_QWORD *)&v144 + 1);
  v89 = v145 - *((_QWORD *)&v144 + 1);
  if ((_QWORD)v145 != *((_QWORD *)&v144 + 1))
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8nn180100Em(&v132, v89 >> 4);
    v90 = (char *)v133;
    memmove(v133, v88, v89);
    v133 = &v90[16 * (v89 >> 4)];
  }
  v129 = 0;
  v130 = 0;
  v131 = 0;
  v91 = (const void *)v143;
  v92 = *((_QWORD *)&v143 + 1) - v143;
  if (*((_QWORD *)&v143 + 1) != (_QWORD)v143)
  {
    std::vector<Statement *>::__vallocate[abi:nn180100](&v129, v92 >> 3);
    v93 = (char *)v130;
    memmove(v130, v91, v92);
    v130 = &v93[8 * (v92 >> 3)];
  }
  v94 = (void *)objc_msgSend(a6, "currentBlitEncoder");
  v95 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)v135, (_BYTE *)v136 - (_BYTE *)v135, v94);
  v96 = (void *)objc_msgSend(a6, "currentBlitEncoder");
  v97 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)v132, (_BYTE *)v133 - (_BYTE *)v132, v96);
  v98 = (void *)objc_msgSend(a6, "currentBlitEncoder");
  v99 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)v129, (_BYTE *)v130 - (_BYTE *)v129, v98);
  v100 = (void *)objc_msgSend(a6, "currentBlitEncoder");
  v101 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, v164, *((_QWORD *)&v164 + 1) - v164, v100);
  v102 = (void *)objc_msgSend(a6, "currentBlitEncoder");
  v103 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, v167, *((_QWORD *)&v167 + 1) - v167, v102);
  v127 = (*((_QWORD *)&v164 + 1) - (_QWORD)v164) >> 2;
  v128 = (*((_QWORD *)&v167 + 1) - (_QWORD)v167) >> 3;
  v104 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)v126, 48, (void *)objc_msgSend(a6, "currentBlitEncoder"));
  +[SCNMTLResourceManager _fillVertexDescriptor:withSemantic:inputSet:bufferIndex:vertexFormat:offset:stride:](SCNMTLResourceManager, "_fillVertexDescriptor:withSemantic:inputSet:bufferIndex:vertexFormat:offset:stride:", v81, 0, 0, 0, 30, 0, 16);
  objc_msgSend(v80, "addObject:", v95);
  +[SCNMTLResourceManager _fillVertexDescriptor:withSemantic:inputSet:bufferIndex:vertexFormat:offset:stride:](SCNMTLResourceManager, "_fillVertexDescriptor:withSemantic:inputSet:bufferIndex:vertexFormat:offset:stride:", v81, 1, 0, 1, 30, 0, 16);
  objc_msgSend(v80, "addObject:", v97);
  +[SCNMTLResourceManager _fillVertexDescriptor:withSemantic:inputSet:bufferIndex:vertexFormat:offset:stride:](SCNMTLResourceManager, "_fillVertexDescriptor:withSemantic:inputSet:bufferIndex:vertexFormat:offset:stride:", v81, 3, 0, 2, 29, 0, 8);
  objc_msgSend(v80, "addObject:", v99);
  if ((uint64_t)ElementsCount >= 1)
  {
    for (i = 0; i != ElementsCount; i = (const __CFArray *)((char *)i + 1))
    {
      v106 = (void *)objc_msgSend(*((id *)v124 + 2), "objectAtIndexedSubscript:", i);
      if (v106)
        objc_setProperty_nonatomic(v106, v107, v95, 24);
      v108 = (void *)objc_msgSend(*((id *)v124 + 2), "objectAtIndexedSubscript:", i);
      if (v108)
        objc_setProperty_nonatomic(v108, v109, v101, 56);
      v110 = (void *)objc_msgSend(*((id *)v124 + 2), "objectAtIndexedSubscript:", i);
      if (v110)
        objc_setProperty_nonatomic(v110, v111, v103, 64);
      v112 = (void *)objc_msgSend(*((id *)v124 + 2), "objectAtIndexedSubscript:", i);
      if (v112)
        objc_setProperty_nonatomic(v112, v113, v104, 80);
    }
  }

  v114 = objc_alloc_init(SCNMTLMesh);
  *((_QWORD *)v124 + 1) = v114;
  -[SCNMTLMesh setVertexDescriptor:]((uint64_t)v114, v81);
  -[SCNMTLMesh setBuffers:](*((void **)v124 + 1), (char *)v80);
  -[SCNMTLMesh setElements:](*((void **)v124 + 1), (char *)v117);

  if (v129)
  {
    v130 = v129;
    operator delete(v129);
  }
  if (v132)
  {
    v133 = v132;
    operator delete(v132);
  }
  if (v135)
  {
    v136 = v135;
    operator delete(v135);
  }
  vmesh::DisplacedSubdivisionMesh::~DisplacedSubdivisionMesh((vmesh::DisplacedSubdivisionMesh *)&__p);
  _Block_object_dispose(v170, 8);
  if (v171)
  {
    v172 = v171;
    operator delete(v171);
  }
  if (v174)
  {
    v175 = v174;
    operator delete(v174);
  }
  if (v177)
  {
    v178 = v177;
    operator delete(v177);
  }
  if (v180.__begin_)
  {
    v180.__end_ = v180.__begin_;
    operator delete(v180.__begin_);
  }
  return v124;
}

void __92__SCNGeometryVDMCDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  NSObject *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  uint64_t Content;
  float32x4_t v11;
  float v12;
  float v13;
  unsigned int v14;
  unint64_t v15;
  int v16;
  int v17;
  void **v18;
  float32x4_t *v19;
  unint64_t v20;
  _OWORD *f32;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  float32x4_t *v27;
  float32x4_t *v28;
  float32x4_t *v29;
  float32x4_t v30;
  unint64_t v31;
  int v32;
  int v33;
  void **v34;
  float32x4_t *v35;
  unint64_t v36;
  _OWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  float32x4_t *v43;
  float32x4_t *v44;
  float32x4_t *v45;
  float32x4_t v46;
  unint64_t v47;
  int v48;
  int v49;
  void **v50;
  _QWORD *v51;
  unint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;

  if (a4 <= 0)
  {
    if (C3DMeshSourceIsVolatile(a2))
    {
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __92__SCNGeometryVDMCDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_cold_1(v7);
    }
    else
    {
      Content = C3DMeshSourceGetContent(a2);
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v14;
      if (a3)
      {
        if (a3 == 3)
        {
          if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
          {
            LODWORD(v47) = 0;
            v48 = v8;
            v49 = v9;
            do
            {
              *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(v48, (float *)(Content + (v47 * v49)), v11, v12, v13);
              v50 = (void **)a1[6];
              v51 = v50[1];
              v52 = (unint64_t)v50[2];
              if ((unint64_t)v51 >= v52)
              {
                v54 = ((char *)v51 - (_BYTE *)*v50) >> 3;
                if ((unint64_t)(v54 + 1) >> 61)
                  goto LABEL_68;
                v55 = v52 - (_QWORD)*v50;
                v56 = v55 >> 2;
                if (v55 >> 2 <= (unint64_t)(v54 + 1))
                  v56 = v54 + 1;
                if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF8)
                  v57 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v57 = v56;
                if (v57)
                {
                  v65 = v11;
                  v58 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(v50 + 2), v57);
                  v11 = v65;
                }
                else
                {
                  v58 = 0;
                }
                v59 = &v58[8 * v54];
                *(_QWORD *)v59 = v11.i64[0];
                v53 = v59 + 8;
                v61 = (char *)*v50;
                v60 = (char *)v50[1];
                if (v60 != *v50)
                {
                  do
                  {
                    v62 = *((_QWORD *)v60 - 1);
                    v60 -= 8;
                    v11.i64[0] = v62;
                    *((_QWORD *)v59 - 1) = v62;
                    v59 -= 8;
                  }
                  while (v60 != v61);
                  v60 = (char *)*v50;
                }
                *v50 = v59;
                v50[1] = v53;
                v50[2] = &v58[8 * v57];
                if (v60)
                  operator delete(v60);
              }
              else
              {
                *v51 = v11.i64[0];
                v53 = v51 + 1;
              }
              v50[1] = v53;
              v47 = (v47 + 1);
            }
            while (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) > v47);
          }
        }
        else if (a3 == 1 && *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
        {
          LODWORD(v15) = 0;
          v16 = v8;
          v17 = v9;
          do
          {
            *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(v16, (float *)(Content + (v15 * v17)), v11, v12, v13);
            v18 = (void **)a1[7];
            v19 = (float32x4_t *)v18[1];
            v20 = (unint64_t)v18[2];
            if ((unint64_t)v19 >= v20)
            {
              v22 = ((char *)v19 - (_BYTE *)*v18) >> 4;
              if ((unint64_t)(v22 + 1) >> 60)
                goto LABEL_68;
              v23 = v20 - (_QWORD)*v18;
              v24 = v23 >> 3;
              if (v23 >> 3 <= (unint64_t)(v22 + 1))
                v24 = v22 + 1;
              if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0)
                v25 = 0xFFFFFFFFFFFFFFFLL;
              else
                v25 = v24;
              if (v25)
              {
                v63 = v11;
                v26 = (char *)_ZNSt3__119__allocate_at_leastB8nn180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(v18 + 2), v25);
                v11 = v63;
              }
              else
              {
                v26 = 0;
              }
              v27 = (float32x4_t *)&v26[16 * v22];
              *v27 = v11;
              f32 = (_OWORD *)v27[1].f32;
              v29 = (float32x4_t *)*v18;
              v28 = (float32x4_t *)v18[1];
              if (v28 != *v18)
              {
                do
                {
                  v30 = v28[-1];
                  --v28;
                  v11 = v30;
                  v27[-1] = v30;
                  --v27;
                }
                while (v28 != v29);
                v28 = (float32x4_t *)*v18;
              }
              *v18 = v27;
              v18[1] = f32;
              v18[2] = &v26[16 * v25];
              if (v28)
                operator delete(v28);
            }
            else
            {
              *v19 = v11;
              f32 = (_OWORD *)v19[1].f32;
            }
            v18[1] = f32;
            v15 = (v15 + 1);
          }
          while (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) > v15);
        }
      }
      else if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
      {
        LODWORD(v31) = 0;
        v32 = v8;
        v33 = v9;
        do
        {
          *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(v32, (float *)(Content + (v31 * v33)), v11, v12, v13);
          v34 = (void **)a1[5];
          v35 = (float32x4_t *)v34[1];
          v36 = (unint64_t)v34[2];
          if ((unint64_t)v35 >= v36)
          {
            v38 = ((char *)v35 - (_BYTE *)*v34) >> 4;
            if ((unint64_t)(v38 + 1) >> 60)
LABEL_68:
              abort();
            v39 = v36 - (_QWORD)*v34;
            v40 = v39 >> 3;
            if (v39 >> 3 <= (unint64_t)(v38 + 1))
              v40 = v38 + 1;
            if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF0)
              v41 = 0xFFFFFFFFFFFFFFFLL;
            else
              v41 = v40;
            if (v41)
            {
              v64 = v11;
              v42 = (char *)_ZNSt3__119__allocate_at_leastB8nn180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(v34 + 2), v41);
              v11 = v64;
            }
            else
            {
              v42 = 0;
            }
            v43 = (float32x4_t *)&v42[16 * v38];
            *v43 = v11;
            v37 = (_OWORD *)v43[1].f32;
            v45 = (float32x4_t *)*v34;
            v44 = (float32x4_t *)v34[1];
            if (v44 != *v34)
            {
              do
              {
                v46 = v44[-1];
                --v44;
                v11 = v46;
                v43[-1] = v46;
                --v43;
              }
              while (v44 != v45);
              v44 = (float32x4_t *)*v34;
            }
            *v34 = v43;
            v34[1] = v37;
            v34[2] = &v42[16 * v41];
            if (v44)
              operator delete(v44);
          }
          else
          {
            *v35 = v11;
            v37 = (_OWORD *)v35[1].f32;
          }
          v34[1] = v37;
          v31 = (v31 + 1);
        }
        while (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) > v31);
      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryVDMCDeformerInstance;
  -[SCNGeometryVDMCDeformerInstance dealloc](&v3, sel_dealloc);
}

- (id)meshForDeformedTopology
{
  return self->_subdivMesh;
}

- (unint64_t)updateWithContext:(id)a3
{
  SCNMTLComputeCommandEncoder *v5;
  _QWORD *v6;
  MTLBuffer *v7;
  MTLBuffer *v8;
  MTLBuffer *v9;
  MTLBuffer *v10;
  NSMutableArray *meshElementData;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MTLBuffer *v17;
  unint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  MTLBuffer *v26;
  unint64_t v27;
  MTLBuffer *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[200];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder](objc_msgSend(a3, "_currentRenderContext"));
  -[MTLComputeCommandEncoder pushDebugGroup:](v5->_encoder, "pushDebugGroup:", CFSTR("VDMC deformer"));
  memset(v46, 0, 192);
  if (a3)
  {
    objc_msgSend(a3, "_currentTransforms");
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
    objc_msgSend(a3, "_currentFrustumInfo");
  }
  else
  {
    v44 = 0uLL;
    v45 = 0uLL;
    v42 = 0uLL;
    v43 = 0uLL;
    v40 = 0uLL;
    v41 = 0uLL;
    v39 = 0uLL;
  }
  v38 = 1090519040;
  v6 = (_QWORD *)-[NSMutableArray objectAtIndexedSubscript:](self->_meshElementData, "objectAtIndexedSubscript:", 0);
  if (v6)
    v7 = (MTLBuffer *)v6[3];
  else
    v7 = 0;
  if (v5->_buffers[0] == v7)
  {
    if (!v5->_offsets[0])
      goto LABEL_10;
  }
  else
  {
    v5->_buffers[0] = v7;
  }
  v5->_offsets[0] = 0;
  v5->_buffersToBind[0] |= 1uLL;
LABEL_10:
  if (v6)
    v8 = (MTLBuffer *)v6[7];
  else
    v8 = 0;
  if (v5->_buffers[1] == v8)
  {
    if (!v5->_offsets[1])
      goto LABEL_16;
  }
  else
  {
    v5->_buffers[1] = v8;
  }
  v5->_offsets[1] = 0;
  v5->_buffersToBind[0] |= 2uLL;
LABEL_16:
  if (v6)
    v9 = (MTLBuffer *)v6[8];
  else
    v9 = 0;
  if (v5->_buffers[2] == v9)
  {
    if (!v5->_offsets[2])
      goto LABEL_22;
  }
  else
  {
    v5->_buffers[2] = v9;
  }
  v5->_offsets[2] = 0;
  v5->_buffersToBind[0] |= 4uLL;
LABEL_22:
  if (v6)
    v10 = (MTLBuffer *)v6[10];
  else
    v10 = 0;
  if (v5->_buffers[15] != v10)
  {
    v5->_buffers[15] = v10;
LABEL_27:
    v5->_offsets[15] = 0;
    v5->_buffersToBind[0] |= 0x8000uLL;
    goto LABEL_28;
  }
  if (v5->_offsets[15])
    goto LABEL_27;
LABEL_28:
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  meshElementData = self->_meshElementData;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](meshElementData, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (!v12)
    goto LABEL_83;
  v13 = v12;
  v14 = *(_QWORD *)v35;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v35 != v14)
        objc_enumerationMutation(meshElementData);
      v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v15);
      if (v16)
        v17 = *(MTLBuffer **)(v16 + 72);
      else
        v17 = 0;
      if (v5->_buffers[11] == v17)
      {
        if (!v5->_offsets[11])
          goto LABEL_39;
      }
      else
      {
        v5->_buffers[11] = v17;
      }
      v5->_offsets[11] = 0;
      v5->_buffersToBind[0] |= 0x800uLL;
LABEL_39:
      SCNMTLComputeCommandEncoder::setBytes(v5, &v38, 4uLL, 0xAuLL);
      SCNMTLComputeCommandEncoder::setBytes(v5, v46, 0xC0uLL, 0xDuLL);
      SCNMTLComputeCommandEncoder::setBytes(v5, &v39, 0x70uLL, 0xEuLL);
      v33 = 0;
      if (v16)
      {
        v18 = *(_QWORD *)(v16 + 104);
        if (v18)
        {
          v19 = 0;
          do
          {
            v20 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 88), "objectAtIndex:", v19), "integerValue");
            v21 = objc_msgSend(*(id *)(v16 + 40), "objectAtIndex:", v33);
            if (v5->_buffers[3] == (MTLBuffer *)v21)
            {
              if (!v5->_offsets[3])
                goto LABEL_46;
            }
            else
            {
              v5->_buffers[3] = (MTLBuffer *)v21;
            }
            v5->_offsets[3] = 0;
            v5->_buffersToBind[0] |= 8uLL;
LABEL_46:
            v22 = objc_msgSend(*(id *)(v16 + 40), "objectAtIndex:", v33 + 1);
            if (v5->_buffers[4] == (MTLBuffer *)v22)
            {
              if (!v5->_offsets[4])
                goto LABEL_50;
            }
            else
            {
              v5->_buffers[4] = (MTLBuffer *)v22;
            }
            v5->_offsets[4] = 0;
            v5->_buffersToBind[0] |= 0x10uLL;
LABEL_50:
            v23 = objc_msgSend(*(id *)(v16 + 48), "objectAtIndex:", v33);
            if (v5->_buffers[6] == (MTLBuffer *)v23)
            {
              if (!v5->_offsets[6])
                goto LABEL_54;
            }
            else
            {
              v5->_buffers[6] = (MTLBuffer *)v23;
            }
            v5->_offsets[6] = 0;
            v5->_buffersToBind[0] |= 0x40uLL;
LABEL_54:
            v24 = objc_msgSend(*(id *)(v16 + 48), "objectAtIndex:", v33 + 1);
            if (v5->_buffers[7] != (MTLBuffer *)v24)
            {
              v5->_buffers[7] = (MTLBuffer *)v24;
LABEL_57:
              v5->_offsets[7] = 0;
              v5->_buffersToBind[0] |= 0x80uLL;
              goto LABEL_58;
            }
            if (v5->_offsets[7])
              goto LABEL_57;
LABEL_58:
            SCNMTLComputeCommandEncoder::setBytes(v5, &v33, 4uLL, 0xCuLL);
            v25 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](*(_QWORD *)(v16 + 136));
            if (v5->_computePipelineState != (MTLComputePipelineState *)v25)
            {
              v5->_computePipelineState = (MTLComputePipelineState *)v25;
              -[MTLComputeCommandEncoder setComputePipelineState:](v5->_encoder, "setComputePipelineState:", v25);
            }
            SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v5, v20);
            v19 = ++v33;
            v18 = *(_QWORD *)(v16 + 104);
          }
          while (v18 > v33);
        }
        v33 = v18;
        SCNMTLComputeCommandEncoder::setBytes(v5, &v33, 4uLL, 0xCuLL);
        v26 = *(MTLBuffer **)(v16 + 72);
      }
      else
      {
        v33 = 0;
        SCNMTLComputeCommandEncoder::setBytes(v5, &v33, 4uLL, 0xCuLL);
        v26 = 0;
      }
      if (v5->_buffers[11] == v26)
      {
        if (!v5->_offsets[11])
          goto LABEL_66;
      }
      else
      {
        v5->_buffers[11] = v26;
      }
      v5->_offsets[11] = 0;
      v5->_buffersToBind[0] |= 0x800uLL;
LABEL_66:
      if (v16)
      {
        v28 = *(MTLBuffer **)(v16 + 112);
        v27 = *(_QWORD *)(v16 + 120);
      }
      else
      {
        v28 = 0;
        v27 = 0;
      }
      if (v5->_buffers[9] == v28)
      {
        if (v5->_offsets[9] == v27)
          goto LABEL_72;
      }
      else
      {
        v5->_buffers[9] = v28;
      }
      v5->_offsets[9] = v27;
      v5->_buffersToBind[0] |= 0x200uLL;
LABEL_72:
      if (v16)
        v29 = *(_QWORD *)(v16 + 144);
      else
        v29 = 0;
      v30 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](v29);
      if (v5->_computePipelineState != (MTLComputePipelineState *)v30)
      {
        v5->_computePipelineState = (MTLComputePipelineState *)v30;
        -[MTLComputeCommandEncoder setComputePipelineState:](v5->_encoder, "setComputePipelineState:", v30);
      }
      SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v5, 1);
      ++v15;
    }
    while (v15 != v13);
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](meshElementData, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    v13 = v31;
  }
  while (v31);
LABEL_83:
  -[MTLComputeCommandEncoder popDebugGroup](v5->_encoder, "popDebugGroup");
  return 1;
}

- (void)initWithNode:(NSObject *)a3 deformer:outputs:computeVertexCount:context:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DMeshElementGetType(meshElement) == kC3DMeshElementTypeTrianglesArray";
  OUTLINED_FUNCTION_0_5(&dword_1DCCB8000, (int)a2, a3, "Assertion '%s' failed. VDMC expects triangles", a1);
}

void __92__SCNGeometryVDMCDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Volatile meshes are not supported by the deformer stack", v1, 2u);
}

@end
