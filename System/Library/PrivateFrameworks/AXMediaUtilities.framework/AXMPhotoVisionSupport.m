@implementation AXMPhotoVisionSupport

+ (id)_deniedVoiceOverSceneClassificationLabels
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AXMPhotoVisionSupport__deniedVoiceOverSceneClassificationLabels__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_deniedVoiceOverSceneClassificationLabels_onceToken != -1)
    dispatch_once(&_deniedVoiceOverSceneClassificationLabels_onceToken, block);
  return (id)_deniedVoiceOverSceneClassificationLabels__DeniedLabels;
}

void __66__AXMPhotoVisionSupport__deniedVoiceOverSceneClassificationLabels__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("AXDeniedSceneClassificationLabelsForVoiceOver"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("labels"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_deniedVoiceOverSceneClassificationLabels__DeniedLabels;
  _deniedVoiceOverSceneClassificationLabels__DeniedLabels = v3;

}

+ (id)_deniedVoiceOverObjectClassificationLabels
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AXMPhotoVisionSupport__deniedVoiceOverObjectClassificationLabels__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_deniedVoiceOverObjectClassificationLabels_onceToken != -1)
    dispatch_once(&_deniedVoiceOverObjectClassificationLabels_onceToken, block);
  return (id)_deniedVoiceOverObjectClassificationLabels__DeniedLabels;
}

void __67__AXMPhotoVisionSupport__deniedVoiceOverObjectClassificationLabels__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("AXDeniedObjectClassificationLabelsForVoiceOver"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("labels"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_deniedVoiceOverObjectClassificationLabels__DeniedLabels;
  _deniedVoiceOverObjectClassificationLabels__DeniedLabels = v3;

}

+ (id)processSceneClassifications:(id)a3 withOptions:(unsigned int)a4
{
  char v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v30;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getPFSceneTaxonomyClass(), "sharedTaxonomy");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
        if ((v4 & 4) == 0
          || (objc_msgSend(a1, "_deniedVoiceOverSceneClassificationLabels"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v12, "identifier"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v13, "containsObject:", v14),
              v14,
              v13,
              (v15 & 1) == 0))
        {
          objc_msgSend(v12, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "nodeForName:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            if ((v4 & 1) == 0
              || (objc_msgSend(v12, "confidence"), v19 = v18, objc_msgSend(v17, "searchThreshold"), v20 < v19))
            {
              objc_msgSend(v30, "addObject:", v17);
            }
          }

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v9);
  }

  if ((v4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __65__AXMPhotoVisionSupport_processSceneClassifications_withOptions___block_invoke;
    v37[3] = &unk_1E625DB40;
    v38 = v21;
    v22 = v21;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v37);
    objc_msgSend(v30, "minusSet:", v22);

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = v30;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v34;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v23);
        +[AXMPhotoVisionSupport axmTaxonomyNodeForSceneTaxonomyNode:](AXMPhotoVisionSupport, "axmTaxonomyNodeForSceneTaxonomyNode:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v27));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v25);
  }

  return v7;
}

void __65__AXMPhotoVisionSupport_processSceneClassifications_withOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AXMPhotoVisionSupport_processSceneClassifications_withOptions___block_invoke_2;
  v5[3] = &unk_1E625DB18;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  objc_msgSend(v4, "traverse:visitor:", 0, v5);

}

uint64_t __65__AXMPhotoVisionSupport_processSceneClassifications_withOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return 0;
}

+ (id)localizedLabelForClassificationObservation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(getPFSceneTaxonomyClass(), "sharedTaxonomy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "nodeForName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)axmTaxonomyNodeForObjectObservation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(getPFSceneTaxonomyClass(), "sharedTaxonomy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nodeForName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXMPhotoVisionSupport axmTaxonomyNodeForSceneTaxonomyNode:](AXMPhotoVisionSupport, "axmTaxonomyNodeForSceneTaxonomyNode:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)axmIsSceneClassId:(unsigned int)a3 childOfSceneClassId:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  objc_msgSend(getPFSceneTaxonomyClass(), "sharedTaxonomy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodeForSceneClassId:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodeForSceneClassId:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__AXMPhotoVisionSupport_axmIsSceneClassId_childOfSceneClassId___block_invoke;
  v15[3] = &unk_1E625DB68;
  v16 = v7;
  v10 = v7;
  objc_msgSend(v9, "ax_filteredSetUsingBlock:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqualToNode:", v10) ^ 1;
  if (v11)
    v13 = 1;
  else
    v13 = v12;

  return v13;
}

uint64_t __63__AXMPhotoVisionSupport_axmIsSceneClassId_childOfSceneClassId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToNode:", *(_QWORD *)(a1 + 32));
}

+ (id)findLeastCommonAncestorForSceneClassIds:(id)a3 withKnownAncestorSceneClassId:(unsigned int)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  unsigned int v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  unsigned int v39;
  _QWORD v40[4];
  id v41;
  id v42;

  v5 = a3;
  objc_msgSend(getPFSceneTaxonomyClass(), "sharedTaxonomy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke;
  v40[3] = &unk_1E625C918;
  v9 = v6;
  v41 = v9;
  v10 = v7;
  v42 = v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v40);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v37[0] = v8;
  v37[1] = 3221225472;
  v37[2] = __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_2;
  v37[3] = &unk_1E625DBB8;
  v31 = a4;
  v39 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v38 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v37);
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0xFFFFFFFFLL;
  v32[0] = v8;
  v32[1] = 3221225472;
  v32[2] = __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_4;
  v32[3] = &unk_1E625DBE0;
  v32[4] = &v33;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v32);
  v29 = v10;
  v30 = v9;
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", v34[3] - 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "sceneClassId");

  v16 = v34[3];
LABEL_2:
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", --v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "sceneClassId");

  v20 = 1;
  do
  {
    if (v20 >= objc_msgSend(v5, "count"))
    {
      v15 = v19;
      goto LABEL_2;
    }
    objc_msgSend(v12, "objectAtIndexedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "sceneClassId");

    ++v20;
  }
  while ((_DWORD)v19 == v23);
  if (+[AXMPhotoVisionSupport axmIsSceneClassId:childOfSceneClassId:](AXMPhotoVisionSupport, "axmIsSceneClassId:childOfSceneClassId:", v15, v31))
  {
    v25 = v15;
  }
  else
  {
    v25 = v31;
  }
  objc_msgSend(v30, "nodeForSceneClassId:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXMPhotoVisionSupport axmTaxonomyNodeForSceneTaxonomyNode:](AXMPhotoVisionSupport, "axmTaxonomyNodeForSceneTaxonomyNode:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v33, 8);
  return v27;
}

void __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "nodeForSceneClassId:", objc_msgSend(a2, "intValue"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  int v17;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_3;
  v15 = &unk_1E625DB90;
  v17 = *(_DWORD *)(a1 + 40);
  v16 = v5;
  v6 = v5;
  objc_msgSend(v4, "traverse:visitor:", 0, &v12);
  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v4, "sceneClassId", v12, v13, v14, v15);

  objc_msgSend(v8, "numberWithUnsignedInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v6, v11);

}

BOOL __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "sceneClassId");
  v5 = *(_DWORD *)(a1 + 40);
  if (v4 != v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return v4 == v5;
}

void __95__AXMPhotoVisionSupport_findLeastCommonAncestorForSceneClassIds_withKnownAncestorSceneClassId___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "count");

}

+ (BOOL)_validatePhotosFormatSoftLinkSymbols
{
  if (_validatePhotosFormatSoftLinkSymbols_onceToken != -1)
    dispatch_once(&_validatePhotosFormatSoftLinkSymbols_onceToken, &__block_literal_global_12);
  return (_validatePhotosFormatSoftLinkSymbols__SymbolsValid & 1) == 0;
}

void __61__AXMPhotoVisionSupport__validatePhotosFormatSoftLinkSymbols__block_invoke()
{
  NSObject *v0;

  if (!PhotosFormatsLibraryCore_frameworkLibrary)
    PhotosFormatsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PhotosFormatsLibraryCore_frameworkLibrary)
  {
    AXMediaLogCommon();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __61__AXMPhotoVisionSupport__validatePhotosFormatSoftLinkSymbols__block_invoke_cold_1(v0);

    _validatePhotosFormatSoftLinkSymbols__SymbolsValid = 1;
  }
}

+ (id)buildTaxonomyDescription
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getPFSceneTaxonomyClass(), "sharedTaxonomy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_addNode:toDescription:atLevel:", v5, v3, 0);

  return v3;
}

+ (void)_addNode:(id)a3 toDescription:(id)a4 atLevel:(int64_t)a5
{
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a5 >= 1)
  {
    v10 = a5;
    do
    {
      objc_msgSend(v9, "appendString:", CFSTR("   "));
      --v10;
    }
    while (v10);
  }
  objc_msgSend(v8, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchThreshold");
  objc_msgSend(v9, "appendFormat:", CFSTR("%@ - localized:'%@' threshold:%.2f\n"), v11, v12, v13);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v8, "children");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    v18 = a5 + 1;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(a1, "_addNode:toDescription:atLevel:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), v9, v18);
      }
      while (v16 != v19);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

}

+ (id)buildParentChainDescriptionForAllNodes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[4];

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getPFSceneTaxonomyClass(), "sharedTaxonomy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AXMPhotoVisionSupport_buildParentChainDescriptionForAllNodes__block_invoke;
  v7[3] = &unk_1E625DC30;
  v5 = v2;
  v8 = v5;
  v9 = v10;
  objc_msgSend(v4, "traverse:visitor:", 1, v7);

  _Block_object_dispose(v10, 8);
  return v5;
}

uint64_t __63__AXMPhotoVisionSupport_buildParentChainDescriptionForAllNodes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%ld .) %@\n"), v4, v6);

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__AXMPhotoVisionSupport_buildParentChainDescriptionForAllNodes__block_invoke_2;
  v10[3] = &unk_1E625DC08;
  v11 = v7;
  v8 = v7;
  objc_msgSend(v5, "traverse:visitor:", 0, v10);

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("   %@\n\n"), v8);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return 0;
}

uint64_t __63__AXMPhotoVisionSupport_buildParentChainDescriptionForAllNodes__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "length");
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = CFSTR(" > %@");
  else
    v8 = CFSTR("%@");
  objc_msgSend(v6, "appendFormat:", v8, v7);

  return 0;
}

+ (id)_collectLabelsIncludingLeafNodes:(BOOL)a3 nonLeafNodes:(BOOL)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getPFSceneTaxonomyClass(), "sharedTaxonomy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  while (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
    objc_msgSend(v11, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v13);

      if (!a4)
        goto LABEL_6;
LABEL_5:
      objc_msgSend(v11, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v14);

      goto LABEL_6;
    }
    if (v5)
      goto LABEL_5;
LABEL_6:

    v9 = v10;
  }

  return v6;
}

+ (id)buildGraphStatisticsDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getPFSceneTaxonomyClass(), "sharedTaxonomy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__AXMPhotoVisionSupport_buildGraphStatisticsDescription__block_invoke;
  v11[3] = &unk_1E625DC58;
  v13 = &v14;
  v6 = v5;
  v12 = v6;
  objc_msgSend(v4, "traverse:visitor:", 1, v11);
  objc_msgSend(a1, "leafNodeLabels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nonLeafNodeLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("Total nodes in graph via PV traverse API: %ld\nTotal nodes in graph via PV traverse API (removing visit duplicates): %ld\nLeaf nodes in graph via AX API: %ld\nNon-leaf nodes in graph via AX API: %ld\nTotal nodes in graph via AX API: %ld"), v15[3], objc_msgSend(v6, "count"), objc_msgSend(v7, "count"), objc_msgSend(v8, "count"), objc_msgSend(v8, "count") + objc_msgSend(v7, "count"));

  _Block_object_dispose(&v14, 8);
  return v10;
}

uint64_t __56__AXMPhotoVisionSupport_buildGraphStatisticsDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 0;
}

+ (id)leafNodeLabels
{
  return (id)objc_msgSend(a1, "_collectLabelsIncludingLeafNodes:nonLeafNodes:", 1, 0);
}

+ (id)nonLeafNodeLabels
{
  return (id)objc_msgSend(a1, "_collectLabelsIncludingLeafNodes:nonLeafNodes:", 0, 1);
}

+ (id)axmTaxonomyNodeForSceneTaxonomyNode:(id)a3
{
  id v3;
  AXMTaxonomyNode *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  v4 = objc_alloc_init(AXMTaxonomyNode);
  objc_msgSend(v3, "searchThreshold");
  -[AXMTaxonomyNode setConfidence:](v4, "setConfidence:");
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMTaxonomyNode setLabel:](v4, "setLabel:", v5);

  objc_msgSend(v3, "localizedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMTaxonomyNode setLocalizedName:](v4, "setLocalizedName:", v6);

  -[AXMTaxonomyNode setSceneClassId:](v4, "setSceneClassId:", objc_msgSend(v3, "sceneClassId"));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detectors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__AXMPhotoVisionSupport_axmTaxonomyNodeForSceneTaxonomyNode___block_invoke;
  v11[3] = &unk_1E625DB40;
  v12 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  -[AXMTaxonomyNode setDetectorSceneClassIds:](v4, "setDetectorSceneClassIds:", v9);
  return v4;
}

void __61__AXMPhotoVisionSupport_axmTaxonomyNodeForSceneTaxonomyNode___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a2, "sceneClassId"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __61__AXMPhotoVisionSupport__validatePhotosFormatSoftLinkSymbols__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Cannot process scenes. Soft link PhotosFormat framework didn't work", v1, 2u);
}

@end
