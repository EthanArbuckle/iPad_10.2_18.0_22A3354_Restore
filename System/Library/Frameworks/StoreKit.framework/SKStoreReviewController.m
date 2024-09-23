@implementation SKStoreReviewController

+ (void)requestReview
{
  void *v3;
  id v4;

  if (!+[SKEntitlementChecker checkForEntitlement:](SKEntitlementChecker, "checkForEntitlement:", CFSTR("com.apple.developer.on-demand-install-capable")))
  {
    objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "requestReviewInScene:", v3);

  }
}

+ (void)requestReviewInScene:(UIWindowScene *)windowScene
{
  UIWindowScene *v4;
  SKXPCConnection *v5;
  void *v6;
  UIWindowScene *v7;
  _QWORD v8[4];
  UIWindowScene *v9;
  id v10;

  v4 = windowScene;
  v5 = -[SKXPCConnection initWithServiceName:]([SKXPCConnection alloc], "initWithServiceName:", 0x1E5B2FB40);
  v6 = (void *)SSXPCCreateMessageDictionary();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__SKStoreReviewController_requestReviewInScene___block_invoke;
  v8[3] = &unk_1E5B277E0;
  v9 = v4;
  v10 = a1;
  v7 = v4;
  -[SKXPCConnection sendMessage:withReply:](v5, "sendMessage:withReply:", v6, v8);

}

void __48__SKStoreReviewController_requestReviewInScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  BOOL v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint64_t v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = v3 == (id)MEMORY[0x1E0C81260] || v3 == (id)MEMORY[0x1E0C81258];
  if (!v5 && v3 && MEMORY[0x1AF43BC3C](v3) == MEMORY[0x1E0C812F8])
  {
    objc_opt_class();
    v13 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    xpc_dictionary_get_value(v4, "2");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v14, "initWithXPCEncoding:", v15);

    if (v13)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__SKStoreReviewController_requestReviewInScene___block_invoke_2;
      block[3] = &unk_1E5B269C0;
      v16 = *(void **)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 40);
      v19 = v16;
      v20 = v13;
      v6 = v13;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      goto LABEL_19;
    }
    v6 = v7;
    if (!v7)
      goto LABEL_20;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v22 = 138412546;
      v23 = (id)objc_opt_class();
      v24 = 2112;
      v25 = v6;
      v11 = v23;
      LODWORD(v17) = 22;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v22, v17);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

    goto LABEL_19;
  }
  SSError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_10;
LABEL_20:

}

void __48__SKStoreReviewController_requestReviewInScene___block_invoke_2(id *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];

  v2 = objc_msgSend(a1[6], "convertInterfaceOrientation:", objc_msgSend(a1[4], "interfaceOrientation"));
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__SKStoreReviewController_requestReviewInScene___block_invoke_3;
  v13[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v13[4] = a1[6];
  objc_msgSend(v3, "storeKitServiceWithErrorHandler:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_sceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __48__SKStoreReviewController_requestReviewInScene___block_invoke_22;
  v9[3] = &unk_1E5B277B8;
  v12 = a1[6];
  v10 = a1[4];
  v11 = a1[5];
  objc_msgSend(v5, "requestProductReviewWithInterfaceOrientation:bundleIdentifier:sceneID:replyBlock:", v2, v7, v8, v9);

}

void __48__SKStoreReviewController_requestReviewInScene___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_9;
  *(_DWORD *)v10 = 138412546;
  *(_QWORD *)&v10[4] = objc_opt_class();
  *(_WORD *)&v10[12] = 2112;
  *(_QWORD *)&v10[14] = v2;
  v7 = *(id *)&v10[4];
  LODWORD(v9) = 22;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, v10, v9, *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog();
LABEL_9:

  }
}

uint64_t __48__SKStoreReviewController_requestReviewInScene___block_invoke_22(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 48), "requestReviewViaDirectInjectionFlowInScene:requestToken:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

+ (void)requestReviewViaDirectInjectionFlowInScene:(id)a3 requestToken:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  id v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    v9 &= 2u;
  if (!v9)
    goto LABEL_9;
  v19 = 138412290;
  v20 = (id)objc_opt_class();
  v11 = v20;
  LODWORD(v15) = 12;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v19, v15);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog();
LABEL_9:

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SKStoreReviewController_requestReviewViaDirectInjectionFlowInScene_requestToken___block_invoke;
  block[3] = &unk_1E5B27350;
  v17 = v6;
  v18 = v5;
  v13 = v5;
  v14 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __83__SKStoreReviewController_requestReviewViaDirectInjectionFlowInScene_requestToken___block_invoke(uint64_t a1)
{
  void *v2;
  SKStoreReviewPresentationWindow *v3;
  SKStoreReviewViewController *v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendAction:to:from:forEvent:", sel_resignFirstResponder, 0, 0, 0);

  v4 = -[SKStoreReviewViewController initWithReviewRequestToken:]([SKStoreReviewViewController alloc], "initWithReviewRequestToken:", *(_QWORD *)(a1 + 32));
  v3 = -[UIApplicationRotationFollowingWindow initWithWindowScene:]([SKStoreReviewPresentationWindow alloc], "initWithWindowScene:", *(_QWORD *)(a1 + 40));
  -[SKStoreReviewPresentationWindow setHidden:](v3, "setHidden:", 0);
  -[SKStoreReviewViewController setPresentationWindow:](v4, "setPresentationWindow:", v3);
  -[SKStoreReviewPresentationWindow presentViewController:animated:completion:](v3, "presentViewController:animated:completion:", v4, 1, 0);

}

+ (unint64_t)convertInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4)
    return 0;
  else
    return a3;
}

@end
