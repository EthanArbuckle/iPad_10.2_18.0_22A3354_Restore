@implementation WFEncodeMediaAction

- (id)nonEmptyStringValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFEncodeMediaAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)getMetadataItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  id *v19;
  void *v20;
  id v21;
  void *v22;
  id *v23;
  void *v24;
  id v25;
  void *v26;
  id *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v36 = a3;
  -[WFEncodeMediaAction nonEmptyStringValueForKey:](self, "nonEmptyStringValueForKey:", CFSTR("WFMetadataTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEncodeMediaAction nonEmptyStringValueForKey:](self, "nonEmptyStringValueForKey:", CFSTR("WFMetadataArtist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEncodeMediaAction nonEmptyStringValueForKey:](self, "nonEmptyStringValueForKey:", CFSTR("WFMetadataAlbum"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEncodeMediaAction nonEmptyStringValueForKey:](self, "nonEmptyStringValueForKey:", CFSTR("WFMetadataGenre"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEncodeMediaAction nonEmptyStringValueForKey:](self, "nonEmptyStringValueForKey:", CFSTR("WFMetadataYear"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEncodeMediaAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMetadataArtwork"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  if (v4)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v11 = (id *)getAVMetadataCommonIdentifierTitleSymbolLoc_ptr;
    v43 = getAVMetadataCommonIdentifierTitleSymbolLoc_ptr;
    if (!getAVMetadataCommonIdentifierTitleSymbolLoc_ptr)
    {
      v12 = AVFoundationLibrary_45394();
      v11 = (id *)dlsym(v12, "AVMetadataCommonIdentifierTitle");
      v41[3] = (uint64_t)v11;
      getAVMetadataCommonIdentifierTitleSymbolLoc_ptr = (uint64_t)v11;
    }
    _Block_object_dispose(&v40, 8);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataIdentifier getAVMetadataCommonIdentifierTitle(void)");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFEncodeMediaAction.m"), 33, CFSTR("%s"), dlerror());
      goto LABEL_38;
    }
    v13 = *v11;
    WFMakeMetadataItem(v13, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

  }
  if (v5)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v15 = (id *)getAVMetadataCommonIdentifierArtistSymbolLoc_ptr;
    v43 = getAVMetadataCommonIdentifierArtistSymbolLoc_ptr;
    if (!getAVMetadataCommonIdentifierArtistSymbolLoc_ptr)
    {
      v16 = AVFoundationLibrary_45394();
      v15 = (id *)dlsym(v16, "AVMetadataCommonIdentifierArtist");
      v41[3] = (uint64_t)v15;
      getAVMetadataCommonIdentifierArtistSymbolLoc_ptr = (uint64_t)v15;
    }
    _Block_object_dispose(&v40, 8);
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataIdentifier getAVMetadataCommonIdentifierArtist(void)");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFEncodeMediaAction.m"), 34, CFSTR("%s"), dlerror());
      goto LABEL_38;
    }
    v17 = *v15;
    WFMakeMetadataItem(v17, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v18);

  }
  if (v6)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v19 = (id *)getAVMetadataCommonIdentifierAlbumNameSymbolLoc_ptr;
    v43 = getAVMetadataCommonIdentifierAlbumNameSymbolLoc_ptr;
    if (!getAVMetadataCommonIdentifierAlbumNameSymbolLoc_ptr)
    {
      v20 = AVFoundationLibrary_45394();
      v19 = (id *)dlsym(v20, "AVMetadataCommonIdentifierAlbumName");
      v41[3] = (uint64_t)v19;
      getAVMetadataCommonIdentifierAlbumNameSymbolLoc_ptr = (uint64_t)v19;
    }
    _Block_object_dispose(&v40, 8);
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataIdentifier getAVMetadataCommonIdentifierAlbumName(void)");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFEncodeMediaAction.m"), 35, CFSTR("%s"), dlerror());
      goto LABEL_38;
    }
    v21 = *v19;
    WFMakeMetadataItem(v21, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v22);

  }
  if (v7)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v23 = (id *)getAVMetadataIdentifierQuickTimeMetadataGenreSymbolLoc_ptr;
    v43 = getAVMetadataIdentifierQuickTimeMetadataGenreSymbolLoc_ptr;
    if (!getAVMetadataIdentifierQuickTimeMetadataGenreSymbolLoc_ptr)
    {
      v24 = AVFoundationLibrary_45394();
      v23 = (id *)dlsym(v24, "AVMetadataIdentifierQuickTimeMetadataGenre");
      v41[3] = (uint64_t)v23;
      getAVMetadataIdentifierQuickTimeMetadataGenreSymbolLoc_ptr = (uint64_t)v23;
    }
    _Block_object_dispose(&v40, 8);
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataIdentifier getAVMetadataIdentifierQuickTimeMetadataGenre(void)");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFEncodeMediaAction.m"), 37, CFSTR("%s"), dlerror());
      goto LABEL_38;
    }
    v25 = *v23;
    WFMakeMetadataItem(v25, v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v26);

  }
  if (v8)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v27 = (id *)getAVMetadataIdentifierQuickTimeMetadataYearSymbolLoc_ptr;
    v43 = getAVMetadataIdentifierQuickTimeMetadataYearSymbolLoc_ptr;
    if (!getAVMetadataIdentifierQuickTimeMetadataYearSymbolLoc_ptr)
    {
      v28 = AVFoundationLibrary_45394();
      v27 = (id *)dlsym(v28, "AVMetadataIdentifierQuickTimeMetadataYear");
      v41[3] = (uint64_t)v27;
      getAVMetadataIdentifierQuickTimeMetadataYearSymbolLoc_ptr = (uint64_t)v27;
    }
    _Block_object_dispose(&v40, 8);
    if (v27)
    {
      v29 = *v27;
      WFMakeMetadataItem(v29, v8);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v30);

      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataIdentifier getAVMetadataIdentifierQuickTimeMetadataYear(void)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFEncodeMediaAction.m"), 38, CFSTR("%s"), dlerror());
LABEL_38:

    __break(1u);
    return;
  }
LABEL_26:
  if (objc_msgSend(v9, "numberOfItems"))
  {
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __40__WFEncodeMediaAction_getMetadataItems___block_invoke;
    v37[3] = &unk_24F8BA660;
    v31 = v36;
    v39 = v36;
    v38 = v10;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8410]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getFileRepresentation:forType:", v37, v32);

  }
  else
  {
    if (objc_msgSend(v10, "count"))
      v33 = v10;
    else
      v33 = 0;
    v31 = v36;
    (*((void (**)(id, void *))v36 + 2))(v36, v33);
  }

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__WFEncodeMediaAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

- (id)metadataForAsset:(id)a3 newMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v20;
  void *v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v21 = v5;
  if (v6)
  {
    v20 = v6;
    objc_msgSend(v5, "metadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v23, "mutableCopy");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v20;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v33 = 0;
          v34 = &v33;
          v35 = 0x2050000000;
          v13 = (void *)getAVMetadataItemClass_softClass;
          v36 = getAVMetadataItemClass_softClass;
          if (!getAVMetadataItemClass_softClass)
          {
            v32[0] = MEMORY[0x24BDAC760];
            v32[1] = 3221225472;
            v32[2] = __getAVMetadataItemClass_block_invoke;
            v32[3] = &unk_24F8BB430;
            v32[4] = &v33;
            __getAVMetadataItemClass_block_invoke((uint64_t)v32);
            v13 = (void *)v34[3];
          }
          v14 = objc_retainAutorelease(v13);
          _Block_object_dispose(&v33, 8);
          objc_msgSend(v14, "metadataItemsFromArray:filteredByIdentifier:", v23, v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v25 != v17)
                  objc_enumerationMutation(v15);
                objc_msgSend(v7, "removeObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
            }
            while (v16);
          }

          objc_msgSend(v7, "addObject:", v11);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v8);
    }

    v6 = v20;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeItems:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  double v35;
  float v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  void *v40;
  id v41;
  double v42;
  _QWORD v43[5];
  _QWORD v44[4];
  void *v45;
  WFEncodeMediaAction *v46;
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;

  v6 = a3;
  v7 = a4;
  -[WFEncodeMediaAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaAudioFormat"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEncodeMediaAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaAudioOnly"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  -[WFEncodeMediaAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaSize"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEncodeMediaAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaSpeed"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEncodeMediaAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaCustomSpeed"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  -[WFEncodeMediaAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaPreserveTransparency"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (!v10)
    goto LABEL_64;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("AIFF")))
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8268]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke;
    v44[3] = &unk_24F8BA138;
    v45 = v18;
    v46 = self;
    v47 = v7;
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_3;
    v43[3] = &unk_24F8BAFA8;
    v43[4] = self;
    v19 = v7;
    v20 = v18;
    objc_msgSend(v6, "transformItemsUsingBlock:completionHandler:", v44, v43);

    v21 = v45;
LABEL_51:

    return;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("M4A")))
  {
LABEL_64:
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("HEVC 1920x1080")))
    {
      if (v17)
      {
        v48 = 0;
        v49 = &v48;
        v50 = 0x2020000000;
        v22 = (id *)getAVAssetExportPresetHEVC1920x1080WithAlphaSymbolLoc_ptr;
        v51 = getAVAssetExportPresetHEVC1920x1080WithAlphaSymbolLoc_ptr;
        if (!getAVAssetExportPresetHEVC1920x1080WithAlphaSymbolLoc_ptr)
        {
          v26 = AVFoundationLibrary_45394();
          v22 = (id *)dlsym(v26, "AVAssetExportPresetHEVC1920x1080WithAlpha");
          v49[3] = (uint64_t)v22;
          getAVAssetExportPresetHEVC1920x1080WithAlphaSymbolLoc_ptr = (uint64_t)v22;
        }
        _Block_object_dispose(&v48, 8);
        if (!v22)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPresetHEVC1920x1080WithAlpha(void)");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("WFEncodeMediaAction.m"), 41, CFSTR("%s"), dlerror());
          goto LABEL_61;
        }
      }
      else
      {
        v48 = 0;
        v49 = &v48;
        v50 = 0x2020000000;
        v22 = (id *)getAVAssetExportPresetHEVC1920x1080SymbolLoc_ptr;
        v51 = getAVAssetExportPresetHEVC1920x1080SymbolLoc_ptr;
        if (!getAVAssetExportPresetHEVC1920x1080SymbolLoc_ptr)
        {
          v28 = AVFoundationLibrary_45394();
          v22 = (id *)dlsym(v28, "AVAssetExportPresetHEVC1920x1080");
          v49[3] = (uint64_t)v22;
          getAVAssetExportPresetHEVC1920x1080SymbolLoc_ptr = (uint64_t)v22;
        }
        _Block_object_dispose(&v48, 8);
        if (!v22)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPresetHEVC1920x1080(void)");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("WFEncodeMediaAction.m"), 40, CFSTR("%s"), dlerror());
          goto LABEL_61;
        }
      }
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("HEVC 3840x2160")))
    {
      if (v17)
      {
        v48 = 0;
        v49 = &v48;
        v50 = 0x2020000000;
        v22 = (id *)getAVAssetExportPresetHEVC3840x2160WithAlphaSymbolLoc_ptr;
        v51 = getAVAssetExportPresetHEVC3840x2160WithAlphaSymbolLoc_ptr;
        if (!getAVAssetExportPresetHEVC3840x2160WithAlphaSymbolLoc_ptr)
        {
          v27 = AVFoundationLibrary_45394();
          v22 = (id *)dlsym(v27, "AVAssetExportPresetHEVC3840x2160WithAlpha");
          v49[3] = (uint64_t)v22;
          getAVAssetExportPresetHEVC3840x2160WithAlphaSymbolLoc_ptr = (uint64_t)v22;
        }
        _Block_object_dispose(&v48, 8);
        if (!v22)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPresetHEVC3840x2160WithAlpha(void)");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("WFEncodeMediaAction.m"), 43, CFSTR("%s"), dlerror());
          goto LABEL_61;
        }
      }
      else
      {
        v48 = 0;
        v49 = &v48;
        v50 = 0x2020000000;
        v22 = (id *)getAVAssetExportPresetHEVC3840x2160SymbolLoc_ptr;
        v51 = getAVAssetExportPresetHEVC3840x2160SymbolLoc_ptr;
        if (!getAVAssetExportPresetHEVC3840x2160SymbolLoc_ptr)
        {
          v30 = AVFoundationLibrary_45394();
          v22 = (id *)dlsym(v30, "AVAssetExportPresetHEVC3840x2160");
          v49[3] = (uint64_t)v22;
          getAVAssetExportPresetHEVC3840x2160SymbolLoc_ptr = (uint64_t)v22;
        }
        _Block_object_dispose(&v48, 8);
        if (!v22)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPresetHEVC3840x2160(void)");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("WFEncodeMediaAction.m"), 42, CFSTR("%s"), dlerror());
          goto LABEL_61;
        }
      }
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("640x480")))
    {
      v48 = 0;
      v49 = &v48;
      v50 = 0x2020000000;
      v22 = (id *)getAVAssetExportPreset640x480SymbolLoc_ptr;
      v51 = getAVAssetExportPreset640x480SymbolLoc_ptr;
      if (!getAVAssetExportPreset640x480SymbolLoc_ptr)
      {
        v29 = AVFoundationLibrary_45394();
        v22 = (id *)dlsym(v29, "AVAssetExportPreset640x480");
        v49[3] = (uint64_t)v22;
        getAVAssetExportPreset640x480SymbolLoc_ptr = (uint64_t)v22;
      }
      _Block_object_dispose(&v48, 8);
      if (!v22)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPreset640x480(void)");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("WFEncodeMediaAction.m"), 44, CFSTR("%s"), dlerror());
        goto LABEL_61;
      }
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("960x540")))
    {
      v48 = 0;
      v49 = &v48;
      v50 = 0x2020000000;
      v22 = (id *)getAVAssetExportPreset960x540SymbolLoc_ptr;
      v51 = getAVAssetExportPreset960x540SymbolLoc_ptr;
      if (!getAVAssetExportPreset960x540SymbolLoc_ptr)
      {
        v31 = AVFoundationLibrary_45394();
        v22 = (id *)dlsym(v31, "AVAssetExportPreset960x540");
        v49[3] = (uint64_t)v22;
        getAVAssetExportPreset960x540SymbolLoc_ptr = (uint64_t)v22;
      }
      _Block_object_dispose(&v48, 8);
      if (!v22)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPreset960x540(void)");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("WFEncodeMediaAction.m"), 45, CFSTR("%s"), dlerror());
        goto LABEL_61;
      }
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("1280x720")))
      {
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("1920x1080")))
        {
          getAVAssetExportPreset1920x1080();
          v33 = (id)objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("3840x2160")))
        {
          getAVAssetExportPreset3840x2160();
          v33 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("ProRes 422")))
            getAVAssetExportPresetAppleProRes422LPCM();
          else
            getAVAssetExportPresetPassthrough();
          v33 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_44:
        v34 = v33;
        v35 = 0.5;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("0.5X")) & 1) == 0)
        {
          v35 = 1.0;
          if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Normal")) & 1) == 0)
          {
            v35 = 2.0;
            if ((objc_msgSend(v12, "isEqualToString:", CFSTR("2X")) & 1) == 0)
            {
              v36 = fabsf(v15);
              if (objc_msgSend(v12, "isEqualToString:", CFSTR("Custom")))
                v35 = v36;
              else
                v35 = 1.0;
            }
          }
        }
        v37 = (void *)objc_opt_new();
        -[WFEncodeMediaAction setExportSessions:](self, "setExportSessions:", v37);

        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_4;
        v39[3] = &unk_24F8BA1F0;
        v42 = v35;
        v39[4] = self;
        v40 = v34;
        v41 = v7;
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_8;
        v38[3] = &unk_24F8BAFA8;
        v38[4] = self;
        v20 = v7;
        v19 = v34;
        objc_msgSend(v6, "transformItemsUsingBlock:completionHandler:", v39, v38);

        v21 = v40;
        goto LABEL_51;
      }
      v48 = 0;
      v49 = &v48;
      v50 = 0x2020000000;
      v22 = (id *)getAVAssetExportPreset1280x720SymbolLoc_ptr;
      v51 = getAVAssetExportPreset1280x720SymbolLoc_ptr;
      if (!getAVAssetExportPreset1280x720SymbolLoc_ptr)
      {
        v32 = AVFoundationLibrary_45394();
        v22 = (id *)dlsym(v32, "AVAssetExportPreset1280x720");
        v49[3] = (uint64_t)v22;
        getAVAssetExportPreset1280x720SymbolLoc_ptr = (uint64_t)v22;
      }
      _Block_object_dispose(&v48, 8);
      if (!v22)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPreset1280x720(void)");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("WFEncodeMediaAction.m"), 46, CFSTR("%s"), dlerror());
        goto LABEL_61;
      }
    }
LABEL_43:
    v33 = *v22;
    goto LABEL_44;
  }
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v22 = (id *)getAVAssetExportPresetAppleM4ASymbolLoc_ptr;
  v51 = getAVAssetExportPresetAppleM4ASymbolLoc_ptr;
  if (!getAVAssetExportPresetAppleM4ASymbolLoc_ptr)
  {
    v23 = AVFoundationLibrary_45394();
    v22 = (id *)dlsym(v23, "AVAssetExportPresetAppleM4A");
    v49[3] = (uint64_t)v22;
    getAVAssetExportPresetAppleM4ASymbolLoc_ptr = (uint64_t)v22;
  }
  _Block_object_dispose(&v48, 8);
  if (v22)
    goto LABEL_43;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPresetAppleM4A(void)");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("WFEncodeMediaAction.m"), 39, CFSTR("%s"), dlerror());
LABEL_61:

  __break(1u);
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[WFEncodeMediaAction exportSessions](self, "exportSessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_cancelExport);

  v4.receiver = self;
  v4.super_class = (Class)WFEncodeMediaAction;
  -[WFEncodeMediaAction cancel](&v4, sel_cancel);
}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[WFEncodeMediaAction setExportSessions:](self, "setExportSessions:", 0);
  v5.receiver = self;
  v5.super_class = (Class)WFEncodeMediaAction;
  -[WFEncodeMediaAction finishRunningWithError:](&v5, sel_finishRunningWithError_, v4);

}

- (void)initializeParameters
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFEncodeMediaAction;
  -[WFEncodeMediaAction initializeParameters](&v3, sel_initializeParameters);
  -[WFEncodeMediaAction updateSpeedVisibility](self, "updateSpeedVisibility");
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFEncodeMediaAction;
  v7 = -[WFEncodeMediaAction setParameterState:forKey:](&v9, sel_setParameterState_forKey_, a3, v6);
  if (v7
    && ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFMediaAudioOnly")) & 1) != 0
     || objc_msgSend(v6, "isEqualToString:", CFSTR("WFMediaAudioFormat"))))
  {
    -[WFEncodeMediaAction updateSpeedVisibility](self, "updateSpeedVisibility");
  }

  return v7;
}

- (void)updateSpeedVisibility
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[WFEncodeMediaAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFMediaAudioFormat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[WFEncodeMediaAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFMediaAudioOnly"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    v7 = objc_msgSend(v9, "isEqualToString:", CFSTR("M4A")) ^ 1;
  else
    v7 = 0;
  -[WFEncodeMediaAction parameterForKey:](self, "parameterForKey:", CFSTR("WFMediaSpeed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

}

- (NSMutableArray)exportSessions
{
  return self->_exportSessions;
}

- (void)setExportSessions:(id)a3
{
  objc_storeStrong((id *)&self->_exportSessions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportSessions, 0);
}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_2;
  v12[3] = &unk_24F8BA110;
  v13 = v5;
  v6 = a1[4];
  v7 = (void *)a1[5];
  v8 = v5;
  v9 = a2;
  objc_msgSend(v9, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadataForAsset:newMetadata:", v10, a1[6]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generateFileRepresentation:forType:metadata:options:", v12, v6, v11, MEMORY[0x24BDBD1B8]);

}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_5;
  v13[3] = &unk_24F8BA1C8;
  v8 = v6;
  v17 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v16 = v8;
  v13[4] = v9;
  v14 = v10;
  v15 = *(id *)(a1 + 48);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v11 = (void *)getAVAssetClass_softClass;
  v22 = getAVAssetClass_softClass;
  if (!getAVAssetClass_softClass)
  {
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __getAVAssetClass_block_invoke;
    v18[3] = &unk_24F8BB430;
    v18[4] = &v19;
    __getAVAssetClass_block_invoke((uint64_t)v18);
    v11 = (void *)v20[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v5, "getObjectRepresentation:forClass:", v13, v12);

}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  _OWORD v67[2];
  __int128 v68;
  uint64_t v69;
  _QWORD v70[3];
  _OWORD v71[3];
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  _OWORD v78[3];
  _OWORD v79[3];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  void *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v58 = a2;
  v57 = a3;
  v56 = a4;
  v91 = 0;
  v92 = &v91;
  v93 = 0x2050000000;
  v6 = (void *)getAVMutableCompositionClass_softClass;
  v94 = getAVMutableCompositionClass_softClass;
  if (!getAVMutableCompositionClass_softClass)
  {
    *(_QWORD *)&v87 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v87 + 1) = 3221225472;
    v88 = (uint64_t)__getAVMutableCompositionClass_block_invoke;
    v89 = &unk_24F8BB430;
    v90 = &v91;
    __getAVMutableCompositionClass_block_invoke((uint64_t)&v87);
    v6 = (void *)v92[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v91, 8);
  objc_msgSend(v7, "composition");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(v58, "tracks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v84;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v84 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        objc_msgSend(v12, "mediaType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addMutableTrackWithMediaType:preferredTrackID:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setNaturalTimeScale:", objc_msgSend(v12, "naturalTimeScale"));
        objc_msgSend(v12, "preferredVolume");
        objc_msgSend(v14, "setPreferredVolume:");
        if (v12)
        {
          objc_msgSend(v12, "preferredTransform");
        }
        else
        {
          v81 = 0u;
          v82 = 0u;
          v80 = 0u;
        }
        v79[0] = v80;
        v79[1] = v81;
        v79[2] = v82;
        objc_msgSend(v14, "setPreferredTransform:", v79);
        objc_msgSend(v12, "languageCode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setLanguageCode:", v15);

        objc_msgSend(v12, "extendedLanguageTag");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setExtendedLanguageTag:", v16);

        if (v12)
        {
          objc_msgSend(v12, "timeRange");
          objc_msgSend(v12, "timeRange");
        }
        else
        {
          memset(v78, 0, sizeof(v78));
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
        }
        v76 = v73;
        v77 = v74;
        v72 = 0;
        objc_msgSend(v14, "insertTimeRange:ofTrack:atTime:error:", v78, v12, &v76, &v72);
        v17 = v72;
        if (v17)
        {
          v49 = v17;
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

          goto LABEL_41;
        }
        if (v12)
        {
          objc_msgSend(v12, "timeRange");
          objc_msgSend(v12, "timeRange");
        }
        else
        {
          memset(v71, 0, sizeof(v71));
          v66 = 0u;
          memset(v67, 0, sizeof(v67));
        }
        v68 = *(_OWORD *)((char *)v67 + 8);
        v69 = *((_QWORD *)&v67[1] + 1);
        v18 = *(double *)(a1 + 64);
        *(_QWORD *)&v87 = 0;
        *((_QWORD *)&v87 + 1) = &v87;
        v88 = 0x2020000000;
        v19 = getCMTimeMultiplyByFloat64SymbolLoc_ptr;
        v89 = getCMTimeMultiplyByFloat64SymbolLoc_ptr;
        if (!getCMTimeMultiplyByFloat64SymbolLoc_ptr)
        {
          v20 = CoreMediaLibrary();
          v19 = dlsym(v20, "CMTimeMultiplyByFloat64");
          *(_QWORD *)(*((_QWORD *)&v87 + 1) + 24) = v19;
          getCMTimeMultiplyByFloat64SymbolLoc_ptr = v19;
        }
        _Block_object_dispose(&v87, 8);
        if (!v19)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CMTime soft_CMTimeMultiplyByFloat64(CMTime, Float64)");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("WFEncodeMediaAction.m"), 18, CFSTR("%s"), dlerror(), v56);

          goto LABEL_43;
        }
        v87 = v68;
        v88 = v69;
        ((void (*)(_QWORD *__return_ptr, __int128 *, double))v19)(v70, &v87, 1.0 / v18);
        objc_msgSend(v14, "scaleTimeRange:toDuration:", v71, v70);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
      if (v9)
        continue;
      break;
    }
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "isRunning") & 1) != 0)
  {
    v91 = 0;
    v92 = &v91;
    v93 = 0x2050000000;
    v21 = (void *)getAVAssetExportSessionClass_softClass;
    v94 = getAVAssetExportSessionClass_softClass;
    if (!getAVAssetExportSessionClass_softClass)
    {
      *(_QWORD *)&v87 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v87 + 1) = 3221225472;
      v88 = (uint64_t)__getAVAssetExportSessionClass_block_invoke;
      v89 = &unk_24F8BB430;
      v90 = &v91;
      __getAVAssetExportSessionClass_block_invoke((uint64_t)&v87);
      v21 = (void *)v92[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v91, 8);
    objc_msgSend(v22, "exportSessionWithAsset:presetName:", v59, *(_QWORD *)(a1 + 40));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "supportedFileTypes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BEC14A0];
    objc_msgSend(v24, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "typeWithString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&v87 = 0;
    *((_QWORD *)&v87 + 1) = &v87;
    v88 = 0x2020000000;
    v28 = (_QWORD *)getAVMediaTypeVideoSymbolLoc_ptr_45425;
    v89 = (void *)getAVMediaTypeVideoSymbolLoc_ptr_45425;
    if (!getAVMediaTypeVideoSymbolLoc_ptr_45425)
    {
      v29 = AVFoundationLibrary_45394();
      v28 = dlsym(v29, "AVMediaTypeVideo");
      *(_QWORD *)(*((_QWORD *)&v87 + 1) + 24) = v28;
      getAVMediaTypeVideoSymbolLoc_ptr_45425 = (uint64_t)v28;
    }
    _Block_object_dispose(&v87, 8);
    if (!v28)
      goto LABEL_44;
    objc_msgSend(v58, "tracksWithMediaType:", *v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    *(_QWORD *)&v87 = 0;
    *((_QWORD *)&v87 + 1) = &v87;
    v88 = 0x2020000000;
    v32 = (_QWORD *)getAVMediaTypeAudioSymbolLoc_ptr;
    v89 = (void *)getAVMediaTypeAudioSymbolLoc_ptr;
    if (!getAVMediaTypeAudioSymbolLoc_ptr)
    {
      v33 = AVFoundationLibrary_45394();
      v32 = dlsym(v33, "AVMediaTypeAudio");
      *(_QWORD *)(*((_QWORD *)&v87 + 1) + 24) = v32;
      getAVMediaTypeAudioSymbolLoc_ptr = (uint64_t)v32;
    }
    _Block_object_dispose(&v87, 8);
    if (!v32)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMediaType getAVMediaTypeAudio(void)");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("WFEncodeMediaAction.m"), 52, CFSTR("%s"), dlerror(), v56);

      while (1)
      {
LABEL_43:
        __break(1u);
LABEL_44:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMediaType getAVMediaTypeVideo(void)");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("WFEncodeMediaAction.m"), 51, CFSTR("%s"), dlerror());

      }
    }
    objc_msgSend(v58, "tracksWithMediaType:", *v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count") != 0;

    if (v35 && v31 == 0)
    {
      objc_msgSend(MEMORY[0x24BEC14A0], "typesFromStrings:", v24);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "if_objectsPassingTest:", &__block_literal_global_45429);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v37, "count"))
      {
        objc_msgSend(v37, "firstObject");
        v38 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v38;
      }

    }
    v39 = (void *)MEMORY[0x24BE19628];
    objc_msgSend(MEMORY[0x24BE194F8], "proposedFilenameForFile:ofType:", v57, v27);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "proposedTemporaryFileURLForFilename:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setOutputURL:", v41);
    objc_msgSend(v27, "string");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setOutputFileType:", v42);

    objc_msgSend(*(id *)(a1 + 32), "metadataForAsset:newMetadata:", v58, *(_QWORD *)(a1 + 48));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
      objc_msgSend(v23, "setMetadata:", v43);
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_7;
    v61[3] = &unk_24F8BA1A0;
    v62 = v23;
    v44 = *(id *)(a1 + 56);
    v64 = v27;
    v65 = v44;
    v63 = v41;
    v45 = v27;
    v46 = v41;
    v47 = v23;
    objc_msgSend(v47, "exportAsynchronouslyWithCompletionHandler:", v61);
    objc_msgSend(*(id *)(a1 + 32), "exportSessions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObject:", v47);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
LABEL_41:

}

void __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "status") == 3)
  {
    objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:ofType:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v3, 0);
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);
  }

}

uint64_t __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToUTType:", *MEMORY[0x24BDF82D0]);
}

uint64_t __44__WFEncodeMediaAction_encodeItems_metadata___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__WFEncodeMediaAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a2;
  v7 = a4;
  v8 = objc_msgSend(v6, "numberOfItems");
  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __50__WFEncodeMediaAction_runAsynchronouslyWithInput___block_invoke_2;
    v10[3] = &unk_24F8BA8A0;
    v10[4] = v9;
    v11 = v6;
    objc_msgSend(v9, "getMetadataItems:", v10);

  }
  else
  {
    objc_msgSend(v9, "finishRunningWithError:", v7);
  }

}

uint64_t __50__WFEncodeMediaAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeItems:metadata:", *(_QWORD *)(a1 + 40), a2);
}

void __40__WFEncodeMediaAction_getMetadataItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_32;
  }
  objc_msgSend(getAVMutableMetadataItemClass(), "metadataItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v8 = (_QWORD *)getAVMetadataCommonIdentifierArtworkSymbolLoc_ptr;
  v36 = getAVMetadataCommonIdentifierArtworkSymbolLoc_ptr;
  if (!getAVMetadataCommonIdentifierArtworkSymbolLoc_ptr)
  {
    v9 = AVFoundationLibrary_45394();
    v8 = dlsym(v9, "AVMetadataCommonIdentifierArtwork");
    v34[3] = (uint64_t)v8;
    getAVMetadataCommonIdentifierArtworkSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v33, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataIdentifier getAVMetadataCommonIdentifierArtwork(void)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("WFEncodeMediaAction.m"), 36, CFSTR("%s"), dlerror());
    goto LABEL_34;
  }
  objc_msgSend(v7, "setIdentifier:", *v8);
  objc_msgSend(v5, "wfType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "conformsToUTType:", *MEMORY[0x24BDF83D8]);

  if (v11)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v12 = (_QWORD *)getkCMMetadataBaseDataType_GIFSymbolLoc_ptr;
    v36 = getkCMMetadataBaseDataType_GIFSymbolLoc_ptr;
    if (!getkCMMetadataBaseDataType_GIFSymbolLoc_ptr)
    {
      v13 = CoreMediaLibrary();
      v12 = dlsym(v13, "kCMMetadataBaseDataType_GIF");
      v34[3] = (uint64_t)v12;
      getkCMMetadataBaseDataType_GIFSymbolLoc_ptr = (uint64_t)v12;
    }
    _Block_object_dispose(&v33, 8);
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkCMMetadataBaseDataType_GIF(void)");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("WFEncodeMediaAction.m"), 20, CFSTR("%s"), dlerror());
      goto LABEL_34;
    }
    goto LABEL_25;
  }
  objc_msgSend(v5, "wfType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "conformsToUTType:", *MEMORY[0x24BDF8438]);

  if (!v17)
  {
    objc_msgSend(v5, "wfType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "conformsToUTType:", *MEMORY[0x24BDF84F8]);

    if (!v20)
    {
      objc_msgSend(v5, "wfType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "conformsToUTType:", *MEMORY[0x24BDF82E0]);

      if (!v23)
        goto LABEL_26;
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v12 = (_QWORD *)getkCMMetadataBaseDataType_BMPSymbolLoc_ptr;
      v36 = getkCMMetadataBaseDataType_BMPSymbolLoc_ptr;
      if (!getkCMMetadataBaseDataType_BMPSymbolLoc_ptr)
      {
        v24 = CoreMediaLibrary();
        v12 = dlsym(v24, "kCMMetadataBaseDataType_BMP");
        v34[3] = (uint64_t)v12;
        getkCMMetadataBaseDataType_BMPSymbolLoc_ptr = (uint64_t)v12;
      }
      _Block_object_dispose(&v33, 8);
      if (!v12)
        goto LABEL_35;
      goto LABEL_25;
    }
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v12 = (_QWORD *)getkCMMetadataBaseDataType_PNGSymbolLoc_ptr;
    v36 = getkCMMetadataBaseDataType_PNGSymbolLoc_ptr;
    if (!getkCMMetadataBaseDataType_PNGSymbolLoc_ptr)
    {
      v21 = CoreMediaLibrary();
      v12 = dlsym(v21, "kCMMetadataBaseDataType_PNG");
      v34[3] = (uint64_t)v12;
      getkCMMetadataBaseDataType_PNGSymbolLoc_ptr = (uint64_t)v12;
    }
    _Block_object_dispose(&v33, 8);
    if (v12)
      goto LABEL_25;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkCMMetadataBaseDataType_PNG(void)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("WFEncodeMediaAction.m"), 22, CFSTR("%s"), dlerror());
    while (1)
    {
LABEL_34:

      __break(1u);
LABEL_35:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkCMMetadataBaseDataType_BMP(void)");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("WFEncodeMediaAction.m"), 23, CFSTR("%s"), dlerror());
    }
  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v12 = (_QWORD *)getkCMMetadataBaseDataType_JPEGSymbolLoc_ptr;
  v36 = getkCMMetadataBaseDataType_JPEGSymbolLoc_ptr;
  if (!getkCMMetadataBaseDataType_JPEGSymbolLoc_ptr)
  {
    v18 = CoreMediaLibrary();
    v12 = dlsym(v18, "kCMMetadataBaseDataType_JPEG");
    v34[3] = (uint64_t)v12;
    getkCMMetadataBaseDataType_JPEGSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v33, 8);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkCMMetadataBaseDataType_JPEG(void)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("WFEncodeMediaAction.m"), 21, CFSTR("%s"), dlerror());
    goto LABEL_34;
  }
LABEL_25:
  objc_msgSend(v7, "setDataType:", *v12);
LABEL_26:
  WFImageSizeFromFile();
  v26 = v25;
  v28 = v27;
  if (objc_msgSend(v5, "fileSize") > 0x20000 && (v26 > 1400.0 || v28 > 1400.0))
  {
    v30 = v7;
    v31 = *(id *)(a1 + 32);
    v32 = *(id *)(a1 + 40);
    WFAsyncTransformedImageFromImage();

  }
  else
  {
    objc_msgSend(v5, "data");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:", v29);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

LABEL_32:
}

uint64_t __40__WFEncodeMediaAction_getMetadataItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(a2, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setValue:", v3);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
