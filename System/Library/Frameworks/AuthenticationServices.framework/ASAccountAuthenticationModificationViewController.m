@implementation ASAccountAuthenticationModificationViewController

- (ASAccountAuthenticationModificationExtensionContext)extensionContext
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASAccountAuthenticationModificationViewController;
  -[ASAccountAuthenticationModificationViewController extensionContext](&v3, sel_extensionContext);
  return (ASAccountAuthenticationModificationExtensionContext *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential userInfo:(NSDictionary *)userInfo
{
  objc_class *v7;
  IMP MethodImplementation;
  objc_class *v9;
  IMP v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;

  v7 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v7, a2);
  v9 = (objc_class *)objc_opt_class();
  v10 = class_getMethodImplementation(v9, a2);
  object_getClassName(self);
  objc_msgSend((id)objc_opt_class(), "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containsString:", CFSTR("."));

  v12 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (MethodImplementation == v10)
  {
    if (v13)
      -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:].cold.1();
  }
  else if (v13)
  {
    -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:].cold.2();
  }
  -[ASAccountAuthenticationModificationViewController extensionContext](self, "extensionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 1000, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cancelRequestWithError:", v15);

}

- (void)prepareInterfaceToConvertAccountToSignInWithAppleForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential userInfo:(NSDictionary *)userInfo
{
  objc_class *v7;
  IMP MethodImplementation;
  objc_class *v9;
  IMP v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;

  v7 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v7, a2);
  v9 = (objc_class *)objc_opt_class();
  v10 = class_getMethodImplementation(v9, a2);
  object_getClassName(self);
  objc_msgSend((id)objc_opt_class(), "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containsString:", CFSTR("."));

  v12 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (MethodImplementation == v10)
  {
    if (v13)
      -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:].cold.1();
  }
  else if (v13)
  {
    -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:].cold.2();
  }
  -[ASAccountAuthenticationModificationViewController extensionContext](self, "extensionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 1000, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cancelRequestWithError:", v15);

}

- (void)changePasswordWithoutUserInteractionForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential newPassword:(NSString *)newPassword userInfo:(NSDictionary *)userInfo
{
  objc_class *v8;
  IMP MethodImplementation;
  objc_class *v10;
  IMP v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;

  v8 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v8, a2);
  v10 = (objc_class *)objc_opt_class();
  v11 = class_getMethodImplementation(v10, a2);
  object_getClassName(self);
  objc_msgSend((id)objc_opt_class(), "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containsString:", CFSTR("."));

  v13 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (MethodImplementation == v11)
  {
    if (v14)
      -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:].cold.1();
  }
  else if (v14)
  {
    -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:].cold.2();
  }
  -[ASAccountAuthenticationModificationViewController extensionContext](self, "extensionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 1000, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cancelRequestWithError:", v16);

}

- (void)prepareInterfaceToChangePasswordForServiceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier existingCredential:(ASPasswordCredential *)existingCredential newPassword:(NSString *)newPassword userInfo:(NSDictionary *)userInfo
{
  objc_class *v8;
  IMP MethodImplementation;
  objc_class *v10;
  IMP v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;

  v8 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v8, a2);
  v10 = (objc_class *)objc_opt_class();
  v11 = class_getMethodImplementation(v10, a2);
  object_getClassName(self);
  objc_msgSend((id)objc_opt_class(), "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containsString:", CFSTR("."));

  v13 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (MethodImplementation == v11)
  {
    if (v14)
      -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:].cold.1();
  }
  else if (v14)
  {
    -[ASAccountAuthenticationModificationViewController convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:].cold.2();
  }
  -[ASAccountAuthenticationModificationViewController extensionContext](self, "extensionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 1000, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cancelRequestWithError:", v16);

}

- (void)cancelRequest
{
  void *v2;
  id v3;

  -[ASAccountAuthenticationModificationViewController extensionContext](self, "extensionContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequestWithError:", v2);

}

- (void)convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_20E4D9000, v0, v1, "Class %{public}s must override %{public}s. Canceling extension request.");
  OUTLINED_FUNCTION_2();
}

- (void)convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:existingCredential:userInfo:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_20E4D9000, v0, v1, "Class %{public}s's implementation of %{public}s should not call super. Canceling extension request.");
  OUTLINED_FUNCTION_2();
}

@end
