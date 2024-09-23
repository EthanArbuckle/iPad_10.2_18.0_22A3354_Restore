@implementation MLFairPlayDecryptSession

- (void)dealloc
{
  void *v3;
  NSString *modelPath;
  NSXPCConnection *xpcConnection;
  CoreMLModelSecurityProtocol *xpcProxy;
  objc_super v7;

  v3 = (void *)-[NSString copy](self->_modelPath, "copy");
  -[CoreMLModelSecurityProtocol stopDecryptionOfModelAtPath:completionBlock:](self->_xpcProxy, "stopDecryptionOfModelAtPath:completionBlock:", v3, &__block_literal_global_72);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  modelPath = self->_modelPath;
  self->_modelPath = 0;

  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  xpcProxy = self->_xpcProxy;
  self->_xpcProxy = 0;

  v7.receiver = self;
  v7.super_class = (Class)MLFairPlayDecryptSession;
  -[MLFairPlayDecryptSession dealloc](&v7, sel_dealloc);
}

- (NSString)modelPath
{
  return self->_modelPath;
}

- (void)setModelPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (CoreMLModelSecurityProtocol)xpcProxy
{
  return self->_xpcProxy;
}

- (void)setXpcProxy:(id)a3
{
  objc_storeStrong((id *)&self->_xpcProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);
}

+ (id)decryptSessionForModelAtPath:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL)a4 keyBlob:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  MLFairPlayDecryptSession *v20;
  uint64_t v22;
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v8 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = (__CFString *)a3;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.CoreMLModelSecurityService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE465770);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteObjectInterface:", v12);

  objc_msgSend(v11, "setInterruptionHandler:", &__block_literal_global_13688);
  objc_msgSend(v11, "setInvalidationHandler:", &__block_literal_global_67);
  objc_msgSend(v11, "resume");
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__13689;
  v29 = __Block_byref_object_dispose__13690;
  v13 = MEMORY[0x1E0C809B0];
  v30 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke_68;
  v24[3] = &unk_1E3D66B10;
  v24[4] = &v25;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)v26[5];
  if (v15)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v15);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v17 = v26[5];
    *(_DWORD *)buf = 138412546;
    v32 = CFSTR("com.apple.CoreMLModelSecurityService");
    v33 = 2112;
    v34 = v17;
    v18 = "Could not create connection to %@ : error=%@";
    goto LABEL_14;
  }
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke_70;
  v23[3] = &unk_1E3D66B10;
  v23[4] = &v25;
  objc_msgSend(v14, "startDecryptionOfModelAtPath:usingKeyBlob:usesCodeSigningIdentityForEncryption:completionBlock:", v9, v10, v8, v23);
  v19 = (void *)v26[5];
  if (!v19)
  {
    v20 = objc_alloc_init(MLFairPlayDecryptSession);
    -[MLFairPlayDecryptSession setModelPath:](v20, "setModelPath:", v9);
    -[MLFairPlayDecryptSession setXpcConnection:](v20, "setXpcConnection:", v11);
    -[MLFairPlayDecryptSession setXpcProxy:](v20, "setXpcProxy:", v14);
    goto LABEL_11;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v19);
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v22 = v26[5];
    *(_DWORD *)buf = 138412546;
    v32 = v9;
    v33 = 2112;
    v34 = v22;
    v18 = "Could not create decrypt session for %@ : error=%@";
LABEL_14:
    _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
  }
LABEL_10:

  objc_msgSend(v11, "invalidate");
  v20 = 0;
LABEL_11:

  _Block_object_dispose(&v25, 8);
  return v20;
}

void __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke_68(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke_70(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke_66()
{
  NSObject *v0;
  uint8_t v1[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19C486000, v0, OS_LOG_TYPE_DEBUG, "Entered invalidationHandler!", v1, 2u);
  }

}

void __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19C486000, v0, OS_LOG_TYPE_DEBUG, "Entered interruptionHandler!", v1, 2u);
  }

}

@end
