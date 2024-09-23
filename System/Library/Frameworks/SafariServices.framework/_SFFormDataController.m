@implementation _SFFormDataController

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___SFFormDataController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken_1 != -1)
    dispatch_once(&sharedController_onceToken_1, block);
  return (id)sharedController_sharedInstance;
}

- (_SFFormDataController)initWithAggressiveKeychainCaching:(BOOL)a3
{
  _SFFormDataController *v3;
  _SFAuthenticationContext *v4;
  _SFAuthenticationContext *autoFillAuthenticationContext;
  _SFFormDataController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFFormDataController;
  v3 = -[WBUFormDataController initWithAggressiveKeychainCaching:](&v8, sel_initWithAggressiveKeychainCaching_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(_SFAuthenticationContext);
    autoFillAuthenticationContext = v3->_autoFillAuthenticationContext;
    v3->_autoFillAuthenticationContext = v4;

    -[_SFAuthenticationContext setDelegate:](v3->_autoFillAuthenticationContext, "setDelegate:", v3);
    v6 = v3;
  }

  return v3;
}

- (BOOL)contextRequiresSessionBasedAuthentication:(id)a3
{
  return 0;
}

- (BOOL)contextShouldAllowPasscodeFallback:(id)a3
{
  return 0;
}

- (BOOL)contextShouldAllowMultipleBiometricFailures:(id)a3
{
  return 0;
}

- (double)invalidationTimeoutIfApplicationEntersBackgroundDuringAuthenticationForContext:(id)a3
{
  return 2.22507386e-308;
}

- (id)oneTimeCodeProvider
{
  SFAppAutoFillOneTimeCodeProvider *oneTimeCodeProvider;
  SFAppAutoFillOneTimeCodeProvider *v4;
  SFAppAutoFillOneTimeCodeProvider *v5;
  void *v6;
  void *v7;

  oneTimeCodeProvider = self->_oneTimeCodeProvider;
  if (!oneTimeCodeProvider)
  {
    v4 = (SFAppAutoFillOneTimeCodeProvider *)objc_alloc_init(MEMORY[0x1E0D8A018]);
    v5 = self->_oneTimeCodeProvider;
    self->_oneTimeCodeProvider = v4;

    -[_SFFormDataController autoFillQuirksManager](self, "autoFillQuirksManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "associatedDomainsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppAutoFillOneTimeCodeProvider setAssociatedDomainsManager:](self->_oneTimeCodeProvider, "setAssociatedDomainsManager:", v7);

    oneTimeCodeProvider = self->_oneTimeCodeProvider;
  }
  return oneTimeCodeProvider;
}

- (_SFAuthenticationContext)autoFillAuthenticationContext
{
  return self->_autoFillAuthenticationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFillAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeProvider, 0);
}

@end
