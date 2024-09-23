@implementation SmartStyleRendererTuning

- (SmartStyleRendererTuning)initWithParams:(id)a3 keypath:(id)a4
{
  id v6;
  id v7;
  SmartStyleRendererTuning *v8;
  void *v9;
  void *v10;
  SmartStyleRendererTuning *v11;
  NSObject *v13;
  objc_super v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0;
  v14.receiver = self;
  v14.super_class = (Class)SmartStyleRendererTuning;
  v8 = -[SmartStyleRendererTuning init](&v14, sel_init);
  if (!v8)
  {
    v9 = 0;
    v15 = -12786;
    goto LABEL_16;
  }
  getSubDict(v6, 0x1E94EF108, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v15 = -[SmartStyleRendererTuning readSelectiveColorTuning:](v8, "readSelectiveColorTuning:", v9);
    if (v15)
      goto LABEL_16;
  }
  getSubDict(v6, 0x1E94EF068, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v15 = -[SmartStyleRendererTuning readCastAdjustmentsTuning:](v8, "readCastAdjustmentsTuning:", v10);
    if (v15)
      goto LABEL_14;
  }
  getSubDict(v6, 0x1E94EF128, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v15 = -[SmartStyleRendererTuning readToneAdjustmentsTuning:](v8, "readToneAdjustmentsTuning:", v9);
    if (v15)
      goto LABEL_16;
  }
  getSubDict(v6, 0x1E94EF088, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v15 = -[SmartStyleRendererTuning readColorAdjustmentsTuning:](v8, "readColorAdjustmentsTuning:", v10);
    if (v15)
    {
LABEL_14:
      v9 = v10;
LABEL_16:
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v13 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v11 = 0;
      goto LABEL_13;
    }
  }
  getSubDict(v6, 0x1E94EF0C8, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v15 = -[SmartStyleRendererTuning readDefaultUserBias:](v8, "readDefaultUserBias:", v9);
    if (v15)
      goto LABEL_16;
  }
  v11 = v8;
LABEL_13:

  return v11;
}

- (int)readSelectiveColorTuning:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  NSDictionary *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  int v36;
  int v37;
  void *v38;
  int v39;
  int v40;
  void *v41;
  int v42;
  int v43;
  void *v44;
  int v45;
  int v46;
  void *v47;
  int v48;
  int v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  int v54;
  int v55;
  void *v56;
  int v57;
  int v58;
  void *v59;
  int v60;
  int v61;
  void *v62;
  NSDictionary *v63;
  NSDictionary *selectiveColorTuning;
  int v65;
  SmartStyleRendererTuning *v67;
  __CFString *v68;
  uint64_t v69;
  NSDictionary *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  _DWORD v77[7];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  int v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v86 = 0;
  v5 = CFSTR("SelectiveColor");
  v6 = (void *)objc_opt_new();
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v7 = (NSDictionary *)v4;
  v69 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  if (v69)
  {
    v71 = v6;
    v72 = *(_QWORD *)v83;
    v67 = self;
    v68 = v5;
    v70 = v7;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v83 != v72)
          objc_enumerationMutation(v7);
        v73 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v8);
        v74 = v8;
        getSubArray(v7, v73, &v86);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v11 = v9;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v79;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v79 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
              v76 = 0u;
              memset(v77, 0, sizeof(v77));
              v75 = 0u;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Red"), v67);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v17 = 0;
                v86 = 4;
              }
              objc_msgSend(v17, "floatValue");
              v19 = v18;

              LODWORD(v75) = v19;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Green"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v20 = 0;
                v86 = 4;
              }
              objc_msgSend(v20, "floatValue");
              v22 = v21;

              DWORD1(v75) = v22;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Blue"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v23 = 0;
                v86 = 4;
              }
              objc_msgSend(v23, "floatValue");
              v25 = v24;

              DWORD2(v75) = v25;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Hue"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v26 = 0;
                v86 = 4;
              }
              objc_msgSend(v26, "floatValue");
              v28 = v27;

              HIDWORD(v75) = v28;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Saturation"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v29 = 0;
                v86 = 4;
              }
              objc_msgSend(v29, "floatValue");
              v31 = v30;

              LODWORD(v76) = v31;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Luminance"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v32 = 0;
                v86 = 4;
              }
              objc_msgSend(v32, "floatValue");
              v34 = v33;

              DWORD1(v76) = v34;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Range"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v35 = 0;
                v86 = 4;
              }
              objc_msgSend(v35, "floatValue");
              v37 = v36;

              DWORD2(v76) = v37;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Gamma"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v38 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v38 = 0;
                v86 = 4;
              }
              objc_msgSend(v38, "floatValue");
              v40 = v39;

              HIDWORD(v76) = v40;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Highlights"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v41 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v41 = 0;
                v86 = 4;
              }
              objc_msgSend(v41, "floatValue");
              v43 = v42;

              v77[0] = v43;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Midtones"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v44 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v44 = 0;
                v86 = 4;
              }
              objc_msgSend(v44, "floatValue");
              v46 = v45;

              v77[1] = v46;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Shadows"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v47 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v47 = 0;
                v86 = 4;
              }
              objc_msgSend(v47, "floatValue");
              v49 = v48;

              v77[2] = v49;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Person"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v50 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v50 = 0;
                v86 = 4;
              }
              objc_msgSend(v50, "floatValue");
              v52 = v51;

              v77[3] = v52;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Background"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v53 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v53 = 0;
                v86 = 4;
              }
              objc_msgSend(v53, "floatValue");
              v55 = v54;

              v77[4] = v55;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Skin"));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v56 = 0;
                v86 = 4;
              }
              objc_msgSend(v56, "floatValue");
              v58 = v57;

              v77[5] = v58;
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Sky"));
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v59 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {

                v59 = 0;
                v86 = 4;
              }
              objc_msgSend(v59, "floatValue");
              v61 = v60;

              v77[6] = v61;
              if (v86)
              {

                v7 = v70;
                v6 = v71;
                selectiveColorTuning = v70;
                v5 = v68;
                goto LABEL_63;
              }
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v75, "{?=fffffffffffffff}");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v62);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
            if (v13)
              continue;
            break;
          }
        }

        v6 = v71;
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v10, v73);

        v8 = v74 + 1;
        v7 = v70;
      }
      while (v74 + 1 != v69);
      self = v67;
      v5 = v68;
      v69 = -[NSDictionary countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    }
    while (v69);
  }

  v63 = v6;
  selectiveColorTuning = self->_selectiveColorTuning;
  self->_selectiveColorTuning = v63;
LABEL_63:

  v65 = v86;
  return v65;
}

- (int)readCastAdjustmentsTuning:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  NSDictionary *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  int v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  void *v47;
  int v48;
  int v49;
  void *v50;
  int v51;
  int v52;
  int v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  NSDictionary *v61;
  NSDictionary *castAdjustmentsTuning;
  int v63;
  __CFString *v65;
  uint64_t v66;
  NSDictionary *v67;
  uint64_t v68;
  void *v69;
  uint64_t v71;
  _OWORD v72[4];
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
  __int128 v84;
  int v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  int v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v90 = 0;
  v4 = CFSTR("CastAdjustments");
  v5 = (void *)objc_opt_new();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v6 = (NSDictionary *)v3;
  v66 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
  v7 = 0;
  if (v66)
  {
    v68 = *(_QWORD *)v87;
    v65 = v4;
    v67 = v6;
    v69 = v5;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v87 != v68)
        objc_enumerationMutation(v6);
      v9 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v8);
      v85 = 0;
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v71 = v9;
      getSubDict(v6, v9, &v90);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      getSubArray(v10, 0x1E94EF0E8, &v90);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BGWarmth"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v12 = 0;
        v90 = 4;
      }
      objc_msgSend(v12, "floatValue", v65);
      v14 = v13;

      LODWORD(v77) = v14;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FGWarmth"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v15 = 0;
        v90 = 4;
      }
      objc_msgSend(v15, "floatValue");
      v17 = v16;

      DWORD1(v77) = v17;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BGRotate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v18 = 0;
        v90 = 4;
      }
      objc_msgSend(v18, "floatValue");
      v20 = v19;

      DWORD2(v77) = v20;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FGRotate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v21 = 0;
        v90 = 4;
      }
      objc_msgSend(v21, "floatValue");
      v23 = v22;

      HIDWORD(v77) = v23;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PersonWarmth"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v24 = 0;
        v90 = 4;
      }
      objc_msgSend(v24, "floatValue");
      v26 = v25;

      LODWORD(v78) = v26;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PersonRotate"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v27 = 0;
        v90 = 4;
      }
      objc_msgSend(v27, "floatValue");
      v29 = v28;

      DWORD1(v78) = v29;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DeRed"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v30 = 0;
        v90 = 4;
      }
      objc_msgSend(v30, "floatValue");
      v32 = v31;

      HIDWORD(v83) = v32;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DeRedSatReduction"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v33 = 0;
        v90 = 4;
      }
      objc_msgSend(v33, "floatValue");
      v35 = v34;

      LODWORD(v84) = v35;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DeYellow"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v36 = 0;
        v90 = 4;
      }
      objc_msgSend(v36, "floatValue");
      v38 = v37;

      DWORD1(v84) = v38;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SkinWarmth"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v39 = 0;
        v90 = 4;
      }
      objc_msgSend(v39, "floatValue");
      v41 = v40;

      DWORD2(v84) = v41;
      if (v90)
        goto LABEL_76;
      if ((unint64_t)objc_msgSend(v11, "count") > 3)
      {
        v90 = 4;
        goto LABEL_76;
      }
      if (objc_msgSend(v11, "count"))
        break;
LABEL_51:
      -[NSDictionary objectForKeyedSubscript:](self->_selectiveColorTuning, "objectForKeyedSubscript:", v71);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v54)
      {
        v7 = 0;
        v90 = 4;
        v6 = v67;
LABEL_76:

LABEL_72:
        castAdjustmentsTuning = v6;
        v4 = v65;
        v5 = v69;
        goto LABEL_73;
      }
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v7 = v54;
      v55 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v74;
        do
        {
          for (i = 0; i != v56; ++i)
          {
            if (*(_QWORD *)v74 != v57)
              objc_enumerationMutation(v7);
            v59 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
            memset(v72, 0, 60);
            objc_msgSend(v59, "getValue:size:", v72, 60);
            if (*((float *)&v72[2] + 2) != 0.0 && *((float *)&v80 + 3) == 0.0)
            {
              HIDWORD(v80) = DWORD2(v72[2]);
              *((_QWORD *)&v81 + 1) = *(_QWORD *)&v72[0];
              LODWORD(v82) = DWORD2(v72[0]);
            }
            if (*((float *)&v72[2] + 1) != 0.0 && *(float *)&v81 == 0.0)
            {
              LODWORD(v81) = DWORD1(v72[2]);
              *(_QWORD *)((char *)&v82 + 4) = *(_QWORD *)&v72[0];
              HIDWORD(v82) = DWORD2(v72[0]);
            }
            if (*(float *)&v72[2] != 0.0 && *((float *)&v81 + 1) == 0.0)
            {
              DWORD1(v81) = v72[2];
              *(_QWORD *)&v83 = *(_QWORD *)&v72[0];
              DWORD2(v83) = DWORD2(v72[0]);
            }
          }
          v56 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
        }
        while (v56);
      }

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v77, "{?=ffffff[3f][3f][3f]fff[3f][3f][3f]ffffff}");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v69;
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v60, v71);

      ++v8;
      v6 = v67;
      if (v8 == v66)
      {
        v4 = v65;
        v66 = -[NSDictionary countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
        if (v66)
          goto LABEL_3;
        goto LABEL_70;
      }
    }
    v42 = 0;
    while (1)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Hue"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v44 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v44 = 0;
        v90 = 4;
      }
      objc_msgSend(v44, "floatValue");
      v46 = v45;

      *((_DWORD *)&v78 + v42 + 2) = v46;
      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Range"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v47 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v47 = 0;
        v90 = 4;
      }
      objc_msgSend(v47, "floatValue");
      v49 = v48;

      *((_DWORD *)&v79 + v42 + 1) = v49;
      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Strength"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v50 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

        v50 = 0;
        v90 = 4;
      }
      objc_msgSend(v50, "floatValue");
      v52 = v51;

      *((_DWORD *)&v80 + v42) = v52;
      v53 = v90;

      if (v53)
        break;
      if (++v42 >= (unint64_t)objc_msgSend(v11, "count"))
        goto LABEL_51;
    }

    v6 = v67;
    goto LABEL_72;
  }
LABEL_70:

  v61 = v5;
  castAdjustmentsTuning = self->_castAdjustmentsTuning;
  self->_castAdjustmentsTuning = v61;
LABEL_73:

  v63 = v90;
  return v63;
}

- (int)readToneAdjustmentsTuning:(id)a3
{
  id v3;
  void *v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  int v43;
  int v44;
  void *v45;
  int v46;
  int v47;
  void *v48;
  int v49;
  int v50;
  void *v51;
  int v52;
  int v53;
  void *v54;
  int v55;
  int v56;
  void *v57;
  int v58;
  int v59;
  void *v60;
  int v61;
  int v62;
  void *v63;
  int v64;
  int v65;
  void *v66;
  int v67;
  int v68;
  void *v69;
  int v70;
  int v71;
  void *v72;
  int v73;
  int v74;
  void *v75;
  int v76;
  int v77;
  void *v78;
  int v79;
  int v80;
  void *v81;
  int v82;
  int v83;
  void *v84;
  int v85;
  int v86;
  void *v87;
  int v88;
  int v89;
  void *v90;
  int v91;
  int v92;
  void *v93;
  int v94;
  int v95;
  void *v96;
  int v97;
  int v98;
  void *v99;
  int v100;
  int v101;
  void *v102;
  int v103;
  int v104;
  void *v105;
  float v106;
  float v107;
  double v108;
  void *v109;
  int v110;
  int v111;
  void *v112;
  int v113;
  int v114;
  void *v115;
  int v116;
  int v117;
  void *v118;
  int v119;
  int v120;
  void *v121;
  int v122;
  int v123;
  void *v124;
  int v125;
  int v126;
  void *v127;
  int v128;
  int v129;
  void *v130;
  int v131;
  int v132;
  void *v133;
  int v134;
  int v135;
  void *v136;
  int v137;
  int v138;
  void *v139;
  int v140;
  int v141;
  void *v142;
  int v143;
  int v144;
  void *v145;
  int v146;
  int v147;
  void *v148;
  int v149;
  int v150;
  void *v151;
  int v152;
  int v153;
  void *v154;
  int v155;
  int v156;
  void *v157;
  int v158;
  int v159;
  void *v160;
  int v161;
  int v162;
  void *v163;
  int v164;
  int v165;
  void *v166;
  int v167;
  int v168;
  void *v169;
  int v170;
  int v171;
  void *v172;
  int v173;
  int v174;
  void *v175;
  int v176;
  int v177;
  void *v178;
  int v179;
  int v180;
  void *v181;
  int v182;
  int v183;
  void *v184;
  int v185;
  int v186;
  void *v187;
  int v188;
  int v189;
  void *v190;
  int v191;
  int v192;
  void *v193;
  int v194;
  int v195;
  void *v196;
  int v197;
  int v198;
  void *v199;
  int v200;
  int v201;
  void *v202;
  int v203;
  int v204;
  void *v205;
  int v206;
  int v207;
  void *v208;
  int v209;
  int v210;
  void *v211;
  NSDictionary *v212;
  NSDictionary *toneAdjustmentsTuning;
  int v214;
  SmartStyleRendererTuning *v216;
  __CFString *v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  uint64_t v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  int v239;
  _BYTE v240[128];
  uint64_t v241;

  v216 = self;
  v241 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v239 = 0;
  v217 = CFSTR("Tone");
  v4 = (void *)objc_opt_new();
  v235 = 0u;
  v236 = 0u;
  v237 = 0u;
  v238 = 0u;
  v5 = (NSDictionary *)v3;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v235, v240, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v236;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v236 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v235 + 1) + 8 * i);
        v234 = 0;
        v232 = 0u;
        v233 = 0u;
        v230 = 0u;
        v231 = 0u;
        v228 = 0u;
        v229 = 0u;
        v226 = 0u;
        v227 = 0u;
        v224 = 0u;
        v225 = 0u;
        v222 = 0u;
        v223 = 0u;
        v220 = 0u;
        v221 = 0u;
        v218 = 0u;
        v219 = 0u;
        getSubDict(v5, v10, &v239);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneMinusMids"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v12 = 0;
          v239 = 4;
        }
        objc_msgSend(v12, "floatValue", v216, v217);
        v14 = v13;

        LODWORD(v218) = v14;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneMinusExposure"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v15 = 0;
          v239 = 4;
        }
        objc_msgSend(v15, "floatValue");
        v17 = v16;

        DWORD1(v218) = v17;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneMinusPersonExposure"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v18 = 0;
          v239 = 4;
        }
        objc_msgSend(v18, "floatValue");
        v20 = v19;

        DWORD2(v218) = v20;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneMinusFGScale"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v21 = 0;
          v239 = 4;
        }
        objc_msgSend(v21, "floatValue");
        v23 = v22;

        HIDWORD(v218) = v23;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneMinusPersonSatScale"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v24 = 0;
          v239 = 4;
        }
        objc_msgSend(v24, "floatValue");
        v26 = v25;

        LODWORD(v219) = v26;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneMinusPersonContrastMax"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v27 = 0;
          v239 = 4;
        }
        objc_msgSend(v27, "floatValue");
        v29 = v28;

        DWORD1(v219) = v29;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneMinusPersonContrastScale"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v30 = 0;
          v239 = 4;
        }
        objc_msgSend(v30, "floatValue");
        v32 = v31;

        DWORD2(v219) = v32;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneMinusPersonSmartContrastScale"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v33 = 0;
          v239 = 4;
        }
        objc_msgSend(v33, "floatValue");
        v35 = v34;

        DWORD2(v220) = v35;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneMinusLTMRatio"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v36 = 0;
          v239 = 4;
        }
        objc_msgSend(v36, "floatValue");
        v38 = v37;

        DWORD1(v220) = v38;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneMinusContrastScale"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v39 = 0;
          v239 = 4;
        }
        objc_msgSend(v39, "floatValue");
        v41 = v40;

        HIDWORD(v219) = v41;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneMinusContrastMax"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v42 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v42 = 0;
          v239 = 4;
        }
        objc_msgSend(v42, "floatValue");
        v44 = v43;

        LODWORD(v220) = v44;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TonePlusPersonSatScale"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v45 = 0;
          v239 = 4;
        }
        objc_msgSend(v45, "floatValue");
        v47 = v46;

        HIDWORD(v220) = v47;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TonePlusFGScale"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v48 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v48 = 0;
          v239 = 4;
        }
        objc_msgSend(v48, "floatValue");
        v50 = v49;

        LODWORD(v221) = v50;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TonePlusExposure"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v51 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v51 = 0;
          v239 = 4;
        }
        objc_msgSend(v51, "floatValue");
        v53 = v52;

        DWORD1(v221) = v53;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TonePlusBGContrast"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v54 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v54 = 0;
          v239 = 4;
        }
        objc_msgSend(v54, "floatValue");
        v56 = v55;

        DWORD2(v221) = v56;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ColorCubeToneBiasMinGamma"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v57 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v57 = 0;
          v239 = 4;
        }
        objc_msgSend(v57, "floatValue");
        v59 = v58;

        HIDWORD(v221) = v59;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ColorCubeToneBiasMaxGamma"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v60 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v60 = 0;
          v239 = 4;
        }
        objc_msgSend(v60, "floatValue");
        v62 = v61;

        LODWORD(v222) = v62;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("starkBWBackgroundRed"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v63 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v63 = 0;
          v239 = 4;
        }
        objc_msgSend(v63, "floatValue");
        v65 = v64;

        DWORD1(v222) = v65;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("starkBWBackgroundGreen"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v66 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v66 = 0;
          v239 = 4;
        }
        objc_msgSend(v66, "floatValue");
        v68 = v67;

        DWORD2(v222) = v68;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("starkBWBackgroundBlue"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v69 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v69 = 0;
          v239 = 4;
        }
        objc_msgSend(v69, "floatValue");
        v71 = v70;

        HIDWORD(v222) = v71;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("starkBWWhitesMax"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v72 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v72 = 0;
          v239 = 4;
        }
        objc_msgSend(v72, "floatValue");
        v74 = v73;

        LODWORD(v223) = v74;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("longGrayLiftMix"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v75 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v75 = 0;
          v239 = 4;
        }
        objc_msgSend(v75, "floatValue");
        v77 = v76;

        HIDWORD(v234) = v77;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("defaultContrastBump"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v78 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v78 = 0;
          v239 = 4;
        }
        objc_msgSend(v78, "floatValue");
        v80 = v79;

        DWORD1(v223) = v80;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("defaultSatBump"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v81 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v81 = 0;
          v239 = 4;
        }
        objc_msgSend(v81, "floatValue");
        v83 = v82;

        DWORD2(v223) = v83;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("defaultMidsBump"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v84 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v84 = 0;
          v239 = 4;
        }
        objc_msgSend(v84, "floatValue");
        v86 = v85;

        HIDWORD(v223) = v86;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("defaultLightenBump"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v87 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v87 = 0;
          v239 = 4;
        }
        objc_msgSend(v87, "floatValue");
        v89 = v88;

        LODWORD(v224) = v89;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dfContrastBump"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v90 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v90 = 0;
          v239 = 4;
        }
        objc_msgSend(v90, "floatValue");
        v92 = v91;

        DWORD1(v224) = v92;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dfSatBump"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v93 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v93 = 0;
          v239 = 4;
        }
        objc_msgSend(v93, "floatValue");
        v95 = v94;

        DWORD2(v224) = v95;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dfMidsBump"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v96 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v96 = 0;
          v239 = 4;
        }
        objc_msgSend(v96, "floatValue");
        v98 = v97;

        HIDWORD(v224) = v98;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dfLightenBump"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v99 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v99 = 0;
          v239 = 4;
        }
        objc_msgSend(v99, "floatValue");
        v101 = v100;

        LODWORD(v225) = v101;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dfLowLightStarts"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v102 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v102 = 0;
          v239 = 4;
        }
        objc_msgSend(v102, "floatValue");
        v104 = v103;

        DWORD1(v225) = v104;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dfLowLightMax"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v105 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v105 = 0;
          v239 = 4;
        }
        objc_msgSend(v105, "floatValue");
        v107 = v106;

        *((float *)&v225 + 2) = v107;
        LODWORD(v108) = DWORD1(v225);
        if (*((float *)&v225 + 1) <= v107)
        {
          v239 = 4;
LABEL_210:

          toneAdjustmentsTuning = v5;
          goto LABEL_211;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dfLowLightContrastBump"), v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v109 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v109 = 0;
          v239 = 4;
        }
        objc_msgSend(v109, "floatValue");
        v111 = v110;

        HIDWORD(v225) = v111;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dfLowLightSatBump"));
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v112 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v112 = 0;
          v239 = 4;
        }
        objc_msgSend(v112, "floatValue");
        v114 = v113;

        LODWORD(v226) = v114;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dfLowLightMidsBump"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v115 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v115 = 0;
          v239 = 4;
        }
        objc_msgSend(v115, "floatValue");
        v117 = v116;

        DWORD1(v226) = v117;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dfLowLightLightenBump"));
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v118 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v118 = 0;
          v239 = 4;
        }
        objc_msgSend(v118, "floatValue");
        v120 = v119;

        DWORD2(v226) = v120;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ubContrastBump"));
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v121 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v121 = 0;
          v239 = 4;
        }
        objc_msgSend(v121, "floatValue");
        v123 = v122;

        HIDWORD(v226) = v123;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ubSatBump"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v124 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v124 = 0;
          v239 = 4;
        }
        objc_msgSend(v124, "floatValue");
        v126 = v125;

        LODWORD(v227) = v126;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ubMidsBump"));
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v127 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v127 = 0;
          v239 = 4;
        }
        objc_msgSend(v127, "floatValue");
        v129 = v128;

        DWORD1(v227) = v129;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ubLightenBump"));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v130 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v130 = 0;
          v239 = 4;
        }
        objc_msgSend(v130, "floatValue");
        v132 = v131;

        DWORD2(v227) = v132;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("digitalFlashContrastBump"));
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v133 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v133 = 0;
          v239 = 4;
        }
        objc_msgSend(v133, "floatValue");
        v135 = v134;

        HIDWORD(v227) = v135;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("digitalFlashSatBump"));
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v136 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v136 = 0;
          v239 = 4;
        }
        objc_msgSend(v136, "floatValue");
        v138 = v137;

        LODWORD(v228) = v138;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("digitalFlashMidsBump"));
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v139 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v139 = 0;
          v239 = 4;
        }
        objc_msgSend(v139, "floatValue");
        v141 = v140;

        DWORD1(v228) = v141;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("digitalFlashLightenBump"));
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v142 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v142 = 0;
          v239 = 4;
        }
        objc_msgSend(v142, "floatValue");
        v144 = v143;

        DWORD2(v228) = v144;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("swfrContrastBump"));
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v145 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v145 = 0;
          v239 = 4;
        }
        objc_msgSend(v145, "floatValue");
        v147 = v146;

        HIDWORD(v228) = v147;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("swfrSatBump"));
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v148 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v148 = 0;
          v239 = 4;
        }
        objc_msgSend(v148, "floatValue");
        v150 = v149;

        LODWORD(v229) = v150;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("swfrMidsBump"));
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v151 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v151 = 0;
          v239 = 4;
        }
        objc_msgSend(v151, "floatValue");
        v153 = v152;

        DWORD1(v229) = v153;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("swfrLightenBump"));
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v154 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v154 = 0;
          v239 = 4;
        }
        objc_msgSend(v154, "floatValue");
        v156 = v155;

        DWORD2(v229) = v156;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("wysContrastBump"));
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v157 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v157 = 0;
          v239 = 4;
        }
        objc_msgSend(v157, "floatValue");
        v159 = v158;

        HIDWORD(v229) = v159;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("wysSatBump"));
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v160 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v160 = 0;
          v239 = 4;
        }
        objc_msgSend(v160, "floatValue");
        v162 = v161;

        LODWORD(v230) = v162;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("wysMidsBump"));
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v163 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v163 = 0;
          v239 = 4;
        }
        objc_msgSend(v163, "floatValue");
        v165 = v164;

        DWORD1(v230) = v165;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("wysLightenBump"));
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v166 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v166 = 0;
          v239 = 4;
        }
        objc_msgSend(v166, "floatValue");
        v168 = v167;

        DWORD2(v230) = v168;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sfdContrastBump"));
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v169 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v169 = 0;
          v239 = 4;
        }
        objc_msgSend(v169, "floatValue");
        v171 = v170;

        HIDWORD(v230) = v171;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sfdSatBump"));
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v172 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v172 = 0;
          v239 = 4;
        }
        objc_msgSend(v172, "floatValue");
        v174 = v173;

        LODWORD(v231) = v174;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sfdMidsBump"));
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v175 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v175 = 0;
          v239 = 4;
        }
        objc_msgSend(v175, "floatValue");
        v177 = v176;

        DWORD1(v231) = v177;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sfdLightenBump"));
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v178 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v178 = 0;
          v239 = 4;
        }
        objc_msgSend(v178, "floatValue");
        v180 = v179;

        DWORD2(v231) = v180;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("videoContrastBump"));
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v181 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v181 = 0;
          v239 = 4;
        }
        objc_msgSend(v181, "floatValue");
        v183 = v182;

        HIDWORD(v231) = v183;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("videoSatBump"));
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v184 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v184 = 0;
          v239 = 4;
        }
        objc_msgSend(v184, "floatValue");
        v186 = v185;

        LODWORD(v232) = v186;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("videoMidsBump"));
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v187 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v187 = 0;
          v239 = 4;
        }
        objc_msgSend(v187, "floatValue");
        v189 = v188;

        DWORD1(v232) = v189;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("videoLightenBump"));
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v190 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v190 = 0;
          v239 = 4;
        }
        objc_msgSend(v190, "floatValue");
        v192 = v191;

        DWORD2(v232) = v192;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("foodToneScale"));
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v193 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v193 = 0;
          v239 = 4;
        }
        objc_msgSend(v193, "floatValue");
        v195 = v194;

        HIDWORD(v232) = v195;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("foodColorScale"));
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v196 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v196 = 0;
          v239 = 4;
        }
        objc_msgSend(v196, "floatValue");
        v198 = v197;

        LODWORD(v233) = v198;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("foodIntensityScale"));
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v199 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v199 = 0;
          v239 = 4;
        }
        objc_msgSend(v199, "floatValue");
        v201 = v200;

        DWORD1(v233) = v201;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sunsetToneScale"));
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v202 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v202 = 0;
          v239 = 4;
        }
        objc_msgSend(v202, "floatValue");
        v204 = v203;

        DWORD2(v233) = v204;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sunsetColorScale"));
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v205 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v205 = 0;
          v239 = 4;
        }
        objc_msgSend(v205, "floatValue");
        v207 = v206;

        HIDWORD(v233) = v207;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sunsetIntensityScale"));
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v208 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v208 = 0;
          v239 = 4;
        }
        objc_msgSend(v208, "floatValue");
        v210 = v209;

        LODWORD(v234) = v210;
        if (v239)
          goto LABEL_210;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v218, "{?=ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff}");
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v211, v10);

      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v235, v240, 16);
      if (v7)
        continue;
      break;
    }
  }

  v212 = v4;
  toneAdjustmentsTuning = v216->_toneAdjustmentsTuning;
  v216->_toneAdjustmentsTuning = v212;
LABEL_211:

  v214 = v239;
  return v214;
}

- (int)readColorAdjustmentsTuning:(id)a3
{
  id v3;
  void *v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  NSDictionary *v25;
  NSDictionary *colorAdjustmentsTuning;
  int v27;
  SmartStyleRendererTuning *v29;
  __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  int v37;
  _BYTE v38[128];
  uint64_t v39;

  v29 = self;
  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v37 = 0;
  v30 = CFSTR("Color");
  v4 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = (NSDictionary *)v3;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v31 = 0;
        v32 = 0;
        getSubDict(v5, v10, &v37);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("BWBackgroundHue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v12 = 0;
          v37 = 4;
        }
        objc_msgSend(v12, "floatValue", v29, v30);
        v14 = v13;

        LODWORD(v31) = v14;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("BWForegroundHue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v15 = 0;
          v37 = 4;
        }
        objc_msgSend(v15, "floatValue");
        v17 = v16;

        HIDWORD(v31) = v17;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ColorBoostScale"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v18 = 0;
          v37 = 4;
        }
        objc_msgSend(v18, "floatValue");
        v20 = v19;

        LODWORD(v32) = v20;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("shadMidHighPersonMix"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v21 = 0;
          v37 = 4;
        }
        objc_msgSend(v21, "floatValue");
        v23 = v22;

        HIDWORD(v32) = v23;
        if (v37)
        {

          colorAdjustmentsTuning = v5;
          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v31, "{?=ffff}");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, v10);

      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v7)
        continue;
      break;
    }
  }

  v25 = v4;
  colorAdjustmentsTuning = v29->_colorAdjustmentsTuning;
  v29->_colorAdjustmentsTuning = v25;
LABEL_23:

  v27 = v37;
  return v27;
}

- (int)readDefaultUserBias:(id)a3
{
  id v3;
  void *v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  CMIImmutableSmartStyleV1 *v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  NSDictionary *v28;
  NSDictionary *defaultUserBiasByCastType;
  SmartStyleRendererTuning *v31;
  __CFString *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v31 = self;
  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v32 = CFSTR("DefaultUserBias");
  v4 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = (NSDictionary *)v3;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v10, v31, v32, (_QWORD)v33);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CastIntensity"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v13 = 0;
        }
        else
        {

          v12 = 0;
          v13 = 4;
        }
        objc_msgSend(v12, "floatValue");
        v15 = v14;

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ColorBias"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v16 = 0;
          v13 = 4;
        }
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ToneBias"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          v19 = 0;
          v13 = 4;
        }
        objc_msgSend(v19, "floatValue");
        v21 = v20;

        if (v13)
          goto LABEL_22;
        v22 = [CMIImmutableSmartStyleV1 alloc];
        LODWORD(v23) = v15;
        LODWORD(v24) = v21;
        LODWORD(v25) = v18;
        v26 = -[CMIImmutableSmartStyleV1 initWithCastType:castIntensity:toneBias:colorBias:](v22, "initWithCastType:castIntensity:toneBias:colorBias:", v10, v23, v24, v25);
        if (!v26)
        {
          v13 = 4;
LABEL_22:

          defaultUserBiasByCastType = v5;
          goto LABEL_23;
        }
        v27 = (void *)v26;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, v10);

      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v7)
        continue;
      break;
    }
  }

  v28 = v4;
  v13 = 0;
  defaultUserBiasByCastType = v31->_defaultUserBiasByCastType;
  v31->_defaultUserBiasByCastType = v28;
LABEL_23:

  return v13;
}

- (NSDictionary)selectiveColorTuning
{
  return self->_selectiveColorTuning;
}

- (NSDictionary)castAdjustmentsTuning
{
  return self->_castAdjustmentsTuning;
}

- (NSDictionary)toneAdjustmentsTuning
{
  return self->_toneAdjustmentsTuning;
}

- (NSDictionary)colorAdjustmentsTuning
{
  return self->_colorAdjustmentsTuning;
}

- (NSDictionary)defaultUserBiasByCastType
{
  return self->_defaultUserBiasByCastType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultUserBiasByCastType, 0);
  objc_storeStrong((id *)&self->_colorAdjustmentsTuning, 0);
  objc_storeStrong((id *)&self->_toneAdjustmentsTuning, 0);
  objc_storeStrong((id *)&self->_castAdjustmentsTuning, 0);
  objc_storeStrong((id *)&self->_selectiveColorTuning, 0);
}

@end
