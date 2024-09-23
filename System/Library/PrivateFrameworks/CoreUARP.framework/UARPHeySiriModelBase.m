@implementation UARPHeySiriModelBase

- (UARPHeySiriModelBase)init
{
  -[UARPHeySiriModelBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPHeySiriModelBase)initWithAccessory:(id)a3 controller:(id)a4 url:(id)a5
{
  return -[UARPHeySiriModelBase initWithAccessory:uarpProtocolVersion:controller:url:](self, "initWithAccessory:uarpProtocolVersion:controller:url:", a3, 3, a4, a5);
}

- (UARPHeySiriModelBase)initWithAccessory:(id)a3 uarpProtocolVersion:(unint64_t)a4 controller:(id)a5 url:(id)a6
{
  id v11;
  id v12;
  id v13;
  UARPHeySiriModelBase *v14;
  UARPHeySiriModelBase *v15;
  os_log_t v16;
  OS_os_log *log;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  NSMutableArray *v20;
  NSMutableArray *downloadedModels;
  NSMutableArray *v22;
  NSMutableArray *preinstalledModels;
  objc_super v25;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)UARPHeySiriModelBase;
  v14 = -[UARPHeySiriModelBase init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accessory, a3);
    v15->_uarpProtocolVersion = a4;
    objc_storeStrong((id *)&v15->_controller, a5);
    objc_storeStrong((id *)&v15->_url, a6);
    v16 = os_log_create("com.apple.accessoryupdater.uarp", "heySiri");
    log = v15->_log;
    v15->_log = (OS_os_log *)v16;

    v18 = dispatch_queue_create("com.apple.UARP.UARPHeySiriModelBase", 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    downloadedModels = v15->_downloadedModels;
    v15->_downloadedModels = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    preinstalledModels = v15->_preinstalledModels;
    v15->_preinstalledModels = v22;

  }
  return v15;
}

- (id)log
{
  return self->_log;
}

- (id)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  NSURL *v4;
  NSURL *url;
  UARPHeySiriModelBase *obj;

  v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  url = obj->_url;
  obj->_url = v4;

  objc_sync_exit(obj);
}

- (id)superbinary
{
  return self->_superbinary;
}

- (void)setSuperbinary:(id)a3
{
  UARPSuperBinaryAsset *v4;
  UARPSuperBinaryAsset *superbinary;
  UARPHeySiriModelBase *obj;

  v4 = (UARPSuperBinaryAsset *)a3;
  obj = self;
  objc_sync_enter(obj);
  superbinary = obj->_superbinary;
  obj->_superbinary = v4;

  objc_sync_exit(obj);
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(unint64_t)a3
{
  UARPHeySiriModelBase *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_majorVersion = a3;
  objc_sync_exit(obj);

}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(unint64_t)a3
{
  UARPHeySiriModelBase *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_minorVersion = a3;
  objc_sync_exit(obj);

}

- (unint64_t)uarpProtocolVersion
{
  return self->_uarpProtocolVersion;
}

- (unint64_t)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(unint64_t)a3
{
  UARPHeySiriModelBase *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_engineType = a3;
  objc_sync_exit(obj);

}

- (BOOL)processDynamicAsset:(id *)a3
{
  UARPSuperBinaryAsset *v5;
  void *v6;
  UARPSuperBinaryAsset *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *log;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  objc_class *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v41;
  UARPHeySiriModelBase *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t v51[128];
  _BYTE buf[24];
  void *v53;
  uint64_t *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = [UARPSuperBinaryAsset alloc];
  v42 = self;
  -[UARPHeySiriModelBase url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPSuperBinaryAsset initWithURL:](v5, "initWithURL:", v6);
  -[UARPHeySiriModelBase setSuperbinary:](self, "setSuperbinary:", v7);

  -[UARPHeySiriModelBase superbinary](self, "superbinary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "expandHeadersAndTLVs:", a3);

  if (v9)
  {
    v35 = v9;
    -[UARPHeySiriModelBase superbinary](v42, "superbinary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tlvs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1619725831, v11);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "valueAsVersion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPHeySiriModelBase setMajorVersion:](v42, "setMajorVersion:", objc_msgSend(v37, "majorVersion"));
    -[UARPHeySiriModelBase setMinorVersion:](v42, "setMinorVersion:", objc_msgSend(v37, "minorVersion"));
    -[UARPHeySiriModelBase superbinary](v42, "superbinary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tlvs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1619725832, v13);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "valueAsNumber");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPHeySiriModelBase setEngineType:](v42, "setEngineType:", objc_msgSend(v39, "unsignedShortValue"));
    log = v42->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v39;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "HSML: process rx asset; Engine Type %@", buf, 0xCu);
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[UARPHeySiriModelBase superbinary](v42, "superbinary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "payloads");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v16)
    {
      v41 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v44 != v41)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v18, "tlvs");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1619725826, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "valueAsString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "tlvs");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1619725825, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "valueAsString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "tlvs");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1619725824, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "valueAsNumber");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "shortValue");
          v47 = 0;
          v48 = &v47;
          v49 = 0x2050000000;
          v29 = (void *)getCSVoiceTriggerRTModelClass_softClass_0;
          v50 = getCSVoiceTriggerRTModelClass_softClass_0;
          if (!getCSVoiceTriggerRTModelClass_softClass_0)
          {
            *(_QWORD *)buf = MEMORY[0x24BDAC760];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getCSVoiceTriggerRTModelClass_block_invoke_0;
            v53 = &unk_24CEA38A0;
            v54 = &v47;
            __getCSVoiceTriggerRTModelClass_block_invoke_0((uint64_t)buf);
            v29 = (void *)v48[3];
          }
          v30 = objc_retainAutorelease(v29);
          _Block_object_dispose(&v47, 8);
          v31 = (void *)objc_msgSend([v30 alloc], "initWithHash:locale:", v21, v24);
          if (v28 == 1)
          {
            v33 = v42->_log;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v24;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v21;
              _os_log_impl(&dword_212D08000, v33, OS_LOG_TYPE_INFO, "HSML: rx pre-installed model locale <%@>, hash <%@>", buf, 0x16u);
            }
            -[UARPHeySiriModelBase addPreInstalledModel:](v42, "addPreInstalledModel:", v31);
          }
          else if (!(_WORD)v28)
          {
            v32 = v42->_log;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v24;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v21;
              _os_log_impl(&dword_212D08000, v32, OS_LOG_TYPE_INFO, "HSML: rx downloaded model locale <%@>, hash <%@>", buf, 0x16u);
            }
            -[UARPHeySiriModelBase addDownloadedModel:](v42, "addDownloadedModel:", v31);
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v16);
    }

    LOBYTE(v9) = v35;
  }
  return v9;
}

- (void)addDownloadedModel:(id)a3
{
  -[NSMutableArray addObject:](self->_downloadedModels, "addObject:", a3);
}

- (void)addPreInstalledModel:(id)a3
{
  -[NSMutableArray addObject:](self->_preinstalledModels, "addObject:", a3);
}

- (id)uarpPayloadWithHSModel:(id)a3 tag:(id)a4
{
  id v5;
  id v6;
  UARPAssetVersion *v7;
  UARPSuperBinaryAssetPayload *v8;
  void *v9;
  UARPSuperBinaryAssetTLV *v10;
  void *v11;
  UARPSuperBinaryAssetTLV *v12;
  void *v13;
  UARPSuperBinaryAssetTLV *v14;
  void *v15;
  UARPSuperBinaryAssetTLV *v16;
  void *v17;
  UARPSuperBinaryAssetTLV *v18;
  void *v19;
  UARPSuperBinaryAssetTLV *v20;
  void *v21;
  UARPSuperBinaryAssetTLV *v22;
  void *v23;
  UARPSuperBinaryAssetTLV *v24;
  void *v25;
  UARPSuperBinaryAssetTLV *v26;
  void *v27;
  UARPSuperBinaryAssetTLV *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  UARPSuperBinaryAssetTLV *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  UARPSuperBinaryAssetTLV *v39;
  void *v40;
  CC_SHA512_CTX v42;

  v42.wbuf[7] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", 0, 0, 0, 0);
  v8 = -[UARPSuperBinaryAssetPayload initWithPayloadTag:assetVersion:]([UARPSuperBinaryAssetPayload alloc], "initWithPayloadTag:assetVersion:", v6, v7);

  objc_msgSend(v5, "modelLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [UARPSuperBinaryAssetTLV alloc];
    objc_msgSend(v5, "modelLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:](v10, "initWithType:stringValue:", 1619725825, v11);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v12);
  }
  objc_msgSend(v5, "modelHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [UARPSuperBinaryAssetTLV alloc];
    objc_msgSend(v5, "modelHash");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:](v14, "initWithType:stringValue:", 1619725826, v15);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v16);
  }
  objc_msgSend(v5, "digest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = [UARPSuperBinaryAssetTLV alloc];
    objc_msgSend(v5, "digest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v18, "initWithType:dataValue:", 1619725828, v19);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v20);
  }
  objc_msgSend(v5, "signature");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = [UARPSuperBinaryAssetTLV alloc];
    objc_msgSend(v5, "signature");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v22, "initWithType:dataValue:", 1619725829, v23);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v24);
  }
  objc_msgSend(v5, "certificate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = [UARPSuperBinaryAssetTLV alloc];
    objc_msgSend(v5, "certificate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:](v26, "initWithType:dataValue:", 1619725830, v27);

    -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v28);
  }
  objc_msgSend(v5, "modelData");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    objc_msgSend(v5, "modelData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length");

    if (v32)
    {
      objc_msgSend(v5, "digest");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
        v34 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt16:", 3436347666, 1);
        -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v34);
        memset(&v42, 0, 104);
        uarpPlatformDarwinHashInit(1, &v42);
        objc_msgSend(v5, "modelData");
        v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v36 = (void *)objc_msgSend(v35, "bytes");
        objc_msgSend(v5, "modelData");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        uarpPlatformDarwinHashUpdate(1, &v42, v36, objc_msgSend(v37, "length"));

        uarpPlatformDarwinHashFinal(1, &v42, (unsigned __int8 *)&v42.wbuf[3], 32);
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v42.wbuf[3], 32);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:]([UARPSuperBinaryAssetTLV alloc], "initWithType:dataValue:", 3436347655, v38);
        -[UARPSuperBinaryAssetPayload addMetaDataTLV:](v8, "addMetaDataTLV:", v39);

      }
      objc_msgSend(v5, "modelData");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPSuperBinaryAssetPayload setPayloadToData:](v8, "setPayloadToData:", v40);

    }
  }

  return v8;
}

- (void)checkCurrentHeySiriModel
{
  id CSCoreSpeechServicesClass;
  unint64_t majorVersion;
  unint64_t minorVersion;
  NSMutableArray *downloadedModels;
  NSMutableArray *preinstalledModels;
  _QWORD v8[5];

  CSCoreSpeechServicesClass = getCSCoreSpeechServicesClass();
  majorVersion = self->_majorVersion;
  minorVersion = self->_minorVersion;
  downloadedModels = self->_downloadedModels;
  preinstalledModels = self->_preinstalledModels;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke;
  v8[3] = &unk_24CEA4168;
  v8[4] = self;
  objc_msgSend(CSCoreSpeechServicesClass, "voiceTriggerRTModelForVersion:minorVersion:downloadedModels:preinstalledModels:completion:", majorVersion, minorVersion, downloadedModels, preinstalledModels, v8);
}

void __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v7;
      _os_log_impl(&dword_212D08000, v10, OS_LOG_TYPE_INFO, "HSML: Voice Trigger Download Model %@", buf, 0xCu);
    }
    if (!v8)
      goto LABEL_11;
LABEL_7:
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v8;
      _os_log_impl(&dword_212D08000, v11, OS_LOG_TYPE_INFO, "HSML: Voice Trigger Fallback Model %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (v8)
    goto LABEL_7;
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
LABEL_11:
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(NSObject **)(v20 + 16);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_8;
  v25[3] = &unk_24CEA3EA8;
  v25[4] = v20;
  v26 = v7;
  v27 = v8;
  v28 = v9;
  v22 = v9;
  v23 = v8;
  v24 = v7;
  dispatch_async(v21, v25);

}

void __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_8(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 104));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 104));
    objc_msgSend(v4, "currentHeySiriModel:fallbackModel:error:", a1[5], a1[6], a1[7]);

  }
}

- (void)checkCurrentJustSiriModelAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  id CSCoreSpeechServicesClass;
  unint64_t majorVersion;
  unint64_t minorVersion;
  NSMutableArray *downloadedModels;
  NSMutableArray *preinstalledModels;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)getCSCoreSpeechServicesAccessoryInfoClass_softClass;
  v18 = getCSCoreSpeechServicesAccessoryInfoClass_softClass;
  v5 = MEMORY[0x24BDAC760];
  if (!getCSCoreSpeechServicesAccessoryInfoClass_softClass)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getCSCoreSpeechServicesAccessoryInfoClass_block_invoke;
    v14[3] = &unk_24CEA38A0;
    v14[4] = &v15;
    __getCSCoreSpeechServicesAccessoryInfoClass_block_invoke((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  v7 = objc_alloc_init(v6);
  objc_msgSend(v7, "setSupportsJustSiri:", 1);
  CSCoreSpeechServicesClass = getCSCoreSpeechServicesClass();
  majorVersion = self->_majorVersion;
  minorVersion = self->_minorVersion;
  downloadedModels = self->_downloadedModels;
  preinstalledModels = self->_preinstalledModels;
  v13[1] = 3221225472;
  v13[2] = __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke;
  v13[3] = &unk_24CEA4168;
  v13[4] = self;
  v13[0] = v5;
  objc_msgSend(CSCoreSpeechServicesClass, "voiceTriggerRTModelForVersion:minorVersion:accessoryRTModelType:accessoryInfo:endpointId:downloadedModels:preinstalledModels:completion:", majorVersion, minorVersion, 0, v7, v3, downloadedModels, preinstalledModels, v13);

}

void __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl(&dword_212D08000, v10, OS_LOG_TYPE_INFO, "Download Model %@", buf, 0xCu);
    }
  }
  if (v8)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_212D08000, v11, OS_LOG_TYPE_INFO, "Fallback Model %@", buf, 0xCu);
    }
  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(NSObject **)(v12 + 16);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke_14;
  v17[3] = &unk_24CEA3EA8;
  v17[4] = v12;
  v18 = v7;
  v19 = v8;
  v20 = v9;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  dispatch_async(v13, v17);

}

void __58__UARPHeySiriModelBase_checkCurrentJustSiriModelAvailable__block_invoke_14(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 104));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 104));
    objc_msgSend(v4, "currentHeySiriModel:fallbackModel:error:", a1[5], a1[6], a1[7]);

  }
}

- (void)offerDownloadModel:(id)a3 fallbackModel:(id)a4 tag:(id)a5 assetVersion:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  unsigned int uarpProtocolVersion_low;
  id v15;
  UARPSuperBinaryAsset *v16;
  UARPSuperBinaryAssetTLV *v17;
  NSObject *log;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  UARPSuperBinaryAssetTLV *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  UARPSuperBinaryAssetTLV *v37;
  void *v38;
  BOOL v39;
  id v40;
  BOOL v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  uarpProtocolVersion_low = LOWORD(self->_uarpProtocolVersion);
  v15 = a6;
  v16 = -[UARPSuperBinaryAsset initWithFormatVersion:assetVersion:]([UARPSuperBinaryAsset alloc], "initWithFormatVersion:assetVersion:", uarpAssetSuperBinaryVersionForProtocolVersion(uarpProtocolVersion_low), v15);

  if (-[UARPHeySiriModelBase engineType](self, "engineType")
    && -[UARPHeySiriModelBase engineType](self, "engineType") != 1)
  {
    v17 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt16:", 1619725832, (unsigned __int16)-[UARPHeySiriModelBase engineType](self, "engineType"));
    -[UARPSuperBinaryAsset addMetaDataTLV:](v16, "addMetaDataTLV:", v17);

  }
  if (v11)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:].cold.4(log, v19, v20, v21, v22, v23, v24, v25);
    -[UARPHeySiriModelBase uarpPayloadWithHSModel:tag:](self, "uarpPayloadWithHSModel:tag:", v11, v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt16:", 1619725827, 0);
    objc_msgSend(v26, "addMetaDataTLV:", v27);
    -[UARPSuperBinaryAsset addPayload:](v16, "addPayload:", v26);

  }
  if (v12)
  {
    v28 = self->_log;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:].cold.3(v28, v29, v30, v31, v32, v33, v34, v35);
    -[UARPHeySiriModelBase uarpPayloadWithHSModel:tag:](self, "uarpPayloadWithHSModel:tag:", v12, v13);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt16:", 1619725827, 1);
    objc_msgSend(v36, "addMetaDataTLV:", v37);
    -[UARPSuperBinaryAsset addPayload:](v16, "addPayload:", v36);

  }
  uarpDynamicAssetComponentURL(v13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v39 = -[UARPSuperBinaryAsset writeToURL:error:](v16, "writeToURL:error:", v38, &v58);
  v40 = v58;
  if (v39)
  {
    v57 = 0;
    v41 = -[UARPHeySiriModelBase offerDynamicAssetToAccessory:tag:error:](self, "offerDynamicAssetToAccessory:tag:error:", v38, v13, &v57);
    v42 = v57;

    if (!v41)
    {
      v43 = self->_log;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:].cold.1((uint64_t)v42, v43, v44, v45, v46, v47, v48, v49);
    }
    v40 = v42;
  }
  else
  {
    v50 = self->_log;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[UARPHeySiriModelBase offerDownloadModel:fallbackModel:tag:assetVersion:error:].cold.2((uint64_t)v40, v50, v51, v52, v53, v54, v55, v56);
  }

}

- (BOOL)offerDynamicAssetToAccessory:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  UARPAssetID *v10;
  BOOL v11;

  v8 = a4;
  v9 = a3;
  v10 = -[UARPAssetID initWithLocationType:assetTag:url:]([UARPAssetID alloc], "initWithLocationType:assetTag:url:", 0, v8, v9);

  if (v10)
  {
    -[UARPAssetID setReportProgressToDelegates:](v10, "setReportProgressToDelegates:", 0);
    v11 = -[UARPController dynamicAssetAvailableForAccessory:assetID:error:](self->_controller, "dynamicAssetAvailableForAccessory:assetID:error:", self->_accessory, v10, a5);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UARPAccessory)accessory
{
  return (UARPAccessory *)objc_getProperty(self, a2, 96, 1);
}

- (UARPHeySiriModelDelegateProtocol)delegate
{
  return (UARPHeySiriModelDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_preinstalledModels, 0);
  objc_storeStrong((id *)&self->_downloadedModels, 0);
  objc_storeStrong((id *)&self->_superbinary, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __48__UARPHeySiriModelBase_checkCurrentHeySiriModel__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "HSML: Voice Trigger NO Model Provided", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)offerDownloadModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 tag:(uint64_t)a5 assetVersion:(uint64_t)a6 error:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Could not offer HSML dynamic asset to disk %@", a5, a6, a7, a8, 2u);
}

- (void)offerDownloadModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 tag:(uint64_t)a5 assetVersion:(uint64_t)a6 error:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Could not export HSML dynamic asset to disk %@", a5, a6, a7, a8, 2u);
}

- (void)offerDownloadModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 tag:(uint64_t)a5 assetVersion:(uint64_t)a6 error:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Adding CoreSpeech fallback model to dynamic asset", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)offerDownloadModel:(uint64_t)a3 fallbackModel:(uint64_t)a4 tag:(uint64_t)a5 assetVersion:(uint64_t)a6 error:(uint64_t)a7 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Adding CoreSpeech download model to dynamic asset", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
