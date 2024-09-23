@implementation GKAuthenticateHostViewController

+ (id)authenticateExtension
{
  if (authenticateExtension_onceToken != -1)
    dispatch_once(&authenticateExtension_onceToken, &__block_literal_global_42);
  return (id)authenticateExtension_extension;
}

void __57__GKAuthenticateHostViewController_authenticateExtension__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "_gkExtensionWithIdentifier:error:", CFSTR("com.apple.GameCenterUI.GameCenterAuthenticateExtension"), &v11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v11;
  v2 = (void *)authenticateExtension_extension;
  authenticateExtension_extension = v0;

  if (v1)
  {
    if (!*MEMORY[0x1E0D25460])
      v3 = (id)GKOSLoggers();
    v4 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __57__GKAuthenticateHostViewController_authenticateExtension__block_invoke_cold_1((uint64_t)v1, v4, v5, v6, v7, v8, v9, v10);
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKAuthenticateHostViewController;
  -[GKExtensionRemoteViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25268], "willTerminate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationWillTerminate_, v4, 0);

}

+ (BOOL)dismissAutomaticallyAfterExtensionCompletion
{
  return 0;
}

- (void)messageFromExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  id v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3710];
  GKExtensionProtocolSecureCodedClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;

  if (v8)
  {
    if (!*MEMORY[0x1E0D25460])
      v9 = (id)GKOSLoggers();
    v10 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKAuthenticateHostViewController messageFromExtension:].cold.1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageCommandKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  if (v18 == 46)
  {
    -[GKAuthenticateHostViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "onboardingFlowDidSignOut");
  }
  else
  {
    if (v18 != 44)
    {
      v20.receiver = self;
      v20.super_class = (Class)GKAuthenticateHostViewController;
      -[GKExtensionRemoteViewController messageFromExtension:](&v20, sel_messageFromExtension_, v4);
      goto LABEL_12;
    }
    -[GKAuthenticateHostViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRotationLocked:", 0);
  }

LABEL_12:
}

- (void)extensionIsFinishing
{
  void *v3;
  objc_super v4;

  -[GKAuthenticateHostViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  v4.receiver = self;
  v4.super_class = (Class)GKAuthenticateHostViewController;
  -[GKExtensionRemoteViewController extensionIsFinishing](&v4, sel_extensionIsFinishing);
}

- (void)extensionIsCanceling
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAuthenticateHostViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setError:", v3);

  -[GKAuthenticateHostViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  v6.receiver = self;
  v6.super_class = (Class)GKAuthenticateHostViewController;
  -[GKExtensionRemoteViewController extensionIsCanceling](&v6, sel_extensionIsCanceling);
}

- (void)applicationWillTerminate:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("MessageCommandKey");
  v7[0] = &unk_1E5A5E2B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionRemoteViewController sendMessageToExtension:](self, "sendMessageToExtension:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

}

- (GKHostedAuthenticateViewController)delegate
{
  return (GKHostedAuthenticateViewController *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __57__GKAuthenticateHostViewController_authenticateExtension__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "Error loading Game Center authenticate issue extension, %@", a5, a6, a7, a8, 2u);
}

- (void)messageFromExtension:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "error while decoding messageFromExtension arhive in GKAuthenticateHostViewController:%@", a5, a6, a7, a8, 2u);
}

@end
