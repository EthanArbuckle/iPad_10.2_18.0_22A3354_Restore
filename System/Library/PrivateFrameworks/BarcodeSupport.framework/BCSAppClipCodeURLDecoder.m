@implementation BCSAppClipCodeURLDecoder

+ (id)sharedDecoder
{
  if (sharedDecoder_onceToken != -1)
    dispatch_once(&sharedDecoder_onceToken, &__block_literal_global_14);
  return (id)sharedDecoder_sharedDecoder;
}

void __41__BCSAppClipCodeURLDecoder_sharedDecoder__block_invoke()
{
  BCSAppClipCodeURLDecoder *v0;
  void *v1;

  v0 = objc_alloc_init(BCSAppClipCodeURLDecoder);
  v1 = (void *)sharedDecoder_sharedDecoder;
  sharedDecoder_sharedDecoder = (uint64_t)v0;

}

- (BCSAppClipCodeURLDecoder)init
{
  BCSAppClipCodeURLDecoder *v2;
  BCSParsingServiceConnection *v3;
  BCSParsingServiceConnection *serviceConnection;
  BCSAppClipCodeURLDecoder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCSAppClipCodeURLDecoder;
  v2 = -[BCSAppClipCodeURLDecoder init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BCSParsingServiceConnection);
    serviceConnection = v2->_serviceConnection;
    v2->_serviceConnection = v3;

    v5 = v2;
  }

  return v2;
}

- (void)decodeURLWithEncodedData:(id)a3 codingVersion:(unint64_t)a4 requiresAuthorization:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  BCSParsingServiceConnection *serviceConnection;
  _QWORD v13[4];
  id v14;

  v6 = a5;
  v10 = a6;
  v11 = v10;
  if (v10)
  {
    serviceConnection = self->_serviceConnection;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __107__BCSAppClipCodeURLDecoder_decodeURLWithEncodedData_codingVersion_requiresAuthorization_completionHandler___block_invoke;
    v13[3] = &unk_24D787DF8;
    v14 = v10;
    -[BCSParsingServiceConnection decodeAppClipCodeURLWithEncodedData:codingVersion:requiresAuthorization:withReply:](serviceConnection, "decodeAppClipCodeURLWithEncodedData:codingVersion:requiresAuthorization:withReply:", a3, a4, v6, v13);

  }
}

uint64_t __107__BCSAppClipCodeURLDecoder_decodeURLWithEncodedData_codingVersion_requiresAuthorization_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)parseEncodedURLData:(id)a3 version:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  __uint64_t v10;
  BCSParsingServiceConnection *serviceConnection;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;
  __uint64_t v18;

  v8 = a3;
  v9 = a5;
  v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  serviceConnection = self->_serviceConnection;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke;
  v14[3] = &unk_24D788478;
  v15 = v8;
  v16 = v9;
  v17 = a4;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  -[BCSParsingServiceConnection decodeAppClipCodeURLWithEncodedData:codingVersion:requiresAuthorization:withReply:](serviceConnection, "decodeAppClipCodeURLWithEncodedData:codingVersion:requiresAuthorization:withReply:", v13, a4, 0, v14);

}

void __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  BCSInvalidParsedData *v7;
  BCSInvalidParsedData *v8;
  BCSAppclipCodePayload *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = v5;
  if (!v5 || a3)
  {
    v7 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", 1, 0);
  }
  else if (objc_msgSend(v5, "_bcs_isWalletRemoteRequestURL") && _os_feature_enabled_impl())
  {
    v7 = -[BCSParsedURLData initWithURL:type:]([BCSParsedURLData alloc], "initWithURL:type:", v6, 16);
  }
  else
  {
    v7 = -[BCSParsedURLData initWithURL:]([BCSParsedURLData alloc], "initWithURL:", v6);
  }
  v8 = v7;
  v9 = -[BCSAppclipCodePayload initWithData:version:]([BCSAppclipCodePayload alloc], "initWithData:version:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke_2;
  v12[3] = &unk_24D787E80;
  v13 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 56);
  v14 = v10;
  v15 = v11;
  +[BCSAction getActionWithData:codePayload:completionHandler:](BCSAction, "getActionWithData:codePayload:completionHandler:", v8, v9, v12);

}

void __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v4 = a1[4];
      v8 = 134218242;
      v9 = v4;
      v10 = 2112;
      v11 = objc_opt_class();
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSAppClipCodeURLDecoder: App clip code [%p] has resolved to action of class %@", (uint8_t *)&v8, 0x16u);
    }
    +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logBarcodeDetectedEventForAction:startTime:", v3, a1[6]);

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke_2_cold_1((uint64_t)a1);
    v6 = a1[5];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __67__BCSAppClipCodeURLDecoder_parseEncodedURLData_version_completion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = 134217984;
  v3 = v1;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSAppClipCodeURLDecoder: App clip code payload [%p] is not actionable", (uint8_t *)&v2, 0xCu);
}

@end
