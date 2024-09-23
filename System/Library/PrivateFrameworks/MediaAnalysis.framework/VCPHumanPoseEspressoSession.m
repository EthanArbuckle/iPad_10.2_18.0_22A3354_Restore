@implementation VCPHumanPoseEspressoSession

- (VCPHumanPoseEspressoSession)initWithOptions:(id)a3
{
  id v4;
  VCPHumanPoseEspressoSession *v5;
  VCPHumanPoseEspressoSession *v6;
  VCPHumanPoseEspressoSession *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t plan;
  id v19;
  int v20;
  int v21;
  int v22;
  size_t v23;
  void *v24;
  VCPHumanPoseEspressoSession *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)VCPHumanPoseEspressoSession;
  v5 = -[VCPHumanPoseEspressoSession init](&v27, sel_init);
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    *(_QWORD *)&v5->_width = 0x3000000030;
    v5->_revision = 1;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("revision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("revision"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_revision = objc_msgSend(v9, "intValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("config"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_11:
      v7->_plan = 0;
      v7->_ctx = 0;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loadModel"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 && objc_msgSend(v13, "BOOLValue"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "resourceURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_human_pose_lite_v2.espresso.net"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_ctx = (void *)espresso_create_context();
        plan = espresso_create_plan();
        v7->_plan = (void *)plan;
        if (!plan
          || (objc_msgSend(v17, "path"),
              v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
              objc_msgSend(v19, "UTF8String"),
              v20 = espresso_plan_add_network(),
              v19,
              v20)
          || (objc_msgSend(CFSTR("res_256x160"), "UTF8String"), espresso_network_select_configuration())
          || espresso_plan_build())
        {

          goto LABEL_24;
        }
        v21 = espresso_network_bind_buffer();

        if (v21)
          goto LABEL_24;
      }
      v22 = 17 * v7->_width * v7->_height;
      if (v22 < 0)
        v23 = -1;
      else
        v23 = 2 * v22;
      v24 = operator new[](v23, MEMORY[0x1E0DE4E10]);
      *(_QWORD *)v7->_heatmapNms = v24;
      if (v24)
      {
        *(_QWORD *)&v7->_modelOutput16bit[4] = 0;
        *(_DWORD *)&v7->_loadModel = 0;
        v6 = v7;
LABEL_25:

        goto LABEL_26;
      }
LABEL_24:
      v6 = 0;
      goto LABEL_25;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("config"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("res_256x160")) & 1) != 0)
    {
      v12 = 0x2800000040;
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("res_160x256")))
      {
LABEL_10:

        goto LABEL_11;
      }
      v12 = 0x4000000028;
    }
    *(_QWORD *)&v7->_width = v12;
    goto LABEL_10;
  }
LABEL_26:
  v25 = v6;

  return v25;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  v3 = *(_QWORD *)self->_heatmapNms;
  if (v3)
    MEMORY[0x1BCCA128C](v3, 0x1000C80BDFB0063);
  v4 = *(_QWORD *)&self->_modelOutput16bit[4];
  if (v4)
    MEMORY[0x1BCCA128C](v4, 0x1000C80BDFB0063);
  if (self->_plan)
    espresso_plan_destroy();
  if (self->_ctx)
    espresso_context_destroy();
  v5.receiver = self;
  v5.super_class = (Class)VCPHumanPoseEspressoSession;
  -[VCPHumanPoseEspressoSession dealloc](&v5, sel_dealloc);
}

- (id)keypointsToObservation:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  VCPKeypoint *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  VCPPersonObservation *v17;
  VCPPersonObservation *v18;
  VCPPersonObservation *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = v3;
  if (objc_msgSend(v3, "count") == 17)
  {
    v20 = objc_alloc_init(VCPPersonObservation);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v9, "count") != 3)
          {

            v17 = 0;
            goto LABEL_16;
          }
          v10 = objc_alloc_init(VCPKeypoint);
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "floatValue");
          v13 = v12;
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "floatValue");
          -[VCPKeypoint setLocation:](v10, "setLocation:", v13, v15);

          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "floatValue");
          -[VCPKeypoint setConfidence:](v10, "setConfidence:");

          objc_msgSend(v4, "addObject:", v10);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[VCPPersonObservation setKeypoints:](v20, "setKeypoints:", v4);
    v17 = v20;
    -[VCPPersonObservation setRevision:](v20, "setRevision:", 1);
LABEL_16:
    v18 = v17;

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, " keypointsToObservation - unexpected keypoints count", buf, 2u);
    }
    v18 = 0;
  }

  return v18;
}

- (int)keypointsFromTensor:(id *)a3 withOptions:(id)a4 results:(id)a5
{
  id v8;
  id v9;
  int *var0;
  unint64_t var5;
  unint64_t var4;
  unint64_t var6;
  _WORD *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  _WORD *v21;
  int v22;
  int v28;

  v8 = a4;
  v9 = a5;
  var0 = (int *)a3->var0;
  if (!a3->var0)
  {
    v28 = -18;
    goto LABEL_15;
  }
  var4 = a3->var4;
  var5 = a3->var5;
  var6 = a3->var6;
  v14 = *(_WORD **)&self->_modelOutput16bit[4];
  v15 = var4 * var5;
  if (!v14)
    goto LABEL_5;
  if (v15 != *(_DWORD *)&self->_loadModel)
  {
    MEMORY[0x1BCCA128C](*(_QWORD *)&self->_modelOutput16bit[4], 0x1000C80BDFB0063);
LABEL_5:
    v16 = (var5 * var4 * var6);
    v17 = v16 << 32;
    v18 = 2 * (int)v16;
    if (v17 < 0)
      v19 = -1;
    else
      v19 = v18;
    v14 = operator new[](v19, MEMORY[0x1E0DE4E10]);
    *(_QWORD *)&self->_modelOutput16bit[4] = v14;
    *(_DWORD *)&self->_loadModel = v15;
    if (!v14)
    {
      v28 = -108;
      goto LABEL_15;
    }
  }
  v20 = (v15 * var6);
  if ((int)v20 >= 1)
  {
    v21 = v14;
    do
    {
      v22 = *var0++;
      _S0 = v22;
      __asm { FCVT            H0, S0 }
      *v21++ = _S0;
      --v20;
    }
    while (v20);
  }
  v28 = -[VCPHumanPoseEspressoSession keypointsFromTensor:width:height:channels:withOptions:results:](self, "keypointsFromTensor:width:height:channels:withOptions:results:", v14, (int)var4, (int)var5, (int)var6, v8, v9);
LABEL_15:

  return v28;
}

- (int)keypointsFromTensor:(VCPHumanPoseEspressoSession *)self width:(SEL)a2 height:channels:withOptions:results:
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  int v13;
  VCPHumanPoseEspressoSession *v14;
  void *v15;
  unint64_t v16;
  size_t v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  BOOL v40;
  int v45;
  char *v46;
  uint64_t v47;
  id v51;
  uint64_t v52;
  int v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  uint64_t v58;
  int v59;
  void *v60;
  float v61;
  float v62;
  float v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  float v68;
  float v69;
  void *v70;
  void *v71;
  float v72;
  float v73;
  double v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v80;
  void *v81;
  float v83;
  void *v84;
  void *v85;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t k;
  void *v101;
  unint64_t m;
  void *v103;
  void *v104;
  float v105;
  _BOOL4 v106;
  void *v107;
  int v108;
  void *v109;
  int v110;
  double v111;
  float v112;
  int v113;
  float v114;
  double v115;
  unint64_t v116;
  unint64_t v117;
  BOOL v119;
  int n;
  unint64_t v121;
  char v122;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  float v130;
  float v131;
  unint64_t v132;
  void *v133;
  float v134;
  float v135;
  double v136;
  void *v137;
  BOOL v138;
  void *v139;
  void *v140;
  float v141;
  double v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  float v147;
  double v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  float v155;
  void *v156;
  void *v157;
  float v158;
  float v159;
  void *v160;
  id v162;
  id v163;
  char *__src;
  void *v166;
  void *v167;
  char *v168;
  char *j;
  id v170;
  uint64_t v171;
  uint64_t i;
  uint64_t v173;
  char *obj;
  id obja;
  uint64_t v176;
  uint64_t v177;
  uint64_t ii;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  _QWORD v194[3];
  _BYTE v195[128];
  _QWORD v196[3];
  _BYTE v197[128];
  _QWORD v198[3];
  _QWORD v199[2];
  _QWORD v200[3];
  _QWORD v201[2];
  _BYTE v202[128];
  uint64_t v203;

  v8 = v7;
  v9 = v5;
  v10 = v4;
  v11 = v3;
  v12 = v2;
  v203 = *MEMORY[0x1E0C80C00];
  v162 = v6;
  v163 = v8;
  v13 = -18;
  if (v9 != 34)
    goto LABEL_119;
  if (!v12)
    goto LABEL_119;
  __src = v12;
  if (!v163)
    goto LABEL_119;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self;
  v15 = *(void **)self->_heatmapNms;
  v16 = v10 * v11;
  if (v15)
  {
    if (v16 == self->_height * (uint64_t)self->_width)
    {
      v17 = 34 * v16;
      v14 = self;
      goto LABEL_13;
    }
    MEMORY[0x1BCCA128C]();
    v14 = self;
  }
  v17 = 34 * v16;
  if (((17 * v16) & 0x8000000000000000) != 0)
    v18 = -1;
  else
    v18 = 34 * v16;
  v15 = operator new[](v18, MEMORY[0x1E0DE4E10]);
  *(_QWORD *)v14->_heatmapNms = v15;
  if (!v15)
  {
    v13 = -108;
    goto LABEL_118;
  }
  v14->_width = v11;
  v14->_height = v10;
LABEL_13:
  memcpy(v15, __src, v17);
  v19 = 0;
  v20 = *(_QWORD *)v14->_heatmapNms;
  v21 = v20 - 6;
  LODWORD(v22) = -1.0;
  do
  {
    if (v10)
    {
      v23 = 0;
      LODWORD(v24) = 0;
      v25 = v20 + 2 * v16 * v19;
      v26 = -3;
      do
      {
        if (v11)
        {
          v27 = 0;
          v24 = (int)v24;
          v28 = v21;
          do
          {
            _H1 = *(_WORD *)(v25 + 2 * v24);
            __asm { FCVT            S2, H1 }
            if (_S2 >= 0.1)
            {
              v35 = -3;
              v36 = v26;
              do
              {
                v37 = 0;
                v38 = (v35 + v23);
                v40 = (v38 & 0x80000000) != 0 || v38 >= v10;
                while (1)
                {
                  if (!v40 && v27 + v37 - 3 >= 0 && (v27 + v37 - 3) < v11)
                  {
                    _H2 = *(_WORD *)(v28 + 2 * v11 * v36 + 2 * v37);
                    __asm
                    {
                      FCVT            S3, H2
                      FCVT            S2, H1
                    }
                    if (_S3 > _S2)
                      break;
                  }
                  if (++v37 == 7)
                    goto LABEL_34;
                }
                _S1 = _S2 + -1.0;
                __asm { FCVT            H1, S1 }
                *(_WORD *)(v25 + 2 * v24) = _H1;
LABEL_34:
                ++v35;
                ++v36;
              }
              while (v35 != 4);
            }
            else
            {
              _S1 = _S2 + -1.0;
              __asm { FCVT            H1, S1 }
              *(_WORD *)(v25 + 2 * v24) = LOWORD(_S1);
            }
            ++v27;
            ++v24;
            v28 += 2;
          }
          while (v27 != v11);
        }
        ++v23;
        ++v26;
      }
      while (v23 != v10);
    }
    ++v19;
    v21 += 2 * v16;
  }
  while (v19 != 17);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v22);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 17; ++i)
  {
    if (!v10)
      continue;
    v45 = 0;
    v179 = *(_QWORD *)self->_heatmapNms + 2 * v16 * i;
    v168 = &__src[2 * v16 * (i + 17)];
    for (j = 0; j != (char *)v10; ++j)
    {
      if (!v11)
        continue;
      v46 = 0;
      v47 = v45;
      do
      {
        _H0 = *(_WORD *)(v179 + 2 * v47);
        __asm { FCVT            S0, H0 }
        if (_S0 <= 0.1)
          goto LABEL_65;
        obj = v46;
        v176 = v47;
        _H8 = *(_WORD *)&v168[2 * v47];
        v190 = 0u;
        v191 = 0u;
        v192 = 0u;
        v193 = 0u;
        v51 = v167;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v190, v202, 16);
        __asm { FCVT            S8, H8 }
        if (v52)
        {
          v54 = 0;
          v55 = *(_QWORD *)v191;
          LODWORD(v56) = -1;
          v57 = 3.4028e38;
          do
          {
            v58 = 0;
            v59 = v54;
            v54 += v52;
            do
            {
              if (*(_QWORD *)v191 != v55)
                objc_enumerationMutation(v51);
              objc_msgSend(*(id *)(*((_QWORD *)&v190 + 1) + 8 * v58), "objectAtIndexedSubscript:", 0);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "floatValue");
              v62 = v61;

              v63 = vabds_f32(_S8, v62);
              if (v63 >= v57)
                v56 = v56;
              else
                v56 = (v59 + v58);
              if (v63 < v57)
                v57 = v63;
              ++v58;
            }
            while (v52 != v58);
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v190, v202, 16);
          }
          while (v52);

          if ((v56 & 0x80000000) == 0 && v57 < 0.3)
          {
            objc_msgSend(v166, "objectAtIndexedSubscript:", v56);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectAtIndexedSubscript:", v56);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "objectAtIndexedSubscript:", 0);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "floatValue");
            v69 = v68;

            objc_msgSend(v51, "objectAtIndexedSubscript:", v56);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "objectAtIndexedSubscript:", 1);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "floatValue");
            v73 = v72;

            *(float *)&v74 = (float)(_S8 + (float)(v69 * v73)) / (float)(v73 + 1.0);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v74);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v201[0] = v75;
            *(float *)&v76 = v73 + 1.0;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v201[1] = v77;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v201, 2);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setObject:atIndexedSubscript:", v78, v56);

            _H8 = *(_WORD *)(v179 + 2 * v176);
            objc_msgSend(v65, "objectAtIndexedSubscript:", i);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "objectAtIndexedSubscript:", 2);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "floatValue");
            __asm { FCVT            S1, H8 }
            LODWORD(v78) = v83 < _S1;

            if ((_DWORD)v78)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", obj);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v200[0] = v84;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", j);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v200[1] = v85;
              _H0 = *(_WORD *)(v179 + 2 * v176);
              __asm { FCVT            S0, H0 }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", _D0);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v200[2] = v88;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v200, 3);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "setObject:atIndexedSubscript:", v89, i);

            }
            goto LABEL_64;
          }
        }
        else
        {

        }
        *(float *)&v64 = _S8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v199[0] = v90;
        v199[1] = &unk_1E6B71E70;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v199, 2);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObject:", v91);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = 17;
        do
        {
          objc_msgSend(v65, "addObject:", &unk_1E6B761B8);
          --v92;
        }
        while (v92);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", obj);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v198[0] = v93;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", j);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v198[1] = v94;
        _H0 = *(_WORD *)(v179 + 2 * v176);
        __asm { FCVT            S0, H0 }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", _D0);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v198[2] = v97;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v198, 3);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setObject:atIndexedSubscript:", v98, i);

        objc_msgSend(v166, "addObject:", v65);
LABEL_64:

        v16 = v10 * v11;
        v46 = obj;
        v47 = v176;
LABEL_65:
        ++v46;
        ++v47;
      }
      while (v46 != (char *)v11);
      v45 = v47;
    }
  }
  v188 = 0u;
  v189 = 0u;
  v186 = 0u;
  v187 = 0u;
  obja = v166;
  v99 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v186, v197, 16);
  if (v99)
  {
    v180 = *(_QWORD *)v187;
    while (2)
    {
      v177 = v99;
      for (k = 0; k != v177; ++k)
      {
        if (*(_QWORD *)v187 != v180)
          objc_enumerationMutation(obja);
        v101 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * k);
        if (objc_msgSend(v101, "count") != 17)
        {
LABEL_120:
          v13 = -18;
          goto LABEL_121;
        }
        for (m = 0; objc_msgSend(v101, "count") > m; ++m)
        {
          objc_msgSend(v101, "objectAtIndexedSubscript:", m);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "objectAtIndexedSubscript:", 2);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "floatValue");
          v106 = v105 > 0.1;

          if (v106)
          {
            objc_msgSend(v103, "objectAtIndexedSubscript:", 0);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = objc_msgSend(v107, "intValue");

            objc_msgSend(v103, "objectAtIndexedSubscript:", 1);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = objc_msgSend(v109, "intValue");

            v112 = 0.0;
            v113 = -3;
            v114 = 0.0;
            LODWORD(v115) = 0;
            do
            {
              v116 = (v113 + v110);
              v117 = v116 * v11;
              *(float *)&v111 = (float)(int)v116;
              v119 = (v116 & 0x80000000) != 0 || v116 >= v10;
              for (n = -3; n != 4; ++n)
              {
                v121 = (v108 + n);
                v122 = (v121 & 0x80000000) != 0 || v119;
                if ((v122 & 1) == 0 && v121 < v11)
                {
                  _H2 = *(_WORD *)&__src[2 * v10 * v11 * m + 2 * v117 + 2 * v121];
                  __asm { FCVT            S2, H2 }
                  if (_S2 > 0.05)
                  {
                    v112 = v112 + _S2;
                    *(float *)&v115 = *(float *)&v115 + (float)(_S2 * (float)(int)v121);
                    v114 = v114 + (float)(_S2 * *(float *)&v111);
                  }
                }
              }
              ++v113;
            }
            while (v113 != 4);
            if (v112 > 0.0)
            {
              *(float *)&v115 = (float)(*(float *)&v115 / v112) + 0.5;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v115, v111);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              v196[0] = v125;
              *(float *)&v126 = (float)(v114 / v112) + 0.5;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v126);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              v196[1] = v127;
              objc_msgSend(v103, "objectAtIndexedSubscript:", 2);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              v196[2] = v128;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 3);
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "setObject:atIndexedSubscript:", v129, m);

            }
          }

        }
      }
      v99 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v186, v197, 16);
      if (v99)
        continue;
      break;
    }
  }

  v184 = 0u;
  v185 = 0u;
  v182 = 0u;
  v183 = 0u;
  v170 = obja;
  v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v182, v195, 16);
  if (v171)
  {
    v173 = *(_QWORD *)v183;
    v130 = (float)v11;
    v131 = (float)v10;
    do
    {
      for (ii = 0; ii != v171; ++ii)
      {
        if (*(_QWORD *)v183 != v173)
          objc_enumerationMutation(v170);
        v132 = 0;
        v133 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * ii);
        v134 = 0.0;
        v135 = 0.0;
        while (objc_msgSend(v133, "count") > v132)
        {
          objc_msgSend(v133, "objectAtIndexedSubscript:", v132);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = objc_msgSend(v137, "count") == 3;

          if (!v138)
            goto LABEL_120;
          v139 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v133, "objectAtIndexedSubscript:", v132);
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v181, "objectAtIndexedSubscript:", 0);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v140, "floatValue");
          *(float *)&v142 = v141 / v130;
          objc_msgSend(v139, "numberWithFloat:", v142);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v194[0] = v143;
          v144 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v133, "objectAtIndexedSubscript:", v132);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "objectAtIndexedSubscript:", 1);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "floatValue");
          *(float *)&v148 = 1.0 - (float)(v147 / v131);
          objc_msgSend(v144, "numberWithFloat:", v148);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          v194[1] = v149;
          objc_msgSend(v133, "objectAtIndexedSubscript:", v132);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "objectAtIndexedSubscript:", 2);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          v194[2] = v151;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v194, 3);
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "setObject:atIndexedSubscript:", v152, v132);

          objc_msgSend(v133, "objectAtIndexedSubscript:", v132);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "objectAtIndexedSubscript:", 2);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "floatValue");
          LODWORD(v150) = v155 > 0.1;

          if ((_DWORD)v150)
          {
            objc_msgSend(v133, "objectAtIndexedSubscript:", v132);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "objectAtIndexedSubscript:", 2);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "floatValue");
            v159 = v158;

            v134 = v134 + v159;
            v135 = v135 + 1.0;
          }
          ++v132;
        }
        if (v135 > 4.0)
        {
          *(float *)&v136 = v134 / v135;
          if ((float)(v134 / v135) > 0.1)
          {
            -[VCPHumanPoseEspressoSession keypointsToObservation:](self, "keypointsToObservation:", v133, v136);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "addObject:", v160);

          }
        }
      }
      v13 = 0;
      v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v182, v195, 16, v136);
    }
    while (v171);
  }
  else
  {
    v13 = 0;
  }
LABEL_121:

LABEL_118:
LABEL_119:

  return v13;
}

- (int)requiredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result;

  result = -50;
  if (a3 && a4)
  {
    if (a5)
    {
      result = 0;
      *a3 = 256;
      *a4 = 160;
      *a5 = 1111970369;
    }
  }
  return result;
}

- (int)processFrame:(__CVBuffer *)a3 withOptions:(id)a4 results:(id)a5
{
  id v7;
  void *v8;
  int v9;
  size_t Width;
  size_t Height;
  uint8_t v13[16];

  v7 = a5;
  v8 = v7;
  v9 = -50;
  if (a3 && v7)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    if (CVPixelBufferGetPixelFormatType(a3) == 1111970369 && Width == 256 && Height == 160)
    {
      objc_msgSend(CFSTR("input"), "UTF8String");
      if (espresso_network_bind_direct_cvpixelbuffer() || espresso_plan_execute_sync())
        v9 = -18;
      else
        v9 = -[VCPHumanPoseEspressoSession keypointsFromTensor:withOptions:results:](self, "keypointsFromTensor:withOptions:results:", &self->_outputBlob, 0, v8);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "incompatible input buffer size/format, check requiredInputFormat", v13, 2u);
      }
      v9 = -50;
    }
  }

  return v9;
}

@end
