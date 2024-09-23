@implementation CSFixedFooterViewController

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (CSFixedFooterViewController)init
{
  CSFixedFooterViewController *v2;
  void *v3;
  uint64_t v4;
  NSString *cachedMesaFailureText;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSFixedFooterViewController;
  v2 = -[CSFixedFooterViewController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AWAY_LOCK_TRY_AGAIN"), &stru_1E8E30B28, CFSTR("CoverSheet"));
    v4 = objc_claimAutoreleasedReturnValue();
    cachedMesaFailureText = v2->_cachedMesaFailureText;
    v2->_cachedMesaFailureText = (NSString *)v4;

  }
  return v2;
}

- (void)viewDidLoad
{
  objc_super v3;

  -[CSFixedFooterViewController _updateCallToActionTextAnimated:](self, "_updateCallToActionTextAnimated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CSFixedFooterViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v3, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSFixedFooterViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CSFixedFooterViewController _addStatusTextViewControllerIfNecessary](self, "_addStatusTextViewControllerIfNecessary");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSFixedFooterViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[CSFixedFooterViewController _updateCallToActionTextAnimated:](self, "_updateCallToActionTextAnimated:", 0);
  -[CSFixedFooterViewController fixedFooterView](self, "fixedFooterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callToActionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fadeIn");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSFixedFooterViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[CSFixedFooterViewController fixedFooterView](self, "fixedFooterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callToActionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fadeOut");

}

- (void)_addStatusTextViewControllerIfNecessary
{
  CSStatusTextViewController *v3;
  CSStatusTextViewController *statusTextViewController;
  CSStatusTextViewController *v5;
  _QWORD v6[5];

  if (!self->_statusTextViewController)
  {
    v3 = objc_alloc_init(CSStatusTextViewController);
    statusTextViewController = self->_statusTextViewController;
    self->_statusTextViewController = v3;

    -[CSStatusTextViewController setDelegate:](self->_statusTextViewController, "setDelegate:", self);
    -[CSCoverSheetViewControllerBase setPresenter:](self->_statusTextViewController, "setPresenter:", self);
    v5 = self->_statusTextViewController;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__CSFixedFooterViewController__addStatusTextViewControllerIfNecessary__block_invoke;
    v6[3] = &unk_1E8E2DB60;
    v6[4] = self;
    -[CSFixedFooterViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v5, 0, v6);
  }
}

void __70__CSFixedFooterViewController__addStatusTextViewControllerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "fixedFooterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "statusTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatusTextView:", v5);

  v6[2]();
}

- (void)updateCallToActionForReversingInteractiveTransition
{
  -[CSFixedFooterViewController _updateCallToActionTextAnimated:](self, "_updateCallToActionTextAnimated:", 1);
}

- (void)_updateCallToActionTextAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  NSString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *v22;

  v3 = a3;
  if (SBFEffectiveHomeButtonType() == 2)
    return;
  if (-[SBFAuthenticationStatusProvider isAuthenticated](self->_authenticationStatusProvider, "isAuthenticated"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("PRESS_HOME_TO_OPEN");
    v8 = CFSTR("CoverSheetCommon");
LABEL_7:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E8E30B28, v8);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();

    v9 = v21;
    goto LABEL_8;
  }
  if (!self->_temporaryMesaFailureTextActive)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("PRESS_HOME_TO_UNLOCK");
    v8 = CFSTR("CoverSheet");
    goto LABEL_7;
  }
  v9 = self->_cachedMesaFailureText;
LABEL_8:
  v22 = v9;
  v10 = -[NSString length](v9, "length");
  -[CSFixedFooterViewController fixedFooterView](self, "fixedFooterView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "callToActionLabel");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0DAC5B0]);
      -[CSFixedFooterViewController fixedFooterView](self, "fixedFooterView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCallToActionLabel:", v13);

    }
    -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentForType:property:", 9, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isHidden");

    objc_msgSend(v13, "setVisible:animated:", v17 ^ 1u, v3);
    v18 = 1.0;
    if (v17)
      v18 = 0.0;
    objc_msgSend(v13, "setAlpha:", v18);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localeIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:forLanguage:animated:", v22, v20, v3);

    v12 = v13;
  }
  else
  {
    objc_msgSend(v11, "setCallToActionLabel:", 0);
  }

  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
}

- (void)updateCallToActionForMesaMatchFailure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int v10;

  -[CSFixedFooterViewController fixedFooterView](self, "fixedFooterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callToActionShakeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSFixedFooterViewController fixedFooterView](self, "fixedFooterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callToActionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  self->_temporaryMesaFailureTextActive = 1;
  -[CSFixedFooterViewController _updateCallToActionTextAnimated:](self, "_updateCallToActionTextAnimated:", 0);
  objc_msgSend(v6, "setVisible:animated:", 1, 0);
  ++updateCallToActionForMesaMatchFailure___token;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__CSFixedFooterViewController_updateCallToActionForMesaMatchFailure__block_invoke;
  v8[3] = &unk_1E8E2FC48;
  v10 = updateCallToActionForMesaMatchFailure___token;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v4, "beginShakingWithCompletion:", v8);

}

void __68__CSFixedFooterViewController_updateCallToActionForMesaMatchFailure__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD block[5];
  id v5;
  int v6;

  v2 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CSFixedFooterViewController_updateCallToActionForMesaMatchFailure__block_invoke_2;
  block[3] = &unk_1E8E2FC48;
  v6 = *(_DWORD *)(a1 + 48);
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

void __68__CSFixedFooterViewController_updateCallToActionForMesaMatchFailure__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  if (*(_DWORD *)(a1 + 48) == updateCallToActionForMesaMatchFailure___token)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1056) = 0;
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1048);
    objc_msgSend(*(id *)(a1 + 40), "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

    if ((_DWORD)v2)
      objc_msgSend(*(id *)(a1 + 32), "_updateCallToActionTextAnimated:", 1);
  }
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  id v21;
  void *v22;
  dispatch_time_t v23;
  _QWORD v25[5];
  id v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CSFixedFooterViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v27, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    v6 = objc_msgSend(v4, "type");
    v5 = 0;
    switch(v6)
    {
      case 1:
        -[CSFixedFooterViewController _addStatusTextViewControllerIfNecessary](self, "_addStatusTextViewControllerIfNecessary");
        -[CSFixedFooterViewController _updateCallToActionTextAnimated:](self, "_updateCallToActionTextAnimated:", 0);
        -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "legibilitySettings");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[CSFixedFooterViewController fixedFooterView](self, "fixedFooterView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateForLegibilitySettings:", v8);

        goto LABEL_23;
      case 2:
        -[CSFixedFooterViewController _addStatusTextViewControllerIfNecessary](self, "_addStatusTextViewControllerIfNecessary");
        goto LABEL_23;
      case 3:
      case 4:
      case 5:
      case 7:
      case 9:
      case 10:
      case 12:
      case 14:
      case 15:
        break;
      case 6:
        goto LABEL_10;
      case 8:
      case 11:
        goto LABEL_11;
      case 13:
        objc_msgSend(v4, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        -[CSFixedFooterViewController _updateCallToActionTextAnimated:](self, "_updateCallToActionTextAnimated:", v16);
        if ((_DWORD)v16)
        {
          self->_temporaryMesaFailureTextActive = 0;
          self->_authenticatedSinceFingerOn = 1;
          +[CSAction actionWithType:](CSAction, "actionWithType:", 3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSCoverSheetViewControllerBase handleAction:fromSender:](self, "handleAction:fromSender:", v17, self);

        }
        goto LABEL_23;
      case 16:
        objc_msgSend(v4, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        v20 = v19;

        if (v20 <= 0.0)
        {
          -[CSFixedFooterViewController fixedFooterView](self, "fixedFooterView");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "callToActionLabel");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "fadeOut");
        }
        else
        {
          if (v20 <= 0.01)
            goto LABEL_23;
          -[CSFixedFooterViewController _updateCallToActionTextAnimated:](self, "_updateCallToActionTextAnimated:", 0);
          -[CSFixedFooterViewController fixedFooterView](self, "fixedFooterView");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "callToActionLabel");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "fadeIn");
        }

        goto LABEL_22;
      default:
        if (v6 == 25)
        {
LABEL_10:
          self->_temporaryMesaFailureTextActive = 0;
LABEL_11:
          -[CSFixedFooterViewController _updateCallToActionTextAnimated:](self, "_updateCallToActionTextAnimated:", 0);
        }
        else
        {
          if (v6 != 34)
            break;
          -[CSFixedFooterViewController fixedFooterView](self, "fixedFooterView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "callToActionLabel");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "hasBiometricAuthenticationCapabilityEnabled");

          if (v13)
          {
            objc_msgSend(v11, "cancelFadeInTimerIfNecessary");
            v14 = 1000000000;
          }
          else
          {
            v14 = 350000000;
          }
          v23 = dispatch_time(0, v14);
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __43__CSFixedFooterViewController_handleEvent___block_invoke;
          v25[3] = &unk_1E8E2DC00;
          v25[4] = self;
          v26 = v11;
          v21 = v11;
          dispatch_after(v23, MEMORY[0x1E0C80D38], v25);

LABEL_22:
        }
LABEL_23:
        v5 = 0;
        break;
    }
  }

  return v5;
}

_BYTE *__43__CSFixedFooterViewController_handleEvent___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[1057])
  {
    objc_msgSend(result, "_updateCallToActionTextAnimated:", 1);
    objc_msgSend(*(id *)(a1 + 40), "fadeInImmediately:", 1);
    result = *(_BYTE **)(a1 + 32);
  }
  result[1057] = 0;
  return result;
}

- (void)coverSheetStatusTextViewControllerContentDidChange:(id)a3
{
  void *v4;

  -[CSFixedFooterViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (void)setAuthenticationStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationStatusProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_cachedMesaFailureText, 0);
  objc_storeStrong((id *)&self->_statusTextViewController, 0);
}

@end
