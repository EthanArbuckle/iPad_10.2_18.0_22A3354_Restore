@implementation BWInferenceHumanPosePropagator

- (BWInferenceHumanPosePropagator)initWithOutputRequirement:(id)a3
{
  BWInferenceHumanPosePropagator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWInferenceHumanPosePropagator;
  v4 = -[BWInferenceHumanPosePropagator init](&v6, sel_init);
  if (v4)
    v4->_outputRequirement = (BWInferenceMetadataRequirement *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  __IOSurface *tensorBackingSurface;
  objc_super v4;

  tensorBackingSurface = self->_tensorBackingSurface;
  if (tensorBackingSurface)
  {
    CFRelease(tensorBackingSurface);
    self->_tensorBackingSurface = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)BWInferenceHumanPosePropagator;
  -[BWInferenceHumanPosePropagator dealloc](&v4, sel_dealloc);
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  _DWORD *v9;
  BWInferenceMetadataRequirement *outputRequirement;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;
  uint64_t v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (a4)
  {
    outputRequirement = self->_outputRequirement;
    v11 = objc_msgSend(a4, "tensorForRequirement:", outputRequirement);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __136__BWInferenceHumanPosePropagator_propagateInferenceResultsToInferenceDictionary_usingStorage_inputSampleBuffer_propagationSampleBuffer___block_invoke;
    v22[3] = &unk_1E49234F8;
    v22[4] = self;
    v23 = *(_OWORD *)(v11 + 80);
    v12 = (void *)objc_msgSend(v22, "copy");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = -[BWInferenceMetadataRequirement metadataKeys](outputRequirement, "metadataKeys", 0);
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          v24 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v25 = v12;
          objc_msgSend(a3, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }

  }
  if (*v9 == 1)
    kdebug_trace();
}

void *__136__BWInferenceHumanPosePropagator_propagateInferenceResultsToInferenceDictionary_usingStorage_inputSampleBuffer_propagationSampleBuffer___block_invoke(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  void *BaseAddress;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  _BYTE v30[128];
  uint64_t v31;

  v3 = a1;
  v31 = *MEMORY[0x1E0C80C00];
  IOSurfaceLock(*(IOSurfaceRef *)(a1[4] + 24), 5u, 0);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v3[4];
  BaseAddress = IOSurfaceGetBaseAddress(*(IOSurfaceRef *)(v5 + 24));
  -[BWInferenceHumanPosePropagator keypointsFromModelOutput:width:height:persons:](v5, BaseAddress, v3[5], v3[6], (uint64_t)v4);
  if (objc_msgSend(v4, "count"))
  {
    v24 = v3;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)objc_msgSend(a2, "observations"), "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = (void *)objc_msgSend(a2, "observations");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v13, "objectKind") == 1000)
          {
            v14 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v13, "box");
            v29[0] = objc_msgSend(v14, "numberWithDouble:");
            v15 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v13, "box");
            v29[1] = objc_msgSend(v15, "numberWithDouble:", v16);
            v17 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v13, "box");
            v29[2] = objc_msgSend(v17, "numberWithDouble:", v18);
            v19 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v13, "box");
            v29[3] = objc_msgSend(v19, "numberWithDouble:", v20);
            v21 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "identifier")));
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v10);
    }
    if (objc_msgSend(v7, "count"))
    {
      v3 = v24;
      v22 = -[BWInferenceHumanPosePropagator newMatchesOfHumanPoses:toTracks:](v24[4], v4, v7);
    }
    else
    {
      v22 = 0;
      v3 = v24;
    }
  }
  else
  {
    v22 = 0;
  }
  IOSurfaceUnlock(*(IOSurfaceRef *)(v3[4] + 24), 5u, 0);

  return v22;
}

- (uint64_t)keypointsFromModelOutput:(unint64_t)a3 width:(unint64_t)a4 height:(uint64_t)a5 persons:
{
  void *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int v17;
  uint64_t v18;
  char *v19;
  int v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  BOOL v31;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v45;
  double v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t i;
  float v54;
  float v56;
  void *v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  double v67;
  double v68;
  float v71;
  void *v74;
  int v75;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  unint64_t v83;
  void *v84;
  float v85;
  int v86;
  int v87;
  double v88;
  float v89;
  int v90;
  float v91;
  double v92;
  unint64_t v93;
  unint64_t v94;
  BOOL v96;
  int j;
  unint64_t v98;
  char v99;
  double v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  float v106;
  float v107;
  uint64_t k;
  void *v109;
  double v110;
  uint64_t v111;
  float v112;
  float v113;
  void *v114;
  float v115;
  double v116;
  void *v117;
  float v118;
  double v119;
  float v120;
  float v121;
  void *v124;
  char *v125;
  char *v126;
  unint64_t v128;
  id obj;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  __int128 v133;
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
  _QWORD v145[3];
  _BYTE v146[128];
  _QWORD v147[3];
  _BYTE v148[128];
  _QWORD v149[3];
  _QWORD v150[2];
  _QWORD v151[3];
  _QWORD v152[2];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!a2)
    return 0;
  v8 = *(void **)(a1 + 16);
  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 34 * a4 * a3);
    *(_QWORD *)(a1 + 16) = v8;
    if (!v8)
      return 0;
  }
  v9 = (char *)objc_msgSend(v8, "mutableBytes", a5);
  if (!v9)
    return 0;
  v10 = v9;
  memcpy(v9, a2, 34 * a4 * a3);
  v11 = 0;
  v12 = v10 - 6;
  v128 = a4 * a3;
  LODWORD(v13) = -1.0;
  do
  {
    if (a4)
    {
      v14 = 0;
      LODWORD(v15) = 0;
      v16 = &v10[2 * v128 * v11];
      v17 = -3;
      do
      {
        if (a3)
        {
          v18 = 0;
          v15 = (int)v15;
          v19 = v12;
          do
          {
            _H1 = *(_WORD *)&v16[2 * v15];
            __asm { FCVT            S2, H1 }
            if (_S2 >= 0.1)
            {
              v26 = -3;
              v27 = v17;
              do
              {
                v28 = 0;
                v29 = (v26 + v14);
                v31 = (v29 & 0x80000000) != 0 || v29 >= a4;
                while (1)
                {
                  if (!v31 && v18 + v28 - 3 >= 0 && (v18 + v28 - 3) < a3)
                  {
                    _H2 = *(_WORD *)&v19[2 * v28 + 2 * a3 * v27];
                    __asm
                    {
                      FCVT            S3, H2
                      FCVT            S2, H1
                    }
                    if (_S3 > _S2)
                      break;
                  }
                  if (++v28 == 7)
                    goto LABEL_27;
                }
                _S1 = _S2 + -1.0;
                __asm { FCVT            H1, S1 }
                *(_WORD *)&v16[2 * v15] = _H1;
LABEL_27:
                ++v26;
                ++v27;
              }
              while (v26 != 4);
            }
            else
            {
              _S1 = _S2 + -1.0;
              __asm { FCVT            H1, S1 }
              *(_WORD *)&v16[2 * v15] = LOWORD(_S1);
            }
            ++v18;
            ++v15;
            v19 += 2;
          }
          while (v18 != a3);
        }
        ++v14;
        ++v17;
      }
      while (v14 != a4);
    }
    ++v11;
    v12 += 2 * a4 * a3;
  }
  while (v11 != 17);
  v125 = v10;
  v36 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", v13);
  v131 = 0;
  v37 = 0x1E0CB3000;
  v38 = 0x1E0C99000;
  do
  {
    if (a4)
    {
      v130 = 0;
      LODWORD(v39) = 0;
      v40 = &v125[2 * v128 * v131];
      v126 = v40;
      while (!a3)
      {
LABEL_58:
        if (++v130 == a4)
          goto LABEL_59;
      }
      v41 = 0;
      v39 = (int)v39;
      while (1)
      {
        _H0 = *(_WORD *)&v40[2 * v39];
        __asm { FCVT            S0, H0 }
        if (_S0 > 0.1)
        {
          v132 = v41;
          _H8 = *((_WORD *)a2 + v128 * (v131 + 17) + v39);
          v141 = 0u;
          v142 = 0u;
          v143 = 0u;
          v144 = 0u;
          v45 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v141, v153, 16);
          if (v45)
          {
            v47 = v45;
            v48 = 0;
            v49 = *(_QWORD *)v142;
            __asm { FCVT            S8, H8 }
            LODWORD(v51) = -1;
            LOWORD(_S9) = 31744;
            do
            {
              for (i = 0; i != v47; ++i)
              {
                if (*(_QWORD *)v142 != v49)
                  objc_enumerationMutation(v36);
                objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * i), "objectAtIndexedSubscript:", 0), "floatValue");
                _S1 = _S8 - v54;
                v56 = vabds_f32(_S8, v54);
                __asm
                {
                  FCVT            S2, H9
                  FCVT            H1, S1
                  FCVT            S1, H1
                }
                _S1 = fabsf(_S1);
                __asm { FCVT            H1, S1 }
                if (v56 >= _S2)
                  v51 = v51;
                else
                  v51 = (v48 + i);
                if (v56 < _S2)
                  _S9 = _S1;
              }
              v48 += v47;
              v47 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v141, v153, 16);
            }
            while (v47);
            v37 = 0x1E0CB3000uLL;
            v38 = 0x1E0C99000uLL;
            v40 = &v125[2 * v128 * v131];
            if ((v51 & 0x80000000) == 0)
            {
              __asm { FCVT            S0, H9 }
              if (_S0 < 0.3)
              {
                v61 = (void *)objc_msgSend(obj, "objectAtIndexedSubscript:", v51);
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", v51), "objectAtIndexedSubscript:", 0), "floatValue");
                v63 = v62;
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", v51), "objectAtIndexedSubscript:", 1), "floatValue");
                v65 = _S8 + (float)(v63 * v64);
                v66 = v64 + 1.0;
                *(float *)&v67 = v65 / (float)(v64 + 1.0);
                v152[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
                *(float *)&v68 = v66;
                v152[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v68);
                objc_msgSend(v36, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 2), v51);
                _H0 = *(_WORD *)&v126[2 * v39];
                __asm { FCVT            S8, H0 }
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v61, "objectAtIndexedSubscript:", v131), "objectAtIndexedSubscript:", 2), "floatValue");
                v41 = v132;
                if (v71 < _S8)
                {
                  v151[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v132);
                  v151[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v130);
                  _H0 = *(_WORD *)&v126[2 * v39];
                  __asm { FCVT            S0, H0 }
                  v151[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", _D0);
                  objc_msgSend(v61, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 3), v131);
                }
                goto LABEL_57;
              }
            }
          }
          else
          {
            __asm { FCVT            S8, H8 }
          }
          *(float *)&v46 = _S8;
          v150[0] = objc_msgSend(*(id *)(v37 + 2024), "numberWithFloat:", v46);
          v150[1] = &unk_1E4A02EB0;
          objc_msgSend(v36, "addObject:", objc_msgSend(*(id *)(v38 + 3360), "arrayWithObjects:count:", v150, 2));
          v74 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v75 = 17;
          do
          {
            objc_msgSend(v74, "addObject:", &unk_1E4A00ED8);
            --v75;
          }
          while (v75);
          v41 = v132;
          v149[0] = objc_msgSend(*(id *)(v37 + 2024), "numberWithInt:", v132);
          v149[1] = objc_msgSend(*(id *)(v37 + 2024), "numberWithInt:", v130);
          _H0 = *(_WORD *)&v40[2 * v39];
          __asm { FCVT            S0, H0 }
          v149[2] = objc_msgSend(*(id *)(v37 + 2024), "numberWithFloat:", _D0);
          objc_msgSend(v74, "setObject:atIndexedSubscript:", objc_msgSend(*(id *)(v38 + 3360), "arrayWithObjects:count:", v149, 3), v131);
          objc_msgSend(obj, "addObject:", v74);
        }
LABEL_57:
        ++v41;
        ++v39;
        if (v41 == a3)
          goto LABEL_58;
      }
    }
LABEL_59:
    ++v131;
  }
  while (v131 != 17);
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v148, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v138;
LABEL_62:
    v81 = 0;
    while (1)
    {
      if (*(_QWORD *)v138 != v80)
        objc_enumerationMutation(obj);
      v82 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v81);
      if (objc_msgSend(v82, "count") != 17)
        break;
      if (objc_msgSend(v82, "count"))
      {
        v83 = 0;
        do
        {
          v84 = (void *)objc_msgSend(v82, "objectAtIndexedSubscript:", v83);
          objc_msgSend((id)objc_msgSend(v84, "objectAtIndexedSubscript:", 2), "floatValue");
          if (v85 > 0.1)
          {
            v86 = objc_msgSend((id)objc_msgSend(v84, "objectAtIndexedSubscript:", 0), "intValue");
            v87 = objc_msgSend((id)objc_msgSend(v84, "objectAtIndexedSubscript:", 1), "intValue");
            v89 = 0.0;
            v90 = -3;
            v91 = 0.0;
            LODWORD(v92) = 0;
            do
            {
              v93 = (v90 + v87);
              v94 = v93 * a3;
              *(float *)&v88 = (float)(int)v93;
              v96 = (v93 & 0x80000000) != 0 || v93 >= a4;
              for (j = -3; j != 4; ++j)
              {
                v98 = (v86 + j);
                v99 = (v98 & 0x80000000) != 0 || v96;
                if ((v99 & 1) == 0 && v98 < a3)
                {
                  _H2 = *((_WORD *)a2 + v128 * v83 + v94 + v98);
                  __asm { FCVT            S2, H2 }
                  if (_S2 > 0.05)
                  {
                    v89 = v89 + _S2;
                    *(float *)&v92 = *(float *)&v92 + (float)(_S2 * (float)(int)v98);
                    v91 = v91 + (float)(_S2 * *(float *)&v88);
                  }
                }
              }
              ++v90;
            }
            while (v90 != 4);
            if (v89 > 0.0)
            {
              *(float *)&v92 = (float)(*(float *)&v92 / v89) + 0.5;
              v147[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v92, v88);
              *(float *)&v102 = (float)(v91 / v89) + 0.5;
              v147[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v102);
              v147[2] = objc_msgSend(v84, "objectAtIndexedSubscript:", 2);
              objc_msgSend(v82, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 3), v83);
            }
          }
          ++v83;
        }
        while (objc_msgSend(v82, "count") > v83);
      }
      if (++v81 == v79)
      {
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v148, 16);
        if (v79)
          goto LABEL_62;
        goto LABEL_91;
      }
    }
  }
  else
  {
LABEL_91:
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v146, 16);
    if (v103)
    {
      v104 = v103;
      v105 = *(_QWORD *)v134;
      v106 = (float)a3;
      v107 = (float)a4;
      while (2)
      {
        for (k = 0; k != v104; ++k)
        {
          if (*(_QWORD *)v134 != v105)
            objc_enumerationMutation(obj);
          v109 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * k);
          if (objc_msgSend(v109, "count"))
          {
            v111 = 0;
            v112 = 0.0;
            v113 = 0.0;
            while (objc_msgSend((id)objc_msgSend(v109, "objectAtIndexedSubscript:", v111), "count") == 3)
            {
              v114 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "objectAtIndexedSubscript:", v111), "objectAtIndexedSubscript:", 0), "floatValue");
              *(float *)&v116 = v115 / v106;
              v145[0] = objc_msgSend(v114, "numberWithFloat:", v116);
              v117 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "objectAtIndexedSubscript:", v111), "objectAtIndexedSubscript:", 1), "floatValue");
              *(float *)&v119 = v118 / v107;
              v145[1] = objc_msgSend(v117, "numberWithFloat:", v119);
              v145[2] = objc_msgSend((id)objc_msgSend(v109, "objectAtIndexedSubscript:", v111), "objectAtIndexedSubscript:", 2);
              objc_msgSend(v109, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 3), v111);
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "objectAtIndexedSubscript:", v111), "objectAtIndexedSubscript:", 2), "floatValue");
              if (v120 > 0.1)
              {
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v109, "objectAtIndexedSubscript:", v111), "objectAtIndexedSubscript:", 2), "floatValue");
                v113 = v113 + v121;
                v112 = v112 + 1.0;
              }
              if (objc_msgSend(v109, "count") <= (unint64_t)++v111)
              {
                if (v112 > 4.0)
                {
                  *(float *)&v110 = v113 / v112;
                  if ((float)(v113 / v112) > 0.1)
                    objc_msgSend(v124, "addObject:", v109, v110);
                }
                goto LABEL_105;
              }
            }
            return 0;
          }
LABEL_105:
          ;
        }
        v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v146, 16, v110);
        if (v104)
          continue;
        break;
      }
    }
  }
  return 0;
}

- (void)newMatchesOfHumanPoses:(void *)a3 toTracks:
{
  id v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  double v25;
  double v26;
  uint64_t v27;
  float v28;
  uint64_t v29;
  int v30;
  unint64_t v31;
  void *v32;
  float v33;
  float v34;
  float v35;
  float v36;
  void *v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id obj;
  double v57;
  double v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[3];
  const __CFString *v68;
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  obj = a2;
  v7 = objc_msgSend(a2, "count");
  v8 = v7 >= objc_msgSend(a3, "count");
  v9 = a2;
  if (v8)
    v10 = a3;
  else
    v10 = a2;
  v50 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v10, "count"));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v53 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v53)
  {
    v52 = *(_QWORD *)v64;
    v51 = a3;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v64 != v52)
          objc_enumerationMutation(a3);
        v55 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:");
        objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 0), "floatValue");
        v14 = v13;
        objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 1), "floatValue");
        v16 = v15;
        objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 2), "floatValue");
        v18 = v17;
        objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 3), "floatValue");
        v20 = v19;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v21 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
        if (v21)
        {
          v22 = v21;
          v54 = i;
          v23 = 0;
          v24 = 0;
          v57 = v18;
          v58 = v20;
          v25 = v16;
          v26 = v14;
          v27 = *(_QWORD *)v60;
          v28 = 0.0;
          do
          {
            v29 = 0;
            v30 = v23;
            do
            {
              if (*(_QWORD *)v60 != v27)
                objc_enumerationMutation(obj);
              v31 = 0;
              v32 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v29);
              v33 = 1.0;
              v34 = 0.0;
              v35 = 0.0;
              v36 = 1.0;
              do
              {
                if (v31 < 9 || (v31 - 11) <= 1)
                {
                  v37 = (void *)objc_msgSend(v32, "objectAtIndexedSubscript:", v31);
                  objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", 2), "floatValue");
                  if (v38 > 0.1)
                  {
                    objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", 0), "floatValue");
                    v36 = fminf(v36, v39);
                    objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", 1), "floatValue");
                    v33 = fminf(v33, v40);
                    objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", 0), "floatValue");
                    v35 = fmaxf(v35, v41);
                    objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", 1), "floatValue");
                    v34 = fmaxf(v34, v42);
                  }
                }
                ++v31;
              }
              while (v31 != 13);
              v43 = -[BWInferenceHumanPosePropagator calculateIOU:with:](a1, v26, v25, v57, v58, v36, v33, (float)(v35 - v36), (float)(v34 - v33));
              if (v43 > v28)
              {
                v28 = v43;
                v24 = v30;
              }
              ++v30;
              ++v29;
            }
            while (v29 != v22);
            v23 += v22;
            v9 = obj;
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
          }
          while (v22);
          a3 = v51;
          i = v54;
          if (v28 > 0.2)
          {
            v44 = (void *)objc_msgSend(obj, "objectAtIndexedSubscript:", v24);
            v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v44, "count"));
            v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v44, "count"));
            v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v44, "count"));
            if (objc_msgSend(v44, "count"))
            {
              v48 = 0;
              do
              {
                objc_msgSend(v45, "addObject:", objc_msgSend((id)objc_msgSend(v44, "objectAtIndexedSubscript:", v48), "objectAtIndexedSubscript:", 0));
                objc_msgSend(v46, "addObject:", objc_msgSend((id)objc_msgSend(v44, "objectAtIndexedSubscript:", v48), "objectAtIndexedSubscript:", 1));
                objc_msgSend(v47, "addObject:", objc_msgSend((id)objc_msgSend(v44, "objectAtIndexedSubscript:", v48++), "objectAtIndexedSubscript:", 2));
              }
              while (v48 < objc_msgSend(v44, "count"));
            }
            v67[2] = v47;
            v68 = CFSTR("human_pose");
            v67[0] = v45;
            v67[1] = v46;
            v69 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
            objc_msgSend(v50, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1), v55);

          }
        }
      }
      v53 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v53);
  }
  return v50;
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

- (__IOSurface)backingMemoryForMetadataRequirement:(id)a3 bindingName:(id)a4 surfaceProperties:(id)a5
{
  __IOSurface *result;

  result = self->_tensorBackingSurface;
  if (!result)
  {
    result = IOSurfaceCreate((CFDictionaryRef)a5);
    self->_tensorBackingSurface = result;
  }
  return result;
}

- (float)calculateIOU:(double)a3 with:(double)a4
{
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;

  if (!a1)
    return 0.0;
  v9 = fmax(a2, a6);
  v10 = fmax(a3, a7);
  v11 = fmin(a2 + a4, a6 + a8);
  v12 = fmin(a3 + a5, a7 + a9);
  v13 = fmax((float)(v11 - v9), 0.0) * fmax((float)(v12 - v10), 0.0);
  v14 = a4 * a5;
  v15 = a8 * a9;
  return v13 / (float)((float)((float)(v14 + v15) - v13) + 1.0e-12);
}

@end
