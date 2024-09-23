@implementation APCDecoderProcessor

- (APCDecoderProcessor)initWithInputURL:(id)a3 codecConfig:(id)a4 error:(id *)a5
{
  return -[APCDecoderProcessor initWithInputURL:codecConfig:resultData:error:](self, "initWithInputURL:codecConfig:resultData:error:", a3, a4, 0, a5);
}

- (APCDecoderProcessor)initWithInputURL:(id)a3 codecConfig:(id)a4 resultData:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  APCDecoderProcessor *v13;
  APCDecoderProcessor *v14;
  AUPasscodeDecoder *v15;
  uint64_t v16;
  AUPasscodeDecoder *decoderAU;
  NSMutableArray *v18;
  NSMutableArray *payloadsReceived;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  NSObject *v24;
  AUAudioUnitOfflineProcessor *v25;
  AUAudioUnitOfflineProcessor *processor;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  id location;
  _BYTE v39[20];
  objc_super v40;
  uint64_t v41;
  const __CFString *v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v40.receiver = self;
  v40.super_class = (Class)APCDecoderProcessor;
  v13 = -[APCDecoderProcessor init](&v40, sel_init);
  if (!v13)
    goto LABEL_11;
  v14 = 0;
  if (v10 && v11)
  {
    +[AUPasscodeDecoder registerAU](AUPasscodeDecoder, "registerAU");
    v15 = [AUPasscodeDecoder alloc];
    +[AUPasscodeDecoder getAUDesc](AUPasscodeDecoder, "getAUDesc");
    v16 = -[AUPasscodeDecoder initWithComponentDescription:options:error:](v15, "initWithComponentDescription:options:error:", v39, 0, a6);
    decoderAU = v13->_decoderAU;
    v13->_decoderAU = (AUPasscodeDecoder *)v16;

    if (v13->_decoderAU)
    {
      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      payloadsReceived = v13->_payloadsReceived;
      v13->_payloadsReceived = v18;

      objc_msgSend(v11, "setSampleRate:", -1);
      -[AUPasscodeDecoder setCodecConfig:](v13->_decoderAU, "setCodecConfig:", v11);
      objc_initWeak(&location, v13->_payloadsReceived);
      dispatch_get_global_queue(0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AUPasscodeDecoder setDispatchQueue:](v13->_decoderAU, "setDispatchQueue:", v20);

      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __69__APCDecoderProcessor_initWithInputURL_codecConfig_resultData_error___block_invoke;
      v36[3] = &unk_24F24BB30;
      objc_copyWeak(&v37, &location);
      -[AUPasscodeDecoder setDataHandler:](v13->_decoderAU, "setDataHandler:", v36);
      -[AUPasscodeDecoder setRenderingOffline:](v13->_decoderAU, "setRenderingOffline:", 1);
      -[AUPasscodeDecoder setResultData:](v13->_decoderAU, "setResultData:", v12);
      -[AUPasscodeDecoder resultData](v13->_decoderAU, "resultData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 == 0;

      if (!v22)
      {
        -[AUPasscodeDecoder resultData](v13->_decoderAU, "resultData");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "reset");

      }
      APCLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v10;
        _os_log_impl(&dword_229580000, v24, OS_LOG_TYPE_INFO, "Recording URL: %@", buf, 0xCu);
      }

      v25 = -[AUAudioUnitOfflineProcessor initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:]([AUAudioUnitOfflineProcessor alloc], "initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:", v13->_decoderAU, v10, 0, objc_msgSend(v11, "sampleRate"));
      processor = v13->_processor;
      v13->_processor = v25;

      if (v13->_processor)
      {
        -[AUPasscodeDecoder inputBusses](v13->_decoderAU, "inputBusses");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "format");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sampleRate");
        objc_msgSend(v11, "setSampleRate:", (uint64_t)v30);

        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);
LABEL_11:
        v14 = v13;
        goto LABEL_19;
      }
      APCLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229580000, v32, OS_LOG_TYPE_ERROR, "Failed to create the offline processor", buf, 2u);
      }

      v33 = (void *)MEMORY[0x24BDD1540];
      v41 = *MEMORY[0x24BDD0FC8];
      v42 = CFSTR("Failed to create the offline decoder processor");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.audiopasscode"), 101, v34);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
    }
    else
    {
      APCLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229580000, v31, OS_LOG_TYPE_ERROR, "Failed to create the decoder AU", buf, 2u);
      }

    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

void __69__APCDecoderProcessor_initWithInputURL_codecConfig_resultData_error___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "addObject:", v3);

}

- (id)run
{
  -[AUAudioUnitOfflineProcessor run](self->_processor, "run");
  return self->_payloadsReceived;
}

- (BOOL)getResultData:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  -[AUPasscodeDecoder resultData](self->_decoderAU, "resultData");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[AUPasscodeDecoder resultData](self->_decoderAU, "resultData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isValid");

    if ((v8 & 1) != 0)
    {
      -[AUPasscodeDecoder resultData](self->_decoderAU, "resultData");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadsReceived, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_decoderAU, 0);
}

@end
