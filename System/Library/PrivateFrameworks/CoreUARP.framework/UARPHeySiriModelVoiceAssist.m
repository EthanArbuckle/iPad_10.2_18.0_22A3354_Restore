@implementation UARPHeySiriModelVoiceAssist

- (UARPHeySiriModelVoiceAssist)init
{
  -[UARPHeySiriModelVoiceAssist doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (BOOL)processDynamicAsset:(id *)a3
{
  UARPSuperBinaryAsset *v5;
  void *v6;
  UARPSuperBinaryAsset *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  objc_super v15;

  v5 = [UARPSuperBinaryAsset alloc];
  -[UARPHeySiriModelBase url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPSuperBinaryAsset initWithURL:](v5, "initWithURL:", v6);
  -[UARPHeySiriModelBase setSuperbinary:](self, "setSuperbinary:", v7);

  -[UARPHeySiriModelBase superbinary](self, "superbinary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v8, "expandHeadersAndTLVs:", a3);

  -[UARPHeySiriModelBase superbinary](self, "superbinary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tlvs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 76079623, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "valueAsVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPHeySiriModelBase setMajorVersion:](self, "setMajorVersion:", objc_msgSend(v12, "majorVersion"));
  -[UARPHeySiriModelBase setMinorVersion:](self, "setMinorVersion:", objc_msgSend(v12, "minorVersion"));
  v15.receiver = self;
  v15.super_class = (Class)UARPHeySiriModelVoiceAssist;
  -[UARPHeySiriModelBase setDelegate:](&v15, sel_setDelegate_, self);
  v14.receiver = self;
  v14.super_class = (Class)UARPHeySiriModelVoiceAssist;
  -[UARPHeySiriModelBase checkCurrentHeySiriModel](&v14, sel_checkCurrentHeySiriModel);

  return (char)a3;
}

- (void)currentHeySiriModel:(id)a3 fallbackModel:(id)a4 error:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  UARPSuperBinaryAsset *v17;
  UARPSuperBinaryAsset *asset;
  UARPSuperBinaryAssetPayload **p_payloadModel;
  UARPSuperBinaryAssetPayload *payloadModel;
  UARPSuperBinaryAssetPayload *payloadFallbackModel;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  id *v33;
  void *v34;
  int v35;
  uint64_t v36;
  NSURL *superBinaryMetaDataURL;
  id v38;
  NSURL *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSURL *modelMetaDataURL;
  id v45;
  NSURL *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSURL *modelDataURL;
  id v51;
  NSURL *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSURL *v64;
  NSURL *v65;
  uint64_t v66;
  NSURL *fallbackModelMetaDataURL;
  id v68;
  NSURL *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSURL *fallbackModelDataURL;
  id v74;
  NSURL *v75;
  uint64_t v76;
  uint64_t v77;
  NSURL *v78;
  NSURL *v79;
  void *v80;
  NSObject *v81;
  NSObject *v82;
  UARPHeySiriModelVoiceAssist *v83;
  void *v84;
  id *p_asset;
  id obj;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id *location;
  id v91;
  id v92;
  objc_super v93;
  NSObject *v94;
  objc_super v95;
  id v96;
  objc_super v97;
  id v98;
  objc_super v99;
  id v100;
  objc_super v101;
  id v102;
  objc_super v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  objc_super v113;
  objc_super v114;
  objc_super v115;
  objc_super v116;
  id v117;
  objc_super v118;
  objc_super v119;
  objc_super v120;
  _BYTE v121[128];
  uint8_t v122[128];
  uint8_t buf[4];
  void *v124;
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v92 = a3;
  v91 = a4;
  v120.receiver = self;
  v120.super_class = (Class)UARPHeySiriModelVoiceAssist;
  -[UARPHeySiriModelBase accessory](&v120, sel_accessory);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD16A8];
    UARPStringSupplementalAssetsFilepath();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "supplementalMobileAssetAppleModelNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@-%@"), v11, v12, CFSTR("VoiceAssist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v117 = 0;
    LOBYTE(v10) = appendFirstUarpFilenameToFilepath(v13, (uint64_t)&v117);
    v14 = v117;
    if ((v10 & 1) == 0)
    {
      v116.receiver = self;
      v116.super_class = (Class)UARPHeySiriModelVoiceAssist;
      -[UARPHeySiriModelBase log](&v116, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.8((uint64_t)v13, v16, v58, v59, v60, v61, v62, v63);
      goto LABEL_45;
    }
    v115.receiver = self;
    v115.super_class = (Class)UARPHeySiriModelVoiceAssist;
    -[UARPHeySiriModelBase log](&v115, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v124 = v13;
      _os_log_impl(&dword_212D08000, v15, OS_LOG_TYPE_DEFAULT, "Filename for voice assist is %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = -[UARPSuperBinaryAsset initWithURL:]([UARPSuperBinaryAsset alloc], "initWithURL:", v16);
    asset = self->_asset;
    self->_asset = v17;

    if (!self->_asset)
    {
      v114.receiver = self;
      v114.super_class = (Class)UARPHeySiriModelVoiceAssist;
      -[UARPHeySiriModelBase log](&v114, "log");
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.1();
      goto LABEL_44;
    }
    if (!-[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0))
    {
      v113.receiver = self;
      v113.super_class = (Class)UARPHeySiriModelVoiceAssist;
      -[UARPHeySiriModelBase log](&v113, "log");
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.7();
      goto LABEL_44;
    }
    v81 = v16;
    v82 = v14;
    v84 = v13;
    p_payloadModel = &self->_payloadModel;
    payloadModel = self->_payloadModel;
    self->_payloadModel = 0;

    v83 = self;
    payloadFallbackModel = self->_payloadFallbackModel;
    location = (id *)&self->_payloadFallbackModel;
    self->_payloadFallbackModel = 0;

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    p_asset = (id *)&self->_asset;
    -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
    if (v88)
    {
      v87 = *(_QWORD *)v110;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v110 != v87)
            objc_enumerationMutation(obj);
          v89 = v22;
          v23 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v22);
          v105 = 0u;
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          objc_msgSend(v23, "tlvs");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v106;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v106 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
                if (objc_msgSend(v29, "type") == 76079617)
                {
                  objc_msgSend(v29, "valueAsString");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "modelLocale");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v30, "isEqualToString:", v31);

                  v33 = (id *)p_payloadModel;
                  if ((v32 & 1) != 0
                    || (objc_msgSend(v91, "modelLocale"),
                        v34 = (void *)objc_claimAutoreleasedReturnValue(),
                        v35 = objc_msgSend(v30, "isEqualToString:", v34),
                        v34,
                        v33 = location,
                        v35))
                  {
                    objc_storeStrong(v33, v23);
                  }

                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
            }
            while (v26);
          }

          v22 = v89 + 1;
        }
        while (v89 + 1 != v88);
        v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
      }
      while (v88);
    }

    UARPUtilsBuildURLForTemporaryFile();
    v36 = objc_claimAutoreleasedReturnValue();
    superBinaryMetaDataURL = v83->_superBinaryMetaDataURL;
    v83->_superBinaryMetaDataURL = (NSURL *)v36;

    v38 = *p_asset;
    v39 = v83->_superBinaryMetaDataURL;
    v40 = objc_msgSend(*p_asset, "rangeMetadata");
    v104 = 0;
    LOBYTE(v38) = objc_msgSend(v38, "exportSuperBinaryContentToFilepath:range:error:", v39, v40, v41, &v104);
    v42 = v104;

    if ((v38 & 1) == 0)
    {
      v103.receiver = v83;
      v103.super_class = (Class)UARPHeySiriModelVoiceAssist;
      -[UARPHeySiriModelBase log](&v103, "log");
      v55 = objc_claimAutoreleasedReturnValue();
      v13 = v84;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.6();
      goto LABEL_42;
    }
    v13 = v84;
    if (*p_payloadModel)
    {
      UARPUtilsBuildURLForTemporaryFile();
      v43 = objc_claimAutoreleasedReturnValue();
      modelMetaDataURL = v83->_modelMetaDataURL;
      v83->_modelMetaDataURL = (NSURL *)v43;

      v45 = *p_asset;
      v46 = v83->_modelMetaDataURL;
      v47 = -[UARPSuperBinaryAssetPayload rangeMetadata](*p_payloadModel, "rangeMetadata");
      v102 = 0;
      LOBYTE(v45) = objc_msgSend(v45, "exportSuperBinaryContentToFilepath:range:error:", v46, v47, v48, &v102);
      v14 = v102;

      if ((v45 & 1) == 0)
      {
        v101.receiver = v83;
        v101.super_class = (Class)UARPHeySiriModelVoiceAssist;
        -[UARPHeySiriModelBase log](&v101, "log");
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.5();
        goto LABEL_43;
      }
      UARPUtilsBuildURLForTemporaryFile();
      v49 = objc_claimAutoreleasedReturnValue();
      modelDataURL = v83->_modelDataURL;
      v83->_modelDataURL = (NSURL *)v49;

      v51 = *p_asset;
      v52 = v83->_modelDataURL;
      v53 = -[UARPSuperBinaryAssetPayload rangePayload](*p_payloadModel, "rangePayload");
      v100 = 0;
      LOBYTE(v51) = objc_msgSend(v51, "exportSuperBinaryContentToFilepath:range:error:", v52, v53, v54, &v100);
      v42 = v100;

      if ((v51 & 1) == 0)
      {
        v99.receiver = v83;
        v99.super_class = (Class)UARPHeySiriModelVoiceAssist;
        -[UARPHeySiriModelBase log](&v99, "log");
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.4();
LABEL_42:
        v14 = v42;
LABEL_43:
        v16 = v81;
LABEL_44:

LABEL_45:
        goto LABEL_46;
      }
    }
    else
    {
      v64 = v83->_modelMetaDataURL;
      v83->_modelMetaDataURL = 0;

      v65 = v83->_modelDataURL;
      v83->_modelDataURL = 0;

    }
    if (*location)
    {
      UARPUtilsBuildURLForTemporaryFile();
      v66 = objc_claimAutoreleasedReturnValue();
      fallbackModelMetaDataURL = v83->_fallbackModelMetaDataURL;
      v83->_fallbackModelMetaDataURL = (NSURL *)v66;

      v68 = *p_asset;
      v69 = v83->_fallbackModelMetaDataURL;
      v70 = objc_msgSend(*location, "rangeMetadata");
      v98 = 0;
      LOBYTE(v68) = objc_msgSend(v68, "exportSuperBinaryContentToFilepath:range:error:", v69, v70, v71, &v98);
      v14 = v98;

      if ((v68 & 1) == 0)
      {
        v97.receiver = v83;
        v97.super_class = (Class)UARPHeySiriModelVoiceAssist;
        -[UARPHeySiriModelBase log](&v97, "log");
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.3();
        goto LABEL_43;
      }
      UARPUtilsBuildURLForTemporaryFile();
      v72 = objc_claimAutoreleasedReturnValue();
      fallbackModelDataURL = v83->_fallbackModelDataURL;
      v83->_fallbackModelDataURL = (NSURL *)v72;

      v74 = *p_asset;
      v75 = v83->_fallbackModelDataURL;
      v76 = objc_msgSend(*location, "rangePayload");
      v96 = 0;
      LOBYTE(v74) = objc_msgSend(v74, "exportSuperBinaryContentToFilepath:range:error:", v75, v76, v77, &v96);
      v42 = v96;

      if ((v74 & 1) == 0)
      {
        v95.receiver = v83;
        v95.super_class = (Class)UARPHeySiriModelVoiceAssist;
        -[UARPHeySiriModelBase log](&v95, "log");
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:].cold.2();
        goto LABEL_42;
      }
    }
    else
    {
      v78 = v83->_fallbackModelMetaDataURL;
      v83->_fallbackModelMetaDataURL = 0;

      v79 = v83->_fallbackModelDataURL;
      v83->_fallbackModelDataURL = 0;

    }
    v94 = v42;
    -[UARPHeySiriModelVoiceAssist generateAsset:](v83, "generateAsset:", &v94);
    v55 = objc_claimAutoreleasedReturnValue();
    v14 = v94;

    +[UARPHeySiriModelVoiceAssist tag](UARPHeySiriModelVoiceAssist, "tag");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v93.receiver = v83;
    v93.super_class = (Class)UARPHeySiriModelVoiceAssist;
    -[UARPHeySiriModelBase offerDynamicAssetToAccessory:tag:error:](&v93, sel_offerDynamicAssetToAccessory_tag_error_, v55, v80, 0);

    goto LABEL_43;
  }
  v119.receiver = self;
  v119.super_class = (Class)UARPHeySiriModelVoiceAssist;
  -[UARPHeySiriModelBase log](&v119, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v118.receiver = self;
    v118.super_class = (Class)UARPHeySiriModelVoiceAssist;
    -[UARPHeySiriModelBase accessory](&v118, sel_accessory);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "modelNumber");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v124 = v57;
    _os_log_error_impl(&dword_212D08000, v14, OS_LOG_TYPE_ERROR, "Could not find supported accessory for  %@", buf, 0xCu);

  }
LABEL_46:

}

- (id)generateAsset:(id *)a3
{
  UARPSuperBinaryAssetPayload *payloadModel;
  BOOL v6;
  _BOOL4 v7;
  int v8;
  int v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v41;
  void *v42;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  unsigned int v50[2];
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;

  v53 = 0;
  v52 = 0;
  v54 = 0;
  v49 = 0;
  v47 = 0u;
  v48 = 0u;
  v46 = 0;
  v44 = 0u;
  v45 = 0u;
  v43.receiver = self;
  v43.super_class = (Class)UARPHeySiriModelVoiceAssist;
  v50[0] = -[UARPHeySiriModelBase uarpProtocolVersion](&v43, sel_uarpProtocolVersion);
  v50[1] = 44;
  payloadModel = self->_payloadModel;
  v6 = payloadModel == 0;
  v7 = payloadModel != 0;
  if (v6)
    v8 = 1;
  else
    v8 = 2;
  if (self->_fallbackModelMetaDataURL)
    v7 = v8;
  v55 = 44;
  v56 = 40 * v7;
  v9 = 40 * v7 + 44;
  v51 = v9;
  LODWORD(v54) = v9;
  v10 = (uint64_t *)MEMORY[0x24BDD0D08];
  if (self->_superBinaryMetaDataURL)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL absoluteString](self->_superBinaryMetaDataURL, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributesOfItemAtPath:error:", v12, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKeyedSubscript:", *v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongValue");
    v9 += v15;
    HIDWORD(v54) = v15;
    v51 = v9;

  }
  +[UARPHeySiriModelVoiceAssist tag](UARPHeySiriModelVoiceAssist, "tag", 120);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_payloadModel)
  {
    LODWORD(v47) = 40;
    DWORD1(v47) = objc_msgSend(v42, "tag");
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL absoluteString](self->_modelMetaDataURL, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributesOfItemAtPath:error:", v17, a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *v10;
    objc_msgSend(v18, "objectForKeyedSubscript:", *v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    DWORD2(v48) = v9;
    HIDWORD(v48) = objc_msgSend(v20, "unsignedLongValue");
    v21 = v9 + HIDWORD(v48);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL absoluteString](self->_modelDataURL, "absoluteString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "attributesOfItemAtPath:error:", v23, a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "objectForKeyedSubscript:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v49) = v21;
    HIDWORD(v49) = objc_msgSend(v25, "unsignedLongValue");
    v9 = v21 + HIDWORD(v49);
    v51 = v21 + HIDWORD(v49);

  }
  if (self->_payloadFallbackModel)
  {
    LODWORD(v44) = 40;
    DWORD1(v44) = objc_msgSend(v42, "tag");
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL absoluteString](self->_fallbackModelMetaDataURL, "absoluteString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "attributesOfItemAtPath:error:", v27, a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = *MEMORY[0x24BDD0D08];
    objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D08]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    DWORD2(v45) = v9;
    HIDWORD(v45) = objc_msgSend(v30, "unsignedLongValue");
    v31 = v9 + HIDWORD(v45);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL absoluteString](self->_fallbackModelDataURL, "absoluteString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "attributesOfItemAtPath:error:", v33, a3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "objectForKeyedSubscript:", v29);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v46) = v31;
    HIDWORD(v46) = objc_msgSend(v35, "unsignedLongValue");
    v51 = v31 + HIDWORD(v46);

  }
  uarpSuperBinaryHeaderEndianSwap(v50, v50);
  uarpPayloadHeaderEndianSwap((unsigned int *)&v47, &v47);
  uarpPayloadHeaderEndianSwap((unsigned int *)&v44, &v44);
  UARPUtilsBuildURLForTemporaryFile();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:", v36, a3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    objc_msgSend(v38, "appendBytes:length:", v50, 44);
    if (self->_payloadModel)
      objc_msgSend(v38, "appendBytes:length:", &v47, 40);
    if (self->_payloadFallbackModel)
      objc_msgSend(v38, "appendBytes:length:", &v44, 40);
    if (objc_msgSend(v37, "uarpWriteData:error:", v38, a3)
      && objc_msgSend(v37, "uarpCloseAndReturnError:", a3)
      && uarpUtilsConcatenateURLs((uint64_t)v36, *(void **)((char *)&self->super.super.isa + v41), (uint64_t)a3)&& uarpUtilsConcatenateURLs((uint64_t)v36, self->_modelMetaDataURL, (uint64_t)a3)&& uarpUtilsConcatenateURLs((uint64_t)v36, self->_modelDataURL, (uint64_t)a3)&& uarpUtilsConcatenateURLs((uint64_t)v36, self->_fallbackModelMetaDataURL, (uint64_t)a3)&& uarpUtilsConcatenateURLs((uint64_t)v36, self->_fallbackModelDataURL, (uint64_t)a3))
    {
      v39 = v36;
    }
    else
    {
      v39 = 0;
    }

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

+ (id)tag
{
  char *v2;

  v2 = (char *)uarpAssetTagStructVoiceAssist();
  return -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v2, v2[1], v2[2], v2[3]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFallbackModel, 0);
  objc_storeStrong((id *)&self->_payloadModel, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_fallbackModelDataURL, 0);
  objc_storeStrong((id *)&self->_fallbackModelMetaDataURL, 0);
  objc_storeStrong((id *)&self->_modelDataURL, 0);
  objc_storeStrong((id *)&self->_modelMetaDataURL, 0);
  objc_storeStrong((id *)&self->_superBinaryMetaDataURL, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Could not init uarp superbinary %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Failed to export Fallback Model URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Failed to export Fallback Model MetaData URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Failed to export Model URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Failed to export Model MetaData URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Failed to export SuperBinary MetaData URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)currentHeySiriModel:fallbackModel:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Could not expand uarp superbinary  %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)currentHeySiriModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 error:(uint64_t)a5 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "NO voice assist ?! located at %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
