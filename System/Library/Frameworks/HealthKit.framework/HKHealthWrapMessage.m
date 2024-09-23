@implementation HKHealthWrapMessage

- (HKHealthWrapMessage)initWithSenderUUID:(id)a3 studyUUID:(id)a4 channel:(id)a5 payloadType:(id)a6 startDate:(id)a7 endDate:(id)a8 payloadIdentifier:(id)a9 applicationData:(id)a10 certificate:(__SecCertificate *)cf
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  HKHealthWrapMessage *v24;
  HKHealthWrapMessage *v25;
  HKHealthWrapCodablePayloadHeader *v26;
  HKHealthWrapCodablePayloadHeader *payloadHeader;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  OS_dispatch_queue *encryptQueue;
  id v38;
  objc_super v39;

  v17 = a3;
  v38 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v39.receiver = self;
  v39.super_class = (Class)HKHealthWrapMessage;
  v24 = -[HKHealthWrapMessage init](&v39, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_compressionEnabled = 1;
    objc_storeStrong((id *)&v24->_studyUUID, a4);
    v26 = objc_alloc_init(HKHealthWrapCodablePayloadHeader);
    payloadHeader = v25->_payloadHeader;
    v25->_payloadHeader = v26;

    v28 = (void *)objc_msgSend(v22, "copy");
    -[HKHealthWrapCodablePayloadHeader setPayloadIdentifier:](v25->_payloadHeader, "setPayloadIdentifier:", v28);

    objc_msgSend(v17, "hk_dataForUUIDBytes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthWrapCodablePayloadHeader setSubjectUUID:](v25->_payloadHeader, "setSubjectUUID:", v29);

    v30 = (void *)objc_msgSend(v18, "copy");
    -[HKHealthWrapCodablePayloadHeader setChannel:](v25->_payloadHeader, "setChannel:", v30);

    v31 = (void *)objc_msgSend(v19, "copy");
    -[HKHealthWrapCodablePayloadHeader setPayloadType:](v25->_payloadHeader, "setPayloadType:", v31);

    if (v20)
    {
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
      -[HKHealthWrapCodablePayloadHeader setStartDate:](v25->_payloadHeader, "setStartDate:", (uint64_t)v32);
    }
    if (v21)
    {
      objc_msgSend(v21, "timeIntervalSinceReferenceDate");
      -[HKHealthWrapCodablePayloadHeader setEndDate:](v25->_payloadHeader, "setEndDate:", (uint64_t)v33);
    }
    if (v23)
    {
      v34 = (void *)objc_msgSend(v23, "copy");
      -[HKHealthWrapCodablePayloadHeader setApplicationData:](v25->_payloadHeader, "setApplicationData:", v34);

    }
    CFRetain(cf);
    v25->_certificate = cf;
    HKCreateSerialDispatchQueue(v25, CFSTR("stream"));
    v35 = objc_claimAutoreleasedReturnValue();
    encryptQueue = v25->_encryptQueue;
    v25->_encryptQueue = (OS_dispatch_queue *)v35;

  }
  return v25;
}

- (HKHealthWrapMessage)initWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKHealthWrapMessage *v14;
  void *v15;
  void *v16;
  void *v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthWrapMessage.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  objc_msgSend(v5, "subjectUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "studyUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "channel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKHealthWrapMessage initWithSenderUUID:studyUUID:channel:payloadType:startDate:endDate:payloadIdentifier:applicationData:certificate:](self, "initWithSenderUUID:studyUUID:channel:payloadType:startDate:endDate:payloadIdentifier:applicationData:certificate:", v6, v7, v8, v9, v10, v11, v12, v13, objc_msgSend(v5, "certificate"));

  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a3);
    if (-[HKHealthWrapMessageConfiguration disableCompression](v14->_configuration, "disableCompression"))
      v14->_compressionEnabled = 0;
    objc_msgSend(v5, "keyValuePairs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthWrapMessage _codableKeyValuePairsFromDictionary:](v14, "_codableKeyValuePairsFromDictionary:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthWrapCodablePayloadHeader setKeyValuePairs:](v14->_payloadHeader, "setKeyValuePairs:", v16);

  }
  return v14;
}

- (void)dealloc
{
  __SecCertificate *certificate;
  objc_super v4;

  certificate = self->_certificate;
  if (certificate)
  {
    CFRelease(certificate);
    self->_certificate = 0;
  }
  -[NSOutputStream close](self->_outputStream, "close");
  v4.receiver = self;
  v4.super_class = (Class)HKHealthWrapMessage;
  -[HKHealthWrapMessage dealloc](&v4, sel_dealloc);
}

- (id)_codableKeyValuePairsFromDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__HKHealthWrapMessage__codableKeyValuePairsFromDictionary___block_invoke;
  v8[3] = &unk_1E37EC520;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __59__HKHealthWrapMessage__codableKeyValuePairsFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  HKHealthWrapCodableKeyValue *v6;
  HKHealthWrapCodableValue *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = objc_alloc_init(HKHealthWrapCodableKeyValue);
  v7 = objc_alloc_init(HKHealthWrapCodableValue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKHealthWrapCodableValue setType:](v7, "setType:", 1);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HKHealthWrapCodableValue setType:](v7, "setType:", 3);
      -[HKHealthWrapCodableValue setString:](v7, "setString:", v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[HKHealthWrapCodableValue setType:](v7, "setType:", 4);
        -[HKHealthWrapCodableValue setInteger:](v7, "setInteger:", objc_msgSend(v5, "longLongValue"));
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[HKHealthWrapCodableValue setType:](v7, "setType:", 2);
          -[HKHealthWrapCodableValue setBytes:](v7, "setBytes:", v5);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid value type for key: %@"), v8);
        }
      }
    }
  }
  -[HKHealthWrapCodableKeyValue setValue:](v6, "setValue:", v7);
  -[HKHealthWrapCodableKeyValue setKey:](v6, "setKey:", v8);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (BOOL)startWithError:(id *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "newOutputFileURL");
  LOBYTE(a3) = -[HKHealthWrapMessage startWithOutputFileURL:error:](self, "startWithOutputFileURL:error:", v5, a3);

  return (char)a3;
}

+ (id)newOutputFileURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(a1, "newOutputFileURLInDirectory:", v5);

  return v6;
}

+ (id)newOutputFileURLInDirectory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("HealthWrap-"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)startWithOutputFileURL:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  HKHealthWrapEncryptor *v10;
  HKHealthWrapEncryptor *v11;
  HKHealthWrapEncryptor *encryptor;
  BOOL v13;
  _HKCompressionEngine *v14;
  _HKCompressionEngine *compressionEngine;
  uint64_t v17;
  _QWORD v18[5];

  v7 = a3;
  self->_lastSuccess = 1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_outputURL, a3);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initWithURL:append:", v7, 0);
  objc_storeStrong((id *)&self->_outputStream, v9);
  MEMORY[0x19AEC6FD8](v9, self->_encryptQueue);
  v10 = [HKHealthWrapEncryptor alloc];
  LOBYTE(v17) = self->_compressionEnabled;
  v11 = -[HKHealthWrapEncryptor initWithOutputStream:certificate:algorithm:options:keySize:uuid:studyUUID:compressionEnabled:](v10, "initWithOutputStream:certificate:algorithm:options:keySize:uuid:studyUUID:compressionEnabled:", v9, self->_certificate, 0, 1, 32, v8, self->_studyUUID, v17);
  encryptor = self->_encryptor;
  self->_encryptor = v11;

  v13 = 0;
  if (-[HKHealthWrapEncryptor startWithError:](self->_encryptor, "startWithError:", a4))
  {
    if (self->_compressionEnabled)
    {
      v14 = -[_HKCompressionEngine initWithFunction:algorithm:destination:]([_HKCompressionEngine alloc], "initWithFunction:algorithm:destination:", 0, 1, self);
      compressionEngine = self->_compressionEngine;
      self->_compressionEngine = v14;

    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __52__HKHealthWrapMessage_startWithOutputFileURL_error___block_invoke;
    v18[3] = &unk_1E37E6770;
    v18[4] = self;
    v13 = -[HKHealthWrapMessage _run:error:](self, "_run:error:", v18, a4);
  }

  return v13;
}

void __52__HKHealthWrapMessage_startWithOutputFileURL_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HKHealthWrapMessage_startWithOutputFileURL_error___block_invoke_2;
  block[3] = &unk_1E37E6770;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void __52__HKHealthWrapMessage_startWithOutputFileURL_error___block_invoke_2(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[1], "data");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_writeDataToCompressor:", v2);

}

- (BOOL)appendDataFromFileURL:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[HKHealthWrapMessage appendData:error:](self, "appendData:error:", v6, a4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)appendData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__HKHealthWrapMessage_appendData_error___block_invoke;
  v9[3] = &unk_1E37E6980;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  LOBYTE(a4) = -[HKHealthWrapMessage _run:error:](self, "_run:error:", v9, a4);

  return (char)a4;
}

uint64_t __40__HKHealthWrapMessage_appendData_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeDataToCompressor:", *(_QWORD *)(a1 + 40));
}

- (void)_finalize
{
  HKHealthWrapEncryptor *encryptor;
  BOOL v4;
  id v5;
  id obj;

  if (self->_compressionEnabled)
  {
    -[_HKCompressionEngine sourceContentFinished](self->_compressionEngine, "sourceContentFinished");
  }
  else
  {
    encryptor = self->_encryptor;
    obj = 0;
    v4 = -[HKHealthWrapEncryptor finalizeWithError:](encryptor, "finalizeWithError:", &obj);
    v5 = obj;
    self->_lastSuccess = v4;
    objc_storeStrong((id *)&self->_lastError, v5);
  }
}

- (id)finalizeWithError:(id *)a3
{
  NSURL *outputURL;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__HKHealthWrapMessage_finalizeWithError___block_invoke;
  v6[3] = &unk_1E37E6770;
  v6[4] = self;
  if (-[HKHealthWrapMessage _run:error:](self, "_run:error:", v6, a3))
    outputURL = self->_outputURL;
  else
    outputURL = 0;
  return outputURL;
}

uint64_t __41__HKHealthWrapMessage_finalizeWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finalize");
}

- (BOOL)_run:(id)a3 error:(id *)a4
{
  _BOOL4 lastSuccess;
  NSError *v7;
  NSError *v8;

  self->_lastSuccess = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  lastSuccess = self->_lastSuccess;
  if (!self->_lastSuccess)
  {
    -[HKHealthWrapMessage _cleanup](self, "_cleanup");
    v7 = self->_lastError;
    v8 = v7;
    if (v7)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v7);
      else
        _HKLogDroppedError(v7);
    }

  }
  return lastSuccess;
}

- (void)_writeDataToCompressor:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  HKHealthWrapEncryptor *encryptor;
  BOOL v8;
  id v9;
  HKHealthWrapEncryptor *v10;
  BOOL v11;
  NSError *v12;
  NSError *lastError;
  id v14;
  id v15;
  unint64_t v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v16 = bswap64(v5);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v16, 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_compressionEnabled)
    {
      -[_HKCompressionEngine writeSourceContent:](self->_compressionEngine, "writeSourceContent:", v6);
      -[_HKCompressionEngine writeSourceContent:](self->_compressionEngine, "writeSourceContent:", v4);
    }
    else
    {
      encryptor = self->_encryptor;
      v15 = 0;
      v8 = -[HKHealthWrapEncryptor appendData:error:](encryptor, "appendData:error:", v6, &v15);
      v9 = v15;
      self->_lastSuccess = v8;
      v10 = self->_encryptor;
      v14 = v9;
      v11 = -[HKHealthWrapEncryptor appendData:error:](v10, "appendData:error:", v4, &v14);
      v12 = (NSError *)v14;

      self->_lastSuccess = v11;
      lastError = self->_lastError;
      self->_lastError = v12;

    }
  }

}

- (void)_cleanup
{
  _HKCompressionEngine *compressionEngine;
  HKHealthWrapEncryptor *encryptor;
  NSOutputStream *outputStream;
  void *v6;
  NSURL *outputURL;

  compressionEngine = self->_compressionEngine;
  self->_compressionEngine = 0;

  -[HKHealthWrapEncryptor finalizeWithError:](self->_encryptor, "finalizeWithError:", 0);
  encryptor = self->_encryptor;
  self->_encryptor = 0;

  -[NSOutputStream close](self->_outputStream, "close");
  outputStream = self->_outputStream;
  self->_outputStream = 0;

  if (self->_outputURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtURL:error:", self->_outputURL, 0);

    outputURL = self->_outputURL;
    self->_outputURL = 0;

  }
}

- (void)receiveSinkContent:(id)a3
{
  id v4;
  NSObject *encryptQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  encryptQueue = self->_encryptQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HKHealthWrapMessage_receiveSinkContent___block_invoke;
  block[3] = &unk_1E37E6980;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(encryptQueue, block);

}

void __42__HKHealthWrapMessage_receiveSinkContent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  id obj;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  obj = 0;
  v4 = objc_msgSend(v3, "appendData:error:", v2, &obj);
  v5 = obj;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = v4;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), v5);
}

- (void)sinkContentFinished
{
  NSObject *encryptQueue;
  _QWORD block[5];

  encryptQueue = self->_encryptQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HKHealthWrapMessage_sinkContentFinished__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_sync(encryptQueue, block);
}

void __42__HKHealthWrapMessage_sinkContentFinished__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id obj;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  obj = 0;
  v3 = objc_msgSend(v2, "finalizeWithError:", &obj);
  v4 = obj;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = v3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), v4);
}

- (HKHealthWrapMessageConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_encryptQueue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_encryptor, 0);
  objc_storeStrong((id *)&self->_compressionEngine, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_payloadHeader, 0);
}

@end
