@implementation NRSystemVersionRequest

void __36__NRSystemVersionRequest_connection__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D7700);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nanoregistry.versionrequest"), 4096);
  v1 = (void *)qword_1ECE239B0;
  qword_1ECE239B0 = v0;

  objc_msgSend((id)qword_1ECE239B0, "setRemoteObjectInterface:", v2);
  objc_msgSend((id)qword_1ECE239B0, "resume");

}

- (void)sendVersionRequestToCompanion
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  nr_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1A0BDB000, v5, OS_LOG_TYPE_DEFAULT, "Send version request in framework", (uint8_t *)&v14, 2u);
    }

  }
  if (self)
  {
    v6 = &__block_literal_global_53;
    nr_framework_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      nr_framework_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_error_impl(&dword_1A0BDB000, v9, OS_LOG_TYPE_ERROR, "connection called", (uint8_t *)&v14, 2u);
      }

    }
    if (_MergedGlobals_17 != -1)
      dispatch_once(&_MergedGlobals_17, &__block_literal_global_19);
    nr_framework_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      nr_framework_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412290;
        v15 = qword_1ECE239B0;
        _os_log_error_impl(&dword_1A0BDB000, v12, OS_LOG_TYPE_ERROR, "return connection: %@", (uint8_t *)&v14, 0xCu);
      }

    }
    v13 = (id)qword_1ECE239B0;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_53);
    self = (NRSystemVersionRequest *)objc_claimAutoreleasedReturnValue();

  }
  -[NRSystemVersionRequest sendVersionRequestToCompanion](self, "sendVersionRequestToCompanion");

}

void __55__NRSystemVersionRequest_sendVersionRequestToCompanion__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  nr_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_error_impl(&dword_1A0BDB000, v5, OS_LOG_TYPE_ERROR, "Error sending NRSystemVersionRequest : XPC error %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

@end
