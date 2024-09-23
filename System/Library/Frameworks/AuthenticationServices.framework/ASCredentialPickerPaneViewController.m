@implementation ASCredentialPickerPaneViewController

- (ASCredentialPickerPaneViewController)initWithPresentationContext:(id)a3 shouldExpandOtherLoginChoices:(BOOL)a4 activity:(id)a5
{
  id v9;
  id v10;
  id *v11;
  ASCredentialPickerPaneViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  id *p_presentationContext;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 shouldExpandOtherLoginChoices;
  BOOL *p_shouldShowEnableCredentialProviderPrompt;
  BOOL v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  AKASAuthorizationProvider *authKitAuthorizationProvider;
  dispatch_queue_t v40;
  OS_dispatch_queue *alertQueue;
  ASCredentialPickerPaneViewController *v42;
  uint64_t v44;
  id v45;
  id v46;
  objc_super v47;

  v9 = a3;
  v10 = a5;
  v47.receiver = self;
  v47.super_class = (Class)ASCredentialPickerPaneViewController;
  v11 = -[ASCredentialRequestPaneViewController initRequiringTableView:](&v47, sel_initRequiringTableView_, 1);
  v12 = (ASCredentialPickerPaneViewController *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 140, a5);
    objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_isKeychainSyncEnabled = objc_msgSend(v13, "isKeychainSyncEnabled");
    v12->_canKeychainSyncBeEnabled = objc_msgSend(v13, "canKeychainSyncBeEnabled");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v12, sel__keychainSyncStatusMayHaveChanged_, *MEMORY[0x24BE82E90], 0);

    v46 = v10;
    if (objc_msgSend(v9, "isRegistrationRequest")
      && !v12->_isKeychainSyncEnabled
      && !v12->_canKeychainSyncBeEnabled
      && !objc_msgSend(v9, "externalPasskeyLoginChoiceCount"))
    {
      a4 = 1;
    }
    v45 = v9;
    objc_msgSend(v9, "loginChoices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safari_firstObjectPassingTest:", &__block_literal_global_22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_onlyHasOtherAccountsLoginChoices = v16 == 0;

    v17 = v12->_onlyHasOtherAccountsLoginChoices || a4;
    v12->_isUserVerificationConfigured = -[ASCredentialPickerPaneViewController _isUserVerificationConfigured](v12, "_isUserVerificationConfigured");
    v12->_currentlyEnabledBiometryType = objc_msgSend(MEMORY[0x24BE0B290], "biometryType");
    v18 = objc_alloc_init(MEMORY[0x24BDDA938]);
    objc_msgSend(v18, "canEvaluatePolicy:error:", 2, 0);
    v12->_supportedBiometryType = objc_msgSend(v18, "biometryType");
    p_presentationContext = (id *)&v12->_presentationContext;
    objc_storeStrong((id *)&v12->_presentationContext, a3);
    v12->_shouldExpandOtherLoginChoices = v17;
    v12->_currentlySelectedRow = -1;
    v12->_currentlySelectedSection = -1;
    objc_msgSend(MEMORY[0x24BE83018], "sharedFeatureManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_shouldAutoFillFromICloudKeychain = objc_msgSend(v20, "shouldAutoFillPasswordsFromKeychain");

    v21 = -[ASCAuthorizationPresentationContext requestTypes](v12->_presentationContext, "requestTypes");
    v22 = ascCredentialRequestTypesAllPublicKey();
    v23 = ascCredentialRequestTypesAllPasskey() & v21;
    v24 = v12->_shouldAutoFillFromICloudKeychain
       || objc_msgSend(*p_presentationContext, "externalPasskeyLoginChoiceCount") != 0;
    objc_msgSend(MEMORY[0x24BE83030], "sharedManager", 1169);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "extensionsSync");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safari_anyObjectPassingTest:", &__block_literal_global_30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_hasAvailablePasskeyProviders = v27 != 0;

    if (v23 && ((v22 | 0x40) & v21) == v21 && !v24)
    {
      shouldExpandOtherLoginChoices = v12->_shouldExpandOtherLoginChoices;
      p_shouldShowEnableCredentialProviderPrompt = &v12->_shouldShowEnableCredentialProviderPrompt;
      v12->_shouldShowEnableCredentialProviderPrompt = !shouldExpandOtherLoginChoices;
      v30 = !shouldExpandOtherLoginChoices && *((_BYTE *)&v12->super.super.super.super.isa + v44) != 0;
    }
    else
    {
      v30 = 0;
      p_shouldShowEnableCredentialProviderPrompt = &v12->_shouldShowEnableCredentialProviderPrompt;
      v12->_shouldShowEnableCredentialProviderPrompt = 0;
    }
    v9 = v45;
    *p_shouldShowEnableCredentialProviderPrompt = v30;
    objc_msgSend(*p_presentationContext, "loginChoices");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "safari_containsObjectPassingTest:", &__block_literal_global_31_0);

    if (v32)
      *p_shouldShowEnableCredentialProviderPrompt = 0;
    -[ASCredentialPickerPaneViewController _updateCachedLoginChoices](v12, "_updateCachedLoginChoices");
    if ((objc_msgSend(*p_presentationContext, "requestTypes") & 2) != 0)
    {
      v33 = objc_alloc(MEMORY[0x24BE0AE20]);
      -[ASCredentialPickerPaneViewController _serviceName](v12, "_serviceName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_presentationContext, "teamIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_presentationContext, "bundleIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_presentationContext, "appleIDAuthorizationRequest");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v33, "initWithAppName:teamIdentifier:bundleIdentifier:authorizationRequest:", v34, v35, v36, v37);
      authKitAuthorizationProvider = v12->_authKitAuthorizationProvider;
      v12->_authKitAuthorizationProvider = (AKASAuthorizationProvider *)v38;

      -[AKASAuthorizationProvider setPresentationProvider:](v12->_authKitAuthorizationProvider, "setPresentationProvider:", v12);
      v40 = dispatch_queue_create("com.apple.AuthenticationServicesCore.AuthorizationErrorAlertQueue", 0);
      alertQueue = v12->_alertQueue;
      v12->_alertQueue = (OS_dispatch_queue *)v40;

    }
    -[ASCredentialPickerPaneViewController _selectInitialLoginChoice](v12, "_selectInitialLoginChoice");
    v42 = v12;

    v10 = v46;
  }

  return v12;
}

BOOL __107__ASCredentialPickerPaneViewController_initWithPresentationContext_shouldExpandOtherLoginChoices_activity___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)(objc_msgSend(a2, "loginChoiceKind") - 7) < 0xFFFFFFFFFFFFFFFELL;
}

uint64_t __107__ASCredentialPickerPaneViewController_initWithPresentationContext_shouldExpandOtherLoginChoices_activity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE83030];
  v3 = a2;
  objc_msgSend(v2, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "extensionSupportsPasskeys:", v3);

  return v5;
}

uint64_t __107__ASCredentialPickerPaneViewController_initWithPresentationContext_shouldExpandOtherLoginChoices_activity___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "loginChoiceKind") == 2)
  {
    objc_msgSend(v2, "relyingPartyIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("apple.com"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (ASCredentialPickerPaneViewController)initWithPresentationContext:(id)a3 activity:(id)a4
{
  return -[ASCredentialPickerPaneViewController initWithPresentationContext:shouldExpandOtherLoginChoices:activity:](self, "initWithPresentationContext:shouldExpandOtherLoginChoices:activity:", a3, 0, a4);
}

- (void)reloadLoginChoices
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ASCredentialPickerPaneViewController_reloadLoginChoices__block_invoke;
  block[3] = &unk_24C94F558;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

_QWORD *__58__ASCredentialPickerPaneViewController_reloadLoginChoices__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  _QWORD *result;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_updateCachedLoginChoices");
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "sizeToFitPaneContent");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "hasPlatformCredentialRequest"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "paneHeaderStackView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "removeFromSuperview");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "paneFooterStackView", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subviews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "removeFromSuperview");
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 32), "_setUpView");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_localizedInfoString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setText:", v17);

  }
  result = *(_QWORD **)(a1 + 32);
  if (result[136])
    return (_QWORD *)objc_msgSend(result, "_selectPreviouslySelectedLoginChoiceIfPossible:");
  return result;
}

- (void)_selectPreviouslySelectedLoginChoiceIfPossible:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  _BOOL8 v7;
  unint64_t v8;
  NSUInteger v9;
  void *v10;
  id v11;

  v4 = -[NSArray indexOfObject:](self->_tableViewLoginChoices, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    v6 = -[ASCredentialPickerPaneViewController _credentialCount](self, "_credentialCount");
    v7 = v5 >= v6;
    if (v5 < v6)
      v8 = 0;
    else
      v8 = v6;
    v9 = v5 - v8;
    -[ASCredentialRequestPaneViewController tableView](self, "tableView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectRowAtIndexPath:animated:scrollPosition:", v10, 1, 0);
    -[ASCredentialPickerPaneViewController _updateSelectedRow:section:](self, "_updateSelectedRow:section:", v9, v7);

  }
}

- (void)performConditionalRegistrationIfPossible
{
  NSObject *authorizationActivity;
  ASCLoginChoiceProtocol *v4;
  NSObject *v5;
  ASCLoginChoiceProtocol *v6;
  _QWORD v7[4];
  ASCLoginChoiceProtocol *v8;
  _QWORD block[4];
  ASCLoginChoiceProtocol *v10;

  v6 = self->_previouslySelectedLoginChoice;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    authorizationActivity = self->_authorizationActivity;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke;
    block[3] = &unk_24C94F558;
    v10 = v6;
    os_activity_apply(authorizationActivity, block);
    v4 = v10;
LABEL_7:

    goto LABEL_8;
  }
  if (!-[ASCLoginChoiceProtocol isExternal](v6, "isExternal")
    || (-[ASCLoginChoiceProtocol isRegistrationRequest](v6, "isRegistrationRequest") & 1) == 0)
  {
    v5 = self->_authorizationActivity;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_39;
    v7[3] = &unk_24C94F558;
    v8 = v6;
    os_activity_apply(v5, v7);
    v4 = v8;
    goto LABEL_7;
  }
  -[ASCredentialPickerPaneViewController _userTappedContinueButtonForPasskeyLoginChoice:](self, "_userTappedContinueButtonForPasskeyLoginChoice:", v6);
LABEL_8:

}

void __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_cold_1(a1, v2);
}

void __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_39(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_39_cold_1(a1, v2, v3);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCredentialPickerPaneViewController;
  -[ASCredentialRequestPaneViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[ASCredentialPickerPaneViewController _setUpView](self, "_setUpView");
  -[ASCredentialRequestPaneViewController sizeToFitPaneContent](self, "sizeToFitPaneContent");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCredentialPickerPaneViewController;
  -[ASCredentialRequestPaneViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (self->_previouslySelectedLoginChoice)
    -[ASCredentialPickerPaneViewController _configureAuthenticationPaneForSelectedLoginChoice:](self, "_configureAuthenticationPaneForSelectedLoginChoice:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCredentialPickerPaneViewController;
  -[ASCredentialPickerPaneViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (objc_msgSend(MEMORY[0x24BE0B290], "biometryType") == 2)
    -[ASCredentialRequestConfirmButtonSubPane setAuthorizationCapabilityEnabled:](self->_confirmButtonSubPane, "setAuthorizationCapabilityEnabled:", 0);
}

- (void)_setUpView
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;

  -[ASCredentialPickerPaneViewController _dumpConfiguration](self, "_dumpConfiguration");
  -[ASCredentialRequestPaneViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", self);

  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_addSpacerView");

  v5 = self->_isKeychainSyncEnabled
    || -[ASCAuthorizationPresentationContext externalPasskeyLoginChoiceCount](self->_presentationContext, "externalPasskeyLoginChoiceCount") != 0;
  if (-[ASCAuthorizationPresentationContext hasPlatformCredentialRequest](self->_presentationContext, "hasPlatformCredentialRequest")&& (((-[ASCAuthorizationPresentationContext isRegistrationRequest](self->_presentationContext, "isRegistrationRequest") ^ 1 | v5) & 1) != 0|| -[NSArray count](self->_tableViewLoginChoices, "count") <= 1))
  {
    -[ASCredentialPickerPaneViewController _setUpPlatformCredentialRequestPane](self, "_setUpPlatformCredentialRequestPane");
  }
  else
  {
    -[ASCredentialPickerPaneViewController _setUpIconViewIfNecessary](self, "_setUpIconViewIfNecessary");
    -[ASCredentialPickerPaneViewController _setUpInfoLabel](self, "_setUpInfoLabel");
  }
  -[ASCredentialRequestPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_addSpacerView");

  if (!-[ASCAuthorizationPresentationContext isRegistrationRequest](self->_presentationContext, "isRegistrationRequest")|| -[NSArray count](self->_tableViewLoginChoices, "count")|| self->_isKeychainSyncEnabled|| self->_canKeychainSyncBeEnabled|| -[ASCAuthorizationPresentationContext externalPasskeyLoginChoiceCount](self->_presentationContext, "externalPasskeyLoginChoiceCount"))
  {
    -[ASCredentialRequestPaneViewController footerPaneContext](self, "footerPaneContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialPickerPaneViewController _addAuthorizationButtonToPaneContext:](self, "_addAuthorizationButtonToPaneContext:", v7);

  }
  -[ASCredentialPickerPaneViewController _addOtherLoginChoicesButtonIfNeeded](self, "_addOtherLoginChoicesButtonIfNeeded");
  -[ASCredentialPickerPaneViewController _addManuallyEnterPasswordButtonIfNeeded](self, "_addManuallyEnterPasswordButtonIfNeeded");
  -[ASCredentialRequestPaneViewController paneFooterStackView](self, "paneFooterStackView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_addSpacerView");

}

- (void)_setUpPlatformCredentialRequestPane
{
  int v3;
  void *v4;
  char v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  ASCredentialRequestInfoLabelSubPane *v10;
  ASCredentialRequestInfoLabelSubPane *subtitleSubPane;
  void *v12;
  uint64_t v13;
  ASCredentialRequestInfoLabelSubPane *v14;
  void *v15;
  uint64_t v16;

  if (self->_isKeychainSyncEnabled || !self->_canKeychainSyncBeEnabled)
    v3 = 1;
  else
    v3 = -[ASCAuthorizationPresentationContext isRegistrationRequest](self->_presentationContext, "isRegistrationRequest") ^ 1;
  -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safari_containsObjectPassingTest:", &__block_literal_global_46);

  v6 = ((v5 & 1) != 0 || v3) && !self->_shouldShowEnableCredentialProviderPrompt || self->_isUserVerificationConfigured;
  v16 = 2;
  if ((-[ASCAuthorizationPresentationContext requestTypes](self->_presentationContext, "requestTypes") & 4) != 0)
  {
    -[ASCredentialPickerPaneViewController _titleForPlatformPublicKeyCredentialRegistration](self, "_titleForPlatformPublicKeyCredentialRegistration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialPickerPaneViewController _subtitleForPlatformPublicKeyCredentialRegistration](self, "_subtitleForPlatformPublicKeyCredentialRegistration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_14:
      +[ASCredentialRequestIconGenerator headerIconForPresentationContext:outIconStyle:](ASCredentialRequestIconGenerator, "headerIconForPresentationContext:outIconStyle:", self->_presentationContext, &v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else
  {
    -[ASCredentialPickerPaneViewController _titleForPlatformPublicKeyCredentialAssertion](self, "_titleForPlatformPublicKeyCredentialAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialPickerPaneViewController _subtitleForPlatformPublicKeyCredentialAssertion](self, "_subtitleForPlatformPublicKeyCredentialAssertion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (self->_shouldExpandOtherLoginChoices)
      {
        +[ASCredentialRequestIconGenerator passwordManagerIcon](ASCredentialRequestIconGenerator, "passwordManagerIcon");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  v9 = 0;
LABEL_16:
  if (v8)
  {
    v10 = -[ASCredentialRequestInfoLabelSubPane initWithString:labelType:]([ASCredentialRequestInfoLabelSubPane alloc], "initWithString:labelType:", v8, 1);
    subtitleSubPane = self->_subtitleSubPane;
    self->_subtitleSubPane = v10;

  }
  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  v14 = self->_subtitleSubPane;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 16.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addIcon:iconStyle:title:titleStyle:subtitlePane:subtitleStyle:subtitleBottomSpacing:", v9, v13, v7, 2, v14, 3, v15);

}

BOOL __75__ASCredentialPickerPaneViewController__setUpPlatformCredentialRequestPane__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  if (objc_msgSend(v2, "loginChoiceKind") == 2)
  {
    v3 = v2;
    if (objc_msgSend(v3, "isRegistrationRequest"))
    {
      objc_msgSend(v3, "externalCredentialProviderName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 != 0;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setUpIconViewIfNecessary
{
  void *v3;
  void *v4;
  ASCredentialRequestImageSubPane *v5;
  ASCredentialRequestImageSubPane *imageSubPane;
  void *v7;
  id v8;

  -[ASCredentialPickerPaneViewController _iconImage](self, "_iconImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    if (objc_msgSend(MEMORY[0x24BE0B290], "isPad"))
    {
      -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addEmptyViewWithSpacing:", 16.0);

    }
    v5 = -[ASCredentialRequestImageSubPane initWithImage:]([ASCredentialRequestImageSubPane alloc], "initWithImage:", v8);
    imageSubPane = self->_imageSubPane;
    self->_imageSubPane = v5;

    -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubPane:withCustomSpacingAfter:", self->_imageSubPane, 16.0);

    v3 = v8;
  }

}

- (void)_setUpInfoLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ASCredentialRequestInfoLabelSubPane *v8;
  void *v9;
  ASCredentialRequestInfoLabelSubPane *v10;
  ASCredentialRequestInfoLabelSubPane *infoLabelPane;
  id v12;

  if (!self->_imageSubPane)
  {
    v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addArrangedSubview:", v3);

    -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCustomSpacing:afterView:", v3, 24.0);

  }
  v8 = [ASCredentialRequestInfoLabelSubPane alloc];
  -[ASCredentialPickerPaneViewController _localizedInfoString](self, "_localizedInfoString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ASCredentialRequestInfoLabelSubPane initWithString:labelType:](v8, "initWithString:labelType:", v9, 1);
  infoLabelPane = self->_infoLabelPane;
  self->_infoLabelPane = v10;

  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubPane:withCustomSpacingAfter:", self->_infoLabelPane, 24.0);

}

- (void)_addAuthorizationButtonToPaneContext:(id)a3
{
  id v4;
  int v5;
  double v6;
  ASCredentialRequestConfirmButtonSubPane *confirmButtonSubPane;
  void *v8;
  ASCredentialRequestConfirmButtonSubPane *obj;

  v4 = a3;
  obj = -[ASCredentialRequestConfirmButtonSubPane initWithActivity:]([ASCredentialRequestConfirmButtonSubPane alloc], "initWithActivity:", self->_authorizationActivity);
  v5 = -[ASCAuthorizationPresentationContext isCombinedPublicKeyCredentialRegistrationRequest](self->_presentationContext, "isCombinedPublicKeyCredentialRegistrationRequest");
  v6 = 3.40282347e38;
  if (v5)
    v6 = 8.0;
  objc_msgSend(v4, "addSubPane:withCustomSpacingAfter:", obj, v6);

  -[ASCredentialRequestConfirmButtonSubPane setDelegate:](obj, "setDelegate:", self);
  objc_storeStrong((id *)&self->_confirmButtonSubPane, obj);
  if (self->_shouldShowEnableCredentialProviderPrompt && self->_isKeychainSyncEnabled)
  {
    confirmButtonSubPane = self->_confirmButtonSubPane;
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestConfirmButtonSubPane showContinueButtonWithTitle:](confirmButtonSubPane, "showContinueButtonWithTitle:", v8);

  }
}

- (void)_addOtherLoginChoicesButtonIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[NSArray count](self->_otherLoginChoices, "count"))
  {
    if (-[NSArray count](self->_otherLoginChoices, "count") == 1)
    {
      -[NSArray firstObject](self->_otherLoginChoices, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "loginChoiceKind");

      if ((unint64_t)(v4 - 5) < 2)
      {
        _WBSLocalizedString();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = sel__useOtherAccountsButtonTapped;
      }
      else if (v4 == 4)
      {
        -[ASCAuthorizationPresentationContext isRegistrationRequest](self->_presentationContext, "isRegistrationRequest");
        _WBSLocalizedString();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = sel__useCABLEButtonTapped;
      }
      else
      {
        if (v4 != 3)
          goto LABEL_11;
        _WBSLocalizedString();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = sel__useSecurityKeyButtonTapped;
      }
      +[ASCredentialRequestSecondaryButton buttonWithTitle:target:action:](ASCredentialRequestSecondaryButton, "buttonWithTitle:target:action:", v5, self, v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
LABEL_12:
        LODWORD(v7) = 1148846080;
        objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 1, v7);
        -[ASCredentialRequestPaneViewController paneFooterStackView](self, "paneFooterStackView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addArrangedSubview:", v11);

        -[ASCredentialRequestPaneViewController paneFooterStackView](self, "paneFooterStackView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialPickerPaneViewController _secondaryButtonBottomMargin](self, "_secondaryButtonBottomMargin");
        objc_msgSend(v10, "setCustomSpacing:afterView:", v11);

        return;
      }
    }
LABEL_11:
    -[ASCAuthorizationPresentationContext isRegistrationRequest](self->_presentationContext, "isRegistrationRequest");
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCredentialRequestSecondaryButton buttonWithTitle:target:action:](ASCredentialRequestSecondaryButton, "buttonWithTitle:target:action:", v8, self, sel__otherLoginChoicesButtonTapped);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
}

- (void)_addManuallyEnterPasswordButtonIfNeeded
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  if (-[ASCAuthorizationPresentationContext isProxiedRequest](self->_presentationContext, "isProxiedRequest"))
  {
    if ((-[ASCAuthorizationPresentationContext requestTypes](self->_presentationContext, "requestTypes") & 1) != 0)
    {
      _WBSLocalizedString();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASCredentialRequestSecondaryButton buttonWithTitle:target:action:](ASCredentialRequestSecondaryButton, "buttonWithTitle:target:action:", v3, self, sel__manuallyEnterPasswordButtonTapped);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      LODWORD(v4) = 1148846080;
      objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v4);
      -[ASCredentialRequestPaneViewController paneFooterStackView](self, "paneFooterStackView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addArrangedSubview:", v7);

      -[ASCredentialRequestPaneViewController paneFooterStackView](self, "paneFooterStackView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialPickerPaneViewController _secondaryButtonBottomMargin](self, "_secondaryButtonBottomMargin");
      objc_msgSend(v6, "setCustomSpacing:afterView:", v7);

    }
  }
}

- (double)_secondaryButtonBottomMargin
{
  int v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x24BE0B290], "isPad");
  result = 12.0;
  if (v2)
    return 0.0;
  return result;
}

- (void)_otherLoginChoicesButtonTapped
{
  id v3;

  -[ASCredentialRequestConfirmButtonSubPane disableBiometricView](self->_confirmButtonSubPane, "disableBiometricView");
  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestPaneViewControllerPresentExpandedLoginChoiceInterface:", self);

}

- (void)_useSecurityKeyButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_80);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v7)
  {
    objc_msgSend(v4, "requestPaneViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:", self, v7, 0, &__block_literal_global_85);
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_81);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE0B1C8], 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestPaneViewController:dismissWithCredential:error:", self, 0, v6);

  }
}

BOOL __67__ASCredentialPickerPaneViewController__useSecurityKeyButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loginChoiceKind") == 3;
}

void __67__ASCredentialPickerPaneViewController__useSecurityKeyButtonTapped__block_invoke_2()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __67__ASCredentialPickerPaneViewController__useSecurityKeyButtonTapped__block_invoke_2_cold_1();
}

- (void)_useCABLEButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_86);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v7)
  {
    objc_msgSend(v4, "requestPaneViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:", self, v7, 0, &__block_literal_global_89);
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_87);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE0B1C8], 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestPaneViewController:dismissWithCredential:error:", self, 0, v6);

  }
}

BOOL __61__ASCredentialPickerPaneViewController__useCABLEButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loginChoiceKind") == 4;
}

void __61__ASCredentialPickerPaneViewController__useCABLEButtonTapped__block_invoke_2()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __61__ASCredentialPickerPaneViewController__useCABLEButtonTapped__block_invoke_2_cold_1();
}

- (void)_useOtherAccountsButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  ASCredentialPickerPaneViewController *v15;
  id v16;

  -[NSArray firstObject](self->_otherLoginChoices, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1550];
  objc_msgSend(v3, "providerExtensionBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionWithIdentifier:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BE82C98]);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __69__ASCredentialPickerPaneViewController__useOtherAccountsButtonTapped__block_invoke;
  v14 = &unk_24C951088;
  v15 = self;
  v16 = v6;
  v8 = v6;
  v9 = (void *)MEMORY[0x212BBEFEC](&v11);
  -[ASCAuthorizationPresentationContext appIdentifier](self->_presentationContext, "appIdentifier", v11, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getPasskeyAssertionRequestParametersForApplicationIdentifier:completionHandler:", v10, v9);

}

uint64_t __69__ASCredentialPickerPaneViewController__useOtherAccountsButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _ASCredentialListViewController *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = [_ASCredentialListViewController alloc];
  v5 = -[_ASCredentialListViewController initWithExtension:serviceIdentifiers:requestParameters:](v4, "initWithExtension:serviceIdentifiers:requestParameters:", *(_QWORD *)(a1 + 40), MEMORY[0x24BDBD1A8], v3);

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1144);
  *(_QWORD *)(v6 + 1144) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setDelegate:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setDismissOnBackground:", 1);
}

- (void)_manuallyEnterPasswordButtonTapped
{
  id v3;

  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestPaneViewControllerPresentManualPasswordEntryInterface:", self);

}

- (void)_selectInitialLoginChoice
{
  ASCLoginChoiceProtocol *v3;
  ASCLoginChoiceProtocol *previouslySelectedLoginChoice;
  void *v5;
  ASCredentialRequestConfirmButtonSubPane *confirmButtonSubPane;
  id v7;

  if (-[NSArray count](self->_tableViewLoginChoices, "count"))
  {
    if (-[ASCredentialPickerPaneViewController _shouldShowLoginChoicesInTableView](self, "_shouldShowLoginChoicesInTableView"))
    {
      -[ASCredentialPickerPaneViewController _updateSelectedRow:section:](self, "_updateSelectedRow:section:", 0, 0);
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_tableViewLoginChoices, "objectAtIndexedSubscript:", 0);
      v3 = (ASCLoginChoiceProtocol *)objc_claimAutoreleasedReturnValue();
      previouslySelectedLoginChoice = self->_previouslySelectedLoginChoice;
      self->_previouslySelectedLoginChoice = v3;

      -[ASCredentialRequestPaneViewController tableView](self, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setUserInteractionEnabled:", 0);

      -[ASCredentialPickerPaneViewController _configureAuthenticationPaneForSelectedLoginChoice:](self, "_configureAuthenticationPaneForSelectedLoginChoice:", self->_previouslySelectedLoginChoice);
    }
  }
  else if (!self->_shouldShowEnableCredentialProviderPrompt)
  {
    confirmButtonSubPane = self->_confirmButtonSubPane;
    _WBSLocalizedString();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestConfirmButtonSubPane showContinueButtonWithTitle:](confirmButtonSubPane, "showContinueButtonWithTitle:", v7);

  }
}

- (id)_localizedInfoString
{
  void *v3;
  uint64_t v4;
  ASCAuthorizationPresentationContext *presentationContext;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  if (-[NSArray count](self->_tableViewLoginChoices, "count") == 1)
  {
    -[NSArray firstObject](self->_tableViewLoginChoices, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "loginChoiceKind");

    switch(v4)
    {
      case 0:
        -[ASCredentialPickerPaneViewController _infoLabelStringForSignInWithApple](self, "_infoLabelStringForSignInWithApple");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 1:
        -[ASCredentialPickerPaneViewController _infoLabelStringForPassword](self, "_infoLabelStringForPassword");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 3:
        -[ASCredentialPickerPaneViewController _infoLabelStringForSecurityKeyCredentialAssertion](self, "_infoLabelStringForSecurityKeyCredentialAssertion");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 5:
      case 6:
        -[ASCAuthorizationPresentationContext isCABLEAuthenticatorRequest](self->_presentationContext, "isCABLEAuthenticatorRequest");
        goto LABEL_11;
      default:
        break;
    }
  }
  presentationContext = self->_presentationContext;
  if (!self->_onlyHasOtherAccountsLoginChoices)
  {
    -[ASCAuthorizationPresentationContext proxiedOriginDeviceName](presentationContext, "proxiedOriginDeviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAuthorizationPresentationContext proxiedOriginDeviceName](self->_presentationContext, "proxiedOriginDeviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
      return v11;
    }
    -[ASCAuthorizationPresentationContext localAccountLoginChoices](self->_presentationContext, "localAccountLoginChoices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "count");
    -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v13 == v15)
    {
      v16 = -[ASCAuthorizationPresentationContext serviceType](self->_presentationContext, "serviceType");
      if (v16 == 1)
      {
        v17 = (void *)MEMORY[0x24BDD17C8];
        goto LABEL_22;
      }
      if (!v16)
      {
        v17 = (void *)MEMORY[0x24BDD17C8];
LABEL_22:
        _WBSLocalizedString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringWithFormat:", v8, v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      }
    }
    v18 = -[ASCAuthorizationPresentationContext serviceType](self->_presentationContext, "serviceType");
    if (v18 == 1)
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
    }
    else
    {
      if (v18)
        return v11;
      v17 = (void *)MEMORY[0x24BDD17C8];
    }
    goto LABEL_22;
  }
  -[ASCAuthorizationPresentationContext isCABLEAuthenticatorRequest](presentationContext, "isCABLEAuthenticatorRequest");
LABEL_11:
  _WBSLocalizedString();
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v11 = (void *)v12;
  return v11;
}

- (id)_serviceName
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *authorizationActivity;
  _QWORD v11[4];
  id v12;
  id v13;

  -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDC1558];
    -[ASCAuthorizationPresentationContext appIdentifier](self->_presentationContext, "appIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v6, "bundleRecordWithApplicationIdentifier:error:", v7, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v13;
    objc_msgSend(v8, "localizedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      authorizationActivity = self->_authorizationActivity;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __52__ASCredentialPickerPaneViewController__serviceName__block_invoke;
      v11[3] = &unk_24C94F558;
      v5 = v5;
      v12 = v5;
      os_activity_apply(authorizationActivity, v11);

    }
  }

  return v4;
}

void __52__ASCredentialPickerPaneViewController__serviceName__block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __52__ASCredentialPickerPaneViewController__serviceName__block_invoke_cold_1(a1, v2);
}

- (id)_defaultPasskeySignInTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_122);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
    goto LABEL_2;
  if (!self->_isUserVerificationConfigured)
  {
    v7 = 0;
    goto LABEL_4;
  }
  if (!self->_currentlyEnabledBiometryType)
  {
LABEL_2:
    v6 = v3;
  }
  else
  {
    _WBSLocalizedString();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_4:

  return v7;
}

BOOL __66__ASCredentialPickerPaneViewController__defaultPasskeySignInTitle__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "externalCredentialProviderBundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_titleForPlatformPublicKeyCredentialRegistration
{
  void *v3;
  int v4;
  void *v5;
  int v7;
  char v8;
  int64_t currentlyEnabledBiometryType;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;

  if (!self->_isUserVerificationConfigured
    && self->_shouldAutoFillFromICloudKeychain
    && !-[ASCAuthorizationPresentationContext externalPasskeyLoginChoiceCount](self->_presentationContext, "externalPasskeyLoginChoiceCount"))
  {
    return 0;
  }
  -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_containsObjectPassingTest:", &__block_literal_global_127_0);

  if ((v4 & 1) != 0)
  {
    if (self->_shouldShowEnableCredentialProviderPrompt)
      goto LABEL_7;
    goto LABEL_15;
  }
  if (self->_isKeychainSyncEnabled)
    goto LABEL_32;
  if (self->_canKeychainSyncBeEnabled)
  {
    -[ASCAuthorizationPresentationContext shouldUseFallbackPasskeyUI](self->_presentationContext, "shouldUseFallbackPasskeyUI");
    goto LABEL_7;
  }
  if (-[NSArray count](self->_tableViewLoginChoices, "count"))
  {
LABEL_32:
    if (self->_shouldShowEnableCredentialProviderPrompt)
      goto LABEL_7;
    if (self->_isUserVerificationConfigured)
    {
LABEL_15:
      if (!self->_isKeychainSyncEnabled)
      {
        v7 = self->_canKeychainSyncBeEnabled ? 1 : v4;
        if (v7 != 1)
          return 0;
      }
      v8 = -[ASCAuthorizationPresentationContext shouldUseFallbackPasskeyUI](self->_presentationContext, "shouldUseFallbackPasskeyUI");
      currentlyEnabledBiometryType = self->_currentlyEnabledBiometryType;
      if ((v8 & 1) != 0)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        return v14;
      }
      if (-[ASCAuthorizationPresentationContext externalPasskeyLoginChoiceCount](self->_presentationContext, "externalPasskeyLoginChoiceCount"))
      {
        v11 = 1;
      }
      else
      {
        v11 = currentlyEnabledBiometryType == 0;
      }
      if (!v11)
      {
        -[ASCredentialPickerPaneViewController _defaultPasskeySignInTitle](self, "_defaultPasskeySignInTitle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
LABEL_7:
      _WBSLocalizedString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
  }
  return 0;
}

BOOL __88__ASCredentialPickerPaneViewController__titleForPlatformPublicKeyCredentialRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  if (objc_msgSend(v2, "loginChoiceKind") == 2)
  {
    v3 = v2;
    if (objc_msgSend(v3, "isRegistrationRequest"))
    {
      objc_msgSend(v3, "externalCredentialProviderName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 != 0;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_subtitleForPlatformPublicKeyCredentialRegistration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 canKeychainSyncBeEnabled;
  void *v8;
  _BOOL4 v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_firstObjectPassingTest:", &__block_literal_global_142);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_2;
  if (self->_isKeychainSyncEnabled)
  {
    canKeychainSyncBeEnabled = 0;
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  canKeychainSyncBeEnabled = self->_canKeychainSyncBeEnabled;
  if (self->_canKeychainSyncBeEnabled)
    goto LABEL_9;
  v9 = -[NSArray count](self->_tableViewLoginChoices, "count") == 0;
LABEL_10:
  if (self->_shouldAutoFillFromICloudKeychain && !self->_isUserVerificationConfigured)
    goto LABEL_22;
  if (canKeychainSyncBeEnabled)
  {
    objc_msgSend(MEMORY[0x24BE82CC8], "isAppleAccountBrandingEnabled");
LABEL_22:
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (v9)
    goto LABEL_22;
LABEL_2:
  if (self->_shouldShowEnableCredentialProviderPrompt)
    goto LABEL_22;
  if ((-[ASCAuthorizationPresentationContext shouldUseFallbackPasskeyUI](self->_presentationContext, "shouldUseFallbackPasskeyUI") & 1) == 0)
  {
    v10 = -[NSArray count](self->_tableViewLoginChoices, "count");
    v11 = (void *)MEMORY[0x24BDD17C8];
    if (v10 < 2)
    {
      if (v6)
      {
        _WBSLocalizedString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "userVisibleName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "externalCredentialProviderName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", v12, v14, v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
        goto LABEL_23;
      }
      _WBSLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userVisibleName");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _WBSLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v13;
    objc_msgSend(v11, "stringWithFormat:", v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v8 = 0;
LABEL_23:

  return v8;
}

BOOL __91__ASCredentialPickerPaneViewController__subtitleForPlatformPublicKeyCredentialRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  if (objc_msgSend(v2, "loginChoiceKind") == 2)
  {
    v3 = v2;
    if (objc_msgSend(v3, "isRegistrationRequest"))
    {
      objc_msgSend(v3, "externalCredentialProviderName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 != 0;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_titleForPlatformPublicKeyCredentialAssertion
{
  void *v3;

  if (self->_isUserVerificationConfigured
    || !self->_shouldAutoFillFromICloudKeychain
    || (v3 = (void *)-[ASCAuthorizationPresentationContext externalPasskeyLoginChoiceCount](self->_presentationContext, "externalPasskeyLoginChoiceCount")) != 0)
  {
    if (self->_shouldShowEnableCredentialProviderPrompt)
    {
      _WBSLocalizedString();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (self->_shouldExpandOtherLoginChoices)
    {
      v3 = 0;
    }
    else
    {
      -[ASCredentialPickerPaneViewController _defaultPasskeySignInTitle](self, "_defaultPasskeySignInTitle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)_subtitleForPlatformPublicKeyCredentialAssertion
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  ASCAuthorizationPresentationContext *presentationContext;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  ASCAuthorizationPresentationContext *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;

  if (!-[ASCAuthorizationPresentationContext externalPasskeyLoginChoiceCount](self->_presentationContext, "externalPasskeyLoginChoiceCount")&& self->_shouldAutoFillFromICloudKeychain&& !self->_isUserVerificationConfigured)
  {
    goto LABEL_14;
  }
  -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("apple.com"));

  if (v4)
  {
    -[NSArray safari_firstObjectPassingTest:](self->_tableViewLoginChoices, "safari_firstObjectPassingTest:", &__block_literal_global_166);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(MEMORY[0x24BE82CC8], "isAppleAccountBrandingEnabled");
      v7 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

      goto LABEL_36;
    }
  }
  if (!self->_shouldShowEnableCredentialProviderPrompt)
  {
    if (self->_shouldExpandOtherLoginChoices)
    {
      v8 = -[ASCAuthorizationPresentationContext serviceType](self->_presentationContext, "serviceType");
      if (v8 == 1)
      {
        v9 = (void *)MEMORY[0x24BDD17C8];
        goto LABEL_21;
      }
      if (!v8)
      {
        v9 = (void *)MEMORY[0x24BDD17C8];
LABEL_21:
        _WBSLocalizedString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringWithFormat:", v16, v17);
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
    }
    v13 = -[NSArray count](self->_tableViewLoginChoices, "count");
    presentationContext = self->_presentationContext;
    if (v13 != 1)
    {
      -[ASCAuthorizationPresentationContext destinationSiteForCrossSiteAssertion](presentationContext, "destinationSiteForCrossSiteAssertion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v6, "length");
      v20 = self->_presentationContext;
      if (v19)
      {
        -[ASCAuthorizationPresentationContext loginChoices](v20, "loginChoices");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "isSharedCredential");
        v22 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", v11, v6, v27);
      }
      else
      {
        -[ASCAuthorizationPresentationContext proxiedOriginDeviceName](v20, "proxiedOriginDeviceName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          v12 = 0;
LABEL_36:

          return v12;
        }
        v26 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCAuthorizationPresentationContext proxiedOriginDeviceName](self->_presentationContext, "proxiedOriginDeviceName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", v10, v11, v27);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    if (-[ASCAuthorizationPresentationContext shouldUseFallbackPasskeyUI](presentationContext, "shouldUseFallbackPasskeyUI"))
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_22:
      v12 = (void *)v18;

      return v12;
    }
    -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASCAuthorizationPresentationContext destinationSiteForCrossSiteAssertion](self->_presentationContext, "destinationSiteForCrossSiteAssertion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v6, "isSharedCredential");
      v24 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userVisibleName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v11, v10, v27, v31);
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ASCAuthorizationPresentationContext proxiedOriginDeviceName](self->_presentationContext, "proxiedOriginDeviceName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "length");

      objc_msgSend(v6, "isSharedCredential");
      v30 = (void *)MEMORY[0x24BDD17C8];
      if (v29)
      {
        _WBSLocalizedString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCAuthorizationPresentationContext proxiedOriginDeviceName](self->_presentationContext, "proxiedOriginDeviceName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "userVisibleName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringWithFormat:", v11, v27, v31, v33);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
LABEL_34:

        goto LABEL_35;
      }
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userVisibleName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringWithFormat:", v11, v27, v31);
      v32 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v32;
    goto LABEL_33;
  }
LABEL_14:
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  return v12;
}

uint64_t __88__ASCredentialPickerPaneViewController__subtitleForPlatformPublicKeyCredentialAssertion__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_infoLabelStringForSecurityKeyCredentialAssertion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_infoLabelStringForPassword
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASCAuthorizationPresentationContext proxiedOriginDeviceName](self->_presentationContext, "proxiedOriginDeviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v5, "isSharedCredential"))
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAuthorizationPresentationContext proxiedOriginDeviceName](self->_presentationContext, "proxiedOriginDeviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v8, v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_21:
      v2 = (void *)v12;

      goto LABEL_22;
    }
    v13 = -[ASCAuthorizationPresentationContext serviceType](self->_presentationContext, "serviceType");
    if (v13 == 1)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_15;
    }
    if (!v13)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
LABEL_15:
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAuthorizationPresentationContext proxiedOriginDeviceName](self->_presentationContext, "proxiedOriginDeviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v8, v9, v10);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v2 = (void *)v19;
LABEL_22:

      goto LABEL_23;
    }
  }
  if (objc_msgSend(v5, "isSharedCredential"))
  {
    v15 = -[ASCAuthorizationPresentationContext serviceType](self->_presentationContext, "serviceType");
    if (v15 == 1)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_20;
    }
    if (!v15)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
LABEL_20:
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "username");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v8, v9, v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
  }
  v17 = -[ASCAuthorizationPresentationContext serviceType](self->_presentationContext, "serviceType");
  if (v17 == 1)
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    goto LABEL_17;
  }
  if (!v17)
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
LABEL_17:
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialPickerPaneViewController _serviceName](self, "_serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "username");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v8, v9, v10);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_23:

  return v2;
}

- (id)_infoLabelStringForSignInWithApple
{
  void *v2;
  void *v3;

  -[AKASAuthorizationProvider loginRowData](self->_authKitAuthorizationProvider, "loginRowData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loginRowPaneTitleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_titleOfAlertForFailedBiometryAttemptWhenPasscodeFallbackIsNotAllowed
{
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_messageOfAlertForFailedBiometryAttemptWhenPasscodeFallbackIsNotAllowed
{
  return (id)_WBSLocalizedString();
}

- (void)_configureAuthenticationPaneForSelectedLoginChoice:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  ASCredentialRequestConfirmButtonSubPane *confirmButtonSubPane;
  void *v19;
  id v20;

  v20 = a3;
  v4 = objc_msgSend(v20, "loginChoiceKind");
  if (v4 == 2)
  {
    v7 = v20;
    objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "externalCredentialProviderBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enabledExtensionWithContainingAppBundleID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "extensionSupportsPasskeys:", v10);

    if (-[ASCAuthorizationPresentationContext hasPlatformCredentialRequest](self->_presentationContext, "hasPlatformCredentialRequest")&& !self->_isUserVerificationConfigured&& (_WBSLocalizedString(), v14 = objc_claimAutoreleasedReturnValue(), (v13 = (void *)v14) != 0)|| ((-[ASCAuthorizationPresentationContext isRegistrationRequest](self->_presentationContext, "isRegistrationRequest") ^ 1 | v12) & 1) == 0&& (!self->_isKeychainSyncEnabled || self->_shouldShowEnableCredentialProviderPrompt)&& (_WBSLocalizedString(), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[ASCredentialRequestConfirmButtonSubPane showContinueButtonWithTitle:](self->_confirmButtonSubPane, "showContinueButtonWithTitle:", v13);

    }
    -[ASCAuthorizationPresentationContext platformUserVerificationPreference](self->_presentationContext, "platformUserVerificationPreference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("required")) & 1) != 0)
      v16 = 1;
    else
      v16 = objc_msgSend(MEMORY[0x24BE0B290], "shouldRequireLocalAuthenticationForPlatformCredentials");

    objc_msgSend(v7, "externalCredentialProviderName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17 && (v16 & 1) != 0)
      goto LABEL_28;
LABEL_29:
    -[ASCredentialRequestConfirmButtonSubPane showContinueButton](self->_confirmButtonSubPane, "showContinueButton");
    goto LABEL_30;
  }
  if (v4 == 1)
  {
    if (objc_msgSend(v20, "isExternal"))
    {
      -[ASCredentialRequestConfirmButtonSubPane showContinueButton](self->_confirmButtonSubPane, "showContinueButton");
      goto LABEL_31;
    }
    v7 = 0;
    if (objc_msgSend(MEMORY[0x24BE0B290], "shouldRequireLocalAuthenticationForPasswords"))
      goto LABEL_28;
    goto LABEL_29;
  }
  if (v4)
  {
    v7 = 0;
    goto LABEL_29;
  }
  -[AKASAuthorizationProvider loginRowData](self->_authKitAuthorizationProvider, "loginRowData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "loginRowAuthenticationType");

  if (v6 != 3)
  {
    v7 = 0;
LABEL_28:
    confirmButtonSubPane = self->_confirmButtonSubPane;
    -[ASCredentialRequestPaneViewController footerPaneContext](self, "footerPaneContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestConfirmButtonSubPane setUpButtonInPaneContext:](confirmButtonSubPane, "setUpButtonInPaneContext:", v19);

    -[ASCredentialRequestConfirmButtonSubPane setAuthorizationCapabilityEnabled:](self->_confirmButtonSubPane, "setAuthorizationCapabilityEnabled:", 1);
LABEL_30:

    goto LABEL_31;
  }
  -[ASCredentialRequestConfirmButtonSubPane showContinueWithPasswordButton](self->_confirmButtonSubPane, "showContinueWithPasswordButton");
LABEL_31:

}

- (void)_setCancelButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[UIViewController as_navigationItem](self, "as_navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_performAuthorizationWithAuthenticatedContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ASCLoginChoiceProtocol *v9;
  ASCPasswordCredential *externalPasswordCredentialForSelectedLoginChoice;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  AKASAuthorizationProvider *authKitAuthorizationProvider;
  ASCLoginChoiceProtocol *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  if (-[ASCAuthorizationPresentationContext isRegistrationRequest](self->_presentationContext, "isRegistrationRequest"))
  {
    -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_firstObjectPassingTest:", &__block_literal_global_227);
    v9 = (ASCLoginChoiceProtocol *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = self->_previouslySelectedLoginChoice;
  }
  if (!-[ASCLoginChoiceProtocol loginChoiceKind](v9, "loginChoiceKind"))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_2;
    v21[3] = &unk_24C951150;
    v22 = v7;
    v13 = (void *)MEMORY[0x212BBEFEC](v21);
    v14 = objc_opt_respondsToSelector();
    authKitAuthorizationProvider = self->_authKitAuthorizationProvider;
    if ((v14 & 1) != 0)
    {
      v16 = v9;
      -[ASCLoginChoiceProtocol underlyingAppleIDLoginChoice](v16, "underlyingAppleIDLoginChoice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKASAuthorizationProvider performAuthorizationWithLoginChoice:completionHandler:](authKitAuthorizationProvider, "performAuthorizationWithLoginChoice:completionHandler:", v17, v13);

    }
    else
    {
      -[AKASAuthorizationProvider performAuthorizationWithCompletionHandler:](authKitAuthorizationProvider, "performAuthorizationWithCompletionHandler:", v13);
    }

    v12 = v22;
    goto LABEL_14;
  }
  if (-[ASCLoginChoiceProtocol loginChoiceKind](v9, "loginChoiceKind") != 1
    || !-[ASCLoginChoiceProtocol isExternal](v9, "isExternal"))
  {
    -[ASCredentialRequestPaneViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_232;
    v19[3] = &unk_24C951198;
    v19[4] = self;
    v20 = v7;
    objc_msgSend(v11, "requestPaneViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:", self, v9, v6, v19);

    v12 = v20;
LABEL_14:

    goto LABEL_15;
  }
  externalPasswordCredentialForSelectedLoginChoice = self->_externalPasswordCredentialForSelectedLoginChoice;
  if (externalPasswordCredentialForSelectedLoginChoice)
  {
    (*((void (**)(id, ASCPasswordCredential *, _QWORD))v7 + 2))(v7, externalPasswordCredentialForSelectedLoginChoice, 0);
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_231);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE0B1C8], 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v18);

  }
LABEL_15:

}

uint64_t __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "loginChoiceKind") == 2)
    v3 = objc_msgSend(v2, "isRegistrationRequest");
  else
    v3 = 0;

  return v3;
}

void __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B200]), "initWithAuthorization:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_3()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_3_cold_1();
}

void __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_232(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD block[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_2_233;
    block[3] = &unk_24C94F7E0;
    block[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_2_233(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPaneViewController:dismissWithCredential:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)_shouldShowLoginChoicesInTableView
{
  BOOL v2;
  NSArray *tableViewLoginChoices;
  void *v4;
  _QWORD v6[5];

  if (self->_shouldExpandOtherLoginChoices)
    return 1;
  tableViewLoginChoices = self->_tableViewLoginChoices;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__ASCredentialPickerPaneViewController__shouldShowLoginChoicesInTableView__block_invoke;
  v6[3] = &unk_24C9511C0;
  v6[4] = self;
  -[NSArray safari_filterObjectsUsingBlock:](tableViewLoginChoices, "safari_filterObjectsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (unint64_t)objc_msgSend(v4, "count") > 1;

  return v2;
}

BOOL __74__ASCredentialPickerPaneViewController__shouldShowLoginChoicesInTableView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "loginChoiceKind") == 2 && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1171))
  {
    objc_msgSend(v3, "externalCredentialProviderName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_updateCachedLoginChoices
{
  uint64_t v3;
  void *v4;
  ASCAuthorizationPresentationContext *presentationContext;
  void *v6;
  NSArray *v7;
  NSArray *tableViewLoginChoices;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *otherLoginChoices;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];

  v3 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __65__ASCredentialPickerPaneViewController__updateCachedLoginChoices__block_invoke;
  v20[3] = &unk_24C9511C0;
  v20[4] = self;
  v4 = (void *)MEMORY[0x212BBEFEC](v20, a2);
  presentationContext = self->_presentationContext;
  if (self->_shouldExpandOtherLoginChoices)
  {
    -[ASCAuthorizationPresentationContext loginChoices](presentationContext, "loginChoices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v4);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    tableViewLoginChoices = self->_tableViewLoginChoices;
    self->_tableViewLoginChoices = v7;

    if (!self->_isKeychainSyncEnabled && !self->_canKeychainSyncBeEnabled)
    {
      v9 = self->_tableViewLoginChoices;
      v19[0] = v3;
      v19[1] = 3221225472;
      v19[2] = __65__ASCredentialPickerPaneViewController__updateCachedLoginChoices__block_invoke_2;
      v19[3] = &unk_24C9511C0;
      v19[4] = self;
      -[NSArray safari_filterObjectsUsingBlock:](v9, "safari_filterObjectsUsingBlock:", v19);
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v11 = self->_tableViewLoginChoices;
      self->_tableViewLoginChoices = v10;

    }
    otherLoginChoices = self->_otherLoginChoices;
    self->_otherLoginChoices = 0;
  }
  else
  {
    v17 = 0;
    v18 = 0;
    -[ASCAuthorizationPresentationContext _getPrimaryLoginChoices:otherLoginChoices:](presentationContext, "_getPrimaryLoginChoices:otherLoginChoices:", &v18, &v17);
    otherLoginChoices = (NSArray *)v18;
    v13 = (NSArray *)v17;
    -[NSArray safari_filterObjectsUsingBlock:](otherLoginChoices, "safari_filterObjectsUsingBlock:", v4);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v15 = self->_tableViewLoginChoices;
    self->_tableViewLoginChoices = v14;

    v16 = self->_otherLoginChoices;
    self->_otherLoginChoices = v13;

  }
}

BOOL __65__ASCredentialPickerPaneViewController__updateCachedLoginChoices__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 1;
    goto LABEL_7;
  }
  v4 = v3;
  objc_msgSend(v4, "externalCredentialProviderName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "relyingPartyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("apple.com"));

    if ((v7 & 1) == 0)
    {
      if (objc_msgSend(v4, "isRegistrationRequest")
        && (v10 = *(_QWORD *)(a1 + 32), !*(_BYTE *)(v10 + 1169))
        && objc_msgSend(*(id *)(v10 + 1048), "externalPasskeyLoginChoiceCount")
        || (v11 = *(_QWORD *)(a1 + 32), *(_BYTE *)(v11 + 1208))
        || *(_BYTE *)(v11 + 1096) && *(_BYTE *)(v11 + 1169) && !*(_BYTE *)(v11 + 1210))
      {
        v8 = 0;
        goto LABEL_5;
      }
      if (objc_msgSend(*(id *)(v11 + 1048), "externalPasskeyLoginChoiceCount"))
      {
        v8 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1171) != 0;
        goto LABEL_5;
      }
    }
  }
  v8 = 1;
LABEL_5:

LABEL_7:
  return v8;
}

BOOL __65__ASCredentialPickerPaneViewController__updateCachedLoginChoices__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "loginChoiceKind") == 2
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "isRegistrationRequest"))
  {
    objc_msgSend(v3, "externalCredentialProviderName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)_iconImage
{
  if (-[ASCAuthorizationPresentationContext isCABLEAuthenticatorRequest](self->_presentationContext, "isCABLEAuthenticatorRequest"))+[ASCredentialRequestIconGenerator passwordManagerIcon](ASCredentialRequestIconGenerator, "passwordManagerIcon");
  else
    +[ASCredentialRequestIconGenerator headerIconForPresentationContext:](ASCredentialRequestIconGenerator, "headerIconForPresentationContext:", self->_presentationContext);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_userSelectedExternalPasswordCredential
{
  void *v3;
  void *v4;
  ASPasswordCredentialIdentity *v5;
  void *v6;
  ASPasswordCredentialIdentity *v7;
  _ASCredentialAuthenticationViewController *v8;
  _ASCredentialAuthenticationViewController *credentialProviderViewController;
  id v10;

  -[ASCLoginChoiceProtocol providerBundleIdentifier](self->_previouslySelectedLoginChoice, "providerBundleIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enabledExtensionWithContainingAppBundleID:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [ASPasswordCredentialIdentity alloc];
    -[ASCLoginChoiceProtocol externalCredentialIdentity](self->_previouslySelectedLoginChoice, "externalCredentialIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ASPasswordCredentialIdentity initWithFoundationCredentialIdentity:](v5, "initWithFoundationCredentialIdentity:", v6);

    v8 = -[_ASCredentialAuthenticationViewController initWithExtension:credentialIdentity:]([_ASCredentialAuthenticationViewController alloc], "initWithExtension:credentialIdentity:", v4, v7);
    credentialProviderViewController = self->_credentialProviderViewController;
    self->_credentialProviderViewController = v8;

    -[_ASCredentialAuthenticationViewController setDelegate:](self->_credentialProviderViewController, "setDelegate:", self);
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_234);
  }

}

void __79__ASCredentialPickerPaneViewController__userSelectedExternalPasswordCredential__block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __79__ASCredentialPickerPaneViewController__userSelectedExternalPasswordCredential__block_invoke_cold_1();
}

- (unint64_t)_credentialCount
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_tableViewLoginChoices;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        if ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "loginChoiceKind", (_QWORD)v9) < 5)
          ++v5;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3
{
  -[ASCredentialPickerPaneViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, 0);
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  ASCLoginChoiceProtocol *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _ASCredentialAuthenticationViewController *credentialProviderViewController;
  ASCPasswordCredential *externalPasswordCredentialForSelectedLoginChoice;
  NSObject *authorizationActivity;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  ASCLoginChoiceProtocol *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD block[4];
  id v45;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[_ASCredentialAuthenticationViewController dismissViewControllerAnimated:completion:](self->_credentialProviderViewController, "dismissViewControllerAnimated:completion:", 1, v12);
    credentialProviderViewController = self->_credentialProviderViewController;
    self->_credentialProviderViewController = 0;

    externalPasswordCredentialForSelectedLoginChoice = self->_externalPasswordCredentialForSelectedLoginChoice;
    self->_externalPasswordCredentialForSelectedLoginChoice = 0;

    if (-[ASCAuthorizationPresentationContext isConditionalRegistrationRequest](self->_presentationContext, "isConditionalRegistrationRequest"))
    {
      authorizationActivity = self->_authorizationActivity;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke;
      block[3] = &unk_24C94F558;
      v45 = v11;
      os_activity_apply(authorizationActivity, block);
      -[ASCredentialRequestPaneViewController delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE0B1C8], 2, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "requestPaneViewController:dismissWithCredential:error:", self, 0, v30);

      v31 = v45;
    }
    else
    {
      -[ASCredentialPickerPaneViewController _configureAuthenticationPaneForSelectedLoginChoice:](self, "_configureAuthenticationPaneForSelectedLoginChoice:", self->_previouslySelectedLoginChoice);
      v32 = objc_msgSend(v11, "safari_matchesErrorDomain:andCode:", CFSTR("ASExtensionErrorDomain"), 1);
      v33 = self->_authorizationActivity;
      if (v32)
      {
        os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_238_0);
        goto LABEL_14;
      }
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_239;
      v42[3] = &unk_24C94F558;
      v43 = v11;
      os_activity_apply(v33, v42);
      v31 = v43;
    }

    goto LABEL_14;
  }
  v37 = v11;
  v14 = objc_alloc_init(MEMORY[0x24BE82DE0]);
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_241;
  v40[3] = &unk_24C94FE10;
  v36 = v12;
  v41 = v12;
  v35 = v14;
  objc_msgSend(v14, "setHandler:", v40);
  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v39 = objc_claimAutoreleasedReturnValue();
  v15 = self->_previouslySelectedLoginChoice;
  -[ASCLoginChoiceProtocol site](v15, "site");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x24BE0B228]);
  objc_msgSend(v10, "user");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v10;
  objc_msgSend(v10, "password");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v15;
  -[ASCLoginChoiceProtocol externalCredentialIdentity](v15, "externalCredentialIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "owningExtensionState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "providerBundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v17, "initWithUser:password:site:creationDate:externalProviderBundleIdentifier:", v18, v19, v16, v20, v23);

  if (v13)
  {
    v25 = (void *)v39;
LABEL_8:
    objc_msgSend(v25, "requestPaneViewController:dismissWithCredential:error:", self, v24, 0);
    goto LABEL_9;
  }
  v25 = (void *)v39;
  if ((objc_msgSend(MEMORY[0x24BE0B290], "shouldRequireLocalAuthenticationForPasswords") & 1) == 0)
    goto LABEL_8;
  objc_storeStrong((id *)&self->_externalPasswordCredentialForSelectedLoginChoice, v24);
  -[ASCredentialRequestConfirmButtonSubPane showAuthenticationMechanismForExternalPasswordCredential](self->_confirmButtonSubPane, "showAuthenticationMechanismForExternalPasswordCredential");
LABEL_9:
  v11 = v37;
  v10 = v38;
  v12 = v36;

LABEL_14:
}

void __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "safari_privacyPreservingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_DEFAULT, "Credential provider rejected conditional registration request: %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

void __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_237()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E4D9000, v0, OS_LOG_TYPE_DEFAULT, "Did not receive any external password credential because user canceled", v1, 2u);
  }
}

void __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_239(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_239_cold_1(a1, v2);
}

uint64_t __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_241(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  _ASCredentialAuthenticationViewController *credentialProviderViewController;
  id v10;
  id v11;
  _ASCredentialAuthenticationViewController *v12;
  id v13;

  credentialProviderViewController = self->_credentialProviderViewController;
  v10 = a6;
  v11 = a5;
  v13 = a4;
  -[_ASCredentialAuthenticationViewController dismissViewControllerAnimated:completion:](credentialProviderViewController, "dismissViewControllerAnimated:completion:", 1, v10);
  v12 = self->_credentialProviderViewController;
  self->_credentialProviderViewController = 0;

  -[ASCredentialPickerPaneViewController _completePasskeyAssertionWithCredential:error:completion:](self, "_completePasskeyAssertionWithCredential:error:completion:", v13, v11, v10);
}

- (void)_completePasskeyAssertionWithCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  ASCredentialPickerPaneViewController *v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (v9 || (v24 = 0, v11 = objc_msgSend(v8, "_validateWithError:", &v24), v9 = v24, (v11 & 1) != 0))
  {
    if (!v8)
    {
      v19 = 0;
      goto LABEL_10;
    }
    v12 = objc_alloc(MEMORY[0x24BE0B238]);
    objc_msgSend(v8, "relyingParty");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "authenticatorData");
    v23 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "signature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "credentialID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coreExtensions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = 1;
    v19 = (void *)objc_msgSend(v12, "initWithRelyingPartyIdentifier:authenticatorData:signature:userHandle:rawClientDataJSON:credentialID:extensions:attachment:isExternal:", v13, v14, v15, v16, 0, v17, v18, *MEMORY[0x24BE0B1D8], v22);

    self = v23;
  }
  else
  {
    v20 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ASCredentialPickerPaneViewController _completePasskeyAssertionWithCredential:error:completion:].cold.1();
    v19 = 0;
    v13 = v8;
    v8 = 0;
  }

LABEL_10:
  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "requestPaneViewController:dismissWithCredential:error:", self, v19, v9);

  if (v10)
    v10[2](v10);

}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyRegistrationCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  _ASCredentialAuthenticationViewController *credentialProviderViewController;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD))a6;
  -[_ASCredentialAuthenticationViewController dismissViewControllerAnimated:completion:](self->_credentialProviderViewController, "dismissViewControllerAnimated:completion:", 1, v11);
  credentialProviderViewController = self->_credentialProviderViewController;
  self->_credentialProviderViewController = 0;

  if (v10 || (v24 = 0, v13 = objc_msgSend(v9, "_validateWithError:", &v24), v10 = v24, (v13 & 1) != 0))
  {
    if (!v9)
    {
      v20 = 0;
      goto LABEL_10;
    }
    v14 = objc_alloc(MEMORY[0x24BE0B248]);
    objc_msgSend(v9, "relyingParty");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attestationObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "credentialID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASPasskeyRegistrationCredential _defaultTransports](ASPasskeyRegistrationCredential, "_defaultTransports");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coreExtensions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = 1;
    v20 = (void *)objc_msgSend(v14, "initWithRelyingPartyIdentifier:attestationObject:rawClientDataJSON:credentialID:transports:extensions:attachment:isExternal:", v15, v16, 0, v17, v18, v19, *MEMORY[0x24BE0B1D8], v23);

  }
  else
  {
    v21 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ASCredentialPickerPaneViewController _completePasskeyAssertionWithCredential:error:completion:].cold.1();
    v20 = 0;
    v15 = v9;
    v9 = 0;
  }

LABEL_10:
  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "requestPaneViewController:dismissWithCredential:error:", self, v20, v10);

  if (v11)
    v11[2](v11);

}

- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5
{
  ASCLoginChoiceProtocol *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  ASCLoginChoiceProtocol *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _ASCredentialListViewController *credentialListViewController;
  void *v24;
  id v25;
  id v26;

  v26 = a4;
  v7 = self->_previouslySelectedLoginChoice;
  if (v26)
  {
    v8 = (objc_class *)MEMORY[0x24BE0B228];
    v9 = a5;
    v25 = [v8 alloc];
    objc_msgSend(v26, "user");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "password");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLoginChoiceProtocol externalCredentialIdentity](v7, "externalCredentialIdentity");
    v13 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "owningExtensionState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "providerBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v25, "initWithUser:password:site:creationDate:externalProviderBundleIdentifier:", v24, v10, v11, v12, v16);

    v7 = v13;
    v18 = 0;
  }
  else
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BE0B1C8];
    v21 = a5;
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 2, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
  }
  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "requestPaneViewController:dismissWithCredential:error:", self, v17, v18);

  credentialListViewController = self->_credentialListViewController;
  self->_credentialListViewController = 0;

  (*((void (**)(id))a5 + 2))(a5);
}

- (void)credentialListViewControllerDidPrepareInterface:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __88__ASCredentialPickerPaneViewController_credentialListViewControllerDidPrepareInterface___block_invoke;
  v6[3] = &unk_24C94F5F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __88__ASCredentialPickerPaneViewController_credentialListViewControllerDidPrepareInterface___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5
{
  void (**v7)(_QWORD);
  _ASCredentialListViewController *credentialListViewController;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = (void (**)(_QWORD))a5;
  credentialListViewController = self->_credentialListViewController;
  self->_credentialListViewController = 0;

  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[ASCredentialPickerPaneViewController _completePasskeyAssertionWithCredential:error:completion:](self, "_completePasskeyAssertionWithCredential:error:completion:", v11, 0, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE0B1C8], 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestPaneViewController:dismissWithCredential:error:", self, 0, v10);

    v7[2](v7);
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (!-[ASCredentialPickerPaneViewController _shouldShowLoginChoicesInTableView](self, "_shouldShowLoginChoicesInTableView", a3))return 0;
  if (!-[NSArray safari_containsObjectPassingTest:](self->_tableViewLoginChoices, "safari_containsObjectPassingTest:", &__block_literal_global_247))return 1;
  if (self->_onlyHasOtherAccountsLoginChoices)
    return 1;
  return 2;
}

uint64_t __68__ASCredentialPickerPaneViewController_numberOfSectionsInTableView___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;

  if (-[ASCredentialPickerPaneViewController _isOtherAccountsSection:](self, "_isOtherAccountsSection:", a4)
    && !self->_onlyHasOtherAccountsLoginChoices)
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  if (!-[ASCredentialPickerPaneViewController _isOtherAccountsSection:](self, "_isOtherAccountsSection:", a4))
    return -[ASCredentialPickerPaneViewController numberOfTableRows](self, "numberOfTableRows");
  -[NSArray safari_filterObjectsUsingBlock:](self->_tableViewLoginChoices, "safari_filterObjectsUsingBlock:", &__block_literal_global_252);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

uint64_t __72__ASCredentialPickerPaneViewController_tableView_numberOfRowsInSection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  v7 = objc_msgSend(v5, "section");

  return -[ASCredentialPickerPaneViewController _cellForRow:section:](self, "_cellForRow:section:", v6, v7);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v4;
  double v5;
  double v6;

  if (!-[ASCredentialPickerPaneViewController _isOtherAccountsSection:](self, "_isOtherAccountsSection:", objc_msgSend(a4, "section", a3)))return *MEMORY[0x24BEBE770];
  +[ASViewServiceInterfaceUtilities tableViewRowHeight](ASViewServiceInterfaceUtilities, "tableViewRowHeight");
  v5 = v4;
  +[ASViewServiceInterfaceUtilities otherAccountsCellSizeFactor](ASViewServiceInterfaceUtilities, "otherAccountsCellSizeFactor");
  return v5 * v6;
}

- (BOOL)_isOtherAccountsSection:(int64_t)a3
{
  return !self->_onlyHasOtherAccountsLoginChoices == a3;
}

- (int64_t)numberOfTableRows
{
  void *v3;
  int64_t v4;

  if (self->_onlyHasOtherAccountsLoginChoices)
  {
    -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    return v4;
  }
  else if (-[ASCredentialPickerPaneViewController _shouldShowLoginChoicesInTableView](self, "_shouldShowLoginChoicesInTableView"))
  {
    return -[ASCredentialPickerPaneViewController _credentialCount](self, "_credentialCount");
  }
  else
  {
    return 0;
  }
}

- (id)_cellForRow:(int64_t)a3 section:(int64_t)a4
{
  void *v7;
  void *v8;
  ASCredentialRequestLoginChoiceCell *v9;
  _BOOL8 v10;

  if (a4)
  {
    -[ASCAuthorizationPresentationContext otherAccountsLoginChoices](self->_presentationContext, "otherAccountsLoginChoices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_tableViewLoginChoices, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = -[ASCredentialRequestLoginChoiceCell initWithLoginChoice:presentationContext:authorizationProvider:]([ASCredentialRequestLoginChoiceCell alloc], "initWithLoginChoice:presentationContext:authorizationProvider:", v8, self->_presentationContext, self->_authKitAuthorizationProvider);
  v10 = self->_currentlySelectedRow == a3 && self->_currentlySelectedSection == a4
     || -[NSArray count](self->_tableViewLoginChoices, "count") == 1;
  -[ASCredentialRequestLoginChoiceCell setIsSelectedLoginChoice:](v9, "setIsSelectedLoginChoice:", v10);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  v7 = objc_msgSend(v5, "section");

  -[ASCredentialPickerPaneViewController _updateSelectedRow:section:](self, "_updateSelectedRow:section:", v6, v7);
}

- (void)_updateSelectedRow:(int64_t)a3 section:(int64_t)a4
{
  _ASCredentialAuthenticationViewController *credentialProviderViewController;
  ASCPasswordCredential *externalPasswordCredentialForSelectedLoginChoice;
  int64_t v9;
  int64_t currentlySelectedRow;
  int64_t currentlySelectedSection;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;

  if (*(_OWORD *)&self->_currentlySelectedRow != __PAIR128__(a4, a3))
  {
    credentialProviderViewController = self->_credentialProviderViewController;
    self->_credentialProviderViewController = 0;

    externalPasswordCredentialForSelectedLoginChoice = self->_externalPasswordCredentialForSelectedLoginChoice;
    self->_externalPasswordCredentialForSelectedLoginChoice = 0;

    v9 = a3;
    if (a4 == 1)
      v9 = -[ASCredentialPickerPaneViewController _credentialCount](self, "_credentialCount", a3) + a3;
    -[NSArray objectAtIndexedSubscript:](self->_tableViewLoginChoices, "objectAtIndexedSubscript:", v9);
    obj = (id)objc_claimAutoreleasedReturnValue();
    -[ASCredentialPickerPaneViewController _configureAuthenticationPaneForSelectedLoginChoice:](self, "_configureAuthenticationPaneForSelectedLoginChoice:", obj);
    currentlySelectedRow = self->_currentlySelectedRow;
    currentlySelectedSection = self->_currentlySelectedSection;
    self->_currentlySelectedRow = a3;
    self->_currentlySelectedSection = a4;
    objc_storeStrong((id *)&self->_previouslySelectedLoginChoice, obj);
    if ((-[ASCredentialPickerPaneViewController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)
    {
      if ((currentlySelectedRow & 0x8000000000000000) == 0 && (currentlySelectedSection & 0x8000000000000000) == 0)
      {
        -[ASCredentialRequestPaneViewController tableView](self, "tableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", currentlySelectedRow, currentlySelectedSection);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForRowAtIndexPath:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setIsSelectedLoginChoice:", 0);
      }
      if (((a4 | a3) & 0x8000000000000000) == 0)
      {
        -[ASCredentialRequestPaneViewController tableView](self, "tableView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cellForRowAtIndexPath:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setIsSelectedLoginChoice:", 1);
      }
    }

  }
}

- (void)confirmButtonSubPaneDidEnterProcessingState:(id)a3 withAuthenticatedContext:(id)a4
{
  id v6;
  id v7;
  ASCredentialRequestConfirmButtonSubPane *confirmButtonSubPane;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (self->_previouslySelectedLoginChoice)
  {
    -[ASCredentialPickerPaneViewController _setCancelButtonEnabled:](self, "_setCancelButtonEnabled:", 0);
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke;
    v10[3] = &unk_24C951268;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    -[ASCredentialPickerPaneViewController _performAuthorizationWithAuthenticatedContext:completionHandler:](self, "_performAuthorizationWithAuthenticatedContext:completionHandler:", v7, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v6, "invalidateProcessingState");
    confirmButtonSubPane = self->_confirmButtonSubPane;
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestConfirmButtonSubPane biometricAuthenticationFailureWithAlertString:](confirmButtonSubPane, "biometricAuthenticationFailureWithAlertString:", v9);

  }
}

void __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD block[5];
  _QWORD v17[5];
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v9 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_2;
      v17[3] = &unk_24C94F7E0;
      v17[4] = WeakRetained;
      v18 = v5;
      v19 = v6;
      objc_msgSend(v9, "finishProcessingWithCompletionHandler:", v17);

      v10 = v18;
LABEL_7:

      goto LABEL_8;
    }
    if (!objc_msgSend(WeakRetained, "_errorIsPINRequiredError:", v6))
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_4;
      v11[3] = &unk_24C950738;
      v12 = *(id *)(a1 + 32);
      v13 = v8;
      v14 = 0;
      v15 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], v11);

      v10 = v12;
      goto LABEL_7;
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_3;
    block[3] = &unk_24C94F558;
    block[4] = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
LABEL_8:

}

void __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPaneViewController:dismissWithCredential:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPaneViewControllerRequiresPINEntryInterface:", *(_QWORD *)(a1 + 32));

}

void __109__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidEnterProcessingState_withAuthenticatedContext___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "invalidateProcessingState");
  objc_msgSend(*(id *)(a1 + 40), "_setCancelButtonEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPaneViewController:dismissWithCredential:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (BOOL)_errorIsPINRequiredError:(id)a3
{
  return objc_msgSend(a3, "safari_matchesErrorDomain:andCode:", *MEMORY[0x24BE0B1C8], 3);
}

- (void)confirmButtonSubPaneDidFailBiometry:(id)a3 allowingPasscodeFallback:(BOOL)a4
{
  _QWORD block[5];

  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_257);
  if (!a4)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_258;
    block[3] = &unk_24C94F558;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E4D9000, v0, OS_LOG_TYPE_INFO, "Biometric authentication in ASAuthorizationController credential picker failed.", v1, 2u);
  }
}

void __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_258(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];

  v2 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_2;
  v20[3] = &unk_24C94F558;
  v20[4] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x212BBEFEC](v20);
  v4 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(*(id *)(a1 + 32), "_titleOfAlertForFailedBiometryAttemptWhenPasscodeFallbackIsNotAllowed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_messageOfAlertForFailedBiometryAttemptWhenPasscodeFallbackIsNotAllowed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBD3A8];
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  v18[1] = 3221225472;
  v18[2] = __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_3;
  v18[3] = &unk_24C9512B0;
  v10 = v3;
  v19 = v10;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  v12 = (void *)MEMORY[0x24BEBD3A8];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v16[1] = 3221225472;
  v16[2] = __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_4;
  v16[3] = &unk_24C9512B0;
  v17 = v10;
  v14 = v10;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v15);
  objc_msgSend(v7, "setPreferredAction:", v15);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v7, 1, 0);

}

void __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE0B1C8];
  v7 = *MEMORY[0x24BDD0FD8];
  v8[0] = CFSTR("Stolen Device Protection is enabled and biometry is required.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestPaneViewController:dismissWithCredential:error:", *(_QWORD *)(a1 + 32), 0, v5);

}

uint64_t __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__ASCredentialPickerPaneViewController_confirmButtonSubPaneDidFailBiometry_allowingPasscodeFallback___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/en-us/HT212510"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:options:completionHandler:", v3, MEMORY[0x24BDBD1B8], 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performPasswordAuthentication:(id)a3
{
  _QWORD v4[5];

  if (-[ASCLoginChoiceProtocol loginChoiceKind](self->_previouslySelectedLoginChoice, "loginChoiceKind", a3))
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_269);
  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_270;
    v4[3] = &unk_24C950B50;
    v4[4] = self;
    -[ASCredentialPickerPaneViewController _performAuthorizationWithAuthenticatedContext:completionHandler:](self, "_performAuthorizationWithAuthenticatedContext:completionHandler:", 0, v4);
  }
}

void __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_cold_1();
}

void __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_2;
  block[3] = &unk_24C94F7E0;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_2(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "ak_isUserCancelError") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestPaneViewController:dismissWithCredential:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
}

- (void)performAuthorization:(id)a3 withAuthenticatedLAContext:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke;
  v4[3] = &unk_24C950B50;
  v4[4] = self;
  -[ASCredentialPickerPaneViewController _performAuthorizationWithAuthenticatedContext:completionHandler:](self, "_performAuthorizationWithAuthenticatedContext:completionHandler:", a4, v4);
}

void __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_errorIsPINRequiredError:", v6))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke_2;
    block[3] = &unk_24C94F558;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke_3;
    v7[3] = &unk_24C94F7E0;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
}

void __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPaneViewControllerRequiresPINEntryInterface:", *(_QWORD *)(a1 + 32));

}

void __88__ASCredentialPickerPaneViewController_performAuthorization_withAuthenticatedLAContext___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPaneViewController:dismissWithCredential:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)validateReadyForAuthorization:(id)a3
{
  return self->_previouslySelectedLoginChoice != 0;
}

- (void)userTappedContinueButton
{
  ASCLoginChoiceProtocol *v3;
  ASCLoginChoiceProtocol *previouslySelectedLoginChoice;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (self->_shouldShowEnableCredentialProviderPrompt
    && ((v3 = self->_previouslySelectedLoginChoice) == 0
     || -[ASCLoginChoiceProtocol loginChoiceKind](v3, "loginChoiceKind") == 2))
  {
    +[ASSettingsHelper openCredentialProviderAppSettingsWithCompletionHandler:](ASSettingsHelper, "openCredentialProviderAppSettingsWithCompletionHandler:", &__block_literal_global_273);
    -[ASCredentialPickerPaneViewController _dismiss](self, "_dismiss");
  }
  else
  {
    previouslySelectedLoginChoice = self->_previouslySelectedLoginChoice;
    if (previouslySelectedLoginChoice)
    {
      switch(-[ASCLoginChoiceProtocol loginChoiceKind](previouslySelectedLoginChoice, "loginChoiceKind"))
      {
        case 1:
          -[ASCredentialPickerPaneViewController _userTappedContinueButtonForPasswordLoginChoice:](self, "_userTappedContinueButtonForPasswordLoginChoice:", self->_previouslySelectedLoginChoice);
          break;
        case 2:
          -[ASCredentialPickerPaneViewController _userTappedContinueButtonForPasskeyLoginChoice:](self, "_userTappedContinueButtonForPasskeyLoginChoice:", self->_previouslySelectedLoginChoice);
          break;
        case 3:
          -[ASCredentialPickerPaneViewController _userTappendContinueButtonForSecurityKeyLoginChoice:](self, "_userTappendContinueButtonForSecurityKeyLoginChoice:", self->_previouslySelectedLoginChoice);
          break;
        case 4:
          -[ASCredentialPickerPaneViewController _userTappedContinueButtonForCABLELoginChoice:](self, "_userTappedContinueButtonForCABLELoginChoice:", self->_previouslySelectedLoginChoice);
          break;
        case 5:
          -[ASCredentialPickerPaneViewController _userTappedContinueButtonForICloudKeychainLoginChoice](self, "_userTappedContinueButtonForICloudKeychainLoginChoice");
          break;
        case 6:
          -[ASCredentialPickerPaneViewController _userTappedContinueButtonForCredentialProviderExtensionLoginChoice:](self, "_userTappedContinueButtonForCredentialProviderExtensionLoginChoice:", self->_previouslySelectedLoginChoice);
          break;
        default:
          return;
      }
    }
    else
    {
      -[ASCredentialRequestPaneViewController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = *MEMORY[0x24BE0B1C8];
      v10 = *MEMORY[0x24BDD0FD8];
      v11[0] = CFSTR("Passkeys require iCloud Keychain, which has been restricted by a configuration profile.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 1, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestPaneViewController:dismissWithCredential:error:", self, 0, v9);

    }
  }
}

void __64__ASCredentialPickerPaneViewController_userTappedContinueButton__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __64__ASCredentialPickerPaneViewController_userTappedContinueButton__block_invoke_cold_1(v3);

}

- (void)_userTappedContinueButtonForPasskeyLoginChoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  int v18;
  ASPasskeyRegistrationCredentialExtensionInput *v19;
  void *v20;
  void *v21;
  ASPasskeyRegistrationCredentialExtensionInput *v22;
  ASPasskeyCredentialRequest *v23;
  _ASCredentialAuthenticationViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  ASPasskeyAssertionCredentialExtensionInput *v33;
  void *v34;
  void *v35;
  _ASCredentialAuthenticationViewController *credentialProviderViewController;
  void *v37;
  void *v38;
  void *v39;
  uint64_t *v40;
  uint64_t *v41;
  void *v42;
  ASCredentialPickerPaneViewController *v43;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "externalCredentialProviderBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if ((objc_msgSend(v4, "isRegistrationRequest") & 1) == 0)
      goto LABEL_23;
    goto LABEL_16;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getEnabledExtensionsSynchronously");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v8)
  {
    v9 = v8;
    v43 = self;
    v5 = 0;
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v4, "externalCredentialProviderBundleID", v43);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sf_bundleIdentifierForContainingApp");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if (v15)
        {
          v16 = v12;

          v5 = v16;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v9);

    if (v5)
    {
      if ((objc_msgSend(v4, "isRegistrationRequest") & 1) == 0)
      {
        self = v43;
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "extensionSupportsPasskeys:", v5);

      self = v43;
      if (v18)
      {
        v19 = [ASPasskeyRegistrationCredentialExtensionInput alloc];
        -[ASCAuthorizationPresentationContext passkeyCreationOptionsForExternalProvider](v43->_presentationContext, "passkeyCreationOptionsForExternalProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "extensions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[ASPasskeyRegistrationCredentialExtensionInput initWithCoreExtensions:](v19, "initWithCoreExtensions:", v21);

        v23 = -[ASPasskeyCredentialRequest initWithLoginChoice:registrationExtensionInput:]([ASPasskeyCredentialRequest alloc], "initWithLoginChoice:registrationExtensionInput:", v4, v22);
        v24 = -[_ASCredentialAuthenticationViewController initWithExtension:passkeyRegistrationRequest:forConditionalRegistration:]([_ASCredentialAuthenticationViewController alloc], "initWithExtension:passkeyRegistrationRequest:forConditionalRegistration:", v5, v23, -[ASCAuthorizationPresentationContext isConditionalRegistrationRequest](v43->_presentationContext, "isConditionalRegistrationRequest"));
LABEL_27:
        credentialProviderViewController = self->_credentialProviderViewController;
        self->_credentialProviderViewController = v24;

        -[_ASCredentialAuthenticationViewController setDelegate:](self->_credentialProviderViewController, "setDelegate:", self);
LABEL_31:

        goto LABEL_35;
      }
LABEL_16:
      if (!self->_isUserVerificationConfigured)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=PASSCODE"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *MEMORY[0x24BE38310];
        v52 = MEMORY[0x24BDBD1C8];
        v39 = (void *)MEMORY[0x24BDBCE70];
        v40 = &v52;
        v41 = &v51;
        goto LABEL_34;
      }
      if (!self->_isKeychainSyncEnabled)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = *MEMORY[0x24BE38310];
        v55[0] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "openSensitiveURL:withOptions:", v25, v27);

        -[ASCredentialPickerPaneViewController _dismiss](self, "_dismiss");
LABEL_35:

        goto LABEL_36;
      }
LABEL_23:
      objc_msgSend(v4, "externalCredentialProviderName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29 && v5)
      {
        objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "extensionSupportsPasskeys:", v5);

        if (v32)
        {
          v33 = [ASPasskeyAssertionCredentialExtensionInput alloc];
          -[ASCAuthorizationPresentationContext passkeyAssertionOptionsForExternalProvider](self->_presentationContext, "passkeyAssertionOptionsForExternalProvider");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "extensions");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[ASPasskeyAssertionCredentialExtensionInput initWithCoreExtensions:](v33, "initWithCoreExtensions:", v35);

          v23 = -[ASPasskeyCredentialRequest initWithLoginChoice:assertionExtensionInput:]([ASPasskeyCredentialRequest alloc], "initWithLoginChoice:assertionExtensionInput:", v4, v22);
          v24 = -[_ASCredentialAuthenticationViewController initWithExtension:passkeyAssertionRequest:]([_ASCredentialAuthenticationViewController alloc], "initWithExtension:passkeyAssertionRequest:", v5, v23);
          goto LABEL_27;
        }
      }
      else
      {

      }
      if (self->_isUserVerificationConfigured)
      {
        -[ASCredentialRequestPaneViewController delegate](self, "delegate");
        v22 = (ASPasskeyRegistrationCredentialExtensionInput *)objc_claimAutoreleasedReturnValue();
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __87__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasskeyLoginChoice___block_invoke;
        v44[3] = &unk_24C950B50;
        v44[4] = self;
        -[ASPasskeyRegistrationCredentialExtensionInput requestPaneViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:](v22, "requestPaneViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:", self, v4, 0, v44);
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=PASSCODE"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = *MEMORY[0x24BE38310];
      v50 = MEMORY[0x24BDBD1C8];
      v39 = (void *)MEMORY[0x24BDBCE70];
      v40 = &v50;
      v41 = &v49;
LABEL_34:
      objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", v40, v41, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "openSensitiveURL:withOptions:", v37, v42);

      goto LABEL_35;
    }
  }
  else
  {

  }
  v28 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[ASCredentialPickerPaneViewController _userTappedContinueButtonForPasskeyLoginChoice:].cold.1(v28);
LABEL_36:

}

void __87__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasskeyLoginChoice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasskeyLoginChoice___block_invoke_2;
  block[3] = &unk_24C94F7E0;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __87__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasskeyLoginChoice___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPaneViewController:dismissWithCredential:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_userTappedContinueButtonForPasswordLoginChoice:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  if (objc_msgSend(v4, "isExternal"))
  {
    -[ASCredentialPickerPaneViewController _userSelectedExternalPasswordCredential](self, "_userSelectedExternalPasswordCredential");
  }
  else
  {
    -[ASCredentialRequestPaneViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __88__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasswordLoginChoice___block_invoke;
    v6[3] = &unk_24C950B50;
    v6[4] = self;
    objc_msgSend(v5, "requestPaneViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:", self, v4, 0, v6);

  }
}

void __88__ASCredentialPickerPaneViewController__userTappedContinueButtonForPasswordLoginChoice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestPaneViewController:dismissWithCredential:error:", *(_QWORD *)(a1 + 32), v7, v6);

}

- (void)_userTappendContinueButtonForSecurityKeyLoginChoice:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = objc_msgSend(a3, "credentialKind");
  if (v4 >= 2)
  {
    if (v4 == 2)
      v5 = &__block_literal_global_280;
    else
      v5 = 0;
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __92__ASCredentialPickerPaneViewController__userTappendContinueButtonForSecurityKeyLoginChoice___block_invoke_2;
    v7[3] = &unk_24C950B50;
    v7[4] = self;
    v5 = (void *)MEMORY[0x212BBEFEC](v7);
  }
  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestPaneViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:", self, self->_previouslySelectedLoginChoice, 0, v5);

}

void __92__ASCredentialPickerPaneViewController__userTappendContinueButtonForSecurityKeyLoginChoice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__ASCredentialPickerPaneViewController__userTappendContinueButtonForSecurityKeyLoginChoice___block_invoke_3;
  block[3] = &unk_24C94F7E0;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __92__ASCredentialPickerPaneViewController__userTappendContinueButtonForSecurityKeyLoginChoice___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPaneViewController:dismissWithCredential:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_userTappedContinueButtonForCABLELoginChoice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestPaneViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:", self, v4, 0, &__block_literal_global_281);

}

- (void)_userTappedContinueButtonForCredentialProviderExtensionLoginChoice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  ASCredentialPickerPaneViewController *v15;
  id v16;

  v4 = (void *)MEMORY[0x24BDD1550];
  objc_msgSend(a3, "providerExtensionBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionWithIdentifier:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BE82C98]);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __107__ASCredentialPickerPaneViewController__userTappedContinueButtonForCredentialProviderExtensionLoginChoice___block_invoke;
  v14 = &unk_24C951088;
  v15 = self;
  v8 = v6;
  v16 = v8;
  v9 = (void *)MEMORY[0x212BBEFEC](&v11);
  if (-[ASCAuthorizationPresentationContext isCABLEAuthenticatorRequest](self->_presentationContext, "isCABLEAuthenticatorRequest", v11, v12, v13, v14, v15))
  {
    objc_msgSend(v7, "getPasskeyAssertionRequestParametersForCABLEWithCompletionHandler:", v9);
  }
  else
  {
    -[ASCAuthorizationPresentationContext appIdentifier](self->_presentationContext, "appIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getPasskeyAssertionRequestParametersForApplicationIdentifier:completionHandler:", v10, v9);

  }
}

uint64_t __107__ASCredentialPickerPaneViewController__userTappedContinueButtonForCredentialProviderExtensionLoginChoice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _ASCredentialListViewController *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = [_ASCredentialListViewController alloc];
  v5 = -[_ASCredentialListViewController initWithExtension:serviceIdentifiers:requestParameters:](v4, "initWithExtension:serviceIdentifiers:requestParameters:", *(_QWORD *)(a1 + 40), MEMORY[0x24BDBD1A8], v3);

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1144);
  *(_QWORD *)(v6 + 1144) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setDelegate:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setDismissOnBackground:", 1);
}

- (void)authenticationProvider:(id)a3 presentAlert:(id)a4 primaryAction:(id)a5 alternateAction:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  dispatch_time_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[AKASAuthorizationProvider loginRowData](self->_authKitAuthorizationProvider, "loginRowData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "loginRowAuthenticationType") == 3;

  -[ASCredentialRequestConfirmButtonSubPane showAlertContinuingWithPassword:](self->_confirmButtonSubPane, "showAlertContinuingWithPassword:", v13);
  v14 = dispatch_time(0, 1100000000);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __106__ASCredentialPickerPaneViewController_authenticationProvider_presentAlert_primaryAction_alternateAction___block_invoke;
  v18[3] = &unk_24C951378;
  v18[4] = self;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  dispatch_after(v14, MEMORY[0x24BDAC9B8], v18);

}

uint64_t __106__ASCredentialPickerPaneViewController_authenticationProvider_presentAlert_primaryAction_alternateAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentAlert:primaryAction:alternateAction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_presentAlert:(id)a3 primaryAction:(id)a4 alternateAction:(id)a5
{
  const __CFDictionary *v8;
  id v9;
  id v10;
  CFUserNotificationRef v11;
  NSObject *alertQueue;
  id *v13;
  NSObject *authorizationActivity;
  _QWORD v15[4];
  const __CFDictionary *v16;
  SInt32 v17;
  _QWORD block[4];
  id v19;
  id v20;
  CFUserNotificationRef v21;
  SInt32 error;

  v8 = (const __CFDictionary *)a3;
  v9 = a4;
  v10 = a5;
  error = 0;
  v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, &error, v8);
  if (v11)
  {
    alertQueue = self->_alertQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke;
    block[3] = &unk_24C9513A0;
    v21 = v11;
    v13 = &v19;
    v19 = v9;
    v20 = v10;
    dispatch_async(alertQueue, block);

  }
  else
  {
    authorizationActivity = self->_authorizationActivity;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke_2;
    v15[3] = &unk_24C9513C8;
    v13 = (id *)&v16;
    v16 = v8;
    v17 = error;
    os_activity_apply(authorizationActivity, v15);
  }

}

void __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 48), 0.0, &responseFlags);
  v2 = AKUserNotificationResponseAction();
  if ((unint64_t)(v2 - 1) < 3)
  {
    v3 = a1 + 40;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 16))();
    goto LABEL_6;
  }
  if (!v2)
  {
    v3 = a1 + 32;
    goto LABEL_5;
  }
LABEL_6:
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke_2_cold_1(a1, v2);
}

- (void)authenticationProvider:(id)a3 showViewController:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__ASCredentialPickerPaneViewController_authenticationProvider_showViewController___block_invoke;
  v7[3] = &unk_24C94F5F8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __82__ASCredentialPickerPaneViewController_authenticationProvider_showViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);

}

- (void)authenticationProvider:(id)a3 hideViewController:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ASCredentialPickerPaneViewController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__ASCredentialPickerPaneViewController_authenticationProvider_hideViewController___block_invoke;
  v7[3] = &unk_24C94F5F8;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __82__ASCredentialPickerPaneViewController_authenticationProvider_hideViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  os_activity_t *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(os_activity_t **)(a1 + 40);
  if (v2 == v4)
  {
    -[os_activity_t navigationController](v5, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
  else
  {
    os_activity_apply(v5[140], &__block_literal_global_282);
  }
}

void __82__ASCredentialPickerPaneViewController_authenticationProvider_hideViewController___block_invoke_2()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __82__ASCredentialPickerPaneViewController_authenticationProvider_hideViewController___block_invoke_2_cold_1();
}

- (UIWindow)presentationAnchor
{
  void *v2;
  void *v3;

  -[ASCredentialPickerPaneViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v3;
}

- (void)_keychainSyncStatusMayHaveChanged:(id)a3
{
  void *v4;
  int v5;
  BOOL v6;
  char v7;
  BOOL v8;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isKeychainSyncEnabled");

  if (self->_isKeychainSyncEnabled != v5)
  {
    self->_isKeychainSyncEnabled = v5;
    v6 = self->_shouldAutoFillFromICloudKeychain
      || -[ASCAuthorizationPresentationContext externalPasskeyLoginChoiceCount](self->_presentationContext, "externalPasskeyLoginChoiceCount") != 0;
    v7 = -[ASCAuthorizationPresentationContext requestTypes](self->_presentationContext, "requestTypes");
    v8 = 0;
    if ((v7 & 1) == 0 && !v6)
      v8 = !self->_shouldExpandOtherLoginChoices && self->_isKeychainSyncEnabled;
    self->_shouldShowEnableCredentialProviderPrompt = v8;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__ASCredentialPickerPaneViewController__keychainSyncStatusMayHaveChanged___block_invoke;
    block[3] = &unk_24C94F558;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __74__ASCredentialPickerPaneViewController__keychainSyncStatusMayHaveChanged___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestPaneViewControllerNeedsReload:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_isUserVerificationConfigured
{
  id v3;
  char v4;
  id v5;
  void *v6;
  NSObject *authorizationActivity;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v11 = 0;
  v4 = objc_msgSend(v3, "canEvaluatePolicy:error:", 2, &v11);
  v5 = v11;
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    authorizationActivity = self->_authorizationActivity;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__ASCredentialPickerPaneViewController__isUserVerificationConfigured__block_invoke;
    v9[3] = &unk_24C94F558;
    v10 = v5;
    os_activity_apply(authorizationActivity, v9);

  }
  return v4;
}

void __69__ASCredentialPickerPaneViewController__isUserVerificationConfigured__block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __69__ASCredentialPickerPaneViewController__isUserVerificationConfigured__block_invoke_cold_1(a1, v2);
}

- (void)_dismiss
{
  void *v3;
  id v4;

  -[ASCredentialRequestPaneViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE0B1C8], 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestPaneViewController:dismissWithCredential:error:", self, 0, v3);

}

- (void)_dumpConfiguration
{
  NSObject *authorizationActivity;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD block[5];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_283);
  authorizationActivity = self->_authorizationActivity;
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_284;
  block[3] = &unk_24C94F558;
  block[4] = self;
  os_activity_apply(authorizationActivity, block);
  v5 = self->_authorizationActivity;
  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_289;
  v33[3] = &unk_24C94F558;
  v33[4] = self;
  os_activity_apply(v5, v33);
  v6 = self->_authorizationActivity;
  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_290;
  v32[3] = &unk_24C94F558;
  v32[4] = self;
  os_activity_apply(v6, v32);
  v7 = self->_authorizationActivity;
  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_295;
  v31[3] = &unk_24C94F558;
  v31[4] = self;
  os_activity_apply(v7, v31);
  objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getEnabledExtensionsSynchronously");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_297);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v16 = self->_authorizationActivity;
          v26[0] = v4;
          v26[1] = 3221225472;
          v26[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_298;
          v26[3] = &unk_24C94F558;
          v26[4] = v15;
          os_activity_apply(v16, v26);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v12);
    }

  }
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = -[ASCAuthorizationPresentationContext requestTypes](self->_presentationContext, "requestTypes");
  if (v18)
  {
    v19 = v18;
    v20 = 1;
    while (1)
    {
      do
      {
        while ((v20 & v19) == 0)
          v20 *= 2;
      }
      while (!v20);
      if (v20 <= 31)
      {
        switch(v20)
        {
          case 1:
            v21 = CFSTR("Password");
            goto LABEL_31;
          case 2:
            v21 = CFSTR("Apple ID");
            goto LABEL_31;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_32;
          case 4:
            v21 = CFSTR("Passkey Registration");
            goto LABEL_31;
          case 8:
            v21 = CFSTR("Passkey Assertion");
            goto LABEL_31;
          default:
            if (v20 != 16)
              goto LABEL_32;
            v21 = CFSTR("Security Key Registration");
            break;
        }
        goto LABEL_31;
      }
      if (v20 > 127)
      {
        if (v20 != 128 && v20 != 256)
          goto LABEL_32;
        v21 = CFSTR("Other Accounts");
        goto LABEL_31;
      }
      if (v20 == 32)
        break;
      if (v20 == 64)
      {
        v21 = CFSTR("caBLE");
LABEL_31:
        objc_msgSend(v17, "addObject:", v21);
      }
LABEL_32:
      v19 &= ~v20;
      v20 *= 2;
      if (!v19)
        goto LABEL_33;
    }
    v21 = CFSTR("Security Key Assertion");
    goto LABEL_31;
  }
LABEL_33:
  v22 = self->_authorizationActivity;
  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_316;
  v24[3] = &unk_24C94F558;
  v25 = v17;
  v23 = v17;
  os_activity_apply(v22, v24);

}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E4D9000, v0, OS_LOG_TYPE_DEFAULT, "ASCredentialPickerPaneViewController configuration:", v1, 2u);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_284(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = objc_msgSend(v3, "_isUserVerificationConfigured");
    v6 = CFSTR("off");
    if (v5)
      v6 = CFSTR("on");
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_DEFAULT, "\tUser verification: %{public}@", (uint8_t *)&v7, 0xCu);

  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_289(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1169))
      v3 = CFSTR("on");
    else
      v3 = CFSTR("off");
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_20E4D9000, v2, OS_LOG_TYPE_DEFAULT, "\tKeychain sync: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_290(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1170))
      v3 = CFSTR("no");
    else
      v3 = CFSTR("yes");
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_20E4D9000, v2, OS_LOG_TYPE_DEFAULT, "\tKeychain sync restricted by configuration profile: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_295(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1210))
      v3 = CFSTR("on");
    else
      v3 = CFSTR("off");
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_20E4D9000, v2, OS_LOG_TYPE_DEFAULT, "\tiCloud Keychain AutoFill: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_296()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20E4D9000, v0, OS_LOG_TYPE_DEFAULT, "\tEnabled credential provider extensions:", v1, 2u);
  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_298(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "_localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_DEFAULT, "\t\t%{public}@", (uint8_t *)&v6, 0xCu);

  }
}

void __58__ASCredentialPickerPaneViewController__dumpConfiguration__block_invoke_316(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_DEFAULT, "\tRequest types: %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleSubPane, 0);
  objc_storeStrong((id *)&self->_infoLabelPane, 0);
  objc_storeStrong((id *)&self->_externalPasswordCredentialForSelectedLoginChoice, 0);
  objc_storeStrong((id *)&self->_credentialProviderViewController, 0);
  objc_storeStrong((id *)&self->_credentialListViewController, 0);
  objc_storeStrong((id *)&self->_alertQueue, 0);
  objc_storeStrong((id *)&self->_authKitAuthorizationProvider, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_otherLoginChoices, 0);
  objc_storeStrong((id *)&self->_tableViewLoginChoices, 0);
  objc_storeStrong((id *)&self->_previouslySelectedLoginChoice, 0);
  objc_storeStrong((id *)&self->_confirmButtonSubPane, 0);
  objc_storeStrong((id *)&self->_imageSubPane, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
}

void __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_3_0();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v5, v6, "Tried to perform conditional registration with unexpected login choice: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_0();
}

void __80__ASCredentialPickerPaneViewController_performConditionalRegistrationIfPossible__block_invoke_39_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138477827;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_20E4D9000, a2, a3, "Tried to perform conditional registration with unexpected passkey login choice: %{private}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __67__ASCredentialPickerPaneViewController__useSecurityKeyButtonTapped__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "Use Security Key button tapped but no security key login choice is available. Failing request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __61__ASCredentialPickerPaneViewController__useCABLEButtonTapped__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "Use caBLE button tapped but no caBLE login choice is available. Failing request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __52__ASCredentialPickerPaneViewController__serviceName__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Failed to get application name with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __104__ASCredentialPickerPaneViewController__performAuthorizationWithAuthenticatedContext_completionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "authenticated for external password login choice but no credential is available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __79__ASCredentialPickerPaneViewController__userSelectedExternalPasswordCredential__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "No credential provider extension available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __120__ASCredentialPickerPaneViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_239_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Did not receive any external password credential because of error: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)_completePasskeyAssertionWithCredential:error:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_20E4D9000, v0, v1, "Returned credential failed validation: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __70__ASCredentialPickerPaneViewController_performPasswordAuthentication___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "Password authentication button pressed but selected login choice is not a Sign in with Apple login choice", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __64__ASCredentialPickerPaneViewController_userTappedContinueButton__block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Failed to open credential provider settings with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)_userTappedContinueButtonForPasskeyLoginChoice:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "externalCredentialProviderBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "Extension for bundle %{public}@ not found", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

void __84__ASCredentialPickerPaneViewController__presentAlert_primaryAction_alternateAction___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint8_t v7[12];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x24BDBD6D8];
  v4 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v8 = 1024;
  v9 = v6;
  _os_log_error_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_ERROR, "Showing alert (%@) failed, user notification is nil!. Error: %d", v7, 0x12u);

}

void __82__ASCredentialPickerPaneViewController_authenticationProvider_hideViewController___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, v0, v1, "Authentication provider tried to pop view controller but it was not the top view controller in the navigation stack", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __69__ASCredentialPickerPaneViewController__isUserVerificationConfigured__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v4, v5, "User verification is not configured: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

@end
