@implementation EKVirtualConferenceProvider

- (EKVirtualConferenceProvider)init
{
  EKVirtualConferenceProvider *v2;
  objc_class *v3;
  objc_class *v4;
  objc_method *InstanceMethod;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EKVirtualConferenceProvider;
  v2 = -[EKVirtualConferenceProvider init](&v10, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v4, sel_beginRequestWithExtensionContext_);
    if (InstanceMethod != class_getInstanceMethod(v3, sel_beginRequestWithExtensionContext_))
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99750];
      NSStringFromClass(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "raise:format:", v7, CFSTR("You have overridden beginRequestWithExtensionContext: on your subclass of EKVirtualConferenceProvider (%@) - this is not allowed"), v8);

    }
  }
  return v2;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  if (objc_msgSend(v4, "requestType") == 1)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke;
    v16[3] = &unk_1E47851E8;
    v17 = v4;
    -[EKVirtualConferenceProvider fetchAvailableRoomTypesWithCompletionHandler:](self, "fetchAvailableRoomTypesWithCompletionHandler:", v16);
    v5 = v17;
  }
  else if (objc_msgSend(v4, "requestType") == 2)
  {
    objc_msgSend(v4, "roomTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_2;
    v14[3] = &unk_1E4785210;
    v15 = v4;
    -[EKVirtualConferenceProvider fetchVirtualConferenceForIdentifier:completionHandler:](self, "fetchVirtualConferenceForIdentifier:completionHandler:", v6, v14);

    v5 = v15;
  }
  else if (objc_msgSend(v4, "requestType") == 5)
  {
    objc_msgSend(v4, "URLForInvalidation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_3;
    v12[3] = &unk_1E4785238;
    v13 = v4;
    -[EKVirtualConferenceProvider invalidateURL:withCompletionHandler:](self, "invalidateURL:withCompletionHandler:", v7, v12);

    v5 = v13;
  }
  else
  {
    if (objc_msgSend(v4, "requestType") != 4)
    {
      objc_msgSend(v4, "completeRequestReturningItems:completionHandler:", 0, 0);
      goto LABEL_10;
    }
    objc_msgSend(v4, "URLForRenewal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "renewalDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_4;
    v10[3] = &unk_1E4785238;
    v11 = v4;
    -[EKVirtualConferenceProvider extendExpirationOfURL:toExpirationDate:withCompletion:](self, "extendExpirationOfURL:toExpirationDate:withCompletion:", v8, v9, v10);

    v5 = v11;
  }

LABEL_10:
}

uint64_t __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeRequestWithAvailableRoomTypes:completionHandler:", a2, 0);
}

uint64_t __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeRequestWithVirtualConference:completionHandler:", a2, 0);
}

uint64_t __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeRequestWithInvalidationSuccess:error:completionHandler:", a2 == 0, a2, 0);
}

uint64_t __64__EKVirtualConferenceProvider_beginRequestWithExtensionContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeRequestWithRenewalSuccess:error:completionHandler:", a2 == 0, a2, 0);
}

- (void)isURLValid:(id)a3 withCompletion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)extendExpirationOfURL:(id)a3 toExpirationDate:(id)a4 withCompletion:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)invalidateURL:(id)a3 withCompletionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)fetchAvailableRoomTypesWithCompletionHandler:(void *)completionHandler
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v3 = completionHandler;
  OUTLINED_FUNCTION_3_1();
  v4 = OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  OUTLINED_FUNCTION_0_6(v14);
}

- (void)fetchVirtualConferenceForIdentifier:(EKVirtualConferenceRoomTypeIdentifier)identifier completionHandler:(void *)completionHandler
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v4 = completionHandler;
  OUTLINED_FUNCTION_3_1();
  v5 = OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
  OUTLINED_FUNCTION_0_6(v15);
}

@end
