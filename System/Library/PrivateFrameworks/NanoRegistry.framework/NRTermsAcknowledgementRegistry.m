@implementation NRTermsAcknowledgementRegistry

void __44__NRTermsAcknowledgementRegistry_connection__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D0408);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nanoregistry.termsacknowledgementregistry"), 4096);
  v1 = (void *)qword_1ECE23878;
  qword_1ECE23878 = v0;

  objc_msgSend((id)qword_1ECE23878, "setRemoteObjectInterface:", v2);
  objc_msgSend((id)qword_1ECE23878, "resume");

}

- (id)proxyWithErrorHandler:(uint64_t)a1
{
  id v2;
  id v3;
  void *v4;

  if (a1)
  {
    v2 = a2;
    if (_MergedGlobals_6 != -1)
      dispatch_once(&_MergedGlobals_6, &__block_literal_global_119);
    v3 = (id)qword_1ECE23878;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)add:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD block[5];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "termsText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12 > 9)
  {
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke_2;
    v20[3] = &unk_1E4494E08;
    v15 = v10;
    v21 = v15;
    -[NRTermsAcknowledgementRegistry proxyWithErrorHandler:]((uint64_t)self, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke_170;
    v17[3] = &unk_1E4494E30;
    v18 = v8;
    v19 = v15;
    objc_msgSend(v16, "add:forDeviceID:withCompletion:", v18, v9, v17);

  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke;
    block[3] = &unk_1E4494DE0;
    block[4] = self;
    v23 = v10;
    dispatch_async(v13, block);

  }
}

void __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend((id)objc_opt_class(), "errorWithEnum:", 10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  nr_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    nr_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_1A0BDB000, v6, OS_LOG_TYPE_ERROR, "NRTermsAcknowledgementRegistry add:forEventID:withCompletion: XPC error %@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __65__NRTermsAcknowledgementRegistry_add_forDeviceID_withCompletion___block_invoke_170(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    nr_framework_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      nr_framework_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = 138412546;
        v9 = v3;
        v10 = 2112;
        v11 = v7;
        _os_log_error_impl(&dword_1A0BDB000, v6, OS_LOG_TYPE_ERROR, "NRTermsAcknowledgementRegistry add:forEventID:withCompletion: returning error %@ event %@", (uint8_t *)&v8, 0x16u);
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)checkForAcknowledgement:(id)a3 forDeviceID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  void (**v19)(id, _QWORD, void *);
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(id, _QWORD, void *);
  _QWORD v24[4];
  id v25;
  _QWORD block[5];
  void (**v27)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(v8, "termsText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12 > 9)
  {
    if (objc_msgSend(v8, "eventType"))
    {
      objc_msgSend((id)objc_opt_class(), "errorWithEnum:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      nr_framework_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        nr_framework_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v14;
          v30 = 2112;
          v31 = v8;
          _os_log_error_impl(&dword_1A0BDB000, v17, OS_LOG_TYPE_ERROR, "NRTermsAcknowledgementRegistry checkForAcknowledgement:forEventID:withCompletion: exception %@ event %@", buf, 0x16u);
        }

      }
      v10[2](v10, 0, v14);

    }
    else
    {
      v18 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke_171;
      v24[3] = &unk_1E4494E08;
      v19 = v10;
      v25 = v19;
      -[NRTermsAcknowledgementRegistry proxyWithErrorHandler:]((uint64_t)self, v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v18;
      v21[1] = 3221225472;
      v21[2] = __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke_172;
      v21[3] = &unk_1E4494E58;
      v22 = v8;
      v23 = v19;
      objc_msgSend(v20, "checkForAcknowledgement:forDeviceID:withCompletion:", v22, v9, v21);

    }
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke;
    block[3] = &unk_1E4494DE0;
    block[4] = self;
    v27 = v10;
    dispatch_async(v13, block);

  }
}

void __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend((id)objc_opt_class(), "errorWithEnum:", 10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke_171(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  nr_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    nr_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_1A0BDB000, v6, OS_LOG_TYPE_ERROR, "NRTermsAcknowledgementRegistry checkForAcknowledgement:forEventID:withCompletion: XPC error %@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __85__NRTermsAcknowledgementRegistry_checkForAcknowledgement_forDeviceID_withCompletion___block_invoke_172(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      nr_framework_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = 138412546;
        v10 = v4;
        v11 = 2112;
        v12 = v8;
        _os_log_error_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_ERROR, "NRTermsAcknowledgementRegistry checkForAcknowledgement:forEventID:withCompletion: returning error %@ event %@", (uint8_t *)&v9, 0x16u);
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)errorStringWithEnum:(unint64_t)a3
{
  if (a3 > 0xA)
    return CFSTR("🤷‍♂️");
  else
    return off_1E4494EC0[a3];
}

+ (id)errorWithEnum:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2938];
  +[NRTermsAcknowledgementRegistry errorStringWithEnum:](NRTermsAcknowledgementRegistry, "errorStringWithEnum:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanoregistry.termsacknowledgementregistry"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
