@implementation CSP2PService

- (CSP2PService)init
{
  CSP2PService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *sema;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSP2PService;
  v2 = -[CSP2PService init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.corespeech.p2psvc", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_semaphore_create(6);
    sema = v2->_sema;
    v2->_sema = (OS_dispatch_semaphore *)v5;

  }
  return v2;
}

- (void)processRemoteCommandWithPayload:(id)a3 fromPeer:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__CSP2PService_processRemoteCommandWithPayload_fromPeer_withReply___block_invoke;
  v15[3] = &unk_1E7C27310;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)sendCoreSpeechGradingDataToNearbyPeer
{
  NSObject *queue;
  _QWORD block[5];

  if (self->_lastCommunicatedPeer && CSIsHorseman())
  {
    if (-[CSP2PService isHeadlessDeviceDataCollectionModeEnabled](self, "isHeadlessDeviceDataCollectionModeEnabled"))
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__CSP2PService_sendCoreSpeechGradingDataToNearbyPeer__block_invoke;
      block[3] = &unk_1E7C292C8;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

- (void)sendVTNearMissGradingDataToCompanion
{
  dispatch_time_t v3;
  NSObject *queue;
  _QWORD block[5];

  if (self->_lastCommunicatedPeer && CSIsHorseman())
  {
    if (-[CSP2PService isHeadlessDeviceDataCollectionModeEnabled](self, "isHeadlessDeviceDataCollectionModeEnabled"))
    {
      v3 = dispatch_time(0, 100000000);
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__CSP2PService_sendVTNearMissGradingDataToCompanion__block_invoke;
      block[3] = &unk_1E7C292C8;
      block[4] = self;
      dispatch_after(v3, queue, block);
    }
  }
}

- (void)sendVoiceProfileUpdatedMessageToNearbyPeerForLocale:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__CSP2PService_sendVoiceProfileUpdatedMessageToNearbyPeerForLocale___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)sendAcousticGradingDataToNearbyPeer
{
  NSObject *queue;
  _QWORD block[5];

  if (self->_lastCommunicatedPeer && CSIsHorseman())
  {
    if (-[CSP2PService isHeadlessDeviceDataCollectionModeEnabled](self, "isHeadlessDeviceDataCollectionModeEnabled"))
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__CSP2PService_sendAcousticGradingDataToNearbyPeer__block_invoke;
      block[3] = &unk_1E7C292C8;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

- (void)sendGeckoSpeechLogsToCompanion
{
  dispatch_time_t v3;
  NSObject *queue;
  _QWORD block[5];

  if (self->_lastCommunicatedPeer && CSIsHorseman())
  {
    if (-[CSP2PService isHeadlessDeviceDataCollectionModeEnabled](self, "isHeadlessDeviceDataCollectionModeEnabled"))
    {
      v3 = dispatch_time(0, 100000000);
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__CSP2PService_sendGeckoSpeechLogsToCompanion__block_invoke;
      block[3] = &unk_1E7C292C8;
      block[4] = self;
      dispatch_after(v3, queue, block);
    }
  }
}

- (void)_processRemoteHeySiriCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void **v12;
  const __CFString **v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, _QWORD))a5;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CSP2P_RemoteHeySiriEnable_Key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = *MEMORY[0x1E0D18F60];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CSP2PService _processRemoteHeySiriCommandWithRequest:fromSenderID:withReply:]";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s CSP2P_RemoteHeySiriCmd: ENABLE HeySiri: Not Implemented Yet: ", buf, 0xCu);
    }
    v17 = CFSTR("CSP2P_RemoteHeySiriStatus_Key");
    v18 = &unk_1E7C63B48;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v18;
    v13 = &v17;
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CSP2PService _processRemoteHeySiriCommandWithRequest:fromSenderID:withReply:]";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s CSP2P_RemoteHeySiriCmd: DISABLE HeySiri: Not Implemented Yet: ", buf, 0xCu);
    }
    v15 = CFSTR("CSP2P_RemoteHeySiriStatus_Key");
    v16 = &unk_1E7C63B60;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v16;
    v13 = &v15;
  }
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1, v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v14, 0);

}

- (void)_processParallelRecordingCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void **v10;
  const __CFString **v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, _QWORD))a5;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CSP2P_RemoteRecordingStart_Key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v8 == 1)
  {
    v15 = CFSTR("CSP2P_RemoteRecordingStatus_Key");
    v16[0] = &unk_1E7C63B48;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = (void **)v16;
    v11 = &v15;
  }
  else
  {
    v13 = CFSTR("CSP2P_RemoteRecordingStatus_Key");
    v14 = &unk_1E7C63B60;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = &v14;
    v11 = &v13;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v12, 0);

}

- (void)_compressFilesInDirectory:(id)a3 matchingPredicate:(id)a4 compressedFileAvailable:(id)a5
{
  -[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:](self, "_compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:", a3, a4, 0, a5);
}

- (void)_compressFilesInDirectory:(id)a3 matchingPredicate:(id)a4 sortedByCreationDate:(BOOL)a5 compressedFileAvailable:(id)a6
{
  _BOOL4 v7;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  size_t v28;
  id v29;
  const uint8_t *v30;
  uint8_t *v31;
  uint8_t *v32;
  size_t v33;
  id v34;
  size_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  void (**v45)(id, void *, id, size_t, size_t, BOOL, _QWORD);
  id obj;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  id v56;
  uint8_t v57[4];
  const char *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  size_t v62;
  __int16 v63;
  size_t v64;
  uint8_t v65[128];
  _BYTE buf[24];
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _QWORD v70[5];

  v7 = a5;
  v70[2] = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v41 = a4;
  v45 = (void (**)(id, void *, id, size_t, size_t, BOOL, _QWORD))a6;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C999D0];
  v70[0] = *MEMORY[0x1E0C99A90];
  v70[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v43, v11, 0, &v56);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v56;

  if (!v12)
  {
    if (v41)
    {
      objc_msgSend(v42, "filteredArrayUsingPredicate:");
      v40 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = v42;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v67 = __Block_byref_object_copy__14637;
    v68 = __Block_byref_object_dispose__14638;
    v69 = 0;
    if (v7)
    {
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __105__CSP2PService__compressFilesInDirectory_matchingPredicate_sortedByCreationDate_compressedFileAvailable___block_invoke;
      v55[3] = &unk_1E7C26538;
      v55[4] = buf;
      objc_msgSend(v40, "sortedArrayUsingComparator:", v55);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v40;
    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v14;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    v12 = 0;
    if (!v15)
    {
LABEL_36:

      _Block_object_dispose(buf, 8);
      goto LABEL_37;
    }
    v47 = *(_QWORD *)v52;
    v44 = v10;
LABEL_12:
    v48 = v15;
    v16 = 0;
    v17 = v12;
    while (1)
    {
      if (*(_QWORD *)v52 != v47)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v16);
      v49 = 0;
      v50 = 0;
      objc_msgSend(v18, "getResourceValue:forKey:error:", &v50, v10, &v49, v40);
      v19 = v50;
      v12 = v49;

      if (v12)
      {
        v20 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v57 = 136315650;
          v58 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
          v59 = 2112;
          v60 = v18;
          v61 = 2112;
          v62 = (size_t)v12;
          v21 = v20;
          v22 = "%s Could not determine if [%@] is a directory or not. Err=%@";
          v23 = 32;
LABEL_21:
          _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, v22, v57, v23);
        }
      }
      else
      {
        if (!objc_msgSend(v19, "BOOLValue"))
        {
          v25 = (void *)MEMORY[0x1E0C99D50];
          objc_msgSend(v18, "path");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dataWithContentsOfFile:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = objc_msgSend(v27, "length");
          v29 = objc_retainAutorelease(v27);
          v30 = (const uint8_t *)objc_msgSend(v29, "bytes");
          v31 = (uint8_t *)malloc_type_malloc(v28, 0x100004077774924uLL);
          v32 = v31;
          if (v31)
          {
            v33 = compression_encode_buffer(v31, v28, v30, v28, 0, COMPRESSION_LZFSE);
            if (v33)
            {
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v32, v33);
              v34 = (id)objc_claimAutoreleasedReturnValue();
              free(v32);
              v35 = v33;
            }
            else
            {
              v37 = *MEMORY[0x1E0D18F60];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v57 = 136315650;
                v58 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
                v59 = 2112;
                v60 = v18;
                v61 = 2048;
                v62 = v28;
                _os_log_impl(&dword_1C2614000, v37, OS_LOG_TYPE_DEFAULT, "%s _compressFilesInDirectory: Compression failed for file %@ (%lu) - Sending Uncompressed", v57, 0x20u);
              }
              free(v32);
              v34 = v29;
              v35 = v28;
            }
            v38 = *MEMORY[0x1E0D18F60];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v57 = 136315906;
              v58 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
              v59 = 2112;
              v60 = v18;
              v61 = 2048;
              v62 = v28;
              v63 = 2048;
              v64 = v35;
              _os_log_impl(&dword_1C2614000, v38, OS_LOG_TYPE_DEFAULT, "%s _compressFilesInDirectory: File %@ compressed from %ld to %ld ", v57, 0x2Au);
            }
            objc_msgSend(v18, "path");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v45[2](v45, v39, v34, v28, v35, v33 != 0, 0);

            v10 = v44;
          }
          else
          {
            v36 = *MEMORY[0x1E0D18F60];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v57 = 136315650;
              v58 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
              v59 = 2112;
              v60 = v18;
              v61 = 2048;
              v62 = v28;
              _os_log_impl(&dword_1C2614000, v36, OS_LOG_TYPE_DEFAULT, "%s _compressFilesInDirectory: Malloc failed for file %@ (%lu) - Discarding", v57, 0x20u);
            }
          }

          goto LABEL_34;
        }
        v24 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v57 = 136315394;
          v58 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
          v59 = 2112;
          v60 = v18;
          v21 = v24;
          v22 = "%s Found dir: %@. Skipping compression";
          v23 = 22;
          goto LABEL_21;
        }
      }
LABEL_34:

      ++v16;
      v17 = v12;
      if (v48 == v16)
      {
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
        if (!v15)
          goto LABEL_36;
        goto LABEL_12;
      }
    }
  }
  v13 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v43;
    *(_WORD *)&buf[22] = 2112;
    v67 = (uint64_t (*)(uint64_t, uint64_t))v12;
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Cannot read contents of directory: %@, err: %@", buf, 0x20u);
  }
LABEL_37:

}

- (void)_sendVoiceTriggerGradingDataToPeerId:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__CSP2PService__sendVoiceTriggerGradingDataToPeerId___block_invoke;
  v18[3] = &unk_1E7C26560;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "voiceTriggerAudioLogDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __53__CSP2PService__sendVoiceTriggerGradingDataToPeerId___block_invoke_2;
  v15[3] = &unk_1E7C265B0;
  v15[4] = self;
  v16 = v8;
  v17 = v4;
  v13 = v4;
  v14 = v8;
  -[CSP2PService _compressFilesInDirectory:matchingPredicate:compressedFileAvailable:](self, "_compressFilesInDirectory:matchingPredicate:compressedFileAvailable:", v12, v6, v15);

}

- (void)_sendCoreSpeechGradingDataToPeerId:(id)a3
{
  -[CSP2PService _sendCoreSpeechGradingDataToPeerId:forLogType:](self, "_sendCoreSpeechGradingDataToPeerId:forLogType:", a3, 0);
}

- (void)_sendCoreSpeechGradingDataToPeerId:(id)a3 forLogType:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[6];

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__CSP2PService__sendCoreSpeechGradingDataToPeerId_forLogType___block_invoke;
  v20[3] = &unk_1E7C265D8;
  v20[4] = self;
  v20[5] = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assistantAudioFileLogDirectory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __62__CSP2PService__sendCoreSpeechGradingDataToPeerId_forLogType___block_invoke_2;
  v17[3] = &unk_1E7C265B0;
  v17[4] = self;
  v18 = v10;
  v19 = v6;
  v15 = v6;
  v16 = v10;
  -[CSP2PService _compressFilesInDirectory:matchingPredicate:compressedFileAvailable:](self, "_compressFilesInDirectory:matchingPredicate:compressedFileAvailable:", v14, v8, v17);

}

- (void)_sendGeckoSpeechLogsToPeerId:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __45__CSP2PService__sendGeckoSpeechLogsToPeerId___block_invoke;
  v18[3] = &unk_1E7C26560;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "geckoAudioLogDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __45__CSP2PService__sendGeckoSpeechLogsToPeerId___block_invoke_2;
  v15[3] = &unk_1E7C265B0;
  v15[4] = self;
  v16 = v8;
  v17 = v4;
  v13 = v4;
  v14 = v8;
  -[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:](self, "_compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:", v12, v6, 1, v15);

}

- (void)_sendCoreSpeechMagusGradingDataToPeerId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  if (CSIsInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_180);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mhLogDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__CSP2PService__sendCoreSpeechMagusGradingDataToPeerId___block_invoke_2;
    v13[3] = &unk_1E7C265B0;
    v13[4] = self;
    v14 = v7;
    v15 = v4;
    v12 = v7;
    -[CSP2PService _compressFilesInDirectory:matchingPredicate:compressedFileAvailable:](self, "_compressFilesInDirectory:matchingPredicate:compressedFileAvailable:", v11, v5, v13);

  }
}

- (void)_sendGradingData:(id)a3 withFileName:(id)a4 toPeerId:(id)a5 withCompressedFlag:(BOOL)a6 withUncompressedDataSize:(unint64_t)a7 withBatchId:(id)a8 withRetainFileFlag:(BOOL)a9 withFilePrefix:(id)a10
{
  id v10;
  uint64_t v11;

  LOBYTE(v11) = a9;
  v10 = -[CSP2PService _sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchId:withRetainFileFlag:withFilePrefix:withCompletion:](self, "_sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchId:withRetainFileFlag:withFilePrefix:withCompletion:", a3, a4, a5, a6, a7, a8, v11, a10, 0);
}

- (id)_sendGradingData:(id)a3 withFileName:(id)a4 toPeerId:(id)a5 withCompressedFlag:(BOOL)a6 withUncompressedDataSize:(unint64_t)a7 withBatchId:(id)a8 withRetainFileFlag:(BOOL)a9 withFilePrefix:(id)a10 withCompletion:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const __CFString *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id WeakRetained;
  id v42;
  id v43;
  void *v44;
  id v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  id v52;
  _BOOL4 v53;
  id v54;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  BOOL v61;
  uint64_t v62;
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[6];
  _QWORD v66[6];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  const __CFString *v70;
  uint64_t v71;

  v53 = a6;
  v71 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a10;
  v20 = a11;
  if (v15 && v16 && v17)
  {
    v51 = a7;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByDeletingLastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v18;
    v50 = v20;
    if (-[CSP2PService isInternalWithoutProfile](self, "isInternalWithoutProfile"))
    {
      objc_msgSend(v16, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = objc_alloc(MEMORY[0x1E0CB37A0]);
      objc_msgSend(v16, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v26, "initWithString:", v27);

      v62 = 0;
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}"), 1, &v62);
      v30 = objc_msgSend(v28, "rangeOfFirstMatchInString:options:range:", v22, 16, 0, objc_msgSend(v22, "length"));
      if (v30 != 0x7FFFFFFFFFFFFFFFLL || v29)
      {
        objc_msgSend(v22, "substringWithRange:", v30, v29);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "dataUsingEncoding:", 4);
        v31 = v21;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSP2PService _sha1:](self, "_sha1:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v31;
        objc_msgSend(v28, "replaceMatchesInString:options:range:withTemplate:", v22, 16, 0, objc_msgSend(v22, "length"), v33);

      }
    }
    v48 = v21;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v19, v22);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingPathComponent:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v65[0] = CFSTR("CSP2P_VoiceFileNameToBeGraded_Key");
    objc_msgSend(v35, "lastPathComponent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v36;
    v65[1] = CFSTR("CSP2P_IsDataCompressed_Key");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v53);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v37;
    v66[2] = v15;
    v65[2] = CFSTR("CSP2P_VoiceDataToBeGraded_Key");
    v65[3] = CFSTR("CSP2P_PeerIdentifier_Key");
    v66[3] = v17;
    v65[4] = CFSTR("CSP2P_UncompressedDataSize_Key");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v51);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v65[5] = CFSTR("CSP2P_GradingBatchTransferID_Key");
    v66[4] = v38;
    v66[5] = v52;
    v54 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v63[0] = CFSTR("CSP2P_CommandType_Key");
    v63[1] = CFSTR("CSP2P_CommandDict_Key");
    v64[0] = CFSTR("com.apple.siridebug.command.transfer.voicegradingdata");
    v64[1] = v39;
    v63[2] = CFSTR("type");
    v64[2] = CFSTR("corespeech");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __160__CSP2PService__sendGradingData_withFileName_toPeerId_withCompressedFlag_withUncompressedDataSize_withBatchId_withRetainFileFlag_withFilePrefix_withCompletion___block_invoke;
    v56[3] = &unk_1E7C26640;
    v57 = v35;
    v61 = a9;
    v58 = v16;
    v60 = v50;
    v42 = v49;
    v59 = v42;
    v43 = v35;
    objc_msgSend(WeakRetained, "sendMessageWithPayload:toPeer:withReply:", v40, v17, v56);

    v44 = v59;
    v45 = v42;
    v20 = v50;
    v25 = v45;

    v15 = v54;
    v18 = v52;

  }
  else
  {
    v23 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v24 = CFSTR("peerId");
      if (v17)
        v24 = CFSTR("unknown");
      if (!v16)
        v24 = CFSTR("fileName");
      if (!v15)
        v24 = CFSTR("fileData");
      *(_DWORD *)buf = 136315394;
      v68 = "-[CSP2PService _sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchI"
            "d:withRetainFileFlag:withFilePrefix:withCompletion:]";
      v69 = 2112;
      v70 = v24;
      _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s %@ is nil - Bailing out", buf, 0x16u);
    }
    if (!v20)
    {
      v25 = 0;
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 3, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v20 + 2))(v20, 0, v22);
    v25 = 0;
  }

LABEL_22:
  return v25;
}

- (void)_receiveParallelRecordingFromPeerId:(id)a3 recordingInfo:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  os_log_t *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  size_t v53;
  void *v54;
  void *v55;
  size_t v56;
  os_log_t v57;
  NSObject *v58;
  void *v59;
  uint8_t *v60;
  uint8_t *v61;
  char v62;
  id v63;
  void *v64;
  void **v65;
  const __CFString **v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint8_t *src_buffer;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  const __CFString *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  uint8_t buf[4];
  const char *v86;
  __int16 v87;
  size_t v88;
  __int16 v89;
  id v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (v8 && v9)
  {
    v11 = (void *)_IDSCopyIDForDeviceUniqueID();
    if (v11)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileRecordedData_Key"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileRemoteFileName_Key"));
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileProfileId_Key"));
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = (void *)v18;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_IsDataCompressed_Key"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileRecordedData_Key"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileProfileId_Key"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
                v23 = objc_claimAutoreleasedReturnValue();
                -[CSP2PService _spIdSiriDebugVoiceProfileRootDirectoryForProfile:locale:](self, "_spIdSiriDebugVoiceProfileRootDirectoryForProfile:locale:", v22, v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                v74 = v24;
                objc_msgSend(v24, "stringByAppendingPathComponent:", CFSTR("remote"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = 0;
                LOBYTE(v23) = objc_msgSend(v26, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v25, 1, 0, &v76);
                v27 = v76;

                if ((v23 & 1) == 0)
                {
                  v48 = *MEMORY[0x1E0D18F60];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v86 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                    v87 = 2112;
                    v88 = (size_t)v27;
                    _os_log_impl(&dword_1C2614000, v48, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: Creating directory failed with error %@", buf, 0x16u);
                  }
                  if (!v10)
                  {
                    v50 = v74;
LABEL_65:

                    goto LABEL_32;
                  }
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 4, 0);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v10[2](v10, 0, v49);
                  v50 = v74;
LABEL_64:

                  goto LABEL_65;
                }
                v28 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileRemoteFileName_Key"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "stringWithFormat:", CFSTR("%@_%@"), v11, v29);
                v30 = objc_claimAutoreleasedReturnValue();

                v72 = (void *)v30;
                objc_msgSend(v25, "stringByAppendingPathComponent:", v30);
                v31 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = (void *)v31;
                LODWORD(v31) = objc_msgSend(v32, "fileExistsAtPath:", v31);

                v33 = (os_log_t *)MEMORY[0x1E0D18F60];
                v34 = *MEMORY[0x1E0D18F60];
                v35 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)v31)
                {
                  if (v35)
                  {
                    v36 = v34;
                    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceFileNameToBeGraded_Key"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315650;
                    v86 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                    v87 = 2112;
                    v88 = (size_t)v37;
                    v89 = 2112;
                    v90 = v11;
                    _os_log_impl(&dword_1C2614000, v36, OS_LOG_TYPE_DEFAULT, "%s Ignoring sync of existing file %@ from %@", buf, 0x20u);

                  }
                  if (!v10)
                  {
                    v50 = v74;
                    v49 = v72;
LABEL_63:

                    goto LABEL_64;
                  }
                  v83 = CFSTR("CSP2P_GradingDataTransferStatus_Key");
                  v84 = &unk_1E7C63B78;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
                  v38 = (id)objc_claimAutoreleasedReturnValue();
                  ((void (**)(id, id, void *))v10)[2](v10, v38, 0);
LABEL_62:
                  v50 = v74;
                  v49 = v72;

                  goto LABEL_63;
                }
                if (v35)
                {
                  *(_DWORD *)buf = 136315650;
                  v86 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                  v87 = 2112;
                  v88 = (size_t)v72;
                  v89 = 2112;
                  v90 = v11;
                  _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_DEFAULT, "%s Syncing parallel recorded audio file - %@ from %@", buf, 0x20u);
                }
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_IsDataCompressed_Key"));
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v51, "BOOLValue");

                if ((v52 & 1) == 0)
                {
                  v57 = *v33;
                  if (os_log_type_enabled(*v33, OS_LOG_TYPE_DEFAULT))
                  {
                    v58 = v57;
                    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_PeerIdentifier_Key"));
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315650;
                    v86 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                    v87 = 2112;
                    v88 = (size_t)v73;
                    v89 = 2112;
                    v90 = v59;
                    _os_log_impl(&dword_1C2614000, v58, OS_LOG_TYPE_DEFAULT, "%s Uncompressed file %@ sent by peer %@", buf, 0x20u);

                  }
                  v38 = v21;
LABEL_52:
                  v75 = v27;
                  v62 = objc_msgSend(v38, "writeToFile:options:error:", v73, 0, &v75);
                  v63 = v75;

                  if ((v62 & 1) != 0)
                  {
                    if (v10)
                    {
                      v77 = CFSTR("CSP2P_VoiceProfileStatus_Key");
                      v78 = &unk_1E7C63B78;
                      v64 = (void *)MEMORY[0x1E0C99D80];
                      v65 = &v78;
                      v66 = &v77;
LABEL_59:
                      objc_msgSend(v64, "dictionaryWithObjects:forKeys:count:", v65, v66, 1);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      ((void (**)(id, void *, void *))v10)[2](v10, v68, v63);
                      v27 = v63;
LABEL_60:

                      goto LABEL_62;
                    }
                  }
                  else
                  {
                    v67 = *MEMORY[0x1E0D18F60];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315650;
                      v86 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                      v87 = 2112;
                      v88 = (size_t)v73;
                      v89 = 2112;
                      v90 = v63;
                      _os_log_impl(&dword_1C2614000, v67, OS_LOG_TYPE_DEFAULT, "%s Writing to file(%@) failed!. Err=%@", buf, 0x20u);
                    }
                    if (v10)
                    {
                      v79 = CFSTR("CSP2P_VoiceProfileStatus_Key");
                      v80 = &unk_1E7C63B90;
                      v64 = (void *)MEMORY[0x1E0C99D80];
                      v65 = &v80;
                      v66 = &v79;
                      goto LABEL_59;
                    }
                  }
                  v27 = v63;
                  goto LABEL_62;
                }
                v53 = objc_msgSend(v21, "length");
                src_buffer = (uint8_t *)objc_msgSend(objc_retainAutorelease(v21), "bytes");
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_UncompressedDataSize_Key"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                if (v54)
                {
                  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_UncompressedDataSize_Key"));
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = objc_msgSend(v55, "integerValue");

                }
                else
                {
                  v56 = 3 * v53;
                }
                v60 = (uint8_t *)malloc_type_malloc(v56, 0x100004077774924uLL);
                if (v60)
                {
                  v61 = v60;
                  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v60, compression_decode_buffer(v60, v56, src_buffer, v53, 0, COMPRESSION_LZFSE));
                  v38 = (id)objc_claimAutoreleasedReturnValue();
                  free(v61);
                  goto LABEL_52;
                }
                v69 = *MEMORY[0x1E0D18F60];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v86 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                  v87 = 2048;
                  v88 = v56;
                  _os_log_error_impl(&dword_1C2614000, v69, OS_LOG_TYPE_ERROR, "%s ERR: Failed to allocate buffer of size %zu, bailing out", buf, 0x16u);
                  if (v10)
                    goto LABEL_68;
                }
                else if (v10)
                {
LABEL_68:
                  v81 = CFSTR("CSP2P_VoiceProfileStatus_Key");
                  v82 = &unk_1E7C63B90;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 10, 0);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (**)(id, void *, void *))v10)[2](v10, v68, v70);

                  v38 = 0;
                  goto LABEL_60;
                }
                v38 = 0;
                goto LABEL_62;
              }
              goto LABEL_27;
            }

          }
        }

      }
LABEL_27:
      v47 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v86 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
        v87 = 2112;
        v88 = (size_t)v9;
        _os_log_impl(&dword_1C2614000, v47, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: received malformed command - %@", buf, 0x16u);
      }
      if (!v10)
        goto LABEL_33;
      v45 = (void *)MEMORY[0x1E0CB35C8];
      v46 = 3;
      goto LABEL_31;
    }
    v42 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      v44 = (void *)MEMORY[0x1C3BC4734](v10);
      *(_DWORD *)buf = 136315906;
      v86 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
      v87 = 2112;
      v88 = (size_t)v8;
      v89 = 2112;
      v90 = v9;
      v91 = 2112;
      v92 = v44;
      _os_log_impl(&dword_1C2614000, v43, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: unknown IDS peer with passed Identifier %@, %@ %@", buf, 0x2Au);

    }
    if (v10)
    {
      v45 = (void *)MEMORY[0x1E0CB35C8];
      v46 = 2;
LABEL_31:
      objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), v46, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v21);
LABEL_32:

      goto LABEL_33;
    }
    v11 = 0;
LABEL_33:

    goto LABEL_34;
  }
  v39 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v40 = v39;
    v41 = (void *)MEMORY[0x1C3BC4734](v10);
    *(_DWORD *)buf = 136315906;
    v86 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
    v87 = 2112;
    v88 = (size_t)v9;
    v89 = 2112;
    v90 = v8;
    v91 = 2112;
    v92 = v41;
    _os_log_impl(&dword_1C2614000, v40, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: received malformed command - %@ %@ %@", buf, 0x2Au);

  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v11);
    goto LABEL_33;
  }
LABEL_34:

}

- (void)_receiveVoiceGradingDataFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  char v38;
  size_t v39;
  const uint8_t *v40;
  void *v41;
  void *v42;
  size_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  uint8_t *v48;
  uint8_t *v49;
  int v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  void *v56;
  int v57;
  objc_class *v58;
  NSString *voiceTriggerBatchId;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSString *voiceIdentificationBatchId;
  void *v67;
  uint64_t v68;
  void *v69;
  objc_class *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  uint8_t buf[4];
  const char *v93;
  __int16 v94;
  size_t v95;
  __int16 v96;
  id v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (v8 && v9)
  {
    v11 = (void *)_IDSCopyIDForDeviceUniqueID();
    if (v11)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceDataToBeGraded_Key"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceFileNameToBeGraded_Key"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceDataToBeGraded_Key"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSP2PService _spIdSiriDebugGradingDataRootDirectory](self, "_spIdSiriDebugGradingDataRootDirectory");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceFileNameToBeGraded_Key"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@_%@"), v11, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "stringByAppendingPathComponent:", v19);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = (void *)v20;
          LODWORD(v20) = objc_msgSend(v21, "fileExistsAtPath:", v20);

          v22 = *MEMORY[0x1E0D18F60];
          v23 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v20)
          {
            if (v23)
            {
              v24 = v22;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceFileNameToBeGraded_Key"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v93 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
              v94 = 2112;
              v95 = (size_t)v25;
              v96 = 2112;
              v97 = v11;
              _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s Ignoring sync of existing file %@ from %@", buf, 0x20u);

            }
            v26 = v81;
            if (!v10)
              goto LABEL_67;
            v80 = v19;
            v90 = CFSTR("CSP2P_GradingDataTransferStatus_Key");
            v91 = &unk_1E7C63B78;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v10[2](v10, v27, 0);
LABEL_66:

            v19 = v80;
LABEL_67:

            goto LABEL_68;
          }
          if (v23)
          {
            *(_DWORD *)buf = 136315650;
            v93 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
            v94 = 2112;
            v95 = (size_t)v19;
            v96 = 2112;
            v97 = v11;
            _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s Syncing audio file - %@ from %@", buf, 0x20u);
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_IsDataCompressed_Key"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "BOOLValue");

          v79 = v16;
          v80 = v19;
          if ((v38 & 1) == 0)
          {
            v44 = (void *)*MEMORY[0x1E0D18F60];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
            {
              v45 = v44;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_PeerIdentifier_Key"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v93 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
              v94 = 2112;
              v95 = (size_t)v81;
              v96 = 2112;
              v97 = v46;
              _os_log_impl(&dword_1C2614000, v45, OS_LOG_TYPE_DEFAULT, "%s Uncompressed file %@ sent by peer %@", buf, 0x20u);

            }
            v47 = v15;
            goto LABEL_36;
          }
          v39 = objc_msgSend(v15, "length");
          v40 = (const uint8_t *)objc_msgSend(objc_retainAutorelease(v15), "bytes");
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_UncompressedDataSize_Key"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_UncompressedDataSize_Key"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "integerValue");

          }
          else
          {
            v43 = 3 * v39;
          }
          v48 = (uint8_t *)malloc_type_malloc(v43, 0x100004077774924uLL);
          if (v48)
          {
            v49 = v48;
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v48, compression_decode_buffer(v48, v43, v40, v39, 0, COMPRESSION_LZFSE));
            v47 = (id)objc_claimAutoreleasedReturnValue();
            free(v49);
            v16 = v79;
LABEL_36:
            v83 = 0;
            v26 = v81;
            v50 = objc_msgSend(v47, "writeToFile:options:error:", v81, 0, &v83);
            v78 = v83;
            if (v50)
            {
              v77 = v47;
              objc_msgSend(v81, "pathExtension");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v81;
              v53 = objc_msgSend(v51, "isEqualToString:", CFSTR("wav"));

              if (v53)
              {
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceFileNameToBeGraded_Key"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".wav"), &stru_1E7C296E8);
                v76 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_GradingBatchTransferID_Key"));
                v55 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "lastPathComponent");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = objc_msgSend(v56, "containsString:", kMetaFilenameWithPrefixAlmost);

                if (v57)
                {
                  v58 = (objc_class *)v55;
                  if (v55
                    && (voiceTriggerBatchId = self->_voiceTriggerBatchId) != 0
                    && -[NSString isEqualToString:](voiceTriggerBatchId, "isEqualToString:", v55))
                  {
                    v60 = (void *)v76;
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.siri.SiriDebug.RemoteNearMissGradingTrigger"), CFSTR("suppressnotification"), v76);
                  }
                  else
                  {
                    v60 = (void *)v76;
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.siri.SiriDebug.RemoteNearMissGradingTrigger"), v76, v75);
                  }
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v68 = 32;
                }
                else
                {
                  v58 = (objc_class *)v55;
                  if (v55
                    && (voiceIdentificationBatchId = self->_voiceIdentificationBatchId) != 0
                    && -[NSString isEqualToString:](voiceIdentificationBatchId, "isEqualToString:", v55))
                  {
                    v60 = (void *)v76;
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.siri.SiriDebug.SpeakerVoiceGradingTrigger"), CFSTR("suppressnotification"), v76);
                  }
                  else
                  {
                    v60 = (void *)v76;
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.siri.SiriDebug.SpeakerVoiceGradingTrigger"), v76, v75);
                  }
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v68 = 40;
                }
                v69 = *(Class *)((char *)&self->super.isa + v68);
                *(Class *)((char *)&self->super.isa + v68) = v58;
                v70 = v58;

                +[CSSiriDebugConnection launchSiriDebugAppWithMessage:](CSSiriDebugConnection, "launchSiriDebugAppWithMessage:", v67);
                v52 = v81;
              }
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0CB2AC0], *MEMORY[0x1E0CB2AD8]);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = 0;
              objc_msgSend(v71, "setAttributes:ofItemAtPath:error:", v72, v52, &v82);
              v73 = v82;

              v27 = v78;
              if (v73)
              {
                v74 = *MEMORY[0x1E0D18F60];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v93 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
                  v94 = 2112;
                  v95 = (size_t)v81;
                  v96 = 2112;
                  v97 = v78;
                  _os_log_impl(&dword_1C2614000, v74, OS_LOG_TYPE_DEFAULT, "%s Error setting remoteP2Plog file to NSFileProtectionCompleteUntilFirstUserAuthentication. file=%@ Err=%@", buf, 0x20u);
                }
              }

              v16 = v79;
              v26 = v81;
              v47 = v77;
              if (!v10)
                goto LABEL_65;
            }
            else
            {
              v61 = *MEMORY[0x1E0D18F60];
              v27 = v78;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v93 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
                v94 = 2112;
                v95 = (size_t)v81;
                v96 = 2112;
                v97 = v78;
                _os_log_impl(&dword_1C2614000, v61, OS_LOG_TYPE_DEFAULT, "%s Writing to file(%@) failed!. Err=%@", buf, 0x20u);
              }
              if (!v10)
                goto LABEL_65;
              v86 = CFSTR("CSP2P_GradingDataTransferStatus_Key");
              v87 = &unk_1E7C63BA8;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(id, void *, id))v10)[2](v10, v62, v78);

            }
            v84 = CFSTR("CSP2P_GradingDataTransferStatus_Key");
            v85 = &unk_1E7C63B78;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(id, void *, void *))v10)[2](v10, v64, v27);
            goto LABEL_64;
          }
          v63 = *MEMORY[0x1E0D18F60];
          v16 = v79;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v93 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
            v94 = 2048;
            v95 = v43;
            _os_log_error_impl(&dword_1C2614000, v63, OS_LOG_TYPE_ERROR, "%s ERR: Failed to allocate buffer of size %zu, bailing out", buf, 0x16u);
            if (v10)
              goto LABEL_49;
          }
          else if (v10)
          {
LABEL_49:
            v88 = CFSTR("CSP2P_VoiceProfileStatus_Key");
            v89 = &unk_1E7C63B90;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 10, 0);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(id, void *, void *))v10)[2](v10, v64, v65);

            v47 = 0;
            v27 = 0;
            v26 = v81;
LABEL_64:

LABEL_65:
            goto LABEL_66;
          }
          v47 = 0;
          v27 = 0;
          v26 = v81;
          goto LABEL_65;
        }
      }
      v31 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v93 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
        v94 = 2112;
        v95 = (size_t)v9;
        _os_log_impl(&dword_1C2614000, v31, OS_LOG_TYPE_DEFAULT, "%s received malformed command - %@", buf, 0x16u);
      }
      if (!v10)
        goto LABEL_69;
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = 3;
LABEL_23:
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), v33, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v15);
LABEL_68:

      goto LABEL_69;
    }
    v34 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      v36 = (void *)MEMORY[0x1C3BC4734](v10);
      *(_DWORD *)buf = 136315906;
      v93 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
      v94 = 2112;
      v95 = (size_t)v8;
      v96 = 2112;
      v97 = v9;
      v98 = 2112;
      v99 = v36;
      _os_log_impl(&dword_1C2614000, v35, OS_LOG_TYPE_DEFAULT, "%s unknown IDS peer with passed Identifier %@, %@ %@", buf, 0x2Au);

    }
    if (v10)
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = 2;
      goto LABEL_23;
    }
    v11 = 0;
LABEL_69:

    goto LABEL_70;
  }
  v28 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v29 = v28;
    v30 = (void *)MEMORY[0x1C3BC4734](v10);
    *(_DWORD *)buf = 136315906;
    v93 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
    v94 = 2112;
    v95 = (size_t)v9;
    v96 = 2112;
    v97 = v8;
    v98 = 2112;
    v99 = v30;
    _os_log_impl(&dword_1C2614000, v29, OS_LOG_TYPE_DEFAULT, "%s received malformed command - %@ %@ %@", buf, 0x2Au);

  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v11);
    goto LABEL_69;
  }
LABEL_70:

}

- (void)_receiveVoiceProfileFromPeerId:(id)a3 voiceProfileInfo:(id)a4 withReply:(id)a5
{
  uint64_t (*v8)(uint64_t, uint64_t);
  id v9;
  void (**v10)(id, void *, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  size_t v23;
  id v24;
  const uint8_t *v25;
  void *v26;
  void *v27;
  size_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t *v42;
  uint8_t *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  char v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  BOOL v61;
  void *v62;
  void *v63;
  uint64_t v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  _BOOL4 v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  NSObject *v83;
  dispatch_time_t v84;
  void *v85;
  id v86;
  void *v87;
  NSObject *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  _QWORD v101[4];
  NSObject *v102;
  _BYTE *v103;
  id v104;
  id v105;
  id obj;
  const __CFString *v107;
  void *v108;
  const __CFString *v109;
  void *v110;
  _QWORD v111[2];
  _QWORD v112[2];
  uint64_t v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  const __CFString *v117;
  void *v118;
  const __CFString *v119;
  void *v120;
  uint8_t v121[4];
  const char *v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  uint64_t v126;
  const __CFString *v127;
  void *v128;
  _BYTE buf[24];
  uint64_t (*v130)(uint64_t, uint64_t);
  _BYTE v131[20];
  __int16 v132;
  void *v133;
  __int16 v134;
  void *v135;
  __int16 v136;
  void *v137;
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v9 = a4;
  v10 = (void (**)(id, void *, void *))a5;
  v100 = v8;
  if (!v8 || !v9)
  {
    v29 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      v31 = (void *)MEMORY[0x1C3BC4734](v10);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v130 = v100;
      *(_WORD *)v131 = 2112;
      *(_QWORD *)&v131[2] = v31;
      _os_log_impl(&dword_1C2614000, v30, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: received malformed command - %@ %@ %@", buf, 0x2Au);

    }
    if (v10)
      goto LABEL_26;
    goto LABEL_28;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileData_Key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileFileName_Key"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileSpeakerName_Key"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileDataType_Key"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileTotalSegments_Key"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileSegment_Key"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                v18 = (void *)*MEMORY[0x1E0D18F60];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                {
                  v19 = v18;
                  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileSegment_Key"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileTotalSegments_Key"));
                  v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v20;
                  *(_WORD *)&buf[22] = 2112;
                  v130 = v21;
                  *(_WORD *)v131 = 2112;
                  *(_QWORD *)&v131[2] = v100;
                  _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: Received VoiceProfile Segment (%@/%@) from peerId %@", buf, 0x2Au);

                }
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileData_Key"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "length");

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileData_Key"));
                v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v25 = (const uint8_t *)objc_msgSend(v24, "bytes");

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_UncompressedDataSize_Key"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (v26)
                {
                  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_UncompressedDataSize_Key"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v27, "integerValue");

                }
                else
                {
                  v28 = 3 * v23;
                }
                v42 = (uint8_t *)malloc_type_malloc(v28, 0x100004077774924uLL);
                v43 = v42;
                if (!v42)
                {
                  v88 = *MEMORY[0x1E0D18F60];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    *(_WORD *)&buf[12] = 2048;
                    *(_QWORD *)&buf[14] = v28;
                    _os_log_error_impl(&dword_1C2614000, v88, OS_LOG_TYPE_ERROR, "%s ERR: Failed to allocate buffer of size %zu, bailing out", buf, 0x16u);
                    if (!v10)
                      goto LABEL_28;
                  }
                  else if (!v10)
                  {
                    goto LABEL_28;
                  }
                  v127 = CFSTR("CSP2P_VoiceProfileStatus_Key");
                  v128 = &unk_1E7C63B90;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 10, 0);
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  v10[2](v10, v41, v89);

                  goto LABEL_27;
                }
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v42, compression_decode_buffer(v42, v28, v25, v23, 0, COMPRESSION_LZFSE));
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                free(v43);
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x3032000000;
                v130 = __Block_byref_object_copy__14637;
                *(_QWORD *)v131 = __Block_byref_object_dispose__14638;
                *(_QWORD *)&v131[8] = 0;
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "temporaryDirectory");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "URLByAppendingPathComponent:", CFSTR("CoreSpeechCache"));
                v97 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "URLByAppendingPathComponent:", v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileProfileId_Key"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "URLByAppendingPathComponent:", v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                v98 = v49;
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileDataType_Key"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "URLByAppendingPathComponent:", v50);
                v99 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileSegment_Key"));
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v49) = objc_msgSend(v51, "integerValue") == 1;

                if ((_DWORD)v49)
                {
                  _receiveVoiceProfileFromPeerId_voiceProfileInfo_withReply__filesReceived = 0;
                  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v99, "path");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = *(_QWORD *)&buf[8];
                  obj = *(id *)(*(_QWORD *)&buf[8] + 40);
                  v55 = objc_msgSend(v52, "removeItemAtPath:error:", v53, &obj);
                  objc_storeStrong((id *)(v54 + 40), obj);

                  if ((v55 & 1) == 0)
                  {
                    v56 = (id)*MEMORY[0x1E0D18F60];
                    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v99, "path");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      v58 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
                      *(_DWORD *)v121 = 136315650;
                      v122 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                      v123 = 2112;
                      v124 = v57;
                      v125 = 2112;
                      v126 = v58;
                      _os_log_impl(&dword_1C2614000, v56, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: Failed to delete the directory %@ with error %@", v121, 0x20u);

                    }
                  }
                }
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileSegment_Key"));
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend(v59, "integerValue");
                v61 = v60 == _receiveVoiceProfileFromPeerId_voiceProfileInfo_withReply__filesReceived + 1;

                if (!v61)
                {
                  v90 = (id)*MEMORY[0x1E0D18F60];
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileSegment_Key"));
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v121 = 136315650;
                    v122 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    v123 = 2112;
                    v124 = v91;
                    v125 = 1024;
                    LODWORD(v126) = _receiveVoiceProfileFromPeerId_voiceProfileInfo_withReply__filesReceived + 1;
                    _os_log_impl(&dword_1C2614000, v90, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: received VoiceProfileSegment %@, expected %d", v121, 0x1Cu);

                  }
                  if (!v10)
                    goto LABEL_65;
                  v119 = CFSTR("CSP2P_VoiceProfileStatus_Key");
                  v120 = &unk_1E7C63B90;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 4, 0);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v10[2](v10, v72, v75);
                  goto LABEL_63;
                }
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "path");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = *(_QWORD *)&buf[8];
                v105 = *(id *)(*(_QWORD *)&buf[8] + 40);
                v65 = objc_msgSend(v62, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v63, 1, 0, &v105);
                objc_storeStrong((id *)(v64 + 40), v105);

                if ((v65 & 1) == 0)
                {
                  v92 = *MEMORY[0x1E0D18F60];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                  {
                    v93 = *(void **)(*(_QWORD *)&buf[8] + 40);
                    *(_DWORD *)v121 = 136315394;
                    v122 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    v123 = 2112;
                    v124 = v93;
                    _os_log_impl(&dword_1C2614000, v92, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: Creating directory failed with error %@", v121, 0x16u);
                  }
                  if (!v10)
                    goto LABEL_65;
                  v117 = CFSTR("CSP2P_VoiceProfileStatus_Key");
                  v118 = &unk_1E7C63B90;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 4, 0);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v10[2](v10, v72, v75);
                  goto LABEL_63;
                }
                objc_msgSend(v99, "URLByAppendingPathComponent:", CFSTR("audio"));
                v66 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v66, "path");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                -[CSP2PService _createDirectoryIfDoesNotExist:](self, "_createDirectoryIfDoesNotExist:", v67);

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileFileName_Key"));
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "URLByAppendingPathComponent:", v68);
                v99 = (void *)objc_claimAutoreleasedReturnValue();

                if ((objc_msgSend(v41, "writeToURL:atomically:", v99, 0) & 1) == 0)
                {
                  v94 = *MEMORY[0x1E0D18F60];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v121 = 136315138;
                    v122 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    _os_log_impl(&dword_1C2614000, v94, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: Writing to file failed!!!", v121, 0xCu);
                  }
                  if (!v10)
                    goto LABEL_65;
                  v115 = CFSTR("CSP2P_VoiceProfileStatus_Key");
                  v116 = &unk_1E7C63B90;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 4, 0);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v10[2](v10, v72, v75);
                  goto LABEL_63;
                }
                ++_receiveVoiceProfileFromPeerId_voiceProfileInfo_withReply__filesReceived;
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileTotalSegments_Key"));
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = objc_msgSend(v69, "integerValue");
                v71 = v70 == _receiveVoiceProfileFromPeerId_voiceProfileInfo_withReply__filesReceived;

                if (!v71)
                {
                  if (!v10)
                    goto LABEL_65;
                  v107 = CFSTR("CSP2P_VoiceProfileStatus_Key");
                  v108 = &unk_1E7C63BA8;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v10[2](v10, v72, 0);
LABEL_64:

LABEL_65:
                  _Block_object_dispose(buf, 8);

                  goto LABEL_27;
                }
                _receiveVoiceProfileFromPeerId_voiceProfileInfo_withReply__filesReceived = 0;
                objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = (void *)objc_msgSend(v73, "newVoiceProfileWithLocale:withAppDomain:", v74, *MEMORY[0x1E0DA8C78]);

                v76 = objc_alloc(MEMORY[0x1E0DA8C30]);
                v113 = *MEMORY[0x1E0DA8CA8];
                v114 = v75;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = *(_QWORD *)&buf[8];
                v104 = *(id *)(*(_QWORD *)&buf[8] + 40);
                v79 = (void *)objc_msgSend(v76, "initWithVoiceRetrainingContext:error:", v77, &v104);
                objc_storeStrong((id *)(v78 + 40), v104);

                if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
                  goto LABEL_44;
                objc_msgSend(v98, "URLByAppendingPathComponent:", CFSTR("tdti"));
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "URLByAppendingPathComponent:", CFSTR("audio"));
                v96 = (void *)objc_claimAutoreleasedReturnValue();

                -[CSP2PService _getContentsOfDirectory:](self, "_getContentsOfDirectory:", v96);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = dispatch_group_create();
                dispatch_group_enter(v82);
                v101[0] = MEMORY[0x1E0C809B0];
                v101[1] = 3221225472;
                v101[2] = __74__CSP2PService__receiveVoiceProfileFromPeerId_voiceProfileInfo_withReply___block_invoke;
                v101[3] = &unk_1E7C27A80;
                v103 = buf;
                v83 = v82;
                v102 = v83;
                objc_msgSend(v72, "addUtterances:toProfile:withContext:withCompletion:", v81, v75, v79, v101);
                v84 = dispatch_time(0, 8000000000);
                dispatch_group_wait(v83, v84);
                if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
                {
                  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileSpeakerName_Key"));
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v86 = (id)objc_msgSend(v72, "updateVoiceProfile:withUserName:", v75, v85);

                }
                if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
                {
LABEL_44:
                  if (!v10)
                  {
LABEL_47:

LABEL_63:
                    goto LABEL_64;
                  }
                  v109 = CFSTR("CSP2P_VoiceProfileStatus_Key");
                  v110 = &unk_1E7C63B90;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  v10[2](v10, v87, *(void **)(*(_QWORD *)&buf[8] + 40));
                }
                else
                {
                  notify_post("com.apple.siri.corespeech.voiceprofilelist.change");
                  if (!v10)
                    goto LABEL_47;
                  v111[0] = CFSTR("CSP2P_VoiceProfileStatus_Key");
                  v111[1] = CFSTR("CSP2P_VoiceProfileProfileId_Key");
                  v112[0] = &unk_1E7C63B78;
                  objc_msgSend(v75, "profileID");
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  v112[1] = v87;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  v10[2](v10, v95, 0);

                }
                goto LABEL_47;
              }
              goto LABEL_23;
            }

          }
        }

      }
    }

  }
LABEL_23:
  v32 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileData_Key"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileFileName_Key"));
    v35 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileSpeakerName_Key"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileDataType_Key"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileTotalSegments_Key"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileSegment_Key"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316930;
    *(_QWORD *)&buf[4] = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v34;
    *(_WORD *)&buf[22] = 2112;
    v130 = v35;
    *(_WORD *)v131 = 2112;
    *(_QWORD *)&v131[2] = v36;
    *(_WORD *)&v131[10] = 2112;
    *(_QWORD *)&v131[12] = v37;
    v132 = 2112;
    v133 = v38;
    v134 = 2112;
    v135 = v39;
    v136 = 2112;
    v137 = v40;
    _os_log_impl(&dword_1C2614000, v33, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileTransferCmd: received malformed command: CSP2P_VoiceProfileData_Key: %@CSP2P_VoiceProfileFileName_Key: %@CSP2P_VoiceProfileSpeakerName_Key: %@CSP2P_VoiceProfileLocale_Key: %@CSP2P_VoiceProfileDataType_Key: %@CSP2P_VoiceProfileTotalSegments_Key: %@CSP2P_VoiceProfileSegment_Key: %@", buf, 0x52u);

  }
  if (v10)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 3, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v41);
LABEL_27:

  }
LABEL_28:

}

- (void)_processVoiceProfileDeleteCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__CSP2PService__processVoiceProfileDeleteCommandWithRequest_fromSenderID_withReply___block_invoke;
  block[3] = &unk_1E7C28EC8;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, block);

}

- (void)_processGradingDataFetchCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
  -[CSP2PService _processGradingDataFetchCommandWithRequest:ofLogType:fromSenderID:withReply:](self, "_processGradingDataFetchCommandWithRequest:ofLogType:fromSenderID:withReply:", a3, 0, a4, a5);
}

- (void)_processGradingDataFetchCommandWithRequest:(id)a3 ofLogType:(unint64_t)a4 fromSenderID:(id)a5 withReply:(id)a6
{
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  NSObject *v15;
  void *v16;
  CSP2PService *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSP2PService.m"), 1325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peerId"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);

  if (WeakRetained)
  {
    if (v13)
      (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
    switch(a4)
    {
      case 0uLL:
        -[CSP2PService _sendVoiceTriggerGradingDataToPeerId:](self, "_sendVoiceTriggerGradingDataToPeerId:", v12);
        -[CSP2PService _sendCoreSpeechGradingDataToPeerId:](self, "_sendCoreSpeechGradingDataToPeerId:", v12);
        -[CSP2PService _sendCoreSpeechMagusGradingDataToPeerId:](self, "_sendCoreSpeechMagusGradingDataToPeerId:", v12);
        -[CSP2PService _sendAcousticGradingDataToPeerId:](self, "_sendAcousticGradingDataToPeerId:", v12);
        goto LABEL_8;
      case 1uLL:
        -[CSP2PService _sendVoiceTriggerGradingDataToPeerId:](self, "_sendVoiceTriggerGradingDataToPeerId:", v12);
        break;
      case 2uLL:
        -[CSP2PService _sendCoreSpeechGradingDataToPeerId:](self, "_sendCoreSpeechGradingDataToPeerId:", v12);
        break;
      case 3uLL:
        -[CSP2PService _sendCoreSpeechMagusGradingDataToPeerId:](self, "_sendCoreSpeechMagusGradingDataToPeerId:", v12);
        break;
      case 4uLL:
        -[CSP2PService _sendAcousticGradingDataToPeerId:](self, "_sendAcousticGradingDataToPeerId:", v12);
        break;
      case 5uLL:
LABEL_8:
        -[CSP2PService _sendGeckoSpeechLogsToPeerId:](self, "_sendGeckoSpeechLogsToPeerId:", v12);
        break;
      case 6uLL:
        v17 = self;
        v18 = v12;
        v19 = 1;
        goto LABEL_21;
      case 7uLL:
        v17 = self;
        v18 = v12;
        v19 = 2;
        goto LABEL_21;
      case 8uLL:
        goto LABEL_20;
      case 9uLL:
        -[CSP2PService _sendVoiceTriggerGradingDataToPeerId:](self, "_sendVoiceTriggerGradingDataToPeerId:", v12);
LABEL_20:
        v17 = self;
        v18 = v12;
        v19 = 3;
LABEL_21:
        -[CSP2PService _sendCoreSpeechGradingDataToPeerId:forLogType:](v17, "_sendCoreSpeechGradingDataToPeerId:forLogType:", v18, v19);
        break;
      default:
        break;
    }
  }
  else
  {
    v15 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CSP2PService _processGradingDataFetchCommandWithRequest:ofLogType:fromSenderID:withReply:]";
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Cannot send data across when _adCompanionServiceProvider is nil - returning", buf, 0xCu);
    }
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 3, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v16);

    }
  }

}

- (void)_processVoiceProfileListQueryCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void (**v56)(id, _QWORD, void *);
  id v57;
  id v58;
  uint64_t v60;
  _QWORD v61[4];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if ((CSIsHorseman() & 1) == 0)
  {
    v43 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v69 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      v70 = 2112;
      v71 = v7;
      _os_log_error_impl(&dword_1C2614000, v43, OS_LOG_TYPE_ERROR, "%s ERR: Rejecting command %@ sent to non Horseman device", buf, 0x16u);
      if (!v9)
        goto LABEL_49;
    }
    else if (!v9)
    {
      goto LABEL_49;
    }
    v44 = (void *)MEMORY[0x1E0CB35C8];
    v45 = 2;
LABEL_39:
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), v45, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v10);
    goto LABEL_48;
  }
  if (!v7 || !v8)
  {
    v46 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v69 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      v70 = 2112;
      v71 = v7;
      v72 = 2112;
      v73 = v8;
      _os_log_error_impl(&dword_1C2614000, v46, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command - %@ %@", buf, 0x20u);
      if (!v9)
        goto LABEL_49;
    }
    else if (!v9)
    {
      goto LABEL_49;
    }
    v44 = (void *)MEMORY[0x1E0CB35C8];
    v45 = 3;
    goto LABEL_39;
  }
  v10 = (void *)_IDSCopyIDForDeviceUniqueID();
  if (!v10)
  {
    v47 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v51 = v47;
      v52 = (void *)MEMORY[0x1C3BC4734](v9);
      *(_DWORD *)buf = 136315906;
      v69 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      v70 = 2112;
      v71 = v7;
      v72 = 2112;
      v73 = v52;
      v74 = 2112;
      v75 = v8;
      _os_log_error_impl(&dword_1C2614000, v51, OS_LOG_TYPE_ERROR, "%s ERR: unknown IDS peer with passed Identifier %@, %@ %@", buf, 0x2Au);

      if (v9)
        goto LABEL_42;
    }
    else if (v9)
    {
LABEL_42:
      v48 = (void *)MEMORY[0x1E0CB35C8];
      v49 = 2;
      goto LABEL_46;
    }
    v10 = 0;
    goto LABEL_48;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v50 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v69 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      v70 = 2112;
      v71 = v8;
      _os_log_error_impl(&dword_1C2614000, v50, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command with locale nil - %@", buf, 0x16u);
      if (!v9)
        goto LABEL_48;
    }
    else if (!v9)
    {
      goto LABEL_48;
    }
    v48 = (void *)MEMORY[0x1E0CB35C8];
    v49 = 3;
LABEL_46:
    objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), v49, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v12);
    goto LABEL_47;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "provisionedVoiceProfilesForLocale:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_32;
  v54 = v12;
  v55 = v10;
  v56 = v9;
  v57 = v8;
  v58 = v7;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v53 = v14;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (!v17)
    goto LABEL_31;
  v18 = v17;
  v19 = *(_QWORD *)v64;
  v60 = *MEMORY[0x1E0DA8C70];
  do
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v64 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
      v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v21, "sharedSiriId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v21, "sharedSiriId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("CSP2P_VoiceProfileSiriProfileId_Key"));

      }
      objc_msgSend(v21, "profileId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v21, "profileId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("CSP2P_VoiceProfileProfileId_Key"));

      }
      objc_msgSend(v21, "appDomain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v21, "appDomain");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("CSP2P_VoiceProfileAppDomain_Key"));

      }
      objc_msgSend(v21, "dateAdded");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v30 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v30, "setDateFormat:", CFSTR("yyyyMMddHHmmss"));
        objc_msgSend(v21, "dateAdded");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringFromDate:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("CSP2P_VoiceProfileOnboardTimeStamp_Key"));

      }
      objc_msgSend(v21, "homeId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v21, "homeId");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v34, CFSTR("CSP2P_VoiceProfileHomeUserId_Key"));
      }
      else
      {
        objc_msgSend(v21, "appDomain");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isEqualToString:", v60);

        if (!v36)
          goto LABEL_25;
        objc_msgSend(v21, "sharedSiriId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __85__CSP2PService__processVoiceProfileListQueryCommandFromPeerId_requestInfo_withReply___block_invoke;
        v61[3] = &unk_1E7C26678;
        v62 = v22;
        -[CSP2PService _getHomeUserIdForSharedSiriId:withCompletion:](self, "_getHomeUserIdForSharedSiriId:withCompletion:", v37, v61);

        v34 = v62;
      }

LABEL_25:
      objc_msgSend(v21, "userName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(v21, "userName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v39, CFSTR("CSP2P_VoiceProfileSpeakerName_Key"));

      }
      objc_msgSend(v21, "languageCode");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        objc_msgSend(v21, "languageCode");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v41, CFSTR("CSP2P_VoiceProfileLocale_Key"));

      }
      objc_msgSend(v15, "addObject:", v22);

    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  }
  while (v18);
LABEL_31:

  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v15, CFSTR("voiceprofiles"), 0);
  v9 = v56;
  ((void (**)(id, void *, void *))v56)[2](v56, v42, 0);

  v8 = v57;
  v7 = v58;
  v12 = v54;
  v10 = v55;
  v14 = v53;
LABEL_32:

LABEL_47:
LABEL_48:

LABEL_49:
}

- (void)_getHomeUserIdForSharedSiriId:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  os_log_t *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__14637;
  v33 = __Block_byref_object_dispose__14638;
  v34 = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0D190C0]);
  v8 = objc_alloc_init(MEMORY[0x1E0CFE920]);
  v9 = (os_log_t *)MEMORY[0x1E0D18F60];
  v10 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[CSP2PService _getHomeUserIdForSharedSiriId:withCompletion:]";
    v39 = 2114;
    v40 = v5;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Fetching homeUserId for siriProfileId %{public}@", buf, 0x16u);
  }
  objc_msgSend(v7, "enter");
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __61__CSP2PService__getHomeUserIdForSharedSiriId_withCompletion___block_invoke;
  v23 = &unk_1E7C266A0;
  v11 = v8;
  v24 = v11;
  v28 = &v29;
  v12 = v5;
  v25 = v12;
  v13 = v7;
  v26 = v13;
  v14 = v6;
  v27 = v14;
  objc_msgSend(v11, "getHomeUserIdForSharedUserId:completion:", v12, &v20);
  if (objc_msgSend(v13, "waitWithTimeout:", dispatch_time(0, 100000000)))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("homeUserId query for siriProfileId %@ timedout !"), v12, v20, v21, v22, v23, v24, v25, v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v36 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 701, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[CSP2PService _getHomeUserIdForSharedSiriId:withCompletion:]";
      v39 = 2112;
      v40 = v15;
      _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
      if (!v14)
        goto LABEL_7;
    }
    else if (!v14)
    {
LABEL_7:

      goto LABEL_8;
    }
    (*((void (**)(id, uint64_t, void *))v14 + 2))(v14, v30[5], v18);
    goto LABEL_7;
  }
LABEL_8:

  _Block_object_dispose(&v29, 8);
}

- (void)_processFetchVoiceProfileCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  _BYTE v32[24];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);

  if (!WeakRetained)
  {
    v18 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 136315138;
      *(_QWORD *)&v32[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
      _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Cannot send data across when _adCompanionServiceProvider is nil - returning", v32, 0xCu);
    }
    if (!v10)
      goto LABEL_24;
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = 9;
LABEL_22:
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), v20, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v12);
    goto LABEL_23;
  }
  if ((CSIsHorseman() & 1) == 0)
  {
    v21 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v32 = 136315394;
      *(_QWORD *)&v32[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
      *(_WORD *)&v32[12] = 2112;
      *(_QWORD *)&v32[14] = v8;
      _os_log_error_impl(&dword_1C2614000, v21, OS_LOG_TYPE_ERROR, "%s ERR: Rejecting command %@ sent to non Horseman device", v32, 0x16u);
      if (!v10)
        goto LABEL_24;
    }
    else if (!v10)
    {
      goto LABEL_24;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = 2;
    goto LABEL_22;
  }
  if (v8 && v9)
  {
    v12 = (void *)_IDSCopyIDForDeviceUniqueID();
    if (v12)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileProfileId_Key"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileProfileId_Key"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "voiceProfileForId:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            if (v10)
              v10[2](v10, 0, 0);
            -[CSP2PService _sendVoiceProfile:toPeerId:](self, "_sendVoiceProfile:toPeerId:", v17, v8);
            goto LABEL_39;
          }
          v28 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v32 = 136315394;
            *(_QWORD *)&v32[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
            *(_WORD *)&v32[12] = 2112;
            *(_QWORD *)&v32[14] = v15;
            _os_log_error_impl(&dword_1C2614000, v28, OS_LOG_TYPE_ERROR, "%s ERR: Failed to find voice profile with identifier - %@", v32, 0x16u);
            if (!v10)
              goto LABEL_39;
          }
          else if (!v10)
          {
LABEL_39:

            goto LABEL_40;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 11, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, 0, v29);

          goto LABEL_39;
        }
        v26 = *MEMORY[0x1E0D18F60];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
        {
LABEL_31:
          if (v10)
          {
LABEL_32:
            v24 = (void *)MEMORY[0x1E0CB35C8];
            v25 = 3;
            goto LABEL_33;
          }
LABEL_23:

          goto LABEL_24;
        }
        *(_DWORD *)v32 = 136315394;
        *(_QWORD *)&v32[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
        *(_WORD *)&v32[12] = 2112;
        *(_QWORD *)&v32[14] = v9;
        v27 = "%s ERR: received malformed command with profileId nil - %@";
      }
      else
      {
        v26 = *MEMORY[0x1E0D18F60];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        *(_DWORD *)v32 = 136315394;
        *(_QWORD *)&v32[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
        *(_WORD *)&v32[12] = 2112;
        *(_QWORD *)&v32[14] = v9;
        v27 = "%s ERR: received malformed command with locale nil - %@";
      }
      _os_log_error_impl(&dword_1C2614000, v26, OS_LOG_TYPE_ERROR, v27, v32, 0x16u);
      if (!v10)
        goto LABEL_23;
      goto LABEL_32;
    }
    v23 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v30 = v23;
      v31 = (void *)MEMORY[0x1C3BC4734](v10);
      *(_DWORD *)v32 = 136315906;
      *(_QWORD *)&v32[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
      *(_WORD *)&v32[12] = 2112;
      *(_QWORD *)&v32[14] = v8;
      *(_WORD *)&v32[22] = 2112;
      v33 = v31;
      v34 = 2112;
      v35 = v9;
      _os_log_error_impl(&dword_1C2614000, v30, OS_LOG_TYPE_ERROR, "%s ERR: unknown IDS peer with passed Identifier %@, %@ %@", v32, 0x2Au);

      if (v10)
        goto LABEL_27;
    }
    else if (v10)
    {
LABEL_27:
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = 2;
LABEL_33:
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), v25, 0, *(_OWORD *)v32, *(_QWORD *)&v32[16]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v15);
LABEL_40:

      goto LABEL_23;
    }
    v12 = 0;
    goto LABEL_23;
  }
  v22 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v32 = 136315650;
    *(_QWORD *)&v32[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
    *(_WORD *)&v32[12] = 2112;
    *(_QWORD *)&v32[14] = v8;
    *(_WORD *)&v32[22] = 2112;
    v33 = v9;
    _os_log_error_impl(&dword_1C2614000, v22, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command - %@ %@", v32, 0x20u);
    if (!v10)
      goto LABEL_24;
    goto LABEL_21;
  }
  if (v10)
  {
LABEL_21:
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = 3;
    goto LABEL_22;
  }
LABEL_24:

}

- (void)_sendVoiceProfile:(id)a3 toPeerId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id WeakRetained;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id obj;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[5];
  id v58;
  id v59;
  CSP2PService *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[5];
  id v66;
  id v67;
  _QWORD v68[3];
  _QWORD v69[3];
  _BYTE v70[128];
  _QWORD v71[4];
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v54 = a4;
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Caches/VoiceTrigger/SATUpdate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "siriProfileId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("_%d_%d_%@"), 2, 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "locale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  objc_msgSend(v16, "contentsOfDirectoryAtPath:error:", v15, &v67);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v67;

  if (!v18 && objc_msgSend(v17, "count"))
    goto LABEL_24;

  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "siriProfileId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("_%d_%d_%@"), 5, 1, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "locale");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByAppendingPathComponent:", v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend(v24, "contentsOfDirectoryAtPath:error:", v15, &v66);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v66;

  v17 = (void *)v25;
  if (!v26)
  {
LABEL_24:
    if (objc_msgSend(v17, "count"))
    {
      v50 = v17;
      v51 = v9;
      objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("td/audio"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("tdti/audio"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("ti/audio"));
      v29 = objc_claimAutoreleasedReturnValue();
      v71[0] = v15;
      v71[1] = v27;
      v71[2] = v28;
      v71[3] = v29;
      v49 = (void *)v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __43__CSP2PService__sendVoiceProfile_toPeerId___block_invoke;
      v65[3] = &unk_1E7C26560;
      v65[4] = self;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v65);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        v32 = v31;
        objc_msgSend(v6, "profileID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v73 = "-[CSP2PService _sendVoiceProfile:toPeerId:]";
        v74 = 2114;
        v75 = v33;
        _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileFetchCmd: Transferring voice profile %{public}@", buf, 0x16u);

      }
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      obj = v30;
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v62 != v36)
              objc_enumerationMutation(obj);
            v38 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __43__CSP2PService__sendVoiceProfile_toPeerId___block_invoke_258;
            v57[3] = &unk_1E7C266F0;
            v57[4] = v38;
            v58 = v6;
            v59 = v54;
            v60 = self;
            -[CSP2PService _compressFilesInDirectory:matchingPredicate:compressedFileAvailable:](self, "_compressFilesInDirectory:matchingPredicate:compressedFileAvailable:", v39, v53, v57);

          }
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        }
        while (v35);
      }

      v40 = objc_alloc(MEMORY[0x1E0C99E08]);
      objc_msgSend(v6, "profileID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locale");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v40, "initWithObjectsAndKeys:", v54, CFSTR("CSP2P_PeerIdentifier_Key"), v41, CFSTR("CSP2P_VoiceProfileProfileId_Key"), v42, CFSTR("CSP2P_VoiceProfileLocale_Key"), MEMORY[0x1E0C9AAB0], CFSTR("CSP2P_VoiceProfileTransferCompleted_Key"), 0);

      v68[0] = CFSTR("CSP2P_CommandType_Key");
      v68[1] = CFSTR("CSP2P_CommandDict_Key");
      v69[0] = CFSTR("com.apple.siridebug.command.reverse.transfer.voiceprofile");
      v69[1] = v43;
      v68[2] = CFSTR("type");
      v69[2] = CFSTR("corespeech");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "siriProfileId");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend(v6, "siriProfileId");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKey:", v46, CFSTR("CSP2P_VoiceProfileSiriProfileId_Key"));

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __43__CSP2PService__sendVoiceProfile_toPeerId___block_invoke_260;
      v55[3] = &unk_1E7C266C8;
      v56 = v6;
      objc_msgSend(WeakRetained, "sendMessageWithPayload:toPeer:withReply:", v44, v54, v55);

      v26 = 0;
      v9 = v51;
      v17 = v50;
      goto LABEL_21;
    }
    v26 = 0;
  }
  v48 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v73 = "-[CSP2PService _sendVoiceProfile:toPeerId:]";
    v74 = 2112;
    v75 = v15;
    v76 = 2112;
    v77 = v26;
    _os_log_impl(&dword_1C2614000, v48, OS_LOG_TYPE_DEFAULT, "%s Cannot read contents of directory: %@, err: %@", buf, 0x20u);
  }
LABEL_21:

}

- (void)_processReverseTransferVoiceProfileCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  int v48;
  void *v49;
  size_t v50;
  void *v51;
  void *v52;
  size_t v53;
  void *v54;
  size_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  uint8_t *v61;
  uint8_t *v62;
  char v63;
  void *v64;
  void **v65;
  const __CFString **v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint8_t *src_buffer;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  const __CFString *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  uint8_t buf[4];
  const char *v86;
  __int16 v87;
  size_t v88;
  __int16 v89;
  id v90;
  __int16 v91;
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!CSIsHorseman())
  {
    if (!v8 || !v9)
    {
      v17 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v86 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
        v87 = 2112;
        v88 = (size_t)v8;
        v89 = 2112;
        v90 = v9;
        _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command - %@ %@", buf, 0x20u);
        if (!v10)
          goto LABEL_77;
      }
      else if (!v10)
      {
        goto LABEL_77;
      }
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = 3;
      goto LABEL_14;
    }
    v14 = (void *)_IDSCopyIDForDeviceUniqueID();
    if (v14)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileProfileId_Key"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {

          goto LABEL_23;
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileSiriProfileId_Key"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
LABEL_23:
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileProfileId_Key"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileSiriProfileId_Key"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileTransferCompleted_Key"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "BOOLValue");

          if (v26)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.siri.SiriDebug.VoiceProfileAddedTrigger"), v24, v22);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[CSSiriDebugConnection launchSiriDebugAppWithMessage:](CSSiriDebugConnection, "launchSiriDebugAppWithMessage:", v27);
            if (v10)
              (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
            goto LABEL_38;
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileRelativeFilePath_Key"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
          {
            v41 = *MEMORY[0x1E0D18F60];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v86 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              v87 = 2112;
              v88 = (size_t)v9;
              _os_log_error_impl(&dword_1C2614000, v41, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command with relative path nil - %@", buf, 0x16u);
              if (!v10)
                goto LABEL_74;
            }
            else if (!v10)
            {
LABEL_74:

              goto LABEL_75;
            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 3, 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v27);
LABEL_38:

            goto LABEL_74;
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileRelativeFilePath_Key"));
          v29 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileData_Key"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v24;
          -[CSP2PService _spIdSiriDebugVoiceProfileCacheDirectoryForProfile:locale:](self, "_spIdSiriDebugVoiceProfileCacheDirectoryForProfile:locale:", v24, v22);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = (void *)v29;
          objc_msgSend(v75, "stringByAppendingPathComponent:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringByDeletingLastPathComponent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = 0;
          LOBYTE(v29) = objc_msgSend(v31, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v32, 1, 0, &v78);
          v76 = v78;

          if ((v29 & 1) == 0)
          {
            v35 = v30;
            v43 = *MEMORY[0x1E0D18F60];
            v37 = v76;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v86 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              v87 = 2112;
              v88 = (size_t)v76;
              v38 = "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: Creating directory failed with error %@";
              v39 = v43;
              v40 = 22;
              goto LABEL_45;
            }
LABEL_46:
            v44 = v72;
            v45 = v73;
            if (!v10)
            {
LABEL_73:

              v24 = v74;
              goto LABEL_74;
            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 4, 0);
            v46 = (id)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v46);
LABEL_72:

            goto LABEL_73;
          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "fileExistsAtPath:", v30);

          v35 = v30;
          if (v34)
          {
            v36 = *MEMORY[0x1E0D18F60];
            v37 = v76;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v86 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              v87 = 2112;
              v88 = (size_t)v35;
              v89 = 2112;
              v90 = v14;
              v38 = "%s Ignoring sync of existing file %@ from %@";
              v39 = v36;
              v40 = 32;
LABEL_45:
              _os_log_impl(&dword_1C2614000, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);
              goto LABEL_46;
            }
            goto LABEL_46;
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_IsDataCompressed_Key"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "BOOLValue");

          v49 = v76;
          if ((v48 & 1) != 0)
          {
            v45 = v73;
            v50 = objc_msgSend(v73, "length");
            src_buffer = (uint8_t *)objc_msgSend(objc_retainAutorelease(v73), "bytes");
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_UncompressedDataSize_Key"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            v52 = v35;
            if (v51)
            {
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_UncompressedDataSize_Key"));
              v53 = v50;
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "integerValue");

              v50 = v53;
            }
            else
            {
              v55 = 3 * v50;
            }
            v61 = (uint8_t *)malloc_type_malloc(v55, 0x100004077774924uLL);
            if (!v61)
            {
              v69 = *MEMORY[0x1E0D18F60];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v86 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
                v87 = 2048;
                v88 = v55;
                _os_log_error_impl(&dword_1C2614000, v69, OS_LOG_TYPE_ERROR, "%s ERR: Failed to allocate buffer of size %zu, bailing out", buf, 0x16u);
              }
              v44 = v72;
              if (!v10)
              {
                v46 = 0;
                goto LABEL_70;
              }
              v83 = CFSTR("CSP2P_VoiceProfileStatus_Key");
              v84 = &unk_1E7C63B90;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 10, 0);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *, void *))v10 + 2))(v10, v68, v70);

              v46 = 0;
LABEL_69:

LABEL_70:
              v35 = v52;
              v37 = v76;
              goto LABEL_72;
            }
            v62 = v61;
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v61, compression_decode_buffer(v61, v55, src_buffer, v50, 0, COMPRESSION_LZFSE));
            v46 = (id)objc_claimAutoreleasedReturnValue();
            free(v62);
            v35 = v52;
            v49 = v76;
          }
          else
          {
            v58 = (void *)*MEMORY[0x1E0D18F60];
            v45 = v73;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
            {
              v59 = v58;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CSP2P_PeerIdentifier_Key"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v86 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              v87 = 2112;
              v88 = (size_t)v35;
              v89 = 2112;
              v90 = v60;
              _os_log_impl(&dword_1C2614000, v59, OS_LOG_TYPE_DEFAULT, "%s Uncompressed file %@ sent by peer %@", buf, 0x20u);

            }
            v46 = v73;
          }
          v77 = v49;
          v63 = objc_msgSend(v46, "writeToFile:options:error:", v35, 0, &v77);
          v76 = v77;

          if ((v63 & 1) != 0)
          {
            if (v10)
            {
              v52 = v35;
              v79 = CFSTR("CSP2P_VoiceProfileStatus_Key");
              v80 = &unk_1E7C63B78;
              v64 = (void *)MEMORY[0x1E0C99D80];
              v65 = &v80;
              v66 = &v79;
LABEL_68:
              objc_msgSend(v64, "dictionaryWithObjects:forKeys:count:", v65, v66, 1);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *, id))v10 + 2))(v10, v68, v76);
              v44 = v72;
              goto LABEL_69;
            }
          }
          else
          {
            v67 = *MEMORY[0x1E0D18F60];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v86 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              v87 = 2112;
              v88 = (size_t)v35;
              v89 = 2112;
              v90 = v76;
              _os_log_impl(&dword_1C2614000, v67, OS_LOG_TYPE_DEFAULT, "%s Writing to file(%@) failed!. Err=%@", buf, 0x20u);
            }
            if (v10)
            {
              v52 = v35;
              v81 = CFSTR("CSP2P_VoiceProfileStatus_Key");
              v82 = &unk_1E7C63B90;
              v64 = (void *)MEMORY[0x1E0C99D80];
              v65 = &v82;
              v66 = &v81;
              goto LABEL_68;
            }
          }
          v37 = v76;
          v44 = v72;
          goto LABEL_72;
        }
        v21 = *MEMORY[0x1E0D18F60];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
          goto LABEL_19;
        *(_DWORD *)buf = 136315394;
        v86 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
        v87 = 2112;
        v88 = (size_t)v9;
        v42 = "%s ERR: received malformed command with profileId nil - %@";
      }
      else
      {
        v21 = *MEMORY[0x1E0D18F60];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
        {
LABEL_19:
          if (!v10)
            goto LABEL_76;
          v19 = (void *)MEMORY[0x1E0CB35C8];
          v20 = 3;
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136315394;
        v86 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
        v87 = 2112;
        v88 = (size_t)v9;
        v42 = "%s ERR: received malformed command with locale nil - %@";
      }
      _os_log_error_impl(&dword_1C2614000, v21, OS_LOG_TYPE_ERROR, v42, buf, 0x16u);
      goto LABEL_19;
    }
    v18 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v56 = v18;
      v57 = (void *)MEMORY[0x1C3BC4734](v10);
      *(_DWORD *)buf = 136315906;
      v86 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
      v87 = 2112;
      v88 = (size_t)v8;
      v89 = 2112;
      v90 = v57;
      v91 = 2112;
      v92 = v9;
      _os_log_error_impl(&dword_1C2614000, v56, OS_LOG_TYPE_ERROR, "%s ERR: unknown IDS peer with passed Identifier %@, %@ %@", buf, 0x2Au);

      if (v10)
        goto LABEL_17;
    }
    else if (v10)
    {
LABEL_17:
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = 2;
LABEL_21:
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), v20, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v22);
LABEL_75:

      goto LABEL_76;
    }
    v14 = 0;
    goto LABEL_76;
  }
  v11 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v86 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
    v87 = 2112;
    v88 = (size_t)v8;
    _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s ERR: Rejecting command %@ sent to Horseman device", buf, 0x16u);
    if (!v10)
      goto LABEL_77;
    goto LABEL_4;
  }
  if (v10)
  {
LABEL_4:
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 2;
LABEL_14:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);
LABEL_76:

  }
LABEL_77:

}

- (void)_processVoiceProfileUpdateTriggerFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!CSIsHorseman())
  {
    if (!v7 || !v8)
    {
      v20 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v27 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
        v28 = 2112;
        v29 = v7;
        v30 = 2112;
        v31 = v8;
        _os_log_error_impl(&dword_1C2614000, v20, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command - %@ %@", buf, 0x20u);
        if (!v9)
          goto LABEL_26;
      }
      else if (!v9)
      {
        goto LABEL_26;
      }
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = 3;
      goto LABEL_16;
    }
    v13 = _IDSCopyIDForDeviceUniqueID();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileTransferCompleted_Key"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLValue");

        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.siri.SiriDebug.VoiceProfileSyncTrigger"), v14, v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[CSSiriDebugConnection launchSiriDebugAppWithMessage:](CSSiriDebugConnection, "launchSiriDebugAppWithMessage:", v19);

        }
        if (v9)
          (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
      }
      else
      {
        v23 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
          v28 = 2112;
          v29 = v8;
          _os_log_error_impl(&dword_1C2614000, v23, OS_LOG_TYPE_ERROR, "%s ERR: received malformed command with locale nil - %@", buf, 0x16u);
          if (!v9)
            goto LABEL_25;
        }
        else if (!v9)
        {
          goto LABEL_25;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 3, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v16);
      }

      goto LABEL_25;
    }
    v21 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v24 = v21;
      v25 = (void *)MEMORY[0x1C3BC4734](v9);
      *(_DWORD *)buf = 136315906;
      v27 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
      v28 = 2112;
      v29 = v7;
      v30 = 2112;
      v31 = v25;
      v32 = 2112;
      v33 = v8;
      _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s ERR: unknown IDS peer with passed Identifier %@, %@ %@", buf, 0x2Au);

      if (!v9)
        goto LABEL_20;
    }
    else if (!v9)
    {
LABEL_20:
      v14 = 0;
      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 2, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v22);

    goto LABEL_20;
  }
  v10 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
    v28 = 2112;
    v29 = v7;
    _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Rejecting command %@ sent to Horseman device", buf, 0x16u);
    if (!v9)
      goto LABEL_26;
    goto LABEL_4;
  }
  if (v9)
  {
LABEL_4:
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = 2;
LABEL_16:
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v14);
LABEL_25:

  }
LABEL_26:

}

- (void)_sendVoiceProfileUpdateTriggerToPeerId:(id)a3 forLocale:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17[0] = CFSTR("CSP2P_PeerIdentifier_Key");
  v17[1] = CFSTR("CSP2P_VoiceProfileLocale_Key");
  v18[0] = v6;
  v18[1] = a4;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("CSP2P_CommandType_Key");
  v15[1] = CFSTR("CSP2P_CommandDict_Key");
  v16[0] = CFSTR("com.apple.siridebug.command.voiceprofile.update.trigger");
  v16[1] = v9;
  v15[2] = CFSTR("type");
  v16[2] = CFSTR("corespeech");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__CSP2PService__sendVoiceProfileUpdateTriggerToPeerId_forLocale___block_invoke;
  v13[3] = &unk_1E7C266C8;
  v14 = v6;
  v12 = v6;
  objc_msgSend(WeakRetained, "sendMessageWithPayload:toPeer:withReply:", v10, v12, v13);

}

- (void)_sendAcousticGradingDataToPeerId:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__CSP2PService__sendAcousticGradingDataToPeerId___block_invoke;
  v18[3] = &unk_1E7C26560;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assistantAudioFileLogDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __49__CSP2PService__sendAcousticGradingDataToPeerId___block_invoke_2;
  v15[3] = &unk_1E7C265B0;
  v15[4] = self;
  v16 = v8;
  v17 = v4;
  v13 = v4;
  v14 = v8;
  -[CSP2PService _compressFilesInDirectory:matchingPredicate:compressedFileAvailable:](self, "_compressFilesInDirectory:matchingPredicate:compressedFileAvailable:", v12, v6, v15);

}

- (id)_speakerRecognitionAudioLogsGradingDir
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSP2PService__speakerRecognitionAudioLogsGradingDir__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  if (_speakerRecognitionAudioLogsGradingDir_onceToken != -1)
    dispatch_once(&_speakerRecognitionAudioLogsGradingDir_onceToken, block);
  return (id)_speakerRecognitionAudioLogsGradingDir_ssrAudioGradingDir;
}

- (void)_createDirectoryIfDoesNotExist:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  int v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v18 = 0;
  if (v3)
  {
    v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v18);
    if (v6)
      v7 = v18 == 0;
    else
      v7 = 1;
    if (v7)
    {
      if (v18)
        v8 = 0;
      else
        v8 = v6;
      v9 = (os_log_t *)MEMORY[0x1E0D18F50];
      if (v8 == 1)
      {
        v10 = *MEMORY[0x1E0D18F50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
          v21 = 2112;
          v22 = v3;
          _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Direntry with same name exists, this will be removed: %@", buf, 0x16u);
        }
        objc_msgSend(v5, "removeItemAtPath:error:", v3, 0);
      }
      v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
        v21 = 2112;
        v22 = v3;
        _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Creating Directory : %@", buf, 0x16u);
      }
      v17 = 0;
      objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v17);
      v12 = v17;
      if (v12)
      {
        v13 = *v9;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          objc_msgSend(v12, "localizedDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v20 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
          v21 = 2112;
          v22 = v15;
          _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Creating Directory failed : %@", buf, 0x16u);

        }
      }

    }
  }
  else
  {
    v16 = *MEMORY[0x1E0D18F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s path is nil - Bailing out", buf, 0xCu);
    }
  }

}

- (id)_spIdSiriDebugVTDataDirectory
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteP2pLogDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSP2PService _createDirectoryIfDoesNotExist:](self, "_createDirectoryIfDoesNotExist:", v4);
  return v4;
}

- (id)_spIdSiriDebugGradingDataRootDirectory
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteGradingDataDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSP2PService _createDirectoryIfDoesNotExist:](self, "_createDirectoryIfDoesNotExist:", v4);
  return v4;
}

- (id)_spIdSiriDebugVoiceProfileStoreRootDirectory
{
  void *v2;
  void *v3;

  -[CSP2PService _spIdSiriDebugVTDataDirectory](self, "_spIdSiriDebugVTDataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("VoiceProfileStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CSP2PService _spIdSiriDebugVoiceProfileStoreRootDirectory](self, "_spIdSiriDebugVoiceProfileStoreRootDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_spIdSiriDebugTrainedUsersFilePathForLocale:(id)a3
{
  void *v3;
  void *v4;

  -[CSP2PService _spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:](self, "_spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("trained_users.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_spIdSiriDebugVoiceProfileRootDirectoryForProfile:(id)a3 locale:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CSP2PService _spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:](self, "_spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_spIdSiriDebugVoiceProfileCacheDirectoryForProfile:(id)a3 locale:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[CSP2PService _spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:](self, "_spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Caches"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_getContentsOfDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v5, 0, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  if (v7)
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    *(_DWORD *)buf = 136315650;
    v17 = "-[CSP2PService _getContentsOfDirectory:]";
    v18 = 2112;
    v19 = v3;
    v20 = 2112;
    v21 = v7;
    v12 = "%s Error reading directory at %@: err: %@";
    v13 = v8;
    v14 = 32;
LABEL_10:
    _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_3;
  }
  if (objc_msgSend(v6, "count"))
  {
    v9 = v6;
    goto LABEL_6;
  }
  v11 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSP2PService _getContentsOfDirectory:]";
    v18 = 2112;
    v19 = v3;
    v12 = "%s %@ is empty";
    v13 = v11;
    v14 = 22;
    goto LABEL_10;
  }
LABEL_3:
  v9 = 0;
LABEL_6:

  return v9;
}

- (BOOL)isHeadlessDeviceDataCollectionModeEnabled
{
  void *v3;
  char v4;

  if ((CSIsInternalBuild() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isP2PTransferEnabled");

  return v4;
}

- (BOOL)isInternalWithoutProfile
{
  void *v2;
  int v3;

  if (CSIsInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isP2PTransferEnabled") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)_sha1:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  CC_SHA1((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);

  return v4;
}

- (BOOL)shouldTransferVoiceTriggerLogFileWithURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("wav"));

  if (v5)
  {
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("wav"), CFSTR("json"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR(".wav");
    v11 = CFSTR("-synced.json");
  }
  else
  {
    objc_msgSend(v3, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("json"));

    if (!v13)
    {
      v17 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v3, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("json"), CFSTR("wav"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR(".json");
    v11 = CFSTR("-synced.wav");
  }
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "fileExistsAtPath:", v7) & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "fileExistsAtPath:", v15);

  }
LABEL_10:

  return v17;
}

- (BOOL)fileURL:(id)a3 matchesFileNamePattern:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v15;
  uint64_t v17;

  v5 = (objc_class *)MEMORY[0x1E0CB38E8];
  v6 = a4;
  v7 = a3;
  v17 = 0;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithPattern:options:error:", v6, 1, &v17);

  objc_msgSend(v7, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "rangeOfFirstMatchInString:options:range:", v9, 16, 0, objc_msgSend(v10, "length"));
  v13 = v12;

  v15 = v11 != 0x7FFFFFFFFFFFFFFFLL || v13 != 0;
  return v15;
}

- (CSADCompanionServiceProvider)adCompanionServiceProvider
{
  return (CSADCompanionServiceProvider *)objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
}

- (void)setAdCompanionServiceProvider:(id)a3
{
  objc_storeWeak((id *)&self->_adCompanionServiceProvider, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)lastCommunicatedPeer
{
  return self->_lastCommunicatedPeer;
}

- (void)setLastCommunicatedPeer:(id)a3
{
  objc_storeStrong((id *)&self->_lastCommunicatedPeer, a3);
}

- (NSString)voiceTriggerBatchId
{
  return self->_voiceTriggerBatchId;
}

- (void)setVoiceTriggerBatchId:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerBatchId, a3);
}

- (NSString)voiceIdentificationBatchId
{
  return self->_voiceIdentificationBatchId;
}

- (void)setVoiceIdentificationBatchId:(id)a3
{
  objc_storeStrong((id *)&self->_voiceIdentificationBatchId, a3);
}

- (OS_dispatch_semaphore)sema
{
  return self->_sema;
}

- (void)setSema:(id)a3
{
  objc_storeStrong((id *)&self->_sema, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sema, 0);
  objc_storeStrong((id *)&self->_voiceIdentificationBatchId, 0);
  objc_storeStrong((id *)&self->_voiceTriggerBatchId, 0);
  objc_storeStrong((id *)&self->_lastCommunicatedPeer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_adCompanionServiceProvider);
}

void __54__CSP2PService__speakerRecognitionAudioLogsGradingDir__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Logs/CoreSpeech/spid/grading"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_speakerRecognitionAudioLogsGradingDir_ssrAudioGradingDir;
  _speakerRecognitionAudioLogsGradingDir_ssrAudioGradingDir = v5;

  objc_msgSend(*(id *)(a1 + 32), "_createDirectoryIfDoesNotExist:", _speakerRecognitionAudioLogsGradingDir_ssrAudioGradingDir);
}

uint64_t __49__CSP2PService__sendAcousticGradingDataToPeerId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;

  v3 = a2;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-SL.json"), &stru_1E7C296E8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsString:", *MEMORY[0x1E0D192E0]);

  if ((v7 & 1) != 0)
    goto LABEL_2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("-synced.wav"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "fileExistsAtPath:", v10))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(".wav"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

    if (!v13)
      goto LABEL_2;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isInternalWithoutProfile") & 1) != 0
    || (objc_msgSend(v3, "pathExtension"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("wav")),
        v14,
        (v15 & 1) != 0))
  {
    v8 = 1;
    goto LABEL_9;
  }
LABEL_2:
  v8 = 0;
LABEL_9:

  return v8;
}

void __49__CSP2PService__sendAcousticGradingDataToPeerId___block_invoke_2(_QWORD *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a7;
  if (v15)
  {
    v16 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "-[CSP2PService _sendAcousticGradingDataToPeerId:]_block_invoke_2";
      v37 = 2114;
      v38 = (uint64_t)v13;
      v39 = 2114;
      v40 = v15;
      _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s Failed in compressing %{public}@ with errror %{public}@ - Bailing out", buf, 0x20u);
    }
  }
  else
  {
    v17 = *(NSObject **)(a1[4] + 48);
    v18 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v17, v18);
    v19 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v13, "lastPathComponent");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = a1[5];
      v36 = "-[CSP2PService _sendAcousticGradingDataToPeerId:]_block_invoke";
      v24 = CFSTR("OFF");
      v37 = 2112;
      *(_DWORD *)buf = 136316162;
      if ((_DWORD)a6)
        v24 = CFSTR("ON");
      v38 = v21;
      v39 = 2114;
      v40 = v24;
      v41 = 2048;
      v42 = a5;
      v43 = 2114;
      v44 = v23;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Transfering grading file %@ withCompression %{public}@ and size %ld in batch %{public}@", buf, 0x34u);

    }
    v26 = a1[5];
    v25 = a1[6];
    v27 = (void *)a1[4];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __49__CSP2PService__sendAcousticGradingDataToPeerId___block_invoke_264;
    v32[3] = &unk_1E7C26588;
    v28 = v13;
    v29 = a1[4];
    v33 = v28;
    v34 = v29;
    LOBYTE(v31) = 1;
    v30 = (id)objc_msgSend(v27, "_sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchId:withRetainFileFlag:withFilePrefix:withCompletion:", v14, v28, v25, a6, a4, v26, v31, &stru_1E7C296E8, v32);

  }
}

void __49__CSP2PService__sendAcousticGradingDataToPeerId___block_invoke_264(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0D18F60];
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v11, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSP2PService _sendAcousticGradingDataToPeerId:]_block_invoke";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Grading log file failed to transfer for file %@ in task %@", (uint8_t *)&v12, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSP2PService _sendAcousticGradingDataToPeerId:]_block_invoke";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Grading log file successfully transfered for file %@ in task %@", (uint8_t *)&v12, 0x20u);
LABEL_4:

  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 48));

}

void __65__CSP2PService__sendVoiceProfileUpdateTriggerToPeerId_forLocale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 136315650;
      v10 = "-[CSP2PService _sendVoiceProfileUpdateTriggerToPeerId:forLocale:]_block_invoke";
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed in sending trigger for Voice profile update to peer %@ with error %@", (uint8_t *)&v9, 0x20u);
    }
  }

}

uint64_t __43__CSP2PService__sendVoiceProfile_toPeerId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  int v6;
  char v7;
  uint64_t v8;
  void *v9;
  char v10;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isInternalWithoutProfile");
  objc_msgSend(v3, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("wav"));
  v7 = v6;
  if (!v4)
  {

    if ((v7 & 1) != 0)
      goto LABEL_5;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  if (!v6)
  {
    objc_msgSend(v3, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("json"));

    if ((v10 & 1) != 0)
      goto LABEL_5;
    goto LABEL_7;
  }

LABEL_5:
  v8 = 1;
LABEL_8:

  return v8;
}

void __43__CSP2PService__sendVoiceProfile_toPeerId___block_invoke_258(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id WeakRetained;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[3];
  _QWORD v48[3];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  _BYTE v54[14];
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a7;
  v16 = *MEMORY[0x1E0D18F60];
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v50 = "-[CSP2PService _sendVoiceProfile:toPeerId:]_block_invoke";
      v51 = 2114;
      v52 = v13;
      v53 = 2114;
      *(_QWORD *)v54 = v15;
      _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s Failed in compressing %{public}@ with errror %{public}@ - Bailing out", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v50 = "-[CSP2PService _sendVoiceProfile:toPeerId:]_block_invoke";
      v51 = 2112;
      v52 = v13;
      v53 = 1024;
      *(_DWORD *)v54 = a6;
      *(_WORD *)&v54[4] = 2048;
      *(_QWORD *)&v54[6] = a5;
      v55 = 2112;
      v56 = 0;
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s CSP2P_VoiceProfileFetchCmd: File %@ isCompressed: %d, compressedSize: %ld, err: %@", buf, 0x30u);
    }
    v43 = v14;
    objc_msgSend(v13, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringByDeletingLastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v17;
    v42 = v19;
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("meta_version.json")) & 1) != 0
      || objc_msgSend(v17, "isEqualToString:", CFSTR("enrollment_version.json")))
    {
      v20 = v17;
    }
    else
    {
      objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("audio"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingPathComponent:", v17);
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v13, "stringByDeletingLastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "profileID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqualToString:", v24);

    if (v25)
    {
      v26 = v44;

      v20 = v26;
    }
    v27 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "locale");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v29;
    v14 = v43;
    v32 = (void *)objc_msgSend(v27, "initWithObjectsAndKeys:", v20, CFSTR("CSP2P_VoiceProfileRelativeFilePath_Key"), v28, CFSTR("CSP2P_IsDataCompressed_Key"), v43, CFSTR("CSP2P_VoiceProfileData_Key"), v41, CFSTR("CSP2P_PeerIdentifier_Key"), v30, CFSTR("CSP2P_UncompressedDataSize_Key"), v31, CFSTR("CSP2P_VoiceProfileLocale_Key"), 0);

    v47[0] = CFSTR("CSP2P_CommandType_Key");
    v47[1] = CFSTR("CSP2P_CommandDict_Key");
    v48[0] = CFSTR("com.apple.siridebug.command.reverse.transfer.voiceprofile");
    v48[1] = v32;
    v47[2] = CFSTR("type");
    v48[2] = CFSTR("corespeech");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "siriProfileId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(*(id *)(a1 + 40), "siriProfileId");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKey:", v35, CFSTR("CSP2P_VoiceProfileSiriProfileId_Key"));

    }
    objc_msgSend(*(id *)(a1 + 40), "locale");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(*(id *)(a1 + 40), "locale");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKey:", v37, CFSTR("CSP2P_VoiceProfileLocale_Key"));

    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + 8));
    v39 = *(_QWORD *)(a1 + 48);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __43__CSP2PService__sendVoiceProfile_toPeerId___block_invoke_259;
    v45[3] = &unk_1E7C266C8;
    v46 = v20;
    v40 = v20;
    objc_msgSend(WeakRetained, "sendMessageWithPayload:toPeer:withReply:", v33, v39, v45);

  }
}

void __43__CSP2PService__sendVoiceProfile_toPeerId___block_invoke_260(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0D18F60];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      v10 = v7;
      objc_msgSend(v9, "profileID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315650;
      v17 = "-[CSP2PService _sendVoiceProfile:toPeerId:]_block_invoke";
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      v12 = "%s CSP2P_VoiceProfileReverseTransferCmd: Failed transferring voice profile %@ with error %@";
      v13 = v10;
      v14 = 32;
LABEL_6:
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);

    }
  }
  else if (v8)
  {
    v15 = *(void **)(a1 + 32);
    v10 = v7;
    objc_msgSend(v15, "profileID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315394;
    v17 = "-[CSP2PService _sendVoiceProfile:toPeerId:]_block_invoke";
    v18 = 2112;
    v19 = v11;
    v12 = "%s CSP2P_VoiceProfileReverseTransferCmd: Successfully transferred voice profile %@";
    v13 = v10;
    v14 = 22;
    goto LABEL_6;
  }

}

void __43__CSP2PService__sendVoiceProfile_toPeerId___block_invoke_259(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F60];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v13 = 136315650;
      v14 = "-[CSP2PService _sendVoiceProfile:toPeerId:]_block_invoke";
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      v9 = "%s CSP2P_VoiceProfileReverseTransferCmd: Failed VoiceProfileTransfer: %@, error %@";
      v10 = v7;
      v11 = 32;
LABEL_6:
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
  }
  else if (v8)
  {
    v12 = *(void **)(a1 + 32);
    v13 = 136315394;
    v14 = "-[CSP2PService _sendVoiceProfile:toPeerId:]_block_invoke";
    v15 = 2112;
    v16 = v12;
    v9 = "%s CSP2P_VoiceProfileReverseTransferCmd: Successfully transferred %@";
    v10 = v7;
    v11 = 22;
    goto LABEL_6;
  }

}

void __61__CSP2PService__getHomeUserIdForSharedSiriId_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = *(id *)(a1 + 32);
  if (v7)
  {
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v15 = 136315651;
      v16 = "-[CSP2PService _getHomeUserIdForSharedSiriId:withCompletion:]_block_invoke";
      v17 = 2114;
      v18 = v10;
      v19 = 2113;
      v20 = v7;
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Home User Id erred %{public}@ for Siri Profile Id %{private}@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v15 = 136315650;
      v16 = "-[CSP2PService _getHomeUserIdForSharedSiriId:withCompletion:]_block_invoke";
      v17 = 2114;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s siriProfileId %{public}@ maps to homeUserId %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "leave");
  v14 = *(_QWORD *)(a1 + 56);
  if (v14)
    (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v7);

}

uint64_t __85__CSP2PService__processVoiceProfileListQueryCommandFromPeerId_requestInfo_withReply___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setObject:forKeyedSubscript:", a2, CFSTR("CSP2P_VoiceProfileHomeUserId_Key"));
  return result;
}

void __84__CSP2PService__processVoiceProfileDeleteCommandWithRequest_fromSenderID_withReply___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v1 = a1;
  v56 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2 && *(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileProfileId_Key"));
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = (void *)*MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(void **)(v1 + 32);
          v8 = v6;
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileProfileId_Key"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = *(_QWORD *)(v1 + 40);
          *(_DWORD *)buf = 136315650;
          v49 = "-[CSP2PService _processVoiceProfileDeleteCommandWithRequest:fromSenderID:withReply:]_block_invoke";
          v50 = 2112;
          v51 = v9;
          v52 = 2112;
          v53 = v10;
          _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Received request to delete VoiceProfile %@ from peerId %@", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileLocale_Key"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "provisionedVoiceProfilesForLocale:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (!v15)
        {
          v27 = 0;
          v29 = v14;
          goto LABEL_32;
        }
        v16 = v15;
        v40 = v11;
        v42 = 0;
        v17 = *(_QWORD *)v44;
        v18 = *MEMORY[0x1E0DA8C78];
        v41 = *MEMORY[0x1E0DA8C78];
        while (1)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v44 != v17)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v20, "appDomain");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v21, "isEqualToString:", v18))
              goto LABEL_16;
            v22 = v17;
            v23 = v1;
            objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", CFSTR("CSP2P_VoiceProfileProfileId_Key"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "profileId");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "isEqualToString:", v25);

            if (v26)
            {
              v18 = v41;
              v21 = v42;
              v42 = v20;
              v1 = v23;
              v17 = v22;
LABEL_16:

              continue;
            }
            v1 = v23;
            v17 = v22;
            v18 = v41;
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          if (!v16)
          {

            v27 = v42;
            if (v42)
            {
              objc_msgSend(v42, "profileId");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v40;
              objc_msgSend(v40, "voiceProfileForId:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
                v30 = (id)objc_msgSend(v40, "deleteUserVoiceProfile:", v29);
LABEL_32:

            }
            else
            {
              v11 = v40;
            }
            notify_post("com.apple.siri.corespeech.voiceprofilelist.change");
            v39 = *(_QWORD *)(v1 + 48);
            if (v39)
              (*(void (**)(uint64_t, _QWORD, _QWORD))(v39 + 16))(v39, 0, 0);

LABEL_27:
            return;
          }
        }
      }
    }
    v37 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v38 = *(void **)(v1 + 32);
      *(_DWORD *)buf = 136315394;
      v49 = "-[CSP2PService _processVoiceProfileDeleteCommandWithRequest:fromSenderID:withReply:]_block_invoke";
      v50 = 2112;
      v51 = v38;
      _os_log_impl(&dword_1C2614000, v37, OS_LOG_TYPE_DEFAULT, "%s received malformed command - %@", buf, 0x16u);
    }
  }
  else
  {
    v31 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v33 = *(_QWORD *)(v1 + 40);
      v32 = *(_QWORD *)(v1 + 48);
      v34 = v31;
      v35 = (void *)MEMORY[0x1C3BC4734](v32);
      *(_DWORD *)buf = 136315906;
      v49 = "-[CSP2PService _processVoiceProfileDeleteCommandWithRequest:fromSenderID:withReply:]_block_invoke";
      v50 = 2112;
      v51 = v2;
      v52 = 2112;
      v53 = v33;
      v54 = 2112;
      v55 = v35;
      _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_DEFAULT, "%s received malformed command - %@ %@ %@", buf, 0x2Au);

    }
  }
  v36 = *(_QWORD *)(v1 + 48);
  if (v36)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), 3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v36 + 16))(v36, 0, v11);
    goto LABEL_27;
  }
}

void __74__CSP2PService__receiveVoiceProfileFromPeerId_voiceProfileInfo_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __160__CSP2PService__sendGradingData_withFileName_toPeerId_withCompressedFlag_withUncompressedDataSize_withBatchId_withRetainFileFlag_withFilePrefix_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v29 = "-[CSP2PService _sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchI"
            "d:withRetainFileFlag:withFilePrefix:withCompletion:]_block_invoke";
      v30 = 2112;
      v31 = v8;
      v32 = 2112;
      v33 = v5;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed in transporting Voice file %@ with reponse: %@, error %@", buf, 0x2Au);
    }
    v9 = v6;
  }
  else
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 40), "pathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "stringByDeletingPathExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingString:", *MEMORY[0x1E0D192E0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathExtension:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v26 = 0;
      v16 = objc_msgSend(v14, "moveItemAtPath:toPath:error:", v15, v13, &v26);
      v17 = v26;

      v9 = 0;
      if ((v16 & 1) == 0)
      {
        v18 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          v19 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136315906;
          v29 = "-[CSP2PService _sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBa"
                "tchId:withRetainFileFlag:withFilePrefix:withCompletion:]_block_invoke";
          v30 = 2112;
          v31 = v19;
          v32 = 2112;
          v33 = v13;
          v34 = 2112;
          v35 = v17;
          _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Failed to move the file %@ to %@ with error %@", buf, 0x2Au);
        }
        v9 = v17;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      v27 = 0;
      v22 = objc_msgSend(v20, "removeItemAtPath:error:", v21, &v27);
      v17 = v27;

      if ((v22 & 1) != 0)
      {
        v9 = 0;
      }
      else
      {
        v23 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136315650;
          v29 = "-[CSP2PService _sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBa"
                "tchId:withRetainFileFlag:withFilePrefix:withCompletion:]_block_invoke";
          v30 = 2112;
          v31 = v24;
          v32 = 2112;
          v33 = v17;
          _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Failed to remove the file %@ with error %@", buf, 0x20u);
        }
        v17 = v17;
        v9 = v17;
      }
    }

  }
  v25 = *(_QWORD *)(a1 + 56);
  if (v25)
    (*(void (**)(uint64_t, _QWORD, id))(v25 + 16))(v25, *(_QWORD *)(a1 + 48), v9);

}

void __56__CSP2PService__sendCoreSpeechMagusGradingDataToPeerId___block_invoke_2(_QWORD *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a7;
  if (v15)
  {
    v16 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "-[CSP2PService _sendCoreSpeechMagusGradingDataToPeerId:]_block_invoke_2";
      v37 = 2114;
      v38 = (uint64_t)v13;
      v39 = 2114;
      v40 = v15;
      _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s Failed in compressing %{public}@ with errror %{public}@ - Bailing out", buf, 0x20u);
    }
  }
  else
  {
    v17 = *(NSObject **)(a1[4] + 48);
    v18 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v17, v18);
    v19 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v13, "lastPathComponent");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = a1[5];
      v36 = "-[CSP2PService _sendCoreSpeechMagusGradingDataToPeerId:]_block_invoke";
      v24 = CFSTR("OFF");
      v37 = 2112;
      *(_DWORD *)buf = 136316162;
      if ((_DWORD)a6)
        v24 = CFSTR("ON");
      v38 = v21;
      v39 = 2114;
      v40 = v24;
      v41 = 2048;
      v42 = a5;
      v43 = 2114;
      v44 = v23;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Transfering grading file %@ withCompression %{public}@ and size %ld in batch %{public}@", buf, 0x34u);

    }
    v26 = a1[5];
    v25 = a1[6];
    v27 = (void *)a1[4];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __56__CSP2PService__sendCoreSpeechMagusGradingDataToPeerId___block_invoke_193;
    v32[3] = &unk_1E7C26588;
    v28 = v13;
    v29 = a1[4];
    v33 = v28;
    v34 = v29;
    LOBYTE(v31) = 1;
    v30 = (id)objc_msgSend(v27, "_sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchId:withRetainFileFlag:withFilePrefix:withCompletion:", v14, v28, v25, a6, a4, v26, v31, &stru_1E7C296E8, v32);

  }
}

void __56__CSP2PService__sendCoreSpeechMagusGradingDataToPeerId___block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0D18F60];
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v11, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSP2PService _sendCoreSpeechMagusGradingDataToPeerId:]_block_invoke";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Grading log file failed to transfer for file %@ in task %@", (uint8_t *)&v12, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSP2PService _sendCoreSpeechMagusGradingDataToPeerId:]_block_invoke";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Grading log file successfully transfered for file %@ in task %@", (uint8_t *)&v12, 0x20u);
LABEL_4:

  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 48));

}

uint64_t __56__CSP2PService__sendCoreSpeechMagusGradingDataToPeerId___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  objc_msgSend(a2, "URLByDeletingPathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", *MEMORY[0x1E0D192E0]);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v27 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}"), 1, &v27);
    objc_msgSend(v2, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v7, 16, 0, objc_msgSend(v8, "length"));
    v11 = v10;

    if (v9 == 0x7FFFFFFFFFFFFFFFLL && v11 == 0)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingString:", CFSTR(".wav"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "fileExistsAtPath:", v15) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByAppendingString:", CFSTR("-synced.wav"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "fileExistsAtPath:", v18) & 1) != 0)
        {
          v5 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "path");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringByAppendingString:", CFSTR(".json"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v19, "fileExistsAtPath:") & 1) != 0)
          {
            v5 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "path");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringByAppendingString:", CFSTR("-synced.json"));
            v24 = v19;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = objc_msgSend(v22, "fileExistsAtPath:", v20);

            v19 = v24;
          }

        }
      }

    }
  }

  return v5;
}

uint64_t __45__CSP2PService__sendGeckoSpeechLogsToPeerId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D192E0]) & 1) != 0)
    v5 = 0;
  else
    v5 = objc_msgSend(*(id *)(a1 + 32), "shouldTransferVoiceTriggerLogFileWithURL:", v3);

  return v5;
}

void __45__CSP2PService__sendGeckoSpeechLogsToPeerId___block_invoke_2(_QWORD *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a7;
  if (v15)
  {
    v16 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "-[CSP2PService _sendGeckoSpeechLogsToPeerId:]_block_invoke_2";
      v37 = 2114;
      v38 = (uint64_t)v13;
      v39 = 2114;
      v40 = v15;
      _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s Failed in compressing %{public}@ with errror %{public}@ - Bailing out", buf, 0x20u);
    }
  }
  else
  {
    v17 = *(NSObject **)(a1[4] + 48);
    v18 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v17, v18);
    v19 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v13, "lastPathComponent");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = a1[5];
      v36 = "-[CSP2PService _sendGeckoSpeechLogsToPeerId:]_block_invoke";
      v24 = CFSTR("OFF");
      v37 = 2112;
      *(_DWORD *)buf = 136316162;
      if ((_DWORD)a6)
        v24 = CFSTR("ON");
      v38 = v21;
      v39 = 2114;
      v40 = v24;
      v41 = 2048;
      v42 = a5;
      v43 = 2114;
      v44 = v23;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Transfering grading file %@ withCompression %{public}@ and size %ld in batch %{public}@", buf, 0x34u);

    }
    v26 = a1[5];
    v25 = a1[6];
    v27 = (void *)a1[4];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __45__CSP2PService__sendGeckoSpeechLogsToPeerId___block_invoke_179;
    v32[3] = &unk_1E7C26588;
    v28 = v13;
    v29 = a1[4];
    v33 = v28;
    v34 = v29;
    LOBYTE(v31) = 0;
    v30 = (id)objc_msgSend(v27, "_sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchId:withRetainFileFlag:withFilePrefix:withCompletion:", v14, v28, v25, a6, a4, v26, v31, CFSTR("Gecko-"), v32);

  }
}

void __45__CSP2PService__sendGeckoSpeechLogsToPeerId___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0D18F60];
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v11, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSP2PService _sendGeckoSpeechLogsToPeerId:]_block_invoke";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Grading log file failed to transfer for file %@ in task %@", (uint8_t *)&v12, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSP2PService _sendGeckoSpeechLogsToPeerId:]_block_invoke";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Grading log file successfully transfered for file %@ in task %@", (uint8_t *)&v12, 0x20u);
LABEL_4:

  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 48));

}

uint64_t __62__CSP2PService__sendCoreSpeechGradingDataToPeerId_forLogType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  v3 = a2;
  objc_msgSend(v3, "URLByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", *MEMORY[0x1E0D192E0]);

  if ((v6 & 1) != 0)
    goto LABEL_2;
  v8 = *(_QWORD *)(a1 + 40);
  if (v8 == 3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "fileURL:matchesFileNamePattern:", v3, CFSTR("^PCM-.+")))
      goto LABEL_13;
    goto LABEL_2;
  }
  if (v8 != 2)
  {
    if (v8 != 1 || (objc_msgSend(*(id *)(a1 + 32), "fileURL:matchesFileNamePattern:", v3, CFSTR("^CS-.+")) & 1) != 0)
      goto LABEL_13;
LABEL_2:
    v7 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v3, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("spx")))
  {

    goto LABEL_13;
  }
  objc_msgSend(v3, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("opx"));

  if ((v11 & 1) == 0)
    goto LABEL_2;
LABEL_13:
  objc_msgSend(v3, "pathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("json"));

  if (v13)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "isInternalWithoutProfile");
  }
  else
  {
    objc_msgSend(v3, "pathExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("wav"));

    if ((v15 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v3, "pathExtension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("spx")) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(v3, "pathExtension");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v17, "isEqualToString:", CFSTR("opx"));

      }
    }
  }
LABEL_21:

  return v7;
}

void __62__CSP2PService__sendCoreSpeechGradingDataToPeerId_forLogType___block_invoke_2(_QWORD *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a7;
  if (v15)
  {
    v16 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "-[CSP2PService _sendCoreSpeechGradingDataToPeerId:forLogType:]_block_invoke_2";
      v37 = 2114;
      v38 = (uint64_t)v13;
      v39 = 2114;
      v40 = v15;
      _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s Failed in compressing %{public}@ with errror %{public}@ - Bailing out", buf, 0x20u);
    }
  }
  else
  {
    v17 = *(NSObject **)(a1[4] + 48);
    v18 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v17, v18);
    v19 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v13, "lastPathComponent");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = a1[5];
      v36 = "-[CSP2PService _sendCoreSpeechGradingDataToPeerId:forLogType:]_block_invoke";
      v24 = CFSTR("OFF");
      v37 = 2112;
      *(_DWORD *)buf = 136316162;
      if ((_DWORD)a6)
        v24 = CFSTR("ON");
      v38 = v21;
      v39 = 2114;
      v40 = v24;
      v41 = 2048;
      v42 = a5;
      v43 = 2114;
      v44 = v23;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Transfering grading file %@ withCompression %{public}@ and size %ld in batch %{public}@", buf, 0x34u);

    }
    v26 = a1[5];
    v25 = a1[6];
    v27 = (void *)a1[4];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __62__CSP2PService__sendCoreSpeechGradingDataToPeerId_forLogType___block_invoke_175;
    v32[3] = &unk_1E7C26588;
    v28 = v13;
    v29 = a1[4];
    v33 = v28;
    v34 = v29;
    LOBYTE(v31) = 1;
    v30 = (id)objc_msgSend(v27, "_sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchId:withRetainFileFlag:withFilePrefix:withCompletion:", v14, v28, v25, a6, a4, v26, v31, &stru_1E7C296E8, v32);

  }
}

void __62__CSP2PService__sendCoreSpeechGradingDataToPeerId_forLogType___block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0D18F60];
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v11, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSP2PService _sendCoreSpeechGradingDataToPeerId:forLogType:]_block_invoke";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Grading log file failed to transfer for file %@ in task %@", (uint8_t *)&v12, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSP2PService _sendCoreSpeechGradingDataToPeerId:forLogType:]_block_invoke";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Grading log file successfully transfered for file %@ in task %@", (uint8_t *)&v12, 0x20u);
LABEL_4:

  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 48));

}

uint64_t __53__CSP2PService__sendVoiceTriggerGradingDataToPeerId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D192E0]) & 1) != 0)
    goto LABEL_7;
  if ((objc_msgSend(v4, "containsString:", kMetaFilenameWithPrefixAlmost) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "companionSyncVoiceTriggerUtterancesEnabled") & 1) != 0)
    {
      v6 = objc_msgSend(v4, "containsString:", kMetaFilenameWithPrefixTriggered);

      if (v6)
        goto LABEL_5;
    }
    else
    {

    }
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
LABEL_5:
  v7 = objc_msgSend(*(id *)(a1 + 32), "shouldTransferVoiceTriggerLogFileWithURL:", v3);
LABEL_8:

  return v7;
}

void __53__CSP2PService__sendVoiceTriggerGradingDataToPeerId___block_invoke_2(_QWORD *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a7;
  if (v15)
  {
    v16 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "-[CSP2PService _sendVoiceTriggerGradingDataToPeerId:]_block_invoke_2";
      v37 = 2114;
      v38 = (uint64_t)v13;
      v39 = 2114;
      v40 = v15;
      _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s Failed in compressing %{public}@ with errror %{public}@ - Bailing out", buf, 0x20u);
    }
  }
  else
  {
    v17 = *(NSObject **)(a1[4] + 48);
    v18 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v17, v18);
    v19 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v13, "lastPathComponent");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = a1[5];
      v36 = "-[CSP2PService _sendVoiceTriggerGradingDataToPeerId:]_block_invoke";
      v24 = CFSTR("OFF");
      v37 = 2112;
      *(_DWORD *)buf = 136316162;
      if ((_DWORD)a6)
        v24 = CFSTR("ON");
      v38 = v21;
      v39 = 2114;
      v40 = v24;
      v41 = 2048;
      v42 = a5;
      v43 = 2114;
      v44 = v23;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Transfering NearMiss file %@ withCompression %{public}@ and size %ld in batch %{public}@", buf, 0x34u);

    }
    v26 = a1[5];
    v25 = a1[6];
    v27 = (void *)a1[4];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __53__CSP2PService__sendVoiceTriggerGradingDataToPeerId___block_invoke_159;
    v32[3] = &unk_1E7C26588;
    v28 = v13;
    v29 = a1[4];
    v33 = v28;
    v34 = v29;
    LOBYTE(v31) = 1;
    v30 = (id)objc_msgSend(v27, "_sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchId:withRetainFileFlag:withFilePrefix:withCompletion:", v14, v28, v25, a6, a4, v26, v31, &stru_1E7C296E8, v32);

  }
}

void __53__CSP2PService__sendVoiceTriggerGradingDataToPeerId___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0D18F60];
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v11, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSP2PService _sendVoiceTriggerGradingDataToPeerId:]_block_invoke";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Grading log file failed to transfer for file %@ in task %@", (uint8_t *)&v12, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CSP2PService _sendVoiceTriggerGradingDataToPeerId:]_block_invoke";
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Grading log file successfully transfered for file %@ in task %@", (uint8_t *)&v12, 0x20u);
LABEL_4:

  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 48));

}

uint64_t __105__CSP2PService__compressFilesInDirectory_matchingPredicate_sortedByCreationDate_compressedFileAvailable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  char v9;
  id v10;
  id *v11;
  char v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v19;
  id v20;
  id v21;
  id obj;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  obj = 0;
  v23 = 0;
  v7 = *MEMORY[0x1E0C998E8];
  v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v9 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v23, *MEMORY[0x1E0C998E8], &obj);
  v10 = v23;
  objc_storeStrong(v8, obj);
  if ((v9 & 1) == 0)
  {
    v15 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 136315906;
      v25 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]_block_invoke";
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v5;
      v30 = 2112;
      v31 = v16;
      _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s Unable to get %@ for file at %@: %@", buf, 0x2Au);
    }
    goto LABEL_9;
  }
  v20 = 0;
  v21 = 0;
  v11 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v12 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v21, v7, &v20);
  v13 = v21;
  objc_storeStrong(v11, v20);
  if ((v12 & 1) == 0)
  {
    v17 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 136315906;
      v25 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]_block_invoke";
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v19;
      _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s Unable to get %@ for file at %@: %@", buf, 0x2Au);
    }

LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v14 = objc_msgSend(v10, "compare:", v13);

LABEL_10:
  return v14;
}

uint64_t __46__CSP2PService_sendGeckoSpeechLogsToCompanion__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = 136315394;
    v6 = "-[CSP2PService sendGeckoSpeechLogsToCompanion]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Triggering gecko sync with peer - %@", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_sendGeckoSpeechLogsToPeerId:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __51__CSP2PService_sendAcousticGradingDataToNearbyPeer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = 136315394;
    v6 = "-[CSP2PService sendAcousticGradingDataToNearbyPeer]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Triggering acoustic data sync with peer - %@", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_sendAcousticGradingDataToPeerId:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __68__CSP2PService_sendVoiceProfileUpdatedMessageToNearbyPeerForLocale___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 24))
  {
    v1 = result;
    result = CSIsHorseman();
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(v1 + 32), "isHeadlessDeviceDataCollectionModeEnabled");
      if ((_DWORD)result)
      {
        v2 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          v3 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 24);
          v4 = 136315394;
          v5 = "-[CSP2PService sendVoiceProfileUpdatedMessageToNearbyPeerForLocale:]_block_invoke";
          v6 = 2112;
          v7 = v3;
          _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Triggering voice profile sync with peer - %@", (uint8_t *)&v4, 0x16u);
        }
        return objc_msgSend(*(id *)(v1 + 32), "_sendVoiceProfileUpdateTriggerToPeerId:forLocale:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 24), *(_QWORD *)(v1 + 40));
      }
    }
  }
  return result;
}

uint64_t __52__CSP2PService_sendVTNearMissGradingDataToCompanion__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = 136315394;
    v6 = "-[CSP2PService sendVTNearMissGradingDataToCompanion]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Triggering nearmiss sync with peer - %@", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_sendVoiceTriggerGradingDataToPeerId:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __53__CSP2PService_sendCoreSpeechGradingDataToNearbyPeer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = 136315394;
    v6 = "-[CSP2PService sendCoreSpeechGradingDataToNearbyPeer]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Triggering sync with peer - %@", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_sendCoreSpeechGradingDataToPeerId:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

void __67__CSP2PService_processRemoteCommandWithPayload_fromPeer_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  os_log_t *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  _BYTE v32[24];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isHeadlessDeviceDataCollectionModeEnabled") & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2 && *(_QWORD *)(a1 + 48))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSP2P_CommandType_Key"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("CSP2P_CommandDict_Key"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 48));
          v5 = (os_log_t *)MEMORY[0x1E0D18F60];
          v6 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
          {
            v7 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)v32 = 136315650;
            *(_QWORD *)&v32[4] = "-[CSP2PService processRemoteCommandWithPayload:fromPeer:withReply:]_block_invoke";
            *(_WORD *)&v32[12] = 2112;
            *(_QWORD *)&v32[14] = v3;
            *(_WORD *)&v32[22] = 2112;
            v33 = v7;
            _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Command %@ received from peerId %@", v32, 0x20u);
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.remote.heysiri")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_processRemoteHeySiriCommandWithRequest:fromSenderID:withReply:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_64:

            goto LABEL_22;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.parallel.recording")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_processParallelRecordingCommandWithRequest:fromSenderID:withReply:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
            goto LABEL_64;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.transfer.parallelrecording")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_receiveParallelRecordingFromPeerId:recordingInfo:withReply:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));
            goto LABEL_64;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.transfer.voiceprofile")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));
            goto LABEL_64;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.fetch.voicegradingdata")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_processGradingDataFetchCommandWithRequest:fromSenderID:withReply:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
            goto LABEL_64;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.delete.voiceprofile")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_processVoiceProfileDeleteCommandWithRequest:fromSenderID:withReply:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
            goto LABEL_64;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.transfer.voicegradingdata")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_receiveVoiceGradingDataFromPeerId:requestInfo:withReply:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));
            goto LABEL_64;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.query.voiceprofile")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));
            goto LABEL_64;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.fetch.voiceprofile")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));
            goto LABEL_64;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.reverse.transfer.voiceprofile")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));
            goto LABEL_64;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.voiceprofile.update.trigger")))
          {
            objc_msgSend(*(id *)(a1 + 32), "_processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));
            goto LABEL_64;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.fetch.voicegradingdata.voicetriggerlogs")))
          {
            v26 = *(void **)(a1 + 32);
            v27 = *(_QWORD *)(a1 + 48);
            v28 = *(_QWORD *)(a1 + 56);
            v29 = v4;
            v30 = 1;
LABEL_63:
            objc_msgSend(v26, "_processGradingDataFetchCommandWithRequest:ofLogType:fromSenderID:withReply:", v29, v30, v27, v28);
            goto LABEL_64;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.fetch.voicegradingdata.speechlogs")))
          {
            v26 = *(void **)(a1 + 32);
            v27 = *(_QWORD *)(a1 + 48);
            v28 = *(_QWORD *)(a1 + 56);
            v29 = v4;
            v30 = 2;
            goto LABEL_63;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.fetch.voicegradingdata.maguslogs")))
          {
            v26 = *(void **)(a1 + 32);
            v27 = *(_QWORD *)(a1 + 48);
            v28 = *(_QWORD *)(a1 + 56);
            v29 = v4;
            v30 = 3;
            goto LABEL_63;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.fetch.voicegradingdata.csaudio")))
          {
            v26 = *(void **)(a1 + 32);
            v27 = *(_QWORD *)(a1 + 48);
            v28 = *(_QWORD *)(a1 + 56);
            v29 = v4;
            v30 = 6;
            goto LABEL_63;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.fetch.voicegradingdata.compressedaudio")))
          {
            v26 = *(void **)(a1 + 32);
            v27 = *(_QWORD *)(a1 + 48);
            v28 = *(_QWORD *)(a1 + 56);
            v29 = v4;
            v30 = 7;
            goto LABEL_63;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.fetch.voicegradingdata.pcmaudio")))
          {
            v26 = *(void **)(a1 + 32);
            v27 = *(_QWORD *)(a1 + 48);
            v28 = *(_QWORD *)(a1 + 56);
            v29 = v4;
            v30 = 8;
            goto LABEL_63;
          }
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siridebug.command.fetch.voicegradingdata.triggerstudylogs")))
          {
            v26 = *(void **)(a1 + 32);
            v27 = *(_QWORD *)(a1 + 48);
            v28 = *(_QWORD *)(a1 + 56);
            v29 = v4;
            v30 = 9;
            goto LABEL_63;
          }
          v31 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v32 = 136315394;
            *(_QWORD *)&v32[4] = "-[CSP2PService processRemoteCommandWithPayload:fromPeer:withReply:]_block_invoke";
            *(_WORD *)&v32[12] = 2112;
            *(_QWORD *)&v32[14] = v3;
            _os_log_impl(&dword_1C2614000, v31, OS_LOG_TYPE_DEFAULT, "%s Unknown Command: (%@) - Ignoring", v32, 0x16u);
          }
          v22 = *(_QWORD *)(a1 + 56);
          if (!v22)
            goto LABEL_64;
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v24 = 6;
        }
        else
        {
          v20 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
          {
            v21 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)v32 = 136315650;
            *(_QWORD *)&v32[4] = "-[CSP2PService processRemoteCommandWithPayload:fromPeer:withReply:]_block_invoke";
            *(_WORD *)&v32[12] = 2112;
            *(_QWORD *)&v32[14] = 0;
            *(_WORD *)&v32[22] = 2112;
            v33 = v21;
            _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Received Malformed command %@ from peerId %@ - Bailing out!", v32, 0x20u);
          }
          v22 = *(_QWORD *)(a1 + 56);
          if (!v22)
            goto LABEL_64;
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v24 = 3;
        }
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), v24, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v25);

        goto LABEL_64;
      }
      v17 = *MEMORY[0x1E0D18F60];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v32 = 136315650;
      *(_QWORD *)&v32[4] = "-[CSP2PService processRemoteCommandWithPayload:fromPeer:withReply:]_block_invoke";
      *(_WORD *)&v32[12] = 2112;
      *(_QWORD *)&v32[14] = v18;
      *(_WORD *)&v32[22] = 2112;
      v33 = v19;
      v16 = v17;
    }
    else
    {
      v14 = *MEMORY[0x1E0D18F60];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:
        v11 = *(_QWORD *)(a1 + 56);
        if (!v11)
          return;
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = 3;
        goto LABEL_21;
      }
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v32 = 136315650;
      *(_QWORD *)&v32[4] = "-[CSP2PService processRemoteCommandWithPayload:fromPeer:withReply:]_block_invoke";
      *(_WORD *)&v32[12] = 2112;
      *(_QWORD *)&v32[14] = v2;
      *(_WORD *)&v32[22] = 2112;
      v33 = v15;
      v16 = v14;
    }
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Received Malformed command %@ from peerId %@ - Bailing out!", v32, 0x20u);
    goto LABEL_19;
  }
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)v32 = 136315650;
    *(_QWORD *)&v32[4] = "-[CSP2PService processRemoteCommandWithPayload:fromPeer:withReply:]_block_invoke";
    *(_WORD *)&v32[12] = 2112;
    *(_QWORD *)&v32[14] = v9;
    *(_WORD *)&v32[22] = 2112;
    v33 = v10;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Non internal build, Ignoring command %@ from peerId %@ - Bailing out!", v32, 0x20u);
  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 2;
LABEL_21:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("CoreSpeech"), v13, 0, *(_OWORD *)v32, *(_QWORD *)&v32[16], v33);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v3);
LABEL_22:

  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14750 != -1)
    dispatch_once(&sharedInstance_onceToken_14750, &__block_literal_global_14751);
  return (id)sharedInstance__p2pService;
}

void __30__CSP2PService_sharedInstance__block_invoke()
{
  CSP2PService *v0;
  void *v1;

  v0 = objc_alloc_init(CSP2PService);
  v1 = (void *)sharedInstance__p2pService;
  sharedInstance__p2pService = (uint64_t)v0;

}

@end
