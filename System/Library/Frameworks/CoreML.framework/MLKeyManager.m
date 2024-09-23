@implementation MLKeyManager

+ (BOOL)isModelEncrypted:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("encryptionInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "fileExistsAtPath:", v6);

  return v7;
}

+ (id)extractKeyIdentifierFromModelAtURL:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL *)a4 error:(id *)a5
{
  id v6;
  id v7;
  _QWORD *v8;
  std::string *p_p;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::ios_base::failure *exception;
  const std::error_category *v16;
  std::string __p;
  uint64_t v18;
  std::__shared_weak_count *v19;
  char *v20;
  std::error_code __ec;

  v6 = a3;
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("encryptionInfo"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v7, "fileSystemRepresentation"));
  IArchive::IArchive(&v18, (uint64_t)&__p, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  memset(&__p, 0, sizeof(__p));
  operator>>((uint64_t)&v18, &__p);
  (*(void (**)(_QWORD))(**(_QWORD **)(v18 + 32) + 16))(*(_QWORD *)(v18 + 32));
  if (std::istream::peek() != -1)
  {
    (*(void (**)(_QWORD))(**(_QWORD **)(v18 + 32) + 16))(*(_QWORD *)(v18 + 32));
    v8 = (_QWORD *)std::istream::read();
    if ((*((_BYTE *)v8 + *(_QWORD *)(*v8 - 24) + 32) & 5) != 0)
    {
      exception = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
      v16 = std::iostream_category();
      *(_QWORD *)&__ec.__val_ = 1;
      __ec.__cat_ = v16;
      std::ios_base::failure::failure(exception, "Error reading from archive.", &__ec);
      __cxa_throw(exception, MEMORY[0x1E0DE4E48], MEMORY[0x1E0DE4CB0]);
    }
  }
  *a4 = 0;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v20);
  v11 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

  return v10;
}

+ (id)syncQueue
{
  if (+[MLKeyManager syncQueue]::onceToken != -1)
    dispatch_once(&+[MLKeyManager syncQueue]::onceToken, &__block_literal_global_18060);
  return (id)+[MLKeyManager syncQueue]::_syncQueue;
}

+ (id)createPersistentKeyBlobForKeyID:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  id *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__18046;
  v22 = __Block_byref_object_dispose__18047;
  v23 = 0;
  objc_msgSend(a1, "syncQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke;
  v13[3] = &unk_1E3D668F0;
  v15 = &v18;
  v16 = a5;
  v17 = a4;
  v14 = v8;
  v10 = v8;
  dispatch_sync(v9, v13);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

+ (id)loadDecryptionKeyForModelAtURL:(id)a3 retUsesCodeSigningIdentityForEncryption:(BOOL *)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  BOOL v11;

  v11 = 0;
  objc_msgSend(a1, "extractKeyIdentifierFromModelAtURL:usesCodeSigningIdentityForEncryption:error:", a3, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a4)
      *a4 = v11;
    +[MLPersistentKeyStorage retrieveKeyBlobForKeyIdentifier:](MLPersistentKeyStorage, "retrieveKeyBlobForKeyIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || (+[MLKeyManager createPersistentKeyBlobForKeyID:usesCodeSigningIdentityForEncryption:error:](MLKeyManager, "createPersistentKeyBlobForKeyID:usesCodeSigningIdentityForEncryption:error:", v7, v11, a5), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0)&& +[MLPersistentKeyStorage storeKeyBlob:forKeyIdentifier:error:](MLPersistentKeyStorage, "storeKeyBlob:forKeyIdentifier:error:", v8, v7, a5))
    {
      v9 = v8;
      v8 = v9;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)decryptSessionForModelAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v11;

  v5 = a3;
  v11 = 0;
  +[MLKeyManager loadDecryptionKeyForModelAtURL:retUsesCodeSigningIdentityForEncryption:error:](MLKeyManager, "loadDecryptionKeyForModelAtURL:retUsesCodeSigningIdentityForEncryption:error:", v5, &v11, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "filePathURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLFairPlayDecryptSession decryptSessionForModelAtPath:usesCodeSigningIdentityForEncryption:keyBlob:error:](MLFairPlayDecryptSession, "decryptSessionForModelAtPath:usesCodeSigningIdentityForEncryption:keyBlob:error:", v8, v11, v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.CoreMLModelSecurityService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE465770);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  objc_msgSend(v2, "setInterruptionHandler:", &__block_literal_global_73);
  objc_msgSend(v2, "setInvalidationHandler:", &__block_literal_global_76);
  objc_msgSend(v2, "resume");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18046;
  v21 = __Block_byref_object_dispose__18047;
  v4 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_77;
  v16[3] = &unk_1E3D66B10;
  v16[4] = &v17;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v18[5];
  if (v6)
  {
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v6);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v8 = v18[5];
    *(_DWORD *)buf = 138412546;
    v24 = CFSTR("com.apple.CoreMLModelSecurityService");
    v25 = 2112;
    v26 = v8;
    v9 = "Could not create connection to %@ : error=%@";
LABEL_13:
    _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x16u);
LABEL_10:

    goto LABEL_11;
  }
  v10 = *(unsigned __int8 *)(a1 + 56);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_79;
  v15[3] = &unk_1E3D668C8;
  v11 = *(_QWORD *)(a1 + 32);
  v15[4] = *(_QWORD *)(a1 + 40);
  v15[5] = &v17;
  objc_msgSend(v5, "createPersistentKeyBlobForKeyID:usesCodeSigningIdentityForEncryption:completionBlock:", v11, v10, v15);
  v12 = (void *)v18[5];
  if (v12)
  {
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v12);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v13 = *(const __CFString **)(a1 + 32);
    v14 = v18[5];
    *(_DWORD *)buf = 138412546;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    v9 = "Could not create persistent key blob for %@ : error=%@";
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(v2, "invalidate");

  _Block_object_dispose(&v17, 8);
}

void __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_77(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_75()
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

void __91__MLKeyManager_createPersistentKeyBlobForKeyID_usesCodeSigningIdentityForEncryption_error___block_invoke_2()
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

void __25__MLKeyManager_syncQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.coreml.KeyManager", 0);
  v1 = (void *)+[MLKeyManager syncQueue]::_syncQueue;
  +[MLKeyManager syncQueue]::_syncQueue = (uint64_t)v0;

}

@end
