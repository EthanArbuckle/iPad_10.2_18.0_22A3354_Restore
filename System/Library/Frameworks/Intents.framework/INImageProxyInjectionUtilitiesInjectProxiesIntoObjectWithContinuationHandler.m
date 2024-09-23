@implementation INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler

void __INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke_15(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v18 = a1[4];
      v19 = a1[5];
      *(_DWORD *)buf = 136315906;
      v25 = "INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke";
      v26 = 2114;
      v27 = v18;
      v28 = 2114;
      v29 = v19;
      v30 = 2114;
      v31 = v6;
      _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s Error requesting image proxy during injection to object: %{public}@ image: %{public}@ error: %{public}@", buf, 0x2Au);
    }
    (*(void (**)(void))(a1[6] + 16))();
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  }
  else
  {
    v8 = objc_msgSend(v5, "isEqual:", a1[5]);
    v9 = INSiriLogContextIntents;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v21 = a1[4];
        v20 = a1[5];
        *(_DWORD *)buf = 136315650;
        v25 = "INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke";
        v26 = 2112;
        v27 = v20;
        v28 = 2112;
        v29 = v21;
        _os_log_error_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_ERROR, "%s Failed to proxy image %@ for injection to %@ due to proxy loop, skipping", buf, 0x20u);
      }
      objc_msgSend(v5, "purgeStoredImageWithCompletion:", 0);
      (*(void (**)(void))(a1[6] + 16))();
      v10 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempted to proxy-loop the image %@ in %@"), a1[5], a1[4], *MEMORY[0x1E0CB2938]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6005, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1[7] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
    else
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        v17 = a1[4];
        v16 = a1[5];
        *(_DWORD *)buf = 136315650;
        v25 = "INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke";
        v26 = 2112;
        v27 = v16;
        v28 = 2112;
        v29 = v17;
        _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s Successfully proxied image %@, injecting into %@", buf, 0x20u);
      }
      (*(void (**)(void))(a1[6] + 16))();
    }
  }

}

void __INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void (*v21)(void);
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 100) && (objc_msgSend(*(id *)(a1 + 32), "_isSupportedForDonation") & 1) == 0)
  {
    v18 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v30 = "INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke_2";
      v31 = 2112;
      v32 = v19;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_18BEBC000, v18, OS_LOG_TYPE_INFO, "%s Image %@ is being provided outside of SiriKit and is not supported for donation. Removing from the injection target %@", buf, 0x20u);
    }
    v21 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_19;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "isCanceled") & 1) != 0
    || (v2 = *(_QWORD *)(a1 + 64)) != 0
    && !(*(unsigned int (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32)))
  {
    v4 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v30 = "INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke";
      v31 = 2112;
      v32 = v15;
      v33 = 2112;
      v34 = v16;
      v17 = "%s Proxy injection rejected for image %@ into %@, skipping";
LABEL_17:
      _os_log_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_INFO, v17, buf, 0x20u);
    }
LABEL_18:
    v21 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_19:
    v21();
    return;
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "_isEligibleForProxying");
  v4 = INSiriLogContextIntents;
  v5 = os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v5)
    {
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v30 = "INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke";
      v31 = 2112;
      v32 = v22;
      v33 = 2112;
      v34 = v23;
      v17 = "%s Image %@ is not eligible for proxying into %@, returning original image";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v4;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v30 = "INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke";
    v31 = 2112;
    v32 = v6;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_INFO, "%s Proxying image %@ for injection into %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setPreferredScaledSize:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  v10 = *(unsigned int *)(a1 + 96);
  v11 = *(unsigned __int8 *)(a1 + 101);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke_15;
  v24[3] = &unk_1E2288EE8;
  v12 = *(_QWORD *)(a1 + 32);
  v25 = *(id *)(a1 + 40);
  v26 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 72);
  v27 = v13;
  v28 = v14;
  +[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:completion:](INRemoteImageProxy, "requestProxyByStoringImage:qualityOfService:scaled:storeType:completion:", v12, v10, v11, 0, v24);

}

void __INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  dispatch_block_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  int v21;
  char v22;
  char v23;

  v5 = a2;
  v6 = a3;
  LODWORD(a3) = *(_DWORD *)(a1 + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke_2;
  block[3] = &unk_1E2288F10;
  v22 = *(_BYTE *)(a1 + 92);
  v14 = v5;
  v7 = *(NSObject **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v17 = v6;
  v16 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 72);
  v21 = *(_DWORD *)(a1 + 88);
  v23 = *(_BYTE *)(a1 + 93);
  v9 = *(_QWORD *)(a1 + 64);
  v18 = v8;
  v19 = v9;
  v10 = v6;
  v11 = v5;
  v12 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, (dispatch_qos_class_t)a3, 0, block);
  dispatch_async(v7, v12);

}

void __INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Timing out after %@ seconds during proxy injection to %@"), v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke";
    v15 = 2112;
    v16 = v4;
    _os_log_error_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2938];
  v12 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6007, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v10);

  os_activity_scope_leave((os_activity_scope_state_t)(a1 + 56));
}

void __INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  dispatch_qos_class_t v4;
  NSObject *v5;
  id v6;
  id v7;
  dispatch_block_t v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;

  v3 = a2;
  v4 = *(_DWORD *)(a1 + 88);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke_2_21;
  block[3] = &unk_1E2288F60;
  v5 = *(NSObject **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v12 = v3;
  v13 = v6;
  v14 = *(_QWORD *)(a1 + 64);
  v15 = *(_OWORD *)(a1 + 72);
  v7 = v3;
  v8 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v4, 0, block);
  dispatch_async(v5, v8);

}

void __INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke_2_21(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "cancelIfNotAlreadyCanceled"))
  {
    v2 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v3 = v2;
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler_block_invoke_2";
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_18BEBC000, v3, OS_LOG_TYPE_INFO, "%s Finished image proxy injection into %@", (uint8_t *)&v6, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    os_activity_scope_leave((os_activity_scope_state_t)(a1 + 72));
  }
}

@end
