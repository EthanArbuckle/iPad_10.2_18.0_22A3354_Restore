@implementation PFSceneTaxonomy(MediaAnalysis)

+ (id)vcp_sharedTaxonomy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PFSceneTaxonomy_MediaAnalysis__vcp_sharedTaxonomy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::once != -1)
    dispatch_once(&+[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::once, block);
  return (id)+[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::instance;
}

+ (uint64_t)mad_isExpectedTaxonomy
{
  if (+[PFSceneTaxonomy(MediaAnalysis) mad_isExpectedTaxonomy]::once != -1)
    dispatch_once(&+[PFSceneTaxonomy(MediaAnalysis) mad_isExpectedTaxonomy]::once, &__block_literal_global_65);
  return +[PFSceneTaxonomy(MediaAnalysis) mad_isExpectedTaxonomy]::isLatest;
}

+ (id)mad_audioTaxonomy:()MediaAnalysis useResultsKey:
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!a4)
      return &unk_1E6B76B70;
    v12[0] = CFSTR("ApplauseResults");
    v12[1] = CFSTR("BabbleResults");
    v13[0] = &unk_1E6B749F0;
    v13[1] = &unk_1E6B74A08;
    v12[2] = CFSTR("CheeringResults");
    v12[3] = CFSTR("LaughterResults");
    v13[2] = &unk_1E6B74A20;
    v13[3] = &unk_1E6B74A38;
    v12[4] = CFSTR("MusicResults");
    v12[5] = CFSTR("VoiceResults");
    v13[4] = &unk_1E6B74A50;
    v13[5] = &unk_1E6B74A68;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v13;
    v6 = v12;
  }
  else if (a4)
  {
    v10[0] = &unk_1E6B749F0;
    v10[1] = &unk_1E6B74A08;
    v11[0] = CFSTR("ApplauseResults");
    v11[1] = CFSTR("BabbleResults");
    v10[2] = &unk_1E6B74A20;
    v10[3] = &unk_1E6B74A38;
    v11[2] = CFSTR("CheeringResults");
    v11[3] = CFSTR("LaughterResults");
    v10[4] = &unk_1E6B74A50;
    v10[5] = &unk_1E6B74A68;
    v11[4] = CFSTR("MusicResults");
    v11[5] = CFSTR("VoiceResults");
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v11;
    v6 = v10;
  }
  else
  {
    v8[0] = &unk_1E6B749F0;
    v8[1] = &unk_1E6B74A08;
    v9[0] = CFSTR("applause");
    v9[1] = CFSTR("babble");
    v8[2] = &unk_1E6B74A20;
    v8[3] = &unk_1E6B74A38;
    v9[2] = CFSTR("cheering");
    v9[3] = CFSTR("laughter");
    v8[4] = &unk_1E6B74A50;
    v8[5] = &unk_1E6B74A68;
    v9[4] = CFSTR("music");
    v9[5] = CFSTR("voice");
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v9;
    v6 = v8;
  }
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mad_sceneNameFromExtendedSceneId:()MediaAnalysis
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "nodeForExtendedSceneClassId:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VCPSpecialLabelFromExtendedSceneClassificationID(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (v7)
    {
      v8 = v7;
    }
    else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[PFSceneTaxonomy(MediaAnalysis)] - Failed find scene name for scene id %llu", (uint8_t *)&v10, 0xCu);
    }

  }
  return v6;
}

- (id)mad_extendedSceneIdFromSceneName:()MediaAnalysis
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "nodeForName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "sceneClassId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VCPSpecialLabelToExtendedSceneClassificationID(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      v9 = v8;
    }
    else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[PFSceneTaxonomy(MediaAnalysis)] - Failed to find scene id for scene name %@", (uint8_t *)&v11, 0xCu);
    }

  }
  return v7;
}

- (id)mad_allAncestorsForSceneId:()MediaAnalysis
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  id v24;
  int v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodeForSceneClassId:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v24 = v5;
    objc_msgSend(v5, "parents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    while (1)
    {
      v26 = v6;
      if (!objc_msgSend(v6, "count"))
        break;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v7 = v26;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v37 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if ((objc_msgSend(v11, "isRoot") & 1) == 0)
              objc_msgSend(v27, "addObject:", v11);
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        }
        while (v8);
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v13 = v7;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v33 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            objc_msgSend(v17, "parents");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
            if (v19)
            {
              v20 = *(_QWORD *)v29;
              do
              {
                for (k = 0; k != v19; ++k)
                {
                  if (*(_QWORD *)v29 != v20)
                    objc_enumerationMutation(v18);
                  v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * k);
                  if ((objc_msgSend(v22, "isRoot") & 1) == 0)
                    objc_msgSend(v12, "addObject:", v22);
                }
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
              }
              while (v19);
            }

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v14);
      }

      v6 = v12;
      if (++v25 == 10)
        goto LABEL_32;
    }
    v12 = v26;
LABEL_32:

    v5 = v24;
  }

  return v27;
}

@end
