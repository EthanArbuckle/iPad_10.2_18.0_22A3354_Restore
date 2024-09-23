@implementation BCSParsingServiceConnection

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_parsingServiceConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BCSParsingServiceConnection;
  -[BCSParsingServiceConnection dealloc](&v3, sel_dealloc);
}

- (void)parseQRCodeString:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[BCSParsingServiceConnection parsingServiceConnection](self, "parsingServiceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke;
  v15[3] = &unk_24D787850;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_1;
  v13[3] = &unk_24D787DD0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "parseQRCodeString:withReply:", v7, v13);

}

void __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)parseQRCodeMetadata:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[BCSParsingServiceConnection parsingServiceConnection](self, "parsingServiceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__BCSParsingServiceConnection_parseQRCodeMetadata_withReply___block_invoke;
  v15[3] = &unk_24D787850;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __61__BCSParsingServiceConnection_parseQRCodeMetadata_withReply___block_invoke_3;
  v13[3] = &unk_24D787DD0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "parseQRCodeMetadata:withReply:", v7, v13);

}

void __61__BCSParsingServiceConnection_parseQRCodeMetadata_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __61__BCSParsingServiceConnection_parseQRCodeMetadata_withReply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)parseQRCodeFeature:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[BCSParsingServiceConnection parsingServiceConnection](self, "parsingServiceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__BCSParsingServiceConnection_parseQRCodeFeature_withReply___block_invoke;
  v15[3] = &unk_24D787850;
  v10 = v6;
  v16 = v10;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __60__BCSParsingServiceConnection_parseQRCodeFeature_withReply___block_invoke_4;
  v13[3] = &unk_24D787DD0;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "parseQRCodeFeature:withReply:", v7, v13);

}

void __60__BCSParsingServiceConnection_parseQRCodeFeature_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __60__BCSParsingServiceConnection_parseQRCodeFeature_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)decodeAppClipCodeURLWithEncodedData:(id)a3 codingVersion:(unint64_t)a4 requiresAuthorization:(BOOL)a5 withReply:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  -[BCSParsingServiceConnection parsingServiceConnection](self, "parsingServiceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __113__BCSParsingServiceConnection_decodeAppClipCodeURLWithEncodedData_codingVersion_requiresAuthorization_withReply___block_invoke;
  v19[3] = &unk_24D787850;
  v14 = v10;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __113__BCSParsingServiceConnection_decodeAppClipCodeURLWithEncodedData_codingVersion_requiresAuthorization_withReply___block_invoke_5;
  v17[3] = &unk_24D787DF8;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "decodeAppClipCodeURLWithEncodedData:codingVersion:requiresAuthorization:withReply:", v11, a4, v6, v17);

}

void __113__BCSParsingServiceConnection_decodeAppClipCodeURLWithEncodedData_codingVersion_requiresAuthorization_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __113__BCSParsingServiceConnection_decodeAppClipCodeURLWithEncodedData_codingVersion_requiresAuthorization_withReply___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setPreferredBundleIdentifier:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[BCSParsingServiceConnection parsingServiceConnection](self, "parsingServiceConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredBundleIdentifier:forURL:", v7, v6);

}

void __67__BCSParsingServiceConnection_setPreferredBundleIdentifier_forURL___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(a2);
}

- (NSXPCConnection)parsingServiceConnection
{
  NSXPCConnection *parsingServiceConnection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSXPCConnection *v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[9];

  v15[8] = *MEMORY[0x24BDAC8D0];
  parsingServiceConnection = self->_parsingServiceConnection;
  if (parsingServiceConnection)
    return parsingServiceConnection;
  v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.BarcodeSupport.ParsingService"));
  v6 = self->_parsingServiceConnection;
  self->_parsingServiceConnection = v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F00BA8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v15[3] = objc_opt_class();
  v15[4] = objc_opt_class();
  v15[5] = objc_opt_class();
  v15[6] = objc_opt_class();
  v15[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_parseQRCodeString_withReply_, 0, 1);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_parseQRCodeMetadata_withReply_, 0, 1);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_parseQRCodeFeature_withReply_, 0, 1);
  -[NSXPCConnection setRemoteObjectInterface:](self->_parsingServiceConnection, "setRemoteObjectInterface:", v7);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__BCSParsingServiceConnection_parsingServiceConnection__block_invoke;
  v12[3] = &unk_24D787578;
  objc_copyWeak(&v13, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_parsingServiceConnection, "setInvalidationHandler:", v12);
  -[NSXPCConnection resume](self->_parsingServiceConnection, "resume");
  v11 = self->_parsingServiceConnection;
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v11;
}

void __55__BCSParsingServiceConnection_parsingServiceConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setParsingServiceConnection:", 0);

}

- (void)setParsingServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_parsingServiceConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsingServiceConnection, 0);
}

void __59__BCSParsingServiceConnection_parseQRCodeString_withReply___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSParsingServiceConnection: Error getting remote object proxy: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

@end
