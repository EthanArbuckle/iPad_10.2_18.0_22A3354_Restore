@implementation EMRemoteContentURLSchemeHandler

- (void)setOnWebViewConfiguration:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[EMRemoteContentURLSchemeHandler remoteContentHTTPScheme](self, "remoteContentHTTPScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setURLSchemeHandler:forURLScheme:", self, v4);

  -[EMRemoteContentURLSchemeHandler remoteContentHTTPSScheme](self, "remoteContentHTTPSScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setURLSchemeHandler:forURLScheme:", self, v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  objc_msgSend(v7, "_setAllowedNetworkHosts:", v6);

}

- (NSString)remoteContentHTTPScheme
{
  return -[NSString stringByAppendingString:](self->_schemePrefix, "stringByAppendingString:", CFSTR("http"));
}

- (NSString)remoteContentHTTPSScheme
{
  return -[NSString stringByAppendingString:](self->_schemePrefix, "stringByAppendingString:", CFSTR("https"));
}

- (NSString)schemePrefix
{
  return self->_schemePrefix;
}

- (EMRemoteContentURLSchemeHandler)initWithSession:(id)a3 schemePrefix:(id)a4 allowProxying:(BOOL)a5
{
  id v9;
  id v10;
  EMRemoteContentURLSchemeHandler *v11;
  EMRemoteContentURLSchemeHandler *v12;
  uint64_t v13;
  EFScheduler *scheduler;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EMRemoteContentURLSchemeHandler;
  v11 = -[EMRemoteContentURLSchemeHandler init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_schemePrefix, a4);
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v13 = objc_claimAutoreleasedReturnValue();
    scheduler = v12->_scheduler;
    v12->_scheduler = (EFScheduler *)v13;

    objc_storeStrong((id *)&v12->_session, a3);
    v12->_allowProxying = a5;
  }

  return v12;
}

+ (id)dataTaskForRequest:(id)a3 withSchemePrefix:(id)a4 session:(id)a5 scheduler:(id)a6 allowProxying:(BOOL)a7 cancelationToken:(id *)a8 completionHandler:(id)a9
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void (**v28)(_QWORD, _QWORD);
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  void (**v40)(_QWORD, _QWORD);
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  BOOL v47;

  v10 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v37 = a6;
  v35 = v14;
  v36 = a9;
  v34 = v15;
  v17 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  v18 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v14, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ef_urlByRemovingPrefixFromScheme:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setURL:", v20);

  if (a8)
    *a8 = objc_retainAutorelease(v17);
  v21 = v17;
  v22 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke;
  v41[3] = &unk_1E70F5948;
  v23 = v16;
  v42 = v23;
  v24 = v18;
  v43 = v24;
  v47 = v10;
  v25 = v21;
  v44 = v25;
  v26 = v37;
  v45 = v26;
  v27 = v36;
  v46 = v27;
  v28 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCC8C10](v41);
  v29 = objc_alloc_init(MEMORY[0x1E0D1EF60]);
  v30 = v29;
  if (v10)
  {
    v38[0] = v22;
    v38[1] = 3221225472;
    v38[2] = __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_4;
    v38[3] = &unk_1E70F4A20;
    v39 = v29;
    v40 = v28;
    EMPrivacyProxyIsDisabledForNetwork(v38);

    v31 = v39;
  }
  else
  {
    v28[2](v28, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "finishWithResult:", v31);
  }

  objc_msgSend(v30, "future");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

id __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned __int8 *)(a1 + 72);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_2;
  v9[3] = &unk_1E70F5920;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  objc_msgSend(v4, "dataTaskWithRequest:isSynthetic:allowProxying:failOpen:completionHandler:", v5, 0, v6, a2, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addCancelable:", v7);

  return v7;
}

void __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD *);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_3;
    v16 = &unk_1E70F58F8;
    v20 = *(id *)(a1 + 48);
    v17 = v7;
    v18 = v8;
    v19 = v9;
    objc_msgSend(v11, "performCancelableBlock:", &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addCancelable:", v12, v13, v14, v15, v16);

  }
}

uint64_t __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:");

}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  EFScheduler *v11;
  void *v12;
  NSString *schemePrefix;
  EMRemoteContentURLSession *session;
  _BOOL8 v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  EFScheduler *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  EFScheduler *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  os_activity_scope_state_s state;
  uint64_t v32;
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = _os_activity_create(&dword_1B99BB000, "-[EMRemoteContentURLSchemeHandler webView:startURLSchemeTask:]", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v6, &state);
  objc_msgSend(v5, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ef_hasCaseInsensitivePrefix:", self->_schemePrefix);

  if ((v10 & 1) != 0)
  {
    v11 = self->_scheduler;
    v12 = (void *)objc_opt_class();
    schemePrefix = self->_schemePrefix;
    session = self->_session;
    v15 = -[EMRemoteContentURLSchemeHandler allowProxying](self, "allowProxying");
    v30 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke;
    v28[3] = &unk_1E70F5970;
    v17 = v5;
    v29 = v17;
    objc_msgSend(v12, "dataTaskForRequest:withSchemePrefix:session:scheduler:allowProxying:cancelationToken:completionHandler:", v7, schemePrefix, session, v11, v15, &v30, v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v30;
    objc_setAssociatedObject(v17, &kTokenKey, v19, (void *)0x301);
    objc_msgSend(v18, "addSuccessBlock:", &__block_literal_global_42);
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke_3;
    v24[3] = &unk_1E70F4198;
    v20 = v19;
    v25 = v20;
    v21 = v11;
    v26 = v21;
    v27 = v17;
    objc_msgSend(v18, "addFailureBlock:", v24);

    v22 = v29;
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB32F0];
    objc_msgSend(v7, "URL");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v33[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v21 = (EFScheduler *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1000, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didFailWithError:", v22);
  }

  os_activity_scope_leave(&state);
}

void __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v9, "didReceiveResponse:", v7);
    objc_msgSend(*(id *)(a1 + 32), "didReceiveData:", v10);
    objc_msgSend(*(id *)(a1 + 32), "didFinish");
  }
  else
  {
    objc_msgSend(v9, "didFailWithError:", v8);
  }

}

uint64_t __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resume");
}

void __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke_4;
  v11 = &unk_1E70F59C0;
  v12 = *(id *)(a1 + 48);
  v6 = v3;
  v13 = v6;
  objc_msgSend(v5, "performCancelableBlock:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addCancelable:", v7, v8, v9, v10, v11);

}

uint64_t __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFailWithError:", *(_QWORD *)(a1 + 40));
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  void *v4;
  id object;

  object = a4;
  objc_getAssociatedObject(object, &kTokenKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");
  objc_setAssociatedObject(object, &kTokenKey, 0, (void *)0x301);

}

- (BOOL)allowProxying
{
  return self->_allowProxying;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_schemePrefix, 0);
}

@end
