@implementation HSModel

- (HSModel)init
{
  HSModel *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HSModel;
  v2 = -[HSModel init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MobileAccessoryUpdater.EAFirmwareUpdater.HSQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__HSModel_setDelegate___block_invoke;
  block[3] = &unk_24F78C1F8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __23__HSModel_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (BOOL)getHSModelForEngineMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 numHSModels:(unint64_t)a5 modelBuffer:(char *)a6 length:(unint64_t)a7
{
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  objc_class *v29;
  uint64_t v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  HSModel *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = "valid";
  if (!a6)
    v15 = "NULL";
  NSLog(CFSTR("getHSModelForEngineMajorVersion: majorVersion=%lu minorVersion=%lu numHSModels=%lu buffer=%s length=%zu\n"), a3, a4, a5, v15, a7);
  if (!a6)
  {
    NSLog(CFSTR("Empty buffer\n"), v33);
    goto LABEL_40;
  }
  v39 = v14;
  v40 = v13;
  v36 = a3;
  v37 = a4;
  v35 = self;
  v38 = a5;
  if (a5)
  {
    if (a7 >= 4)
    {
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LODWORD(a5) = 0;
      v20 = 0;
      while (1)
      {
        v21 = a6[v16];
        if (v21 >= 2)
        {
          NSLog(CFSTR("Unexpected modelType = 0x%x\n"), a6[v16], v34);
          goto LABEL_31;
        }
        v22 = (v20 + 2);
        v23 = a6[v20 + 1];
        if (a7 - v22 <= v23)
        {
          NSLog(CFSTR("Bad buffer: remaining bytes %lu is less than localeCodeLen %d\n"), a7 - v22, v23);
          goto LABEL_31;
        }
        if (v19)

        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &a6[v22], v23, 4);
        if (!v19)
        {
          NSLog(CFSTR("Failed to create localeCode\n"));

          goto LABEL_36;
        }
        v24 = v22 + v23;
        v25 = (v22 + v23 + 1);
        v26 = a6[v24];
        if (a7 - v25 < v26)
        {
          NSLog(CFSTR("Bad buffer: remaining bytes %lu is less than hashLen %d\n"), a7 - v25, v26);
          goto LABEL_31;
        }
        if (v18)

        v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &a6[v25], v26, 4);
        if (!v27)
        {
          NSLog(CFSTR("Failed to create hash\n"));

          goto LABEL_35;
        }
        v18 = (void *)v27;
        if (v17)

        v42 = 0;
        v43 = &v42;
        v44 = 0x2050000000;
        v28 = (void *)getCSVoiceTriggerRTModelClass_softClass;
        v45 = getCSVoiceTriggerRTModelClass_softClass;
        if (!getCSVoiceTriggerRTModelClass_softClass)
        {
          v41[0] = MEMORY[0x24BDAC760];
          v41[1] = 3221225472;
          v41[2] = __getCSVoiceTriggerRTModelClass_block_invoke;
          v41[3] = &unk_24F78C270;
          v41[4] = &v42;
          __getCSVoiceTriggerRTModelClass_block_invoke((uint64_t)v41);
          v28 = (void *)v43[3];
        }
        v29 = objc_retainAutorelease(v28);
        _Block_object_dispose(&v42, 8);
        v30 = objc_msgSend([v29 alloc], "initWithData:hash:locale:digest:signature:certificate:", 0, v18, v19, 0, 0, 0);
        if (!v30)
          break;
        v17 = (void *)v30;
        v31 = v40;
        if (v21)
          v31 = v39;
        objc_msgSend(v31, "addObject:", v17);
        v16 = (v25 + v26);
        a5 = (a5 + 1);
        v20 = v25 + v26;
        if (a7 - 3 <= v16)
          goto LABEL_24;
      }
      NSLog(CFSTR("Failed to create CSVoiceTriggerRTModel asset\n"));
      goto LABEL_34;
    }
    NSLog(CFSTR("Invalid length=%zu\n"), a7);
LABEL_40:
    LOBYTE(v19) = 0;
    goto LABEL_26;
  }
  v19 = 0;
  v18 = 0;
  v17 = 0;
LABEL_24:
  if (a5 == v38)
  {
    v13 = v40;
    v14 = v39;
    NSLog(CFSTR("Requesting HSModel: majorVersion=%lu minorVersion=%lu assetCount=%d downloaded[%lu] preInstalled[%lu], on Queue: %@\n"), v36, v37, a5, objc_msgSend(v40, "count"), objc_msgSend(v39, "count"), v35->_queue);
    -[HSModel scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:](v35, "scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:", v36, v37, v40, v39);

    LOBYTE(v19) = 1;
    goto LABEL_26;
  }
  NSLog(CFSTR("assetCount %u != numHSModels %lu\n"), a5, v38);
LABEL_31:

LABEL_34:
LABEL_35:

  LOBYTE(v19) = 0;
LABEL_36:
  v14 = v39;
  v13 = v40;
LABEL_26:

  return (char)v19;
}

- (void)scheduleCoreSpeechTask:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD aBlock[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 buf;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  if (self->delegate)
  {
    v12 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__HSModel_scheduleCoreSpeechTask_minorVersion_downloadedModels_preinstalledModels___block_invoke;
    aBlock[3] = &unk_24F78C248;
    aBlock[4] = self;
    v13 = _Block_copy(aBlock);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v14 = (void *)getCSCoreSpeechServicesClass_softClass;
    v20 = getCSCoreSpeechServicesClass_softClass;
    if (!getCSCoreSpeechServicesClass_softClass)
    {
      *(_QWORD *)&buf = v12;
      *((_QWORD *)&buf + 1) = 3221225472;
      v22 = __getCSCoreSpeechServicesClass_block_invoke;
      v23 = &unk_24F78C270;
      v24 = &v17;
      __getCSCoreSpeechServicesClass_block_invoke((uint64_t)&buf);
      v14 = (void *)v18[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v17, 8);
    objc_msgSend(v15, "voiceTriggerRTModelForVersion:minorVersion:downloadedModels:preinstalledModels:completion:", a3, a4, v10, v11, v13);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[HSModel scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:]";
    _os_log_impl(&dword_22CD67000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: delegate is nil", (uint8_t *)&buf, 0xCu);
  }

}

void __83__HSModel_scheduleCoreSpeechTask_minorVersion_downloadedModels_preinstalledModels___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (CFPreferencesGetAppBooleanValue(CFSTR("simulateCoreSpeechNotRespoding"), CFSTR("com.apple.UARPUpdaterServiceLegacyAudio"), 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22CD67000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Simulating CoreSpeech not responding", buf, 2u);
    }
  }
  else
  {
    if (v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_22CD67000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Download Model %@", buf, 0xCu);
    }
    if (v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_22CD67000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Fallback Model %@", buf, 0xCu);
    }
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 16);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __83__HSModel_scheduleCoreSpeechTask_minorVersion_downloadedModels_preinstalledModels___block_invoke_30;
    v12[3] = &unk_24F78C220;
    v12[4] = v10;
    v13 = v7;
    v14 = v8;
    v15 = v9;
    dispatch_async(v11, v12);

  }
}

void __83__HSModel_scheduleCoreSpeechTask_minorVersion_downloadedModels_preinstalledModels___block_invoke_30(_QWORD *a1)
{
  void *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1[4] + 8);
  if (v2)
  {
    objc_msgSend(v2, "setHSModel:fallbackModel:error:", a1[5], a1[6], a1[7]);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[HSModel scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:]_block_invoke";
    _os_log_impl(&dword_22CD67000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: delegate is nil", (uint8_t *)&v3, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->delegate, 0);
}

@end
