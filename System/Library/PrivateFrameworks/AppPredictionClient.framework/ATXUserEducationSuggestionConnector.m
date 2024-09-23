@implementation ATXUserEducationSuggestionConnector

- (ATXUserEducationSuggestionConnector)initWithOurInterfaceFactory:(void *)a3 theirInterfaceFactory:(void *)a4 ourServiceName:(id)a5 theirServiceName:(id)a6 requestHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  ATXUserEducationSuggestionConnector *v15;
  ATXUserEducationSuggestionConnectorListenerDelegate *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _PASXPCClientHelper *xpcClientHelper;
  objc_super v23;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXUserEducationSuggestionConnector;
  v15 = -[ATXUserEducationSuggestionConnector init](&v23, sel_init);
  if (v15)
  {
    v16 = -[ATXUserEducationSuggestionConnectorListenerDelegate initWithServiceName:interfaceFactory:requestHandler:]([ATXUserEducationSuggestionConnectorListenerDelegate alloc], "initWithServiceName:interfaceFactory:requestHandler:", v12, a3, v14);
    objc_msgSend(MEMORY[0x1E0D81648], "registerForService:delegate:", v12, v16);
    v17 = objc_alloc(MEMORY[0x1E0D81640]);
    ((void (*)(void))a4)();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_context_user_education_suggestions();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:interruptionHandler:invalidationHandler:logHandle:", v13, v18, 0, 0, &__block_literal_global_39, &__block_literal_global_3_1, v19);
    xpcClientHelper = v15->_xpcClientHelper;
    v15->_xpcClientHelper = (_PASXPCClientHelper *)v20;

  }
  return v15;
}

- (id)remoteObjectProxy
{
  return (id)-[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](self->_xpcClientHelper, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5_1);
}

void __56__ATXUserEducationSuggestionConnector_remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __atxlog_handle_context_user_education_suggestions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __56__ATXUserEducationSuggestionConnector_remoteObjectProxy__block_invoke_cold_1((uint64_t)v2, v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClientHelper, 0);
}

void __56__ATXUserEducationSuggestionConnector_remoteObjectProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXUserEducationSuggestionConnector remoteObjectProxy]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "%s: error with xpc connection: %@", (uint8_t *)&v2, 0x16u);
}

@end
