@implementation CKVDonateTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridge, 0);
  objc_storeStrong((id *)&self->_donatorProvider, 0);
}

- (void)_donateDataset:(id)a3 withType:(unsigned __int16)a4 reason:(unsigned __int16)a5 completion:(id)a6
{
  id v8;
  id v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_semaphore_t v16;
  uint64_t v17;
  CKVDonatorProvider *donatorProvider;
  void *v19;
  uint64_t donateOptions;
  id v21;
  uint64_t v22;
  __CFString *v23;
  NSObject *v24;
  id v25;
  id v26;
  dispatch_time_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  dispatch_semaphore_t dsema;
  id v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  CKVDonateTask *v41;
  id v42;
  id v43;
  id v44;
  _BYTE *v45;
  uint64_t *v46;
  uint64_t *v47;
  os_signpost_id_t v48;
  os_signpost_id_t v49;
  __int16 v50;
  __int16 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  id v62;
  _QWORD aBlock[4];
  dispatch_semaphore_t v64;
  id v65;
  uint8_t v66[4];
  const char *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  _BYTE buf[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;

  v32 = a4;
  v33 = a5;
  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  v10 = os_signpost_id_generate((os_log_t)CKLogContextFramework);
  v11 = (id)CKLogContextVocabulary;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A48B3000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "donateDataset", ", buf, 2u);
  }

  v13 = os_signpost_id_generate((os_log_t)CKLogContextFramework);
  v14 = (id)CKLogContextVocabulary;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A48B3000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "donateIncrementalDataset", ", buf, 2u);
  }

  v16 = dispatch_semaphore_create(0);
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke;
  aBlock[3] = &unk_1E4D29718;
  dsema = v16;
  v64 = dsema;
  v36 = v9;
  v65 = v36;
  v37 = _Block_copy(aBlock);
  objc_msgSend(v8, "originAppId");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  donatorProvider = self->_donatorProvider;
  v62 = 0;
  -[CKVDonatorProvider donatorWithCascadeItemType:originAppId:error:](donatorProvider, "donatorWithCascadeItemType:originAppId:error:", objc_msgSend(v8, "cascadeItemType"), v38, &v62);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (uint64_t (*)(uint64_t, uint64_t))v62;
  if (v19)
  {
    donateOptions = self->_donateOptions;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v73 = __Block_byref_object_copy__165;
    v74 = __Block_byref_object_dispose__166;
    v75 = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__165;
    v56 = __Block_byref_object_dispose__166;
    v57 = 0;
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE786D98))
    {
      v21 = v8;
      v22 = objc_msgSend(v21, "version");
      objc_msgSend(v21, "validity");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "wasLastDonationAccepted"))
        donateOptions = donateOptions;
      else
        donateOptions = (unsigned __int16)donateOptions & 0xFFFE;
      objc_msgSend(v21, "recordDonationAttempt");
    }
    else
    {
      v22 = 0;
      v21 = 0;
      v23 = &stru_1E4D29D08;
    }
    v39[0] = v17;
    v39[1] = 3221225472;
    v39[2] = __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke_71;
    v39[3] = &unk_1E4D28EF8;
    v45 = buf;
    v46 = &v52;
    v25 = v38;
    v40 = v25;
    v44 = v37;
    v41 = self;
    v31 = v8;
    v42 = v31;
    v26 = v21;
    v43 = v26;
    v47 = &v58;
    v48 = v10;
    v50 = v32;
    v51 = v33;
    v49 = v13;
    objc_msgSend(v19, "donateWithOptions:version:validity:usingStream:", donateOptions, v22, v23, v39);
    v27 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    if (dispatch_semaphore_wait(dsema, v27))
    {
      v28 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeout);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v66 = 136315650;
        v67 = "-[CKVDonateTask _donateDataset:withType:reason:completion:]";
        v68 = 2112;
        v69 = v25;
        v70 = 2112;
        v71 = v30;
        _os_log_error_impl(&dword_1A48B3000, v28, OS_LOG_TYPE_ERROR, "%s Timed out streaming donation from app: %@ timeout: %@ seconds", v66, 0x20u);

      }
      if (v36)
        (*((void (**)(id, uint64_t))v36 + 2))(v36, -1);
    }
    if (v26)
    {
      if (*((_BYTE *)v59 + 24))
      {
        objc_msgSend(v26, "recordDonationAccepted");
      }
      else if (v53[5])
      {
        v29 = CKLogContextVocabulary;
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v66 = 136315138;
          v67 = "-[CKVDonateTask _donateDataset:withType:reason:completion:]";
          _os_log_impl(&dword_1A48B3000, v29, OS_LOG_TYPE_INFO, "%s Incremental donation aborted. Retrying full dataset donation.", v66, 0xCu);
        }
        -[CKVDonateTask _donateDataset:withType:reason:completion:](self, "_donateDataset:withType:reason:completion:", v31, v32, v33, v36);
      }
    }

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v58, 8);
  }
  else
  {
    v24 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[CKVDonateTask _donateDataset:withType:reason:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v38;
      *(_WORD *)&buf[22] = 2112;
      v73 = v34;
      _os_log_error_impl(&dword_1A48B3000, v24, OS_LOG_TYPE_ERROR, "%s Failed to obtain donator for app: %@ error: %@", buf, 0x20u);
    }
    (*((void (**)(void *, uint64_t))v37 + 2))(v37, -1);
  }

}

- (void)runWithType:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v5 = a4;
  v6 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    CKVTaskIdDescription(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[CKVDonateTask runWithType:reason:completion:]";
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_INFO, "%s Running donate task: %@ reason: %@", (uint8_t *)&v13, 0x20u);

  }
  if (self->_isMultiDataset)
    -[CKVDonateTask _donateAllDatasets:withReason:completion:](self, "_donateAllDatasets:withReason:completion:", v6, v5, v8);
  else
    -[CKVDonateTask _donateDataset:withType:reason:completion:](self, "_donateDataset:withType:reason:completion:", self->_bridge, v6, v5, v8);

}

- (void)runWithType:(unsigned __int16)a3 reason:(unsigned __int16)a4
{
  -[CKVDonateTask runWithType:reason:completion:](self, "runWithType:reason:completion:", a3, a4, 0);
}

- (CKVDonateTask)initWithDonatorProvider:(id)a3 multiDatasetBridge:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  CKVDonateTask *v10;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE781B70))
  {
    self = -[CKVDonateTask initWithDonatorProvider:datasetBridge:timeout:donateOptions:](self, "initWithDonatorProvider:datasetBridge:timeout:donateOptions:", v8, v9, 0, a5);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CKVDonateTask)initWithDonatorProvider:(id)a3 datasetBridge:(id)a4 timeout:(double)a5 donateOptions:(unsigned __int16)a6
{
  id v11;
  id v12;
  CKVDonateTask *v13;
  CKVDonateTask *v14;
  CKVDonateTask *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKVDonateTask;
  v13 = -[CKVDonateTask init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_donatorProvider, a3);
    if (!v14->_donatorProvider)
    {
      v15 = 0;
      goto LABEL_8;
    }
    objc_storeStrong((id *)&v14->_bridge, a4);
    if (-[NSObject conformsToProtocol:](v14->_bridge, "conformsToProtocol:", &unk_1EE781B70))
      v14->_isMultiDataset = 1;
    v14->_timeout = a5;
    v14->_donateOptions = a6;
  }
  v15 = v14;
LABEL_8:

  return v15;
}

- (void)_donateAllDatasets:(unsigned __int16)a3 withReason:(unsigned __int16)a4 completion:(id)a5
{
  id v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_group_t v12;
  NSObject *bridge;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  uint8_t *v25;
  os_signpost_id_t v26;
  uint64_t v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  _QWORD v30[4];
  NSObject *v31;
  CKVDonateTask *v32;
  _QWORD *v33;
  uint8_t *v34;
  unsigned __int16 v35;
  unsigned __int16 v36;
  _QWORD v37[4];
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v8 = a5;
  v9 = os_signpost_id_generate((os_log_t)CKLogContextFramework);
  v10 = (id)CKLogContextVocabulary;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A48B3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "streamDonateMultiDataset", ", buf, 2u);
  }

  v41 = 0;
  v42 = 0;
  *(_QWORD *)buf = 0;
  v39 = buf;
  v40 = 0x2020000000;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  v12 = dispatch_group_create();
  bridge = self->_bridge;
  v14 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke;
  v30[3] = &unk_1E4D28E80;
  v15 = v12;
  v31 = v15;
  v32 = self;
  v35 = a3;
  v36 = a4;
  v33 = v37;
  v34 = buf;
  -[NSObject enumerateAllDatasets:usingBlock:](bridge, "enumerateAllDatasets:usingBlock:", &v42, v30);
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (_sharedQueue_onceToken != -1)
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_176);
  v18 = _sharedQueue_sharedQueue;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke_3;
  v21[3] = &unk_1E4D28EA8;
  v28 = a3;
  v29 = a4;
  v24 = v37;
  v25 = buf;
  v26 = v9;
  v27 = v42;
  v22 = v17;
  v23 = v8;
  v19 = v8;
  v20 = v17;
  dispatch_group_notify(v15, v18, v21);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(buf, 8);
}

void __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = *(unsigned __int16 *)(a1 + 64);
  v6 = *(unsigned __int16 *)(a1 + 66);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke_2;
  v8[3] = &unk_1E4D28E58;
  v10 = *(_OWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v7, "_donateDataset:withType:reason:completion:", v4, v5, v6, v8);

}

- (CKVDonateTask)initWithDonatorProvider:(id)a3 fullDatasetBridge:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  CKVDonateTask *v10;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE781A90))
  {
    self = -[CKVDonateTask initWithDonatorProvider:datasetBridge:timeout:donateOptions:](self, "initWithDonatorProvider:datasetBridge:timeout:donateOptions:", v8, v9, 0, a5);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CKVDonateTask)initWithDonatorProvider:(id)a3 deltaDatasetBridge:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  CKVDonateTask *v10;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE786D98))
  {
    self = -[CKVDonateTask initWithDonatorProvider:datasetBridge:timeout:donateOptions:](self, "initWithDonatorProvider:datasetBridge:timeout:donateOptions:", v8, v9, 1, a5);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CKVDonateTask)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (int64_t)_enumerateAndStreamFullDataset:(id)a3 fullStream:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  int64_t v11;
  NSObject *v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(_QWORD *, void *);
  void *v18;
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v21 = &v23;
  v22 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __59__CKVDonateTask__enumerateAndStreamFullDataset_fullStream___block_invoke;
  v18 = &unk_1E4D28F20;
  v7 = v6;
  v19 = v7;
  v8 = v5;
  v20 = v8;
  v9 = objc_msgSend(v8, "enumerateItemsWithError:usingBlock:", &v22, &v15);
  v10 = v22;
  if ((v9 & 1) != 0)
  {
    v11 = v24[3];
  }
  else
  {
    v12 = (id)CKLogContextVocabulary;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "originAppId", v15, v16, v17, v18, v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[CKVDonateTask _enumerateAndStreamFullDataset:fullStream:]";
      v29 = 2112;
      v30 = v14;
      v31 = 2112;
      v32 = v10;
      _os_log_error_impl(&dword_1A48B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed to enumerate full dataset from app: %@. error: %@", buf, 0x20u);

    }
    v11 = -1;
  }

  _Block_object_dispose(&v23, 8);
  return v11;
}

- (int64_t)_enumerateAndStreamDeltaDataset:(id)a3 fullStream:(id)a4 incrementalStream:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  int64_t v17;
  NSObject *v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(_QWORD *, void *);
  void *v24;
  id v25;
  id v26;
  uint64_t *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v32 = &v34;
  v33 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __78__CKVDonateTask__enumerateAndStreamDeltaDataset_fullStream_incrementalStream___block_invoke;
  v28[3] = &unk_1E4D28F48;
  v29 = v9;
  v30 = v7;
  v11 = v8;
  v31 = v11;
  v21 = v10;
  v22 = 3221225472;
  v23 = __78__CKVDonateTask__enumerateAndStreamDeltaDataset_fullStream_incrementalStream___block_invoke_82;
  v24 = &unk_1E4D28F70;
  v27 = &v34;
  v12 = v29;
  v25 = v12;
  v13 = v30;
  v26 = v13;
  v14 = objc_msgSend(v13, "enumerateDeltaItemsWithError:addOrUpdateBlock:removeBlock:", &v33, v28, &v21);
  v15 = v33;
  v16 = v15;
  if ((v14 & 1) != 0)
  {
    v17 = v35[3];
  }
  else
  {
    if (v15)
    {
      v18 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "originAppId", v21, v22, v23, v24, v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v39 = "-[CKVDonateTask _enumerateAndStreamDeltaDataset:fullStream:incrementalStream:]";
        v40 = 2112;
        v41 = v20;
        v42 = 2112;
        v43 = v16;
        _os_log_error_impl(&dword_1A48B3000, v18, OS_LOG_TYPE_ERROR, "%s Failed to enumerate delta dataset from app: %@. error: %@", buf, 0x20u);

      }
    }
    v17 = -1;
  }

  _Block_object_dispose(&v34, 8);
  return v17;
}

- (id)_getProviderBridge
{
  return self->_bridge;
}

- (BOOL)_isIncrementalPreferred
{
  return self->_donateOptions & 1;
}

- (id)lastDonationAcceptedDate
{
  void *v3;

  if (-[NSObject conformsToProtocol:](self->_bridge, "conformsToProtocol:", &unk_1EE786D98))
  {
    -[NSObject lastDonationAcceptedDate](self->_bridge, "lastDonationAcceptedDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)wasLastDonationAccepted
{
  int v3;

  v3 = -[NSObject conformsToProtocol:](self->_bridge, "conformsToProtocol:", &unk_1EE786D98);
  if (v3)
    LOBYTE(v3) = -[NSObject wasLastDonationAccepted](self->_bridge, "wasLastDonationAccepted");
  return v3;
}

uint64_t __78__CKVDonateTask__enumerateAndStreamDeltaDataset_fullStream_incrementalStream___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  v4 = (void *)a1[4];
  if (v4)
  {
    v21 = 0;
    v5 = objc_msgSend(v4, "addOrUpdateItem:error:", v3, &v21);
    v6 = v21;
    if ((v5 & 1) == 0)
    {
      v7 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)a1[5];
        v15 = v7;
        objc_msgSend(v14, "originAppId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v23 = "-[CKVDonateTask _enumerateAndStreamDeltaDataset:fullStream:incrementalStream:]_block_invoke";
        v24 = 2112;
        v25 = v3;
        v26 = 2112;
        v27 = v16;
        v28 = 2112;
        v29 = v6;
        _os_log_error_impl(&dword_1A48B3000, v15, OS_LOG_TYPE_ERROR, "%s Failed to add or update item: %@ from app: %@. error: %@", buf, 0x2Au);

      }
      v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v6 = 0;
  }
  v9 = (void *)a1[6];
  if (v9)
  {
    v20 = v6;
    v10 = objc_msgSend(v9, "registerItem:error:", v3, &v20);
    v11 = v20;

    if ((v10 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v12 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)a1[5];
        v18 = v12;
        objc_msgSend(v17, "originAppId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v23 = "-[CKVDonateTask _enumerateAndStreamDeltaDataset:fullStream:incrementalStream:]_block_invoke";
        v24 = 2112;
        v25 = v3;
        v26 = 2112;
        v27 = v19;
        v28 = 2112;
        v29 = v11;
        _os_log_error_impl(&dword_1A48B3000, v18, OS_LOG_TYPE_ERROR, "%s Failed to register item: %@ from app: %@. error: %@", buf, 0x2Au);

      }
      v8 = 0;
    }
    v6 = v11;
  }
  else
  {
    v8 = 1;
  }
LABEL_15:

  return v8;
}

uint64_t __78__CKVDonateTask__enumerateAndStreamDeltaDataset_fullStream_incrementalStream___block_invoke_82(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v4 = (void *)a1[4];
  v12 = 0;
  v5 = objc_msgSend(v4, "removeItemWithItemId:error:", v3, &v12);
  v6 = v12;
  if ((v5 & 1) == 0)
  {
    v7 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)a1[5];
      v10 = v7;
      objc_msgSend(v9, "originAppId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v14 = "-[CKVDonateTask _enumerateAndStreamDeltaDataset:fullStream:incrementalStream:]_block_invoke";
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to remove item with itemId: %@ from app: %@. error: %@", buf, 0x2Au);

    }
  }

  return v5;
}

uint64_t __59__CKVDonateTask__enumerateAndStreamFullDataset_fullStream___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v4 = (void *)a1[4];
  v12 = 0;
  v5 = objc_msgSend(v4, "registerItem:error:", v3, &v12);
  v6 = v12;
  if ((v5 & 1) == 0)
  {
    v7 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)a1[5];
      v10 = v7;
      objc_msgSend(v9, "originAppId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v14 = "-[CKVDonateTask _enumerateAndStreamFullDataset:fullStream:]_block_invoke";
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to stream vocabulary item: %@ from app: %@. error: %@", buf, 0x2Au);

    }
  }

  return v5;
}

intptr_t __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  intptr_t result;

  result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (result)
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(intptr_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  _WORD *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  int v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = a1 + 72;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        v29 = "-[CKVDonateTask _donateDataset:withType:reason:completion:]_block_invoke";
        v30 = 2112;
        v31 = v18;
        v32 = 2112;
        v33 = v7;
        _os_log_error_impl(&dword_1A48B3000, v17, OS_LOG_TYPE_ERROR, "%s Donation rejected for app: %@ error: %@ ", buf, 0x20u);
      }
      goto LABEL_16;
    }
    v8 = a1 + 80;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 40), a2);
  v9 = *(_WORD **)(a1 + 40);
  if ((v9[17] & 1) != 0)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (!v15)
    {
      v16 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[CKVDonateTask _donateDataset:withType:reason:completion:]_block_invoke";
        _os_log_impl(&dword_1A48B3000, v16, OS_LOG_TYPE_INFO, "%s Incremental donation cannot be made. Falling back to full dataset donation.", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 56), "resetDeltaState");
      v9 = *(_WORD **)(a1 + 40);
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    }
    v10 = objc_msgSend(v9, "_enumerateAndStreamDeltaDataset:fullStream:incrementalStream:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v15);
    if ((v10 & 0x8000000000000000) == 0)
      goto LABEL_7;
    goto LABEL_13;
  }
  v10 = objc_msgSend(v9, "_enumerateAndStreamFullDataset:fullStream:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  if (v10 < 0)
  {
LABEL_13:
    objc_msgSend(v6, "cancel");
LABEL_16:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_17;
  }
LABEL_7:
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke_74;
  v19[3] = &unk_1E4D28ED0;
  v25 = v10;
  v20 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 88);
  v21 = v11;
  v27 = *(_DWORD *)(a1 + 112);
  v14 = *(void **)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v23 = v12;
  v24 = v13;
  v26 = *(_OWORD *)(a1 + 96);
  v22 = v14;
  objc_msgSend(v6, "finish:", v19);

LABEL_17:
}

void __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke_74(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[22];
  __int16 v27;
  _BYTE v28[10];
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = *(_QWORD *)(a1 + 72);
    v7 = v4;
    objc_msgSend(v5, "numberWithInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D3E4C0], "descriptionForTypeIdentifier:", objc_msgSend(*(id *)(a1 + 32), "cascadeItemType"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = *(_QWORD *)(a1 + 40);
    v12 = CFSTR("success");
    *(_DWORD *)v26 = 136316162;
    *(_QWORD *)&v26[4] = "-[CKVDonateTask _donateDataset:withType:reason:completion:]_block_invoke";
    if (v3)
      v12 = v3;
    *(_WORD *)&v26[12] = 2112;
    *(_QWORD *)&v26[14] = v8;
    v27 = 2112;
    *(_QWORD *)v28 = v9;
    *(_WORD *)&v28[8] = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_INFO, "%s Finished streaming %@ items of type: %@ from app: %@ result: %@", v26, 0x34u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3 == 0;
  +[CKVAnalytics sendDonateEvent:itemCount:appId:reason:result:](CKVAnalytics, "sendDonateEvent:itemCount:appId:reason:result:", *(unsigned __int16 *)(a1 + 96), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 98), *(_OWORD *)v26);
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v14 = (id)CKLogContextVocabulary;
  v15 = v14;
  if (v13)
  {
    v16 = *(_QWORD *)(a1 + 80);
    if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14))
      goto LABEL_13;
    CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 96));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(unsigned __int16 *)(a1 + 98);
    v20 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v26 = 138544130;
    *(_QWORD *)&v26[4] = v17;
    *(_WORD *)&v26[12] = 2114;
    *(_QWORD *)&v26[14] = v18;
    v27 = 1026;
    *(_DWORD *)v28 = v19;
    *(_WORD *)&v28[4] = 1026;
    *(_DWORD *)&v28[6] = v20;
    v21 = "donateDataset";
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 88);
    if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14))
      goto LABEL_13;
    CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 96));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 40);
    v23 = *(unsigned __int16 *)(a1 + 98);
    v24 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)v26 = 138544130;
    *(_QWORD *)&v26[4] = v17;
    *(_WORD *)&v26[12] = 2114;
    *(_QWORD *)&v26[14] = v22;
    v27 = 1026;
    *(_DWORD *)v28 = v23;
    *(_WORD *)&v28[4] = 1026;
    *(_DWORD *)&v28[6] = v24;
    v21 = "donateIncrementalDataset";
  }
  _os_signpost_emit_with_name_impl(&dword_1A48B3000, v15, OS_SIGNPOST_INTERVAL_END, v16, v21, " type=%{public,signpost.telemetry:string1}@  appId=%{public,signpost.telemetry:string2}@  reason=%{public,signpost.telemetry:number1}d  itemCnt=%{public,signpost.telemetry:number2}d  enableTelemetry=YES ", v26, 0x22u);

LABEL_13:
  if (v3)
    v25 = -1;
  else
    v25 = *(_QWORD *)(a1 + 72);
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v25);

}

uint64_t __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  char *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  _BYTE v21[10];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (id)CKLogContextVocabulary;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 80));
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int16 *)(a1 + 82);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v18 = 138543874;
    v19 = v5;
    v20 = 1026;
    *(_DWORD *)v21 = v6;
    *(_WORD *)&v21[4] = 1026;
    *(_DWORD *)&v21[6] = v7;
    _os_signpost_emit_with_name_impl(&dword_1A48B3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "streamDonateMultiDataset", " type=%{public,signpost.telemetry:string1}@  reason=%{public,signpost.telemetry:number1}d  itemCnt=%{public,signpost.telemetry:number2}d  enableTelemetry=YES ", (uint8_t *)&v18, 0x18u);

  }
  v8 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v14 = v8;
    objc_msgSend(v12, "numberWithUnsignedInteger:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136316162;
    v19 = "-[CKVDonateTask _donateAllDatasets:withReason:completion:]_block_invoke";
    v20 = 2112;
    *(_QWORD *)v21 = v11;
    *(_WORD *)&v21[8] = 2112;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    v25 = 2112;
    v26 = v17;
    _os_log_debug_impl(&dword_1A48B3000, v14, OS_LOG_TYPE_DEBUG, "%s Enumerated all datasets from %@ donated datasets: %@ enumerated datasets: %@ total items: %@", (uint8_t *)&v18, 0x34u);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    else if (*(_QWORD *)(a1 + 72))
    {
      v10 = -1;
    }
    else
    {
      v10 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v10);
  }
  return result;
}

void __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x8000000000000000) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a2;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
