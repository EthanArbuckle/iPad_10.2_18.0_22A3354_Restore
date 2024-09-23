@implementation APCEncoderProcessor

- (APCEncoderProcessor)initWithAssetURL:(id)a3 codecConfig:(id)a4 payload:(id)a5 outputURL:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  APCEncoderProcessor *v16;
  AUPasscodeEncoder *v17;
  uint64_t v18;
  AUPasscodeEncoder *encoderAU;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  NSObject *v24;
  float v25;
  float v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  AUAudioUnitOfflineProcessor *v33;
  AUAudioUnitOfflineProcessor *processor;
  APCEncoderProcessor *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  _BYTE v40[20];
  objc_super v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  uint8_t buf[4];
  double v47;
  __int16 v48;
  id v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v41.receiver = self;
  v41.super_class = (Class)APCEncoderProcessor;
  v16 = -[APCEncoderProcessor init](&v41, sel_init);
  if (v16)
  {
    if (!v12 || !v13 || !v14 || !v15)
    {
      v30 = (void *)MEMORY[0x24BDD1540];
      v50 = *MEMORY[0x24BDD0FC8];
      v51[0] = CFSTR("Invalid input arguments");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.audiopasscode"), 100, v31);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
      v35 = 0;
      goto LABEL_23;
    }
    +[AUPasscodeEncoder registerAU](AUPasscodeEncoder, "registerAU");
    v17 = [AUPasscodeEncoder alloc];
    +[AUPasscodeEncoder getAUDesc](AUPasscodeEncoder, "getAUDesc");
    v18 = -[AUPasscodeEncoder initWithComponentDescription:options:error:](v17, "initWithComponentDescription:options:error:", v40, 0, a7);
    encoderAU = v16->_encoderAU;
    v16->_encoderAU = (AUPasscodeEncoder *)v18;

    if (!v16->_encoderAU)
    {
      APCLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229580000, v32, OS_LOG_TYPE_ERROR, "Failed to create the encoder AU", buf, 2u);
      }

      goto LABEL_22;
    }
    objc_msgSend(v13, "setPayloadLengthBytes:", objc_msgSend(v14, "length"));
    -[AUPasscodeEncoder inputBusses](v16->_encoderAU, "inputBusses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "format");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sampleRate");
    objc_msgSend(v13, "setSampleRate:", (uint64_t)v23);

    -[AUPasscodeEncoder setPayload:](v16->_encoderAU, "setPayload:", v14);
    -[AUPasscodeEncoder setCodecConfig:](v16->_encoderAU, "setCodecConfig:", v13);
    APCLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v47 = *(double *)&v12;
      v48 = 2112;
      v49 = v15;
      _os_log_impl(&dword_229580000, v24, OS_LOG_TYPE_INFO, "Asset URL: '%@'\nOutput File URL: '%@'", buf, 0x16u);
    }

    -[APCEncoderProcessor evaluateAsset:](v16, "evaluateAsset:", v12);
    v26 = v25;
    if (v25 < 0.1)
    {
      APCLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v47 = v26;
        _os_log_impl(&dword_229580000, v27, OS_LOG_TYPE_ERROR, "The success rate of the input file is too low: %f", buf, 0xCu);
      }

      v28 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BDD0FC8];
      v45 = CFSTR("The asset score is too low");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.audiopasscode"), 102, v29);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    v33 = -[AUAudioUnitOfflineProcessor initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:]([AUAudioUnitOfflineProcessor alloc], "initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:", v16->_encoderAU, v12, v15, -1);
    processor = v16->_processor;
    v16->_processor = v33;

    -[AUPasscodeEncoder setAssetLength:](v16->_encoderAU, "setAssetLength:", -[AUAudioUnitOfflineProcessor assetLength](v16->_processor, "assetLength"));
    if (!v16->_processor)
    {
      APCLogObject();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_229580000, v36, OS_LOG_TYPE_ERROR, "Failed to create the offline processor", buf, 2u);
      }

      v37 = (void *)MEMORY[0x24BDD1540];
      v42 = *MEMORY[0x24BDD0FC8];
      v43 = CFSTR("Failed to create the offline encoder processor");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.audiopasscode"), 101, v38);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
  }
  v35 = v16;
LABEL_23:

  return v35;
}

- (float)evaluateAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  float v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  float v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  APCPlayerEmbedInfo *v23;
  APCPlayerEmbedInfo *passcodeEmbedInfo;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1810]), "initForReading:error:", v4, &v29);
  v6 = v29;
  if (v6)
  {
    v7 = v6;
    APCLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v7;
      _os_log_impl(&dword_229580000, v8, OS_LOG_TYPE_ERROR, "Failed to open input file URL: %@", buf, 0xCu);
    }
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x24BDB1838]);
    objc_msgSend(v5, "processingFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "initWithPCMFormat:frameCapacity:", v11, objc_msgSend(v5, "length"));

    v28 = 0;
    objc_msgSend(v5, "readIntoBuffer:error:", v8, &v28);
    v7 = v28;
    if (v7)
    {
      APCLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      v9 = 0.0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v7;
        _os_log_impl(&dword_229580000, v12, OS_LOG_TYPE_ERROR, "Failed to read the input file: %@", buf, 0xCu);
      }
    }
    else
    {
      -[AUPasscodeEncoder codecConfig](self->_encoderAU, "codecConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "copy");

      objc_msgSend(v5, "processingFormat");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sampleRate");
      -[NSObject setSampleRate:](v12, "setSampleRate:", (uint64_t)(v15 + 0.5));

      v27 = 0;
      +[APCCodecFactory evaluateCarrierWithConfig:carrier:embeddingResult:](APCCodecFactory, "evaluateCarrierWithConfig:carrier:embeddingResult:", v12, v8, &v27);
      v9 = v16;
      v17 = v27;
      if (v17)
      {
        -[AUPasscodeEncoder setPasscodeEmbedInfo:](self->_encoderAU, "setPasscodeEmbedInfo:", v17);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 108);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v19, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1000);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntegerValue");

        v23 = -[APCPlayerEmbedInfo initWithPasscodeDurationNSec:]([APCPlayerEmbedInfo alloc], "initWithPasscodeDurationNSec:", (unint64_t)((double)(unint64_t)(v22 + v26)/ (double)-[NSObject sampleRate](v12, "sampleRate")* 1000000000.0));
        passcodeEmbedInfo = self->_passcodeEmbedInfo;
        self->_passcodeEmbedInfo = v23;

      }
    }

  }
  return v9;
}

- (void)run
{
  -[AUAudioUnitOfflineProcessor run](self->_processor, "run");
}

- (BOOL)getEmbeddingInfo:(id *)a3
{
  APCPlayerEmbedInfo *passcodeEmbedInfo;

  passcodeEmbedInfo = self->_passcodeEmbedInfo;
  if (passcodeEmbedInfo)
    *a3 = objc_retainAutorelease(passcodeEmbedInfo);
  return passcodeEmbedInfo != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeEmbedInfo, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_encoderAU, 0);
}

@end
