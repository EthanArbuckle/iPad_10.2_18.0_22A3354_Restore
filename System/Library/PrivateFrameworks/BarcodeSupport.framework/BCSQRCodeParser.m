@implementation BCSQRCodeParser

+ (id)sharedParser
{
  if (sharedParser_onceToken != -1)
    dispatch_once(&sharedParser_onceToken, &__block_literal_global_8);
  return (id)sharedParser_sharedParser;
}

void __31__BCSQRCodeParser_sharedParser__block_invoke()
{
  BCSQRCodeParser *v0;
  void *v1;

  v0 = objc_alloc_init(BCSQRCodeParser);
  v1 = (void *)sharedParser_sharedParser;
  sharedParser_sharedParser = (uint64_t)v0;

}

- (void)parseCodeFromMetadataMachineReadableCodeObject:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  __uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  __uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke;
  v11[3] = &unk_24D787EA8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v9 = v7;
  v10 = v6;
  -[BCSQRCodeParser _parseMetadataObject:reply:completionHandler:](self, "_parseMetadataObject:reply:completionHandler:", v10, v11, v9);

}

void __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_payloadForMRCObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke_2;
  v9[3] = &unk_24D787E80;
  v10 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v11 = v7;
  v12 = v8;
  +[BCSAction getActionWithData:codePayload:completionHandler:](BCSAction, "getActionWithData:codePayload:completionHandler:", v5, v6, v9);

}

void __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
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
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p QR code has resolved to action of class %@", (uint8_t *)&v8, 0x16u);
    }
    +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logBarcodeDetectedEventForAction:startTime:", v3, a1[6]);

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke_2_cold_1();
    v6 = a1[5];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

- (id)_qrCodeFeatureFromImage:(CGImage *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[8];
  _BYTE v26[128];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCGImage:options:", a3, 0);
  v4 = (void *)MEMORY[0x24BDBF650];
  v5 = *MEMORY[0x24BDBF620];
  v6 = *MEMORY[0x24BDBF5F0];
  v7 = *MEMORY[0x24BDBF600];
  v27[0] = *MEMORY[0x24BDBF5E8];
  v27[1] = v7;
  v28[0] = v6;
  v28[1] = &unk_24D793340;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detectorOfType:context:options:", v5, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "featuresInImage:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x24BDACB70];
    v18 = "BCSQRCodeParser: no feature detected in the image.";
LABEL_19:
    _os_log_impl(&dword_21748C000, v17, OS_LOG_TYPE_INFO, v18, buf, 2u);
    goto LABEL_20;
  }
  if (objc_msgSend(v10, "count") != 1)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x24BDACB70];
    v18 = "BCSQRCodeParser: we don't support multiple codes in the same image.";
    goto LABEL_19;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v13)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v19 = v16;

    if (v19)
      goto LABEL_21;
  }
  else
  {
LABEL_11:

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x24BDACB70];
    v18 = "BCSQRCodeParser: image has no QR code.";
    goto LABEL_19;
  }
LABEL_20:
  v19 = 0;
LABEL_21:

  return v19;
}

- (void)parseCodeFromImage:(CGImage *)a3 completionHandler:(id)a4
{
  id v6;
  BCSParsingServiceConnection *v7;
  BCSParsingServiceConnection *parsingServiceConnection;
  void *v9;
  __uint64_t v10;
  BCSParsingServiceConnection *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!self->_parsingServiceConnection)
  {
    v7 = objc_alloc_init(BCSParsingServiceConnection);
    parsingServiceConnection = self->_parsingServiceConnection;
    self->_parsingServiceConnection = v7;

  }
  -[BCSQRCodeParser _qrCodeFeatureFromImage:](self, "_qrCodeFeatureFromImage:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v9;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSQRCodeParser: Start parsing CIQRCodeFeature %p", buf, 0xCu);
    }
    v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v11 = self->_parsingServiceConnection;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke;
    v13[3] = &unk_24D787ED0;
    v14 = v9;
    v15 = v6;
    v16 = v10;
    -[BCSParsingServiceConnection parseQRCodeFeature:withReply:](v11, "parseQRCodeFeature:withReply:", v14, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v12);

  }
}

void __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      v15 = v7;
      v16 = 2048;
      v17 = objc_msgSend(v5, "type");
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSQRCodeParser: QR code from CIQRCodeFeature %p has type %ld", buf, 0x16u);
    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_11;
    v10[3] = &unk_24D787E80;
    v11 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v12 = v8;
    v13 = v9;
    +[BCSAction getActionWithData:codePayload:completionHandler:](BCSAction, "getActionWithData:codePayload:completionHandler:", v5, 0, v10);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_11(_QWORD *a1, void *a2)
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
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSQRCodeParser: QR code from CIQRCodeFeature %p has resolved to action of class %@", (uint8_t *)&v8, 0x16u);
    }
    +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logBarcodeDetectedEventForAction:startTime:", v3, a1[6]);

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_11_cold_1();
    v6 = a1[5];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

- (void)parseCodeFromString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  __uint64_t v8;
  BCSParsingServiceConnection *parsingServiceConnection;
  BCSParsingServiceConnection *v10;
  BCSParsingServiceConnection *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  __uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  parsingServiceConnection = self->_parsingServiceConnection;
  if (!parsingServiceConnection)
  {
    v10 = objc_alloc_init(BCSParsingServiceConnection);
    v11 = self->_parsingServiceConnection;
    self->_parsingServiceConnection = v10;

    parsingServiceConnection = self->_parsingServiceConnection;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke;
  v13[3] = &unk_24D787F20;
  v14 = v7;
  v15 = v8;
  v12 = v7;
  -[BCSParsingServiceConnection parseQRCodeString:withReply:](parsingServiceConnection, "parseQRCodeString:withReply:", v6, v13);

}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_cold_2(v5);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13;
    v19[3] = &unk_24D787EF8;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v20 = v7;
    v21 = v8;
    +[BCSAction getActionWithData:codePayload:completionHandler:](BCSAction, "getActionWithData:codePayload:completionHandler:", v5, 0, v19);
    v9 = v20;
  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    v18 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v9);
  }

}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13_cold_2();
    +[BCSAWDLogger sharedLogger](BCSAWDLogger, "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logBarcodeDetectedEventForAction:startTime:", v3, *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

  }
}

- (void)postNotificationAfterParsingCodeFromImage:(CGImage *)a3 completion:(id)a4
{
  id v6;
  BCSParsingServiceConnection *v7;
  BCSParsingServiceConnection *parsingServiceConnection;
  void *v9;
  BCSParsingServiceConnection *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  if (!self->_parsingServiceConnection)
  {
    v7 = objc_alloc_init(BCSParsingServiceConnection);
    parsingServiceConnection = self->_parsingServiceConnection;
    self->_parsingServiceConnection = v7;

  }
  -[BCSQRCodeParser _qrCodeFeatureFromImage:](self, "_qrCodeFeatureFromImage:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = self->_parsingServiceConnection;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke;
    v12[3] = &unk_24D787F88;
    v12[4] = self;
    v13 = v6;
    -[BCSParsingServiceConnection parseQRCodeFeature:withReply:](v10, "parseQRCodeFeature:withReply:", v9, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v11);

  }
}

void __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_cold_2(v5);
    objc_msgSend(*(id *)(a1 + 32), "notificationServiceConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notifyParsedCodeWithData:codePayload:shouldReplacePreviousNotifications:withReply:", v5, 0, 1, &__block_literal_global_16);

  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint8_t v6[16];

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_14_cold_1(v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSQRCodeParser: Finished notification successfully", v6, 2u);
  }

}

- (void)_parseMetadataObject:(id)a3 reply:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BCSParsingServiceConnection *v13;
  BCSParsingServiceConnection *parsingServiceConnection;
  BCSParsingServiceConnection *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BCSParsingServiceConnection *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v29 = v8;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSQRCodeParser: Start parsing AVMetadataMachineReadableCodeObject %p", buf, 0xCu);
  }
  objc_msgSend(v8, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "basicDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (!self->_parsingServiceConnection)
    {
      v13 = objc_alloc_init(BCSParsingServiceConnection);
      parsingServiceConnection = self->_parsingServiceConnection;
      self->_parsingServiceConnection = v13;

    }
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDB1EC8]))
    {
      v15 = self->_parsingServiceConnection;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke;
      v24[3] = &unk_24D787FB0;
      v25 = v8;
      v26 = v10;
      v27 = v9;
      -[BCSParsingServiceConnection parseQRCodeMetadata:withReply:](v15, "parseQRCodeMetadata:withReply:", v12, v24);

      v16 = v25;
LABEL_18:

      goto LABEL_19;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.AppClipCode")))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("RawData"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Version"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v18 = objc_msgSend(v17, "integerValue");
        *(_DWORD *)buf = 134218240;
        v29 = v8;
        v30 = 2048;
        v31 = v18;
        _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p has app clip code version %ld", buf, 0x16u);
      }
      v19 = self->_parsingServiceConnection;
      v20 = objc_msgSend(v17, "integerValue");
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_17;
      v21[3] = &unk_24D787FD8;
      v22 = v8;
      v23 = v9;
      -[BCSParsingServiceConnection decodeAppClipCodeURLWithEncodedData:codingVersion:requiresAuthorization:withReply:](v19, "decodeAppClipCodeURLWithEncodedData:codingVersion:requiresAuthorization:withReply:", v16, v20, 0, v21);

      goto LABEL_18;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[BCSQRCodeParser _parseMetadataObject:reply:completionHandler:].cold.2(v8);
      if (!v10)
        goto LABEL_19;
      goto LABEL_17;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[BCSQRCodeParser _parseMetadataObject:reply:completionHandler:].cold.1();
    if (!v10)
      goto LABEL_19;
    goto LABEL_17;
  }
  if (v10)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v16);
    goto LABEL_18;
  }
LABEL_19:

}

void __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v7 = a1[4];
      v10 = 134218240;
      v11 = v7;
      v12 = 2048;
      v13 = objc_msgSend(v5, "type");
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p QR code has type %ld", (uint8_t *)&v10, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_cold_1();
    v8 = a1[5];
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 3, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    }
  }

}

void __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BCSParsedURLData *v7;
  BCSParsedURLData *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (objc_msgSend(v5, "_bcs_isWalletRemoteRequestURL") && _os_feature_enabled_impl())
      v7 = -[BCSParsedURLData initWithURL:type:]([BCSParsedURLData alloc], "initWithURL:type:", v5, 16);
    else
      v7 = -[BCSParsedURLData initWithURL:]([BCSParsedURLData alloc], "initWithURL:", v5);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_17_cold_1();
    v7 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", 1, 0);
  }
  v8 = v7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 134218243;
    v11 = v9;
    v12 = 2113;
    v13 = v5;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p has app clip code with url %{private}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BCSNotificationServiceConnection)notificationServiceConnection
{
  BCSNotificationServiceConnection *notificationServiceConnection;
  BCSNotificationServiceConnection *v4;
  BCSNotificationServiceConnection *v5;

  notificationServiceConnection = self->_notificationServiceConnection;
  if (!notificationServiceConnection)
  {
    v4 = objc_alloc_init(BCSNotificationServiceConnection);
    v5 = self->_notificationServiceConnection;
    self->_notificationServiceConnection = v4;

    notificationServiceConnection = self->_notificationServiceConnection;
  }
  return notificationServiceConnection;
}

- (id)_payloadForMRCObject:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BCSQRCodePayload *v6;
  void *v7;
  BCSAppclipCodePayload *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB1EC8]);

  if (v5)
  {
    v6 = [BCSQRCodePayload alloc];
    objc_msgSend(v3, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BCSQRCodePayload initWithBarcodeDescriptor:](v6, "initWithBarcodeDescriptor:", v7);
  }
  else
  {
    objc_msgSend(v3, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.AppClipCode"));

    if (!v10)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "basicDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RawData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[BCSAppclipCodePayload initWithData:version:]([BCSAppclipCodePayload alloc], "initWithData:version:", v11, objc_msgSend(v12, "unsignedIntegerValue"));

  }
LABEL_7:

  return v8;
}

- (void)startQRCodeParsingSessionWithMetadataObject:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__BCSQRCodeParser_startQRCodeParsingSessionWithMetadataObject_completionHandler___block_invoke;
  v10[3] = &unk_24D788020;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[BCSQRCodeParser _parseMetadataObject:reply:completionHandler:](self, "_parseMetadataObject:reply:completionHandler:", v9, v10, v8);

}

void __81__BCSQRCodeParser_startQRCodeParsingSessionWithMetadataObject_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__BCSQRCodeParser_startQRCodeParsingSessionWithMetadataObject_completionHandler___block_invoke_2;
  block[3] = &unk_24D787AE8;
  v4 = (void *)a1[5];
  block[4] = a1[4];
  v8 = v4;
  v5 = v3;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0);

}

void __81__BCSQRCodeParser_startQRCodeParsingSessionWithMetadataObject_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_payloadForMRCObject:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "notificationServiceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyParsedCodeWithData:codePayload:shouldReplacePreviousNotifications:withReply:", *(_QWORD *)(a1 + 48), v3, 1, &__block_literal_global_26);

}

void __81__BCSQRCodeParser_startQRCodeParsingSessionWithMetadataObject_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint8_t v6[16];

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_14_cold_1(v4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSQRCodeParser: Finished notification successfully", v6, 2u);
  }

}

- (void)stopQRCodeParsingSession
{
  id v2;

  -[BCSQRCodeParser notificationServiceConnection](self, "notificationServiceConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelNotificationsForCodeType:", 1);

}

- (void)setPreferredBundleIdentifier:(id)a3 forURL:(id)a4
{
  id v6;
  BCSParsingServiceConnection *parsingServiceConnection;
  BCSParsingServiceConnection *v8;
  BCSParsingServiceConnection *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  parsingServiceConnection = self->_parsingServiceConnection;
  if (!parsingServiceConnection)
  {
    v8 = objc_alloc_init(BCSParsingServiceConnection);
    v9 = self->_parsingServiceConnection;
    self->_parsingServiceConnection = v8;

    parsingServiceConnection = self->_parsingServiceConnection;
  }
  -[BCSParsingServiceConnection setPreferredBundleIdentifier:forURL:](parsingServiceConnection, "setPreferredBundleIdentifier:forURL:", v10, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationServiceConnection, 0);
  objc_storeStrong((id *)&self->_parsingServiceConnection, 0);
}

void __84__BCSQRCodeParser_parseCodeFromMetadataMachineReadableCodeObject_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v0, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p QR code is not actionable", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_1();
}

void __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v0, "BCSQRCodeParser: QR code from CIQRCodeFeature %p has unrecognized format", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_1();
}

void __56__BCSQRCodeParser_parseCodeFromImage_completionHandler___block_invoke_11_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v0, "BCSQRCodeParser: QR code from CIQRCodeFeature %p is not actionable", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_1();
}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSQRCodeParser: QR code payload string has unrecognized format", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(a1, "type");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_21748C000, MEMORY[0x24BDACB70], v1, "BCSQRCodeParser: Detected QR code has type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSQRCodeParser: Detected QR code is not actionable", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __57__BCSQRCodeParser_parseCodeFromString_completionHandler___block_invoke_13_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  objc_opt_class();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_21748C000, MEMORY[0x24BDACB70], v0, "BCSQRCodeParser: Detected QR code has resolved to action of class %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_1();
}

void __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSQRCodeParser: QR code payload image has unrecognized format", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(a1, "type");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_21748C000, MEMORY[0x24BDACB70], v1, "BCSQRCodeParser: QR code from image has type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __72__BCSQRCodeParser_postNotificationAfterParsingCodeFromImage_completion___block_invoke_14_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSQRCodeParser: Finished notification with error %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)_parseMetadataObject:reply:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v0, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p has no basicDescriptor", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_1();
}

- (void)_parseMetadataObject:(void *)a1 reply:completionHandler:.cold.2(void *a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p has non-QR-code type: %@", (uint8_t *)&v3, 0x16u);

  OUTLINED_FUNCTION_2();
}

void __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v0, "BCSQRCodeParser: AVMetadataMachineReadableCodeObject %p QR code has payload with unrecognized format", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_1();
}

void __64__BCSQRCodeParser__parseMetadataObject_reply_completionHandler___block_invoke_17_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v0, "BCSQRCodeParser: failed to decode app clip code payload with error: %{private}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_1();
}

@end
