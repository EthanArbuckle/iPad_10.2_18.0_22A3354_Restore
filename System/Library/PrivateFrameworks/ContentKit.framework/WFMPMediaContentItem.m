@implementation WFMPMediaContentItem

- (MPMediaItem)mediaItem
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v3 = (void *)getMPMediaItemClass_softClass_9582;
  v10 = getMPMediaItemClass_softClass_9582;
  if (!getMPMediaItemClass_softClass_9582)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getMPMediaItemClass_block_invoke_9583;
    v6[3] = &unk_24C4E3118;
    v6[4] = &v7;
    __getMPMediaItemClass_block_invoke_9583((uint64_t)v6);
    v3 = (void *)v8[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v7, 8);
  -[WFContentItem objectForClass:](self, "objectForClass:", v4);
  return (MPMediaItem *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)assetURL
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  id result;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  -[WFMPMediaContentItem mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = (_QWORD *)getMPMediaItemPropertyAssetURLSymbolLoc_ptr;
  v12 = getMPMediaItemPropertyAssetURLSymbolLoc_ptr;
  if (!getMPMediaItemPropertyAssetURLSymbolLoc_ptr)
  {
    v4 = MediaPlayerLibrary();
    v3 = dlsym(v4, "MPMediaItemPropertyAssetURL");
    v10[3] = (uint64_t)v3;
    getMPMediaItemPropertyAssetURLSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    objc_msgSend(v2, "valueForProperty:", *v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyAssetURL(void)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("WFMPMediaContentItem.m"), 35, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (NSDictionary)additionalRepresentationsForSerialization
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFMPMediaContentItem;
  -[WFContentItem additionalRepresentationsForSerialization](&v10, sel_additionalRepresentationsForSerialization);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WFMPMediaContentItem preferredFileType](self, "preferredFileType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("link.contentkit.remoteitem.preferredfiletype"));

  -[WFMPMediaContentItem artist](self, "artist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v7, CFSTR("link.contentkit.mpmediaitem.artist"));

  -[WFMPMediaContentItem albumTitle](self, "albumTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("link.contentkit.mpmediaitem.album"));

  return (NSDictionary *)v4;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[WFMPMediaContentItem mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)artist
{
  void *v2;
  void *v3;

  -[WFMPMediaContentItem mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)albumTitle
{
  void *v2;
  void *v3;

  -[WFMPMediaContentItem mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "albumTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)getPreferredFileSize:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id AVURLAssetClass_9527;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _OWORD v21[3];
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  _OWORD v26[3];
  _QWORD v27[4];
  void (**v28)(id, _QWORD);
  __int128 v29;
  uint64_t v30;
  void *v31;
  __int128 *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v4 = (void (**)(id, _QWORD))a3;
  -[WFMPMediaContentItem assetURL](self, "assetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v4[2](v4, 0);
LABEL_21:

    return;
  }
  AVURLAssetClass_9527 = getAVURLAssetClass_9527();
  -[WFMPMediaContentItem assetURL](self, "assetURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(AVURLAssetClass_9527, "assetWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFMPMediaContentItem preferredFileType](self, "preferredFileType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "conformsToString:", *MEMORY[0x24BEC1898]) & 1) == 0)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __45__WFMPMediaContentItem_getPreferredFileSize___block_invoke;
    v27[3] = &unk_24C4E2ED8;
    v28 = v4;
    -[WFContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v27, 0);
    v14 = v28;
LABEL_20:

    goto LABEL_21;
  }
  *(_QWORD *)&v33 = 0;
  *((_QWORD *)&v33 + 1) = &v33;
  v34 = 0x2050000000;
  v10 = (void *)getAVAssetExportSessionClass_softClass_9560;
  v35 = getAVAssetExportSessionClass_softClass_9560;
  if (!getAVAssetExportSessionClass_softClass_9560)
  {
    *(_QWORD *)&v29 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v29 + 1) = 3221225472;
    v30 = (uint64_t)__getAVAssetExportSessionClass_block_invoke_9561;
    v31 = &unk_24C4E3118;
    v32 = &v33;
    __getAVAssetExportSessionClass_block_invoke_9561((uint64_t)&v29);
    v10 = *(void **)(*((_QWORD *)&v33 + 1) + 24);
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v33, 8);
  *(_QWORD *)&v29 = 0;
  *((_QWORD *)&v29 + 1) = &v29;
  v30 = 0x2020000000;
  v12 = (_QWORD *)getAVAssetExportPresetAppleM4ASymbolLoc_ptr_9562;
  v31 = (void *)getAVAssetExportPresetAppleM4ASymbolLoc_ptr_9562;
  if (!getAVAssetExportPresetAppleM4ASymbolLoc_ptr_9562)
  {
    v13 = AVFoundationLibrary_9533();
    v12 = dlsym(v13, "AVAssetExportPresetAppleM4A");
    *(_QWORD *)(*((_QWORD *)&v29 + 1) + 24) = v12;
    getAVAssetExportPresetAppleM4ASymbolLoc_ptr_9562 = (uint64_t)v12;
  }
  _Block_object_dispose(&v29, 8);
  if (v12)
  {
    objc_msgSend(v11, "exportSessionWithAsset:presetName:", v8, *v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v29 = 0;
    *((_QWORD *)&v29 + 1) = &v29;
    v30 = 0x2020000000;
    v15 = (_QWORD *)getkCMTimeZeroSymbolLoc_ptr_9564;
    v31 = (void *)getkCMTimeZeroSymbolLoc_ptr_9564;
    if (!getkCMTimeZeroSymbolLoc_ptr_9564)
    {
      v16 = CoreMediaLibrary_9565();
      v15 = dlsym(v16, "kCMTimeZero");
      *(_QWORD *)(*((_QWORD *)&v29 + 1) + 24) = v15;
      getkCMTimeZeroSymbolLoc_ptr_9564 = (uint64_t)v15;
    }
    _Block_object_dispose(&v29, 8);
    if (v15)
    {
      v24 = *(_OWORD *)v15;
      v25 = v15[2];
      if (v8)
      {
        objc_msgSend(v8, "duration");
      }
      else
      {
        v22 = 0uLL;
        v23 = 0;
      }
      *(_QWORD *)&v29 = 0;
      *((_QWORD *)&v29 + 1) = &v29;
      v30 = 0x2020000000;
      v17 = getCMTimeRangeMakeSymbolLoc_ptr_9568;
      v31 = getCMTimeRangeMakeSymbolLoc_ptr_9568;
      if (!getCMTimeRangeMakeSymbolLoc_ptr_9568)
      {
        v18 = CoreMediaLibrary_9565();
        v17 = dlsym(v18, "CMTimeRangeMake");
        *(_QWORD *)(*((_QWORD *)&v29 + 1) + 24) = v17;
        getCMTimeRangeMakeSymbolLoc_ptr_9568 = v17;
      }
      _Block_object_dispose(&v29, 8);
      if (v17)
      {
        v29 = v24;
        v30 = v25;
        v33 = v22;
        v34 = v23;
        ((void (*)(_OWORD *__return_ptr, __int128 *, __int128 *))v17)(v26, &v29, &v33);
        v21[0] = v26[0];
        v21[1] = v26[1];
        v21[2] = v26[2];
        objc_msgSend(v14, "setTimeRange:", v21);
        v4[2](v4, objc_msgSend(v14, "estimatedOutputFileLength"));
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CMTimeRange soft_CMTimeRangeMake(CMTime, CMTime)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFMPMediaContentItem.m"), 25, CFSTR("%s"), dlerror());
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CMTime getkCMTimeZero(void)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFMPMediaContentItem.m"), 24, CFSTR("%s"), dlerror());
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPresetAppleM4A(void)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFMPMediaContentItem.m"), 30, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

- (WFFileType)preferredFileType
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[WFMPMediaContentItem assetURL](self, "assetURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFileExtension:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToUTType:", *MEMORY[0x24BDF8470]))
    {
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", *MEMORY[0x24BEC1898]);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v5;
    }
    v7 = v6;

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFMPMediaContentItem;
    -[WFContentItem preferredFileType](&v9, sel_preferredFileType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (WFFileType *)v7;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v21;
  double v22;
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
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  if ((Class)objc_opt_class() == a3)
  {
    -[WFMPMediaContentItem mediaItem](self, "mediaItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    getMPMediaItemPropertyArtwork();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForProperty:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFMPMediaContentItem mediaItem](self, "mediaItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    getMPMediaItemPropertyAlbumTitle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForProperty:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      -[WFContentItem name](self, "name");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v19;

    objc_msgSend(v10, "bounds");
    objc_msgSend(v10, "imageWithSize:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14E0]), "initWithPlatformImage:", v23);
      +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v24, v11);
      a5 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else if (a5)
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      v41 = *MEMORY[0x24BDD1128];
      v44[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("Item Has No Album Art"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v26;
      v44[1] = *MEMORY[0x24BDD0FC8];
      v27 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("The item “%@” cannot be converted to an image, because it has no artwork."));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem name](self, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringWithFormat:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", v41, 79, v31);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }

    goto LABEL_20;
  }
  NSStringFromClass(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(CFSTR("AVAsset"), "isEqualToString:", v8);

  if (v9)
  {
    -[WFMPMediaContentItem assetURL](self, "assetURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (a5)
      {
        v32 = (void *)MEMORY[0x24BDD1540];
        v33 = *MEMORY[0x24BDD1128];
        v42[0] = *MEMORY[0x24BDD0FD8];
        WFLocalizedString(CFSTR("Item Not Downloaded"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v34;
        v42[1] = *MEMORY[0x24BDD0FC8];
        v35 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("The item “%@” cannot be exported, likely because it is only stored in iCloud or has not yet been synced to this device."));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFContentItem name](self, "name");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringWithFormat:", v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v38;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 79, v39);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        a5 = 0;
      }
      goto LABEL_21;
    }
    objc_msgSend(getAVURLAssetClass_9527(), "assetWithURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v11, v12);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
      return 0;
    -[WFMPMediaContentItem mediaItem](self, "mediaItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "releaseDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      a5 = 0;
      goto LABEL_20;
    }
    -[WFMPMediaContentItem mediaItem](self, "mediaItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "releaseDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v40, CFSTR("Release Date"));
    a5 = (id *)objc_claimAutoreleasedReturnValue();

  }
LABEL_20:

LABEL_21:
  return a5;
}

uint64_t __45__WFMPMediaContentItem_getPreferredFileSize___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "fileSize"));
}

+ (id)propertyBuilders
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  id *v6;
  void *v7;
  id *v8;
  void *v9;
  id *v10;
  void *v11;
  id *v12;
  void *v13;
  id *v14;
  void *v15;
  id *v16;
  void *v17;
  id *v18;
  void *v19;
  id *v20;
  void *v21;
  id *v22;
  void *v23;
  id *v24;
  void *v25;
  id *v26;
  void *v27;
  id *v28;
  void *v29;
  id *v30;
  void *v31;
  id *v32;
  void *v33;
  id *v34;
  void *v35;
  id *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
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
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  id v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  _QWORD v220[4];
  id v221;
  _QWORD v222[4];
  id v223;
  _QWORD aBlock[4];
  id v225;
  id v226;
  uint64_t v227;
  uint64_t *v228;
  uint64_t v229;
  uint64_t v230;
  _QWORD v231[28];

  v231[26] = *MEMORY[0x24BDAC8D0];
  WFMPMediaTypeMapping();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_3;
  aBlock[3] = &unk_24C4DED30;
  v226 = &__block_literal_global_9643;
  v204 = v2;
  v225 = v204;
  v205 = _Block_copy(aBlock);
  WFLocalizedContentPropertyNameMarker(CFSTR("Title"));
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v219, objc_opt_class());
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v4 = (id *)getMPMediaItemPropertyTitleSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyTitleSymbolLoc_ptr;
  if (!getMPMediaItemPropertyTitleSymbolLoc_ptr)
  {
    v5 = MediaPlayerLibrary();
    v4 = (id *)dlsym(v5, "MPMediaItemPropertyTitle");
    v228[3] = (uint64_t)v4;
    getMPMediaItemPropertyTitleSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v227, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyTitle(void)");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("WFMPMediaContentItem.m"), 36, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v100 = *v4;
  objc_msgSend(v218, "userInfo:");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v231[0] = v217;
  WFLocalizedContentPropertyNameMarkerWithContext(CFSTR("Album"), (uint64_t)CFSTR("Music Content Item"));
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v216, objc_opt_class());
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  getMPMediaItemPropertyAlbumTitle();
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v215, "userInfo:", v214);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v231[1] = v213;
  WFLocalizedContentPropertyNameMarker(CFSTR("Artist"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v212, objc_opt_class());
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v6 = (id *)getMPMediaItemPropertyArtistSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyArtistSymbolLoc_ptr;
  if (!getMPMediaItemPropertyArtistSymbolLoc_ptr)
  {
    v7 = MediaPlayerLibrary();
    v6 = (id *)dlsym(v7, "MPMediaItemPropertyArtist");
    v228[3] = (uint64_t)v6;
    getMPMediaItemPropertyArtistSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v227, 8);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyArtist(void)");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, CFSTR("WFMPMediaContentItem.m"), 38, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v99 = *v6;
  objc_msgSend(v211, "userInfo:");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v231[2] = v210;
  WFLocalizedContentPropertyNameMarker(CFSTR("Album Artist"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v209, objc_opt_class());
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v8 = (id *)getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr;
  if (!getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr)
  {
    v9 = MediaPlayerLibrary();
    v8 = (id *)dlsym(v9, "MPMediaItemPropertyAlbumArtist");
    v228[3] = (uint64_t)v8;
    getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v227, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyAlbumArtist(void)");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("WFMPMediaContentItem.m"), 39, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v98 = *v8;
  objc_msgSend(v208, "userInfo:");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v231[3] = v207;
  WFLocalizedContentPropertyNameMarker(CFSTR("Genre"));
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v206, objc_opt_class());
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v10 = (id *)getMPMediaItemPropertyGenreSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyGenreSymbolLoc_ptr;
  if (!getMPMediaItemPropertyGenreSymbolLoc_ptr)
  {
    v11 = MediaPlayerLibrary();
    v10 = (id *)dlsym(v11, "MPMediaItemPropertyGenre");
    v228[3] = (uint64_t)v10;
    getMPMediaItemPropertyGenreSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v227, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyGenre(void)");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("WFMPMediaContentItem.m"), 40, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v97 = *v10;
  objc_msgSend(v203, "userInfo:");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v231[4] = v202;
  WFLocalizedContentPropertyNameMarker(CFSTR("Composer"));
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v201, objc_opt_class());
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v12 = (id *)getMPMediaItemPropertyComposerSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyComposerSymbolLoc_ptr;
  if (!getMPMediaItemPropertyComposerSymbolLoc_ptr)
  {
    v13 = MediaPlayerLibrary();
    v12 = (id *)dlsym(v13, "MPMediaItemPropertyComposer");
    v228[3] = (uint64_t)v12;
    getMPMediaItemPropertyComposerSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v227, 8);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyComposer(void)");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("WFMPMediaContentItem.m"), 41, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v96 = *v12;
  objc_msgSend(v200, "userInfo:");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v231[5] = v199;
  WFLocalizedContentPropertyNameMarker(CFSTR("Date Added"));
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v198, objc_opt_class());
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v14 = (id *)getMPMediaItemPropertyDateAddedSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyDateAddedSymbolLoc_ptr;
  if (!getMPMediaItemPropertyDateAddedSymbolLoc_ptr)
  {
    v15 = MediaPlayerLibrary();
    v14 = (id *)dlsym(v15, "MPMediaItemPropertyDateAdded");
    v228[3] = (uint64_t)v14;
    getMPMediaItemPropertyDateAddedSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v227, 8);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyDateAdded(void)");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("WFMPMediaContentItem.m"), 42, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v95 = *v14;
  objc_msgSend(v197, "userInfo:");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "tense:", 1);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v231[6] = v195;
  WFLocalizedContentPropertyNameMarker(CFSTR("Media Kind"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", v205, v194, objc_opt_class());
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "allValues");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "possibleValues:", v192);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v16 = (id *)getMPMediaItemPropertyMediaTypeSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyMediaTypeSymbolLoc_ptr;
  if (!getMPMediaItemPropertyMediaTypeSymbolLoc_ptr)
  {
    v17 = MediaPlayerLibrary();
    v16 = (id *)dlsym(v17, "MPMediaItemPropertyMediaType");
    v228[3] = (uint64_t)v16;
    getMPMediaItemPropertyMediaTypeSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v227, 8);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyMediaType(void)");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("WFMPMediaContentItem.m"), 43, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v94 = *v16;
  objc_msgSend(v191, "userInfo:");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v231[7] = v190;
  v222[0] = v3;
  v222[1] = 3221225472;
  v222[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_5;
  v222[3] = &unk_24C4DED80;
  v223 = &__block_literal_global_9643;
  WFLocalizedContentPropertyNameMarker(CFSTR("Duration"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", v222, v189, objc_opt_class());
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v18 = (id *)getMPMediaItemPropertyPlaybackDurationSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyPlaybackDurationSymbolLoc_ptr;
  if (!getMPMediaItemPropertyPlaybackDurationSymbolLoc_ptr)
  {
    v19 = MediaPlayerLibrary();
    v18 = (id *)dlsym(v19, "MPMediaItemPropertyPlaybackDuration");
    v228[3] = (uint64_t)v18;
    getMPMediaItemPropertyPlaybackDurationSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v227, 8);
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyPlaybackDuration(void)");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("WFMPMediaContentItem.m"), 44, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v93 = *v18;
  objc_msgSend(v188, "userInfo:");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "timeUnits:", 224);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v231[8] = v186;
  WFLocalizedContentPropertyNameMarker(CFSTR("Play Count"));
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v185, objc_opt_class());
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v20 = (id *)getMPMediaItemPropertyPlayCountSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyPlayCountSymbolLoc_ptr;
  if (!getMPMediaItemPropertyPlayCountSymbolLoc_ptr)
  {
    v21 = MediaPlayerLibrary();
    v20 = (id *)dlsym(v21, "MPMediaItemPropertyPlayCount");
    v228[3] = (uint64_t)v20;
    getMPMediaItemPropertyPlayCountSymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v227, 8);
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyPlayCount(void)");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, CFSTR("WFMPMediaContentItem.m"), 45, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v92 = *v20;
  objc_msgSend(v184, "userInfo:");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v231[9] = v183;
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, CFSTR("Album Track #"), objc_opt_class());
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  getMPMediaItemPropertyAlbumTrackNumber();
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "userInfo:", v181);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Track Number"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "displayName:", v180);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v231[10] = v178;
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, CFSTR("Disc #"), objc_opt_class());
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  getMPMediaItemPropertyDiscNumber();
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "userInfo:", v176);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Disc Number"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "displayName:", v174);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v231[11] = v173;
  v220[0] = v3;
  v220[1] = 3221225472;
  v220[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_7;
  v220[3] = &unk_24C4DED80;
  v221 = &__block_literal_global_9643;
  WFLocalizedContentPropertyNameMarker(CFSTR("Album Artwork"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", v220, v172, objc_opt_class());
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  getMPMediaItemPropertyArtwork();
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "userInfo:", v170);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v231[12] = v169;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Explicit"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_10_9644, v167, objc_opt_class());
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v22 = (id *)getMPMediaItemPropertyIsExplicitSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyIsExplicitSymbolLoc_ptr;
  if (!getMPMediaItemPropertyIsExplicitSymbolLoc_ptr)
  {
    v23 = MediaPlayerLibrary();
    v22 = (id *)dlsym(v23, "MPMediaItemPropertyIsExplicit");
    v228[3] = (uint64_t)v22;
    getMPMediaItemPropertyIsExplicitSymbolLoc_ptr = (uint64_t)v22;
  }
  _Block_object_dispose(&v227, 8);
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyIsExplicit(void)");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v68, CFSTR("WFMPMediaContentItem.m"), 49, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v91 = *v22;
  objc_msgSend(v166, "userInfo:");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Explicit"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "negativeName:", v164);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringWithKey(CFSTR("Track (item name)"), CFSTR("Track"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "singularItemName:", v162);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v231[13] = v161;
  WFLocalizedContentPropertyNameMarker(CFSTR("Lyrics"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v160, objc_opt_class());
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v24 = (id *)getMPMediaItemPropertyLyricsSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyLyricsSymbolLoc_ptr;
  if (!getMPMediaItemPropertyLyricsSymbolLoc_ptr)
  {
    v25 = MediaPlayerLibrary();
    v24 = (id *)dlsym(v25, "MPMediaItemPropertyLyrics");
    v228[3] = (uint64_t)v24;
    getMPMediaItemPropertyLyricsSymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(&v227, 8);
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyLyrics(void)");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, CFSTR("WFMPMediaContentItem.m"), 50, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v90 = *v24;
  objc_msgSend(v159, "userInfo:");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "sortable:", 0);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v231[14] = v157;
  WFLocalizedContentPropertyNameMarker(CFSTR("Release Date"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v156, objc_opt_class());
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v26 = (id *)getMPMediaItemPropertyReleaseDateSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyReleaseDateSymbolLoc_ptr;
  if (!getMPMediaItemPropertyReleaseDateSymbolLoc_ptr)
  {
    v27 = MediaPlayerLibrary();
    v26 = (id *)dlsym(v27, "MPMediaItemPropertyReleaseDate");
    v228[3] = (uint64_t)v26;
    getMPMediaItemPropertyReleaseDateSymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(&v227, 8);
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyReleaseDate(void)");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", v72, CFSTR("WFMPMediaContentItem.m"), 51, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v89 = *v26;
  objc_msgSend(v155, "userInfo:");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "tense:", 1);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "timeUnits:", 8220);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "comparableUnits:", 8220);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v231[15] = v151;
  WFLocalizedContentPropertyNameMarker(CFSTR("Comments"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v150, objc_opt_class());
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v28 = (id *)getMPMediaItemPropertyCommentsSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyCommentsSymbolLoc_ptr;
  if (!getMPMediaItemPropertyCommentsSymbolLoc_ptr)
  {
    v29 = MediaPlayerLibrary();
    v28 = (id *)dlsym(v29, "MPMediaItemPropertyComments");
    v228[3] = (uint64_t)v28;
    getMPMediaItemPropertyCommentsSymbolLoc_ptr = (uint64_t)v28;
  }
  _Block_object_dispose(&v227, 8);
  if (!v28)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyComments(void)");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v74, CFSTR("WFMPMediaContentItem.m"), 52, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v88 = *v28;
  objc_msgSend(v149, "userInfo:");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "sortable:", 0);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v231[16] = v147;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Cloud Item"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v145, objc_opt_class());
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v30 = (id *)getMPMediaItemPropertyIsCloudItemSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyIsCloudItemSymbolLoc_ptr;
  if (!getMPMediaItemPropertyIsCloudItemSymbolLoc_ptr)
  {
    v31 = MediaPlayerLibrary();
    v30 = (id *)dlsym(v31, "MPMediaItemPropertyIsCloudItem");
    v228[3] = (uint64_t)v30;
    getMPMediaItemPropertyIsCloudItemSymbolLoc_ptr = (uint64_t)v30;
  }
  _Block_object_dispose(&v227, 8);
  if (!v30)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyIsCloudItem(void)");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, CFSTR("WFMPMediaContentItem.m"), 53, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v87 = *v30;
  objc_msgSend(v144, "userInfo:");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Cloud Item"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "negativeName:", v142);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringWithKey(CFSTR("Track (item name)"), CFSTR("Track"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "singularItemName:", v140);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v231[17] = v139;
  WFLocalizedContentPropertyNameMarker(CFSTR("Has Album Artwork"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_73, v137, objc_opt_class());
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Has No Album Artwork"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "negativeName:", v135);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Track"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "singularItemName:", v133);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "gettable:", 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v231[18] = v131;
  WFLocalizedContentPropertyNameMarker(CFSTR("Skip Count"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v130, objc_opt_class());
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v32 = (id *)getMPMediaItemPropertySkipCountSymbolLoc_ptr;
  v230 = getMPMediaItemPropertySkipCountSymbolLoc_ptr;
  if (!getMPMediaItemPropertySkipCountSymbolLoc_ptr)
  {
    v33 = MediaPlayerLibrary();
    v32 = (id *)dlsym(v33, "MPMediaItemPropertySkipCount");
    v228[3] = (uint64_t)v32;
    getMPMediaItemPropertySkipCountSymbolLoc_ptr = (uint64_t)v32;
  }
  _Block_object_dispose(&v227, 8);
  if (!v32)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertySkipCount(void)");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInFunction:file:lineNumber:description:", v78, CFSTR("WFMPMediaContentItem.m"), 54, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v86 = *v32;
  objc_msgSend(v129, "userInfo:");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v231[19] = v128;
  WFLocalizedContentPropertyNameMarker(CFSTR("Last Played Date"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v127, objc_opt_class());
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v34 = (id *)getMPMediaItemPropertyLastPlayedDateSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyLastPlayedDateSymbolLoc_ptr;
  if (!getMPMediaItemPropertyLastPlayedDateSymbolLoc_ptr)
  {
    v35 = MediaPlayerLibrary();
    v34 = (id *)dlsym(v35, "MPMediaItemPropertyLastPlayedDate");
    v228[3] = (uint64_t)v34;
    getMPMediaItemPropertyLastPlayedDateSymbolLoc_ptr = (uint64_t)v34;
  }
  _Block_object_dispose(&v227, 8);
  if (!v34)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyLastPlayedDate(void)");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInFunction:file:lineNumber:description:", v80, CFSTR("WFMPMediaContentItem.m"), 55, CFSTR("%s"), dlerror());

    goto LABEL_70;
  }
  v85 = *v34;
  objc_msgSend(v126, "userInfo:");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "tense:", 1);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "timeUnits:", 8444);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v231[20] = v123;
  WFLocalizedContentPropertyNameMarker(CFSTR("Rating"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9643, v122, objc_opt_class());
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v36 = (id *)getMPMediaItemPropertyRatingSymbolLoc_ptr;
  v230 = getMPMediaItemPropertyRatingSymbolLoc_ptr;
  if (!getMPMediaItemPropertyRatingSymbolLoc_ptr)
  {
    v37 = MediaPlayerLibrary();
    v36 = (id *)dlsym(v37, "MPMediaItemPropertyRating");
    v228[3] = (uint64_t)v36;
    getMPMediaItemPropertyRatingSymbolLoc_ptr = (uint64_t)v36;
  }
  _Block_object_dispose(&v227, 8);
  if (!v36)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaItemPropertyRating(void)");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "handleFailureInFunction:file:lineNumber:description:", v82, CFSTR("WFMPMediaContentItem.m"), 56, CFSTR("%s"), dlerror());

LABEL_70:
    __break(1u);
  }
  v84 = *v36;
  objc_msgSend(v121, "userInfo:");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v231[21] = v120;
  WFLocalizedContentPropertyNameMarker(CFSTR("File Size"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_85, v119, objc_opt_class());
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "userInfo:", CFSTR("WFFileSizeProperty"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "sortable:", 0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "filterable:", 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "gettable:", 0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v231[22] = v114;
  WFLocalizedContentPropertyNameMarker(CFSTR("File Extension"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_90, v113, objc_opt_class());
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "userInfo:", CFSTR("WFFileExtensionProperty"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "caseInsensitive:", 1);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "sortable:", 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "filterable:", 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "gettable:", 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v231[23] = v107;
  WFLocalizedContentPropertyNameMarker(CFSTR("Last Modified Date"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_93_9690, v106, objc_opt_class());
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "userInfo:", CFSTR("WFFileModificationDate"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "tense:", 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "timeUnits:", 8444);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "sortable:", 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "filterable:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "gettable:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v231[24] = v39;
  WFLocalizedContentPropertyNameMarker(CFSTR("Creation Date"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_96_9692, v40, objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "userInfo:", CFSTR("WFFileCreationDate"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "tense:", 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "timeUnits:", 8444);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sortable:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "filterable:", 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "gettable:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v231[25] = v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v231, 26);
  v83 = (id)objc_claimAutoreleasedReturnValue();

  return v83;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForName:", CFSTR("Title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(a1, "allProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  getMPMediaItemPropertyDiscNumber();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectMatchingKey:value:", CFSTR("userInfo"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  getMPMediaItemPropertyAlbumTrackNumber();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectMatchingKey:value:", CFSTR("userInfo"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  getMPMediaItemPropertyAlbumTitle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  WFInsertSortDescriptorAroundDescriptorMatchingUserInfo(v10, v18, 0, 1u, v19);

  getMPMediaItemPropertyAlbumTrackNumber();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  WFInsertSortDescriptorAroundDescriptorMatchingUserInfo(v10, v16, 1, 0, v20);

  getWFContentGraphLogObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "+[WFMPMediaContentItem runQuery:withItems:permissionRequestor:completionHandler:]";
    v31 = 2112;
    v32 = v10;
    v33 = 2048;
    v34 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_20BBAD000, v21, OS_LOG_TYPE_INFO, "%s Running query %@ with %lu input items", buf, 0x20u);
  }

  if (objc_msgSend(v11, "count"))
  {
    v28.receiver = a1;
    v28.super_class = (Class)&OBJC_METACLASS___WFMPMediaContentItem;
    objc_msgSendSuper2(&v28, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);
  }
  else
  {
    objc_msgSend(v10, "predicate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __81__WFMPMediaContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke;
    v23[3] = &unk_24C4DEED0;
    v24 = v10;
    v25 = v12;
    v26 = v13;
    v27 = a1;
    +[WFContentLibraryANDFiltering getItemsMatchingPredicate:resultHandler:](WFMPMediaLibraryFiltering, "getItemsMatchingPredicate:resultHandler:", v22, v23);

  }
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("MPMediaItem"), CFSTR("MediaPlayer"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("AVAsset"), CFSTR("AVFoundation"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  return WFDeferrableLocalizedStringWithKey(CFSTR("iTunes media (singular)"), CFSTR("iTunes media"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("iTunes media (plural)"), CFSTR("iTunes media"));
}

+ (id)localizedFilterDescription
{
  return WFLocalizedStringWithKey(CFSTR("Music (singular)"), CFSTR("Music"));
}

+ (id)localizedPluralFilterDescription
{
  return WFLocalizedStringWithKey(CFSTR("Music (plural)"), CFSTR("Music"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Music Items"));
}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (BOOL)isAvailableOnPlatform:(int64_t)a3
{
  return a3 == 0;
}

void __81__WFMPMediaContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFContentQuery *v4;
  WFContentQuery *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a2;
  v4 = (WFContentQuery *)*(id *)(a1 + 32);
  if (v3)
  {
    v5 = -[WFContentQuery initWithPredicate:]([WFContentQuery alloc], "initWithPredicate:", 0);

    objc_msgSend(*(id *)(a1 + 32), "sortDescriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentQuery setSortDescriptors:](v5, "setSortDescriptors:", v6);

    v7 = objc_msgSend(*(id *)(a1 + 32), "slice");
    -[WFContentQuery setSlice:](v5, "setSlice:", v7, v8);
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentQuery setUserInfo:](v5, "setUserInfo:", v9);

    v4 = v5;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v10 = (void *)getMPMediaQueryClass_softClass;
    v21 = getMPMediaQueryClass_softClass;
    if (!getMPMediaQueryClass_softClass)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __getMPMediaQueryClass_block_invoke;
      v17[3] = &unk_24C4E3118;
      v17[4] = &v18;
      __getMPMediaQueryClass_block_invoke((uint64_t)v17);
      v10 = (void *)v19[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v18, 8);
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "items");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "if_map:", &__block_literal_global_110);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 40);
  v16.receiver = *(id *)(a1 + 56);
  v16.super_class = (Class)&OBJC_METACLASS___WFMPMediaContentItem;
  objc_msgSendSuper2(&v16, sel_runQuery_withItems_permissionRequestor_completionHandler_, v4, v13, v15, v14);

}

WFMPMediaContentItem *__81__WFMPMediaContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:](WFMPMediaContentItem, "itemWithObject:", a2);
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, _QWORD *);
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_4;
  v11[3] = &unk_24C4E04A8;
  v13 = v7;
  v8 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v8 + 16);
  v10 = v7;
  v9(v8, a2, a3, v11);

}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, _QWORD *);
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_6;
  v11[3] = &unk_24C4DED58;
  v12 = v7;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v8 + 16);
  v10 = v7;
  v9(v8, a2, a3, v11);

}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, _QWORD *);
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_8;
  v11[3] = &unk_24C4DEDA8;
  v12 = v7;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v8 + 16);
  v10 = v7;
  v9(v8, a2, a3, v11);

}

uint64_t __40__WFMPMediaContentItem_propertyBuilders__block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

uint64_t __40__WFMPMediaContentItem_propertyBuilders__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

uint64_t __40__WFMPMediaContentItem_propertyBuilders__block_invoke_12(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "getPreferredFileExtension:", a4);
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_10(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_11;
  v7[3] = &unk_24C4E2420;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPreferredFileSize:", v7);

}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  WFFileSize *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[WFFileSize initWithByteCount:]([WFFileSize alloc], "initWithByteCount:", a2);
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);

}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(a2, "mediaItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  getMPMediaItemPropertyArtwork();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForProperty:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", v9 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v7, v10);

}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x24BEC14E0];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "imageWithSize:", v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithPlatformImage:", v9);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v8);

}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  WFTimeInterval *v12;
  id v13;

  objc_msgSend(a2, "doubleValue");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingTimeInterval:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 224;
  objc_msgSend(v5, "components:fromDate:toDate:options:", 224, v13, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "hour"))
  {
    v9 = 1;
  }
  else
  {
    v10 = objc_msgSend(v8, "minute");
    if (v10)
      v9 = 1;
    else
      v9 = 0x10000;
    if (v10)
      v7 = 224;
    else
      v7 = 192;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = -[WFTimeInterval initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:]([WFTimeInterval alloc], "initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:", v7, 0, v9, v4);
  (*(void (**)(uint64_t, WFTimeInterval *))(v11 + 16))(v11, v12);

}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  if ((v3 & (v3 - 1)) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v9, "reverseObjectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v15, "unsignedIntegerValue") & v3) != 0)
          {
            v16 = *(_QWORD *)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

            return;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          continue;
        break;
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = a1 + 32;
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(v6 + 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);

  }
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(a2, "mediaItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v9, "isExplicitItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v7, v8);

}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v7)(_QWORD, _QWORD);
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  objc_msgSend(a2, "mediaItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForProperty:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *))a4)[2](v7, v9);
}

- (BOOL)getListSubtitle:(id)a3
{
  id v5;
  void *v6;

  if (a3)
  {
    v5 = a3;
    -[WFMPMediaContentItem artist](self, "artist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a3 + 2))(v5, v6);

  }
  return 1;
}

- (BOOL)getListAltText:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  double v6;
  void *v7;

  v4 = (void (**)(id, void *))a3;
  -[WFMPMediaContentItem mediaItem](self, "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackDuration");
  WFChooseFromListFormatPlaybackDuration(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v4[2](v4, v7);

  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    height = a4.height;
    width = a4.width;
    v8 = (objc_class *)MEMORY[0x24BEC14E0];
    v9 = a3;
    v10 = [v8 alloc];
    -[WFMPMediaContentItem mediaItem](self, "mediaItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "artwork");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithSize:", width, height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithPlatformImage:", v13);
    (*((void (**)(id, void *, _QWORD))a3 + 2))(v9, v14, 0);

  }
  return 1;
}

@end
