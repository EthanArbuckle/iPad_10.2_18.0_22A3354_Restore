@implementation BKUIPearlEnrollViewController

- (void)nextStateButtonPressed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  BOOL v43;
  NSObject *v44;
  void *v45;
  int v46;
  void *v47;
  _QWORD aBlock[5];
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  uint8_t buf[4];
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BKUIPearlEnrollViewController nextStateButton](self, "nextStateButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  if (-[BKUIPearlEnrollViewController state](self, "state") == 2)
  {
    _BKUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "Next state button pressed, startEnroll...", buf, 2u);
    }

    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "supportsPeriocularEnrollment") & 1) != 0)
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEnrollmentAugmentationOnly");

      if ((v9 & 1) != 0)
      {
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "matchUserForSecondPhaseEnrollmentWithCompletionAction:", 0);

        goto LABEL_44;
      }
    }
    else
    {

    }
    -[BKUIPearlEnrollViewController startEnroll](self, "startEnroll");
    goto LABEL_44;
  }
  if (-[BKUIPearlEnrollViewController state](self, "state") != 9)
  {
    if (-[BKUIPearlEnrollViewController state](self, "state") != 6
      && -[BKUIPearlEnrollViewController state](self, "state") != 8
      && !-[BKUIPearlEnrollViewController midFlowPeriocularSplashShowing](self, "midFlowPeriocularSplashShowing"))
    {
      if (-[BKUIPearlEnrollViewController state](self, "state") == 10)
      {
        if (!-[BKUIPearlEnrollViewController inBuddy](self, "inBuddy"))
        {
          v37 = objc_alloc_init((Class)getBYFlowSkipControllerClass());
          getBYFlowSkipIdentifierFaceID();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "didCompleteFlow:", v38);

        }
        objc_initWeak((id *)buf, self);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_4;
        aBlock[3] = &unk_1EA27FD80;
        objc_copyWeak(&v49, (id *)buf);
        aBlock[4] = self;
        v39 = _Block_copy(aBlock);
        -[BKUIPearlEnrollViewController bioStreamEventHelper](self, "bioStreamEventHelper");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "sendSuccessfulEnrollEvent");

        -[BKUIPearlEnrollViewController updatePeriocularEnrollmentSettings:](self, "updatePeriocularEnrollmentSettings:", v39);
        objc_destroyWeak(&v49);
        objc_destroyWeak((id *)buf);
      }
      goto LABEL_44;
    }
    if (-[BKUIPearlEnrollViewController state](self, "state") == 8)
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "enrollOperation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "supportsPeriocularEnrollment");

          if (v46)
            -[BKUIPearlEnrollViewController updatePeriocularEnrollmentSettings:](self, "updatePeriocularEnrollmentSettings:", 0);
          goto LABEL_23;
        }

      }
    }
LABEL_23:
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "supportsPeriocularEnrollment");

    _BKUILoggingFacility();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB281000, v26, OS_LOG_TYPE_DEFAULT, "Button Pressed match then start second phase enrollment ...", buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_3;
      v50[3] = &unk_1EA27FB70;
      objc_copyWeak(&v51, (id *)buf);
      objc_msgSend(v28, "matchUserForSecondPhaseEnrollmentWithCompletionAction:", v50);

      objc_destroyWeak(&v51);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v27)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB281000, v26, OS_LOG_TYPE_DEFAULT, "Button Pressed start second phase enrollment ...", buf, 2u);
      }

      -[BKUIPearlEnrollViewController setState:animated:](self, "setState:animated:", 7, 1);
      -[BKUIPearlEnrollViewController setSubstate:animated:afterDelay:](self, "setSubstate:animated:afterDelay:", 0, 1, 0.0);
    }
    goto LABEL_44;
  }
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "supportsPeriocularEnrollment") & 1) != 0)
  {
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "glassesFound");

    if (v13)
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enrollOperation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0;
        v17 = objc_msgSend(v16, "completeCurrentEnrollOperationWithError:", &v53);
        v18 = v53;

        _BKUILoggingFacility();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v20)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DB281000, v19, OS_LOG_TYPE_DEFAULT, "Enroll marked as completed by partial capture!", buf, 2u);
          }

        }
        else
        {
          if (v20)
          {
            *(_DWORD *)buf = 138412290;
            v57 = v18;
            _os_log_impl(&dword_1DB281000, v19, OS_LOG_TYPE_DEFAULT, "Failed to complete enroll: %@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to complete enroll for partial capture: %@"), v18);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKUIPearlEnrollViewController setStatus:](self, "setStatus:", v47);

        }
      }
      else
      {
        _BKUILoggingFacility();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB281000, v41, OS_LOG_TYPE_DEFAULT, "Enroll marked subsequent enrollment as completed by partial capture, starting match operation for Glasses Enrollment.", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke;
        v54[3] = &unk_1EA27FB70;
        objc_copyWeak(&v55, (id *)buf);
        objc_msgSend(v42, "matchUserForSecondPhaseEnrollmentWithCompletionAction:", v54);

        objc_destroyWeak(&v55);
        objc_destroyWeak((id *)buf);
      }
      goto LABEL_44;
    }
  }
  else
  {

  }
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v30 = objc_msgSend(v29, "completeCurrentEnrollOperationWithError:", &v52);
  v31 = v52;

  if (v30)
  {
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "enrollmentType") != 1)
    {
LABEL_34:

LABEL_35:
      _BKUILoggingFacility();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB281000, v34, OS_LOG_TYPE_DEFAULT, "Enroll marked as completed by partial capture!", buf, 2u);
      }

      goto LABEL_44;
    }
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "isEnrollmentAugmentationOnly"))
    {

      goto LABEL_34;
    }
    v43 = -[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration") == 0;

    if (v43)
      goto LABEL_35;
    _BKUILoggingFacility();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v44, OS_LOG_TYPE_DEFAULT, "Enroll marked initial enrollment as completed by partial capture navigate to mid flow Periocular Enable Splash Pane.", buf, 2u);
    }

    -[BKUIPearlEnrollViewController navigateToMidFlowPeriocularSplashScreenWithPrepareAction:completionAction:](self, "navigateToMidFlowPeriocularSplashScreenWithPrepareAction:completionAction:", 0, 0);
  }
  else
  {
    _BKUILoggingFacility();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v31;
      _os_log_impl(&dword_1DB281000, v35, OS_LOG_TYPE_DEFAULT, "Failed to complete enroll: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to complete enroll for partial capture: %@"), v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController setStatus:](self, "setStatus:", v36);

  }
LABEL_44:

}

void __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isFinalEnrollment"))
    objc_msgSend(WeakRetained, "setSubstate:", 0);
  objc_msgSend(WeakRetained, "setState:animated:", 3, 1);

}

void __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 134217984;
    v4 = objc_msgSend(WeakRetained, "enrollmentConfiguration");
    _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "Button Pressed matched second phase enrollment started ... setting UI to Match enrollment config: %li", (uint8_t *)&v3, 0xCu);
  }

  if (objc_msgSend(WeakRetained, "isFinalEnrollment"))
    objc_msgSend(WeakRetained, "setSubstate:", 0);
  objc_msgSend(WeakRetained, "setState:animated:", 3, 1);

}

void __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("ENROLL_WITH_VOICEOVER_ALERT_MESSAGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1EA281248, CFSTR("Pearl-periocular"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ENROLL_WITH_VOICEOVER_ALERT_TITLE"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BKUIAlertController alertControllerWithTitle:message:preferredStyle:](BKUIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_2;
    v13[3] = &unk_1EA27FCF0;
    v13[4] = WeakRetained;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v12);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    objc_msgSend(WeakRetained, "endEnrollFlowWithError:", 0);
  }

}

uint64_t __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endEnrollFlowWithError:", 0);
}

- (void)updatePeriocularEnrollmentSettings:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v4 = (void (**)(_QWORD))a3;
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0;
  objc_msgSend(v5, "getAuthContextForCredentialError:authContext:", &v17, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  v8 = v16;

  if (v7)
  {
    _BKUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BKUIPearlEnrollViewController(ButtonActionWithNavigation) updatePeriocularEnrollmentSettings:].cold.1(v7, (uint64_t)v8, v9);

  }
  v10 = -[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration");
  if (v10 - 3 < 2 || v10 == 1)
  {
    if (!-[BKUIPearlEnrollViewController enrollmentAlreadyHasExistingPeriocularTemplate](self, "enrollmentAlreadyHasExistingPeriocularTemplate"))
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hasPeriocularEnrollment");

      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[BKUIPeriocularEnableSplashViewController setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:credentialSet:authContext:enabled:completion:](BKUIPeriocularEnableSplashViewController, "setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:credentialSet:authContext:enabled:completion:", v15, v6, v8, v13 != 0, v4);

      goto LABEL_13;
    }
  }
  else if (v10)
  {
    goto LABEL_13;
  }
  if (v4)
    v4[2](v4);
LABEL_13:

}

- (BOOL)midFlowPeriocularSplashShowing
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[BKUIPearlEnrollViewController midFlowPeriocularSplashController](self, "midFlowPeriocularSplashController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)navigateToMidFlowPeriocularSplashScreenWithPrepareAction:(id)a3 completionAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[BKUIPearlEnrollViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipsToBounds:", 1);

  v10 = dispatch_time(0, 700000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke;
  block[3] = &unk_1EA27FE20;
  block[4] = self;
  v14 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);

}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke(uint64_t a1)
{
  BKUIPeriocularEnableSplashViewController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id location;
  _QWORD v58[6];

  v58[4] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [BKUIPeriocularEnableSplashViewController alloc];
  v3 = objc_msgSend(*(id *)(a1 + 32), "inBuddy");
  objc_msgSend(*(id *)(a1 + 32), "currentOperationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2;
  v54[3] = &unk_1EA27FDF8;
  v54[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v56, &location);
  v55 = *(id *)(a1 + 40);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2_25;
  v52[3] = &unk_1EA27FB70;
  objc_copyWeak(&v53, &location);
  v6 = -[BKUIPeriocularEnableSplashViewController initInBuddy:bkDevice:upsell:withEndEnrollmentActionPrimary:enrollmentActionSecondary:](v2, "initInBuddy:bkDevice:upsell:withEndEnrollmentActionPrimary:enrollmentActionSecondary:", v3, v5, 0, v54, v52);
  objc_msgSend(*(id *)(a1 + 32), "setMidFlowPeriocularSplashController:", v6);

  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3_26;
  v50[3] = &unk_1EA27FB70;
  objc_copyWeak(&v51, &location);
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserSkippedAction:", v50);

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addChildViewController:", v9);

  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v15);

  v28 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "containerView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v42;
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "containerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v35;
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "containerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v16;
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "containerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v24);

  v25 = *(_QWORD *)(a1 + 48);
  if (v25)
    (*(void (**)(void))(v25 + 16))();
  +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_4;
  v49[3] = &unk_1EA27FB98;
  v49[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v26, "transitionTo:completion:", v27, v49);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);

  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);
}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setState:animated:", 3, 0);
  v2 = dispatch_time(0, 650000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3;
  block[3] = &unk_1EA27FDD0;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(WeakRetained, "midFlowPeriocularSplashShowing") & 1) == 0)
  {
    _BKUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3_cold_1(v3);

  }
  objc_msgSend(WeakRetained, "midFlowPeriocularSplashController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bringSubviewToFront:", v9);

  objc_msgSend(WeakRetained, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOrigin:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_24;
  v14[3] = &unk_1EA27FDA8;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v14[4] = WeakRetained;
  v14[5] = v12;
  v15 = v13;
  objc_msgSend(v11, "transitionTo:completion:", WeakRetained, v14);

}

uint64_t __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_24(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "nextStateButtonPressed:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeChildViewController:", v5);

  objc_msgSend(*(id *)(a1 + 40), "setNeedsStatusBarAppearanceUpdate");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2_25(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "transitionToSuccessFromPeriocularSplash");

}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3_26(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "transitionToSuccessFromPeriocularSplash");

}

uint64_t __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setOrigin:", v5, 0.0);

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)escapeHatchButtonPressed
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  void *v46;
  id buf;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (-[BKUIPearlEnrollViewController showGlassesSkipUI](self, "showGlassesSkipUI"))
  {
    -[BKUIPearlEnrollViewController _handleGlassesSkipAction](self, "_handleGlassesSkipAction");
  }
  else if (-[BKUIPearlEnrollViewController state](self, "state") == 3
         && (-[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler"),
             v3 = (void *)objc_claimAutoreleasedReturnValue(),
             v4 = objc_msgSend(v3, "shouldShowRetryUI"),
             v3,
             v4))
  {
    _BKUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Pressed escape hatch during match operation fail, showing retry UI ... user skipped", (uint8_t *)&buf, 2u);
    }

    -[BKUIPearlEnrollViewController _cancelEnrollOperationForEscapeHatchButtonTap](self, "_cancelEnrollOperationForEscapeHatchButtonTap");
    objc_initWeak(&buf, self);
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke;
    v44[3] = &unk_1EA27FE48;
    objc_copyWeak(&v45, &buf);
    objc_msgSend(v7, "removePeriocularEnrollmentsFromIdentity:removeAll:reply:", v9, 1, v44);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&buf);
  }
  else if (objc_msgSend((id)objc_opt_class(), "_shouldShowEscapeHatchForState:inBuddy:", -[BKUIPearlEnrollViewController state](self, "state"), -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy")))
  {
    _BKUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DB281000, v10, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Pressed escape hatch", (uint8_t *)&buf, 2u);
    }

    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "enrollmentType") == 1;

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.pearl_enroll"), -2, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlEnrollViewController endEnrollFlowWithError:](self, "endEnrollFlowWithError:", v13);

    }
    else
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEnrollmentAugmentationOnly");

      if (v23)
      {
        objc_initWeak(&buf, self);
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "device");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "identity");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_31;
        v42[3] = &unk_1EA27FE48;
        objc_copyWeak(&v43, &buf);
        objc_msgSend(v25, "removePeriocularEnrollmentsFromIdentity:removeAll:reply:", v27, 1, v42);

        objc_destroyWeak(&v43);
        objc_destroyWeak(&buf);
      }
      else
      {
        -[BKUIPearlEnrollViewController _cancelEnrollOperationForEscapeHatchButtonTap](self, "_cancelEnrollOperationForEscapeHatchButtonTap");
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "enrollOperation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setDelegate:", 0);

        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v31, "mutableCopy");
        -[BKUIPearlEnrollViewController setOperationHandlers:](self, "setOperationHandlers:", v32);

        objc_initWeak(&buf, self);
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "device");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "identity");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_3;
        v39[3] = &unk_1EA27FE70;
        objc_copyWeak(&v41, &buf);
        v37 = v30;
        v40 = v37;
        objc_msgSend(v34, "removePeriocularEnrollmentsFromIdentity:removeAll:reply:", v36, 1, v39);

        objc_destroyWeak(&v41);
        objc_destroyWeak(&buf);

      }
    }
  }
  else
  {
    v14 = (void *)objc_opt_class();
    v15 = -[BKUIPearlEnrollViewController state](self, "state");
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "poseStatus");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v14, "_shouldShowAccessibilityOptionForState:poseStatus:", v15, v17);

    if ((_DWORD)v14)
    {
      _BKUILoggingFacility();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = -[BKUIPearlEnrollViewController state](self, "state");
        _os_log_impl(&dword_1DB281000, v18, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Pressed accessibility escape hatch, state = %i", (uint8_t *)&buf, 8u);
      }

      -[BKUIPearlEnrollViewController setState:animated:](self, "setState:animated:", 9, 1);
    }
    else if (-[BKUIPearlEnrollViewController state](self, "state") == 10)
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "supportsPeriocularEnrollment");

      if (v20)
      {
        _BKUILoggingFacility();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DB281000, v21, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Enroll has completed, but we do have Periocular enrollment support!", (uint8_t *)&buf, 2u);
        }

        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_33;
        v38[3] = &unk_1EA27FB98;
        v38[4] = self;
        -[BKUIPearlEnrollViewController updatePeriocularEnrollmentSettings:](self, "updatePeriocularEnrollmentSettings:", v38);
      }
    }
  }
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD block[5];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (v5 || (a2 & 1) == 0)
    objc_msgSend(WeakRetained, "_logRemovePeriocularFailure:", v5);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_2;
  block[3] = &unk_1EA27FB98;
  block[4] = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.pearl_enroll"), -2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endEnrollFlowWithError:", v2);

}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_31(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD block[5];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (v5 || (a2 & 1) == 0)
    objc_msgSend(WeakRetained, "_logRemovePeriocularFailure:", v5);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_2_32;
  block[3] = &unk_1EA27FB98;
  block[4] = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_2_32(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.pearl_enroll"), -2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endEnrollFlowWithError:", v2);

}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v5 || (a2 & 1) == 0)
    objc_msgSend(WeakRetained, "_logRemovePeriocularFailure:", v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_4;
  v8[3] = &unk_1EA27FD80;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v9 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v10);
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "enrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pillContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  objc_msgSend(WeakRetained, "enrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPillsHidden:", 0);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_5;
  v7[3] = &unk_1EA27FD80;
  objc_copyWeak(&v9, v2);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_setState:animated:completion:", 10, 1, v7);

  objc_destroyWeak(&v9);
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "enrollOperation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "enrollOperation:finishedWithIdentity:animateImmediately:", v2, v3, 1);

}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_33(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  uint8_t buf[16];

  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "BKUIPearl: updatePeriocularEnrollmentSettings: endEnrollAction completion invoked", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_34;
  block[3] = &unk_1EA27FB98;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startInternalGlassesFlow");

}

uint64_t __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupEnrollView");
}

- (void)_logRemovePeriocularFailure:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _BKUILoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "removePeriocularEnrollmentsFromIdentity unsucesful %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)_cancelEnrollOperationForEscapeHatchButtonTap
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enrollmentType");

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 1)
    objc_msgSend(v5, "cancelEnroll");
  else
    objc_msgSend(v5, "cancelEnrollPreserveIdentity");

}

+ (BOOL)_shouldShowEscapeHatchForState:(int)a3 inBuddy:(BOOL)a4
{
  return (a3 - 3) < 2 && a4;
}

+ (BOOL)_shouldShowAccessibilityOptionForState:(int)a3 poseStatus:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  BOOL v8;

  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue") == 3;

  }
  else
  {
    v7 = 0;
  }
  v8 = (a3 & 0xFFFFFFFD) == 5 && v7;

  return v8;
}

- (void)retryPressed
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  if (-[BKUIPearlEnrollViewController state](self, "state") == 3)
  {
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldShowRetryUI");

    if (v4)
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "retryPressed");

      -[BKUIPearlEnrollViewController buttonTray](self, "buttonTray");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "topLinkButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEnabled:", 0);

    }
  }
}

- (void)_handleGlassesSkipAction
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  id buf[2];

  if (-[BKUIPearlEnrollViewController state](self, "state") == 3)
  {
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "shouldShowRetryUI") & 1) != 0)
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "glassesEnforcementError");

      if (v5)
      {
        _BKUILoggingFacility();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_10;
        LOWORD(buf[0]) = 0;
        v7 = "Pressed escape hatch during glasses enforcement error in BKUIPearlEnrollStateNeedsPositioning, showing retr"
             "y UI ... user skip tapped";
        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  _BKUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    goto LABEL_10;
  LOWORD(buf[0]) = 0;
  v7 = "Pressed escape hatch during upsell in BKUIPearlEnrollStateSubsequentScanComplete, showing retry UI ... user skip tapped";
LABEL_9:
  _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)buf, 2u);
LABEL_10:

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enrollOperation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", 0);

  objc_initWeak(buf, self);
  if (-[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DYNAMIC_MATCH_GLASSES_ENROLL_SKIP_ALERT_BODY"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("GLASSES_ENROLL_SKIP_ALERT_BODY"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  }
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("GLASSES_ENROLL_SKIP_ALERT_TITLE"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[BKUIAlertController alertControllerWithTitle:message:preferredStyle:](BKUIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v11;

  v15 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("GLASSES_ENROLL_SKIP_ALERT_SKIP_ACTION"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke;
  v27[3] = &unk_1EA27FE98;
  v27[4] = self;
  objc_copyWeak(&v28, buf);
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("GLASSES_ENROLL_SKIP_ALERT_DONT_SKIP_ACTION"), &stru_1EA281248, CFSTR("Pearl-periocular"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_3;
  v25[3] = &unk_1EA27FEC0;
  objc_copyWeak(&v26, buf);
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v23);

  objc_msgSend(v14, "bkui_addPreferredAction:", v19);
  -[BKUIPearlEnrollViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v28);
  objc_destroyWeak(buf);
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int64_t v15;
  dispatch_time_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[16];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentOperationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "enrollmentConfiguration");
  _BKUILoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 4)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "Pressed escape hatch during glasses enforcement error for BKUIPearlEnrollmentConfigurationDynamicMatchWithGlassesAugmentation, user confirmed skip", buf, 2u);
    }

    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.pearl_enroll"), -2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endEnrollFlowWithError:", v7);

  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "Pressed escape hatch during during upsell for normal enrollment, user confirmed skip", buf, 2u);
    }

    v21[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "setOperationHandlers:", v9);

    objc_msgSend(*(id *)(a1 + 32), "operationHandlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGlassesFound:", 0);

    objc_msgSend(*(id *)(a1 + 32), "enrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pillContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "squareNeedsPositionLayout");

    if (v14)
      v15 = 1000000000;
    else
      v15 = 0;
    v16 = dispatch_time(0, v15);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_43;
    v17[3] = &unk_1EA27FD80;
    objc_copyWeak(&v19, (id *)(a1 + 40));
    v18 = v2;
    dispatch_after(v16, MEMORY[0x1E0C80D38], v17);

    objc_destroyWeak(&v19);
  }

}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_43(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "enrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  objc_msgSend(WeakRetained, "enrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pillContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  objc_msgSend(WeakRetained, "enrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPillsHidden:", 0);

  if (objc_msgSend(WeakRetained, "state") == 8)
  {
    objc_msgSend(WeakRetained, "getEnrollview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_2;
    v10[3] = &unk_1EA27FC78;
    v10[4] = WeakRetained;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v7, "setState:completion:", 6, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "enrollOperation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "enrollOperation:finishedWithIdentity:animateImmediately:", v8, v9, 1);

  }
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "enrollOperation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollOperation:finishedWithIdentity:animateImmediately:", v4, v3, 1);

}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentOperationHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "currentOperationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enrollOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v1);

}

+ (void)preloadWithCompletion:(id)a3
{
  id v3;
  BKUIPearlEnrollControllerPreloadedState *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  BKUIPearlEnrollControllerPreloadedState *v8;
  NSObject *v9;
  BKUIPearlEnrollControllerPreloadedState *v10;
  NSObject *v11;
  NSObject *v12;
  BKUIPearlEnrollControllerPreloadedState *v13;
  id v14;
  _QWORD v15[4];
  BKUIPearlEnrollControllerPreloadedState *v16;
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  BKUIPearlEnrollControllerPreloadedState *v20;
  NSObject *v21;
  _QWORD block[4];
  BKUIPearlEnrollControllerPreloadedState *v23;
  NSObject *v24;

  v3 = a3;
  v4 = objc_alloc_init(BKUIPearlEnrollControllerPreloadedState);
  v5 = dispatch_group_create();
  dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v5);
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke;
  block[3] = &unk_1EA27FC78;
  v8 = v4;
  v23 = v8;
  v9 = v5;
  v24 = v9;
  dispatch_async(v6, block);
  dispatch_group_enter(v9);
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_5;
  v18[3] = &unk_1EA27FCA0;
  v19 = v6;
  v10 = v8;
  v20 = v10;
  v21 = v9;
  v11 = v9;
  v12 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v18);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_8;
  v15[3] = &unk_1EA2808D0;
  v16 = v10;
  v17 = v3;
  v13 = v10;
  v14 = v3;
  dispatch_group_notify(v11, v12, v15);

}

void __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  BKUIPearlAudioSession *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "Pearl: Will create audio session", buf, 2u);
  }

  v3 = objc_alloc_init(BKUIPearlAudioSession);
  objc_msgSend(*(id *)(a1 + 32), "cacheAudioSession:", v3);
  _BKUILoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "Pearl: Did finish create audio session", v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  BKUIPearlVideoCaptureSession *v3;
  NSObject *v4;
  NSObject *v5;
  BKUIPearlVideoCaptureSession *v6;
  _QWORD block[4];
  BKUIPearlVideoCaptureSession *v8;
  id v9;
  id v10;
  uint8_t buf[16];

  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "Pearl: Will create video capture session", buf, 2u);
  }

  v3 = objc_alloc_init(BKUIPearlVideoCaptureSession);
  _BKUILoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "Pearl: Did finish create video capture session", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_7;
  block[3] = &unk_1EA27FCA0;
  v8 = v3;
  v5 = *(NSObject **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

void __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "Pearl: Will start video capture session", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "startCapture");
  objc_msgSend(*(id *)(a1 + 40), "cacheVideoCaptureSession:", *(_QWORD *)(a1 + 32));
  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "Pearl: Did start video capture session", v4, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "Pearl: All preloading complete", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (BKUIPearlEnrollViewController)initWithPreloadedState:(id)a3
{
  id v5;
  BKUIPearlEnrollViewController *v6;
  BKUIPearlEnrollViewController *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *stateSema;
  BKUIPearlEnrollAudioManager *v10;
  BKUIPearlEnrollAudioManager *audioManager;
  uint64_t v12;
  BKUIAnalyticsManager *analyticsManager;
  void *v14;
  void *v15;
  void *v16;
  BKUIFaceIDEnrollOperationsHandler *v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *operationHandlers;
  _TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager *v21;
  _TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager *workItemsManager;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BKUIPearlEnrollViewController;
  v6 = -[BKUIPearlEnrollViewController init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preloadedState, a3);
    v8 = dispatch_semaphore_create(0);
    stateSema = v7->_stateSema;
    v7->_stateSema = (OS_dispatch_semaphore *)v8;

    v10 = objc_alloc_init(BKUIPearlEnrollAudioManager);
    audioManager = v7->_audioManager;
    v7->_audioManager = v10;

    -[BKUIPearlEnrollAudioManager setStateDelegate:](v7->_audioManager, "setStateDelegate:", v7);
    -[BKUIPearlEnrollAudioManager setPreloadedState:](v7->_audioManager, "setPreloadedState:", v7->_preloadedState);
    v12 = objc_opt_new();
    analyticsManager = v7->_analyticsManager;
    v7->_analyticsManager = (BKUIAnalyticsManager *)v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel_didBecomeActive_, *MEMORY[0x1E0CEB270], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel_willResignActive_, *MEMORY[0x1E0CEB358], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel_didEnterBackground_, *MEMORY[0x1E0CEB288], 0);

    v17 = -[BKUIFaceIDEnrollOperationsHandler initWithBKPearlEnrollmentType:]([BKUIFaceIDEnrollOperationsHandler alloc], "initWithBKPearlEnrollmentType:", 1);
    v25[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "mutableCopy");
    operationHandlers = v7->_operationHandlers;
    v7->_operationHandlers = (NSMutableArray *)v19;

    v21 = objc_alloc_init(_TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager);
    workItemsManager = v7->_workItemsManager;
    v7->_workItemsManager = v21;

  }
  return v7;
}

- (id)currentOperationHandler
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewController operationHandlers](self, "operationHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEnrollmentConfiguration:(unint64_t)a3
{
  unint64_t v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3 == 2)
    v4 = 3;
  else
    v4 = a3;
  v5 = -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy");
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "credential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "externalizedAuthContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[BKUIFaceIDEnrollOperationsHandler handlersForEnrollmentConfiguration:inBuddy:delegate:credential:externalizedAuthContext:](BKUIFaceIDEnrollOperationsHandler, "handlersForEnrollmentConfiguration:inBuddy:delegate:credential:externalizedAuthContext:", v4, v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController setOperationHandlers:](self, "setOperationHandlers:", v9);

}

- (unint64_t)enrollmentConfiguration
{
  void *v2;
  unint64_t v3;

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enrollmentConfiguration");

  return v3;
}

- (id)getEnrollview
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return self->_enrollView;
}

- (void)cleanupEnrollView
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "BKUIPearl: cleanupEnrollView", v7, 2u);
  }

  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEnrollDeActivate");

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cleanupEnroll");

  -[BKUIPearlEnrollViewController audioManager](self, "audioManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cleanupHapticsAndSound");

  -[BKUIPearlEnrollViewController setOperationHandlers:](self, "setOperationHandlers:", 0);
}

- (void)_endEnrollFlowWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[BKUIPearlEnrollViewController cleanupEnrollView](self, "cleanupEnrollView");
  -[BKUIPearlEnrollViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[BKUIPearlEnrollViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pearlEnrollViewController:finishedEnrollWithError:", self, v7);

  }
}

- (void)endEnrollFlowWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  char v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  __CFString *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _BOOL4 v32;
  __CFString *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  _QWORD v43[4];
  id v44;
  BKUIPearlEnrollViewController *v45;
  BOOL v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _BKUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v48 = v6;
    _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "Pearl: end enroll flow with error %@", buf, 0xCu);

  }
  -[BKUIPearlEnrollViewController traceAnalyticsForEndEnrollFlowWithError:](self, "traceAnalyticsForEndEnrollFlowWithError:", v4);
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.biometrickitui.pearl_enroll")))
    v8 = objc_msgSend(v4, "code") == -1;
  else
    v8 = 0;

  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.biometrickitui.pearl_enroll")))
    v10 = objc_msgSend(v4, "code") == -2;
  else
    v10 = 0;

  if (v4)
    v11 = v8;
  else
    v11 = 1;
  if ((v11 & 1) == 0 && !v10)
  {
    v12 = -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ENROLL_FAILED_GENERIC"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.biometrickitui.biokit")) & 1) != 0)
    {
      v16 = objc_msgSend(v4, "code");

      switch(v16)
      {
        case 5:
          v42 = v12;
          v17 = -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy");
          v18 = CFSTR("ENROLL_FAILED_TOO_HOT_SETTINGS");
          v19 = CFSTR("ENROLL_FAILED_TOO_HOT_BUDDY");
          goto LABEL_28;
        case 6:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("ENROLL_FAILED_DIFFERENT_FACE_TITLE"), &stru_1EA281248, CFSTR("Pearl-periocular"));
          v28 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ENROLL_FAILED_DIFFERENT_FACE_MESSAGE"), &stru_1EA281248, CFSTR("Pearl-periocular"));
          v26 = objc_claimAutoreleasedReturnValue();
          v25 = 0;
          v42 = 0;
          v14 = (void *)v28;
          goto LABEL_36;
        case 7:
          v42 = v12;
          v17 = -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy");
          v18 = CFSTR("ENROLL_FAILED_TOO_COLD_SETTINGS");
          v19 = CFSTR("ENROLL_FAILED_TOO_COLD_BUDDY");
LABEL_28:
          if (v17)
            v18 = (__CFString *)v19;
          v25 = v18;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "localizedStringForKey:value:table:", v25, &stru_1EA281248, CFSTR("Pearl-periocular"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 8:
          v42 = v12;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("ENROLL_FAILED_INTERLOCKED_TITLE"), &stru_1EA281248, CFSTR("Pearl-periocular"));
          v31 = objc_claimAutoreleasedReturnValue();

          v32 = -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy");
          v33 = CFSTR("ENROLL_FAILED_INTERLOCKED_MESSAGE_SETTINGS");
          if (v32)
            v33 = CFSTR("ENROLL_FAILED_INTERLOCKED_MESSAGE_BUDDY");
          v25 = v33;
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "localizedStringForKey:value:table:", v25, &stru_1EA281248, CFSTR("Pearl-periocular"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)v31;
          break;
        default:
          v42 = v12;
          goto LABEL_19;
      }

      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "userInterfaceIdiom");

      if ((v35 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        goto LABEL_37;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", v25, &stru_1EA281248, CFSTR("Pearl-j3xx"));
      v26 = objc_claimAutoreleasedReturnValue();

      v22 = v36;
    }
    else
    {
      v42 = v12;

      v16 = 0;
LABEL_19:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[BKUIPearlEnrollViewController inBuddy](self, "inBuddy"))
        v21 = CFSTR("ENROLL_FAILED_MESSAGE_BUDDY");
      else
        v21 = CFSTR("ENROLL_FAILED_MESSAGE_SETTINGS");
      objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_1EA281248, CFSTR("Pearl-periocular"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "bkui_IsInternalInstall");

      v25 = 0;
      if (!v24 || !v16)
        goto LABEL_37;
      objc_msgSend(v22, "stringByAppendingFormat:", CFSTR("\nInternal Message: Reason %i"), v16);
      v26 = objc_claimAutoreleasedReturnValue();
      v25 = 0;
    }
LABEL_36:

    v22 = (void *)v26;
LABEL_37:
    +[BKUIAlertController alertControllerWithTitle:message:preferredStyle:](BKUIAlertController, "alertControllerWithTitle:message:preferredStyle:", v14, v22, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __56__BKUIPearlEnrollViewController_endEnrollFlowWithError___block_invoke;
    v43[3] = &unk_1EA2808F8;
    v46 = v42;
    v44 = v4;
    v45 = self;
    objc_msgSend(v38, "actionWithTitle:style:handler:", v40, 0, v43);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addAction:", v41);

    -[BKUIPearlEnrollViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v37, 1, 0);
    goto LABEL_38;
  }
  -[BKUIPearlEnrollViewController _endEnrollFlowWithError:](self, "_endEnrollFlowWithError:", v4);
LABEL_38:

}

void __56__BKUIPearlEnrollViewController_endEnrollFlowWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  if (*(_BYTE *)(a1 + 48))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    if (v4)
    {
      v9 = *MEMORY[0x1E0CB3388];
      v10[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.pearl_enroll"), -2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
  }
  else
  {
    v8 = v4;
  }
  objc_msgSend(*(id *)(a1 + 40), "_endEnrollFlowWithError:", v8);

}

- (void)traceAnalyticsForEndEnrollFlowWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("inBuddy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("enrollmentState"));

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "enrollmentType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("enrollmentType"));

    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "glassesRequirement"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("enrollmentNeedsGlasses"));

  }
  if (v18)
  {
    objc_msgSend(v18, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(" (%li)"), objc_msgSend(v18, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("error"));

  }
  -[BKUIPearlEnrollViewController analyticsManager](self, "analyticsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "traceEvent:withPayload:", CFSTR("com.apple.BKUI.FaceIDEnrollmentEnded"), v17);

}

- (void)didBecomeActive:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t v7[16];

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    _BKUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "Pearl: Resuming enroll due to become active", v7, 2u);
    }

    -[BKUIPearlEnrollViewController _setSuspended:](self, "_setSuspended:", 0);
  }
}

- (void)willResignActive:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t v7[16];

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  if (v5)
  {
    _BKUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "Pearl: Suspending enroll due to resign active", v7, 2u);
    }

    -[BKUIPearlEnrollViewController _setSuspended:](self, "_setSuspended:", 1);
  }
}

- (void)didEnterBackground:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[16];

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isActive"))
  {

LABEL_3:
    _BKUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "Pearl: Ending enroll due to enter background", buf, 2u);
    }

    if (-[BKUIPearlEnrollViewController hasPeriocularIdentityEnrolled](self, "hasPeriocularIdentityEnrolled")
      && -[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration") == 4
      && -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy"))
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = -2;
    }
    else
    {
      -[BKUIPearlEnrollViewController operationHandlers](self, "operationHandlers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_8);

      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = -1;
    }
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.pearl_enroll"), v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController endEnrollFlowWithError:](self, "endEnrollFlowWithError:", v8);

    return;
  }
  if ((self->_state - 1) >= 9)
  {

    return;
  }
  -[BKUIPearlEnrollViewController parentViewController](self, "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController parentViewController](self, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
    goto LABEL_3;
}

uint64_t __52__BKUIPearlEnrollViewController_didEnterBackground___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelEnroll");
}

- (void)_setSuspended:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  _BKUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "Pearl: Set suspended: %i", (uint8_t *)v8, 8u);
  }

  self->_suspended = v3;
  -[NSTimer invalidate](self->_substateDelayTimer, "invalidate");
  if (self->_state >= 3u)
  {
    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSuspended:", v3);

  }
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSuspend:", v3);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelCurrentEnrollmentOperationIfUnfinished");

  -[BKUIPearlEnrollView setState:completion:](self->_enrollView, "setState:completion:", 0, 0);
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cleanupEnroll");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)BKUIPearlEnrollViewController;
  -[BKUIPearlEnrollViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)isModalInPresentation
{
  return -[BKUIPearlEnrollViewController state](self, "state") > 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKUIPearlEnrollViewController;
  -[BKUIPearlEnrollViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[BKUIPearlEnrollViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarStyle:", 1);

  -[BKUIPearlEnrollViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  -[BKUIPearlEnrollViewController _handleEnrollStateOnAppear](self, "_handleEnrollStateOnAppear");
  -[BKUIPearlEnrollViewController audioManager](self, "audioManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupSound");

  -[BKUIPearlEnrollViewController audioManager](self, "audioManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUpHaptics");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKUIPearlEnrollViewController;
  -[BKUIPearlEnrollViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelCurrentEnrollmentOperationIfUnfinished");

  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didDisappear");

  if (-[BKUIPearlEnrollViewController inBuddy](self, "inBuddy"))
  {
    +[BKUIStyle sharedStyle](BKUIStyle, "sharedStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController parentViewController](self, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyThemeToNavigationController:", v8);

  }
}

- (void)forceDarkBackground:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_darkBackground != a3)
  {
    v4 = a4;
    self->_darkBackground = a3;
    if (self->_state == 10 && !a3)
    {
      -[_UIBackdropView setHidden:](self->_darkTrayBackdrop, "setHidden:", 1);
      -[_UIBackdropView setHidden:](self->_lightTrayBackdrop, "setHidden:", 1);
    }
    v7 = 0.3;
    if (!v4)
      v7 = 0.0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__BKUIPearlEnrollViewController_forceDarkBackground_animated___block_invoke;
    v8[3] = &unk_1EA280410;
    v9 = a3;
    v8[4] = self;
    +[UIView bkui_animateWithDuration:animations:](v7, MEMORY[0x1E0CEABB0], v8);
  }
}

void __62__BKUIPearlEnrollViewController_forceDarkBackground_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v9);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v9);

  objc_msgSend(*(id *)(a1 + 32), "enrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v9);

  if (*(_BYTE *)(a1 + 40))
    v6 = 1.0;
  else
    v6 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", v6);
  if (*(_BYTE *)(a1 + 40))
    v7 = 0.0;
  else
    v7 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", v7);
  objc_msgSend(*(id *)(a1 + 32), "instructionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDarkMode:", *(unsigned __int8 *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)setInSheet:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_inSheet = a3;
  -[BKUIPearlEnrollViewController getEnrollview](self, "getEnrollview");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInSheet:", v3);

}

- (BOOL)isGlassesEnrollmentOnly
{
  return -[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration") == 4;
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  BioStreamsEventHelper *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id buf;
  objc_super v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlEnrollViewController;
  -[BKUIPearlEnrollViewController viewDidLoad](&v11, sel_viewDidLoad);
  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Setting up enrollVC", (uint8_t *)&buf, 2u);
  }

  -[BKUIPearlEnrollViewController _setupUI](self, "_setupUI");
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[BKUIPearlEnrollViewController setupDebugLabel](self, "setupDebugLabel");
  v5 = -[BioStreamsEventHelper initWithBKDeviceType:inBuddy:]([BioStreamsEventHelper alloc], "initWithBKDeviceType:inBuddy:", 2, -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy"));
  -[BKUIPearlEnrollViewController setBioStreamEventHelper:](self, "setBioStreamEventHelper:", v5);

  -[BKUIPearlEnrollViewController setEnrollmentAlreadyHasExistingPeriocularTemplate:](self, "setEnrollmentAlreadyHasExistingPeriocularTemplate:", -[BKUIPearlEnrollViewController hasPeriocularIdentityEnrolled](self, "hasPeriocularIdentityEnrolled"));
  objc_initWeak(&buf, self);
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__BKUIPearlEnrollViewController_viewDidLoad__block_invoke;
  v8[3] = &unk_1EA27FB48;
  objc_copyWeak(&v9, &buf);
  -[BKUIPearlEnrollViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController setTraitChangeRegistration:](self, "setTraitChangeRegistration:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&buf);
}

void __44__BKUIPearlEnrollViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)setupDebugLabel
{
  UILabel *v3;
  UILabel *debugLabel;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  debugLabel = self->_debugLabel;
  self->_debugLabel = v3;

  v5 = self->_debugLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v5, "setTextColor:", v6);

  -[UILabel setTextAlignment:](self->_debugLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_debugLabel, "setNumberOfLines:", 0);
  -[UILabel setHidden:](self->_debugLabel, "setHidden:", 1);
  -[BKUIPearlEnrollViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_debugLabel);

  if (os_variant_has_internal_ui())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("pearlDebugEnroll"));

    if (v9)
      -[BKUIPearlEnrollViewController toggleDebug](self, "toggleDebug");
  }
}

- (void)_setupUI
{
  BKUIPearlEnrollView *v3;
  void *v4;
  BKUIPearlEnrollView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  BKUIButtonTray *v29;
  BKUIButtonTray *v30;
  void *v31;
  BKUIPearlEnrollViewBottomContainer *v32;
  _BOOL8 inBuddy;
  BKUIContainerScrollView *v34;
  BKUIContainerScrollView *v35;
  BKUIPearlEnrollViewBottomContainer *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  double v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  BKUIButtonTray *v131;
  BKUIButtonTray *v132;
  _QWORD v133[3];
  _QWORD v134[4];
  _QWORD v135[4];

  v135[2] = *MEMORY[0x1E0C80C00];
  v3 = [BKUIPearlEnrollView alloc];
  -[BKUIPearlEnrollControllerPreloadedState acquireCachedVideoCaptureSession](self->_preloadedState, "acquireCachedVideoCaptureSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BKUIPearlEnrollView initWithVideoCaptureSession:inSheet:squareNeedsPositionLayout:](v3, "initWithVideoCaptureSession:inSheet:squareNeedsPositionLayout:", v4, -[BKUIPearlEnrollViewController inSheet](self, "inSheet"), 0);
  -[BKUIPearlEnrollViewController setEnrollView:](self, "setEnrollView:", v5);

  -[BKUIPearlEnrollViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preEnrollActivate");

  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isZoomEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12)
      v13 = 480.0;
    else
      v13 = 384.000006;
  }
  else
  {

    v13 = 480.0;
  }
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController setEnrollViewHeightConstraint:](self, "setEnrollViewHeightConstraint:", v16);

  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController setEnrollViewTopConstraint:](self, "setEnrollViewTopConstraint:", v22);

  -[BKUIPearlEnrollViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v25 = v24;
  -[BKUIPearlEnrollViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v28 = v27;

  v29 = -[BKUIButtonTray initWithFrame:]([BKUIButtonTray alloc], "initWithFrame:", 0.0, 0.0, v25, v28);
  v30 = -[BKUIButtonTray initWithFrame:]([BKUIButtonTray alloc], "initWithFrame:", 0.0, 0.0, v25, v28);
  if (-[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration") != 4)
  {
    -[BKUIButtonTray nextStateButton](v30, "nextStateButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAlpha:", 1.0);

  }
  v32 = [BKUIPearlEnrollViewBottomContainer alloc];
  inBuddy = self->_inBuddy;
  v132 = v29;
  v34 = -[BKUIContainerScrollView initWithFrame:buttonTray:]([BKUIContainerScrollView alloc], "initWithFrame:buttonTray:", v29, 0.0, 0.0, v25, v28);
  v131 = v30;
  v35 = -[BKUIContainerScrollView initWithFrame:buttonTray:]([BKUIContainerScrollView alloc], "initWithFrame:buttonTray:", v30, 0.0, 0.0, v25, v28);
  v36 = -[BKUIPearlEnrollViewBottomContainer initWithFrame:inBuddy:scrollView:overlapScrollView:delegate:squareNeedsPositionLayout:](v32, "initWithFrame:inBuddy:scrollView:overlapScrollView:delegate:squareNeedsPositionLayout:", inBuddy, v34, v35, self, 0, 0.0, 0.0, v25, v28);
  -[BKUIPearlEnrollViewController setBottomContainer:](self, "setBottomContainer:", v36);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "userInterfaceIdiom");

  v39 = 0x1E0C99000;
  if ((v38 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v40 = objc_alloc_init(MEMORY[0x1E0CEA710]);
    -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setInstructionBaselineLayoutGuide:", v40);

    -[BKUIPearlEnrollViewController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "instructionBaselineLayoutGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addLayoutGuide:", v44);

    if (-[BKUIPearlEnrollViewController isDisplayZoomEnabled](self, "isDisplayZoomEnabled"))
      v45 = 0.64;
    else
      v45 = 0.62;
    -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "instructionBaselineLayoutGuide");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "heightAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController view](self, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "heightAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:multiplier:", v50, v45);
    v51 = objc_claimAutoreleasedReturnValue();

    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "heightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController view](self, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "widthAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[BKUIPearlEnrollViewController inSheet](self, "inSheet");
    v57 = 1.0;
    if (v56)
      v57 = 0.75;
    objc_msgSend(v53, "constraintEqualToAnchor:multiplier:", v55, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController setEnrollViewHeightConstraint:](self, "setEnrollViewHeightConstraint:", v58);

    v59 = objc_alloc_init(MEMORY[0x1E0CEA710]);
    -[BKUIPearlEnrollViewController view](self, "view");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addLayoutGuide:", v59);

    objc_msgSend(v59, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController view](self, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setActive:", 1);

    v128 = v59;
    objc_msgSend(v59, "heightAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController view](self, "view");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "heightAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:multiplier:", v67, 0.07);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setActive:", 1);

    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController setEnrollViewTopConstraint:](self, "setEnrollViewTopConstraint:", v72);

    v73 = (void *)MEMORY[0x1E0CB3718];
    -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "instructionBaselineLayoutGuide");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "topAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController view](self, "view");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v135[0] = v79;
    v135[1] = v51;
    v80 = (void *)v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 2);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v73;
    v39 = 0x1E0C99000uLL;
    objc_msgSend(v82, "activateConstraints:", v81);

  }
  v120 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlEnrollViewController enrollViewHeightConstraint](self, "enrollViewHeightConstraint");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = v129;
  -[BKUIPearlEnrollViewController enrollViewTopConstraint](self, "enrollViewTopConstraint");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v126;
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "widthAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController view](self, "view");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "widthAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "constraintEqualToAnchor:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v134[2] = v85;
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "centerXAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController view](self, "view");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "centerXAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v134[3] = v90;
  objc_msgSend(*(id *)(v39 + 3360), "arrayWithObjects:count:", v134, 4);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "activateConstraints:", v91);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v84) = objc_msgSend(v92, "bkui_IsInternalInstall");

  if ((_DWORD)v84)
  {
    v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_toggleDebugAndSave);
    objc_msgSend(v93, "setNumberOfTouchesRequired:", 3);
    -[BKUIPearlEnrollViewController view](self, "view");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "addGestureRecognizer:", v93);

  }
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[BKUIPearlEnrollViewController view](self, "view");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "addSubview:", v97);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v98, "userInterfaceIdiom");

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "topAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v99 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "instructionBaselineLayoutGuide");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "bottomAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "setActive:", 1);

  }
  else
  {
    -[BKUIPearlEnrollViewController getEnrollview](self, "getEnrollview");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "bottomAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:constant:", v103, -47.0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setActive:", 1);
  }

  v118 = (void *)MEMORY[0x1E0CB3718];
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "bottomAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController view](self, "view");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "bottomAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:", v123);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = v121;
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "leadingAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController view](self, "view");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "leadingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "constraintEqualToAnchor:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v133[1] = v108;
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "trailingAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController view](self, "view");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "trailingAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "constraintEqualToAnchor:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v133[2] = v113;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 3);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "activateConstraints:", v114);

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setupInitialUI");

  -[BKUIPearlEnrollViewController _updateLeftBarButtonItem](self, "_updateLeftBarButtonItem");
  -[BKUIPearlEnrollViewController forceDarkBackground:animated:](self, "forceDarkBackground:animated:", 1, 1);
  -[BKUIPearlEnrollViewController buttonTray](self, "buttonTray");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "updateButtonLayout");

}

- (BKUIPearlInstructionView)instructionView
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "instructionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BKUIPearlInstructionView *)v3;
}

- (BKUIPearlEnrollView)enrollView
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return self->_enrollView;
}

- (BKUIPearlEnrollViewBottomContainer)bottomContainer
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return self->_bottomContainer;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  float v14;
  double v15;
  void *v16;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)BKUIPearlEnrollViewController;
  -[BKUIPearlEnrollViewController viewDidLayoutSubviews](&v17, sel_viewDidLayoutSubviews);
  -[BKUIPearlEnrollViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UILabel frame](self->_debugLabel, "frame");
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_debugLabel, "textRectForBounds:limitedToNumberOfLines:", 3, 0.0, 0.0, v9 * 0.9, 1.79769313e308);
  v13 = v12;
  v14 = (v9 - v9 * 0.9) * 0.5;
  v15 = floorf(v14);
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  -[UILabel setFrame:](self->_debugLabel, "setFrame:", v15, CGRectGetMaxY(v18) - v13 + -10.0, v9 * 0.9, v13);
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNeedsLayout");

}

- (void)_updateLeftBarButtonItem
{
  int state;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  state = self->_state;
  if (state == 10)
  {
    -[BKUIPearlEnrollViewController parentViewController](self, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", 0);

    -[BKUIPearlEnrollViewController parentViewController](self, "parentViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidesBackButton:", 1);
  }
  else
  {
    if (state == 9)
    {
      v4 = objc_alloc(MEMORY[0x1E0CEA380]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_1EA281248, CFSTR("Pearl-periocular"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 0, self, sel_returnToEnroll);

      objc_msgSend(v11, "_setShowsBackButtonIndicator:", 1);
    }
    else
    {
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelEnroll);
    }
    -[BKUIPearlEnrollViewController parentViewController](self, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftBarButtonItem:", v11);

  }
}

- (int64_t)preferredStatusBarStyle
{
  return self->_darkBackground;
}

- (id)_nextStateButtonTitleForState:(int)a3
{
  return -[BKUIPearlEnrollViewController _nextStateButtonTitleForState:subState:](self, "_nextStateButtonTitleForState:subState:", *(_QWORD *)&a3, self->_substate);
}

- (id)_nextStateButtonTitleForState:(int)a3 subState:(int)a4
{
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  _BOOL4 v20;
  void *v21;
  void *v22;
  int v23;
  int v24;

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "supportsPeriocularEnrollment"))
    v8 = -[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration") != 0;
  else
    v8 = 0;

  v9 = 0;
  switch(a3)
  {
    case 2:
      if (a4 == 12)
        return 0;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("START_ENROLL");
      goto LABEL_36;
    case 6:
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "supportsPeriocularEnrollment"))
      {
        v14 = -[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration");

        if (v14 == 1)
          return 0;
      }
      else
      {

      }
      goto LABEL_35;
    case 8:
      if (!-[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration"))
      {
        v16 = 1;
        if (v8)
          goto LABEL_24;
LABEL_30:
        v24 = 0;
        goto LABEL_33;
      }
      if (!-[BKUIPearlEnrollViewController isFinalEnrollment](self, "isFinalEnrollment"))
      {
        v16 = 0;
        if (v8)
          goto LABEL_24;
        goto LABEL_30;
      }
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "glassesFound") ^ 1;

      if (!v8)
        goto LABEL_30;
LABEL_24:
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "glassesFound"))
      {
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "glassesFound");
        if (a4 == 15)
          v24 = 0;
        else
          v24 = v23;

      }
      else
      {
        v24 = 1;
      }

LABEL_33:
      if (((v16 | v24) & 1) != 0)
        return 0;
LABEL_35:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("CONTINUE");
LABEL_36:
      objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1EA281248, CFSTR("Pearl-periocular"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return v9;
    case 9:
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "glassesFound") & 1) != 0)
      {
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          goto LABEL_35;
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("USE_PARTIAL_CAPTURE");
      goto LABEL_36;
    case 10:
      v20 = -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v20)
        v12 = CFSTR("FINISH_ENROLL_BUTTON_BUDDY");
      else
        v12 = CFSTR("FINISH_ENROLL_BUTTON_SETTINGS");
      goto LABEL_36;
    default:
      return v9;
  }
}

- (id)_escapeHatchTitleForState:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v26;
  int v27;

  v3 = *(_QWORD *)&a3;
  if (self->_state == 9)
  {
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "glassesFound"))
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "enrollOperation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == 0;

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  if ((_DWORD)v3 == 3)
  {
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "shouldShowRetryUI") & 1) != 0)
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "glassesEnforcementError");

      if (v12)
      {
LABEL_23:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("GLASSES_ENROLL_SKIP");
        goto LABEL_24;
      }
    }
    else
    {

    }
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldShowRetryUI");

    if (v14)
      goto LABEL_17;
  }
  if (objc_msgSend((id)objc_opt_class(), "_shouldShowEscapeHatchForState:inBuddy:", v3, -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy")))
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("SET_UP_LATER_IN_SETTINGS");
  }
  else
  {
    v18 = (void *)objc_opt_class();
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "poseStatus");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "_shouldShowAccessibilityOptionForState:poseStatus:", v3, v20) & 1) != 0)
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bioKitCompletionPercentage");
      v23 = v22;

      if (v23 >= 1.0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("ACCESSIBILITY_OPTIONS");
        goto LABEL_24;
      }
    }
    else
    {

    }
    if (v9 || (_DWORD)v3 == 8 && -[BKUIPearlEnrollViewController substate](self, "substate") == 15)
      goto LABEL_23;
    if (-[BKUIPearlEnrollViewController state](self, "state") != 10
      || (-[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v26, "showAddGlassesButton"),
          v26,
          !v27))
    {
      v24 = 0;
      return v24;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("ADD_GLASSES");
  }
LABEL_24:
  objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1EA281248, CFSTR("Pearl-periocular"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4
{
  -[BKUIPearlEnrollViewController prepareForAnimationToState:fromState:subState:advancing:](self, "prepareForAnimationToState:fromState:subState:advancing:");
}

- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6
{
  void *v6;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[2];

  v8 = *(_QWORD *)&a3;
  v34[1] = *MEMORY[0x1E0C80C00];
  -[BKUIPearlEnrollViewController prepareBottomContainerForAnimationToState:fromState:subState:advancing:](self, "prepareBottomContainerForAnimationToState:fromState:subState:advancing:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  if (a4 == 8 || a4 == 6)
  {
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEnrollmentAugmentationOnly") & 1) == 0)
      -[BKUIPearlEnrollViewController state](self, "state");
  }
  if (a4 == 8 || a4 == 6)

  -[BKUIPearlEnrollViewController _nextStateButtonTitleForState:](self, "_nextStateButtonTitleForState:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[BKUIPearlEnrollViewController nextStateButton](self, "nextStateButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:forState:", v10, 0);

    -[BKUIPearlEnrollViewController nextStateButton](self, "nextStateButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((_DWORD)v8 == 10)
      v14 = CFSTR("Done");
    else
      v14 = 0;
    objc_msgSend(v12, "setAccessibilityIdentifier:", v14);

  }
  -[BKUIPearlEnrollViewController escapeHatchButton](self, "escapeHatchButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController _escapeHatchTitleForState:](self, "_escapeHatchTitleForState:", self->_state);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:forState:", v16, 0);

  -[BKUIPearlEnrollViewController nextStateButton](self, "nextStateButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  -[BKUIPearlEnrollViewController escapeHatchButton](self, "escapeHatchButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[BKUIPearlEnrollViewController escapeHatchButton](self, "escapeHatchButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v21);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = v19;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v27, "setNeedsLayout", (_QWORD)v29);
        objc_msgSend(v27, "layoutIfNeeded");
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v24);
  }

  -[BKUIPearlEnrollViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNeedsLayout");

}

- (void)prepareBottomContainerForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  id v12;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "prepareForAnimationToState:fromState:subState:advancing:parentView:", v9, v8, v7, v6, v11);

}

- (void)_setState:(int)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSDate *v11;
  NSDate *stateStart;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  void *v22;
  _QWORD block[5];
  id v24;
  _QWORD v25[5];
  NSObject *v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  id v31;
  int v32;
  uint8_t buf[16];
  uint64_t v34;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  _BKUILoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl(&dword_1DB281000, v9, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Set state %i", buf, 8u);
  }

  if (self->_state != (_DWORD)v6)
  {
    v10 = dispatch_group_create();
    self->_previousState = self->_state;
    -[BKUIPearlEnrollViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
    self->_state = v6;
    -[BKUIPearlEnrollViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    stateStart = self->_stateStart;
    self->_stateStart = v11;

    objc_initWeak((id *)buf, self);
    dispatch_group_enter(v10);
    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke;
    v28[3] = &unk_1EA280960;
    v32 = v6;
    objc_copyWeak(&v31, (id *)buf);
    v16 = v13;
    v29 = v16;
    v17 = v10;
    v30 = v17;
    objc_msgSend(v14, "setState:completion:", v6, v28);

    if ((_DWORD)v6 != 3 || self->_previousState == 8)
      self->_substate = 0;
    self->_substatePending = 0;
    -[NSTimer invalidate](self->_substateDelayTimer, "invalidate");
    -[BKUIPearlEnrollViewController prepareForAnimationToState:fromState:](self, "prepareForAnimationToState:fromState:", v6, self->_previousState);
    if (v5)
      self->_animatingState = 1;
    -[BKUIPearlEnrollViewController _updateLeftBarButtonItem](self, "_updateLeftBarButtonItem");
    if ((_DWORD)v6 != 3 || self->_previousState == 4)
    {
      -[BKUIPearlEnrollViewController audioManager](self, "audioManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "triggerSoundHapticForTransitionToState:fromState:", v6, self->_previousState);

    }
    dispatch_group_enter(v17);
    v19 = MEMORY[0x1E0CEABB0];
    if (v5)
      v20 = 0.3;
    else
      v20 = 0.0;
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_2;
    v27[3] = &unk_1EA27FB98;
    v27[4] = self;
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_3;
    v25[3] = &unk_1EA280988;
    v25[4] = self;
    v21 = v17;
    v26 = v21;
    +[UIView bkui_animateWithDuration:delay:options:animations:completion:](v20, 0.15, v19, 0, v27, v25);
    if ((_DWORD)v6 == 10)
    {
      -[BKUIPearlEnrollViewController forceDarkBackground:animated:](self, "forceDarkBackground:animated:", 0, 1);
      if (!+[BKUIUtils containerEnrollmentStyleEnabled](BKUIUtils, "containerEnrollmentStyleEnabled"))
      {
        -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "postEnrollDeActivate");

      }
      -[BKUIPearlEnrollViewController animateToSuccessCompletionLayout:](self, "animateToSuccessCompletionLayout:", -[BKUIPearlEnrollViewController interfaceOrientation](self, "interfaceOrientation"));
    }
    if (v8)
    {
      block[0] = v15;
      block[1] = 3221225472;
      block[2] = __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_4;
      block[3] = &unk_1EA2800F8;
      block[4] = self;
      v24 = v8;
      dispatch_group_notify(v21, MEMORY[0x1E0C80D38], block);

    }
    objc_destroyWeak(&v31);

    objc_destroyWeak((id *)buf);
  }

}

void __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (*(_DWORD *)(a1 + 56) == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setState:animated:", 2, 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  if (*(_DWORD *)(a1 + 56) == 10
    && +[BKUIUtils containerEnrollmentStyleEnabled](BKUIUtils, "containerEnrollmentStyleEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "postEnrollDeActivate");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animateInstruction");
}

void __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1048) = 0;
  objc_msgSend(*(id *)(a1 + 32), "finalizeInstructionAnimation");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "contentSize");
  v3 = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "frame");
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "contentInset");
  v7 = v5 - v6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "contentInset");
  if (v3 > v7 - v8)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "flashScrollIndicators");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setSubstate:(int)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v7;
  int v8;
  BOOL v9;
  uint64_t substate;
  unsigned int state;
  BOOL v12;
  int v13;
  BOOL v14;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  id v22;
  _QWORD v23[5];
  id v24;
  BOOL v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  _BKUILoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v29 = v5;
    _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Set substate %i", buf, 8u);
  }

  self->_pendingSubstate = 0;
  self->_substatePending = 0;
  if ((v5 & 0xFFFFFFFE) == 0xE)
  {
    v8 = 1;
  }
  else
  {
    if ((_DWORD)v5)
      v9 = 0;
    else
      v9 = self->_state == 8;
    v8 = v9;
  }
  substate = self->_substate;
  if ((_DWORD)substate != (_DWORD)v5 && !self->_suspended)
  {
    state = self->_state;
    v12 = state > 7;
    v13 = (1 << state) & 0xB8;
    v14 = v12 || v13 == 0;
    if (!v14 || v8 != 0)
    {
      self->_substate = v5;
      -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setNudgesPaused:", self->_substate != 0);

      -[BKUIPearlEnrollViewController audioManager](self, "audioManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "triggerSoundHapticForTransitionToSubstate:fromSubstate:", v5, substate);

      -[BKUIPearlEnrollViewController instructionView](self, "instructionView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x1E0CEABB0];
      if (v4)
        v20 = 0.15;
      else
        v20 = 0.0;
      v21 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke;
      v26[3] = &unk_1EA27FB98;
      v27 = v18;
      v23[0] = v21;
      v23[1] = 3221225472;
      v23[2] = __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke_2;
      v23[3] = &unk_1EA2809B0;
      v25 = v4;
      v23[4] = self;
      v24 = v27;
      v22 = v27;
      +[UIView bkui_animateWithDuration:animations:completion:](v20, v19, v26, v23);

    }
  }
}

uint64_t __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "bottomContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateInstructionViewContentForState:substate:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1092), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1096));

  v3 = MEMORY[0x1E0CEABB0];
  if (*(_BYTE *)(a1 + 48))
    v4 = 0.15;
  else
    v4 = 0.0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke_3;
  v6[3] = &unk_1EA27FB98;
  v7 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:animations:completion:](v4, v3, v6, 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

uint64_t __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)setSubstate:(int)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  NSTimer *v11;
  NSTimer *substateDelayTimer;
  _QWORD v13[5];
  int v14;
  BOOL v15;
  uint8_t buf[4];
  double v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (self->_substatePending)
    v9 = 1064;
  else
    v9 = 1096;
  if (*(_DWORD *)((char *)&self->super.super.super.isa + v9) != a3)
  {
    _BKUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v17 = a5;
      v18 = 1024;
      v19 = v7;
      _os_log_impl(&dword_1DB281000, v10, OS_LOG_TYPE_DEFAULT, "Invalidating current substate timer and waiting %f to go to %u", buf, 0x12u);
    }

    self->_pendingSubstate = v7;
    self->_substatePending = 1;
    -[NSTimer invalidate](self->_substateDelayTimer, "invalidate");
    if (a5 == 0.0)
    {
      -[BKUIPearlEnrollViewController _setSubstate:animated:](self, "_setSubstate:animated:", v7, v6);
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __65__BKUIPearlEnrollViewController_setSubstate_animated_afterDelay___block_invoke;
      v13[3] = &unk_1EA2809D8;
      v13[4] = self;
      v14 = v7;
      v15 = v6;
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, a5);
      v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      substateDelayTimer = self->_substateDelayTimer;
      self->_substateDelayTimer = v11;

    }
  }
}

uint64_t __65__BKUIPearlEnrollViewController_setSubstate_animated_afterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSubstate:animated:", *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
}

- (void)setState:(int)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  uint64_t v6;
  int state;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18[2];
  int v19;
  _QWORD aBlock[5];
  id v21;
  int v22;
  BOOL v23;
  id location;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v6 = *(_QWORD *)&a3;
  state = self->_state;
  if (state)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = state;
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke;
    aBlock[3] = &unk_1EA280A00;
    aBlock[4] = self;
    v22 = v6;
    v23 = a4;
    objc_copyWeak(&v21, &location);
    v11 = _Block_copy(aBlock);
    -[BKUIPearlEnrollViewController workItemsManager](self, "workItemsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *((unsigned int *)v26 + 6);
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_3;
    v15[3] = &unk_1EA280A50;
    objc_copyWeak(v18, &location);
    v19 = v6;
    v18[1] = *(id *)&a5;
    v17 = &v25;
    v14 = v11;
    v16 = v14;
    objc_msgSend(v12, "submitWorkItemFor:startState:work:", v6, v13, v15);

    objc_destroyWeak(v18);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    -[BKUIPearlEnrollViewController _setState:animated:completion:](self, "_setState:animated:completion:", *(_QWORD *)&a3, a4, 0, a5);
  }
}

void __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 48);
  v4 = *(unsigned __int8 *)(a1 + 52);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_2;
  v5[3] = &unk_1EA27FD80;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "_setState:animated:completion:", v3, v4, v5);
  objc_destroyWeak(&v6);
}

void __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t *WeakRetained;
  dispatch_semaphore_t *v3;
  _DWORD *v4;
  void *v5;
  uint64_t v6;
  dispatch_semaphore_t *v7;

  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v7 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_semaphore_signal(WeakRetained[129]);
    v3 = v7;
  }
  v4 = *(_DWORD **)(a1 + 32);
  if (v4[273] == 6)
  {
    objc_msgSend(v4, "currentOperationHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEnrollmentAugmentationOnly"))
    {

LABEL_8:
      v3 = v7;
      goto LABEL_9;
    }
    v6 = objc_msgSend(*(id *)(a1 + 32), "enrollmentConfiguration");

    v3 = v7;
    if (v6)
    {
      -[dispatch_semaphore_t navigateToMidFlowPeriocularSplashScreenWithPrepareAction:completionAction:](v7, "navigateToMidFlowPeriocularSplashScreenWithPrepareAction:completionAction:", 0, 0);
      goto LABEL_8;
    }
  }
LABEL_9:

}

void __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  dispatch_time_t v3;
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  __int128 v7;
  _QWORD block[5];
  __int128 v9;
  int v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*((_DWORD *)WeakRetained + 273) != *(_DWORD *)(a1 + 64))
  {
    v3 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_4;
    block[3] = &unk_1EA280A28;
    block[4] = WeakRetained;
    v7 = *(_OWORD *)(a1 + 32);
    v4 = (id)v7;
    v9 = v7;
    v10 = *(_DWORD *)(a1 + 64);
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
    v5 = *((_QWORD *)WeakRetained + 129);
    v6 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v5, v6);

  }
}

void __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 1092);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v3 == *(_DWORD *)(v4 + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (*(_DWORD *)(a1 + 56) == 5)
  {
    *(_DWORD *)(v4 + 24) = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    _BKUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_DWORD *)(a1 + 56);
      v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v8[0] = 67109376;
      v8[1] = v6;
      v9 = 1024;
      v10 = v7;
      _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring state-startingState mismatch and moving to BKUIPearlEnrollStateInitialScanInProgress targetState:%i, startState:%i", (uint8_t *)v8, 0xEu);
    }

  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 1032));
  }
}

- (void)setState:(int)a3 animated:(BOOL)a4
{
  -[BKUIPearlEnrollViewController setState:animated:afterDelay:](self, "setState:animated:afterDelay:", *(_QWORD *)&a3, a4, 0.0);
}

- (void)clearPendingStateWorkItems
{
  id v2;

  -[BKUIPearlEnrollViewController workItemsManager](self, "workItemsManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllWorkItems");

}

- (void)toggleDebug
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  UILabel *debugLabel;
  id v8;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bkui_IsInternalInstall");

  if (v4)
  {
    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDebugOverlayVisible:", objc_msgSend(v6, "debugOverlayVisible") ^ 1);

    debugLabel = self->_debugLabel;
    -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setHidden:](debugLabel, "setHidden:", objc_msgSend(v8, "debugOverlayVisible") ^ 1);

  }
}

- (void)toggleDebugAndSave
{
  id v3;

  -[BKUIPearlEnrollViewController toggleDebug](self, "toggleDebug");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBool:forKey:", -[UILabel isHidden](self->_debugLabel, "isHidden") ^ 1, CFSTR("pearlDebugEnroll"));

}

- (void)_updateDebugLabel
{
  NSString *statusString;
  NSString *progressString;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  statusString = self->_statusString;
  if (statusString)
  {
    progressString = self->_progressString;
    if (progressString)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), statusString, progressString);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel text](self->_debugLabel, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

      if ((v7 & 1) == 0)
      {
        _BKUILoggingFacility();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v11 = v5;
          _os_log_impl(&dword_1DB281000, v8, OS_LOG_TYPE_DEFAULT, "Status update: %@", buf, 0xCu);
        }

        -[UILabel setText:](self->_debugLabel, "setText:", v5);
        -[BKUIPearlEnrollViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setNeedsLayout");

      }
    }
  }
}

- (void)setStatus:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_statusString) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_statusString, a3);
    -[BKUIPearlEnrollViewController _updateDebugLabel](self, "_updateDebugLabel");
  }

}

- (void)pearlEnrollControllerCompleted
{
  void *v3;
  char v4;
  id v5;

  -[BKUIPearlEnrollViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[BKUIPearlEnrollViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pearlEnrollControllerCompleted:", self);

  }
}

- (double)percentOfPillsCompleted
{
  void *v2;
  double v3;
  double v4;

  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "percentOfPillsCompleted");
  v4 = v3;

  return v4;
}

- (void)setInBuddy:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BKUIPearlEnrollViewController operationHandlers](self, "operationHandlers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setInbuddy:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  self->_inBuddy = v3;
}

- (void)enrollView:(id)a3 willNudgeInDirection:(unint64_t)a4 nudgeCount:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!self->_substate)
  {
    -[BKUIPearlEnrollViewController instructionView](self, "instructionView", a3, a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NUDGE_TEXT"), &stru_1EA281248, CFSTR("Pearl-periocular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInstruction:", v8);

    -[BKUIPearlEnrollViewController instructionView](self, "instructionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDetail:", &stru_1EA281248);

    -[BKUIPearlEnrollViewController view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

  }
}

- (void)enrollView:(id)a3 didNudgeInDirection:(unint64_t)a4 nudgeCount:(unint64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a3;
  if ((self->_state | 2) == 7 && !self->_substate)
  {
    v19 = v6;
    -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_instructionTextForState:substate:", self->_state, self->_substate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_detailTextForState:substate:", self->_state, self->_substate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[BKUIPearlEnrollViewController instructionView](self, "instructionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "instruction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v12) & 1) != 0)
    {
      -[BKUIPearlEnrollViewController instructionView](self, "instructionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "isEqualToString:", v14);

      if ((v15 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    -[BKUIPearlEnrollViewController instructionView](self, "instructionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInstruction:", v8);

    -[BKUIPearlEnrollViewController instructionView](self, "instructionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDetail:", v10);

    -[BKUIPearlEnrollViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsLayout");

LABEL_8:
    v6 = v19;
  }

}

- (void)setCustomInstructionString:(id)a3 forState:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomInstructionString:forState:", v6, v4);

}

- (void)setCustomDetailString:(id)a3 forState:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomDetailString:forState:", v6, v4);

}

- (void)didReachSmallNudgePeakForEnrollView:(id)a3
{
  id v3;

  -[BKUIPearlEnrollViewController audioManager](self, "audioManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playHaptic:withDelay:", 11095, 0.0);

}

- (void)didReachLargeNudgePeakForEnrollView:(id)a3
{
  id v3;

  -[BKUIPearlEnrollViewController audioManager](self, "audioManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playHaptic:withDelay:", 17239, 0.0);

}

- (void)setEnrollMovieViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[BKUIPearlEnrollViewController enrollView](self, "enrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMovieViewHidden:", v3);

}

- (void)cancelEnrollForRotationIfNeeded:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = MGGetProductType();
  if (v5 > 2619317133)
  {
    if (v5 == 2619317134)
      goto LABEL_7;
    v6 = 3241053352;
  }
  else
  {
    if (v5 == 555503454)
      goto LABEL_7;
    v6 = 2487868872;
  }
  if (v5 == v6)
  {
LABEL_7:
    if ((unint64_t)(a3 - 1) <= 2)
    {
      _BKUILoggingFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
        v8 = objc_claimAutoreleasedReturnValue();
        -[NSObject cancelEnrollForRotation](v8, "cancelEnrollForRotation");
        goto LABEL_17;
      }
      v9 = 134217984;
      v10 = a3;
LABEL_10:
      _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, "cancelEnrollForRotationIfNeeded: cancelling now for orientation: %ld", (uint8_t *)&v9, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  if ((unint64_t)(a3 - 2) < 3)
  {
    _BKUILoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v9 = 134217984;
    v10 = a3;
    goto LABEL_10;
  }
LABEL_15:
  _BKUILoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_1DB281000, v8, OS_LOG_TYPE_DEFAULT, "cancelEnrollForRotationIfNeeded: will not cancel for orientation: %ld", (uint8_t *)&v9, 0xCu);
  }
LABEL_17:

}

- (void)animateWithOrientation:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _BKUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "animateWithOrientation: will cancelEnrollForRotationIfNeeded with orientation: %lu", (uint8_t *)&v6, 0xCu);
  }

  -[BKUIPearlEnrollViewController cancelEnrollForRotationIfNeeded:](self, "cancelEnrollForRotationIfNeeded:", a3);
  if (-[BKUIPearlEnrollViewController state](self, "state") == 10)
    -[BKUIPearlEnrollViewController animateToSuccessCompletionLayout:](self, "animateToSuccessCompletionLayout:", a3);
}

- (void)animateToSuccessCompletionLayout:(int64_t)a3
{
  void *v4;
  id v5;

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[BKUIPearlEnrollViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (void)primeWithPasscode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCredential:", v4);

}

- (void)primeWithExternalizedAuthContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExternalizedAuthContext:", v4);

}

- (void)refreshEscapeHatchForCurrentState
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  char v12;
  id v13;

  -[BKUIPearlEnrollViewController escapeHatchButton](self, "escapeHatchButton");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollViewController _escapeHatchTitleForState:](self, "_escapeHatchTitleForState:", self->_state);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = &stru_1EA281248;
  v6 = v5;

  objc_msgSend(v13, "titleForState:", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_1EA281248;
  v10 = v9;

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "shouldShowRetryUI") & 1) != 0)
  {

LABEL_10:
    objc_msgSend(v13, "setTitle:forState:", v6, 0);
    -[BKUIPearlEnrollViewController updateButtonsVisibility](self, "updateButtonsVisibility");
    goto LABEL_11;
  }
  v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", v6);

  if ((v12 & 1) == 0)
    goto LABEL_10;
LABEL_11:

}

- (void)updateButtonsVisibility
{
  id v2;

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateButtonVisibility");

}

- (void)animateInstruction
{
  id v3;

  -[BKUIPearlEnrollViewController updateButtonsVisibility](self, "updateButtonsVisibility");
  -[BKUIPearlEnrollViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)transitionToSuccessFromPeriocularSplash
{
  __assert_rtn("-[BKUIPearlEnrollViewController transitionToSuccessFromPeriocularSplash]", "BKUIPearlEnrollViewController.m", 1141, "self.midFlowPeriocularSplashController");
}

void __72__BKUIPearlEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bringSubviewToFront:", v7);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOrigin:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  +[BKUIPearlEnrollAnimationManager sharedManager](BKUIPearlEnrollAnimationManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __72__BKUIPearlEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_2;
  v14 = &unk_1EA27FB98;
  v15 = v10;
  objc_msgSend(v9, "transitionTo:completion:");

}

uint64_t __72__BKUIPearlEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "midFlowPeriocularSplashController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeChildViewController:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)finalizeInstructionAnimation
{
  void *v3;
  BKUIPearlInstructionView *animatingInstructionView;
  void *v5;
  id v6;

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finalizeInstructionAnimation");

  -[BKUIPearlInstructionView removeFromSuperview](self->_animatingInstructionView, "removeFromSuperview");
  animatingInstructionView = self->_animatingInstructionView;
  self->_animatingInstructionView = 0;

  -[BKUIPearlEnrollViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[BKUIPearlEnrollViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (void)setExistingIdentity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentity:", v4);

}

- (void)_enableEnrollUI
{
  -[BKUIPearlEnrollViewController setState:animated:](self, "setState:animated:", 2, 0);
}

- (void)invalidateSubstateTimer
{
  -[NSTimer invalidate](self->_substateDelayTimer, "invalidate");
}

- (void)startEnroll
{
  id v2;

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startEnroll");

}

- (void)restartEnroll
{
  void *v3;
  double v4;
  double v5;

  if (-[BKUIPearlEnrollViewController state](self, "state") >= 3
    && -[BKUIPearlEnrollViewController state](self, "state") != 9
    && -[BKUIPearlEnrollViewController state](self, "state") != 8
    && -[BKUIPearlEnrollViewController state](self, "state") != 10)
  {
    -[BKUIPearlEnrollViewController getEnrollview](self, "getEnrollview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "percentOfPillsCompleted");
    v5 = v4;

    if (v5 < 1.0)
      -[BKUIPearlEnrollViewController _enableEnrollUI](self, "_enableEnrollUI");
  }
}

- (void)cancelEnroll
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (-[BKUIPearlEnrollViewController inBuddyGlassesFollowUp](self, "inBuddyGlassesFollowUp"))
  {
    -[BKUIPearlEnrollViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pearlEnrollViewController:finishedEnrollWithError:", self, 0);

    _BKUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "Pearl: Moving forward in buddy making current followup enrollment as skip. User has already enrolled Pearl + Perioular + Glasses", buf, 2u);
    }
  }
  else
  {
    _BKUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "Pearl: cancelEnroll", v7, 2u);
    }

    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelEnroll");

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.biometrickitui.pearl_enroll"), -1, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController endEnrollFlowWithError:](self, "endEnrollFlowWithError:", v4);
  }

}

- (void)returnToEnroll
{
  __assert_rtn("-[BKUIPearlEnrollViewController returnToEnroll]", "BKUIPearlEnrollViewController.m", 1216, "_state == BKUIPearlEnrollStatePartialCapture");
}

- (void)showMaskAndGlassesTutorialWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];

  v4 = a3;
  -[BKUIPearlEnrollViewController prepareForAnimationToState:fromState:subState:advancing:](self, "prepareForAnimationToState:fromState:subState:advancing:", 2, 2, 12, 1);
  self->_substate = 12;
  v5 = MEMORY[0x1E0CEABB0];
  v8 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke;
  v9[3] = &unk_1EA27FB98;
  v9[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke_2;
  v7[3] = &unk_1EA2802C0;
  v7[4] = self;
  v6 = v4;
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.3, 0.15, v5, 0, v9, v7);

}

uint64_t __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animateInstruction");
}

void __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "finalizeInstructionAnimation");
  objc_msgSend(*(id *)(a1 + 32), "nextStateButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_nextStateButtonTitleForState:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1092));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:forState:", v3, 0);

  objc_msgSend(*(id *)(a1 + 32), "escapeHatchButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_escapeHatchTitleForState:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1092));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", v5, 0);

  objc_msgSend(*(id *)(a1 + 32), "updateButtonsVisibility");
  v6 = dispatch_time(0, 1500000000);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke_3;
  v8[3] = &unk_1EA2800F8;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  dispatch_after(v6, MEMORY[0x1E0C80D38], v8);

}

uint64_t __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1096) = 0;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeGlassesUI
{
  unint64_t v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[5];

  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "supportsPeriocularEnrollment"))
  {
    v3 = -[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration");

    if (v3)
    {
      v4 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke;
      block[3] = &unk_1EA27FB98;
      block[4] = self;
      dispatch_after(v4, MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {

  }
}

void __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[4];
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "prepareForAnimationToState:fromState:subState:advancing:", 8, 7, 15, 1);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1096) = 15;
  objc_msgSend(*(id *)(a1 + 32), "nextStateButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_nextStateButtonTitleForState:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1092));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:forState:", v3, 0);

  objc_msgSend(*(id *)(a1 + 32), "escapeHatchButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_escapeHatchTitleForState:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1092));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", v5, 0);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke_2;
  v7[3] = &unk_1EA27FB98;
  v8 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke_3;
  v6[3] = &unk_1EA27FC00;
  v6[4] = v8;
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.3, 0.15, MEMORY[0x1E0CEABB0], 0, v7, v6);
}

uint64_t __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animateInstruction");
}

uint64_t __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finalizeInstructionAnimation");
  return objc_msgSend(*(id *)(a1 + 32), "updateButtonsVisibility");
}

- (void)enrollOperation:(id)a3 finishedWithIdentity:(id)a4 animateImmediately:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  dispatch_time_t v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  _QWORD aBlock[4];
  id v29;
  BKUIPearlEnrollViewController *v30;
  BOOL v31;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__BKUIPearlEnrollViewController_enrollOperation_finishedWithIdentity_animateImmediately___block_invoke;
  aBlock[3] = &unk_1EA280198;
  v11 = v9;
  v29 = v11;
  v30 = self;
  v31 = v5;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[BKUIPearlEnrollViewController isFinalEnrollment](self, "isFinalEnrollment")
    || -[BKUIPearlEnrollViewController state](self, "state") == 9
    && (!-[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration")
     || (-[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler"),
         v13 = (void *)objc_claimAutoreleasedReturnValue(),
         v14 = objc_msgSend(v13, "supportsPeriocularEnrollment"),
         v13,
         (v14 & 1) == 0)))
  {
    if (v5)
    {
      v12[2](v12);
    }
    else
    {
      v25 = dispatch_time(0, 400000000);
      v26[0] = v10;
      v26[1] = 3221225472;
      v26[2] = __89__BKUIPearlEnrollViewController_enrollOperation_finishedWithIdentity_animateImmediately___block_invoke_153;
      v26[3] = &unk_1EA280080;
      v27 = v12;
      dispatch_after(v25, MEMORY[0x1E0C80D38], v26);

    }
  }
  else
  {
    -[BKUIPearlEnrollViewController operationHandlers](self, "operationHandlers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[BKUIPearlEnrollViewController operationHandlers](self, "operationHandlers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectAtIndex:", 0);

    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIdentity:", v11);

    v19 = objc_msgSend(v16, "glassesFound");
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setGlassesFound:", v19);

    objc_msgSend(v16, "credential");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCredential:", v21);

    objc_msgSend(v16, "externalizedAuthContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setExternalizedAuthContext:", v23);

    if (-[BKUIPearlEnrollViewController isFinalEnrollment](self, "isFinalEnrollment")
      && -[BKUIPearlEnrollViewController enrollmentConfiguration](self, "enrollmentConfiguration"))
    {
      if (objc_msgSend(v11, "canAddPeriocularEnrollment")
        && objc_msgSend(v16, "glassesFound"))
      {
        -[BKUIPearlEnrollViewController removeGlassesUI](self, "removeGlassesUI");
      }
      else
      {
        -[BKUIPearlEnrollViewController enrollOperation:finishedWithIdentity:animateImmediately:](self, "enrollOperation:finishedWithIdentity:animateImmediately:", v8, v11, 0);
      }
    }

  }
}

void __89__BKUIPearlEnrollViewController_enrollOperation_finishedWithIdentity_animateImmediately___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _BKUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "getEnrollview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "percentOfPillsCompleted");
    v10 = 138412546;
    v11 = v3;
    v12 = 2048;
    v13 = v5;
    _os_log_impl(&dword_1DB281000, v2, OS_LOG_TYPE_DEFAULT, "Finished with identity: %@, UI complete = %f", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "setStatus:", CFSTR("Enroll completed"));
  objc_msgSend(*(id *)(a1 + 40), "currentOperationHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentity:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "pearlEnrollControllerCompleted");
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "getEnrollview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPillsHidden:", 0);

    v8 = 0.600000024;
    if (*(_BYTE *)(a1 + 48))
      v8 = 0.0;
  }
  else
  {
    v8 = 0.600000024;
  }
  objc_msgSend(*(id *)(a1 + 40), "setState:animated:afterDelay:", 10, 1, v8);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

}

uint64_t __89__BKUIPearlEnrollViewController_enrollOperation_finishedWithIdentity_animateImmediately___block_invoke_153(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isFinalEnrollment
{
  void *v2;
  BOOL v3;

  -[BKUIPearlEnrollViewController operationHandlers](self, "operationHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 1;

  return v3;
}

- (void)_handleEnrollStateOnAppear
{
  id v3;

  if (-[BKUIPearlEnrollViewController isGlassesEnrollmentOnly](self, "isGlassesEnrollmentOnly"))
  {
    -[BKUIPearlEnrollViewController setState:animated:](self, "setState:animated:", 3, 1);
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "matchUserForSecondPhaseEnrollmentWithCompletionAction:", 0);

  }
  else
  {
    -[BKUIPearlEnrollViewController setState:animated:](self, "setState:animated:", 2, 0);
  }
}

- (BOOL)hasPeriocularIdentityEnrolled
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "identitiesWithError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  if (v5)
  {
    _BKUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1DB281000, v6, OS_LOG_TYPE_DEFAULT, "BKUIPearl:hasPeriocularIdentityEnrolled Error fetching indentity :%@", buf, 0xCu);
    }
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_156);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count") != 0;

  }
  return v7;
}

uint64_t __62__BKUIPearlEnrollViewController_hasPeriocularIdentityEnrolled__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPeriocularEnrollment");
}

- (BOOL)showGlassesSkipUI
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  char v11;

  if (-[BKUIPearlEnrollViewController state](self, "state") == 3)
  {
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "shouldShowRetryUI"))
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "glassesEnforcementError");

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
  v6 = -[BKUIPearlEnrollViewController state](self, "state") == 8
    && -[BKUIPearlEnrollViewController substate](self, "substate") == 15;
  if (-[BKUIPearlEnrollViewController state](self, "state") > 6)
  {
    isKindOfClass = 0;
  }
  else
  {
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  if (self->_state == 9)
  {
    -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "glassesFound"))
    {
      -[BKUIPearlEnrollViewController currentOperationHandler](self, "currentOperationHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v11 = objc_opt_isKindOfClass();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  return (v11 | v5 | v6 | isKindOfClass) & 1;
}

- (UIButton)nextStateButton
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextStateButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (UIButton)escapeHatchButton
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bottomLinkButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (BKUIButtonTray)buttonTray
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewController bottomContainer](self, "bottomContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BKUIButtonTray *)v3;
}

- (UIView)nextStateButtonContainer
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewController buttonTray](self, "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextStateButtonContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIButton)retryMatchOperationButton
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewController buttonTray](self, "buttonTray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topLinkButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (BKUIPearlEnrollViewControllerDelegate)delegate
{
  return (BKUIPearlEnrollViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (BOOL)isDisplayZoomEnabled
{
  return self->_isDisplayZoomEnabled;
}

- (void)setIsDisplayZoomEnabled:(BOOL)a3
{
  self->_isDisplayZoomEnabled = a3;
}

- (BOOL)inBuddyGlassesFollowUp
{
  return self->_inBuddyGlassesFollowUp;
}

- (void)setInBuddyGlassesFollowUp:(BOOL)a3
{
  self->_inBuddyGlassesFollowUp = a3;
}

- (void)setButtonTray:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTray, a3);
}

- (NSLayoutConstraint)enrollViewHeightConstraint
{
  return self->_enrollViewHeightConstraint;
}

- (void)setEnrollViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_enrollViewHeightConstraint, a3);
}

- (NSString)progressString
{
  return self->_progressString;
}

- (void)setProgressString:(id)a3
{
  objc_storeStrong((id *)&self->_progressString, a3);
}

- (int)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(int)a3
{
  self->_previousState = a3;
}

- (BOOL)darkBackground
{
  return self->_darkBackground;
}

- (void)setDarkBackground:(BOOL)a3
{
  self->_darkBackground = a3;
}

- (NSLayoutConstraint)enrollViewTopConstraint
{
  return self->_enrollViewTopConstraint;
}

- (void)setEnrollViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_enrollViewTopConstraint, a3);
}

- (NSLayoutConstraint)nextStateButtonContainerBottomConstraintTall
{
  return self->_nextStateButtonContainerBottomConstraintTall;
}

- (void)setNextStateButtonContainerBottomConstraintTall:(id)a3
{
  objc_storeStrong((id *)&self->_nextStateButtonContainerBottomConstraintTall, a3);
}

- (NSLayoutConstraint)nextStateButtonContainerBottomConstraintShort
{
  return self->_nextStateButtonContainerBottomConstraintShort;
}

- (void)setNextStateButtonContainerBottomConstraintShort:(id)a3
{
  objc_storeStrong((id *)&self->_nextStateButtonContainerBottomConstraintShort, a3);
}

- (NSLayoutConstraint)instructionViewTopConstraint
{
  return self->_instructionViewTopConstraint;
}

- (void)setInstructionViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_instructionViewTopConstraint, a3);
}

- (BKUIPearlInstructionView)animatingInstructionView
{
  return self->_animatingInstructionView;
}

- (void)setAnimatingInstructionView:(id)a3
{
  objc_storeStrong((id *)&self->_animatingInstructionView, a3);
}

- (NSArray)instructionViewConstraints
{
  return self->_instructionViewConstraints;
}

- (void)setInstructionViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_instructionViewConstraints, a3);
}

- (BKUIPearlEnrollAudioManager)audioManager
{
  return self->_audioManager;
}

- (void)setAudioManager:(id)a3
{
  objc_storeStrong((id *)&self->_audioManager, a3);
}

- (UILayoutGuide)instructionBaselineLayoutGuide
{
  return self->_instructionBaselineLayoutGuide;
}

- (void)setInstructionBaselineLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_instructionBaselineLayoutGuide, a3);
}

- (_TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager)workItemsManager
{
  return self->_workItemsManager;
}

- (void)setWorkItemsManager:(id)a3
{
  objc_storeStrong((id *)&self->_workItemsManager, a3);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (BKUIAnalyticsManager)analyticsManager
{
  return (BKUIAnalyticsManager *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setAnalyticsManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (void)setBottomContainer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomContainer, a3);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (int)substate
{
  return self->_substate;
}

- (void)setSubstate:(int)a3
{
  self->_substate = a3;
}

- (BKUIPeriocularEnableSplashViewController)midFlowPeriocularSplashController
{
  return self->_midFlowPeriocularSplashController;
}

- (void)setMidFlowPeriocularSplashController:(id)a3
{
  objc_storeStrong((id *)&self->_midFlowPeriocularSplashController, a3);
}

- (void)setRetryMatchOperationButton:(id)a3
{
  objc_storeStrong((id *)&self->_retryMatchOperationButton, a3);
}

- (void)setNextStateButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_nextStateButtonContainer, a3);
}

- (void)setNextStateButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextStateButton, a3);
}

- (void)setEscapeHatchButton:(id)a3
{
  objc_storeStrong((id *)&self->_escapeHatchButton, a3);
}

- (void)setEnrollView:(id)a3
{
  objc_storeStrong((id *)&self->_enrollView, a3);
}

- (NSMutableArray)operationHandlers
{
  return self->_operationHandlers;
}

- (void)setOperationHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_operationHandlers, a3);
}

- (BKUIPearlEnrollControllerPreloadedState)preloadedState
{
  return self->_preloadedState;
}

- (void)setPreloadedState:(id)a3
{
  objc_storeStrong((id *)&self->_preloadedState, a3);
}

- (int64_t)glassesMidFlowUpsell
{
  return self->_glassesMidFlowUpsell;
}

- (void)setGlassesMidFlowUpsell:(int64_t)a3
{
  self->_glassesMidFlowUpsell = a3;
}

- (void)setInstructionView:(id)a3
{
  objc_storeStrong((id *)&self->_instructionView, a3);
}

- (BioStreamsEventHelper)bioStreamEventHelper
{
  return self->_bioStreamEventHelper;
}

- (void)setBioStreamEventHelper:(id)a3
{
  objc_storeStrong((id *)&self->_bioStreamEventHelper, a3);
}

- (BOOL)enrollmentAlreadyHasExistingPeriocularTemplate
{
  return self->_enrollmentAlreadyHasExistingPeriocularTemplate;
}

- (void)setEnrollmentAlreadyHasExistingPeriocularTemplate:(BOOL)a3
{
  self->_enrollmentAlreadyHasExistingPeriocularTemplate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bioStreamEventHelper, 0);
  objc_storeStrong((id *)&self->_instructionView, 0);
  objc_storeStrong((id *)&self->_preloadedState, 0);
  objc_storeStrong((id *)&self->_operationHandlers, 0);
  objc_storeStrong((id *)&self->_enrollView, 0);
  objc_storeStrong((id *)&self->_escapeHatchButton, 0);
  objc_storeStrong((id *)&self->_nextStateButton, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainer, 0);
  objc_storeStrong((id *)&self->_retryMatchOperationButton, 0);
  objc_storeStrong((id *)&self->_midFlowPeriocularSplashController, 0);
  objc_storeStrong((id *)&self->_bottomContainer, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_workItemsManager, 0);
  objc_storeStrong((id *)&self->_instructionBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_audioManager, 0);
  objc_storeStrong((id *)&self->_instructionViewConstraints, 0);
  objc_storeStrong((id *)&self->_animatingInstructionView, 0);
  objc_storeStrong((id *)&self->_instructionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainerBottomConstraintShort, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainerBottomConstraintTall, 0);
  objc_storeStrong((id *)&self->_enrollViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_progressString, 0);
  objc_storeStrong((id *)&self->_enrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_substateDelayTimer, 0);
  objc_storeStrong((id *)&self->_lastFaceFoundDate, 0);
  objc_storeStrong((id *)&self->_stateStart, 0);
  objc_storeStrong((id *)&self->_stateSema, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_buttonTrayToNextStateButtonContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_lightTrayBackdrop, 0);
  objc_storeStrong((id *)&self->_darkTrayBackdrop, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainerHorizontalPositionConstraint, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DB281000, log, OS_LOG_TYPE_FAULT, "should always have midFlowPeriocularSplashShowing in side of this flow.", v1, 2u);
}

@end
