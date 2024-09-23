@implementation HFAddAndSetupNewAccessoriesHandler

- (BOOL)isAccessorySetupActive
{
  return self->_isAccessorySetupActive;
}

+ (id)sharedHandler
{
  if (qword_1ED379020 != -1)
    dispatch_once(&qword_1ED379020, &__block_literal_global_76);
  return (id)_MergedGlobals_245;
}

void __51__HFAddAndSetupNewAccessoriesHandler_sharedHandler__block_invoke()
{
  HFAddAndSetupNewAccessoriesHandler *v0;
  void *v1;

  v0 = objc_alloc_init(HFAddAndSetupNewAccessoriesHandler);
  v1 = (void *)_MergedGlobals_245;
  _MergedGlobals_245 = (uint64_t)v0;

}

- (HFAddAndSetupNewAccessoriesHandler)init
{
  HFAddAndSetupNewAccessoriesHandler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HFAddAndSetupNewAccessoriesHandler;
  result = -[HFAddAndSetupNewAccessoriesHandler init](&v3, sel_init);
  if (result)
    result->_isAccessorySetupActive = 0;
  return result;
}

+ (id)addAndSetupNewAccessoriesForHome:(id)a3 room:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D519C0];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke;
  v16 = &unk_1EA729F18;
  v17 = v5;
  v18 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "futureWithBlock:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "addCompletionBlock:", &__block_literal_global_7_3, v13, v14, v15, v16);

  return v10;
}

void __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[HFAddAndSetupNewAccessoriesHandler sharedHandler](HFAddAndSetupNewAccessoriesHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessorySetupActive:", 1);

  HFLogForCategory(0x3AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Calling -[HMHome addAndSetUpNewAccessoriesWithSuggestedRoomName:completionHandler:] on home: %@ room: %@", buf, 0x16u);
  }

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke_2;
  v11[3] = &unk_1EA7310E8;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v8, "addAndSetUpNewAccessoriesWithSuggestedRoomName:completionHandler:", v9, v11);

}

void __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(0x3AuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "-[HMHome addAndSetUpNewAccessoriesWithSuggestedRoomName:completionHandler:] finished with error: %@, addedAccessories: %@", (uint8_t *)&v10, 0x16u);

  }
  +[HFAddAndSetupNewAccessoriesHandler sharedHandler](HFAddAndSetupNewAccessoriesHandler, "sharedHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsAccessorySetupActive:", 0);

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v6, v5);
}

void __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "hf_isHFErrorWithCode:", 46))
    {
      objc_msgSend(v4, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("HFErrorUserInfoOptionsKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKey:", HFAppPunchoutRequestEncodedKey);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v15;
      HFLogForCategory(0x3AuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v9;
          _os_log_error_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_ERROR, "Received HomeUIService HFErrorCodeSetupAccessoryOwnershipProofPunchoutRequired, but failed to unarchive request with error %@", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v8;
          _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Received HomeUIService HFErrorCodeSetupAccessoryOwnershipProofPunchoutRequired with request %@", buf, 0xCu);
        }

        +[HFAppPunchoutRequest handleRequest:](HFAppPunchoutRequest, "handleRequest:", v8);
        v11 = objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke_10;
        v13[3] = &unk_1EA726968;
        v14 = v8;
        v12 = (id)-[NSObject addFailureBlock:](v11, "addFailureBlock:", v13);

      }
    }

  }
}

void __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x3AuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to handle request %@ with error %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)setIsAccessorySetupActive:(BOOL)a3
{
  self->_isAccessorySetupActive = a3;
}

@end
