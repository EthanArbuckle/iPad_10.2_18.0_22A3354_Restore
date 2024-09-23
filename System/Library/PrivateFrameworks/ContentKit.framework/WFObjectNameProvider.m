@implementation WFObjectNameProvider

- (WFObjectNameProvider)init
{
  WFObjectNameProvider *v2;
  uint64_t v3;
  NSDictionary *contents;
  WFObjectNameProvider *v5;
  objc_super v7;
  _QWORD v8[8];
  _QWORD v9[9];

  v9[8] = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)WFObjectNameProvider;
  v2 = -[WFObjectNameProvider init](&v7, sel_init);
  if (v2)
  {
    v8[0] = CFSTR("PHAsset");
    v8[1] = CFSTR("PHAssetCollection");
    v9[0] = &__block_literal_global_21_18852;
    v9[1] = &__block_literal_global_25;
    v8[2] = CFSTR("EKCalendarItem");
    v8[3] = CFSTR("REMReminder");
    v9[2] = &__block_literal_global_35;
    v9[3] = &__block_literal_global_39_18856;
    v8[4] = CFSTR("MKMapItem");
    v8[5] = CFSTR("CLPlacemark");
    v9[4] = &__block_literal_global_43;
    v9[5] = &__block_literal_global_47_18859;
    v8[6] = CFSTR("MPMediaItem");
    v8[7] = CFSTR("AVAsset");
    v9[6] = &__block_literal_global_51_18861;
    v9[7] = &__block_literal_global_55_18863;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 8);
    v3 = objc_claimAutoreleasedReturnValue();
    contents = v2->_contents;
    v2->_contents = (NSDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)nameForObject:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  while (1)
  {
    -[WFObjectNameProvider contents](self, "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v8)
      break;
    v5 = (objc_class *)-[objc_class superclass](v5, "superclass");
    if (!v5)
    {
      v9 = 0;
      goto LABEL_6;
    }
  }
  ((void (**)(_QWORD, id))v8)[2](v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v9;
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
}

id __28__WFObjectNameProvider_init__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = a2;
  objc_msgSend(v19, "commonMetadata");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v6, "commonKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v25 = (uint64_t)&v24;
        v26 = 0x2020000000;
        v8 = (_QWORD *)getAVMetadataCommonKeyTitleSymbolLoc_ptr_18866;
        v27 = (void *)getAVMetadataCommonKeyTitleSymbolLoc_ptr_18866;
        if (!getAVMetadataCommonKeyTitleSymbolLoc_ptr_18866)
        {
          v9 = AVFoundationLibrary_18867();
          v8 = dlsym(v9, "AVMetadataCommonKeyTitle");
          *(_QWORD *)(v25 + 24) = v8;
          getAVMetadataCommonKeyTitleSymbolLoc_ptr_18866 = (uint64_t)v8;
        }
        _Block_object_dispose(&v24, 8);
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataKey getAVMetadataCommonKeyTitle(void)");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("WFObjectNameProvider.m"), 40, CFSTR("%s"), dlerror());

          __break(1u);
        }
        v10 = objc_msgSend(v7, "isEqual:", *v8);

        if ((v10 & 1) != 0)
        {
          objc_msgSend(v6, "stringValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
      if (v3)
        continue;
      break;
    }
  }

  v2 = v19;
  if (!v2)
    goto LABEL_18;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v11 = (void *)getAVURLAssetClass_softClass_18874;
  v32 = getAVURLAssetClass_softClass_18874;
  if (!getAVURLAssetClass_softClass_18874)
  {
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = (uint64_t)__getAVURLAssetClass_block_invoke_18875;
    v27 = &unk_24C4E3118;
    v28 = &v29;
    __getAVURLAssetClass_block_invoke_18875((uint64_t)&v24);
    v11 = (void *)v30[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v29, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByDeletingPathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_18:
    v15 = 0;
  }
LABEL_19:

  return v15;
}

void __28__WFObjectNameProvider_init__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = (_QWORD *)getMPMediaItemPropertyTitleSymbolLoc_ptr_18887;
  v12 = getMPMediaItemPropertyTitleSymbolLoc_ptr_18887;
  if (!getMPMediaItemPropertyTitleSymbolLoc_ptr_18887)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getMPMediaItemPropertyTitleSymbolLoc_block_invoke;
    v8[3] = &unk_24C4E3118;
    v8[4] = &v9;
    __getMPMediaItemPropertyTitleSymbolLoc_block_invoke(v8);
    v3 = (_QWORD *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    objc_msgSend(v2, "valueForProperty:", *v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyTitle(void)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("WFObjectNameProvider.m"), 36, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

uint64_t __28__WFObjectNameProvider_init__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __28__WFObjectNameProvider_init__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

id __28__WFObjectNameProvider_init__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __28__WFObjectNameProvider_init__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "title");
}

id __28__WFObjectNameProvider_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v2 = a2;
  objc_msgSend(v2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v5 = (void *)getPHImportSessionClass_softClass;
    v17 = getPHImportSessionClass_softClass;
    if (!getPHImportSessionClass_softClass)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __getPHImportSessionClass_block_invoke;
      v13[3] = &unk_24C4E3118;
      v13[4] = &v14;
      __getPHImportSessionClass_block_invoke((uint64_t)v13);
      v5 = (void *)v15[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v14, 8);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "startDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        goto LABEL_10;
      v7 = (void *)MEMORY[0x24BDD1500];
      objc_msgSend(v2, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringFromDate:dateStyle:timeStyle:", v8, 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("Imported on %@"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v11, v9);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
    }
    v4 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v2, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v4;
}

id __28__WFObjectNameProvider_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "originalFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken_18917 != -1)
    dispatch_once(&sharedProvider_onceToken_18917, &__block_literal_global_18918);
  return (id)sharedProvider_sharedProvider;
}

void __38__WFObjectNameProvider_sharedProvider__block_invoke()
{
  WFObjectNameProvider *v0;
  void *v1;

  v0 = objc_alloc_init(WFObjectNameProvider);
  v1 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v0;

}

@end
