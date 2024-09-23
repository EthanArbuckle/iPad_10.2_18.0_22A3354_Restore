@implementation APCPlayer

- (APCPlayer)init
{
  id v3;
  APCPlayer *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  v4 = -[APCPlayer initWithListenerCapabilityData:payloadLength:](self, "initWithListenerCapabilityData:payloadLength:", v3, 0);

  return v4;
}

- (id)createCompatibleConfigForCapabilites:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        +[APCCodecFactory createBestConfigForCapability:](APCCodecFactory, "createBestConfigForCapability:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = v3;
          goto LABEL_13;
        }
      }
      v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }

  APCLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_229580000, v8, OS_LOG_TYPE_ERROR, "Can't find a codec capability data", v10, 2u);
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (APCPlayer)initWithListenerCapabilityData:(id)a3
{
  return -[APCPlayer initWithListenerCapabilityData:payloadLength:](self, "initWithListenerCapabilityData:payloadLength:", a3, 3);
}

- (APCPlayer)initWithListenerCapabilityData:(id)a3 payloadLength:(unint64_t)a4
{
  id v6;
  APCPlayer *v7;
  APCPlayer *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  APCPlayer *v19;
  void *v20;
  uint64_t v21;
  AUPasscodeCodecConfiguration *codecConfig;
  AUPasscodeCodecConfiguration *v23;
  NSObject *v24;
  AUPasscodeCodecConfiguration *v25;
  id v26;
  void *v27;
  uint64_t v28;
  NSData *configurationData;
  objc_super v31;
  uint8_t buf[4];
  AUPasscodeCodecConfiguration *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)APCPlayer;
  v7 = -[APCPlayer init](&v31, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_10;
  v7->_isPlaying = 0;
  if (!v6 || !objc_msgSend(v6, "length"))
  {
LABEL_20:
    v19 = 0;
    goto LABEL_21;
  }
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v15, v6, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_20;
  }
  v17 = v16;
  objc_msgSend(v17, "objectForKey:", CFSTR("version"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  if (!objc_msgSend(v18, "unsignedIntegerValue"))
  {
    objc_msgSend(v17, "objectForKey:", CFSTR("aupccapability"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[APCPlayer createCompatibleConfigForCapabilites:](v8, "createCompatibleConfigForCapabilites:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
        codecConfig = v8->_codecConfig;
        v8->_codecConfig = (AUPasscodeCodecConfiguration *)v21;

        v23 = v8->_codecConfig;
        if (v23)
        {
          -[AUPasscodeCodecConfiguration setPayloadLengthBytes:](v23, "setPayloadLengthBytes:", a4);
          APCLogObject();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = v8->_codecConfig;
            *(_DWORD *)buf = 138412290;
            v33 = v25;
            _os_log_impl(&dword_229580000, v24, OS_LOG_TYPE_INFO, "Created codec config from capabilities: %@", buf, 0xCu);
          }

          v26 = objc_alloc(MEMORY[0x24BDBCE50]);
          objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8->_codecConfig, 0, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v26, "initWithData:", v27);
          configurationData = v8->_configurationData;
          v8->_configurationData = (NSData *)v28;

          goto LABEL_9;
        }
      }
    }

    goto LABEL_19;
  }
LABEL_9:
  v8->_callbackTimingMSec = 300;

LABEL_10:
  v19 = v8;
LABEL_21:

  return v19;
}

- (APCPlayer)initWithCodecConfiguration:(id)a3
{
  id v5;
  APCPlayer *v6;
  APCPlayer *v7;
  AUPasscodeCodecConfiguration **p_codecConfig;
  NSObject *v9;
  AUPasscodeCodecConfiguration *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSData *configurationData;
  APCPlayer *v15;
  objc_super v17;
  uint8_t buf[4];
  AUPasscodeCodecConfiguration *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APCPlayer;
  v6 = -[APCPlayer init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isPlaying = 0;
    p_codecConfig = &v6->_codecConfig;
    objc_storeStrong((id *)&v6->_codecConfig, a3);
    if (!*p_codecConfig)
    {
      v15 = 0;
      goto LABEL_8;
    }
    APCLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *p_codecConfig;
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_229580000, v9, OS_LOG_TYPE_INFO, "Created codec config from configuration: %@", buf, 0xCu);
    }

    v11 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", *p_codecConfig, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithData:", v12);
    configurationData = v7->_configurationData;
    v7->_configurationData = (NSData *)v13;

  }
  v15 = v7;
LABEL_8:

  return v15;
}

- (void)setDispatchQueue:(id)a3
{
  APCPlayerEngine *playerEngine;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
  playerEngine = self->_playerEngine;
  if (playerEngine)
    -[APCPlayerEngine setDispatchQueue:](playerEngine, "setDispatchQueue:", v6);

}

- (void)setCallbackTimingMSec:(unint64_t)a3
{
  if (!self->_isPlaying)
    self->_callbackTimingMSec = a3;
}

+ (id)urlForCarrierAsset:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[APCPlayer fileNameForCarrierAsset:](APCPlayer, "fileNameForCarrierAsset:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", v3, CFSTR("wav"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    APCLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "absoluteString");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = 136315138;
      v10 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_229580000, v6, OS_LOG_TYPE_INFO, "Carrier Resource path: %s", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)fileNameForCarrierAsset:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return off_24F24BBA0[a3 - 1];
}

+ (id)carrierAssetIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("WOC");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("light");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("pingpong");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unint64_t)assetIDFromIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = a3;
  +[APCPlayer carrierAssetIdentifiers](APCPlayer, "carrierAssetIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = 0;

  return v7;
}

- (float)preparePayload:(id)a3 usingCarrierAsset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  APCPlayerEngine *v12;
  APCPlayerEngine *playerEngine;
  APCPlayerEngine *v14;
  float v15;
  float v16;
  NSObject *v17;
  uint64_t v18;
  int64_t v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = v8;
  if (!v8
    || (v10 = objc_msgSend(v8, "length"),
        v10 != -[AUPasscodeCodecConfiguration payloadLengthBytes](self->_codecConfig, "payloadLengthBytes")))
  {
    APCLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (v9)
        v18 = objc_msgSend(v9, "length");
      else
        v18 = 0;
      v19 = -[AUPasscodeCodecConfiguration payloadLengthBytes](self->_codecConfig, "payloadLengthBytes");
      v21 = 134218240;
      v22 = v18;
      v23 = 2048;
      v24 = v19;
      _os_log_impl(&dword_229580000, v17, OS_LOG_TYPE_ERROR, "Payload passed to prepare contains %lu bytes, was told we'd send %ld bytes. These must match!", (uint8_t *)&v21, 0x16u);
    }

    goto LABEL_13;
  }
  +[APCPlayer urlForCarrierAsset:](APCPlayer, "urlForCarrierAsset:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[APCPlayerEngine playerWithAssetURL:codecConfig:payload:error:](APCPlayerEngine, "playerWithAssetURL:codecConfig:payload:error:", v11, self->_codecConfig, v9, a5);
  v12 = (APCPlayerEngine *)objc_claimAutoreleasedReturnValue();
  playerEngine = self->_playerEngine;
  self->_playerEngine = v12;

  if (self->_dispatchQueue)
    -[APCPlayerEngine setDispatchQueue:](self->_playerEngine, "setDispatchQueue:");
  v14 = self->_playerEngine;
  if (!v14)
  {
LABEL_13:
    v16 = -1.0;
    goto LABEL_14;
  }
  -[APCPlayerEngine evaluateAsset](v14, "evaluateAsset");
  v16 = v15;
LABEL_14:

  return v16;
}

- (float)preparePayload:(id)a3 usingCarrierAtURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  APCPlayerEngine *v11;
  APCPlayerEngine *playerEngine;
  APCPlayerEngine *v13;
  float v14;
  float v15;
  NSObject *v16;
  uint64_t v17;
  int64_t v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v8
    || (v10 = objc_msgSend(v8, "length"),
        v10 != -[AUPasscodeCodecConfiguration payloadLengthBytes](self->_codecConfig, "payloadLengthBytes")))
  {
    APCLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (v8)
        v17 = objc_msgSend(v8, "length");
      else
        v17 = 0;
      v18 = -[AUPasscodeCodecConfiguration payloadLengthBytes](self->_codecConfig, "payloadLengthBytes");
      v20 = 134218240;
      v21 = v17;
      v22 = 2048;
      v23 = v18;
      _os_log_impl(&dword_229580000, v16, OS_LOG_TYPE_ERROR, "Payload passed to prepare contains %lu bytes, was told we'd send %ld bytes. These must match!", (uint8_t *)&v20, 0x16u);
    }

    goto LABEL_11;
  }
  +[APCPlayerEngine playerWithAssetURL:codecConfig:payload:error:](APCPlayerEngine, "playerWithAssetURL:codecConfig:payload:error:", v9, self->_codecConfig, v8, a5);
  v11 = (APCPlayerEngine *)objc_claimAutoreleasedReturnValue();
  playerEngine = self->_playerEngine;
  self->_playerEngine = v11;

  v13 = self->_playerEngine;
  if (!v13)
  {
LABEL_11:
    v15 = -1.0;
    goto LABEL_12;
  }
  -[APCPlayerEngine evaluateAsset](v13, "evaluateAsset");
  v15 = v14;
LABEL_12:

  return v15;
}

- (BOOL)startSend
{
  return -[APCPlayer startSendAtTime:withBeginning:](self, "startSendAtTime:withBeginning:", 0, 0);
}

- (BOOL)startSendAtTime:(unint64_t)a3 withBeginning:(id)a4
{
  id v6;
  APCPlayerEngine *playerEngine;
  BOOL v8;

  v6 = a4;
  playerEngine = self->_playerEngine;
  if (playerEngine)
  {
    v8 = -[APCPlayerEngine startEngineAtTime:withBeginning:callbackTime:](playerEngine, "startEngineAtTime:withBeginning:callbackTime:", a3, v6, self->_callbackTimingMSec);
    self->_isPlaying = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)endPasscodeEmbedding
{
  -[APCPlayerEngine endPasscodeEmbedding](self->_playerEngine, "endPasscodeEmbedding");
}

- (void)stopSend:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  APCPlayerEngine *playerEngine;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  playerEngine = self->_playerEngine;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__APCPlayer_stopSend_withCompletion___block_invoke;
  v9[3] = &unk_24F24BB80;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[APCPlayerEngine stopEngine:withCompletion:](playerEngine, "stopEngine:withCompletion:", v4, v9);

}

uint64_t __37__APCPlayer_stopSend_withCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)stopSendAfterMinimumLoops:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  APCPlayerEngine *playerEngine;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  playerEngine = self->_playerEngine;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__APCPlayer_stopSendAfterMinimumLoops_withCompletion___block_invoke;
  v9[3] = &unk_24F24BB80;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[APCPlayerEngine stopEngineAfterMinimumLoops:withCompletion:](playerEngine, "stopEngineAfterMinimumLoops:withCompletion:", a3, v9);

}

uint64_t __54__APCPlayer_stopSendAfterMinimumLoops_withCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)stopSendWithFadeOut:(float)a3 completion:(id)a4
{
  id v6;
  APCPlayerEngine *playerEngine;
  id v8;
  double v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  playerEngine = self->_playerEngine;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__APCPlayer_stopSendWithFadeOut_completion___block_invoke;
  v10[3] = &unk_24F24BB80;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  *(float *)&v9 = a3;
  -[APCPlayerEngine stopEngineWithFadeOut:completion:](playerEngine, "stopEngineWithFadeOut:completion:", v10, v9);

}

uint64_t __44__APCPlayer_stopSendWithFadeOut_completion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (APCPlayerEmbedInfo)embeddingInfo
{
  void *playerEngine;

  playerEngine = self->_playerEngine;
  if (playerEngine)
  {
    objc_msgSend(playerEngine, "embeddingInfo");
    playerEngine = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (APCPlayerEmbedInfo *)playerEngine;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSData)configurationData
{
  return self->_configurationData;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (unint64_t)callbackTimingMSec
{
  return self->_callbackTimingMSec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_codecConfig, 0);
  objc_storeStrong((id *)&self->_playerEngine, 0);
  objc_storeStrong((id *)&self->_encodeProcessor, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
