@implementation PUPhotoPickerExtensionHostContext

- (void)completeRequestReturningItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __85__PUPhotoPickerExtensionHostContext_completeRequestReturningItems_completionHandler___block_invoke;
  v9[3] = &unk_24C62C1B8;
  v8 = v7;
  v10 = v8;
  objc_copyWeak(&v11, &location);
  -[PUPhotoPickerAbstractExtensionContext firstPayloadFromExtensionItems:completion:](self, "firstPayloadFromExtensionItems:completion:", v6, v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[PUPhotoPickerExtensionHostContext cachedDidDisplayPhotoPickerSourceType](self, "cachedDidDisplayPhotoPickerSourceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "didDisplayPhotoPickerSourceType:", v6);

      }
    }
    if (-[PUPhotoPickerExtensionHostContext cachedDidDisplayPhotoPickerPreview](self, "cachedDidDisplayPhotoPickerPreview"))
    {
      -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "didDisplayPhotoPickerPreview");

      }
    }

    v5 = obj;
  }

}

- (id)_remote
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoPickerExtensionHostContext;
  -[PUPhotoPickerAbstractExtensionContext proxy](&v3, sel_proxy);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cancelPhotoPicker
{
  id v2;

  -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelPhotoPicker");

}

- (void)invalidatePhotoPickerHostServices
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobileslideshow.photo-picker"), 0, MEMORY[0x24BDBD1B8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoPickerExtensionHostContext cancelRequestWithError:](self, "cancelRequestWithError:", v3);
  -[PUPhotoPickerExtensionHostContext _remote](self, "_remote");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidatePhotoPickerRemoteServices");

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoPickerExtensionHostContext;
  -[PUPhotoPickerAbstractExtensionContext invalidateContext](&v5, sel_invalidateContext);

}

- (void)didSetOnboardingHeaderDismissed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("com.apple.photos.picker.header"));

}

- (void)dismissCurrentViewControllerFromPhotoPickerAnimated:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissCurrentViewControllerFromPhotoPickerAnimated:", v4);

}

- (void)didDisplayPhotoPickerSourceType:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didDisplayPhotoPickerSourceType:", v7);

  }
  else
  {
    -[PUPhotoPickerExtensionHostContext setCachedDidDisplayPhotoPickerSourceType:](self, "setCachedDidDisplayPhotoPickerSourceType:", v7);
  }

}

- (void)didDisplayPhotoPickerPreview
{
  void *v3;
  char v4;
  id v5;

  -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didDisplayPhotoPickerPreview");

  }
  else
  {
    -[PUPhotoPickerExtensionHostContext setCachedDidDisplayPhotoPickerPreview:](self, "setCachedDidDisplayPhotoPickerPreview:", 1);
  }
}

- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PLPhotoPickerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134349056;
    v28 = objc_msgSend(v4, "count");
    _os_signpost_emit_with_name_impl(&dword_20D1E2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ReceivingSelections", "%{public}ld", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        -[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:](self, "_UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  v16 = v8;
  v17 = v16;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D1E2000, v17, OS_SIGNPOST_INTERVAL_END, v6, "ReceivingSelections", ", buf, 2u);
  }

  -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    v20 = (void *)objc_msgSend(v9, "copy");
    -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "didSelectMultipleMediaItemsWithInfoDictionaries:", v20);

  }
}

- (void)didSelectMediaWithInfoDictionary:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:](self, "_UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PUPhotoPickerExtensionHostContext delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didSelectMediaWithInfoDictionary:", v7);

  }
}

- (void)initiatePhotoPickerSelection
{
  id v2;

  -[PUPhotoPickerExtensionHostContext _remote](self, "_remote");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "initiatePhotoPickerSelection");

}

- (void)performPhotoPickerPreviewOfFirstAsset
{
  id v2;

  -[PUPhotoPickerExtensionHostContext _remote](self, "_remote");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performPhotoPickerPreviewOfFirstAsset");

}

- (void)performTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PUPhotoPickerExtensionHostContext _remote](self, "_remote");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performTraitCollectionUpdateUsingData:completion:", v7, v6);

}

- (id)_UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  PUPhotoPickerExtensionHostContext *v32;
  void *v33;
  void *v34;
  void *v35;
  PUPhotoPickerExtensionHostContext *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  PUPhotoPickerExtensionHostContext *v43;
  void *v44;
  uint64_t v45;
  char v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  char v54;
  uint64_t v55;
  void *v56;
  id v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  id v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  PUPhotoPickerExtensionHostContext *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  id v88;
  NSObject *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  NSObject *v101;
  void *v102;
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
  id v128;
  id v129;
  id v130;
  id v131;
  _QWORD v132[2];
  uint8_t buf[4];
  const char *v134;
  __int16 v135;
  id v136;
  __int16 v137;
  void *v138;
  __int16 v139;
  id v140;
  _QWORD v141[3];

  v141[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = *MEMORY[0x24BEBEAF8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBEAF8]);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);
    if ((unint64_t)(objc_msgSend(MEMORY[0x24BDE35F0], "authorizationStatusForAccessLevel:", 2) - 3) <= 1)
    {
      objc_msgSend(MEMORY[0x24BDE35F0], "imagePickerPhotoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE3570], "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDE3488];
      v141[0] = v115;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v141, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchAssetsWithLocalIdentifiers:options:", v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BEBE328]);

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerSavingOptions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerSavingOptions"));
  v14 = *MEMORY[0x24BEBEAD0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBEAD0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v15;
  if (v15)
    v16 = objc_msgSend(v15, "integerValue");
  else
    v16 = 0;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v14);
  v17 = *MEMORY[0x24BEBE320];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBE320]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v131 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v18, &v131);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v131;
    if (v20)
    {
      PLUIGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        v135 = 2112;
        v136 = v20;
        _os_log_impl(&dword_20D1E2000, v21, OS_LOG_TYPE_ERROR, "%s Unable to create image %@", buf, 0x16u);
      }

    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v17);

  }
  v22 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fileURLWithPath:", v23);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerOriginalImagePath"));
  v25 = objc_claimAutoreleasedReturnValue();
  v114 = v18;
  v112 = (void *)v25;
  if (!v25)
  {
    v121 = 0;
    v31 = 0;
    goto LABEL_57;
  }
  v26 = v25;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerOriginalImagePath"));
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v26);
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerOriginalImagePathSandboxExtensionToken"));
  v122 = (void *)v27;
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72258]), "initWithURL:sandboxExtensionToken:consume:", v27, v117, 1);
  v29 = 0;
  if ((v13 & 2) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v17);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v29 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v28);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v32 = self;
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithData:", v29);
        if (v33)
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, v17);

        self = v32;
      }
    }
  }
  if ((v13 & 4) == 0)
  {
    if (v16)
    {
      v34 = 0;
LABEL_35:
      v36 = self;
      v37 = v29;
      v38 = v28;
      v39 = v16;
LABEL_45:
      -[PUPhotoPickerExtensionHostContext _pathExtensionFromData:url:exportPreset:](v36, "_pathExtensionFromData:url:exportPreset:", v37, v38, v39);
      v42 = objc_claimAutoreleasedReturnValue();
      v41 = 0;
      goto LABEL_46;
    }
LABEL_37:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PUPhotoPickerExtensionHostContext _isHEIFImageFormatFromData:url:](self, "_isHEIFImageFormatFromData:url:", v29, v28));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (!v29)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = v29;
  if (v16)
  {
    v34 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PUPhotoPickerExtensionHostContext _isHEIFImageFormatFromData:url:](self, "_isHEIFImageFormatFromData:url:", v29, v28));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "BOOLValue"))
    {
      -[PUPhotoPickerExtensionHostContext _JPEGDataFromImageData:](self, "_JPEGDataFromImageData:", v29);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_34;
    }
  }
  v35 = v29;
LABEL_34:
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, *MEMORY[0x24BEBEAF0]);

  if (v16)
    goto LABEL_35;
  if (!v34)
    goto LABEL_37;
LABEL_38:
  if (!objc_msgSend(v34, "BOOLValue"))
  {
    v36 = self;
    v37 = v29;
    v38 = v28;
    v39 = 0;
    goto LABEL_45;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBEAF0]);
  v40 = objc_claimAutoreleasedReturnValue();
  if (!v40)
  {
    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v28);
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[PUPhotoPickerExtensionHostContext _JPEGDataFromImageData:](self, "_JPEGDataFromImageData:", v29);
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v40;
  -[PUPhotoPickerExtensionHostContext _pathExtensionFromData:url:exportPreset:](self, "_pathExtensionFromData:url:exportPreset:", v40, 0, 0);
  v42 = objc_claimAutoreleasedReturnValue();
LABEL_46:
  v43 = self;
  objc_msgSend(v120, "URLByAppendingPathComponent:", v119);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v42;
  objc_msgSend(v44, "URLByAppendingPathExtension:", v42);
  v45 = objc_claimAutoreleasedReturnValue();

  v121 = (void *)v45;
  if (v41)
  {
    v130 = 0;
    v46 = objc_msgSend(v41, "writeToURL:options:error:", v45, 1, &v130);
    v47 = v130;
    if ((v46 & 1) == 0)
    {
      PLUIGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
LABEL_55:

        goto LABEL_56;
      }
      objc_msgSend(v47, "localizedDescription");
      v49 = v34;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
      v135 = 2112;
      v136 = v50;
      _os_log_impl(&dword_20D1E2000, v48, OS_LOG_TYPE_ERROR, "%s Unable to copy data with error: %@", buf, 0x16u);

LABEL_54:
      v34 = v49;
      goto LABEL_55;
    }
  }
  else
  {
    v49 = v34;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v45;
    v53 = v51;
    v129 = 0;
    v54 = objc_msgSend(v51, "copyItemAtURL:toURL:error:", v28, v52, &v129);
    v47 = v129;

    if ((v54 & 1) == 0)
    {
      PLUIGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        v135 = 2112;
        v136 = v28;
        v137 = 2112;
        v138 = v121;
        v139 = 2112;
        v140 = v47;
        _os_log_impl(&dword_20D1E2000, v48, OS_LOG_TYPE_ERROR, "%s Unable to copy from %@ to %@ %@", buf, 0x2Au);
      }
      goto LABEL_54;
    }
    v34 = v49;
  }
LABEL_56:

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v121, *MEMORY[0x24BEBE300]);
  v18 = v114;
  self = v43;
LABEL_57:
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerOriginalImagePathSandboxExtensionToken"));
  v55 = *MEMORY[0x24BEBE2F8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBE2F8]);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v128 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v118, &v128);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v128;
    if (v57)
    {
      PLUIGetLog();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        v135 = 2112;
        v136 = v57;
        _os_log_impl(&dword_20D1E2000, v58, OS_LOG_TYPE_ERROR, "%s Unable to create edited image %@", buf, 0x16u);
      }

    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, v55);

  }
  v59 = *MEMORY[0x24BEBEAC8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBEAC8]);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v127 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v60, &v127);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v127;
    if (v62)
    {
      v63 = v31;
      v64 = v60;
      PLUIGetLog();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        v135 = 2112;
        v136 = v62;
        _os_log_impl(&dword_20D1E2000, v65, OS_LOG_TYPE_ERROR, "%s Unable to create fullScreenImage %@", buf, 0x16u);
      }

      v60 = v64;
      v31 = v63;
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v61, v59);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerCropRectData"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    v126 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v66, &v126);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v126;
    if (v68)
    {
      PLUIGetLog();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        v135 = 2112;
        v136 = v68;
        _os_log_impl(&dword_20D1E2000, v69, OS_LOG_TYPE_ERROR, "%s Unable to create crop rect %@", buf, 0x16u);
      }

    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v67, *MEMORY[0x24BEBE2F0]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerCropRectData"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerReferencePath"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v71, *MEMORY[0x24BEBE330]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerReferencePath"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerMediaPath"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v72;
  if (v72)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerMediaPathSandboxExtensionToken"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoPickerExtensionHostContext _createURLFromPath:token:](self, "_createURLFromPath:token:", v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v74, *MEMORY[0x24BEBE318]);

    v72 = v123;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerMediaPath"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerMediaPathSandboxExtensionToken"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerOriginalIrisVideoFilePath"));
  v75 = objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerOriginalIrisVideoFilePathSandboxExtensionToken"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoPickerExtensionHostContext _createURLFromPath:token:](self, "_createURLFromPath:token:", v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v77, *MEMORY[0x24BEBEAD8]);

    v72 = v123;
  }
  v111 = (void *)v75;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerOriginalIrisVideoFilePath"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerOriginalIrisVideoFilePathSandboxExtensionToken"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerGIFPath"));
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v79, *MEMORY[0x24BEBEAB8]);

  }
  v110 = (void *)v78;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerGIFPath"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_UIImagePickerDebugSidecarFileURLsData"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (v116)
  {
    v80 = self;
    v81 = v31;
    v82 = v70;
    v83 = (void *)MEMORY[0x24BDD1620];
    v84 = (void *)MEMORY[0x24BDBCF20];
    v85 = objc_opt_class();
    objc_msgSend(v84, "setWithObjects:", v85, objc_opt_class(), 0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = 0;
    objc_msgSend(v83, "unarchivedObjectOfClasses:fromData:error:", v86, v116, &v125);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v125;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v87, CFSTR("_UIImagePickerDebugSidecarFileURLs"));

    if (v88)
    {
      PLUIGetLog();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        v135 = 2112;
        v136 = v88;
        _os_log_impl(&dword_20D1E2000, v89, OS_LOG_TYPE_ERROR, "%s Unable to create debug sidecar files %@", buf, 0x16u);
      }

    }
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("_UIImagePickerDebugSidecarFileURLsData"));

    v70 = v82;
    v31 = v81;
    self = v80;
    v72 = v123;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerLivePhotoExists"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v107 = v70;
    v108 = v66;
    v109 = v60;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerLivePhotoImagePath"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerLivePhotoImagePathSandboxExtensionToken"));
    v92 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerLivePhotoVideoPath"));
    v93 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUPhotoPickerLivePhotoVideoPathSandboxExtensionToken"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = (void *)v92;
    -[PUPhotoPickerExtensionHostContext _createURLFromPath:token:](self, "_createURLFromPath:token:", v91, v92);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = (void *)v93;
    -[PUPhotoPickerExtensionHostContext _createURLFromPath:token:](self, "_createURLFromPath:token:", v93, v94);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v132[0] = v95;
    v132[1] = v96;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v132, 2);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = 0;
    objc_msgSend(MEMORY[0x24BDE35A8], "livePhotoWithResourceFileURLs:error:", v97, &v124);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v124;
    if (v99)
    {
      v104 = v91;
      v100 = v31;
      PLUIGetLog();
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v134 = "-[PUPhotoPickerExtensionHostContext _UIImagePickerControllerInfoDictionaryFromPhotoPickerInfoDictionary:]";
        v135 = 2112;
        v136 = v99;
        _os_log_impl(&dword_20D1E2000, v101, OS_LOG_TYPE_ERROR, "%s Unable to create live photo - %@", buf, 0x16u);
      }

      v31 = v100;
      v91 = v104;
    }
    if (v98)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v98, *MEMORY[0x24BEBE308]);

    v18 = v114;
    v66 = v108;
    v60 = v109;
    v70 = v107;
    v72 = v123;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerLivePhotoExists"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerLivePhotoImagePath"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerLivePhotoImagePathSandboxExtensionToken"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerLivePhotoVideoPath"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("PUPhotoPickerLivePhotoVideoPathSandboxExtensionToken"));
  v102 = (void *)objc_msgSend(v4, "copy");

  return v102;
}

- (id)_createURLFromPath:(id)a3 token:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerExtensionHostContext.m"), 395, CFSTR("path cannot be nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerExtensionHostContext.m"), 396, CFSTR("token cannot be nil"));

LABEL_3:
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72258]), "initWithURL:sandboxExtensionToken:consume:", v10, v9, 1);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerExtensionHostContext.m"), 399, CFSTR("A sandboxed url could not be created for %@ %@"), v10, v9);

  }
  return v11;
}

- (BOOL)_isHEIFImageFormatFromData:(id)a3 url:(id)a4
{
  const __CFData *v7;
  unint64_t v8;
  void *v9;
  CGImageSource *v10;
  CGImageSource *v11;
  void *v12;
  char v13;

  v7 = (const __CFData *)a3;
  v8 = (unint64_t)a4;
  v9 = (void *)v8;
  if (!((unint64_t)v7 | v8))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerExtensionHostContext.m"), 406, CFSTR("Provide one of data or url"));
    v13 = 0;
    goto LABEL_8;
  }
  if (v7)
  {
    v10 = CGImageSourceCreateWithData(v7, 0);
  }
  else
  {
    if (!v8)
    {
LABEL_9:
      v13 = 0;
      goto LABEL_10;
    }
    v10 = CGImageSourceCreateWithURL((CFURLRef)v8, 0);
  }
  v11 = v10;
  if (!v10)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BE72468], "typeWithIdentifier:", CGImageSourceGetType(v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "conformsToType:", *MEMORY[0x24BDF8720]);
  CFRelease(v11);
LABEL_8:

LABEL_10:
  return v13;
}

- (id)_JPEGDataFromImageData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BEBD640];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

  -[PUPhotoPickerExtensionHostContext _JPEGDataFromImage:](self, "_JPEGDataFromImage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_JPEGDataFromImage:(id)a3
{
  return UIImageJPEGRepresentation((UIImage *)a3, 0.9);
}

- (id)_pathExtensionFromData:(id)a3 url:(id)a4 exportPreset:(int64_t)a5
{
  const __CFData *v9;
  unint64_t v10;
  void *v11;
  CGImageSource *v12;
  CGImageSource *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  void *v19;

  v9 = (const __CFData *)a3;
  v10 = (unint64_t)a4;
  v11 = (void *)v10;
  if ((unint64_t)v9 | v10)
  {
    if (v9)
    {
      v12 = CGImageSourceCreateWithData(v9, 0);
LABEL_6:
      v13 = v12;
      if (v12)
      {
        CGImageSourceGetType(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE72468], "typeWithIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "preferredFilenameExtension");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        CFRelease(v13);
        if (v16)
          goto LABEL_12;
      }
      goto LABEL_8;
    }
    if (v10)
    {
      v12 = CGImageSourceCreateWithURL((CFURLRef)v10, 0);
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoPickerExtensionHostContext.m"), 431, CFSTR("Provide one of data or url"));

  }
LABEL_8:
  objc_msgSend(v11, "pathExtension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v17 = (id *)MEMORY[0x24BDF83F0];
    if (a5 != 1)
      v17 = (id *)MEMORY[0x24BDF8438];
    objc_msgSend(*v17, "preferredFilenameExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v16;
}

- (NSString)photoPickerViewControllerTitle
{
  return self->_photoPickerViewControllerTitle;
}

- (void)setPhotoPickerViewControllerTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)photoPickerViewControllerPrompt
{
  return self->_photoPickerViewControllerPrompt;
}

- (void)setPhotoPickerViewControllerPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)photoPickerNavigationBarHidden
{
  return self->_photoPickerNavigationBarHidden;
}

- (void)setPhotoPickerNavigationBarHidden:(id)a3
{
  objc_storeStrong((id *)&self->_photoPickerNavigationBarHidden, a3);
}

- (PUPhotoPickerHostService)delegate
{
  return (PUPhotoPickerHostService *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSNumber)cachedDidDisplayPhotoPickerSourceType
{
  return self->_cachedDidDisplayPhotoPickerSourceType;
}

- (void)setCachedDidDisplayPhotoPickerSourceType:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDidDisplayPhotoPickerSourceType, a3);
}

- (BOOL)cachedDidDisplayPhotoPickerPreview
{
  return self->_cachedDidDisplayPhotoPickerPreview;
}

- (void)setCachedDidDisplayPhotoPickerPreview:(BOOL)a3
{
  self->_cachedDidDisplayPhotoPickerPreview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDidDisplayPhotoPickerSourceType, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoPickerNavigationBarHidden, 0);
  objc_storeStrong((id *)&self->_photoPickerViewControllerPrompt, 0);
  objc_storeStrong((id *)&self->_photoPickerViewControllerTitle, 0);
}

void __85__PUPhotoPickerExtensionHostContext_completeRequestReturningItems_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  if (!a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didSelectMediaWithInfoDictionary:", v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
