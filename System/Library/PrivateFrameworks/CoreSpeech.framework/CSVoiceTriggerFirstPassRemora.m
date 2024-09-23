@implementation CSVoiceTriggerFirstPassRemora

- (CSVoiceTriggerFirstPassRemora)init
{
  CSVoiceTriggerFirstPassRemora *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *remoraSecondPassRequests;
  uint64_t v7;
  NSMutableDictionary *accessoryFirstPassGoodnessScores;
  uint64_t v9;
  NSMutableDictionary *triggeredAudioStreamHoldingByAccessoryId;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSVoiceTriggerFirstPassRemora;
  v2 = -[CSVoiceTriggerFirstPassRemora init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueueWithQOS:name:fixedPriority:", 33, CFSTR("com.apple.corespeech.firstpassremora"), *MEMORY[0x1E0D192F0]);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    remoraSecondPassRequests = v2->_remoraSecondPassRequests;
    v2->_remoraSecondPassRequests = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    accessoryFirstPassGoodnessScores = v2->_accessoryFirstPassGoodnessScores;
    v2->_accessoryFirstPassGoodnessScores = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    triggeredAudioStreamHoldingByAccessoryId = v2->_triggeredAudioStreamHoldingByAccessoryId;
    v2->_triggeredAudioStreamHoldingByAccessoryId = (NSMutableDictionary *)v9;

  }
  return v2;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CSVoiceTriggerFirstPassRemora_start__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CSVoiceTriggerFirstPassRemora_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_remoraSecondPassRequests, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "reset");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setConnectedDeviceIds:(id)a3
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
  v7[2] = __55__CSVoiceTriggerFirstPassRemora_setConnectedDeviceIds___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_setDeviceIds:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_semaphore_t v10;
  void *v11;
  NSObject *v12;
  id obj;
  _QWORD v14[6];
  dispatch_semaphore_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = dispatch_semaphore_create(0);
        +[CSVoiceTriggerAssetHandler sharedHandler](CSVoiceTriggerAssetHandler, "sharedHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __47__CSVoiceTriggerFirstPassRemora__setDeviceIds___block_invoke;
        v14[3] = &unk_1E7C24118;
        v14[4] = self;
        v14[5] = v9;
        v15 = v10;
        v12 = v10;
        objc_msgSend(v11, "getVoiceTriggerAssetWithEndpointId:completion:", v9, v14);

        dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

- (void)_setIsSecondPassing:(BOOL)a3 forDeviceId:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CSSecondPassProgressDelegate **p_secondPassProgressDelegate;
  id WeakRetained;
  void *v11;
  void *v12;
  NSObject *v13;
  double v14;
  double v15;
  id v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_remoraSecondPassRequests, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "setIsSecondPassRunning:", v4);
      p_secondPassProgressDelegate = &self->_secondPassProgressDelegate;
      WeakRetained = objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);

      if (WeakRetained)
      {
        if (v4)
        {
          -[CSVoiceTriggerFirstPassRemora accessoryFirstPassGoodnessScores](self, "accessoryFirstPassGoodnessScores");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = *MEMORY[0x1E0D18F58];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
          {
            v18 = 136315651;
            v19 = "-[CSVoiceTriggerFirstPassRemora _setIsSecondPassing:forDeviceId:]";
            v20 = 2113;
            v21 = v6;
            v22 = 2113;
            v23 = v12;
            _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s First pass signal estimate for device %{private}@: %{private}@", (uint8_t *)&v18, 0x20u);
          }
          objc_msgSend(v12, "doubleValue");
          v15 = v14;
          v16 = objc_loadWeakRetained((id *)p_secondPassProgressDelegate);
          objc_msgSend(v16, "secondPassDidStartForClient:deviceId:withFirstPassEstimate:", 5, v6, v15);

        }
        else
        {
          v17 = objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
          objc_msgSend(v17, "secondPassDidStopForClient:deviceId:", 5, v6);

        }
      }
    }

  }
}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  CSVoiceTriggerFirstPassRemora *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__CSVoiceTriggerFirstPassRemora_activationEventNotificationHandler_event_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  v14 = self;
  v15 = v8;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)_createSecondPassRequestIfNecessaryForActivationEvent:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void (**v18)(_QWORD);
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  double v38;
  double v39;
  void *v40;
  float v41;
  double v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  NSMutableDictionary *remoraSecondPassRequests;
  void *v49;
  void (**v50)(_QWORD);
  void (**v51)(id, _QWORD, void *);
  void *v52;
  char v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  double v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  double v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v6, "activationInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("firstPassGoodness"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  v12 = v11;
  v13 = v12 + 0.0;
  v14 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v6, "deviceId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316163;
    v62 = "-[CSVoiceTriggerFirstPassRemora _createSecondPassRequestIfNecessaryForActivationEvent:completion:]";
    v63 = 2113;
    v64 = v16;
    v65 = 2049;
    v66 = v12 + 0.0;
    v67 = 2049;
    v68 = v12;
    v69 = 2049;
    v70 = 0.0;
    _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s accessory id %{private}@, ascore: %{private}f (raw=%{private}f, bump=%{private}f)", buf, 0x34u);

  }
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __98__CSVoiceTriggerFirstPassRemora__createSecondPassRequestIfNecessaryForActivationEvent_completion___block_invoke;
  v58[3] = &unk_1E7C241B8;
  v17 = v6;
  v59 = v17;
  v60 = v12 + 0.0;
  v18 = (void (**)(_QWORD))MEMORY[0x1C3BC4734](v58);
  if (v17)
  {
    objc_msgSend(v17, "activationInfo");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      objc_msgSend(v17, "activationInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", CFSTR("firstPassGoodness"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_27;
    }
  }
  v23 = objc_msgSend(v17, "hosttime");
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[NSMutableDictionary allKeys](self->_remoraSecondPassRequests, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
  if (!v25)
  {

LABEL_27:
    v18[2](v18);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    remoraSecondPassRequests = self->_remoraSecondPassRequests;
    objc_msgSend(v17, "deviceId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](remoraSecondPassRequests, "setObject:forKey:", v47, v49);

    if (v7)
      v7[2](v7, 0, v47);
    goto LABEL_29;
  }
  v26 = v25;
  v50 = v18;
  v51 = v7;
  v52 = v17;
  v27 = *(_QWORD *)v55;
  v53 = 1;
  do
  {
    for (i = 0; i != v26; ++i)
    {
      if (*(_QWORD *)v55 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_remoraSecondPassRequests, "objectForKeyedSubscript:", v29, v50);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isCancelled");

      if ((v31 & 1) == 0)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_remoraSecondPassRequests, "objectForKeyedSubscript:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "timestamp");

        v34 = (void *)MEMORY[0x1E0D19118];
        -[NSMutableDictionary objectForKeyedSubscript:](self->_remoraSecondPassRequests, "objectForKeyedSubscript:", v29);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "timestamp");
        v37 = v23 <= v33 ? v36 - v23 : v23 - v36;
        objc_msgSend(v34, "hostTimeToTimeInterval:", v37);
        v39 = v38;

        if (v39 <= 0.349999994)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_remoraSecondPassRequests, "objectForKeyedSubscript:", v29);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "goodnessScore");
          v42 = v41;

          if (v13 <= v42)
          {
            v53 = 0;
          }
          else
          {
            v43 = (void *)*MEMORY[0x1E0D18F58];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
            {
              v44 = v43;
              objc_msgSend(v52, "deviceId");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316419;
              v62 = "-[CSVoiceTriggerFirstPassRemora _createSecondPassRequestIfNecessaryForActivationEvent:completion:]";
              v63 = 2113;
              v64 = v29;
              v65 = 2048;
              v66 = v13;
              v67 = 2113;
              v68 = *(double *)&v45;
              v69 = 2048;
              v70 = v42;
              v71 = 2113;
              v72 = v29;
              _os_log_impl(&dword_1C2614000, v44, OS_LOG_TYPE_DEFAULT, "%s Pre-Myriad is cancelling activation on device %{private}@ (activation goodness score: %f (deviceId: %{private}@), competing goodness score: %f (deviceId: %{private}@))", buf, 0x3Eu);

            }
            -[NSMutableDictionary objectForKeyedSubscript:](self->_remoraSecondPassRequests, "objectForKeyedSubscript:", v29);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "cancelRequest");

            -[NSMutableDictionary removeObjectForKey:](self->_remoraSecondPassRequests, "removeObjectForKey:", v29);
          }
        }
      }
    }
    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
  }
  while (v26);

  v18 = v50;
  v7 = v51;
  v17 = v52;
  if ((v53 & 1) != 0)
    goto LABEL_27;
  if (v51)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 605, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v51)[2](v51, v47, 0);
LABEL_29:

  }
}

- (void)accessorySiriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7 forAccessory:(id)a8
{
  id v9;
  NSObject *queue;
  id v11;
  _QWORD v12[4];
  id v13;
  CSVoiceTriggerFirstPassRemora *v14;

  v9 = a8;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __141__CSVoiceTriggerFirstPassRemora_accessorySiriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID_forAccessory___block_invoke;
  v12[3] = &unk_1E7C292A0;
  v13 = v9;
  v14 = self;
  v11 = v9;
  dispatch_async(queue, v12);

}

- (void)_handleRemoraTriggerEvent:(id)a3 secondPassRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CSVoiceTriggerSecondPassRequestOption *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CSVoiceTriggerSecondPassRequestOption *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  CSVoiceTriggerFirstPassRemora *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v30 = a5;
  +[CSVoiceTriggerFirstPassMetrics CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:](CSVoiceTriggerFirstPassMetrics, "CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:", objc_msgSend(v8, "hosttime"), mach_absolute_time());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D19008];
  objc_msgSend(v8, "deviceId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contextForRemoraVoiceTriggerWithDeviceId:", v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __88__CSVoiceTriggerFirstPassRemora__handleRemoraTriggerEvent_secondPassRequest_completion___block_invoke;
  v39[3] = &unk_1E7C29060;
  v13 = v9;
  v40 = v13;
  -[CSVoiceTriggerFirstPassRemora _requestStartAudioStreamProviderWithContext:secondPassRequest:startStreamOption:completion:](self, "_requestStartAudioStreamProviderWithContext:secondPassRequest:startStreamOption:completion:", v32, v13, 0, v39);
  v14 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v8, "deviceId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v42 = "-[CSVoiceTriggerFirstPassRemora _handleRemoraTriggerEvent:secondPassRequest:completion:]";
    v43 = 2112;
    v44 = v16;
    _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);

  }
  objc_msgSend(v8, "deviceId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSVoiceTriggerFirstPassRemora _setIsSecondPassing:forDeviceId:](self, "_setIsSecondPassing:forDeviceId:", 1, v17);

  objc_initWeak((id *)buf, self);
  objc_msgSend(v13, "secondChanceContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "shouldRunAsSecondChance");

  v20 = [CSVoiceTriggerSecondPassRequestOption alloc];
  objc_msgSend(v8, "deviceId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "audioProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activationInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:](v20, "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:", 7, v21, v23, v24, v12, v19, v31, 0);

  objc_msgSend(v13, "voiceTriggerSecondPass");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __88__CSVoiceTriggerFirstPassRemora__handleRemoraTriggerEvent_secondPassRequest_completion___block_invoke_123;
  v33[3] = &unk_1E7C241E0;
  objc_copyWeak(&v38, (id *)buf);
  v27 = v13;
  v34 = v27;
  v28 = v8;
  v35 = v28;
  v29 = v30;
  v36 = self;
  v37 = v29;
  objc_msgSend(v26, "handleVoiceTriggerSecondPassFrom:completion:", v25, v33);

  objc_destroyWeak(&v38);
  objc_destroyWeak((id *)buf);

}

- (void)_handleSecondPassResult:(id)a3 secondPassRequest:(id)a4 deviceId:(id)a5 error:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, id);
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id WeakRetained;
  char v32;
  NSObject *v33;
  id v34;
  char v35;
  void *v36;
  void *v37;
  CSVoiceTriggerSecondChanceContext *v38;
  NSObject *queue;
  char location;
  char locationa;
  void *v42;
  void *v43;
  char v44;
  _QWORD block[5];
  id v46;
  id v47;
  uint64_t v48;
  char v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  _BYTE v53[14];
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, id))a7;
  v17 = objc_msgSend(v12, "result");
  objc_msgSend(v12, "voiceTriggerEventInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == 4)
  {
    if (v16)
      v16[2](v16, 0, v15);
    goto LABEL_31;
  }
  v19 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    objc_msgSend(v15, "localizedDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v51 = "-[CSVoiceTriggerFirstPassRemora _handleSecondPassResult:secondPassRequest:deviceId:error:completion:]";
    v52 = 1026;
    *(_DWORD *)v53 = v17;
    *(_WORD *)&v53[4] = 2114;
    *(_QWORD *)&v53[6] = v18;
    v54 = 2114;
    v55 = v14;
    v56 = 2114;
    v57 = v21;
    _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %{public}d, %{public}@, %{public}@, %{public}@", buf, 0x30u);

  }
  v44 = objc_msgSend(v13, "isCancelled");
  if ((v44 & 1) != 0)
  {
    v22 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[CSVoiceTriggerFirstPassRemora _handleSecondPassResult:secondPassRequest:deviceId:error:completion:]";
      _os_log_fault_impl(&dword_1C2614000, v22, OS_LOG_TYPE_FAULT, "%s VoiceTrigger Second Pass has been marked for cancellation.", buf, 0xCu);
    }
    goto LABEL_25;
  }
  v23 = v18;
  v24 = v15;
  v42 = v23;
  v25 = (void *)objc_msgSend(v23, "mutableCopy");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v13, "firstPassTriggerEndTime");
  objc_msgSend(v26, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v25;
  objc_msgSend(v25, "setObject:forKey:", v27, *MEMORY[0x1E0D19440]);

  if (v17 == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v32 = objc_opt_respondsToSelector();

    v15 = v24;
    v18 = v42;
    if ((v32 & 1) == 0)
      goto LABEL_24;
    v33 = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject voiceTriggerDidDetectNearMiss:deviceId:](v33, "voiceTriggerDidDetectNearMiss:deviceId:", v43, v14);
LABEL_18:

    goto LABEL_24;
  }
  v15 = v24;
  if (v17 == 2)
  {
    v34 = objc_loadWeakRetained((id *)&self->_delegate);
    v35 = objc_opt_respondsToSelector();

    v18 = v42;
    if ((v35 & 1) == 0)
      goto LABEL_24;
    v33 = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject voiceTriggerDidRejected:deviceId:](v33, "voiceTriggerDidRejected:deviceId:", v43, v14);
    goto LABEL_18;
  }
  v18 = v42;
  if (v17 != 1)
  {
    v36 = (void *)*MEMORY[0x1E0D18F58];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v33 = v36;
    objc_msgSend(v15, "localizedDescription");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v51 = "-[CSVoiceTriggerFirstPassRemora _handleSecondPassResult:secondPassRequest:deviceId:error:completion:]";
    v52 = 2114;
    *(_QWORD *)v53 = v37;
    _os_log_error_impl(&dword_1C2614000, v33, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", buf, 0x16u);

    goto LABEL_18;
  }
  v28 = objc_loadWeakRetained((id *)&self->_delegate);
  location = objc_opt_respondsToSelector();

  v29 = objc_loadWeakRetained((id *)&self->_delegate);
  v30 = v29;
  if ((location & 1) != 0)
  {
    objc_msgSend(v29, "voiceTriggerDidDetectKeyword:deviceId:completion:", v43, v14, 0);
LABEL_23:

    goto LABEL_24;
  }
  locationa = objc_opt_respondsToSelector();

  if ((locationa & 1) != 0)
  {
    v30 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v30, "voiceTriggerDidDetectKeyword:deviceId:", v43, v14);
    goto LABEL_23;
  }
LABEL_24:

LABEL_25:
  if (objc_msgSend(v12, "isSecondChanceCandidate"))
    v38 = -[CSVoiceTriggerSecondChanceContext initWithWindowStartTime:]([CSVoiceTriggerSecondChanceContext alloc], "initWithWindowStartTime:", mach_absolute_time());
  else
    v38 = 0;
  objc_msgSend(v13, "setSecondChanceContext:", v38);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__CSVoiceTriggerFirstPassRemora__handleSecondPassResult_secondPassRequest_deviceId_error_completion___block_invoke;
  block[3] = &unk_1E7C24208;
  block[4] = self;
  v46 = v14;
  v47 = v13;
  v48 = v17;
  v49 = v44;
  dispatch_async(queue, block);
  if (v16)
    v16[2](v16, 1, 0);

LABEL_31:
}

- (void)_requestStartAudioStreamProviderWithContext:(id)a3 secondPassRequest:(id)a4 startStreamOption:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a4;
  v9 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __124__CSVoiceTriggerFirstPassRemora__requestStartAudioStreamProviderWithContext_secondPassRequest_startStreamOption_completion___block_invoke;
  v17[3] = &unk_1E7C290D8;
  v10 = v9;
  v18 = v10;
  v11 = a3;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v17);
  +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v13, "audioProviderWithContext:error:", v11, &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v16;
  if (v14)
    objc_msgSend(v8, "setAudioProvider:", v14);
  ((void (**)(_QWORD, BOOL, id))v12)[2](v12, v14 != 0, v15);

}

- (void)_cancelAudioStreamHoldingForAccessoryWithId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CSVoiceTriggerFirstPassRemora triggeredAudioStreamHoldingByAccessoryId](self, "triggeredAudioStreamHoldingByAccessoryId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "audioStreamHolding");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "audioProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && v7)
      {
        v9 = *MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_INFO))
        {
          v10 = 136315395;
          v11 = "-[CSVoiceTriggerFirstPassRemora _cancelAudioStreamHoldingForAccessoryWithId:]";
          v12 = 2113;
          v13 = v4;
          _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s Cancelling audio stream hold for accessory: %{private}@", (uint8_t *)&v10, 0x16u);
        }
        objc_msgSend(v8, "cancelAudioStreamHold:", v7);
      }

    }
  }

}

- (void)_cancelAllAudioStreamHoldings
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_remoraSecondPassRequests, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancelAudioStreamHold");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)cancelSecondPassRunning
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CSVoiceTriggerFirstPassRemora_cancelSecondPassRunning__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)pendingSecondPassTriggerWasClearedForClient:(unint64_t)a3 deviceId:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  CSVoiceTriggerFirstPassRemora *v11;
  unint64_t v12;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__CSVoiceTriggerFirstPassRemora_pendingSecondPassTriggerWasClearedForClient_deviceId___block_invoke;
  block[3] = &unk_1E7C28B58;
  v11 = self;
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSSecondPassProgressDelegate)secondPassProgressDelegate
{
  return (CSSecondPassProgressDelegate *)objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
}

- (void)setSecondPassProgressDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_secondPassProgressDelegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)remoraSecondPassRequests
{
  return self->_remoraSecondPassRequests;
}

- (void)setRemoraSecondPassRequests:(id)a3
{
  objc_storeStrong((id *)&self->_remoraSecondPassRequests, a3);
}

- (NSMutableDictionary)accessoryFirstPassGoodnessScores
{
  return self->_accessoryFirstPassGoodnessScores;
}

- (void)setAccessoryFirstPassGoodnessScores:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryFirstPassGoodnessScores, a3);
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentAsset, a3);
}

- (NSMutableDictionary)triggeredAudioStreamHoldingByAccessoryId
{
  return self->_triggeredAudioStreamHoldingByAccessoryId;
}

- (void)setTriggeredAudioStreamHoldingByAccessoryId:(id)a3
{
  objc_storeStrong((id *)&self->_triggeredAudioStreamHoldingByAccessoryId, a3);
}

- (CSAudioProvider)triggeredAudioProvider
{
  return self->_triggeredAudioProvider;
}

- (void)setTriggeredAudioProvider:(id)a3
{
  objc_storeStrong((id *)&self->_triggeredAudioProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggeredAudioProvider, 0);
  objc_storeStrong((id *)&self->_triggeredAudioStreamHoldingByAccessoryId, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_accessoryFirstPassGoodnessScores, 0);
  objc_storeStrong((id *)&self->_remoraSecondPassRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_secondPassProgressDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __86__CSVoiceTriggerFirstPassRemora_pendingSecondPassTriggerWasClearedForClient_deviceId___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 48) == 5)
  {
    if (*(_QWORD *)(result + 32))
      return objc_msgSend(*(id *)(result + 40), "_cancelAudioStreamHoldingForAccessoryWithId:");
  }
  return result;
}

void __56__CSVoiceTriggerFirstPassRemora_cancelSecondPassRunning__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CSVoiceTriggerFirstPassRemora cancelSecondPassRunning]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Trying to cancel all 2nd pass in Remora", buf, 0xCu);
  }
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cancelRequest");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

uint64_t __124__CSVoiceTriggerFirstPassRemora__requestStartAudioStreamProviderWithContext_secondPassRequest_startStreamOption_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __101__CSVoiceTriggerFirstPassRemora__handleSecondPassResult_secondPassRequest_deviceId_error_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CSRemoraSecondPassAudioStreamHoldingContext *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_setIsSecondPassing:forDeviceId:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "reset");
  if (*(_QWORD *)(a1 + 56) == 1 && !*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 48), "audioStreamHolding");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "audioProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "firstPassDeviceID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && v6)
    {
      if (v2)
      {
        v4 = objc_alloc_init(CSRemoraSecondPassAudioStreamHoldingContext);
        -[CSRemoraSecondPassAudioStreamHoldingContext setAudioProvider:](v4, "setAudioProvider:", v2);
        -[CSRemoraSecondPassAudioStreamHoldingContext setAudioStreamHolding:](v4, "setAudioStreamHolding:", v6);
        objc_msgSend(*(id *)(a1 + 32), "triggeredAudioStreamHoldingByAccessoryId");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v4, v3);

      }
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "cancelAudioStreamHold");
  }
}

void __88__CSVoiceTriggerFirstPassRemora__handleRemoraTriggerEvent_secondPassRequest_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0D18F58];
  v7 = *MEMORY[0x1E0D18F58];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSVoiceTriggerFirstPassRemora _handleRemoraTriggerEvent:secondPassRequest:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Audio provider available", (uint8_t *)&v10, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "holdAudioStreamWithTimeout:", 5.0);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = v6;
    objc_msgSend(v5, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[CSVoiceTriggerFirstPassRemora _handleRemoraTriggerEvent:secondPassRequest:completion:]_block_invoke";
    v12 = 2114;
    v13 = v9;
    _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Failed to fetch audio audio provider with error : %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

void __88__CSVoiceTriggerFirstPassRemora__handleRemoraTriggerEvent_secondPassRequest_completion___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v5 = (id *)(a1 + 64);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "deviceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleSecondPassResult:secondPassRequest:deviceId:error:completion:", v7, v9, v10, v6, *(_QWORD *)(a1 + 56));

  objc_msgSend(MEMORY[0x1E0D192A8], "sharedAggregator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "result");
  objc_msgSend(v7, "voiceTriggerEventInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "logSecondPassResult:eventInfo:triggerAPWakeUp:", v12, v13, 0);
  v14 = *(void **)(a1 + 40);
  v15 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 24);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__CSVoiceTriggerFirstPassRemora__handleRemoraTriggerEvent_secondPassRequest_completion___block_invoke_2;
  v18[3] = &unk_1E7C292A0;
  v16 = v14;
  v17 = *(_QWORD *)(a1 + 48);
  v19 = v16;
  v20 = v17;
  dispatch_async(v15, v18);

}

void __88__CSVoiceTriggerFirstPassRemora__handleRemoraTriggerEvent_secondPassRequest_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "deviceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[CSVoiceTriggerFirstPassRemora _handleRemoraTriggerEvent:secondPassRequest:completion:]_block_invoke_2";
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Teardown remora second pass request for device id : %{public}@", (uint8_t *)&v9, 0x16u);

  }
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  objc_msgSend(v6, "deviceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

uint64_t __141__CSVoiceTriggerFirstPassRemora_accessorySiriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID_forAccessory___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    v2 = result;
    v3 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315395;
      v5 = "-[CSVoiceTriggerFirstPassRemora accessorySiriClientBehaviorMonitor:didStartStreamWithContext:successfully:opt"
           "ion:withEventUUID:forAccessory:]_block_invoke";
      v6 = 2113;
      v7 = v1;
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Siri Client (Remora: accessoryId: %{private}@) start listening now, CSVoiceTriggerFirstPassRemora can stop listening now", (uint8_t *)&v4, 0x16u);
      v1 = *(_QWORD *)(v2 + 32);
    }
    return objc_msgSend(*(id *)(v2 + 40), "_cancelAudioStreamHoldingForAccessoryWithId:", v1);
  }
  return result;
}

CSRemoraSecondPassRequest *__98__CSVoiceTriggerFirstPassRemora__createSecondPassRequestIfNecessaryForActivationEvent_completion___block_invoke(uint64_t a1)
{
  CSRemoraSecondPassRequest *v2;
  void *v3;
  CSRemoraSecondPassRequest *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = [CSRemoraSecondPassRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "deviceId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CSRemoraSecondPassRequest initWithDeviceID:](v2, "initWithDeviceID:", v3);

  -[CSRemoraSecondPassRequest setTimestamp:](v4, "setTimestamp:", objc_msgSend(*(id *)(a1 + 32), "hosttime"));
  objc_msgSend(*(id *)(a1 + 32), "activationInfo");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(*(id *)(a1 + 32), "activationInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("firstPassGoodness"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(double *)(a1 + 40);
      *(float *)&v9 = v9;
      -[CSRemoraSecondPassRequest setGoodnessScore:](v4, "setGoodnessScore:", v9);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "activationInfo");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(*(id *)(a1 + 32), "activationInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("vtEndTime"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "activationInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("vtEndTime"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      -[CSRemoraSecondPassRequest setFirstPassTriggerEndTime:](v4, "setFirstPassTriggerEndTime:");

    }
  }
  return v4;
}

void __85__CSVoiceTriggerFirstPassRemora_activationEventNotificationHandler_event_completion___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(id, _QWORD);
  NSObject *v18;
  void (**v19)(id, _QWORD, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _BYTE *v28;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "type") == 8)
  {
    v2 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(a1[4], "deviceId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithUUIDString:", v3);

    objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "voiceTriggerEnabledForEndpointId:", v4);

    if ((v6 & 1) != 0)
    {
      v7 = (void *)*((_QWORD *)a1[5] + 4);
      objc_msgSend(a1[4], "deviceId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)*MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          v11 = a1[4];
          v12 = v10;
          objc_msgSend(v11, "deviceId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[CSVoiceTriggerFirstPassRemora activationEventNotificationHandler:event:completion:]_block_invoke";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v13;
          _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s We already have matched Remora second pass request : %{public}@", buf, 0x16u);

        }
        v14 = (void *)*((_QWORD *)a1[5] + 4);
        objc_msgSend(a1[4], "deviceId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[5], "_handleRemoraTriggerEvent:secondPassRequest:completion:", a1[4], v16, a1[6]);
      }
      else
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v30 = __Block_byref_object_copy__2541;
        v31 = __Block_byref_object_dispose__2542;
        v32 = 0;
        v21 = a1[4];
        v22 = a1[5];
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __85__CSVoiceTriggerFirstPassRemora_activationEventNotificationHandler_event_completion___block_invoke_112;
        v24[3] = &unk_1E7C24190;
        v25 = v21;
        v27 = a1[6];
        v28 = buf;
        v26 = a1[5];
        objc_msgSend(v22, "_createSecondPassRequestIfNecessaryForActivationEvent:completion:", v25, v24);

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      v18 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[CSVoiceTriggerFirstPassRemora activationEventNotificationHandler:event:completion:]_block_invoke";
        _os_log_error_impl(&dword_1C2614000, v18, OS_LOG_TYPE_ERROR, "%s Cannot handle remora VoiceTrigger request since VoiceTrigger is disabled", buf, 0xCu);
      }
      v19 = (void (**)(id, _QWORD, void *))a1[6];
      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 604, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v19[2](v19, 0, v20);

      }
    }

  }
  else
  {
    v17 = (void (**)(id, _QWORD))a1[6];
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v17[2](v17, 0);

    }
  }
}

void __85__CSVoiceTriggerFirstPassRemora_activationEventNotificationHandler_event_completion___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int8x16_t v21;
  _QWORD v22[4];
  int8x16_t v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "deviceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v27 = "-[CSVoiceTriggerFirstPassRemora activationEventNotificationHandler:event:completion:]_block_invoke";
      v28 = 2114;
      v29 = v10;
      v30 = 2114;
      v31 = v5;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Remora second pass request is prune out from PreMyriad : %{public}@, error: %{public}@", buf, 0x20u);

    }
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[CSVoiceTriggerFirstPassRemora activationEventNotificationHandler:event:completion:]_block_invoke";
      v28 = 2114;
      v29 = v12;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s There is no matched remora second pass request, creating new one : %{public}@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    if (v12 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 40), "accessoryFirstPassGoodnessScores");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v12);

      objc_msgSend(*(id *)(a1 + 40), "accessoryFirstPassGoodnessScores");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "goodnessScore");
      objc_msgSend(v16, "numberWithFloat:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v17, v12);

    }
    +[CSVoiceTriggerAssetHandler sharedHandler](CSVoiceTriggerAssetHandler, "sharedHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "deviceId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __85__CSVoiceTriggerFirstPassRemora_activationEventNotificationHandler_event_completion___block_invoke_114;
    v22[3] = &unk_1E7C24168;
    v25 = *(_QWORD *)(a1 + 56);
    v21 = *(int8x16_t *)(a1 + 32);
    v20 = (id)v21.i64[0];
    v23 = vextq_s8(v21, v21, 8uLL);
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v18, "getVoiceTriggerAssetWithEndpointId:completion:", v19, v22);

  }
}

void __85__CSVoiceTriggerFirstPassRemora_activationEventNotificationHandler_event_completion___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__CSVoiceTriggerFirstPassRemora_activationEventNotificationHandler_event_completion___block_invoke_2;
    block[3] = &unk_1E7C24140;
    v20 = *(_QWORD *)(a1 + 56);
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v16 = v8;
    v17 = v9;
    v18 = v10;
    v19 = *(id *)(a1 + 48);
    dispatch_async(v7, block);

  }
  else
  {
    v11 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v13 = v11;
      objc_msgSend(v6, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSVoiceTriggerFirstPassRemora activationEventNotificationHandler:event:completion:]_block_invoke";
      v23 = 2112;
      v24 = v14;
      _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s Failed to create voiceTriggerSecondPass remora since asset is nil : %@", buf, 0x16u);

    }
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v6);
  }

}

void __85__CSVoiceTriggerFirstPassRemora_activationEventNotificationHandler_event_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isCancelled") & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 605, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setAsset:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "start");
    objc_msgSend(*(id *)(a1 + 40), "_handleRemoraTriggerEvent:secondPassRequest:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 56));
  }
}

void __47__CSVoiceTriggerFirstPassRemora__setDeviceIds___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "setAsset:", v5);
      objc_msgSend(v4, "reset");
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

uint64_t __55__CSVoiceTriggerFirstPassRemora_setConnectedDeviceIds___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDeviceIds:", *(_QWORD *)(a1 + 40));
}

uint64_t __38__CSVoiceTriggerFirstPassRemora_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

void __38__CSVoiceTriggerFirstPassRemora_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVoiceTriggerFirstPassRemora start]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  +[CSAccessorySiriClientBehaviorMonitor sharedInstance](CSAccessorySiriClientBehaviorMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:", *(_QWORD *)(a1 + 32));

}

@end
