@implementation MLCloudDeploymentUtils

+ (id)extractTeamIdentifierAndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[4];
  uint64_t v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.CoreMLModelSecurityService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE465770);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_21147);
  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_67_21148);
  objc_msgSend(v4, "resume");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__21149;
  v21 = __Block_byref_object_dispose__21150;
  v6 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke_68;
  v16[3] = &unk_1E3D66B10;
  v16[4] = &v17;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)v18[5];
  if (v8)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v8);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = v18[5];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = CFSTR("com.apple.CoreMLModelSecurityService");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Could not create connection to %@ : error=%@", buf, 0x16u);
    }

    objc_msgSend(v4, "invalidate");
    v10 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = __Block_byref_object_copy__21149;
    v27 = __Block_byref_object_dispose__21150;
    v28 = 0;
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke_70;
    v15[3] = &unk_1E3D66B38;
    v15[4] = buf;
    v15[5] = &v17;
    objc_msgSend(v7, "extractTeamIdentifierWithReply:", v15);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      objc_msgSend(v4, "invalidate");
      v10 = *(id *)(*(_QWORD *)&buf[8] + 40);
    }
    else
    {
      if (a3)
        *a3 = objc_retainAutorelease((id)v18[5]);
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v14 = v18[5];
        *(_DWORD *)v23 = 138412290;
        v24 = v14;
        _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "Could not create team identifier error=%@", v23, 0xCu);
      }

      objc_msgSend(v4, "invalidate");
      v10 = 0;
    }
    _Block_object_dispose(buf, 8);

  }
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke_68(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke_70(uint64_t a1, void *a2, void *a3)
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

void __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke_66()
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

void __62__MLCloudDeploymentUtils_extractTeamIdentifierAndReturnError___block_invoke()
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
