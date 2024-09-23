@implementation BVHDescriptor

- (BVHDescriptor)initWithDescriptor:(id)a3
{
  char *v3;
  unsigned __int8 v4;
  _QWORD *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  BOOL v17;
  char v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  int v25;
  int v26;
  void *v27;
  unsigned int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  BOOL v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  uint64_t v48;
  BOOL v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  int v58;
  int v59;
  int v60;
  void *v61;
  uint64_t v62;
  BOOL v63;
  char v64;
  unsigned int v65;
  unsigned int v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  unsigned int v76;
  uint64_t v77;
  unint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t ii;
  void *v83;
  unsigned int v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v88;
  uint64_t v89;
  id obj;
  id obja;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  objc_super v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v118.receiver = self;
  v118.super_class = (Class)BVHDescriptor;
  v3 = -[BVHDescriptor init](&v118, sel_init);
  if (!v3)
    return (BVHDescriptor *)v3;
  if ((v4 & 1) == 0
  {
    -[BVHDescriptor initWithDescriptor:]::defaultMinOverlap = 925353388;
  }
  *((_QWORD *)v3 + 26) = 0;
  v5 = v3 + 208;
  *((_QWORD *)v3 + 22) = 0;
  *((_QWORD *)v3 + 23) = 0;
  *((_QWORD *)v3 + 21) = 32;
  *(_QWORD *)(v3 + 140) = 0x4000000000000003;
  *((_DWORD *)v3 + 37) = -[BVHDescriptor initWithDescriptor:]::defaultMinOverlap;
  *(_OWORD *)(v3 + 88) = xmmword_232D73A20;
  *((_QWORD *)v3 + 13) = 0x3FA000003F800000;
  *((_WORD *)v3 + 42) = 257;
  *((_QWORD *)v3 + 3) = 0;
  *((_QWORD *)v3 + 4) = 0;
  *((_QWORD *)v3 + 16) = 0;
  *((_QWORD *)v3 + 27) = 0;
  *((_QWORD *)v3 + 28) = 0;
  v3[86] = 1;
  *((_DWORD *)v3 + 20) = 256;
  *((_OWORD *)v3 + 7) = xmmword_232D73A30;
  *((_QWORD *)v3 + 5) = 0;
  *((int64x2_t *)v3 + 12) = vdupq_n_s64(1uLL);
  *(_OWORD *)(v3 + 152) = xmmword_232D73A40;
  *(int64x2_t *)(v3 + 8) = vdupq_n_s64(0x20uLL);
  v6 = (void *)objc_opt_class();
  if (objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()))
  {
    *((_QWORD *)v3 + 24) = objc_msgSend(a3, "motionKeyframeCount");
    objc_msgSend(a3, "motionStartTime");
    *((_DWORD *)v3 + 25) = v7;
    objc_msgSend(a3, "motionEndTime");
    *((_DWORD *)v3 + 26) = v8;
    v3[82] = *((_QWORD *)v3 + 24) > 1uLL;
    v9 = (void *)objc_msgSend(a3, "geometryDescriptors");
    v10 = objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count");
    *((_QWORD *)v3 + 5) = v10;
    if (!v10)
      return (BVHDescriptor *)v3;
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_opt_class();
    if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
    {
      *((_QWORD *)v3 + 16) = 0;
      v114 = 0u;
      v115 = 0u;
      v116 = 0u;
      v117 = 0u;
      obj = (id)objc_msgSend(a3, "geometryDescriptors");
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
      if (v12)
      {
        v13 = 0;
        v14 = *(_QWORD *)v115;
        v93 = 0;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v115 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
            if (*((_QWORD *)v3 + 24) != 1)
            {
              v88 = *((_QWORD *)v3 + 24);
              MTLReportFailure();
            }
            if (objc_msgSend(v16, "indexBuffer", v88))
              v17 = v3[85] == 0;
            else
              v17 = 1;
            v18 = !v17;
            v3[85] = v18;
            v19 = objc_msgSend(v16, "triangleCount");
            v20 = v19;
            v21 = v19;
            v22 = *((_QWORD *)v3 + 27);
            if (v19 > v22)
              v22 = v19;
            *((_QWORD *)v3 + 27) = v22;
            if (objc_msgSend(v16, "primitiveDataElementSize"))
              v93 += (objc_msgSend(v16, "primitiveDataElementSize") * v21 + 255) & 0xFFFFFFFFFFFFFF00;
            if (v3[81] && (objc_msgSend(v16, "allowDuplicateIntersectionFunctionInvocation") & 1) == 0)
              v3[81] = 0;
            objc_msgSend(v16, "triangleCount");
            if (objc_msgSend(v16, "indexType"))
              v23 = 4;
            else
              v23 = 2;
            if (!objc_msgSend(v16, "indexBuffer"))
            {
              v24 = objc_msgSend(v16, "maxVertexIndex");
              v25 = 4;
              if (HIDWORD(v24))
                v25 = 8;
              v26 = 3;
              if (v24 >> 24)
                v26 = v25;
              if (v24 < 0x10000)
                v26 = 2;
              if (v24 >= 0x100)
                v23 = v26;
              else
                v23 = 1;
            }
            v13 += v21;
            *v5 += (4 * v20 * v23 + 31) & 0x1FFFFFFE0;
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
        }
        while (v12);
        goto LABEL_173;
      }
    }
    else
    {
      v31 = (void *)objc_opt_class();
      if (objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()))
      {
        *((_DWORD *)v3 + 32) = 2;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        v113 = 0u;
        v32 = (void *)objc_msgSend(a3, "geometryDescriptors");
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
        if (v33)
        {
          v93 = 0;
          v13 = 0;
          v34 = *(_QWORD *)v111;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v111 != v34)
                objc_enumerationMutation(v32);
              v36 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
              if (*((_QWORD *)v3 + 24) != 1)
              {
                v88 = *((_QWORD *)v3 + 24);
                MTLReportFailure();
              }
              if (objc_msgSend(v36, "indexBuffer", v88))
                v37 = v3[85] == 0;
              else
                v37 = 1;
              v38 = !v37;
              v3[85] = v38;
              v39 = objc_msgSend(v36, "segmentCount");
              v40 = v39;
              v41 = *((_QWORD *)v3 + 27);
              if (v39 > v41)
                v41 = v39;
              *((_QWORD *)v3 + 27) = v41;
              if (objc_msgSend(v36, "primitiveDataElementSize"))
                v93 += (objc_msgSend(v36, "primitiveDataElementSize") * v40 + 255) & 0xFFFFFFFFFFFFFF00;
              if (v3[81] && (objc_msgSend(v36, "allowDuplicateIntersectionFunctionInvocation") & 1) == 0)
                v3[81] = 0;
              v13 += v40;
            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
          }
          while (v33);
          goto LABEL_173;
        }
      }
      else
      {
        v42 = (void *)objc_opt_class();
        if (objc_msgSend(v42, "isSubclassOfClass:", objc_opt_class()))
        {
          *((_DWORD *)v3 + 32) = 5;
          *((int64x2_t *)v3 + 10) = vdupq_n_s64(1uLL);
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          v109 = 0u;
          v43 = (void *)objc_msgSend(a3, "geometryDescriptors");
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
          if (v44)
          {
            v93 = 0;
            v13 = 0;
            v45 = *(_QWORD *)v107;
            do
            {
              for (k = 0; k != v44; ++k)
              {
                if (*(_QWORD *)v107 != v45)
                  objc_enumerationMutation(v43);
                v47 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * k);
                v48 = *((_QWORD *)v3 + 24);
                if (v48 != objc_msgSend((id)objc_msgSend(v47, "controlPointBuffers"), "count"))
                {
                  v88 = *((_QWORD *)v3 + 24);
                  v89 = objc_msgSend((id)objc_msgSend(v47, "controlPointBuffers"), "count");
                  MTLReportFailure();
                }
                if (objc_msgSend(v47, "indexBuffer", v88, v89))
                  v49 = v3[85] == 0;
                else
                  v49 = 1;
                v50 = !v49;
                v3[85] = v50;
                v51 = objc_msgSend(v47, "segmentCount");
                v52 = v51;
                v53 = *((_QWORD *)v3 + 27);
                if (v51 > v53)
                  v53 = v51;
                *((_QWORD *)v3 + 27) = v53;
                if (objc_msgSend(v47, "primitiveDataElementSize"))
                  v93 += (objc_msgSend(v47, "primitiveDataElementSize") * v52 + 255) & 0xFFFFFFFFFFFFFF00;
                if (v3[81] && (objc_msgSend(v47, "allowDuplicateIntersectionFunctionInvocation") & 1) == 0)
                  v3[81] = 0;
                v13 += v52;
              }
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
            }
            while (v44);
            goto LABEL_173;
          }
        }
        else
        {
          v54 = (void *)objc_opt_class();
          if (objc_msgSend(v54, "isSubclassOfClass:", objc_opt_class()))
          {
            *((_DWORD *)v3 + 32) = 3;
            v102 = 0u;
            v103 = 0u;
            v104 = 0u;
            v105 = 0u;
            obja = (id)objc_msgSend(a3, "geometryDescriptors");
            v55 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
            if (v55)
            {
              v13 = 0;
              v56 = *(_QWORD *)v103;
              v93 = 0;
              do
              {
                for (m = 0; m != v55; ++m)
                {
                  if (*(_QWORD *)v103 != v56)
                    objc_enumerationMutation(obja);
                  v61 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * m);
                  v62 = *((_QWORD *)v3 + 24);
                  if (v62 != objc_msgSend((id)objc_msgSend(v61, "vertexBuffers"), "count"))
                  {
                    v88 = *((_QWORD *)v3 + 24);
                    v89 = objc_msgSend((id)objc_msgSend(v61, "vertexBuffers"), "count");
                    MTLReportFailure();
                  }
                  if (objc_msgSend(v61, "indexBuffer", v88, v89))
                    v63 = v3[85] == 0;
                  else
                    v63 = 1;
                  v64 = !v63;
                  v3[85] = v64;
                  v65 = objc_msgSend(v61, "triangleCount");
                  v66 = v65;
                  v67 = v65;
                  v68 = *((_QWORD *)v3 + 27);
                  if (v65 > v68)
                    v68 = v65;
                  *((_QWORD *)v3 + 27) = v68;
                  if (objc_msgSend(v61, "primitiveDataElementSize"))
                    v93 += (objc_msgSend(v61, "primitiveDataElementSize") * v67 + 255) & 0xFFFFFFFFFFFFFF00;
                  if (v3[81] && (objc_msgSend(v61, "allowDuplicateIntersectionFunctionInvocation") & 1) == 0)
                    v3[81] = 0;
                  objc_msgSend(v61, "triangleCount");
                  if (objc_msgSend(v61, "indexType"))
                    v60 = 4;
                  else
                    v60 = 2;
                  if (!objc_msgSend(v61, "indexBuffer"))
                  {
                    v69 = objc_msgSend(v61, "maxVertexIndex");
                    v58 = 4;
                    if (HIDWORD(v69))
                      v58 = 8;
                    v59 = 3;
                    if (v69 >> 24)
                      v59 = v58;
                    if (v69 < 0x10000)
                      v59 = 2;
                    if (v69 >= 0x100)
                      v60 = v59;
                    else
                      v60 = 1;
                  }
                  v13 += v67;
                  *v5 += (4 * v66 * v60 + 31) & 0x1FFFFFFE0;
                }
                v55 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
              }
              while (v55);
              goto LABEL_173;
            }
          }
          else
          {
            v70 = (void *)objc_opt_class();
            if (objc_msgSend(v70, "isSubclassOfClass:", objc_opt_class()))
            {
              *((_DWORD *)v3 + 32) = 4;
              *((int64x2_t *)v3 + 10) = vdupq_n_s64(1uLL);
              v3[85] = 0;
              v98 = 0u;
              v99 = 0u;
              v100 = 0u;
              v101 = 0u;
              v71 = (void *)objc_msgSend(a3, "geometryDescriptors");
              v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
              if (v72)
              {
                v93 = 0;
                v13 = 0;
                v73 = *(_QWORD *)v99;
                do
                {
                  for (n = 0; n != v72; ++n)
                  {
                    if (*(_QWORD *)v99 != v73)
                      objc_enumerationMutation(v71);
                    v75 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * n);
                    v76 = objc_msgSend(v75, "boundingBoxCount");
                    v77 = v76;
                    v78 = *((_QWORD *)v3 + 27);
                    if (v76 > v78)
                      v78 = v76;
                    *((_QWORD *)v3 + 27) = v78;
                    if (objc_msgSend(v75, "primitiveDataElementSize"))
                      v93 += (objc_msgSend(v75, "primitiveDataElementSize") * v77 + 255) & 0xFFFFFFFFFFFFFF00;
                    if (v3[81] && (objc_msgSend(v75, "allowDuplicateIntersectionFunctionInvocation") & 1) == 0)
                      v3[81] = 0;
                    v13 += v77;
                  }
                  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
                }
                while (v72);
                goto LABEL_173;
              }
            }
            else
            {
              *((_DWORD *)v3 + 32) = 1;
              *((int64x2_t *)v3 + 10) = vdupq_n_s64(1uLL);
              v3[85] = 0;
              v94 = 0u;
              v95 = 0u;
              v96 = 0u;
              v97 = 0u;
              v79 = (void *)objc_msgSend(a3, "geometryDescriptors");
              v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
              if (v80)
              {
                v93 = 0;
                v13 = 0;
                v81 = *(_QWORD *)v95;
                do
                {
                  for (ii = 0; ii != v80; ++ii)
                  {
                    if (*(_QWORD *)v95 != v81)
                      objc_enumerationMutation(v79);
                    v83 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * ii);
                    if (*((_QWORD *)v3 + 24) != 1)
                    {
                      v88 = *((_QWORD *)v3 + 24);
                      MTLReportFailure();
                    }
                    v84 = objc_msgSend(v83, "boundingBoxCount", v88);
                    v85 = v84;
                    v86 = *((_QWORD *)v3 + 27);
                    if (v84 > v86)
                      v86 = v84;
                    *((_QWORD *)v3 + 27) = v86;
                    if (objc_msgSend(v83, "primitiveDataElementSize"))
                      v93 += (objc_msgSend(v83, "primitiveDataElementSize") * v85 + 255) & 0xFFFFFFFFFFFFFF00;
                    if (v3[81] && (objc_msgSend(v83, "allowDuplicateIntersectionFunctionInvocation") & 1) == 0)
                      v3[81] = 0;
                    v13 += v85;
                  }
                  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
                }
                while (v80);
                goto LABEL_173;
              }
            }
          }
        }
      }
    }
    goto LABEL_172;
  }
  v27 = (void *)objc_opt_class();
  if (objc_msgSend(v27, "isSubclassOfClass:", objc_opt_class()))
  {
    *((_DWORD *)v3 + 32) = 6;
    *((int64x2_t *)v3 + 10) = vdupq_n_s64(1uLL);
    v3[85] = 0;
    *((_QWORD *)v3 + 5) = 1;
    if (objc_msgSend(a3, "instanceDescriptorType") == 2 || objc_msgSend(a3, "instanceDescriptorType") == 4)
      v3[82] = 1;
    v28 = objc_msgSend(a3, "instanceCount");
  }
  else
  {
    v29 = (void *)objc_opt_class();
    if (!objc_msgSend(v29, "isSubclassOfClass:", objc_opt_class()))
    {
LABEL_172:
      v93 = 0;
      v13 = 0;
      goto LABEL_173;
    }
    *((_DWORD *)v3 + 32) = 7;
    *((int64x2_t *)v3 + 10) = vdupq_n_s64(1uLL);
    v3[85] = 0;
    *((_QWORD *)v3 + 5) = 1;
    v3[82] = objc_msgSend(a3, "instanceDescriptorType") == 4;
    v28 = objc_msgSend(a3, "maxInstanceCount");
  }
  v93 = 0;
  v13 = v28;
  *((_QWORD *)v3 + 27) = v28;
  if (v3[82])
    v30 = 56;
  else
    v30 = 24;
  *((_DWORD *)v3 + 29) = -1;
  *((_DWORD *)v3 + 30) = v30;
LABEL_173:
  *((_QWORD *)v3 + 6) = a3;
  if (!v3[81]
    || v3[82]
    || *((_DWORD *)v3 + 32)
    || (*(_QWORD *)(v3 + 140) = 0x4000000000000003, (objc_msgSend(v3, "useSpatialSplits") & 1) == 0))
  {
    *(_QWORD *)(v3 + 140) = 0x3F80000000000002;
  }
  *((_QWORD *)v3 + 3) = v13;
  objc_msgSend(v3, "updateMaxDepth");
  *((_QWORD *)v3 + 4) = v93;
  return (BVHDescriptor *)v3;
}

- (BOOL)useParallelWideBuild
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  _BYTE *v5;
  int v7;

  if ((v3 & 1) == 0
  {
    -[BVHDescriptor useParallelWideBuild]::forceEnableParallelWideBuild = 0;
  }
  if (self->_motion
    && (-[MTLAccelerationStructureDescriptor usage](self->_mtlDescriptor, "usage") & 2) == 0
    && !-[BVHDescriptor useParallelWideBuild]::forceEnableParallelWideBuild
    || self->_branchingFactor < 3)
  {
    return 0;
  }
  v5 = &unk_255FF8000;
  if ((v4 & 1) == 0)
  {
    v5 = &unk_255FF8000;
    if (v7)
    {
      -[BVHDescriptor isDeterministic]::forceDeterministic = 0;
      v5 = (_BYTE *)&unk_255FF8000;
    }
  }
  return !v5[2040] && (-[MTLAccelerationStructureDescriptor usage](self->_mtlDescriptor, "usage") & 8) == 0;
}

- (BOOL)useSpatialSplits
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  unint64_t v5;
  BOOL result;

  if ((v3 & 1) == 0
  {
    -[BVHDescriptor useSpatialSplits]::disableSpatialSplits = 0;
  }
  if ((v4 & 1) == 0
  {
    -[BVHDescriptor useSpatialSplits]::enableFastBuildSpatialSplits = 0;
  }
  v5 = -[BVHDescriptor buildAlgorithm](self, "buildAlgorithm");
  result = 0;
  if (!v5 && !-[BVHDescriptor useSpatialSplits]::disableSpatialSplits)
    return (!self || !self->_motion)
        && self->_multipleIntersectionsAllowed
        && (-[MTLAccelerationStructureDescriptor usage](self->_mtlDescriptor, "usage") & 1) == 0
        && ((-[MTLAccelerationStructureDescriptor usage](self->_mtlDescriptor, "usage") & 2) == 0
         || -[BVHDescriptor useSpatialSplits]::enableFastBuildSpatialSplits)
        && self->_geometryCount
        && !self->_primitiveType
        && self->_splitHeuristic == 3;
  return result;
}

- (PipelineKey)cachedPipelineKey
{
  *retstr = *(PipelineKey *)((char *)self + 56);
  return self;
}

- (void)updatePipelineKey
{
  BOOL v3;
  unsigned __int8 v4;
  _BYTE *v5;
  unint64_t v6;
  unint64_t primitiveKeyframeCount;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64x2_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  unint64_t v17;
  unint64_t geometryCount;
  unint64_t fragmentCount;
  uint64_t v20;
  unsigned int childIndexStride;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  int vertexFormat;
  unsigned int polygonType;
  BOOL allGeometryColumnMajor;
  unsigned __int8 v29;
  _BYTE *v30;
  char v31;
  unint64_t v32;
  int v33;
  int v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char v40;
  int v41;
  unsigned int v42;
  BOOL v43;

  v3 = -[BVHDescriptor useParallelWideBuild](self, "useParallelWideBuild");
  if (self)
  {
    v5 = &unk_255FF8000;
    if ((v4 & 1) == 0)
    {
      v5 = &unk_255FF8000;
      if (v33)
      {
        -[BVHDescriptor isDeterministic]::forceDeterministic = 0;
        v5 = (_BYTE *)&unk_255FF8000;
      }
    }
    if (v5[2040])
      LODWORD(v6) = 1;
    else
      v6 = (-[MTLAccelerationStructureDescriptor usage](self->_mtlDescriptor, "usage") >> 3) & 1;
  }
  else
  {
    LODWORD(v6) = 0;
  }
  primitiveKeyframeCount = self->_primitiveKeyframeCount;
  v8 = primitiveKeyframeCount > 1;
  v9 = v8 << 41;
  if (!self->_useTemporalSplits)
    v9 = 0;
  v10 = (_DWORD)v6 == 0;
  v11 = 0x80000000000;
  if (!v10)
    v11 = 0;
  v12 = 0x10008000000;
  if (!v10)
    v12 = 0x110008000000;
  v13.i64[0] = self->_maxPrimitivesPerInnerNode;
  v13.i64[1] = self->_branchingFactor;
  v14 = vandq_s8((int8x16_t)vshlq_u64(*(uint64x2_t *)&self->_minPrimitivesPerLeaf, (uint64x2_t)xmmword_232D73A60), (int8x16_t)xmmword_232D73A70);
  v15 = vandq_s8((int8x16_t)vshlq_u64(v13, (uint64x2_t)xmmword_232D73A50), (int8x16_t)xmmword_232D73A80);
  if (!v3 || self->_branchingFactor <= 2)
    v11 = 0;
  v16 = vorrq_s8(v14, v15);
  v17 = *(_QWORD *)&vorr_s8(*(int8x8_t *)v16.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL)) | v12 | v11 | (v8 << 24) | ((unint64_t)self->_motion << 25) | ((unint64_t)self->_disallowMixingTemporalSplitsAndLeafNodes << 42) | v9;
  if (self->_useTemporalSplits)
    v17 = v17 & 0x87FFFFFFFFFFFFFFLL | ((self->_maxSubKeyframeTemporalSplits & 0xF) << 59);
  geometryCount = self->_geometryCount;
  fragmentCount = self->_fragmentCount;
  if (fragmentCount >= 0x100)
  {
    if (fragmentCount >= 0x10000)
    {
      if (fragmentCount >> 24)
      {
        v20 = 0x4000000000000;
        if (!HIDWORD(fragmentCount))
          v20 = 0x2000000000000;
        if (geometryCount < 0x100)
        {
LABEL_18:
          childIndexStride = self->_childIndexStride;
          v22 = 0x8000000000000;
          if (!geometryCount || self->_primitiveType)
            goto LABEL_41;
          goto LABEL_37;
        }
      }
      else
      {
        v20 = 0x1800000000000;
        if (geometryCount < 0x100)
          goto LABEL_18;
      }
    }
    else
    {
      v20 = 0x1000000000000;
      if (geometryCount < 0x100)
        goto LABEL_18;
    }
  }
  else
  {
    v20 = 0x800000000000;
    if (geometryCount < 0x100)
      goto LABEL_18;
  }
  if (geometryCount >= 0x10000)
  {
    if (geometryCount >> 24)
    {
      v22 = 0x40000000000000;
      if (!HIDWORD(geometryCount))
        v22 = 0x20000000000000;
    }
    else
    {
      v22 = 0x18000000000000;
    }
  }
  else
  {
    v22 = 0x10000000000000;
  }
  childIndexStride = self->_childIndexStride;
  if (!self->_primitiveType)
  {
LABEL_37:
    if (self->_splitHeuristic == 3)
    {
      v23 = self->_splitCapacity + -1.0;
      if (v23 < 0.0)
        v23 = 0.0;
      fragmentCount += vcvtpd_u64_f64(v23 * (double)fragmentCount);
    }
  }
LABEL_41:
  if (self->_useTemporalSplits)
  {
    v24 = primitiveKeyframeCount - 1;
    if (primitiveKeyframeCount <= 1)
      v24 = 1;
    fragmentCount *= v24;
    if (primitiveKeyframeCount >= 2)
      fragmentCount *= 1 << LODWORD(self->_maxSubKeyframeTemporalSplits);
  }
  v25 = *(_QWORD *)&self->_vertexStride;
  vertexFormat = self->_vertexFormat;
  polygonType = self->_polygonType;
  allGeometryColumnMajor = self->_allGeometryColumnMajor;
  v30 = &unk_255FF8000;
  if ((v29 & 1) == 0)
  {
    v38 = fragmentCount;
    v39 = v20;
    v35 = self->_geometryCount;
    v36 = v22;
    v40 = childIndexStride;
    v37 = *(_QWORD *)&self->_vertexStride;
    v41 = self->_vertexFormat;
    v42 = self->_polygonType;
    v43 = self->_allGeometryColumnMajor;
    LOBYTE(polygonType) = v42;
    allGeometryColumnMajor = v43;
    v30 = &unk_255FF8000;
    LOBYTE(childIndexStride) = v40;
    vertexFormat = v41;
    v25 = v37;
    geometryCount = v35;
    v22 = v36;
    fragmentCount = v38;
    v20 = v39;
    if (v34)
    {
      getBatchThreshold(void)::batchThreshold = 1;
      LOBYTE(polygonType) = v42;
      allGeometryColumnMajor = v43;
      v30 = (_BYTE *)&unk_255FF8000;
      LOBYTE(childIndexStride) = v40;
      vertexFormat = v41;
      v25 = v37;
      geometryCount = v35;
      v22 = v36;
      fragmentCount = v38;
      v20 = v39;
    }
  }
  v31 = (16 * (geometryCount < 2)) & 0x98 | (32 * (polygonType & 3)) | (8 * allGeometryColumnMajor) | childIndexStride & 7;
  v32 = 0x2000;
  if (!v30[2440])
    v32 = 0;
  *(_QWORD *)&self->_pipelineKey.var0 = v17 & 0xF8003FFFFBFFFFFFLL | v20 | v22 | ((unint64_t)(fragmentCount > v32) << 26) | 0x200000000000000;
  *((_BYTE *)&self->_pipelineKey.var0 + 8) = v31;
  *(_WORD *)((char *)&self->_pipelineKey.var0 + 9) = 0;
  *((_BYTE *)&self->_pipelineKey.var0 + 11) = 0;
  *(_QWORD *)&self->_pipelineKey.vertexStride = v25;
  self->_pipelineKey.vertexFormat = vertexFormat;
  self->_pipelineKeyValid = 1;
}

- (BOOL)primitiveMotion
{
  return self->_primitiveKeyframeCount >= 2 && self->_primitiveType - 3 < 3;
}

- (BOOL)canDoPairing
{
  return !self->_primitiveType && self->_allGeometriesHaveIndexBuffers;
}

- (void)updateMaxDepth
{
  unint64_t v3;
  unint64_t maxDepth;
  unint64_t branchingFactor;
  double v6;
  double v7;
  long double v8;
  double v9;

  if (!self)
  {
    maxDepth = 0;
    goto LABEL_17;
  }
  if (!self->_fragmentCount)
  {
    maxDepth = 1;
    goto LABEL_17;
  }
  v3 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)self);
  maxDepth = self->_maxDepth;
  branchingFactor = self->_branchingFactor;
  if (branchingFactor == 2)
  {
    v6 = (double)maxDepth;
    v7 = (log((double)v3) / 0.693147181 + 2.0) * 1.35;
  }
  else
  {
    if (self->_buildAlgorithm)
    {
      if (maxDepth >= (v3 + branchingFactor - 2) / (branchingFactor - 1))
        maxDepth = (v3 + branchingFactor - 2) / (branchingFactor - 1);
      goto LABEL_14;
    }
    v6 = (double)maxDepth;
    v8 = log((double)v3);
    v7 = (v8 + v8) / log((double)branchingFactor) + 2.0;
  }
  v9 = ceil(v7);
  if (v9 > v6)
    v9 = v6;
  maxDepth = (unint64_t)v9;
LABEL_14:
  if (maxDepth <= 1)
    LODWORD(maxDepth) = 1;
  maxDepth = maxDepth;
LABEL_17:
  self->_clampedMaxDepth = maxDepth;
}

- (unint64_t)actualMaxDepth
{
  return self->_maxDepth;
}

- (unint64_t)resourceBufferLength
{
  unint64_t geometryCount;
  unsigned int primitiveType;
  unint64_t primitiveKeyframeCount;
  uint64_t v6;

  geometryCount = self->_geometryCount;
  if (geometryCount && -[BVHDescriptor primitiveMotion](self, "primitiveMotion"))
  {
    primitiveType = self->_primitiveType;
    LODWORD(primitiveKeyframeCount) = 1;
    if (primitiveType <= 7)
    {
      if (((1 << primitiveType) & 0xD2) != 0 || ((1 << primitiveType) & 9) != 0)
        primitiveKeyframeCount = self->_primitiveKeyframeCount;
      else
        primitiveKeyframeCount = 2 * self->_primitiveKeyframeCount;
    }
    v6 = 8 * primitiveKeyframeCount + 96;
  }
  else
  {
    v6 = 96;
  }
  return v6 * geometryCount;
}

- (void)setResourceBufferContents:(char *)a3 resourceBufferAddress:(unint64_t)a4 instanceBoundingBoxBufferAddress:(unint64_t)a5 useResourcesOnEncoder:(id)a6
{
  unsigned int primitiveType;
  _QWORD *primitiveKeyframeCount;
  uint64_t v10;
  unsigned int polygonType;
  uint64_t v12;
  void *v13;
  size_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  int v18;
  unint64_t v19;
  size_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  int v24;
  unint64_t v25;
  size_t v26;
  char *v27;
  void *v28;
  int v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  unint64_t v35;
  size_t v36;
  char *v37;
  int v38;
  unint64_t v39;
  size_t v40;
  BVHDescriptor *v41;
  MTLAccelerationStructureDescriptor *mtlDescriptor;
  int v43;
  unint64_t v44;
  size_t v45;
  char *v46;
  MTLAccelerationStructureDescriptor *v47;
  int v48;
  unint64_t v49;
  size_t v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned int v54;
  uint64_t v55;
  int v56;
  _DWORD *v57;
  _QWORD *v58;
  char v59;
  int v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  unsigned int v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  MTLAttributeFormat v74;
  uint64_t v75;
  int v76;
  char *v77;
  char *v78;
  char v79;
  int v80;
  int v81;
  void *v82;
  void *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  MTLAttributeFormat v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  MTLAttributeFormat v108;
  uint64_t v109;
  char *v110;
  int v111;
  uint64_t v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  BOOL v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  unint64_t v126;
  BOOL v127;
  char v128;
  uint64_t v129;
  MTLAttributeFormat v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  unint64_t v136;
  char v137;
  char v138;
  int v139;
  uint64_t v140;
  _DWORD *v141;
  BOOL v142;
  void *v143;
  uint64_t v144;
  int v145;
  unint64_t v146;
  uint64_t v147;
  int v148;
  uint64_t v149;
  char *v150;
  int v151;
  unint64_t v152;
  void *v153;
  void *v154;
  char *v155;
  uint64_t v156;
  char *v157;
  void *v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  char v169;
  unint64_t v170;
  uint64_t v171;
  uint64_t v172;
  MTLAttributeFormat v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  int v179;
  int v180;
  uint64_t v181;
  char *v182;
  char *v183;
  int v184;
  void *v185;
  void *v186;
  char *v187;
  char *v188;
  uint64_t v189;
  char *v190;
  void *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  uint64_t v198;
  int v199;
  id v200;
  BVHDescriptor *v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  MTLAttributeFormat v206;
  char *v207;
  char *v208;
  uint64_t v209;
  uint64_t v210;
  unint64_t v211;
  uint64_t v212;
  id v213;
  char *v214;
  uint64_t v215;
  unint64_t geometryCount;
  uint64_t v217;

  v211 = a4;
  v214 = a3;
  v217 = *MEMORY[0x24BDAC8D0];
  geometryCount = self->_geometryCount;
  if (!geometryCount)
    return;
  primitiveType = self->_primitiveType;
  primitiveKeyframeCount = (_QWORD *)self->_primitiveKeyframeCount;
  v10 = primitiveKeyframeCount;
  polygonType = self->_polygonType;
  v12 = 96 * geometryCount;
  v213 = primitiveKeyframeCount;
  v209 = 96 * geometryCount;
  LODWORD(v204) = polygonType;
  switch(primitiveType)
  {
    case 0u:
      v201 = self;
      v13 = (void *)-[MTLAccelerationStructureDescriptor geometryDescriptors](self->_mtlDescriptor, "geometryDescriptors");
      v213 = v13;
      if (geometryCount > 0x20)
      {
        v15 = (char *)malloc_type_malloc(32 * geometryCount, 0xD2E15369uLL);
      }
      else
      {
        MEMORY[0x24BDAC7A8](v13);
        v15 = (char *)&v200 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v15, v14);
      }
      v51 = (void *)objc_msgSend(v213, "objectAtIndexedSubscript:", 0);
      v200 = a6;
      if (v51)
      {
        v52 = v51;
        v206 = objc_msgSend(v51, "vertexFormat");
        v203 = objc_msgSend(v52, "vertexStride");
        if (!v203)
          v203 = MTLAttributeFormatSize(v206);
      }
      else
      {
        v203 = 0;
        v206 = MTLAttributeFormatFloat3;
      }
      v113 = 0;
      v114 = 0;
      v115 = 0;
      v116 = v214 + 48;
      LODWORD(v215) = 1;
      LODWORD(v214) = 1;
      v117 = 1;
      while (1)
      {
        v118 = (void *)objc_msgSend(v213, "objectAtIndexedSubscript:", v115, v200);
        v119 = objc_msgSend((id)objc_msgSend(v118, "vertexBuffer"), "gpuAddress");
        *((_QWORD *)v116 - 6) = objc_msgSend(v118, "vertexBufferOffset") + v119;
        v120 = v114 + 1;
        *(_QWORD *)&v15[8 * v114] = objc_msgSend(v118, "vertexBuffer");
        v121 = (void *)objc_msgSend(v118, "indexBuffer");
        if (v121)
          break;
        v125 = 0;
LABEL_129:
        v116[11] = v125;
        v129 = objc_msgSend(v118, "vertexStride");
        v130 = objc_msgSend(v118, "vertexFormat");
        if (!v129)
          LODWORD(v129) = MTLAttributeFormatSize(v130);
        *(_DWORD *)v116 = v129;
        *((_WORD *)v116 + 4) = objc_msgSend(v118, "vertexFormat");
        v131 = objc_msgSend(v118, "transformationMatrixBuffer");
        if (v131)
        {
          v132 = v131;
          v133 = objc_msgSend((id)objc_msgSend(v118, "transformationMatrixBuffer"), "gpuAddress");
          *((_QWORD *)v116 - 1) = objc_msgSend(v118, "transformationMatrixBufferOffset") + v133;
          v114 = v120 + 1;
          *(_QWORD *)&v15[8 * v120] = v132;
        }
        else
        {
          *((_QWORD *)v116 - 1) = 0;
          v114 = v120;
        }
        *((_DWORD *)v116 + 9) = objc_msgSend(v118, "triangleCount");
        v134 = objc_msgSend(v118, "transformationMatrixLayout");
        v116[10] = v134 == 1;
        *((_DWORD *)v116 + 10) = v113;
        v135 = *((_DWORD *)v116 + 9);
        v136 = geometryCount;
        if ((v215 & 1) != 0)
          LODWORD(v215) = v203 == *(_DWORD *)v116;
        if ((v214 & 1) != 0)
          LODWORD(v214) = v206 == *((unsigned __int16 *)v116 + 4);
        v113 += v135;
        if (v117)
          v117 = v134 != 1;
        ++v115;
        v116 += 96;
        if (geometryCount == v115)
        {
          if (v114)
            objc_msgSend(v200, "useResources:count:usage:", v15, v114, 1);
          if (v136 >= 0x21)
            free(v15);
          v137 = v117;
          v138 = v214 & 1;
          if ((v215 & 1) == 0)
            goto LABEL_211;
          goto LABEL_148;
        }
      }
      v122 = v121;
      v123 = objc_msgSend(v121, "gpuAddress");
      *((_QWORD *)v116 - 2) = objc_msgSend(v118, "indexBufferOffset") + v123;
      v124 = objc_msgSend(v118, "indexType");
      if ((_DWORD)v204 == 2)
      {
        if (v124)
          v125 = 4;
        else
          v125 = 2;
        if (objc_msgSend(v118, "indexBuffer"))
          goto LABEL_128;
        v126 = objc_msgSend(v118, "maxVertexIndex");
        if (v126 < 0x100)
        {
          v125 = 1;
LABEL_128:
          *(_QWORD *)&v15[8 * v120] = v122;
          v120 = v114 + 2;
          goto LABEL_129;
        }
        if (v126 < 0x10000)
        {
          v125 = 2;
          goto LABEL_128;
        }
        if (!(v126 >> 24))
        {
          v125 = 3;
          goto LABEL_128;
        }
        v127 = HIDWORD(v126) == 0;
        v128 = 8;
      }
      else
      {
        v127 = v124 == 1;
        v128 = 2;
      }
      if (v127)
        v125 = 4;
      else
        v125 = v128;
      goto LABEL_128;
    case 1u:
      v201 = self;
      v16 = -[MTLAccelerationStructureDescriptor geometryDescriptors](self->_mtlDescriptor, "geometryDescriptors");
      v17 = (void *)v16;
      if (primitiveKeyframeCount <= 1)
        v18 = 1;
      else
        v18 = (int)primitiveKeyframeCount;
      v19 = geometryCount * (v18 + 1);
      if (geometryCount > 0x20)
      {
        v21 = (char *)malloc_type_malloc(8 * v19, 0xCA2AF60EuLL);
      }
      else
      {
        MEMORY[0x24BDAC7A8](v16);
        v21 = (char *)&v200 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v21, v20);
      }
      v53 = (void *)objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      if (v53)
        v212 = objc_msgSend(v53, "boundingBoxStride");
      else
        v212 = 0;
      v139 = 0;
      v140 = 0;
      v141 = v214 + 52;
      v142 = 1;
      do
      {
        v143 = (void *)objc_msgSend(v17, "objectAtIndexedSubscript:", v140);
        v144 = objc_msgSend((id)objc_msgSend(v143, "boundingBoxBuffer"), "gpuAddress");
        *(_QWORD *)(v141 - 11) = objc_msgSend(v143, "boundingBoxBufferOffset") + v144;
        *(_QWORD *)&v21[8 * v140] = objc_msgSend(v143, "boundingBoxBuffer");
        *v141 = objc_msgSend(v143, "boundingBoxStride");
        v145 = objc_msgSend(v143, "boundingBoxCount");
        v141[8] = v145;
        v141[9] = v139;
        if (v142)
          v142 = (_DWORD)v212 == *v141;
        ++v140;
        v139 += v145;
        v141 += 24;
      }
      while (geometryCount != v140);
      v146 = geometryCount;
      objc_msgSend(a6, "useResources:count:usage:", v21, geometryCount, 1);
      if (v146 >= 0x21)
        free(v21);
      v68 = 0;
      v41 = v201;
      v201->_vertexStride = 0;
      if (!v142)
        goto LABEL_158;
      goto LABEL_159;
    case 2u:
      v201 = self;
      v22 = -[MTLAccelerationStructureDescriptor geometryDescriptors](self->_mtlDescriptor, "geometryDescriptors");
      v23 = (void *)v22;
      if (primitiveKeyframeCount <= 1)
        v24 = 1;
      else
        v24 = (int)primitiveKeyframeCount;
      v25 = geometryCount * (2 * v24 + 2);
      v200 = a6;
      if (geometryCount > 0x20)
      {
        v27 = (char *)malloc_type_malloc(8 * v25, 0xDBAF169FuLL);
      }
      else
      {
        MEMORY[0x24BDAC7A8](v22);
        v27 = (char *)&v200 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v27, v26);
      }
      v54 = 0;
      v55 = 0;
      v56 = 0;
      v57 = v214 + 88;
      v215 = (uint64_t)v27;
      v58 = v27 + 16;
      v214 = (char *)(3 * geometryCount);
      do
      {
        v61 = (void *)objc_msgSend(v23, "objectAtIndexedSubscript:", v55, v200);
        v62 = objc_msgSend((id)objc_msgSend(v61, "controlPointBuffer"), "gpuAddress");
        *((_QWORD *)v57 - 9) = objc_msgSend(v61, "controlPointBufferOffset") + v62;
        *(v58 - 2) = objc_msgSend(v61, "controlPointBuffer");
        v63 = objc_msgSend((id)objc_msgSend(v61, "radiusBuffer"), "gpuAddress");
        *((_QWORD *)v57 - 8) = objc_msgSend(v61, "radiusBufferOffset") + v63;
        *(v58 - 1) = objc_msgSend(v61, "radiusBuffer");
        v64 = objc_msgSend((id)objc_msgSend(v61, "indexBuffer"), "gpuAddress");
        *((_QWORD *)v57 - 7) = objc_msgSend(v61, "indexBufferOffset") + v64;
        *v58 = objc_msgSend(v61, "indexBuffer");
        *(v57 - 5) = objc_msgSend(v61, "controlPointFormat");
        *((_BYTE *)v57 - 16) = objc_msgSend(v61, "radiusFormat");
        v65 = objc_msgSend(v61, "controlPointStride");
        if (!v65)
          LODWORD(v65) = MTLAttributeFormatSize((MTLAttributeFormat)*(v57 - 5));
        *(v57 - 7) = v65;
        v66 = objc_msgSend(v61, "radiusStride");
        if (!v66)
          LODWORD(v66) = MTLAttributeFormatSize((MTLAttributeFormat)*((unsigned __int8 *)v57 - 16));
        *(v57 - 6) = v66;
        *(v57 - 3) = v54;
        *((_BYTE *)v57 - 15) = objc_msgSend(v61, "curveBasis");
        *(v57 - 2) = objc_msgSend(v61, "segmentControlPointCount");
        *((_BYTE *)v57 - 14) = objc_msgSend(v61, "curveType");
        *((_BYTE *)v57 - 13) = objc_msgSend(v61, "curveEndCaps");
        if (objc_msgSend(v61, "indexType"))
          v59 = 4;
        else
          v59 = 2;
        *((_BYTE *)v57 - 29) = v59;
        v54 += objc_msgSend(v61, "controlPointCount");
        v60 = objc_msgSend(v61, "segmentCount");
        *(v57 - 1) = v60;
        *v57 = v56;
        v56 += v60;
        ++v55;
        v57 += 24;
        v58 += 3;
      }
      while (geometryCount != v55);
      v67 = (void *)v215;
      if (v214)
        objc_msgSend(v200, "useResources:count:usage:", v215, v214, 1);
      v68 = v54;
      if (geometryCount < 0x21)
        goto LABEL_95;
      v69 = v67;
      goto LABEL_94;
    case 3u:
      v201 = self;
      v28 = (void *)-[MTLAccelerationStructureDescriptor geometryDescriptors](self->_mtlDescriptor, "geometryDescriptors");
      v202 = v28;
      if (primitiveKeyframeCount <= 1)
        v29 = 1;
      else
        v29 = (int)primitiveKeyframeCount;
      v30 = geometryCount * (v29 + 3);
      if (geometryCount > 0x20)
      {
        v210 = (uint64_t)malloc_type_malloc(8 * v30, 0xAA5125CCuLL);
      }
      else
      {
        MEMORY[0x24BDAC7A8](v28);
        v210 = (uint64_t)&v200 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero((void *)v210, v31);
      }
      v70 = (void *)objc_msgSend(v202, "objectAtIndexedSubscript:", 0);
      v200 = a6;
      if (v70)
      {
        v71 = v70;
        v206 = objc_msgSend(v70, "vertexFormat");
        v72 = objc_msgSend(v71, "vertexStride");
        if (!v72)
          v72 = MTLAttributeFormatSize(v206);
        v203 = v72;
      }
      else
      {
        v203 = 0;
        v206 = MTLAttributeFormatFloat3;
      }
      v148 = 0;
      v149 = 0;
      v215 = 0;
      v205 = 8 * primitiveKeyframeCount;
      v150 = &v214[v12];
      LODWORD(v208) = 1;
      LODWORD(v207) = 1;
      v151 = 1;
      break;
    case 4u:
      v201 = self;
      v32 = -[MTLAccelerationStructureDescriptor geometryDescriptors](self->_mtlDescriptor, "geometryDescriptors");
      v33 = (void *)v32;
      if (primitiveKeyframeCount <= 1)
        v34 = 1;
      else
        v34 = (int)primitiveKeyframeCount;
      v35 = geometryCount * (v34 + 1);
      if (geometryCount > 0x20)
      {
        v208 = (char *)malloc_type_malloc(8 * v35, 0x9CE85C49uLL);
      }
      else
      {
        MEMORY[0x24BDAC7A8](v32);
        v208 = (char *)&v200 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v208, v36);
      }
      v73 = (void *)objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
      v200 = a6;
      if (v73)
        v212 = objc_msgSend(v73, "boundingBoxStride");
      else
        v212 = 0;
      v180 = 0;
      v181 = 0;
      v182 = 0;
      v215 = 8 * primitiveKeyframeCount;
      v183 = &v214[v209];
      v184 = 1;
      v206 = (MTLAttributeFormat)v33;
      do
      {
        v185 = (void *)objc_msgSend(v33, "objectAtIndexedSubscript:", v181, v200);
        v186 = v185;
        v187 = &v214[96 * v181];
        if (primitiveKeyframeCount < 2)
        {
          if ((_DWORD)primitiveKeyframeCount == 1)
          {
            v193 = (void *)objc_msgSend((id)objc_msgSend(v185, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0);
            LODWORD(v210) = v184;
            v194 = v193;
            primitiveKeyframeCount = v33;
            v195 = objc_msgSend((id)objc_msgSend(v193, "buffer"), "gpuAddress");
            v196 = objc_msgSend(v194, "offset") + v195;
            v33 = primitiveKeyframeCount;
            LODWORD(primitiveKeyframeCount) = (_DWORD)v213;
            *((_QWORD *)v187 + 1) = v196;
            v197 = v194;
            v184 = v210;
            v198 = objc_msgSend(v197, "buffer");
            *(_QWORD *)&v208[8 * (_QWORD)v182++] = v198;
          }
        }
        else
        {
          if (v10)
          {
            LODWORD(v210) = v184;
            v188 = v182;
            v189 = 0;
            v207 = v188;
            v190 = &v208[8 * (_QWORD)v188];
            do
            {
              v191 = (void *)objc_msgSend((id)objc_msgSend(v186, "boundingBoxBuffers"), "objectAtIndexedSubscript:", v189);
              v192 = objc_msgSend((id)objc_msgSend(v191, "buffer"), "gpuAddress");
              *(_QWORD *)&v183[8 * v189] = objc_msgSend(v191, "offset") + v192;
              *(_QWORD *)&v190[8 * v189++] = objc_msgSend(v191, "buffer");
            }
            while (v10 != v189);
            v33 = (void *)v206;
            v182 = &v207[v189];
            LODWORD(primitiveKeyframeCount) = (_DWORD)v213;
            v184 = v210;
          }
          *((_QWORD *)v187 + 1) = v209 + v215 * v181 + v211;
        }
        *((_DWORD *)v187 + 13) = objc_msgSend(v186, "boundingBoxStride");
        v199 = objc_msgSend(v186, "boundingBoxCount");
        *((_DWORD *)v187 + 21) = v199;
        *((_DWORD *)v187 + 22) = v180;
        if ((v184 & 1) != 0)
          v184 = v212 == *((_DWORD *)v187 + 13);
        v180 += v199;
        ++v181;
        v183 += v215;
      }
      while (v181 != geometryCount);
      if (v182)
        objc_msgSend(v200, "useResources:count:usage:", v208, v182, 1);
      if (geometryCount >= 0x21)
        free(v208);
      v68 = 0;
      v41 = v201;
      v201->_vertexStride = 0;
      if ((v184 & 1) != 0)
        goto LABEL_159;
LABEL_158:
      v212 = 0xFFFFFFFFLL;
      goto LABEL_159;
    case 5u:
      v201 = self;
      v37 = (char *)-[MTLAccelerationStructureDescriptor geometryDescriptors](self->_mtlDescriptor, "geometryDescriptors");
      v207 = v37;
      if (primitiveKeyframeCount <= 1)
        v38 = 1;
      else
        v38 = (int)primitiveKeyframeCount;
      v39 = geometryCount * (2 * v38 + 2);
      v200 = a6;
      if (geometryCount > 0x20)
      {
        v212 = (uint64_t)malloc_type_malloc(8 * v39, 0xE57D0F2BuLL);
      }
      else
      {
        MEMORY[0x24BDAC7A8](v37);
        v212 = (uint64_t)&v200 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero((void *)v212, v40);
      }
      v74 = MTLAttributeFormatInvalid;
      v75 = 0;
      v68 = 0;
      v76 = 0;
      v210 = 16 * primitiveKeyframeCount;
      v77 = &v214[v12];
      v204 = 8 * primitiveKeyframeCount;
      v78 = &v214[v204 + v12];
      do
      {
        v82 = (void *)objc_msgSend(v207, "objectAtIndexedSubscript:", v74, v200);
        v83 = v82;
        v84 = &v214[96 * v74];
        LODWORD(v215) = v76;
        if (primitiveKeyframeCount < 2)
        {
          v97 = v74;
          if ((_DWORD)primitiveKeyframeCount == 1)
          {
            v98 = (void *)objc_msgSend((id)objc_msgSend(v82, "controlPointBuffers"), "objectAtIndexedSubscript:", 0);
            v99 = objc_msgSend((id)objc_msgSend(v98, "buffer"), "gpuAddress");
            LODWORD(v208) = v68;
            *((_QWORD *)v84 + 2) = objc_msgSend(v98, "offset") + v99;
            v100 = objc_msgSend(v98, "buffer");
            primitiveKeyframeCount = (_QWORD *)(v212 + 8 * v75);
            *primitiveKeyframeCount = v100;
            v101 = (void *)objc_msgSend((id)objc_msgSend(v83, "radiusBuffers"), "objectAtIndexedSubscript:", 0);
            v102 = objc_msgSend((id)objc_msgSend(v101, "buffer"), "gpuAddress");
            v103 = objc_msgSend(v101, "offset") + v102;
            v68 = v208;
            *((_QWORD *)v84 + 3) = v103;
            v75 += 2;
            primitiveKeyframeCount[1] = objc_msgSend(v101, "buffer");
            LODWORD(primitiveKeyframeCount) = (_DWORD)v213;
          }
        }
        else
        {
          v85 = v209 + v210 * v74;
          if (v10)
          {
            v205 = v209 + v210 * v74;
            v206 = v74;
            LODWORD(v208) = v68;
            v86 = 0;
            v87 = (char *)(v212 + 8 * v75);
            do
            {
              v88 = (void *)objc_msgSend((id)objc_msgSend(v83, "controlPointBuffers"), "objectAtIndexedSubscript:", v86);
              v89 = objc_msgSend((id)objc_msgSend(v88, "buffer"), "gpuAddress");
              *(_QWORD *)&v77[8 * v86] = objc_msgSend(v88, "offset") + v89;
              *(_QWORD *)&v87[8 * v86++] = objc_msgSend(v88, "buffer");
            }
            while (v10 != v86);
            v90 = 0;
            v75 += v86;
            v91 = v212;
            *((_QWORD *)v84 + 2) = v205 + v211;
            do
            {
              v92 = v75;
              v93 = (void *)objc_msgSend((id)objc_msgSend(v83, "radiusBuffers"), "objectAtIndexedSubscript:", v90);
              v94 = objc_msgSend((id)objc_msgSend(v93, "buffer"), "gpuAddress");
              *(_QWORD *)&v78[8 * v90] = objc_msgSend(v93, "offset") + v94;
              v95 = objc_msgSend(v93, "buffer");
              v75 = v92 + 1;
              *(_QWORD *)(v91 + 8 * v92) = v95;
              ++v90;
            }
            while (v10 != v90);
            v96 = *((_QWORD *)v84 + 2);
            LODWORD(primitiveKeyframeCount) = (_DWORD)v213;
            v68 = v208;
            v74 = v206;
          }
          else
          {
            v96 = v85 + v211;
            *((_QWORD *)v84 + 2) = v85 + v211;
          }
          v97 = v74;
          *((_QWORD *)v84 + 3) = v96 + v204;
        }
        v104 = objc_msgSend((id)objc_msgSend(v83, "indexBuffer"), "gpuAddress");
        *((_QWORD *)v84 + 4) = objc_msgSend(v83, "indexBufferOffset") + v104;
        v105 = objc_msgSend(v83, "indexBuffer");
        *(_QWORD *)(v212 + 8 * v75) = v105;
        *((_DWORD *)v84 + 17) = objc_msgSend(v83, "controlPointFormat");
        v84[72] = objc_msgSend(v83, "radiusFormat");
        v106 = objc_msgSend(v83, "controlPointStride");
        if (!v106)
          LODWORD(v106) = MTLAttributeFormatSize((MTLAttributeFormat)*((unsigned int *)v84 + 17));
        *((_DWORD *)v84 + 15) = v106;
        v107 = objc_msgSend(v83, "radiusStride");
        v108 = v97;
        if (!v107)
          LODWORD(v107) = MTLAttributeFormatSize((MTLAttributeFormat)v84[72]);
        ++v75;
        *((_DWORD *)v84 + 16) = v107;
        *((_DWORD *)v84 + 19) = v68;
        v84[73] = objc_msgSend(v83, "curveBasis");
        *((_DWORD *)v84 + 20) = objc_msgSend(v83, "segmentControlPointCount");
        v84[74] = objc_msgSend(v83, "curveType");
        v84[75] = objc_msgSend(v83, "curveEndCaps");
        if (objc_msgSend(v83, "indexType"))
          v79 = 4;
        else
          v79 = 2;
        v84[59] = v79;
        v68 += objc_msgSend(v83, "controlPointCount");
        v80 = objc_msgSend(v83, "segmentCount");
        v81 = v215;
        *((_DWORD *)v84 + 21) = v80;
        *((_DWORD *)v84 + 22) = v81;
        v76 = v81 + v80;
        v74 = v108 + 1;
        v77 += v210;
        v78 += v210;
      }
      while (v74 != geometryCount);
      if (v75)
        objc_msgSend(v200, "useResources:count:usage:", v212, v75, 1);
      if (geometryCount < 0x21)
        goto LABEL_95;
      v69 = (void *)v212;
LABEL_94:
      free(v69);
LABEL_95:
      v212 = 0;
      v41 = v201;
      goto LABEL_109;
    case 6u:
      v41 = self;
      mtlDescriptor = self->_mtlDescriptor;
      if (primitiveKeyframeCount <= 1)
        v43 = 1;
      else
        v43 = (int)primitiveKeyframeCount;
      v44 = geometryCount * (v43 + 1);
      if (geometryCount > 0x20)
      {
        v46 = (char *)malloc_type_malloc(8 * v44, 0x92940794uLL);
      }
      else
      {
        MEMORY[0x24BDAC7A8](self);
        v46 = (char *)&v200 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v46, v45);
      }
      if (v41->_motion)
        v109 = 56;
      else
        v109 = 24;
      v110 = v214;
      *((_QWORD *)v214 + 1) = a5;
      v212 = v109;
      *((_DWORD *)v110 + 13) = v109;
      v111 = -[MTLAccelerationStructureDescriptor instanceCount](mtlDescriptor, "instanceCount");
      goto LABEL_106;
    case 7u:
      v41 = self;
      v47 = self->_mtlDescriptor;
      if (primitiveKeyframeCount <= 1)
        v48 = 1;
      else
        v48 = (int)primitiveKeyframeCount;
      v49 = geometryCount * (v48 + 1);
      if (geometryCount > 0x20)
      {
        v46 = (char *)malloc_type_malloc(8 * v49, 0xE476968uLL);
      }
      else
      {
        MEMORY[0x24BDAC7A8](self);
        v46 = (char *)&v200 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v46, v50);
      }
      if (v41->_motion)
        v112 = 56;
      else
        v112 = 24;
      v110 = v214;
      *((_QWORD *)v214 + 1) = a5;
      v212 = v112;
      *((_DWORD *)v110 + 13) = v112;
      v111 = -[MTLAccelerationStructureDescriptor maxInstanceCount](v47, "maxInstanceCount");
LABEL_106:
      *((_DWORD *)v110 + 21) = v111;
      if (geometryCount >= 0x21)
        free(v46);
      v68 = 0;
LABEL_109:
      v41->_vertexStride = 0;
LABEL_159:
      v41->_boundingBoxStride = v212;
      v137 = 1;
      v147 = 30;
      goto LABEL_160;
    default:
      return;
  }
  do
  {
    LODWORD(v212) = v151;
    v153 = (void *)objc_msgSend(v202, "objectAtIndexedSubscript:", v149, v200);
    v154 = v153;
    v155 = &v214[96 * v149];
    if (primitiveKeyframeCount < 2)
    {
      if ((_DWORD)primitiveKeyframeCount == 1)
      {
        v160 = (void *)objc_msgSend((id)objc_msgSend(v153, "vertexBuffers"), "objectAtIndexedSubscript:", 0);
        v161 = objc_msgSend((id)objc_msgSend(v160, "buffer"), "gpuAddress");
        v162 = objc_msgSend(v160, "offset") + v161;
        polygonType = v204;
        *(_QWORD *)v155 = v162;
        v163 = objc_msgSend(v160, "buffer");
        v164 = v215;
        *(_QWORD *)(v210 + 8 * v215) = v163;
        v215 = v164 + 1;
      }
    }
    else
    {
      if (v10)
      {
        v156 = 0;
        v157 = (char *)(v210 + 8 * v215);
        do
        {
          v158 = (void *)objc_msgSend((id)objc_msgSend(v154, "vertexBuffers"), "objectAtIndexedSubscript:", v156);
          v159 = objc_msgSend((id)objc_msgSend(v158, "buffer"), "gpuAddress");
          *(_QWORD *)&v150[8 * v156] = objc_msgSend(v158, "offset") + v159;
          *(_QWORD *)&v157[8 * v156++] = objc_msgSend(v158, "buffer");
        }
        while (v10 != v156);
        v215 += v156;
        v12 = v209;
        polygonType = v204;
      }
      *(_QWORD *)v155 = v12 + v205 * v149 + v211;
    }
    v165 = (void *)objc_msgSend(v154, "indexBuffer");
    if (!v165)
    {
      v169 = 0;
      goto LABEL_190;
    }
    v166 = v165;
    v167 = objc_msgSend(v165, "gpuAddress");
    *((_QWORD *)v155 + 4) = objc_msgSend(v154, "indexBufferOffset") + v167;
    v168 = objc_msgSend(v154, "indexType");
    if (polygonType == 2)
    {
      if (v168)
        v169 = 4;
      else
        v169 = 2;
      if (!objc_msgSend(v154, "indexBuffer"))
      {
        v170 = objc_msgSend(v154, "maxVertexIndex");
        if (v170 >= 0x100)
        {
          v171 = v215;
          if (v170 >= 0x10000)
          {
            if (v170 >> 24)
            {
              if (HIDWORD(v170))
                v169 = 8;
              else
                v169 = 4;
            }
            else
            {
              v169 = 3;
            }
          }
          else
          {
            v169 = 2;
          }
          goto LABEL_189;
        }
        v169 = 1;
      }
    }
    else if (v168 == 1)
    {
      v169 = 4;
    }
    else
    {
      v169 = 2;
    }
    v171 = v215;
LABEL_189:
    *(_QWORD *)(v210 + 8 * v171) = v166;
    v215 = v171 + 1;
LABEL_190:
    v155[59] = v169;
    v172 = objc_msgSend(v154, "vertexStride");
    v173 = objc_msgSend(v154, "vertexFormat");
    if (!v172)
      LODWORD(v172) = MTLAttributeFormatSize(v173);
    *((_DWORD *)v155 + 12) = v172;
    *((_WORD *)v155 + 28) = objc_msgSend(v154, "vertexFormat");
    v174 = objc_msgSend(v154, "transformationMatrixBuffer");
    if (v174)
    {
      v175 = v174;
      v176 = objc_msgSend((id)objc_msgSend(v154, "transformationMatrixBuffer"), "gpuAddress");
      *((_QWORD *)v155 + 5) = objc_msgSend(v154, "transformationMatrixBufferOffset") + v176;
      v177 = v215;
      *(_QWORD *)(v210 + 8 * v215) = v175;
      v215 = v177 + 1;
    }
    else
    {
      *((_QWORD *)v155 + 5) = 0;
    }
    LODWORD(primitiveKeyframeCount) = (_DWORD)v213;
    *((_DWORD *)v155 + 21) = objc_msgSend(v154, "triangleCount");
    v178 = objc_msgSend(v154, "transformationMatrixLayout");
    v155[58] = v178 == 1;
    *((_DWORD *)v155 + 22) = v148;
    v179 = *((_DWORD *)v155 + 21);
    if ((v208 & 1) != 0)
      LODWORD(v208) = v203 == *((_DWORD *)v155 + 12);
    if ((v207 & 1) != 0)
      LODWORD(v207) = v206 == *((unsigned __int16 *)v155 + 28);
    v148 += v179;
    v151 = v212;
    if ((v212 & 1) != 0)
      v151 = v178 != 1;
    ++v149;
    v150 += v205;
    v152 = geometryCount;
  }
  while (v149 != geometryCount);
  if (v215)
    objc_msgSend(v200, "useResources:count:usage:", v210, v215, 1);
  if (v152 >= 0x21)
    free((void *)v210);
  v137 = v151 & 1;
  v138 = v207 & 1;
  if ((v208 & 1) != 0)
  {
LABEL_148:
    v68 = 0;
    v41 = v201;
    *(_QWORD *)&v201->_vertexStride = v203;
    if ((v138 & 1) == 0)
      goto LABEL_212;
  }
  else
  {
LABEL_211:
    v68 = 0;
    v41 = v201;
    *(_QWORD *)&v201->_vertexStride = 0xFFFFFFFFLL;
    if ((v138 & 1) == 0)
    {
LABEL_212:
      v147 = 0xFFFFFFFFLL;
LABEL_160:
      v206 = v147;
    }
  }
  v41->_vertexFormat = v206;
  v41->_allGeometryColumnMajor = v137;
  v41->_controlPointCount = v68;
}

- (unint64_t)buildAlgorithm
{
  return self->_buildAlgorithm;
}

- (void)setBuildAlgorithm:(unint64_t)a3
{
  self->_buildAlgorithm = a3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  return self;
}

- (unint64_t)maxLeafNodeCount
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  double v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  unint64_t v8;

  if (result)
  {
    v1 = *(_QWORD *)(result + 24);
    v2 = *(_QWORD *)(result + 40);
    v3 = v1;
    if (v2)
    {
      v3 = *(_QWORD *)(result + 24);
      if (!*(_DWORD *)(result + 128))
      {
        v3 = *(_QWORD *)(result + 24);
        if (*(_DWORD *)(result + 140) == 3)
        {
          v4 = *(float *)(result + 144) + -1.0;
          if (v4 < 0.0)
            v4 = 0.0;
          v3 = v1 + vcvtpd_u64_f64(v4 * (double)v1);
        }
      }
    }
    if (*(_BYTE *)(result + 83))
    {
      v5 = *(_QWORD *)(result + 192);
      if (v5 >= 2)
        v3 *= v5 - 1;
    }
    v6 = *(_QWORD *)(result + 160);
    if (v6 <= -(uint64_t)v3)
    {
      if (v2 && !*(_DWORD *)(result + 128) && *(_DWORD *)(result + 140) == 3)
      {
        v7 = *(float *)(result + 144) + -1.0;
        if (v7 < 0.0)
          v7 = 0.0;
        v1 += vcvtpd_u64_f64(v7 * (double)v1);
      }
      if (*(_BYTE *)(result + 83))
      {
        v8 = *(_QWORD *)(result + 192);
        if (v8 >= 2)
          v1 *= v8 - 1;
      }
      return (v6 + v1 - 1) / v6;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (unint64_t)maxInnerNodeCount
{
  unint64_t v1;
  unint64_t v2;
  double v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (result)
  {
    v1 = *(_QWORD *)(result + 24);
    v2 = v1;
    if (*(_QWORD *)(result + 40))
    {
      v2 = *(_QWORD *)(result + 24);
      if (!*(_DWORD *)(result + 128))
      {
        v2 = *(_QWORD *)(result + 24);
        if (*(_DWORD *)(result + 140) == 3)
        {
          v3 = *(float *)(result + 144) + -1.0;
          if (v3 < 0.0)
            v3 = 0.0;
          v2 = v1 + vcvtpd_u64_f64(v3 * (double)v1);
        }
      }
    }
    if (*(_BYTE *)(result + 83))
    {
      v4 = *(_QWORD *)(result + 192);
      v5 = v4 - 1;
      if (v4 <= 1)
        v5 = 1;
      v2 *= v5;
      if (v4 >= 2)
        v2 *= 1 << *(_DWORD *)(result + 200);
    }
    v6 = *(_QWORD *)(result + 232);
    if (v6 != 2)
    {
      if (v6 == 1)
      {
        if (v1)
          v8 = (8 * v1 + 27) / 0x1CuLL;
        else
          v8 = 1;
        goto LABEL_24;
      }
      if (v6)
        goto LABEL_19;
    }
    if (v2)
    {
      if (*(_QWORD *)(result + 184))
      {
        v7 = (v2 + *(_QWORD *)(result + 176) - 1) / *(_QWORD *)(result + 176);
        v8 = (*(_QWORD *)(result + 152) * (v7 + 2) - 5) / (2 * *(_QWORD *)(result + 152) - 2) + v7;
      }
      else
      {
        v9 = *(_QWORD *)(result + 152);
        v8 = ((-[BVHDescriptor maxLeafNodeCount](result) + 2) * v9 - 5) / (2 * v9 - 2);
      }
    }
    else
    {
LABEL_19:
      v8 = 0;
    }
LABEL_24:
    if (v8 <= 1)
      return 1;
    else
      return v8;
  }
  return result;
}

@end
