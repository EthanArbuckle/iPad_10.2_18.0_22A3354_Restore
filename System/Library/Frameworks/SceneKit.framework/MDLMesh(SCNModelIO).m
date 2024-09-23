@implementation MDLMesh(SCNModelIO)

+ (uint64_t)meshWithSCNGeometry:()SCNModelIO
{
  return objc_msgSend(a1, "meshWithSCNGeometry:bufferAllocator:", a3, 0);
}

+ (id)meshWithSCNGeometry:()SCNModelIO bufferAllocator:
{
  unsigned __int8 v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  int v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  int v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  int v48;
  char *v49;
  int v50;
  uint64_t v51;
  int v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  id v60;
  id v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  int v78;
  uint64_t k;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t m;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v107;
  void *v109;
  id v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id obj;
  id obja;
  id objb;
  int v118;
  int v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  unint64_t v129;
  int v130;
  void *v131;
  void *v132;
  uint64_t v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
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
  _BYTE v150[12];
  uint64_t v151;
  uint64_t v152;
  std::vector<int> v153;
  void *v154;
  char *v155;
  char *v156;
  void *v157;
  char *v158;
  char *v159;
  void *v160;
  char *v161;
  char *v162;
  void *__p;
  char *v164;
  char *v165;
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    +[SCNTransaction flush](SCNTransaction, "flush");
  v109 = a3;
  if ((v5 & 1) == 0
  {
    +[MDLMesh(SCNModelIO) meshWithSCNGeometry:bufferAllocator:]::defaultAllocator = objc_opt_new();
  }
  v6 = +[MDLMesh(SCNModelIO) meshWithSCNGeometry:bufferAllocator:]::defaultAllocator;
  if (a4)
    v6 = a4;
  v131 = (void *)v6;
  v164 = 0;
  __p = 0;
  v165 = 0;
  v161 = 0;
  v160 = 0;
  v162 = 0;
  v158 = 0;
  v157 = 0;
  v159 = 0;
  v154 = 0;
  v155 = 0;
  v156 = 0;
  v7 = objc_msgSend((id)objc_msgSend(a3, "geometrySourceChannels"), "count");
  if (v7)
  {
    v8 = 0;
    v130 = 0;
    while (v8 < objc_msgSend((id)objc_msgSend(v109, "geometrySources"), "count") && v8 < v7)
    {
      v9 = (void *)objc_msgSend((id)objc_msgSend(v109, "geometrySources"), "objectAtIndexedSubscript:", v8);
      v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "geometrySourceChannels"), "objectAtIndexedSubscript:", v8), "unsignedIntegerValue");
      if (objc_msgSend((id)objc_msgSend(v9, "semantic"), "isEqualToString:", CFSTR("kGeometrySourceSemanticVertex")))
      {
        v11 = v164;
        if (v164 >= v165)
        {
          v15 = (char *)__p;
          v16 = (v164 - (_BYTE *)__p) >> 2;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
            goto LABEL_197;
          v18 = v165 - (_BYTE *)__p;
          if ((v165 - (_BYTE *)__p) >> 1 > v17)
            v17 = v18 >> 1;
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v17;
          if (v19)
          {
            v20 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v165, v19);
            v11 = v164;
            v15 = (char *)__p;
          }
          else
          {
            v20 = 0;
          }
          v31 = &v20[4 * v16];
          *(_DWORD *)v31 = v10;
          v12 = v31 + 4;
          while (v11 != v15)
          {
            v32 = *((_DWORD *)v11 - 1);
            v11 -= 4;
            *((_DWORD *)v31 - 1) = v32;
            v31 -= 4;
          }
          __p = v31;
          v164 = v12;
          v165 = &v20[4 * v19];
          if (v15)
            operator delete(v15);
        }
        else
        {
          *(_DWORD *)v164 = v10;
          v12 = v11 + 4;
        }
        v164 = v12;
      }
      else if (objc_msgSend((id)objc_msgSend(v9, "semantic"), "isEqualToString:", CFSTR("kGeometrySourceSemanticNormal")))
      {
        v13 = v161;
        if (v161 >= v162)
        {
          v23 = (char *)v160;
          v24 = (v161 - (_BYTE *)v160) >> 2;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62)
            goto LABEL_197;
          v26 = v162 - (_BYTE *)v160;
          if ((v162 - (_BYTE *)v160) >> 1 > v25)
            v25 = v26 >> 1;
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
            v27 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v27 = v25;
          if (v27)
          {
            v28 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v162, v27);
            v13 = v161;
            v23 = (char *)v160;
          }
          else
          {
            v28 = 0;
          }
          v39 = &v28[4 * v24];
          *(_DWORD *)v39 = v10;
          v14 = v39 + 4;
          while (v13 != v23)
          {
            v40 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *((_DWORD *)v39 - 1) = v40;
            v39 -= 4;
          }
          v160 = v39;
          v161 = v14;
          v162 = &v28[4 * v27];
          if (v23)
            operator delete(v23);
        }
        else
        {
          *(_DWORD *)v161 = v10;
          v14 = v13 + 4;
        }
        v161 = v14;
      }
      else if (objc_msgSend((id)objc_msgSend(v9, "semantic"), "isEqualToString:", CFSTR("kGeometrySourceSemanticTexcoord")))
      {
        v21 = v158;
        if (v158 >= v159)
        {
          v33 = (char *)v157;
          v34 = (v158 - (_BYTE *)v157) >> 2;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62)
            goto LABEL_197;
          v36 = v159 - (_BYTE *)v157;
          if ((v159 - (_BYTE *)v157) >> 1 > v35)
            v35 = v36 >> 1;
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL)
            v37 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v37 = v35;
          if (v37)
          {
            v38 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v159, v37);
            v21 = v158;
            v33 = (char *)v157;
          }
          else
          {
            v38 = 0;
          }
          v47 = &v38[4 * v34];
          *(_DWORD *)v47 = v10;
          v22 = v47 + 4;
          while (v21 != v33)
          {
            v48 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v47 - 1) = v48;
            v47 -= 4;
          }
          v157 = v47;
          v158 = v22;
          v159 = &v38[4 * v37];
          if (v33)
            operator delete(v33);
        }
        else
        {
          *(_DWORD *)v158 = v10;
          v22 = v21 + 4;
        }
        v158 = v22;
      }
      else if (objc_msgSend((id)objc_msgSend(v9, "semantic"), "isEqualToString:", CFSTR("kGeometrySourceSemanticColor")))
      {
        v29 = v155;
        if (v155 >= v156)
        {
          v41 = (char *)v154;
          v42 = (v155 - (_BYTE *)v154) >> 2;
          v43 = v42 + 1;
          if ((unint64_t)(v42 + 1) >> 62)
LABEL_197:
            abort();
          v44 = v156 - (_BYTE *)v154;
          if ((v156 - (_BYTE *)v154) >> 1 > v43)
            v43 = v44 >> 1;
          if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFFCLL)
            v45 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v45 = v43;
          if (v45)
          {
            v46 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v156, v45);
            v41 = (char *)v154;
            v29 = v155;
          }
          else
          {
            v46 = 0;
          }
          v49 = &v46[4 * v42];
          *(_DWORD *)v49 = v10;
          v30 = v49 + 4;
          while (v29 != v41)
          {
            v50 = *((_DWORD *)v29 - 1);
            v29 -= 4;
            *((_DWORD *)v49 - 1) = v50;
            v49 -= 4;
          }
          v154 = v49;
          v155 = v30;
          v156 = &v46[4 * v45];
          if (v41)
            operator delete(v41);
        }
        else
        {
          *(_DWORD *)v155 = v10;
          v30 = v29 + 4;
        }
        v155 = v30;
      }
      if (!(v10 | v130))
        v130 = objc_msgSend(v9, "vectorCount");
      ++v8;
    }
    if (v164 == __p)
    {
LABEL_88:
      v53 = 0;
      goto LABEL_188;
    }
  }
  else
  {
    v51 = objc_msgSend((id)objc_msgSend(a3, "geometrySources"), "indexOfObjectPassingTest:", &__block_literal_global_6);
    v52 = v51;
    if (v51 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_88;
    v54 = (v164 - (_BYTE *)__p) >> 2;
    v55 = v54 + 1;
    if ((unint64_t)(v54 + 1) >> 62)
      abort();
    v56 = v165 - (_BYTE *)__p;
    if ((v165 - (_BYTE *)__p) >> 1 > v55)
      v55 = v56 >> 1;
    if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL)
      v57 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v57 = v55;
    if (v57)
      v58 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v165, v57);
    else
      v58 = 0;
    v59 = &v58[4 * v54];
    *(_DWORD *)v59 = v52;
    __p = v59;
    v165 = &v58[4 * v57];
    v130 = 0;
    v164 = v59 + 4;
  }
  v60 = objc_alloc_init(MEMORY[0x1E0CC7838]);
  v132 = (void *)objc_opt_new();
  obj = (id)objc_msgSend(v109, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticVertex"));
  v128 = objc_msgSend((id)objc_msgSend(obj, "objectAtIndexedSubscript:", 0), "vectorCount");
  memset(&v153, 0, sizeof(v153));
  *(_DWORD *)&v150[8] = 0;
  v151 = 0;
  v152 = 0;
  *(_QWORD *)v150 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "geometryElements"), "objectAtIndexedSubscript:", 0), "indicesChannelCount");
  v61 = uniqueIndexBufferWithSCNGeometryElements((void *)objc_msgSend(v109, "geometryElements"), v130, &v153, (char **)&v150[4], v150);
  v133 = objc_msgSend(v61, "count");
  if (v133)
  {
    v128 = v130 + (((v151 - *(_QWORD *)&v150[4]) >> 2) / (unint64_t)(*(int *)v150 + 1));
    v129 = ((v151 - *(_QWORD *)&v150[4]) >> 2) / (unint64_t)(*(int *)v150 + 1);
  }
  else
  {
    LODWORD(v129) = 0;
  }
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v169, 16);
  v107 = v61;
  v63 = 0;
  if (v62)
  {
    v64 = 0;
    v124 = *(_QWORD *)v147;
    v65 = *MEMORY[0x1E0CC7760];
    v118 = *(_DWORD *)v150;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v147 != v124)
          objc_enumerationMutation(obj);
        v67 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
        v68 = v65;
        if ((_DWORD)v64)
          v68 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("blendShape%d"), v64);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v63), "setName:", v68);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v63), "setFormat:", 786435);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v63), "setBufferIndex:", v63);
        if (v133)
        {
          v69 = (void *)objc_msgSend(v131, "newBuffer:type:", 12 * v128, 1);
          remapVertexAttributeBuffer(v67, *((_DWORD *)__p + (int)v64), &v153, &v150[4], v118, v130, v129, (char *)objc_msgSend((id)objc_msgSend(v69, "map"), "bytes"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v63), "setOffset:", 0);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "layouts"), "objectAtIndexedSubscript:", v63), "setStride:", 12);
        }
        else
        {
          if (objc_msgSend(v67, "vectorCount") != v128)
            continue;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v63), "setOffset:", objc_msgSend(v67, "dataOffset"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "layouts"), "objectAtIndexedSubscript:", v63), "setStride:", objc_msgSend(v67, "dataStride"));
          v69 = (void *)objc_msgSend(v131, "newBufferWithData:type:", objc_msgSend(v67, "data"), 1);
        }
        objc_msgSend(v132, "addObject:", v69);

        ++v63;
        v64 = (v64 + 1);
      }
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v169, 16);
    }
    while (v62);
  }
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  obja = (id)objc_msgSend(v109, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticNormal"));
  v70 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v142, v168, 16);
  if (v70)
  {
    v71 = 0;
    v125 = *(_QWORD *)v143;
    v72 = *MEMORY[0x1E0CC7750];
    v119 = *(_DWORD *)v150;
    do
    {
      for (j = 0; j != v70; ++j)
      {
        if (*(_QWORD *)v143 != v125)
          objc_enumerationMutation(obja);
        v74 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * j);
        v75 = v72;
        if ((_DWORD)v71)
          v75 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("normal%d"), v71);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v63), "setName:", v75);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v63), "setFormat:", 786435);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v63), "setBufferIndex:", v63);
        if (v133)
        {
          v76 = (void *)objc_msgSend(v131, "newBuffer:type:", 12 * v128, 1);
          remapVertexAttributeBuffer(v74, *((_DWORD *)v160 + (int)v71), &v153, &v150[4], v119, v130, v129, (char *)objc_msgSend((id)objc_msgSend(v76, "map"), "bytes"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v63), "setOffset:", 0);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "layouts"), "objectAtIndexedSubscript:", v63), "setStride:", 12);
        }
        else
        {
          if (objc_msgSend(v74, "vectorCount") != v128)
            continue;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v63), "setOffset:", objc_msgSend(v74, "dataOffset"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "layouts"), "objectAtIndexedSubscript:", v63), "setStride:", objc_msgSend(v74, "dataStride"));
          v76 = (void *)objc_msgSend(v131, "newBufferWithData:type:", objc_msgSend(v74, "data"), 1);
        }
        objc_msgSend(v132, "addObject:", v76);

        ++v63;
        v71 = (v71 + 1);
      }
      v70 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v142, v168, 16);
    }
    while (v70);
  }
  if (objc_msgSend(v109, "firstMaterial")
    && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "firstMaterial"), "multiply"), "contents"),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "firstMaterial"), "multiply"), "contents"),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v122 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "firstMaterial"), "multiply"), "mappingChannel");
  }
  else
  {
    v122 = -1;
  }
  if (objc_msgSend(v109, "firstMaterial")
    && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "firstMaterial"), "selfIllumination"), "contents"),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "firstMaterial"), "selfIllumination"), "contents"),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v120 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "firstMaterial"), "selfIllumination"), "mappingChannel");
  }
  else
  {
    v120 = -1;
  }
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v110 = (id)objc_msgSend(v109, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticTexcoord"));
  v126 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v138, v167, 16);
  if (!v126)
  {
    v78 = v63;
    goto LABEL_164;
  }
  v77 = 0;
  objb = *(id *)v139;
  v114 = *MEMORY[0x1E0CC7770];
  v113 = *MEMORY[0x1E0CC7718];
  v112 = *MEMORY[0x1E0CC7748];
  v111 = *(_DWORD *)v150;
  v78 = v63;
  do
  {
    for (k = 0; k != v126; ++k)
    {
      if (*(id *)v139 != objb)
        objc_enumerationMutation(v110);
      v80 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * k);
      v81 = v114;
      if ((_DWORD)v77)
        v81 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("textureCoordinate%d"), v77);
      v82 = v113;
      if (v122 != (int)v77)
        v82 = v81;
      if (v120 == (int)v77)
        v83 = v112;
      else
        v83 = v82;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v78), "setName:", v83);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v78), "setFormat:", 786434);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v78), "setBufferIndex:", v78);
      if (v133)
      {
        v84 = (void *)objc_msgSend(v131, "newBuffer:type:", 8 * v128, 1);
        remapVertexAttributeBuffer(v80, *((_DWORD *)v157 + (int)v77), &v153, &v150[4], v111, v130, v129, (char *)objc_msgSend((id)objc_msgSend(v84, "map"), "bytes"));
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v78), "setOffset:", 0);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "layouts"), "objectAtIndexedSubscript:", v78), "setStride:", 8);
      }
      else
      {
        if (objc_msgSend(v80, "vectorCount") != v128)
          continue;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v78), "setOffset:", objc_msgSend(v80, "dataOffset"));
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "layouts"), "objectAtIndexedSubscript:", v78), "setStride:", objc_msgSend(v80, "dataStride"));
        v84 = (void *)objc_msgSend(v131, "newBufferWithData:type:", objc_msgSend(v80, "data"), 1);
      }
      if ((C3DWasLinkedBeforeMajorOSYear2018() & 1) == 0 && objc_msgSend((id)objc_msgSend(v84, "map"), "bytes"))
      {
        v85 = (void *)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v78);
        flip_UVs((MDLVertexFormat)objc_msgSend(v85, "format"), (char *)objc_msgSend((id)objc_msgSend(v84, "map"), "bytes"), objc_msgSend(v85, "offset"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v85, "bufferIndex")), "stride"), v128);
      }
      objc_msgSend(v132, "addObject:", v84);

      ++v78;
      v77 = (v77 + 1);
    }
    v126 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v138, v167, 16);
  }
  while (v126);
LABEL_164:
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v121 = (id)objc_msgSend(v109, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticColor"));
  v86 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v134, v166, 16);
  if (v86)
  {
    LODWORD(v87) = 0;
    v127 = *(_QWORD *)v135;
    v88 = *MEMORY[0x1E0CC7730];
    v123 = *(_DWORD *)v150;
    v89 = v78;
    do
    {
      v90 = 0;
      v91 = v89;
      v87 = (int)v87;
      do
      {
        if (*(_QWORD *)v135 != v127)
          objc_enumerationMutation(v121);
        v92 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v90);
        v93 = v88;
        if (v87)
          v93 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("color%d"), v87);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v91 + v90), "setName:", v93);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v91 + v90), "setFormat:", objc_msgSend(v92, "componentsPerVector") | 0xC0000);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v91 + v90), "setBufferIndex:", v91 + v90);
        if (v133)
        {
          v94 = (void *)objc_msgSend(v131, "newBuffer:type:", objc_msgSend(v92, "dataStride") * v128, 1);
          remapVertexAttributeBuffer(v92, *((_DWORD *)v154 + v87), &v153, &v150[4], v123, v130, v129, (char *)objc_msgSend((id)objc_msgSend(v94, "map"), "bytes"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v91 + v90), "setOffset:", 0);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "layouts"), "objectAtIndexedSubscript:", v91 + v90), "setStride:", objc_msgSend(v92, "dataStride"));
        }
        else
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "attributes"), "objectAtIndexedSubscript:", v91 + v90), "setOffset:", objc_msgSend(v92, "dataOffset"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v60, "layouts"), "objectAtIndexedSubscript:", v91 + v90), "setStride:", objc_msgSend(v92, "dataStride"));
          v94 = (void *)objc_msgSend(v131, "newBufferWithData:type:", objc_msgSend(v92, "data"), 1);
        }
        objc_msgSend(v132, "addObject:", v94);

        ++v87;
        ++v90;
      }
      while (v86 != v90);
      v86 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v134, v166, 16);
      v89 = v91 + v90;
    }
    while (v86);
  }
  v153.__end_ = v153.__begin_;
  v151 = *(_QWORD *)&v150[4];
  v95 = (void *)objc_opt_new();
  v96 = objc_msgSend(v109, "geometryElementCount");
  v97 = objc_msgSend((id)objc_msgSend(v109, "materials"), "count");
  if (v96)
  {
    v98 = v97;
    for (m = 0; m != v96; ++m)
    {
      v100 = objc_msgSend(v109, "geometryElementAtIndex:", m);
      if (v133)
        v101 = objc_msgSend(MEMORY[0x1E0CC77F8], "submeshWithUniquedIndexData:andSCNGeometryElement:bufferAllocator:", objc_msgSend(v107, "objectAtIndexedSubscript:", m), v100, a4);
      else
        v101 = objc_msgSend(MEMORY[0x1E0CC77F8], "submeshWithSCNGeometryElement:bufferAllocator:positionSourceChannel:", v100, a4, *(int *)__p);
      v102 = (void *)v101;
      objc_msgSend(v95, "addObject:", v101);
      if (v98)
      {
        v103 = objc_msgSend((id)objc_msgSend(v109, "materials"), "objectAtIndexedSubscript:", m % v98);
        objc_msgSend(v102, "setMaterial:", objc_msgSend(MEMORY[0x1E0CC77A0], "materialWithSCNMaterial:", v103));
      }
    }
  }
  v104 = (void *)objc_msgSend([a1 alloc], "initWithVertexBuffers:vertexCount:descriptor:submeshes:", v132, v128, v60, v95);

  objc_msgSend(v104, "setName:", objc_msgSend(v109, "name"));
  objc_setAssociatedObject(v104, CFSTR("SCNSceneKitAssociatedObject"), v109, (void *)0x301);
  v53 = v104;
  if (*(_QWORD *)&v150[4])
  {
    v151 = *(_QWORD *)&v150[4];
    operator delete(*(void **)&v150[4]);
  }
  if (v153.__begin_)
  {
    v153.__end_ = v153.__begin_;
    operator delete(v153.__begin_);
  }
LABEL_188:
  if (v154)
  {
    v155 = (char *)v154;
    operator delete(v154);
  }
  if (v157)
  {
    v158 = (char *)v157;
    operator delete(v157);
  }
  if (v160)
  {
    v161 = (char *)v160;
    operator delete(v160);
  }
  if (__p)
  {
    v164 = (char *)__p;
    operator delete(__p);
  }
  return v53;
}

@end
