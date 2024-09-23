@implementation APCListenerEngine

- (id)createAU:(AudioComponentDescription *)a3
{
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  _QWORD v12[7];
  AudioComponentDescription v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  dispatch_semaphore_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v13 = *a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __30__APCListenerEngine_createAU___block_invoke;
  v12[3] = &unk_24F24B4A8;
  v12[4] = &v14;
  v12[5] = &v26;
  v12[6] = &v20;
  objc_msgSend(MEMORY[0x24BDB1888], "instantiateWithComponentDescription:options:completionHandler:", &v13, 0, v12);
  v4 = v21[5];
  v5 = dispatch_time(0, 5000000000);
  v6 = dispatch_semaphore_wait(v4, v5);
  if (v27[5] || v6)
  {
    APCLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v27[5];
      if (v9)
      {
        objc_msgSend((id)v27[5], "localizedDescription");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = CFSTR("AVAudioUnit instantiateWithComponentDescription timed out");
      }
      *(_DWORD *)buf = 138412290;
      v33 = v10;
      _os_log_impl(&dword_229580000, v8, OS_LOG_TYPE_ERROR, "AU instatiation failed with %@", buf, 0xCu);
      if (v9)

    }
    v7 = 0;
  }
  else
  {
    v7 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v7;
}

void __30__APCListenerEngine_createAU___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));
}

+ (id)listenerWithCodecConfig:(id)a3 queue:(id)a4 dataReceivedHandler:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  APCListenerEngine *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[APCListenerEngine initWithCodecConfig:queue:dataReceivedHandler:resultData:error:]([APCListenerEngine alloc], "initWithCodecConfig:queue:dataReceivedHandler:resultData:error:", v9, v10, v11, 0, a6);

  return v12;
}

+ (id)listenerWithCodecConfig:(id)a3 queue:(id)a4 dataReceivedHandler:(id)a5 resultData:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  APCListenerEngine *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[APCListenerEngine initWithCodecConfig:queue:dataReceivedHandler:resultData:error:]([APCListenerEngine alloc], "initWithCodecConfig:queue:dataReceivedHandler:resultData:error:", v11, v12, v13, v14, a7);

  return v15;
}

- (APCListenerEngine)initWithCodecConfig:(id)a3 queue:(id)a4 dataReceivedHandler:(id)a5 resultData:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  APCListenerEngine *v17;
  id *p_isa;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  APCListenerEngine *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  _BYTE v37[20];
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v38.receiver = self;
  v38.super_class = (Class)APCListenerEngine;
  v17 = -[APCListenerEngine init](&v38, sel_init);
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    if (v13)
    {
      objc_storeStrong((id *)&v17->_codecConfig, a3);
      +[AUPasscodeDecoder registerAU](AUPasscodeDecoder, "registerAU");
      +[AUPasscodeDecoder getAUDesc](AUPasscodeDecoder, "getAUDesc");
      objc_msgSend(p_isa, "createAU:", v37);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = p_isa[3];
      p_isa[3] = (id)v19;

      v21 = p_isa[3];
      if (v21)
      {
        objc_msgSend(v21, "AUAudioUnit");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(p_isa[3], "AUAudioUnit");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = p_isa[4];
          p_isa[4] = (id)v23;

          objc_msgSend(p_isa[4], "setCodecConfig:", v13);
          v25 = v14;
          if (!v14)
          {
            dispatch_get_global_queue(0, 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(p_isa[4], "setDispatchQueue:", v25);
          if (!v14)

          objc_msgSend(p_isa[4], "setDataHandler:", v15);
          objc_msgSend(p_isa[4], "setResultData:", v16);
          objc_msgSend(p_isa[4], "resultData");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26 == 0;

          if (!v27)
          {
            objc_msgSend(p_isa[4], "resultData");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "reset");

          }
          objc_msgSend(p_isa, "setupAudioSession");
          objc_msgSend(p_isa, "createEngineAndAttachNodes");

          goto LABEL_12;
        }
        APCLogObject();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v40 = v35;
          _os_log_impl(&dword_229580000, v33, OS_LOG_TYPE_ERROR, "Encoder AU is not the expected class, it's a %@", buf, 0xCu);

        }
        if (a7)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AudioPasscodeDomain"), 0, 0);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }

LABEL_27:
        v29 = 0;
        goto LABEL_28;
      }
      APCLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229580000, v32, OS_LOG_TYPE_ERROR, "Failed to create the decoder AU", buf, 2u);
      }

      if (!a7)
        goto LABEL_27;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AudioPasscodeDomain"), 0, 0);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      APCLogObject();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229580000, v30, OS_LOG_TYPE_ERROR, "Bad arguments to APCListenerEngine", buf, 2u);
      }

      if (!a7)
        goto LABEL_27;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AudioPasscodeDomain"), 1, 0);
      v31 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = 0;
    *a7 = v31;
    goto LABEL_28;
  }
LABEL_12:
  v29 = p_isa;
LABEL_28:

  return v29;
}

- (void)setupAudioSession
{
  AVAudioSession *v2;
  AVAudioSession *session;
  AVAudioSession *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  AVAudioSession *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  id v17;
  AVAudioSession *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  AVAudioSession *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  NSInteger v54;
  void *v55;
  id v56;
  AVAudioSession *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  AVAudioSession *v62;
  double v63;
  double v64;
  BOOL v65;
  id v66;
  NSObject *v67;
  void *v68;
  id obj;
  void *v71;
  NSObject *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  id v93;
  uint8_t v94[128];
  uint8_t buf[4];
  unint64_t v96;
  __int16 v97;
  id v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB1858], "auxiliarySession");
  v2 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v2;

  v4 = self->_session;
  v5 = *MEMORY[0x24BDB15A0];
  v93 = 0;
  -[AVAudioSession setCategory:withOptions:error:](v4, "setCategory:withOptions:error:", v5, 41, &v93);
  v6 = v93;
  if (v6)
  {
    APCLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v96 = (unint64_t)v6;
      _os_log_impl(&dword_229580000, v7, OS_LOG_TYPE_ERROR, "Error setting session category to record: %@", buf, 0xCu);
    }

  }
  v8 = self->_session;
  v92 = v6;
  -[AVAudioSession preferDecoupledIO:error:](v8, "preferDecoupledIO:error:", 1, &v92);
  v9 = v92;

  if (v9)
  {
    APCLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v96 = (unint64_t)v9;
      _os_log_impl(&dword_229580000, v10, OS_LOG_TYPE_ERROR, "Error setting preferDecoupledIO on session: %@", buf, 0xCu);
    }

  }
  -[AVAudioSession availableInputs](self->_session, "availableInputs");
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v89;
    v13 = *MEMORY[0x24BDB16C8];
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v89 != v12)
          objc_enumerationMutation(obj);
        v71 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        objc_msgSend(v71, "portType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v13);

        if (v16)
        {
          v18 = self->_session;
          v87 = v9;
          -[AVAudioSession setPreferredInput:error:](v18, "setPreferredInput:error:", v71, &v87);
          v17 = v87;

          if (v17)
          {
            APCLogObject();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v96 = (unint64_t)v17;
              _os_log_impl(&dword_229580000, v19, OS_LOG_TYPE_ERROR, "Failed to set preferred input to built-in mic: %@", buf, 0xCu);
            }
          }
          else
          {
            v72 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v71, "dataSources");
            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            v73 = (id)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
            if (v20)
            {
              v21 = *(_QWORD *)v84;
              v22 = *MEMORY[0x24BDB1658];
              do
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v84 != v21)
                    objc_enumerationMutation(v73);
                  v24 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
                  APCLogObject();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v24, "location");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "orientation");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v96 = (unint64_t)v26;
                    v97 = 2112;
                    v98 = v27;
                    _os_log_impl(&dword_229580000, v25, OS_LOG_TYPE_INFO, "Mic location/orientation is %@ %@", buf, 0x16u);

                  }
                  objc_msgSend(v24, "orientation");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v28, "isEqualToString:", v22);

                  if (v29)
                    -[NSObject addObject:](v72, "addObject:", v24);
                }
                v20 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
              }
              while (v20);
            }

            if (-[NSObject count](v72, "count"))
            {
              v81 = 0u;
              v82 = 0u;
              v79 = 0u;
              v80 = 0u;
              v30 = v72;
              v31 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
              if (v31)
              {
                v32 = *(_QWORD *)v80;
                v33 = *MEMORY[0x24BDB1600];
                while (2)
                {
                  for (k = 0; k != v31; ++k)
                  {
                    if (*(_QWORD *)v80 != v32)
                      objc_enumerationMutation(v30);
                    v35 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
                    objc_msgSend(v35, "location");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = objc_msgSend(v36, "isEqualToString:", v33);

                    if (v37)
                    {
                      APCLogObject();
                      v44 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                      {
                        objc_msgSend(v35, "location");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v35, "orientation");
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v96 = (unint64_t)v45;
                        v97 = 2112;
                        v98 = v46;
                        _os_log_impl(&dword_229580000, v44, OS_LOG_TYPE_INFO, "Setting preferred microphone as '%@ %@'", buf, 0x16u);

                      }
                      v78 = 0;
                      objc_msgSend(v71, "setPreferredDataSource:error:", v35, &v78);
                      v17 = v78;
                      if (v17)
                      {
                        APCLogObject();
                        v47 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v96 = (unint64_t)v17;
                          _os_log_impl(&dword_229580000, v47, OS_LOG_TYPE_ERROR, "Failed to set preferred mic source: %@", buf, 0xCu);
                        }

                      }
                      goto LABEL_52;
                    }
                  }
                  v31 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
                  if (v31)
                    continue;
                  break;
                }
              }

              APCLogObject();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                -[NSObject objectAtIndexedSubscript:](v30, "objectAtIndexedSubscript:", 0);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "location");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject objectAtIndexedSubscript:](v30, "objectAtIndexedSubscript:", 0);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "orientation");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v96 = (unint64_t)v40;
                v97 = 2112;
                v98 = v42;
                _os_log_impl(&dword_229580000, v38, OS_LOG_TYPE_INFO, "Choosing first available back microphone: '%@ %@'", buf, 0x16u);

              }
              -[NSObject objectAtIndexedSubscript:](v30, "objectAtIndexedSubscript:", 0);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = 0;
              objc_msgSend(v71, "setPreferredDataSource:error:", v43, &v77);
              v17 = v77;

              if (v17)
              {
                APCLogObject();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v96 = (unint64_t)v17;
                  _os_log_impl(&dword_229580000, v30, OS_LOG_TYPE_ERROR, "Failed to set preferred mic source: %@", buf, 0xCu);
                }
LABEL_52:

              }
            }
            else
            {
              v17 = 0;
            }

            v19 = v72;
          }

          goto LABEL_56;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = v9;
LABEL_56:

  v48 = self->_session;
  -[AUPasscodeDecoder codecConfig](self->_decoderAU, "codecConfig");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  -[AVAudioSession setPreferredSampleRate:error:](v48, "setPreferredSampleRate:error:", &v76, (double)objc_msgSend(v49, "sampleRate"));
  v50 = v76;

  if (v50)
  {
    APCLogObject();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      -[AUPasscodeDecoder codecConfig](self->_decoderAU, "codecConfig");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "sampleRate");
      *(_DWORD *)buf = 134218242;
      v96 = llround((double)v53);
      v97 = 2112;
      v98 = v50;
      _os_log_impl(&dword_229580000, v51, OS_LOG_TYPE_ERROR, "Error setting preferred sample rate to %ld: %@", buf, 0x16u);

    }
  }
  v54 = -[AVAudioSession inputNumberOfChannels](self->_session, "inputNumberOfChannels");
  -[AUPasscodeDecoder codecConfig](self->_decoderAU, "codecConfig");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v54) = v54 == objc_msgSend(v55, "numChannels");

  if ((v54 & 1) != 0)
  {
    v56 = v50;
  }
  else
  {
    v57 = self->_session;
    -[AUPasscodeDecoder codecConfig](self->_decoderAU, "codecConfig");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v50;
    -[AVAudioSession setPreferredInputNumberOfChannels:error:](v57, "setPreferredInputNumberOfChannels:error:", objc_msgSend(v58, "numChannels"), &v75);
    v56 = v75;

    if (v56)
    {
      APCLogObject();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        -[AUPasscodeDecoder codecConfig](self->_decoderAU, "codecConfig");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "numChannels");
        *(_DWORD *)buf = 134218242;
        v96 = v61;
        v97 = 2112;
        v98 = v56;
        _os_log_impl(&dword_229580000, v59, OS_LOG_TYPE_ERROR, "Couldn't set preferred number of input channels to %ld (AU will handle the mapping): %@", buf, 0x16u);

      }
    }
  }
  -[AVAudioSession sampleRate](self->_session, "sampleRate");
  v62 = self->_session;
  v74 = v56;
  v64 = 256.0 / v63;
  v65 = -[AVAudioSession setPreferredIOBufferDuration:error:](v62, "setPreferredIOBufferDuration:error:", &v74, 256.0 / v63);
  v66 = v74;

  if (!v65)
  {
    APCLogObject();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v66, "localizedDescription");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v96 = *(_QWORD *)&v64;
      v97 = 2112;
      v98 = v68;
      _os_log_impl(&dword_229580000, v67, OS_LOG_TYPE_ERROR, "Error setting preferred io buffer duration to %0.3f seconds: %@", buf, 0x16u);

    }
  }

}

- (void)createEngineAndAttachNodes
{
  AVAudioEngine *v3;
  AVAudioEngine *engine;
  void *v5;
  OpaqueAudioComponentInstance *v6;
  OSStatus v7;
  NSObject *v8;
  int inData;
  uint8_t buf[4];
  OSStatus v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x24BDB1800]);
  engine = self->_engine;
  self->_engine = v3;

  -[AVAudioEngine attachNode:](self->_engine, "attachNode:", self->_decoderAUNode);
  inData = -[AVAudioSession opaqueSessionID](self->_session, "opaqueSessionID");
  -[AVAudioEngine inputNode](self->_engine, "inputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (OpaqueAudioComponentInstance *)objc_msgSend(v5, "audioUnit");

  v7 = AudioUnitSetProperty(v6, 0x7E7u, 0, 0, &inData, 4u);
  if (v7)
  {
    APCLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v7;
      _os_log_impl(&dword_229580000, v8, OS_LOG_TYPE_ERROR, "Setting the audio session ID for the listener's input node failed: %d", buf, 8u);
    }

  }
}

- (BOOL)validateInputNodeWithFormat:(id)a3
{
  id v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  v6 = v3 && (objc_msgSend(v3, "sampleRate"), v5 > 0.0) && objc_msgSend(v4, "channelCount") != 0;

  return v6;
}

- (void)makeEngineConnectionsWithError:(id *)a3
{
  void *v5;
  AVAudioEngine *engine;
  void *v7;
  id v8;
  id v9;

  -[AVAudioUnit removeTapOnBus:](self->_decoderAUNode, "removeTapOnBus:", 0);
  -[AVAudioEngine inputNode](self->_engine, "inputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputFormatForBus:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (-[APCListenerEngine validateInputNodeWithFormat:](self, "validateInputNodeWithFormat:", v9))
  {
    engine = self->_engine;
    -[AVAudioEngine inputNode](engine, "inputNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioEngine connect:to:format:](engine, "connect:to:format:", v7, self->_decoderAUNode, v9);

    -[AVAudioUnit installTapOnBus:bufferSize:format:block:](self->_decoderAUNode, "installTapOnBus:bufferSize:format:block:", 0, 0x2000, v9, &__block_literal_global_0);
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -10868, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  *a3 = v8;

}

- (void)startEngineWithError:(id *)a3
{
  AVAudioSession *session;
  BOOL v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  AVAudioEngine *engine;
  BOOL v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!-[AVAudioEngine isRunning](self->_engine, "isRunning"))
  {
    session = self->_session;
    v20 = 0;
    v6 = -[AVAudioSession setActive:error:](session, "setActive:error:", 1, &v20);
    v7 = v20;
    if (v7)
      v8 = 0;
    else
      v8 = v6;
    if (v8)
    {
      v19 = 0;
      -[APCListenerEngine makeEngineConnectionsWithError:](self, "makeEngineConnectionsWithError:", &v19);
      v9 = v19;
      if (v9)
      {
        v10 = v9;
        APCLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v10;
          _os_log_impl(&dword_229580000, v11, OS_LOG_TYPE_ERROR, "Error making engine connection: %@", buf, 0xCu);
        }

      }
      else
      {
        -[AUPasscodeDecoder startAudioLogCapture](self->_decoderAU, "startAudioLogCapture");
        engine = self->_engine;
        v18 = 0;
        v14 = -[AVAudioEngine startAndReturnError:](engine, "startAndReturnError:", &v18);
        v15 = v18;
        if (v15)
          v16 = 0;
        else
          v16 = v14;
        if (v16)
        {
          v10 = 0;
LABEL_15:

          return;
        }
        v10 = v15;
        APCLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v10;
          _os_log_impl(&dword_229580000, v17, OS_LOG_TYPE_ERROR, "Error starting engine: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v10 = v7;
      APCLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_229580000, v12, OS_LOG_TYPE_ERROR, "Error activating session: %@", buf, 0xCu);
      }

    }
    if (a3)
    {
      v10 = objc_retainAutorelease(v10);
      *a3 = v10;
    }
    goto LABEL_15;
  }
}

- (void)stopEngine
{
  -[AVAudioEngine stop](self->_engine, "stop");
  -[AUPasscodeDecoder stopAudioLogCapture](self->_decoderAU, "stopAudioLogCapture");
  -[AVAudioSession setActive:error:](self->_session, "setActive:error:", 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codecConfig, 0);
  objc_storeStrong((id *)&self->_decoderAU, 0);
  objc_storeStrong((id *)&self->_decoderAUNode, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
