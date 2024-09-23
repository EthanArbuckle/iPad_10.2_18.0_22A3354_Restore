@implementation CLSClassificationInformant

+ (id)familyIdentifier
{
  __CFString *v2;

  v2 = CFSTR("com.apple.mediaminingkit.informant.content");
  return CFSTR("com.apple.mediaminingkit.informant.content");
}

+ (id)classIdentifier
{
  return CFSTR("classification");
}

+ (id)informantDependenciesIdentifiers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (double)_confidenceForCount:(unint64_t)a3 mu:(double)a4 sigma:(double)a5
{
  double v5;

  v5 = (double)a3;
  if (a4 != 0.0 && v5 < a4)
    return exp(-((v5 - a4) * (v5 - a4)) / (a5 * a5 + a5 * a5));
  else
    return 1.0;
}

- (id)_gatherVisualLookupSceneCluesForInvestigation:(id)a3 progressBlock:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _BYTE v51[128];
  int buf;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v30 = a4;
  v5 = (void *)MEMORY[0x1D1796244]();
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "feeder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __90__CLSClassificationInformant__gatherVisualLookupSceneCluesForInvestigation_progressBlock___block_invoke;
  v41[3] = &unk_1E84F9408;
  v31 = v6;
  v42 = v31;
  v8 = v5;
  v43 = v8;
  v44 = &v45;
  objc_msgSend(v7, "enumerateItemsUsingBlock:", v41);

  if (*((_BYTE *)v46 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 67109120;
      v53 = 88;
      _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v10 = objc_msgSend(v32, "numberOfItems");
    objc_msgSend(v32, "helper");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = v31;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    v33 = (void *)v11;
    if (v13)
    {
      v14 = (double)v10 * 0.5;
      v15 = -(v14 - (double)v10 * 0.68);
      v16 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v19 = objc_msgSend(v12, "countForObject:", v18);
          -[CLSClassificationInformant _confidenceForCount:mu:sigma:](self, "_confidenceForCount:mu:sigma:", v19, v14, v15);
          v21 = v20;
          objc_msgSend(v34, "visualLookupSceneNameForSceneIdentifier:", objc_msgSend(v18, "unsignedIntValue"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            +[CLSOutputClue clueWithValue:forKey:confidence:relevance:](CLSOutputClue, "clueWithValue:forKey:confidence:relevance:", v22, CFSTR("kCLSClassificationPECInformantKey"), v21, 1.0);
            v23 = objc_claimAutoreleasedReturnValue();
            v49[0] = CFSTR("numberOfAssetsd");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v49[1] = CFSTR("sceneIdentifier");
            v50[0] = v24;
            v50[1] = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setExtraParameters:](v23, "setExtraParameters:", v25);

            objc_msgSend(v33, "addObject:", v23);
          }
          else
          {
            +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "loggingConnection");
            v23 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              _os_log_error_impl(&dword_1CAB79000, v23, OS_LOG_TYPE_ERROR, "No visual lookup scene name found", (uint8_t *)&buf, 2u);
            }
          }

          if (v8)
          {
            v36 = 0;
            (*((void (**)(id, char *, double))v8 + 2))(v8, &v36, 0.7);
            v27 = *((_BYTE *)v46 + 24) | v36;
            *((_BYTE *)v46 + 24) = v27;
            if (v27)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                buf = 67109120;
                v53 = 112;
                _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
              }

              v9 = (id)MEMORY[0x1E0C9AA60];
              v28 = v33;
              goto LABEL_22;
            }
          }

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
        if (v13)
          continue;
        break;
      }
    }

    v28 = v33;
    v9 = v33;
LABEL_22:

  }
  _Block_object_dispose(&v45, 8);

  return v9;
}

- (id)_gatherSceneCluesForInvestigation:(id)a3 signalModelProviderBlock:(id)a4 informantKey:(id)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  id obja;
  id obj;
  void *v71;
  id v72;
  char v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  char v95;
  _QWORD v96[5];
  _QWORD v97[5];
  _BYTE v98[128];
  int buf;
  int v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v58 = a5;
  v11 = a6;
  v12 = MEMORY[0x1D1796244]();
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v95 = 0;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v15 = objc_claimAutoreleasedReturnValue();
  v54 = v11;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v9, "numberOfItems");
  v67 = (void *)v16;
  obja = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = (void *)v15;
  v71 = (void *)v12;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "helper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "feeder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __116__CLSClassificationInformant__gatherSceneCluesForInvestigation_signalModelProviderBlock_informantKey_progressBlock___block_invoke;
  v79[3] = &unk_1E84F9468;
  v53 = v10;
  v89 = v53;
  v55 = v20;
  v80 = v55;
  v60 = v17;
  v81 = v60;
  v56 = v14;
  v82 = v56;
  v59 = v19;
  v83 = v59;
  v62 = v18;
  v84 = v62;
  v61 = v67;
  v85 = v61;
  v52 = v9;
  v86 = v52;
  v63 = obja;
  v87 = v63;
  v68 = v13;
  v88 = v68;
  v72 = v71;
  v90 = v72;
  v91 = &v92;
  objc_msgSend(v21, "enumerateItemsUsingBlock:", v79);

  if (*((_BYTE *)v93 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 67109120;
      v100 = 230;
      _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
    }
    v22 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = v56;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v98, 16);
    v57 = (void *)v23;
    if (v24)
    {
      v25 = (double)v65 * 0.5;
      v26 = -(v25 - (double)v65 * 0.68);
      v64 = *(_QWORD *)v76;
      while (2)
      {
        v27 = 0;
        v66 = v24;
        do
        {
          if (*(_QWORD *)v76 != v64)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v27);
          v29 = objc_msgSend(obj, "countForObject:", v28);
          -[CLSClassificationInformant _confidenceForCount:mu:sigma:](self, "_confidenceForCount:mu:sigma:", v29, v25, v26);
          v31 = v30;
          -[CLSClassificationInformant _confidenceForCount:mu:sigma:](self, "_confidenceForCount:mu:sigma:", objc_msgSend(v68, "countForObject:", v28), v25, v26);
          v33 = v32;
          if (v32 >= 0.3)
          {
            objc_msgSend(v63, "objectForKeyedSubscript:", v28);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "weight");
            v36 = v35;
            v37 = objc_msgSend(v62, "countForObject:", v28);
            v38 = objc_msgSend(v61, "countForObject:", v28);
            v39 = objc_msgSend(v60, "countForObject:", v28);
            v40 = objc_msgSend(v34, "level");
            objc_msgSend(v59, "objectForKeyedSubscript:", v28);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            +[CLSOutputClue clueWithValue:forKey:confidence:relevance:](CLSOutputClue, "clueWithValue:forKey:confidence:relevance:", v41, v58, v33 * v36, (double)v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v96[0] = CFSTR("numberOfAssetsd");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v97[0] = v43;
            v96[1] = CFSTR("isReliable");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31 >= 0.3);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v97[1] = v44;
            v96[2] = CFSTR("numberOfHighConfidenceAssets");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v97[2] = v45;
            v96[3] = CFSTR("numberOfSearchConfidenceAssets");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v38);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v97[3] = v46;
            v96[4] = CFSTR("numberOfDominantSceneAssets");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v97[4] = v47;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 5);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setExtraParameters:", v48);

            objc_msgSend(v57, "addObject:", v42);
          }
          if (v72)
          {
            v74 = 0;
            (*((void (**)(id, char *, double))v72 + 2))(v72, &v74, 0.7);
            v49 = *((_BYTE *)v93 + 24) | v74;
            *((_BYTE *)v93 + 24) = v49;
            if (v49)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                buf = 67109120;
                v100 = 268;
                _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
              }

              v22 = (id)MEMORY[0x1E0C9AA60];
              v50 = v57;
              goto LABEL_20;
            }
          }
          ++v27;
        }
        while (v66 != v27);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v98, 16);
        if (v24)
          continue;
        break;
      }
    }

    v50 = v57;
    v22 = v57;
LABEL_20:

  }
  _Block_object_dispose(&v92, 8);

  return v22;
}

- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, _BYTE *);
  void *v23;
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = (void *)MEMORY[0x1D1796244](v7);
  v10 = v8;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2;
  v29[3] = &unk_1E84F94F0;
  v12 = v9;
  v30 = v12;
  v31 = &v32;
  -[CLSClassificationInformant _gatherSceneCluesForInvestigation:signalModelProviderBlock:informantKey:progressBlock:](self, "_gatherSceneCluesForInvestigation:signalModelProviderBlock:informantKey:progressBlock:", v6, &__block_literal_global_7411, CFSTR("kCLSClassificationInformantKey"), v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v13);
  if (*((_BYTE *)v33 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v37 = 287;
      v14 = MEMORY[0x1E0C81028];
LABEL_10:
      _os_log_impl(&dword_1CAB79000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
    }
  }
  else
  {
    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      v26[0] = v11;
      v26[1] = 3221225472;
      v26[2] = __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2_42;
      v26[3] = &unk_1E84F94F0;
      v27 = v12;
      v28 = &v32;
      -[CLSClassificationInformant _gatherSceneCluesForInvestigation:signalModelProviderBlock:informantKey:progressBlock:](self, "_gatherSceneCluesForInvestigation:signalModelProviderBlock:informantKey:progressBlock:", v6, &__block_literal_global_41, CFSTR("kCLSClassificationEntityNetInformantKey"), v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v15);

    }
    if (!*((_BYTE *)v33 + 24))
    {
      v20 = v11;
      v21 = 3221225472;
      v22 = __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_43;
      v23 = &unk_1E84F94F0;
      v24 = v12;
      v25 = &v32;
      -[CLSClassificationInformant _gatherVisualLookupSceneCluesForInvestigation:progressBlock:](self, "_gatherVisualLookupSceneCluesForInvestigation:progressBlock:", v6, &v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v18, v20, v21, v22, v23);
      v19 = v10;

      goto LABEL_12;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v37 = 299;
      v14 = MEMORY[0x1E0C81028];
      goto LABEL_10;
    }
  }
  v16 = v10;
LABEL_12:

  _Block_object_dispose(&v32, 8);
  return v10;
}

uint64_t __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

uint64_t __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_2_42(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

uint64_t __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_43(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

id __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke_39(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entityNetModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __72__CLSClassificationInformant_gatherCluesForInvestigation_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "curationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __116__CLSClassificationInformant__gatherSceneCluesForInvestigation_signalModelProviderBlock_informantKey_progressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  uint64_t v48;
  _BYTE *v49;
  void *context;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  char v58;
  _QWORD v59[4];
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v49 = a4;
  v77 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  context = (void *)MEMORY[0x1D1796094]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v5;
  objc_msgSend(v5, "clsSceneClassifications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v71 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(v13, "confidence", v49);
        v15 = v14;
        v16 = objc_msgSend(v13, "extendedSceneIdentifier");
        objc_msgSend(v13, "boundingBox");
        v18 = v17;
        v20 = v19;
        objc_msgSend(*(id *)(a1 + 32), "taxonomyNodeForSceneIdentifier:sceneModel:", v16, v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "searchThreshold");
          if (v15 >= v23 && v18 > 0.0 && v20 > 0.0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v24);
            objc_msgSend(v7, "addObject:", v24);

          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    }
    while (v10);
  }
  v68 = 0u;
  v69 = 0u;
  v67 = 0u;
  v66 = 0u;
  v25 = v8;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v67;
    v53 = v25;
    v54 = v6;
    v52 = *(_QWORD *)v67;
    while (2)
    {
      v29 = 0;
      v55 = v27;
      do
      {
        if (*(_QWORD *)v67 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v29);
        objc_msgSend(v30, "confidence", v49);
        v32 = v31;
        v33 = objc_msgSend(v30, "extendedSceneIdentifier");
        objc_msgSend(*(id *)(a1 + 32), "taxonomyNodeForSceneIdentifier:sceneModel:", v33, v6);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v57 = v34;
          objc_msgSend(v34, "graphHighRecallThreshold");
          v34 = v57;
          if (v32 >= v35)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v33);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v36);
            objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v36);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v56)
            {
              objc_msgSend(v57, "name");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v37, v36);

            }
            objc_msgSend(v57, "graphHighPrecisionThreshold");
            if (v32 >= v38)
              objc_msgSend(*(id *)(a1 + 64), "addObject:", v36);
            objc_msgSend(v57, "searchThreshold");
            if (v32 >= v39)
            {
              objc_msgSend(*(id *)(a1 + 72), "addObject:", v36);
              if (objc_msgSend(v7, "count"))
              {
                v64 = 0u;
                v65 = 0u;
                v62 = 0u;
                v63 = 0u;
                objc_msgSend(*(id *)(a1 + 80), "helper");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "parentNodesOfTaxonomyNode:", v57);
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
                if (v42)
                {
                  v43 = v42;
                  v44 = *(_QWORD *)v63;
                  do
                  {
                    for (j = 0; j != v43; ++j)
                    {
                      if (*(_QWORD *)v63 != v44)
                        objc_enumerationMutation(v41);
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "extendedSceneClassId"));
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v7, "containsObject:", v46)
                        && (objc_msgSend(v7, "containsObject:", v36) & 1) == 0)
                      {
                        objc_msgSend(*(id *)(a1 + 40), "addObject:", v36);
                      }

                    }
                    v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
                  }
                  while (v43);
                }

                v25 = v53;
                v6 = v54;
                v28 = v52;
              }
            }
            v47 = *(void **)(a1 + 32);
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __116__CLSClassificationInformant__gatherSceneCluesForInvestigation_signalModelProviderBlock_informantKey_progressBlock___block_invoke_2;
            v59[3] = &unk_1E84F9440;
            v60 = *(id *)(a1 + 88);
            v61 = *(id *)(a1 + 96);
            objc_msgSend(v47, "enumerateTaxonomyNodesLevelsAndWeightsStartingWithNode:usingBlock:", v57, v59);
            v48 = *(_QWORD *)(a1 + 112);
            if (v48)
            {
              v58 = 0;
              (*(void (**)(uint64_t, char *, double))(v48 + 16))(v48, &v58, 0.5);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) |= v58;
              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24))
              {
                *v49 = 1;

                goto LABEL_44;
              }
            }

            v27 = v55;
            v34 = v57;
          }
        }

        ++v29;
      }
      while (v29 != v27);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      if (v27)
        continue;
      break;
    }
  }
LABEL_44:

  objc_autoreleasePoolPop(context);
}

void __116__CLSClassificationInformant__gatherSceneCluesForInvestigation_signalModelProviderBlock_informantKey_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v10 = v3;
  objc_msgSend(v3, "taxonomyNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "extendedSceneClassId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (v9 = objc_msgSend(v7, "level"), v9 > objc_msgSend(v10, "level")))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __90__CLSClassificationInformant__gatherVisualLookupSceneCluesForInvestigation_progressBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BYTE *v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v16 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1D1796094]();
  objc_msgSend(v5, "clsVisualLookupSceneClassifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "extendedSceneIdentifier", v16);
        v13 = (void *)a1[4];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  v15 = a1[5];
  if (v15)
  {
    v17 = 0;
    (*(void (**)(uint64_t, char *, double))(v15 + 16))(v15, &v17, 0.5);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) |= v17;
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      *v16 = 1;
  }

  objc_autoreleasePoolPop(v6);
}

@end
