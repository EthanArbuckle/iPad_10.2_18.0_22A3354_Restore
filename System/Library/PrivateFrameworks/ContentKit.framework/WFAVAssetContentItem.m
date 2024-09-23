@implementation WFAVAssetContentItem

- (id)frameRate
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  double v9;
  id result;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  -[WFAVAssetContentItem asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v3 = (_QWORD *)getAVMediaTypeVideoSymbolLoc_ptr_9051;
  v16 = getAVMediaTypeVideoSymbolLoc_ptr_9051;
  if (!getAVMediaTypeVideoSymbolLoc_ptr_9051)
  {
    v4 = AVFoundationLibrary_8990();
    v3 = dlsym(v4, "AVMediaTypeVideo");
    v14[3] = (uint64_t)v3;
    getAVMediaTypeVideoSymbolLoc_ptr_9051 = (uint64_t)v3;
  }
  _Block_object_dispose(&v13, 8);
  if (v3)
  {
    objc_msgSend(v2, "tracksWithMediaType:", *v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nominalFrameRate");
    v8 = v7;

    LODWORD(v9) = v8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMediaType getAVMediaTypeVideo(void)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("WFAVAssetContentItem.m"), 31, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (void)getPreferredFileSize:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD v16[3];
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  _OWORD v21[3];
  objc_super v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  void *v27;

  v4 = a3;
  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v22.receiver = self;
    v22.super_class = (Class)WFAVAssetContentItem;
    -[WFContentItem getPreferredFileSize:](&v22, sel_getPreferredFileSize_, v4);
LABEL_13:

    return;
  }
  -[WFAVAssetContentItem generateExportSessionForType:](self, "generateExportSessionForType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v25 = 0;
  *((_QWORD *)&v25 + 1) = &v25;
  v26 = 0x2020000000;
  v8 = (_QWORD *)getkCMTimeZeroSymbolLoc_ptr_9047;
  v27 = (void *)getkCMTimeZeroSymbolLoc_ptr_9047;
  if (!getkCMTimeZeroSymbolLoc_ptr_9047)
  {
    v9 = CoreMediaLibrary_9037();
    v8 = dlsym(v9, "kCMTimeZero");
    *(_QWORD *)(*((_QWORD *)&v25 + 1) + 24) = v8;
    getkCMTimeZeroSymbolLoc_ptr_9047 = (uint64_t)v8;
  }
  _Block_object_dispose(&v25, 8);
  if (v8)
  {
    v19 = *(_OWORD *)v8;
    v20 = v8[2];
    objc_msgSend(v7, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "duration");
    }
    else
    {
      v17 = 0uLL;
      v18 = 0;
    }
    *(_QWORD *)&v25 = 0;
    *((_QWORD *)&v25 + 1) = &v25;
    v26 = 0x2020000000;
    v12 = getCMTimeRangeMakeSymbolLoc_ptr;
    v27 = getCMTimeRangeMakeSymbolLoc_ptr;
    if (!getCMTimeRangeMakeSymbolLoc_ptr)
    {
      v13 = CoreMediaLibrary_9037();
      v12 = dlsym(v13, "CMTimeRangeMake");
      *(_QWORD *)(*((_QWORD *)&v25 + 1) + 24) = v12;
      getCMTimeRangeMakeSymbolLoc_ptr = v12;
    }
    _Block_object_dispose(&v25, 8);
    if (v12)
    {
      v25 = v19;
      v26 = v20;
      v23 = v17;
      v24 = v18;
      ((void (*)(_OWORD *__return_ptr, __int128 *, __int128 *))v12)(v21, &v25, &v23);
      v16[0] = v21[0];
      v16[1] = v21[1];
      v16[2] = v21[2];
      objc_msgSend(v7, "setTimeRange:", v16);

      (*((void (**)(id, uint64_t))v4 + 2))(v4, objc_msgSend(v7, "estimatedOutputFileLength"));
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CMTimeRange soft_CMTimeRangeMake(CMTime, CMTime)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("WFAVAssetContentItem.m"), 24, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CMTime getkCMTimeZero(void)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("WFAVAssetContentItem.m"), 22, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

- (id)duration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  WFTimeInterval *v14;
  id result;
  void *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  void *v22;

  -[WFAVAssetContentItem asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "duration");
  }
  else
  {
    v18 = 0uLL;
    v19 = 0;
  }
  *(_QWORD *)&v20 = 0;
  *((_QWORD *)&v20 + 1) = &v20;
  v21 = 0x2020000000;
  v4 = getCMTimeGetSecondsSymbolLoc_ptr_9036;
  v22 = getCMTimeGetSecondsSymbolLoc_ptr_9036;
  if (!getCMTimeGetSecondsSymbolLoc_ptr_9036)
  {
    v5 = CoreMediaLibrary_9037();
    v4 = dlsym(v5, "CMTimeGetSeconds");
    *(_QWORD *)(*((_QWORD *)&v20 + 1) + 24) = v4;
    getCMTimeGetSecondsSymbolLoc_ptr_9036 = v4;
  }
  _Block_object_dispose(&v20, 8);
  if (v4)
  {
    v20 = v18;
    v21 = v19;
    v6 = ((double (*)(__int128 *))v4)(&v20);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 224;
    objc_msgSend(v8, "components:fromDate:toDate:options:", 224, v7, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "hour"))
    {
      v12 = 1;
    }
    else
    {
      v13 = objc_msgSend(v11, "minute");
      if (v13)
        v12 = 1;
      else
        v12 = 0x10000;
      if (v13)
        v10 = 224;
      else
        v10 = 192;
    }
    v14 = -[WFTimeInterval initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:]([WFTimeInterval alloc], "initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:", v10, 0, v12, v6);

    return v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Float64 soft_CMTimeGetSeconds(CMTime)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("WFAVAssetContentItem.m"), 23, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (CLLocation)location
{
  id AVMetadataItemClass;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  CLLocation *result;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  AVMetadataItemClass = getAVMetadataItemClass();
  -[WFAVAssetContentItem asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v6 = (id *)getAVMetadataCommonKeyLocationSymbolLoc_ptr;
  v26 = getAVMetadataCommonKeyLocationSymbolLoc_ptr;
  if (!getAVMetadataCommonKeyLocationSymbolLoc_ptr)
  {
    v7 = AVFoundationLibrary_8990();
    v6 = (id *)dlsym(v7, "AVMetadataCommonKeyLocation");
    v24[3] = (uint64_t)v6;
    getAVMetadataCommonKeyLocationSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v23, 8);
  if (v6)
  {
    v8 = *v6;
    getAVMetadataKeySpaceCommon();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(AVMetadataItemClass, "metadataItemsFromArray:withKey:keySpace:", v5, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v12, "length") >= 0x11)
      {
        objc_msgSend(v12, "substringToIndex:", 8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "substringWithRange:", 8, 9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_alloc(MEMORY[0x24BDBFA80]);
        objc_msgSend(v14, "doubleValue");
        v18 = v17;
        objc_msgSend(v15, "doubleValue");
        v13 = (void *)objc_msgSend(v16, "initWithLatitude:longitude:", v18, v19);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

    return (CLLocation *)v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataKey getAVMetadataCommonKeyLocation(void)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("WFAVAssetContentItem.m"), 42, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (WFFileType)preferredFileType
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  objc_super v15;
  objc_super v16;

  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return (WFFileType *)v5;
  }
  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wfType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "conformsToClass:", getAVURLAssetClass_9009());

  if (!v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)WFAVAssetContentItem;
    -[WFContentItem preferredFileType](&v15, sel_preferredFileType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return (WFFileType *)v5;
  }
  -[WFAVAssetContentItem asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wfFileType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v11, "conformsToUTType:", *MEMORY[0x24BDF8470]))
    {
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", *MEMORY[0x24BEC1898]);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v11;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFAVAssetContentItem;
    -[WFContentItem preferredFileType](&v16, sel_preferredFileType);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v12;

  return (WFFileType *)v14;
}

- (AVAsset)asset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", getAVAssetClass());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVAsset *)v6;
}

- (id)generateExportSessionForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  id *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id result;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  -[WFAVAssetContentItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getAVURLAssetClass_9009();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFAVAssetContentItem asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  v7 = (void *)MEMORY[0x24BEC14A0];
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typeFromFileExtension:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = (uint64_t)&v29;
  v31 = 0x2020000000;
  v11 = (id *)getAVAssetExportPresetPassthroughSymbolLoc_ptr;
  v32 = (void *)getAVAssetExportPresetPassthroughSymbolLoc_ptr;
  if (!getAVAssetExportPresetPassthroughSymbolLoc_ptr)
  {
    v12 = AVFoundationLibrary_8990();
    v11 = (id *)dlsym(v12, "AVAssetExportPresetPassthrough");
    *(_QWORD *)(v30 + 24) = v11;
    getAVAssetExportPresetPassthroughSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v29, 8);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPresetPassthrough(void)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("WFAVAssetContentItem.m"), 43, CFSTR("%s"), dlerror(), v29);
    goto LABEL_26;
  }
  v13 = *v11;
  v29 = 0;
  v30 = (uint64_t)&v29;
  v31 = 0x2020000000;
  v14 = (id *)getAVFileTypeAppleM4ASymbolLoc_ptr;
  v32 = (void *)getAVFileTypeAppleM4ASymbolLoc_ptr;
  if (!getAVFileTypeAppleM4ASymbolLoc_ptr)
  {
    v15 = AVFoundationLibrary_8990();
    v14 = (id *)dlsym(v15, "AVFileTypeAppleM4A");
    *(_QWORD *)(v30 + 24) = v14;
    getAVFileTypeAppleM4ASymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v29, 8);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVFileType getAVFileTypeAppleM4A(void)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("WFAVAssetContentItem.m"), 44, CFSTR("%s"), dlerror(), v29);
    goto LABEL_26;
  }
  v16 = *v14;
  if (v4)
    v17 = v4;
  else
    v17 = v10;
  if ((objc_msgSend(v17, "isEqualToString:", v16) & 1) != 0)
  {

LABEL_16:
    v29 = 0;
    v30 = (uint64_t)&v29;
    v31 = 0x2020000000;
    v19 = (id *)getAVAssetExportPresetAppleM4ASymbolLoc_ptr;
    v32 = (void *)getAVAssetExportPresetAppleM4ASymbolLoc_ptr;
    if (!getAVAssetExportPresetAppleM4ASymbolLoc_ptr)
    {
      v20 = AVFoundationLibrary_8990();
      v19 = (id *)dlsym(v20, "AVAssetExportPresetAppleM4A");
      *(_QWORD *)(v30 + 24) = v19;
      getAVAssetExportPresetAppleM4ASymbolLoc_ptr = (uint64_t)v19;
    }
    _Block_object_dispose(&v29, 8);
    if (v19)
    {
      v21 = *v19;

      v13 = v21;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPresetAppleM4A(void)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("WFAVAssetContentItem.m"), 45, CFSTR("%s"), dlerror(), v29);
LABEL_26:

    __break(1u);
    return result;
  }
  v18 = objc_msgSend(v10, "conformsToUTType:", *MEMORY[0x24BDF8470]);

  if ((v18 & 1) != 0)
    goto LABEL_16;
LABEL_20:
  v34 = 0;
  v35 = &v34;
  v36 = 0x2050000000;
  v22 = (void *)getAVAssetExportSessionClass_softClass;
  v37 = getAVAssetExportSessionClass_softClass;
  if (!getAVAssetExportSessionClass_softClass)
  {
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = (uint64_t)__getAVAssetExportSessionClass_block_invoke;
    v32 = &unk_24C4E3118;
    v33 = &v34;
    __getAVAssetExportSessionClass_block_invoke((uint64_t)&v29);
    v22 = (void *)v35[3];
  }
  v23 = objc_retainAutorelease(v22);
  _Block_object_dispose(&v34, 8);
  -[WFAVAssetContentItem asset](self, "asset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "exportSessionWithAsset:presetName:", v24, v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)metadataItemForCommonKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WFAVAssetContentItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("commonKey = %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  -[WFAVAssetContentItem generateFileRepresentation:forType:metadata:options:](self, "generateFileRepresentation:forType:metadata:options:", a3, a5, 0, 0);
}

- (void)generateFileRepresentation:(id)a3 forType:(id)a4 metadata:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  _DWORD *v36;
  id *v37;
  void *v38;
  id *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  id *v44;
  void *v45;
  id *v46;
  void *v47;
  id *v48;
  void *v49;
  id v50;
  id *v51;
  void *v52;
  id *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  _DWORD *v59;
  id v60;
  id *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void **v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void **v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  char v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  void (**v135)(id, void *, _QWORD);
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void (**v141)(id, void *, _QWORD);
  id v142;
  _QWORD v143[4];
  id v144;
  id v145;
  id v146;
  WFAVAssetContentItem *v147;
  void (**v148)(id, void *, _QWORD);
  _QWORD v149[4];
  id v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void **v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  void (**v163)(id, void *, _QWORD);
  id v164;
  id v165;
  uint64_t v166;
  uint64_t *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  _QWORD v171[7];
  id v172;
  void *v173;
  void **v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  uint64_t v181;

  v181 = *MEMORY[0x24BDAC8D0];
  v141 = (void (**)(id, void *, _QWORD))a3;
  v10 = a4;
  v142 = a5;
  v137 = v10;
  v138 = a6;
  if (v10)
  {
    v11 = v10;
  }
  else
  {
    -[WFAVAssetContentItem preferredFileType](self, "preferredFileType");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if ((objc_msgSend(v11, "conformsToUTType:", *MEMORY[0x24BDF8470]) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", *MEMORY[0x24BEC1898]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v12;
  }
  v14 = v13;
  -[WFContentItem name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v16);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAVAssetContentItem asset](self, "asset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    getAVURLAssetClass_9009();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  v139 = v19;
  objc_msgSend(v19, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "wfFileType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v14, "isEqualToType:", v21);

  if (v22 && !objc_msgSend(v142, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "URL");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = 0;
    v97 = objc_msgSend(v95, "copyItemAtURL:toURL:error:", v96, v140, &v151);
    v98 = v151;

    if ((v97 & 1) != 0)
    {
      +[WFFileRepresentation fileWithURL:options:ofType:](WFFileRepresentation, "fileWithURL:options:ofType:", v140, 1, v12);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = v99;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v170, 1);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem setFileRepresentations:forType:](self, "setFileRepresentations:forType:", v100, v12);

      v141[2](v141, v99, 0);
    }
    else
    {
      ((void (**)(id, void *, id))v141)[2](v141, 0, v98);
    }

  }
  else
  {
    v23 = *MEMORY[0x24BDF8268];
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8268]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v14, "conformsToType:", v24);

    if (v25)
    {
      -[WFAVAssetContentItem asset](self, "asset");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem name](self, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v26;
      v29 = v27;
      v132 = v142;
      v135 = v141;
      v173 = 0;
      v174 = &v173;
      v175 = 0x2050000000;
      v30 = (void *)getAVAssetReaderClass_softClass;
      v176 = getAVAssetReaderClass_softClass;
      if (!getAVAssetReaderClass_softClass)
      {
        v152 = MEMORY[0x24BDAC760];
        v153 = 3221225472;
        v154 = (uint64_t)__getAVAssetReaderClass_block_invoke;
        v155 = &unk_24C4E3118;
        v156 = &v173;
        __getAVAssetReaderClass_block_invoke((uint64_t)&v152);
        v30 = v174[3];
      }
      v31 = objc_retainAutorelease(v30);
      _Block_object_dispose(&v173, 8);
      v165 = 0;
      objc_msgSend(v31, "assetReaderWithAsset:error:", v28, &v165);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = v165;
      getAVMediaTypeAudio();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "tracksWithMediaType:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v136 = (void *)objc_claimAutoreleasedReturnValue();

      if (v136
        && (objc_msgSend(v136, "formatDescriptions"),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            v35 = objc_msgSend(v34, "count") == 1,
            v34,
            v35))
      {
        v36 = malloc_type_calloc(0x20uLL, 1uLL, 0x8367510AuLL);
        *v36 = 6619138;
        v152 = 0;
        v153 = (uint64_t)&v152;
        v154 = 0x2020000000;
        v37 = (id *)getAVFormatIDKeySymbolLoc_ptr;
        v155 = (void *)getAVFormatIDKeySymbolLoc_ptr;
        if (!getAVFormatIDKeySymbolLoc_ptr)
        {
          v38 = AVFoundationLibrary_4305();
          v37 = (id *)dlsym(v38, "AVFormatIDKey");
          *(_QWORD *)(v153 + 24) = v37;
          getAVFormatIDKeySymbolLoc_ptr = (uint64_t)v37;
        }
        _Block_object_dispose(&v152, 8);
        if (!v37)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVFormatIDKey(void)");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "handleFailureInFunction:file:lineNumber:description:", v103, CFSTR("WFAudioInterchangeFormatEncoder.m"), 25, CFSTR("%s"), dlerror());

          goto LABEL_87;
        }
        v129 = *v37;
        v171[0] = v129;
        v173 = &unk_24C50F218;
        v152 = 0;
        v153 = (uint64_t)&v152;
        v154 = 0x2020000000;
        v39 = (id *)getAVLinearPCMIsFloatKeySymbolLoc_ptr;
        v155 = (void *)getAVLinearPCMIsFloatKeySymbolLoc_ptr;
        if (!getAVLinearPCMIsFloatKeySymbolLoc_ptr)
        {
          v40 = AVFoundationLibrary_4305();
          v39 = (id *)dlsym(v40, "AVLinearPCMIsFloatKey");
          *(_QWORD *)(v153 + 24) = v39;
          getAVLinearPCMIsFloatKeySymbolLoc_ptr = (uint64_t)v39;
        }
        v41 = v29;
        _Block_object_dispose(&v152, 8);
        if (!v39)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVLinearPCMIsFloatKey(void)");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "handleFailureInFunction:file:lineNumber:description:", v105, CFSTR("WFAudioInterchangeFormatEncoder.m"), 26, CFSTR("%s"), dlerror());

          goto LABEL_87;
        }
        v42 = *v39;
        v171[1] = v42;
        v43 = MEMORY[0x24BDBD1C0];
        v174 = (void **)MEMORY[0x24BDBD1C0];
        v152 = 0;
        v153 = (uint64_t)&v152;
        v154 = 0x2020000000;
        v44 = (id *)getAVLinearPCMBitDepthKeySymbolLoc_ptr;
        v155 = (void *)getAVLinearPCMBitDepthKeySymbolLoc_ptr;
        if (!getAVLinearPCMBitDepthKeySymbolLoc_ptr)
        {
          v45 = AVFoundationLibrary_4305();
          v44 = (id *)dlsym(v45, "AVLinearPCMBitDepthKey");
          *(_QWORD *)(v153 + 24) = v44;
          getAVLinearPCMBitDepthKeySymbolLoc_ptr = (uint64_t)v44;
        }
        _Block_object_dispose(&v152, 8);
        if (!v44)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVLinearPCMBitDepthKey(void)");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "handleFailureInFunction:file:lineNumber:description:", v107, CFSTR("WFAudioInterchangeFormatEncoder.m"), 27, CFSTR("%s"), dlerror());

          goto LABEL_87;
        }
        v127 = *v44;
        v171[2] = v127;
        v175 = (uint64_t)&unk_24C50F230;
        v152 = 0;
        v153 = (uint64_t)&v152;
        v154 = 0x2020000000;
        v46 = (id *)getAVLinearPCMIsNonInterleavedSymbolLoc_ptr;
        v155 = (void *)getAVLinearPCMIsNonInterleavedSymbolLoc_ptr;
        if (!getAVLinearPCMIsNonInterleavedSymbolLoc_ptr)
        {
          v47 = AVFoundationLibrary_4305();
          v46 = (id *)dlsym(v47, "AVLinearPCMIsNonInterleaved");
          *(_QWORD *)(v153 + 24) = v46;
          getAVLinearPCMIsNonInterleavedSymbolLoc_ptr = (uint64_t)v46;
        }
        _Block_object_dispose(&v152, 8);
        if (!v46)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVLinearPCMIsNonInterleaved(void)");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "handleFailureInFunction:file:lineNumber:description:", v109, CFSTR("WFAudioInterchangeFormatEncoder.m"), 28, CFSTR("%s"), dlerror());

          goto LABEL_87;
        }
        v125 = *v46;
        v171[3] = v125;
        v176 = v43;
        v152 = 0;
        v153 = (uint64_t)&v152;
        v154 = 0x2020000000;
        v48 = (id *)getAVLinearPCMIsBigEndianKeySymbolLoc_ptr;
        v155 = (void *)getAVLinearPCMIsBigEndianKeySymbolLoc_ptr;
        if (!getAVLinearPCMIsBigEndianKeySymbolLoc_ptr)
        {
          v49 = AVFoundationLibrary_4305();
          v48 = (id *)dlsym(v49, "AVLinearPCMIsBigEndianKey");
          *(_QWORD *)(v153 + 24) = v48;
          getAVLinearPCMIsBigEndianKeySymbolLoc_ptr = (uint64_t)v48;
        }
        _Block_object_dispose(&v152, 8);
        if (!v48)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVLinearPCMIsBigEndianKey(void)");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "handleFailureInFunction:file:lineNumber:description:", v111, CFSTR("WFAudioInterchangeFormatEncoder.m"), 29, CFSTR("%s"), dlerror());

          goto LABEL_87;
        }
        v50 = *v48;
        v171[4] = v50;
        v177 = MEMORY[0x24BDBD1C8];
        v152 = 0;
        v153 = (uint64_t)&v152;
        v154 = 0x2020000000;
        v51 = (id *)getAVSampleRateKeySymbolLoc_ptr;
        v155 = (void *)getAVSampleRateKeySymbolLoc_ptr;
        if (!getAVSampleRateKeySymbolLoc_ptr)
        {
          v52 = AVFoundationLibrary_4305();
          v51 = (id *)dlsym(v52, "AVSampleRateKey");
          *(_QWORD *)(v153 + 24) = v51;
          getAVSampleRateKeySymbolLoc_ptr = (uint64_t)v51;
        }
        _Block_object_dispose(&v152, 8);
        if (!v51)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVSampleRateKey(void)");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "handleFailureInFunction:file:lineNumber:description:", v113, CFSTR("WFAudioInterchangeFormatEncoder.m"), 31, CFSTR("%s"), dlerror());

          goto LABEL_87;
        }
        v124 = *v51;
        v171[5] = v124;
        v178 = &unk_24C50F248;
        v152 = 0;
        v153 = (uint64_t)&v152;
        v154 = 0x2020000000;
        v53 = (id *)getAVNumberOfChannelsKeySymbolLoc_ptr;
        v155 = (void *)getAVNumberOfChannelsKeySymbolLoc_ptr;
        if (!getAVNumberOfChannelsKeySymbolLoc_ptr)
        {
          v54 = AVFoundationLibrary_4305();
          v53 = (id *)dlsym(v54, "AVNumberOfChannelsKey");
          *(_QWORD *)(v153 + 24) = v53;
          getAVNumberOfChannelsKeySymbolLoc_ptr = (uint64_t)v53;
        }
        v122 = v42;
        v123 = v50;
        v55 = v23;
        v56 = v12;
        v57 = v28;
        v58 = v41;
        v59 = v36;
        _Block_object_dispose(&v152, 8);
        if (!v53)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVNumberOfChannelsKey(void)");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "handleFailureInFunction:file:lineNumber:description:", v115, CFSTR("WFAudioInterchangeFormatEncoder.m"), 32, CFSTR("%s"), dlerror());

          goto LABEL_87;
        }
        v60 = *v53;
        v171[6] = v60;
        v179 = &unk_24C50F260;
        v152 = 0;
        v153 = (uint64_t)&v152;
        v154 = 0x2020000000;
        v61 = (id *)getAVChannelLayoutKeySymbolLoc_ptr;
        v155 = (void *)getAVChannelLayoutKeySymbolLoc_ptr;
        if (!getAVChannelLayoutKeySymbolLoc_ptr)
        {
          v62 = AVFoundationLibrary_4305();
          v61 = (id *)dlsym(v62, "AVChannelLayoutKey");
          *(_QWORD *)(v153 + 24) = v61;
          getAVChannelLayoutKeySymbolLoc_ptr = (uint64_t)v61;
        }
        _Block_object_dispose(&v152, 8);
        if (!v61)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVChannelLayoutKey(void)");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "handleFailureInFunction:file:lineNumber:description:", v117, CFSTR("WFAudioInterchangeFormatEncoder.m"), 33, CFSTR("%s"), dlerror());

          goto LABEL_87;
        }
        v172 = *v61;
        v63 = (void *)MEMORY[0x24BDBCE50];
        v64 = v172;
        objc_msgSend(v63, "dataWithBytesNoCopy:length:freeWhenDone:", v59, 32, 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v58;
        v28 = v57;
        v12 = v56;
        v180 = v65;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v173, v171, 8);
        v131 = (void *)objc_claimAutoreleasedReturnValue();

        v166 = 0;
        v167 = &v166;
        v168 = 0x2050000000;
        v66 = (void *)getAVAssetReaderTrackOutputClass_softClass;
        v169 = getAVAssetReaderTrackOutputClass_softClass;
        if (!getAVAssetReaderTrackOutputClass_softClass)
        {
          v152 = MEMORY[0x24BDAC760];
          v153 = 3221225472;
          v154 = (uint64_t)__getAVAssetReaderTrackOutputClass_block_invoke;
          v155 = &unk_24C4E3118;
          v156 = (void **)&v166;
          __getAVAssetReaderTrackOutputClass_block_invoke((uint64_t)&v152);
          v66 = (void *)v167[3];
        }
        v67 = objc_retainAutorelease(v66);
        _Block_object_dispose(&v166, 8);
        objc_msgSend(v67, "assetReaderTrackOutputWithTrack:outputSettings:", v136, v131);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v133, "canAddOutput:", v68) & 1) != 0)
        {
          objc_msgSend(v133, "addOutput:", v68);
          objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v55);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v29, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v70);
          v128 = (void *)objc_claimAutoreleasedReturnValue();

          v166 = 0;
          v167 = &v166;
          v168 = 0x2050000000;
          v71 = (void *)getAVAssetWriterClass_softClass_4317;
          v169 = getAVAssetWriterClass_softClass_4317;
          if (!getAVAssetWriterClass_softClass_4317)
          {
            v152 = MEMORY[0x24BDAC760];
            v153 = 3221225472;
            v154 = (uint64_t)__getAVAssetWriterClass_block_invoke_4318;
            v155 = &unk_24C4E3118;
            v156 = (void **)&v166;
            __getAVAssetWriterClass_block_invoke_4318((uint64_t)&v152);
            v71 = (void *)v167[3];
          }
          v72 = objc_retainAutorelease(v71);
          _Block_object_dispose(&v166, 8);
          v152 = 0;
          v153 = (uint64_t)&v152;
          v154 = 0x2020000000;
          v73 = (void **)getAVFileTypeAIFFSymbolLoc_ptr;
          v155 = (void *)getAVFileTypeAIFFSymbolLoc_ptr;
          if (!getAVFileTypeAIFFSymbolLoc_ptr)
          {
            v74 = AVFoundationLibrary_4305();
            v73 = (void **)dlsym(v74, "AVFileTypeAIFF");
            *(_QWORD *)(v153 + 24) = v73;
            getAVFileTypeAIFFSymbolLoc_ptr = (uint64_t)v73;
          }
          _Block_object_dispose(&v152, 8);
          if (!v73)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVFileType getAVFileTypeAIFF(void)");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "handleFailureInFunction:file:lineNumber:description:", v119, CFSTR("WFAudioInterchangeFormatEncoder.m"), 30, CFSTR("%s"), dlerror());

            goto LABEL_87;
          }
          v75 = *v73;
          v164 = v134;
          v76 = v75;
          objc_msgSend(v72, "assetWriterWithURL:fileType:error:", v128, v76, &v164);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = v164;

          objc_msgSend(v130, "setMetadata:", v132);
          v166 = 0;
          v167 = &v166;
          v168 = 0x2050000000;
          v77 = (void *)getAVAssetWriterInputClass_softClass_4320;
          v169 = getAVAssetWriterInputClass_softClass_4320;
          if (!getAVAssetWriterInputClass_softClass_4320)
          {
            v152 = MEMORY[0x24BDAC760];
            v153 = 3221225472;
            v154 = (uint64_t)__getAVAssetWriterInputClass_block_invoke_4321;
            v155 = &unk_24C4E3118;
            v156 = (void **)&v166;
            __getAVAssetWriterInputClass_block_invoke_4321((uint64_t)&v152);
            v77 = (void *)v167[3];
          }
          v78 = objc_retainAutorelease(v77);
          _Block_object_dispose(&v166, 8);
          getAVMediaTypeAudio();
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "assetWriterInputWithMediaType:outputSettings:", v79, v131);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v80, "setExpectsMediaDataInRealTime:", 0);
          if ((objc_msgSend(v130, "canAddInput:", v80) & 1) != 0
            && (objc_msgSend(v130, "addInput:", v80), (objc_msgSend(v130, "startWriting") & 1) != 0)
            && (objc_msgSend(v133, "startReading") & 1) != 0)
          {
            v81 = objc_msgSend(v136, "naturalTimeScale");
            v152 = 0;
            v153 = (uint64_t)&v152;
            v154 = 0x2020000000;
            v82 = getCMTimeMakeSymbolLoc_ptr_4322;
            v155 = getCMTimeMakeSymbolLoc_ptr_4322;
            if (!getCMTimeMakeSymbolLoc_ptr_4322)
            {
              v83 = CoreMediaLibrary_4323();
              v82 = dlsym(v83, "CMTimeMake");
              *(_QWORD *)(v153 + 24) = v82;
              getCMTimeMakeSymbolLoc_ptr_4322 = v82;
            }
            _Block_object_dispose(&v152, 8);
            if (!v82)
            {
              while (1)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CMTime soft_CMTimeMake(int64_t, int32_t)");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "handleFailureInFunction:file:lineNumber:description:", v121, CFSTR("WFAudioInterchangeFormatEncoder.m"), 16, CFSTR("%s"), dlerror());

LABEL_87:
                __break(1u);
              }
            }
            ((void (*)(uint64_t *__return_ptr, _QWORD, uint64_t))v82)(&v166, 0, v81);
            objc_msgSend(v130, "startSessionAtSourceTime:", &v166);
            dispatch_get_global_queue(0, 0);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = MEMORY[0x24BDAC760];
            v153 = 3221225472;
            v154 = (uint64_t)__WFEncodeAssetToAIFF_block_invoke;
            v155 = &unk_24C4DCD20;
            v85 = v80;
            v156 = v85;
            v157 = v68;
            v158 = v130;
            v163 = v135;
            v159 = v128;
            v160 = v69;
            v161 = v133;
            v162 = v126;
            objc_msgSend(v85, "requestMediaDataWhenReadyOnQueue:usingBlock:", v84, &v152);

          }
          else
          {
            ((void (**)(id, void *, id))v135)[2](v135, 0, v126);
          }

          v134 = v126;
        }
        else
        {
          ((void (**)(id, void *, id))v135)[2](v135, 0, v134);
        }

      }
      else
      {
        v135[2](v135, 0, 0);
      }

    }
    else
    {
      -[WFAVAssetContentItem generateExportSessionForType:](self, "generateExportSessionForType:", v14);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setOutputURL:", v140);
      if (v142)
        objc_msgSend(v86, "setMetadata:");
      v87 = (void *)MEMORY[0x24BEC14A0];
      objc_msgSend(v86, "supportedFileTypes");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "typesFromStrings:", v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = MEMORY[0x24BDAC760];
      v149[0] = MEMORY[0x24BDAC760];
      v149[1] = 3221225472;
      v149[2] = __76__WFAVAssetContentItem_generateFileRepresentation_forType_metadata_options___block_invoke;
      v149[3] = &unk_24C4DEB68;
      v91 = v14;
      v150 = v91;
      objc_msgSend(v89, "indexesOfObjectsPassingTest:", v149);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v92, "count");

      if (v93)
      {
        objc_msgSend(v91, "string");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setOutputFileType:", v94);

        v143[0] = v90;
        v143[1] = 3221225472;
        v143[2] = __76__WFAVAssetContentItem_generateFileRepresentation_forType_metadata_options___block_invoke_2;
        v143[3] = &unk_24C4DEB90;
        v144 = v86;
        v148 = v141;
        v145 = v140;
        v146 = v12;
        v147 = self;
        objc_msgSend(v144, "exportAsynchronouslyWithCompletionHandler:", v143);

      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v12);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v141)[2](v141, 0, v101);

      }
    }
  }

}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  Class v11;

  v7 = a3;
  if (-[objc_class isSubclassOfClass:](a5, "isSubclassOfClass:", getAVMutableMovieClass()))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __70__WFAVAssetContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v9[3] = &unk_24C4DEBB8;
    v11 = a5;
    v9[4] = self;
    v10 = v7;
    -[WFContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v9, 0);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v8);

  }
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id AVURLAssetClass_9009;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(CFSTR("AVAsset"), "isEqualToString:", v7);

  if (v8)
  {
    -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSObject fileURL](v10, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDBCF48];
      NSHomeDirectory();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fileURLWithPath:isDirectory:", v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "wf_isContainedByDirectoryAtURL:", v14))
      {

      }
      else
      {
        -[NSObject fileURL](v10, "fileURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFTemporaryFileManager sharedAppGroupDirectoryURL](WFTemporaryFileManager, "sharedAppGroupDirectoryURL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "wf_isContainedByDirectoryAtURL:", v22);

        if ((v23 & 1) == 0)
        {
          v24 = -[NSObject copy](v10, "copy");

          v31 = v24;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFContentItem setFileRepresentations:forType:](self, "setFileRepresentations:forType:", v25, v26);

          v10 = v24;
        }
      }
      AVURLAssetClass_9009 = getAVURLAssetClass_9009();
      -[NSObject fileURL](v10, "fileURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(AVURLAssetClass_9009, "assetWithURL:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject wfName](v10, "wfName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v29, v30);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      getWFContentItemLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[WFAVAssetContentItem generateObjectRepresentationForClass:options:error:]";
        _os_log_impl(&dword_20BBAD000, v10, OS_LOG_TYPE_FAULT, "%s Failed to generate AVAsset repersentation; fileRepresentationForType: returned nil",
          buf,
          0xCu);
      }
      v16 = 0;
    }
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
      return 0;
    -[WFAVAssetContentItem metadataItemForCommonKey:](self, "metadataItemForCommonKey:", CFSTR("artwork"));
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject value](v10, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "objectForKey:", CFSTR("data"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEC14E0], "imageWithData:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[WFContentItem name](self, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v19, v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (id)supportedTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BEC14A0];
  -[WFAVAssetContentItem generateExportSessionForType:](self, "generateExportSessionForType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supportedFileTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typesFromStrings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", *MEMORY[0x24BEC1898]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v3, "containsObject:", v8);

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8470]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8268]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", getAVAssetClass());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", getAVMutableMovieClass());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  -[WFAVAssetContentItem metadataItemForCommonKey:](self, "metadataItemForCommonKey:", CFSTR("artwork"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  return v3;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    -[WFAVAssetContentItem metadataItemForCommonKey:](self, "metadataItemForCommonKey:", CFSTR("artwork"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else if ((objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF82D8]) & 1) != 0
         || (objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF82D0]) & 1) != 0
         || (objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF8640]) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFAVAssetContentItem;
    v6 = -[WFGenericFileContentItem canGenerateRepresentationForType:](&v8, sel_canGenerateRepresentationForType_, v4);
  }

  return v6;
}

void __70__WFAVAssetContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id AVMutableMovieClass;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  __CFString *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    AVMutableMovieClass = getAVMutableMovieClass();
    objc_msgSend(v5, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(AVMutableMovieClass, "assetWithURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v10 + 16))(v10, v9, v11, 0);

  }
  else
  {
    getWFContentItemLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      NSStringFromClass(*(Class *)(a1 + 48));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v6, "localizedDescription");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = CFSTR("couldn't generate an asset file");
      }
      v15 = 136315650;
      v16 = "-[WFAVAssetContentItem generateObjectRepresentation:options:forClass:]_block_invoke";
      v17 = 2114;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_20BBAD000, v12, OS_LOG_TYPE_FAULT, "%s Failed to generate %{public}@ representation: %{public}@", (uint8_t *)&v15, 0x20u);
      if (v6)

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __76__WFAVAssetContentItem_generateFileRepresentation_forType_metadata_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "conformsToType:", a2);
}

void __76__WFAVAssetContentItem_generateFileRepresentation_forType_metadata_options___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 3)
  {
    +[WFFileRepresentation fileWithURL:options:ofType:](WFFileRepresentation, "fileWithURL:options:ofType:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 56);
    v9[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFileRepresentations:forType:", v4, *(_QWORD *)(a1 + 48));

    v5 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v2, v6);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);

  }
}

+ (id)propertyBuilders
{
  id *v2;
  void *v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[8];

  v40[6] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Duration"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("duration"), v35, objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "timeUnits:", 224);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v33;
  WFLocalizedContentPropertyNameMarker(CFSTR("Frame Rate"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("frameRate"), v32, objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "irrational:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v30;
  WFLocalizedContentPropertyNameMarker(CFSTR("Title"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9086, v29, objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v2 = (id *)getAVMetadataCommonKeyTitleSymbolLoc_ptr;
  v39 = getAVMetadataCommonKeyTitleSymbolLoc_ptr;
  if (!getAVMetadataCommonKeyTitleSymbolLoc_ptr)
  {
    v3 = AVFoundationLibrary_8990();
    v2 = (id *)dlsym(v3, "AVMetadataCommonKeyTitle");
    v37[3] = (uint64_t)v2;
    getAVMetadataCommonKeyTitleSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v36, 8);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataKey getAVMetadataCommonKeyTitle(void)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("WFAVAssetContentItem.m"), 38, CFSTR("%s"), dlerror());

    goto LABEL_14;
  }
  v24 = *v2;
  objc_msgSend(v28, "userInfo:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v27;
  WFLocalizedContentPropertyNameMarker(CFSTR("Artist"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9086, v26, objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v4 = (id *)getAVMetadataCommonKeyArtistSymbolLoc_ptr;
  v39 = getAVMetadataCommonKeyArtistSymbolLoc_ptr;
  if (!getAVMetadataCommonKeyArtistSymbolLoc_ptr)
  {
    v5 = AVFoundationLibrary_8990();
    v4 = (id *)dlsym(v5, "AVMetadataCommonKeyArtist");
    v37[3] = (uint64_t)v4;
    getAVMetadataCommonKeyArtistSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v36, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataKey getAVMetadataCommonKeyArtist(void)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("WFAVAssetContentItem.m"), 39, CFSTR("%s"), dlerror());

    goto LABEL_14;
  }
  v6 = *v4;
  objc_msgSend(v25, "userInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v7;
  WFLocalizedContentPropertyNameMarker(CFSTR("Album"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9086, v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v10 = (id *)getAVMetadataCommonKeyAlbumNameSymbolLoc_ptr;
  v39 = getAVMetadataCommonKeyAlbumNameSymbolLoc_ptr;
  if (!getAVMetadataCommonKeyAlbumNameSymbolLoc_ptr)
  {
    v11 = AVFoundationLibrary_8990();
    v10 = (id *)dlsym(v11, "AVMetadataCommonKeyAlbumName");
    v37[3] = (uint64_t)v10;
    getAVMetadataCommonKeyAlbumNameSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v36, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataKey getAVMetadataCommonKeyAlbumName(void)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("WFAVAssetContentItem.m"), 40, CFSTR("%s"), dlerror());

LABEL_14:
    __break(1u);
  }
  v12 = *v10;
  objc_msgSend(v9, "userInfo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v13;
  WFLocalizedContentPropertyNameMarker(CFSTR("Artwork"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_27, v14, objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF82D8]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF82D0]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF8640]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFAVAssetContentItem;
    v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("AVAsset"), CFSTR("AVFoundation"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF82D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("AVMutableMovie"), CFSTR("AVFoundation"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Media");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Media (singular)"), CFSTR("Media"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Media (plural)"), CFSTR("Media"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Media Items"));
}

void __40__WFAVAssetContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a4;
  objc_msgSend(v5, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("commonMetadata");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__WFAVAssetContentItem_propertyBuilders__block_invoke_4;
  v11[3] = &unk_24C4E00C0;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "loadValuesAsynchronouslyForKeys:completionHandler:", v8, v11);

}

void __40__WFAVAssetContentItem_propertyBuilders__block_invoke_4(uint64_t a1)
{
  id AVMetadataItemClass;
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  AVMetadataItemClass = getAVMetadataItemClass();
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v5 = (id *)getAVMetadataCommonKeyArtworkSymbolLoc_ptr;
  v20 = getAVMetadataCommonKeyArtworkSymbolLoc_ptr;
  if (!getAVMetadataCommonKeyArtworkSymbolLoc_ptr)
  {
    v6 = AVFoundationLibrary_8990();
    v5 = (id *)dlsym(v6, "AVMetadataCommonKeyArtwork");
    v18[3] = (uint64_t)v5;
    getAVMetadataCommonKeyArtworkSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v17, 8);
  if (v5)
  {
    v7 = *v5;
    getAVMetadataKeySpaceCommon();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(AVMetadataItemClass, "metadataItemsFromArray:withKey:keySpace:", v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD *)(a1 + 40);
    v12 = (void *)MEMORY[0x24BEC14E0];
    objc_msgSend(v10, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithData:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataKey getAVMetadataCommonKeyArtwork(void)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("WFAVAssetContentItem.m"), 41, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void __40__WFAVAssetContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v6, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("commonMetadata");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __40__WFAVAssetContentItem_propertyBuilders__block_invoke_2;
  v14[3] = &unk_24C4E2DD0;
  v15 = v6;
  v16 = v7;
  v17 = v8;
  v11 = v8;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v9, "loadValuesAsynchronouslyForKeys:completionHandler:", v10, v14);

}

void __40__WFAVAssetContentItem_propertyBuilders__block_invoke_2(uint64_t a1)
{
  id AVMetadataItemClass;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  AVMetadataItemClass = getAVMetadataItemClass();
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  getAVMetadataKeySpaceCommon();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(AVMetadataItemClass, "metadataItemsFromArray:withKey:keySpace:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v10, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  BOOL result;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = (void (**)(id, void *))a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v5 = (void *)getAVMetadataItemClass_softClass_13250;
  v29 = getAVMetadataItemClass_softClass_13250;
  if (!getAVMetadataItemClass_softClass_13250)
  {
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = (uint64_t)__getAVMetadataItemClass_block_invoke_13251;
    v24 = &unk_24C4E3118;
    v25 = &v26;
    __getAVMetadataItemClass_block_invoke_13251((uint64_t)&v21);
    v5 = (void *)v27[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v26, 8);
  -[WFAVAssetContentItem asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = (uint64_t)&v21;
  v23 = 0x2020000000;
  v9 = (id *)getAVMetadataCommonKeyArtistSymbolLoc_ptr_13252;
  v24 = (void *)getAVMetadataCommonKeyArtistSymbolLoc_ptr_13252;
  if (!getAVMetadataCommonKeyArtistSymbolLoc_ptr_13252)
  {
    v10 = AVFoundationLibrary_13253();
    v9 = (id *)dlsym(v10, "AVMetadataCommonKeyArtist");
    *(_QWORD *)(v22 + 24) = v9;
    getAVMetadataCommonKeyArtistSymbolLoc_ptr_13252 = (uint64_t)v9;
  }
  _Block_object_dispose(&v21, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataKey getAVMetadataCommonKeyArtist(void)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFContentItem+ChooseFromList.m"), 36, CFSTR("%s"), dlerror(), v21);
LABEL_18:

    __break(1u);
    return result;
  }
  v11 = *v9;
  v21 = 0;
  v22 = (uint64_t)&v21;
  v23 = 0x2020000000;
  v12 = (_QWORD *)getAVMetadataKeySpaceCommonSymbolLoc_ptr_13256;
  v24 = (void *)getAVMetadataKeySpaceCommonSymbolLoc_ptr_13256;
  if (!getAVMetadataKeySpaceCommonSymbolLoc_ptr_13256)
  {
    v13 = AVFoundationLibrary_13253();
    v12 = dlsym(v13, "AVMetadataKeySpaceCommon");
    *(_QWORD *)(v22 + 24) = v12;
    getAVMetadataKeySpaceCommonSymbolLoc_ptr_13256 = (uint64_t)v12;
  }
  _Block_object_dispose(&v21, 8);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataKeySpace getAVMetadataKeySpaceCommon(void)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFContentItem+ChooseFromList.m"), 35, CFSTR("%s"), dlerror(), v21);
    goto LABEL_18;
  }
  objc_msgSend(v6, "metadataItemsFromArray:withKey:keySpace:", v8, v11, *v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4)
      v4[2](v4, v16);
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)getListAltText:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  double (*v7)(__int128 *);
  double v8;
  void *v9;
  BOOL result;
  void *v11;
  void *v12;
  __int128 v13;
  void *(*v14)(_QWORD *);
  __int128 v15;
  void *(*v16)(_QWORD *);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v4 = (void (**)(id, void *))a3;
  -[WFAVAssetContentItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "duration");
  }
  else
  {
    v13 = 0uLL;
    v14 = 0;
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v7 = (double (*)(__int128 *))getCMTimeGetSecondsSymbolLoc_ptr_13243;
  v22 = getCMTimeGetSecondsSymbolLoc_ptr_13243;
  if (!getCMTimeGetSecondsSymbolLoc_ptr_13243)
  {
    *(_QWORD *)&v15 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v15 + 1) = 3221225472;
    v16 = __getCMTimeGetSecondsSymbolLoc_block_invoke;
    v17 = &unk_24C4E3118;
    v18 = &v19;
    __getCMTimeGetSecondsSymbolLoc_block_invoke(&v15);
    v7 = (double (*)(__int128 *))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v7)
  {
    v15 = v13;
    v16 = v14;
    v8 = v7(&v15);
    WFChooseFromListFormatPlaybackDuration(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v4[2](v4, v9);

    return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Float64 soft_CMTimeGetSeconds(CMTime)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("WFContentItem+ChooseFromList.m"), 31, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

@end
