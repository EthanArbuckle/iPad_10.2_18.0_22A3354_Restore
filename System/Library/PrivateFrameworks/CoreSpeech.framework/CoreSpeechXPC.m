@implementation CoreSpeechXPC

- (CoreSpeechXPC)initWithFakeMonitor:(id)a3
{
  id v5;
  CoreSpeechXPC *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CoreSpeechXPC;
  v6 = -[CoreSpeechXPC init](&v8, sel_init);
  if (v6)
  {
    CSLogInitIfNeeded();
    objc_storeStrong((id *)&v6->_fakeAssetMonitor, a3);
  }

  return v6;
}

- (void)installedVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CoreSpeechXPC installedVoiceTriggerAssetForLanguageCode:completion:]";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Received a request for VoiceTrigger Asset for language code : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (v6)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);

}

- (void)fetchRemoteVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CoreSpeechXPC fetchRemoteVoiceTriggerAssetForLanguageCode:completion:]";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Received a request for VoiceTrigger Asset for language code : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (v6)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);

}

- (void)_handleFakeHearstModelRequest:(id)a3 majorVersion:(unint64_t)a4 minorVersion:(unint64_t)a5 downloadedModels:(id)a6 preinstalledModels:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, void *, const __CFString *, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  CSVoiceTriggerRTModelRequestOptions *v33;
  CSVoiceTriggerRTModelRequestOptions *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  unint64_t v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  int v56;
  uint64_t v57;
  NSObject *v58;
  CoreSpeechXPC *v59;
  CoreSpeechXPCFakeModelMonitor *fakeAssetMonitor;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  NSObject **v66;
  NSObject *v67;
  CoreSpeechXPC *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void (**v73)(id, void *, void *, const __CFString *, _QWORD);
  id obj;
  void *v75;
  _QWORD v77[6];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  _QWORD v85[2];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = (void (**)(id, void *, void *, const __CFString *, _QWORD))a8;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v17, "fileExistsAtPath:", v13);

  if ((a7 & 1) != 0)
  {
    objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("fakeModel.json"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "fileExistsAtPath:", v18);

    if ((v20 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v21, 0, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)v22;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v68 = self;
            v69 = v21;
            v70 = v18;
            v71 = v14;
            v72 = v15;
            v73 = v16;
            v24 = v23;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = 0u;
            v79 = 0u;
            v80 = 0u;
            v81 = 0u;
            obj = v24;
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v79;
              do
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v79 != v27)
                    objc_enumerationMutation(obj);
                  v29 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
                  v30 = v13;
                  objc_msgSend(v13, "stringByAppendingPathComponent:", v29, v68);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D18FC0], "assetForAssetType:resourcePath:configVersion:", 0, v31, v29);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = [CSVoiceTriggerRTModelRequestOptions alloc];
                  v77[0] = MEMORY[0x1E0C809B0];
                  v77[1] = 3221225472;
                  v77[2] = __120__CoreSpeechXPC__handleFakeHearstModelRequest_majorVersion_minorVersion_downloadedModels_preinstalledModels_completion___block_invoke;
                  v77[3] = &__block_descriptor_48_e56_v16__0___CSVoiceTriggerRTModelRequestOptionsMutablity__8l;
                  v77[4] = a4;
                  v77[5] = a5;
                  v34 = -[CSVoiceTriggerRTModelRequestOptions initWithMutableBuilder:](v33, "initWithMutableBuilder:", v77);
                  objc_msgSend(v32, "hearstRTModelWithRequestOptions:", v34);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = *MEMORY[0x1E0D18F60];
                  if (v35)
                  {
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:pre"
                            "installedModels:completion:]";
                      v84 = 2114;
                      v85[0] = v35;
                      _os_log_impl(&dword_1C2614000, v36, OS_LOG_TYPE_DEFAULT, "%s Loading FakeModel : %{public}@", buf, 0x16u);
                    }
                    objc_msgSend(v75, "addObject:", v35);
                  }
                  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:prein"
                          "stalledModels:completion:]";
                    v84 = 2114;
                    v85[0] = v31;
                    _os_log_error_impl(&dword_1C2614000, v36, OS_LOG_TYPE_ERROR, "%s Cannot create RTModel from %{public}@", buf, 0x16u);
                  }

                  v13 = v30;
                }
                v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
              }
              while (v26);
            }
            v23 = obj;

            if ((int)objc_msgSend(v75, "count") > 2)
            {
              v14 = v71;
              if (objc_msgSend(v75, "count"))
              {
                objc_msgSend(v75, "firstObject");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                -[CoreSpeechXPCFakeModelMonitor lastFakeModelUsedHash](v68->_fakeAssetMonitor, "lastFakeModelUsedHash");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if (v47)
                {
                  v48 = -[CoreSpeechXPCFakeModelMonitor shouldRollFakeModel](v68->_fakeAssetMonitor, "shouldRollFakeModel");
                  if (objc_msgSend(v75, "count"))
                  {
                    v49 = 0;
                    v38 = v46;
                    while (1)
                    {
                      objc_msgSend(v75, "objectAtIndexedSubscript:", v49, v68);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "modelHash");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      v52 = objc_msgSend(v47, "isEqual:", v51);

                      if (v52)
                      {
                        if (v48)
                        {
                          if (v49 < objc_msgSend(v75, "count") - 1)
                          {
                            objc_msgSend(v75, "objectAtIndexedSubscript:", v49 + 1);
                            v57 = objc_claimAutoreleasedReturnValue();

                            v38 = (void *)v57;
                            goto LABEL_53;
                          }
                        }
                        else
                        {
                          objc_msgSend(v75, "objectAtIndexedSubscript:", v49);
                          v53 = objc_claimAutoreleasedReturnValue();

                          v38 = (void *)v53;
                        }
                      }
                      if (++v49 >= objc_msgSend(v75, "count"))
                        goto LABEL_53;
                    }
                  }
                  v38 = v46;
                }
                else
                {
                  objc_msgSend(v75, "firstObject");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  v54 = *MEMORY[0x1E0D18F60];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:prein"
                          "stalledModels:completion:]";
                    v84 = 2114;
                    v85[0] = v38;
                    _os_log_impl(&dword_1C2614000, v54, OS_LOG_TYPE_DEFAULT, "%s Using fake model for the first time : %{public}@", buf, 0x16u);
                  }
                }
LABEL_53:
                if (v38)
                {
                  v58 = *MEMORY[0x1E0D18F60];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:prein"
                          "stalledModels:completion:]";
                    v84 = 2114;
                    v85[0] = v38;
                    _os_log_impl(&dword_1C2614000, v58, OS_LOG_TYPE_DEFAULT, "%s Using fake model : %{public}@", buf, 0x16u);
                  }
                  v59 = v68;
                  -[CoreSpeechXPCFakeModelMonitor setShouldRollFakeModel:](v68->_fakeAssetMonitor, "setShouldRollFakeModel:", 0, v68);
                  fakeAssetMonitor = v59->_fakeAssetMonitor;
                  objc_msgSend(v38, "modelHash");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CoreSpeechXPCFakeModelMonitor setLastFakeModelUsedHash:](fakeAssetMonitor, "setLastFakeModelUsedHash:", v61);

                }
              }
              else
              {
                v38 = 0;
              }
              v62 = objc_msgSend(v71, "count", v68);
              v63 = v71;
              if (v62 || (v64 = objc_msgSend(v72, "count"), v63 = v72, v64))
              {
                objc_msgSend(v63, "objectAtIndex:", 0);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v65 = 0;
              }
              v66 = (NSObject **)MEMORY[0x1E0D18F60];
              v67 = *MEMORY[0x1E0D18F60];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstal"
                      "ledModels:completion:]";
                v84 = 2114;
                v85[0] = v38;
                _os_log_impl(&dword_1C2614000, v67, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fake model is selected for download", buf, 0x16u);
                v67 = *v66;
              }
              v21 = v69;
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstal"
                      "ledModels:completion:]";
                v84 = 2114;
                v85[0] = v65;
                _os_log_impl(&dword_1C2614000, v67, OS_LOG_TYPE_DEFAULT, "%s %{public}@ model is selected for fallback", buf, 0x16u);
              }
              v73[2](v73, v38, v65, CFSTR("fakeModel"), 0);

              v23 = obj;
            }
            else
            {
              v37 = (void *)*MEMORY[0x1E0D18F60];
              v14 = v71;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
              {
                v55 = v37;
                v56 = objc_msgSend(v75, "count");
                *(_DWORD *)buf = 136315650;
                v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstal"
                      "ledModels:completion:]";
                v84 = 1026;
                LODWORD(v85[0]) = v56;
                WORD2(v85[0]) = 1026;
                *(_DWORD *)((char *)v85 + 6) = 3;
                _os_log_error_impl(&dword_1C2614000, v55, OS_LOG_TYPE_ERROR, "%s fake model number(%{public}d) is less than minimum fake model number((%{public}d)", buf, 0x18u);

              }
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 410, 0, v68);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(id, void *, void *, const __CFString *, void *))v73)[2](v73, 0, 0, 0, v38);
              v21 = v69;
            }

            v15 = v72;
            v16 = v73;
            v18 = v70;
          }
          else
          {
            v44 = *MEMORY[0x1E0D18F60];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalle"
                    "dModels:completion:]";
              v84 = 2114;
              v85[0] = v18;
              _os_log_error_impl(&dword_1C2614000, v44, OS_LOG_TYPE_ERROR, "%s Unable to parse fake model meta json : %{public}@", buf, 0x16u);
            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 409, 0);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(id, void *, void *, const __CFString *, void *))v16)[2](v16, 0, 0, 0, v45);

          }
        }
        else
        {
          v42 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledM"
                  "odels:completion:]";
            v84 = 2114;
            v85[0] = v18;
            _os_log_error_impl(&dword_1C2614000, v42, OS_LOG_TYPE_ERROR, "%s Unable to parse fake model meta json : %{public}@", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 409, 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, void *, const __CFString *, void *))v16)[2](v16, 0, 0, 0, v43);

          v23 = 0;
        }
      }
      else
      {
        v41 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledMod"
                "els:completion:]";
          v84 = 2114;
          v85[0] = v18;
          _os_log_error_impl(&dword_1C2614000, v41, OS_LOG_TYPE_ERROR, "%s Unable to read fake model meta json : %{public}@", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 409, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *, const __CFString *, void *))v16)[2](v16, 0, 0, 0, v23);
      }

    }
    else
    {
      v40 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledModels:completion:]";
        v84 = 2114;
        v85[0] = v18;
        _os_log_error_impl(&dword_1C2614000, v40, OS_LOG_TYPE_ERROR, "%s fake model meta json does not exist : %{public}@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 408, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *, const __CFString *, void *))v16)[2](v16, 0, 0, 0, v21);
    }

  }
  else
  {
    v39 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v83 = "-[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledModels:completion:]";
      v84 = 2114;
      v85[0] = v13;
      _os_log_error_impl(&dword_1C2614000, v39, OS_LOG_TYPE_ERROR, "%s Fake Model Path does not exist : %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 407, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *, const __CFString *, void *))v16)[2](v16, 0, 0, 0, v18);
  }

}

- (void)voiceTriggerRTModelWithRequestOptions:(id)a3 downloadedModels:(id)a4 preinstalledModels:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  os_log_t *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v59;
  uint64_t v60;
  _QWORD v61[4];
  id v62;
  id v63;
  CoreSpeechXPC *v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  uint64_t v81;
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  int v89;
  __int16 v90;
  int v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v50 = a5;
  v11 = a6;
  objc_msgSend(v9, "accessoryModelType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  objc_msgSend(v9, "engineMajorVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v9, "engineMinorVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  v18 = (os_log_t *)MEMORY[0x1E0D18F60];
  v19 = (void *)*MEMORY[0x1E0D18F60];
  v60 = v13;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    +[CoreSpeechXPC accessoryModelTypeToString:](CoreSpeechXPC, "accessoryModelTypeToString:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
    v86 = 2114;
    v87 = v21;
    v88 = 1026;
    v89 = v15;
    v90 = 1026;
    v91 = v17;
    v92 = 2112;
    v93 = v22;
    _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Received a request for VoiceTriggerRTModel %{public}@ Firmware Version : %{public}d.%{public}d Accessory Info:%@", buf, 0x2Cu);

    v13 = v60;
  }
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __102__CoreSpeechXPC_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion___block_invoke;
  v79[3] = &unk_1E7C27250;
  v81 = v13;
  v55 = v11;
  v80 = v55;
  v54 = (void *)MEMORY[0x1C3BC4734](v79);
  objc_msgSend(v9, "siriLocale");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v23;
  if (v23)
  {
    v24 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  v26 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
    v86 = 2114;
    v87 = v25;
    _os_log_impl(&dword_1C2614000, v26, OS_LOG_TYPE_DEFAULT, "%s Asking mobile asset with currentLanguageCode = %{public}@", buf, 0x16u);
    v26 = *v18;
  }
  v52 = v25;
  v57 = v15;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
    _os_log_impl(&dword_1C2614000, v26, OS_LOG_TYPE_DEFAULT, "%s DownloadModel : ", buf, 0xCu);
  }
  v56 = v17;
  v59 = v9;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v27 = v10;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v76 != v30)
          objc_enumerationMutation(v27);
        v32 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
        {
          v33 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          *(_DWORD *)buf = 136315394;
          v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
          v86 = 2114;
          v87 = v33;
          _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    }
    while (v29);
  }
  v51 = v27;

  v34 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
    _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_DEFAULT, "%s preinstalledModels : ", buf, 0xCu);
  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v35 = v50;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v72 != v38)
          objc_enumerationMutation(v35);
        v40 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
        {
          v41 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
          *(_DWORD *)buf = 136315394;
          v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
          v86 = 2114;
          v87 = v41;
          _os_log_impl(&dword_1C2614000, v40, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    }
    while (v37);
  }

  v42 = v60;
  if (v60
    || (objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences"),
        v48 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v48, "fakeHearstModelPath"),
        v47 = (void *)objc_claimAutoreleasedReturnValue(),
        v48,
        v42 = 0,
        !v47))
  {
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __102__CoreSpeechXPC_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion___block_invoke_18;
    v61[3] = &unk_1E7C27278;
    v43 = v54;
    v67 = v54;
    v44 = v59;
    v62 = v59;
    v45 = v52;
    v68 = v42;
    v63 = v52;
    v64 = self;
    v46 = v51;
    v65 = v51;
    v66 = v35;
    v69 = v57;
    v70 = v56;
    -[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:](self, "_fetchVoiceTriggerInstalledAssetWithLanguage:completion:", v63, v61);

    v47 = v67;
  }
  else
  {
    v49 = *v18;
    v44 = v59;
    v46 = v51;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v85 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]";
      v86 = 2114;
      v87 = v47;
      _os_log_impl(&dword_1C2614000, v49, OS_LOG_TYPE_DEFAULT, "%s Hearst Fake Model request switch turned on, executing stress test mode with fakeModelPath : %{public}@", buf, 0x16u);
    }
    v43 = v54;
    -[CoreSpeechXPC _handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledModels:completion:](self, "_handleFakeHearstModelRequest:majorVersion:minorVersion:downloadedModels:preinstalledModels:completion:", v47, v57, v56, v51, v35, v54);
    v45 = v52;
  }

}

- (void)voiceTriggerJarvisLanguageList:(id)a3 jarvisSelectedLanguage:(id)a4 completion:(id)a5
{
  unint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = (unint64_t)a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __82__CoreSpeechXPC_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke;
  v24[3] = &unk_1E7C272A0;
  v12 = (unint64_t)v9;
  v25 = (id)v12;
  v13 = v10;
  v26 = v13;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v24);
  if (v8 | v12)
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]";
      v29 = 2114;
      v30 = v17;
      _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s current Siri language code : %{public}@", buf, 0x16u);
    }
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __82__CoreSpeechXPC_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke_22;
    v19[3] = &unk_1E7C272C8;
    v19[4] = self;
    v20 = v17;
    v21 = (id)v12;
    v23 = v14;
    v22 = (id)v8;
    v16 = v17;
    -[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:](self, "_fetchVoiceTriggerInstalledAssetWithLanguage:completion:", v16, v19);

  }
  else
  {
    v15 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]";
      _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s Language list and jarvis language not provided", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 403, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v14)[2](v14, 0, v16);
  }

}

- (id)getAccessoryFallbackLocalTable
{
  if (getAccessoryFallbackLocalTable_onceToken != -1)
    dispatch_once(&getAccessoryFallbackLocalTable_onceToken, &__block_literal_global_19580);
  return (id)getAccessoryFallbackLocalTable_table;
}

- (id)getAccessoryFallbackFamilyLocal:(id)a3 fromLocaleMap:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              if ((objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j)) & 1) != 0)
              {
                v17 = v11;

                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = 0;
    }
    while (v8);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)selectFallbackModelForLocale:(id)a3 downloadedModels:(id)a4 preinstalledModels:(id)a5 rtLocaleMap:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  __CFString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v29 = a5;
  v11 = a6;
  -[CoreSpeechXPC getAccessoryFallbackFamilyLocal:fromLocaleMap:](self, "getAccessoryFallbackFamilyLocal:fromLocaleMap:", a3, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  if (v12)
    v13 = (__CFString *)v12;
  else
    v13 = CFSTR("en-US");
  v37 = 0uLL;
  v38 = 0uLL;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v19, "modelLocale", v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreSpeechXPC getAccessoryFallbackFamilyLocal:fromLocaleMap:](self, "getAccessoryFallbackFamilyLocal:fromLocaleMap:", v20, v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if ((-[__CFString isEqualToString:](v13, "isEqualToString:", v21) & 1) != 0)
        {
          obj = v14;
          goto LABEL_22;
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v16)
        continue;
      break;
    }
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v29;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
LABEL_14:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v24)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v25);
      objc_msgSend(v19, "modelLocale", v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreSpeechXPC getAccessoryFallbackFamilyLocal:fromLocaleMap:](self, "getAccessoryFallbackFamilyLocal:fromLocaleMap:", v26, v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if ((-[__CFString isEqualToString:](v13, "isEqualToString:", v21) & 1) != 0)
        break;

      if (v23 == ++v25)
      {
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v23)
          goto LABEL_14;
        goto LABEL_20;
      }
    }
LABEL_22:
    v27 = v19;

  }
  else
  {
LABEL_20:
    v27 = 0;
  }

  return v27;
}

- (void)_fetchVoiceTriggerInstalledAssetWithLanguage:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!CSIsInternalBuild())
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0D19240], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D19240], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __73__CoreSpeechXPC__fetchVoiceTriggerInstalledAssetWithLanguage_completion___block_invoke;
      v19[3] = &unk_1E7C28D48;
      v21 = v6;
      v20 = v5;
      objc_msgSend(v16, "getInstalledAssetofType:forLocale:completion:", 0, v20, v19);

      v8 = v21;
    }
    else
    {
      +[CSAssetController sharedController](CSAssetController, "sharedController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "installedAssetOfType:language:completion:", 0, v5, v6);
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fakeVoiceTriggerAudioAccessoryFirstPassAssetPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (os_log_t *)MEMORY[0x1E0D18F60];
  v10 = *MEMORY[0x1E0D18F60];
  v11 = *MEMORY[0x1E0D18F60];
  if (!v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:]";
      _os_log_debug_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEBUG, "%s Overriding audio accessory first pass asset is nil", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:]";
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Overridden audio accessory first pass asset path: %@", buf, 0x16u);
  }
  objc_msgSend(v8, "stringByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileExistsAtPath:", v8);

  if (v14)
    objc_msgSend(MEMORY[0x1E0D18FC0], "assetForAssetType:resourcePath:configVersion:assetProvider:", 0, v12, CFSTR("override-asset"), 1);
  else
    objc_msgSend(MEMORY[0x1E0D18FC0], "defaultFallBackAssetForVoiceTrigger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:]";
    v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Fake asset: %@", buf, 0x16u);
  }
  if (v6)
    (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v17, 0);

LABEL_18:
}

- (void)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  NSObject *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, uint64_t))a6;
  v13 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[CoreSpeechXPC supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:completion:]";
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }
  v14 = objc_msgSend(MEMORY[0x1E0D18FC0], "supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:", v9, v10, v11);
  if (v12)
    v12[2](v12, v14);

}

- (CoreSpeechXPCFakeModelMonitor)fakeAssetMonitor
{
  return self->_fakeAssetMonitor;
}

- (void)setFakeAssetMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_fakeAssetMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeAssetMonitor, 0);
}

void __73__CoreSpeechXPC__fetchVoiceTriggerInstalledAssetWithLanguage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "-[CoreSpeechXPC _fetchVoiceTriggerInstalledAssetWithLanguage:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s Trial assets not available, fallback to MA assets", (uint8_t *)&v11, 0xCu);
    }
    +[CSAssetController sharedController](CSAssetController, "sharedController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "installedAssetOfType:language:completion:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v5, 0);
  }

}

void __47__CoreSpeechXPC_getAccessoryFallbackLocalTable__block_invoke()
{
  void *v0;

  v0 = (void *)getAccessoryFallbackLocalTable_table;
  getAccessoryFallbackLocalTable_table = (uint64_t)&unk_1E7C64980;

}

void __82__CoreSpeechXPC_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315650;
    v16 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Select keyword language as %{public}@, error : %{public}@", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D19130], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    objc_msgSend(v10, "setTriggerMode:", 1);

    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v5) & 1) != 0)
      goto LABEL_8;
    v12 = v5;
    v13 = 1;
  }
  else
  {
    objc_msgSend(v10, "setTriggerMode:", 2);

    v12 = *(id *)(a1 + 32);
    v13 = 2;
  }
  +[CoreSpeechXPC logLanguageMismatchMetricWithJarvisSelectedLocale:jarvisTriggerMode:](CoreSpeechXPC, "logLanguageMismatchMetricWithJarvisSelectedLocale:jarvisTriggerMode:", v12, v13);
LABEL_8:
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);

}

void __82__CoreSpeechXPC_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v19 = v7;
      objc_msgSend(v6, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v29 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
      v30 = 2114;
      v31 = v20;
      _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s VoiceTriggerAsset is not available : %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(v5, "jarvisRTModelLocaleMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[CoreSpeechXPC voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Jarvis locale map is nil, fallback to embedded locale map", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "getAccessoryFallbackLocalTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "getAccessoryFallbackFamilyLocal:fromLocaleMap:", *(_QWORD *)(a1 + 40), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "getAccessoryFallbackFamilyLocal:fromLocaleMap:", *(_QWORD *)(a1 + 48), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", v10))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v21 = v6;
    v22 = v5;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = *(id *)(a1 + 56);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(a1 + 32), "getAccessoryFallbackFamilyLocal:fromLocaleMap:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16), v8, v21, v22, (_QWORD)v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "isEqualToString:", v10))
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

            goto LABEL_20;
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
          continue;
        break;
      }
    }

    v18 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 404, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v18 + 16))(v18, 0, v12);
LABEL_20:

    v6 = v21;
    v5 = v22;
  }

}

void __102__CoreSpeechXPC_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!*(_QWORD *)(a1 + 40))
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "modelHash");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHearstFirstPassModelVersion:", v13);

    }
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHearstSecondPassModelVersion:", v10);

    }
  }
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    (*(void (**)(uint64_t, id, id, id))(v15 + 16))(v15, v16, v9, v11);

}

void __102__CoreSpeechXPC_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  void *v8;
  os_log_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  _BYTE v59[10];
  _BYTE v60[10];
  _BYTE v61[10];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0D18F60];
  if (v5)
  {
    objc_msgSend(v5, "rtModelWithRequestOptions:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = v9;
      objc_msgSend(v5, "resourcePath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "configVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
      v58 = 2112;
      *(_QWORD *)v59 = v10;
      *(_WORD *)&v59[8] = 2112;
      *(_QWORD *)v60 = v12;
      *(_WORD *)&v60[8] = 2112;
      *(_QWORD *)v61 = v13;
      *(_WORD *)&v61[8] = 2112;
      v62 = v8;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Queried model for language:%@ path:%@ configVers:%@ model:%@", buf, 0x34u);

    }
    objc_msgSend(v5, "rtModelLocaleMapWithModelType:", *(_QWORD *)(a1 + 80));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (v8)
      {
LABEL_6:
        v43 = v14;
        v44 = v6;
        v45 = v5;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v15 = *(id *)(a1 + 56);
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v51;
          while (2)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v51 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
              objc_msgSend(v20, "modelHash");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "modelHash");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v21, "isEqualToString:", v22);

              if (v23)
              {
                v34 = *MEMORY[0x1E0D18F60];
                v6 = v44;
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:comple"
                        "tion:]_block_invoke";
                  v58 = 2114;
                  *(_QWORD *)v59 = v20;
                  _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_DEFAULT, "%s Hash matched with downloadedModel : %{public}@, accessory will select this model", buf, 0x16u);
                }
                (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
                v5 = v45;
LABEL_40:
                v14 = v43;
                goto LABEL_41;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
            if (v17)
              continue;
            break;
          }
        }

        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v15 = *(id *)(a1 + 64);
        v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v47;
          while (2)
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v47 != v26)
                objc_enumerationMutation(v15);
              v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
              objc_msgSend(v28, "modelHash");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "modelHash");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v29, "isEqualToString:", v30);

              if (v31)
              {
                v37 = *MEMORY[0x1E0D18F60];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:comple"
                        "tion:]_block_invoke";
                  v58 = 2114;
                  *(_QWORD *)v59 = v28;
                  _os_log_impl(&dword_1C2614000, v37, OS_LOG_TYPE_DEFAULT, "%s Hash matched with preinstalledModel : %{public}@, accessory will select this model", buf, 0x16u);
                }
                (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
                v6 = v44;
                v5 = v45;
                goto LABEL_40;
              }
            }
            v25 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            if (v25)
              continue;
            break;
          }
        }

        v14 = v43;
        objc_msgSend(*(id *)(a1 + 48), "selectFallbackModelForLocale:downloadedModels:preinstalledModels:rtLocaleMap:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v43);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v32 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
          v58 = 2114;
          *(_QWORD *)v59 = v8;
          *(_WORD *)&v59[8] = 2114;
          *(_QWORD *)v60 = v15;
          _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s Ask for download : %{public}@, and use %{public}@ as fallback", buf, 0x20u);
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
        v6 = v44;
        v5 = v45;
        goto LABEL_41;
      }
    }
    else
    {
      v35 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
        _os_log_error_impl(&dword_1C2614000, v35, OS_LOG_TYPE_ERROR, "%s rtLocaleMap is nil fallback to embedded locale map", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 48), "getAccessoryFallbackLocalTable");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 48), "selectFallbackModelForLocale:downloadedModels:preinstalledModels:rtLocaleMap:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v36 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      v40 = *(_QWORD *)(a1 + 88);
      v41 = *(_QWORD *)(a1 + 96);
      v42 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
      v58 = 1026;
      *(_DWORD *)v59 = v40;
      *(_WORD *)&v59[4] = 1026;
      *(_DWORD *)&v59[6] = v41;
      *(_WORD *)v60 = 2114;
      *(_QWORD *)&v60[2] = v42;
      *(_WORD *)v61 = 2114;
      *(_QWORD *)&v61[2] = v15;
      _os_log_error_impl(&dword_1C2614000, v36, OS_LOG_TYPE_ERROR, "%s accessoryRTBlobs are not available for the version(%{public}d.%{public}d) and locale:%{public}@, returning fallback model : %{public}@", buf, 0x2Cu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_41:

    goto LABEL_42;
  }
  v33 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v38 = v33;
    objc_msgSend(v6, "localizedDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v57 = "-[CoreSpeechXPC voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:]_block_invoke";
    v58 = 2114;
    *(_QWORD *)v59 = v39;
    _os_log_error_impl(&dword_1C2614000, v38, OS_LOG_TYPE_ERROR, "%s VoiceTriggerAsset is not available : %{public}@", buf, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_42:

}

void __120__CoreSpeechXPC__handleFakeHearstModelRequest_majorVersion_minorVersion_downloadedModels_preinstalledModels_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEngineMajorVersion:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEngineMinorVersion:", v6);

  objc_msgSend(v7, "setSiriLocale:", CFSTR("en-US"));
}

+ (id)accessoryModelTypeToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("default");
  if (!a3)
    v3 = CFSTR("Hearst");
  if (a3 == 1)
    return CFSTR("Remora");
  else
    return (id)v3;
}

+ (void)logLanguageMismatchMetricWithJarvisSelectedLocale:(id)a3 jarvisTriggerMode:(int64_t)a4
{
  uint64_t v5;
  __CFString *v6;
  objc_class *v7;
  __CFString *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if ((unint64_t)(a4 + 1) > 3)
    v5 = 0;
  else
    v5 = dword_1C276CE20[a4 + 1];
  v6 = CFSTR("NA");
  if (a3)
    v6 = (__CFString *)a3;
  v7 = (objc_class *)MEMORY[0x1E0D99A50];
  v8 = v6;
  v16 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setHasCarHeadUnitSelectedLocale:", 1);
  objc_msgSend(v9, "setCarHeadUnitSelectedLocale:", v8);

  objc_msgSend(v9, "setHasCarplayTriggerMode:", 1);
  objc_msgSend(v9, "setCarplayTriggerMode:", v5);
  v10 = objc_alloc_init(MEMORY[0x1E0D99A60]);
  v11 = objc_alloc_init(MEMORY[0x1E0D99A68]);
  v12 = objc_alloc(MEMORY[0x1E0D9A500]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithNSUUID:", v13);
  objc_msgSend(v11, "setMhId:", v14);

  objc_msgSend(v10, "setEventMetadata:", v11);
  objc_msgSend(v10, "setCarPlayLangaugeMismatched:", v9);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitMessage:", v10);

}

@end
