@implementation ATXUserEducationSuggestionConnectorListenerDelegate

- (ATXUserEducationSuggestionConnectorListenerDelegate)initWithServiceName:(id)a3 interfaceFactory:(void *)a4 requestHandler:(id)a5
{
  id v9;
  id v10;
  ATXUserEducationSuggestionConnectorListenerDelegate *v11;
  ATXUserEducationSuggestionConnectorListenerDelegate *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXUserEducationSuggestionConnectorListenerDelegate;
  v11 = -[ATXUserEducationSuggestionConnectorListenerDelegate init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceName, a3);
    v12->_interfaceFactory = a4;
    objc_storeStrong(&v12->_requestHandler, a5);
  }

  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSString *serviceName;
  void *v9;
  id requestHandler;
  void *v11;
  _QWORD v13[5];

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__ATXUserEducationSuggestionConnectorListenerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v13[3] = &unk_1E4D59930;
  v13[4] = self;
  v5 = a4;
  v6 = (void *)MEMORY[0x1A85A511C](v13);
  v7 = (void *)MEMORY[0x1E0D81650];
  serviceName = self->_serviceName;
  ((void (*)(void))self->_interfaceFactory)();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  requestHandler = self->_requestHandler;
  __atxlog_handle_context_user_education_suggestions();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(requestHandler) = objc_msgSend(v7, "shouldAcceptConnection:serviceName:whitelistedServerInterface:whitelistedClientInterface:requestHandler:validateConnection:setupClientProxy:interruptionHandler:invalidationHandler:logHandle:", v5, serviceName, v9, 0, requestHandler, v6, 0, &__block_literal_global_17_1, &__block_literal_global_18, v11);

  return (char)requestHandler;
}

uint64_t __90__ATXUserEducationSuggestionConnectorListenerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0D81650];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  __atxlog_handle_context_user_education_suggestions();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "checkForAndLogTrueBooleanEntitlement:connection:serviceName:logHandle:", v3, v4, v3, v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
