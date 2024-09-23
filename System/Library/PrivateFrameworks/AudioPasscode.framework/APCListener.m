@implementation APCListener

+ (id)capabilityData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("version");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("aupccapability");
  v10[0] = v2;
  +[AUPasscodeDecoder supportedDecoders](AUPasscodeDecoder, "supportedDecoders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithData:", v6);

  return v7;
}

- (APCListener)init
{
  id v3;
  APCListener *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  v4 = -[APCListener initWithConfigurationData:](self, "initWithConfigurationData:", v3);

  return v4;
}

- (APCListener)initWithConfigurationData:(id)a3
{
  id v4;
  APCListener *v5;
  uint64_t v6;
  AUPasscodeCodecConfiguration *codecConfig;
  AUPasscodeCodecConfiguration *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  APCListenerResultData *v12;
  APCListenerResultData *resultData;
  APCListener *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APCListener;
  v5 = -[APCListener init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    codecConfig = v5->_codecConfig;
    v5->_codecConfig = (AUPasscodeCodecConfiguration *)v6;

    v8 = v5->_codecConfig;
    if (v8)
    {
      if (-[AUPasscodeCodecConfiguration payloadLengthBytes](v8, "payloadLengthBytes") > 0)
      {
        APCLogObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = -[AUPasscodeCodecConfiguration payloadLengthBytes](v5->_codecConfig, "payloadLengthBytes");
          -[AUPasscodeCodecConfiguration algorithmName](v5->_codecConfig, "algorithmName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v19 = v10;
          v20 = 2112;
          v21 = v11;
          _os_log_impl(&dword_229580000, v9, OS_LOG_TYPE_INFO, "Created with configuration data. Payload length = %ld, codec = %@", buf, 0x16u);

        }
        v12 = objc_alloc_init(APCListenerResultData);
        resultData = v5->_resultData;
        v5->_resultData = v12;

        goto LABEL_7;
      }
      APCLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229580000, v15, OS_LOG_TYPE_ERROR, "Codec config has a payload size less than 1, that's not valid!", buf, 2u);
      }
    }
    else
    {
      APCLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229580000, v15, OS_LOG_TYPE_ERROR, "Failed to unarchive the configuration data object", buf, 2u);
      }
    }

    v14 = 0;
    goto LABEL_14;
  }
LABEL_7:
  v14 = v5;
LABEL_14:

  return v14;
}

- (APCListener)initWithCodecConfiguration:(id)a3
{
  id v5;
  APCListener *v6;
  APCListener *v7;
  AUPasscodeCodecConfiguration *codecConfig;
  APCListenerResultData *v9;
  APCListenerResultData *resultData;
  APCListener *v11;
  NSObject *v12;
  const char *v13;
  __int16 v15[8];
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)APCListener;
  v6 = -[APCListener init](&v16, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  objc_storeStrong((id *)&v6->_codecConfig, a3);
  codecConfig = v7->_codecConfig;
  if (!codecConfig)
  {
    APCLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      v13 = "Config is nil, invalid";
LABEL_10:
      _os_log_impl(&dword_229580000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)v15, 2u);
    }
LABEL_11:

    v11 = 0;
    goto LABEL_12;
  }
  if (-[AUPasscodeCodecConfiguration payloadLengthBytes](codecConfig, "payloadLengthBytes") <= 0)
  {
    APCLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      v13 = "Codec config has a payload size less than 1, that's not valid!";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v9 = objc_alloc_init(APCListenerResultData);
  resultData = v7->_resultData;
  v7->_resultData = v9;

LABEL_5:
  v11 = v7;
LABEL_12:

  return v11;
}

- (void)startListening
{
  -[APCListener startListeningWithError:](self, "startListeningWithError:", 0);
}

- (void)startListeningWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  APCListenerResultData *resultData;
  AUPasscodeCodecConfiguration *codecConfig;
  APCListenerEngine *v12;
  APCListenerResultData *v13;
  APCListenerEngine *listenerEngine;
  NSObject *v15;
  APCListenerEngine *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  uint8_t buf[4];
  APCListenerResultData *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[APCListener dispatchQueue](self, "dispatchQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  APCLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    resultData = self->_resultData;
    *(_DWORD *)buf = 134217984;
    v22 = resultData;
    _os_log_impl(&dword_229580000, v9, OS_LOG_TYPE_INFO, "result data pointer: %p", buf, 0xCu);
  }

  codecConfig = self->_codecConfig;
  v19 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __39__APCListener_startListeningWithError___block_invoke;
  v20[3] = &unk_24F24BB58;
  v20[4] = self;
  +[APCListenerEngine listenerWithCodecConfig:queue:dataReceivedHandler:resultData:error:](APCListenerEngine, "listenerWithCodecConfig:queue:dataReceivedHandler:resultData:error:", codecConfig, v8, v20, self->_resultData, &v19);
  v12 = (APCListenerEngine *)objc_claimAutoreleasedReturnValue();
  v13 = (APCListenerResultData *)v19;
  listenerEngine = self->_listenerEngine;
  self->_listenerEngine = v12;

  if (v13)
  {
    APCLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_229580000, v15, OS_LOG_TYPE_ERROR, "Could not crate the APCListener engine: %@", buf, 0xCu);
    }

  }
  else
  {
    v16 = self->_listenerEngine;
    v18 = 0;
    -[APCListenerEngine startEngineWithError:](v16, "startEngineWithError:", &v18);
    v13 = (APCListenerResultData *)v18;
    if (!v13)
      goto LABEL_16;
    APCLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_229580000, v17, OS_LOG_TYPE_ERROR, "Could not start the APCListener engine: %@", buf, 0xCu);
    }

  }
  if (a3)
  {
    v13 = objc_retainAutorelease(v13);
    *a3 = v13;
  }
LABEL_16:

}

void __39__APCListener_startListeningWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "retrievedDataHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "retrievedDataHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v4)[2](v4, 0, v5);

  }
}

- (void)stopListening
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *queue;

  -[APCListenerEngine stopEngine](self->_listenerEngine, "stopEngine");
  if (self->_invalidationHandler)
  {
    -[APCListener dispatchQueue](self, "dispatchQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    queue = v5;

    dispatch_async(queue, self->_invalidationHandler);
  }
}

- (BOOL)getResultData:(id *)a3
{
  _BOOL4 v5;

  v5 = -[APCListenerResultData isValid](self->_resultData, "isValid");
  if (v5)
    *a3 = objc_retainAutorelease(self->_resultData);
  return v5;
}

- (id)retrievedDataHandler
{
  return self->_retrievedDataHandler;
}

- (void)setRetrievedDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_retrievedDataHandler, 0);
  objc_storeStrong((id *)&self->_resultData, 0);
  objc_storeStrong((id *)&self->_listenerEngine, 0);
  objc_storeStrong((id *)&self->_codecConfig, 0);
}

@end
