@implementation PKWelcomeController

- (PKWelcomeController)initWithTiledView:(id)a3
{
  id v3;
  PKWelcomeController *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKWelcomeController;
  v3 = a3;
  v4 = -[PKWelcomeController init](&v8, sel_init);
  objc_storeWeak((id *)&v4->_tiledView, v3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_toolPickerDidShow, CFSTR("PKToolPickerDidShowNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_didEnterBackground, *MEMORY[0x1E0DC4768], 0);

  return v4;
}

- (void)didEnterBackground
{
  LOBYTE(_MergedGlobals_150) = 0;
}

- (void)toolPickerDidShow
{
  id v2;

  +[PKHandwritingEducationPaneSettings sharedInstance]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKHandwritingEducationPaneSettings userHasDrawn](v2);

}

- (void)showPencilEducationPane
{
  void *v3;
  _BOOL4 User;
  void *v5;
  char v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  if ((_MergedGlobals_150 & 1) == 0 && !HIBYTE(_MergedGlobals_150))
  {
    LOBYTE(_MergedGlobals_150) = 1;
    +[PKHandwritingEducationPaneSettings sharedInstance]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    User = -[PKHandwritingEducationPaneSettings isCurrentSystemVersionEqualToLastUserDrawn]((uint64_t)v3);

    if (User)
    {
      +[PKHandwritingEducationPaneSettings sharedInstance]();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PKHandwritingEducationPaneSettings hasSeenPane]((uint64_t)v5);

      if (PKIsPadDevice()
        && CHGetPersonalizedSynthesisSupportState() >= 2
        && PKCurrentAppSupportsRefinement()
        && (v7 = objc_msgSend((id)objc_opt_class(), "hasAutoRefineLocaleEnabled"), (v6 & 1) == 0)
        && v7)
      {
        v35 = 0;
        v36 = &v35;
        v37 = 0x2050000000;
        v8 = (void *)qword_1ECEE64B0;
        v38 = qword_1ECEE64B0;
        if (!qword_1ECEE64B0)
        {
          v30 = MEMORY[0x1E0C809B0];
          v31 = 3221225472;
          v32 = __getPNPWelcomeControllerClass_block_invoke;
          v33 = &unk_1E7777068;
          v34 = &v35;
          __getPNPWelcomeControllerClass_block_invoke((uint64_t)&v30);
          v8 = (void *)v36[3];
        }
        v9 = objc_retainAutorelease(v8);
        _Block_object_dispose(&v35, 8);
        objc_msgSend(v9, "controllerWithType:buttonType:deviceType:delegate:", 8, 0, 0, self);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v10);
        v35 = 0;
        v36 = &v35;
        v37 = 0x2050000000;
        v12 = (void *)qword_1ECEE64B8;
        v38 = qword_1ECEE64B8;
        if (!qword_1ECEE64B8)
        {
          v30 = MEMORY[0x1E0C809B0];
          v31 = 3221225472;
          v32 = __getPNPWizardViewControllerClass_block_invoke;
          v33 = &unk_1E7777068;
          v34 = &v35;
          __getPNPWizardViewControllerClass_block_invoke((uint64_t)&v30);
          v12 = (void *)v36[3];
        }
        v13 = objc_retainAutorelease(v12);
        _Block_object_dispose(&v35, 8);
        objc_msgSend(v13, "preferredContentSize");
        v15 = v14;
        v17 = v16;
        objc_msgSend(v11, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "widthAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToConstant:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setActive:", 1);

        objc_msgSend(v11, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "heightAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constraintEqualToConstant:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setActive:", 1);

        objc_msgSend(v11, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "layer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setCornerRadius:", 16.0);

        objc_msgSend(v11, "setModalPresentationStyle:", 2);
        -[PKWelcomeController tiledView](self, "tiledView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "window");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "rootViewController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "presentModalViewController:withTransition:", v11, 3);

        +[PKHandwritingEducationPaneSettings sharedInstance]();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKHandwritingEducationPaneSettings setHasSeenPane:]((uint64_t)v29, 1);

        HIBYTE(_MergedGlobals_150) = 1;
      }
      else
      {
        HIBYTE(_MergedGlobals_150) = v6;
      }
    }
  }
}

+ (void)resetEducationPane
{
  void *v2;

  +[PKSettingsDaemon setAutoRefineEnabled:](PKSettingsDaemon, "setAutoRefineEnabled:", 0);
  +[PKHandwritingEducationPaneSettings sharedInstance]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHandwritingEducationPaneSettings setHasSeenPane:]((uint64_t)v2, 0);

  _MergedGlobals_150 = 0;
}

- (void)handwritingEducationDoneButtonPressed:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PKWelcomeController tiledView](self, "tiledView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissModalViewControllerWithTransition:", 7);

}

- (void)welcomeControllerButtonDidPress:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PKWelcomeController tiledView](self, "tiledView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissModalViewControllerWithTransition:", 7);

}

- (PKTiledView)tiledView
{
  return (PKTiledView *)objc_loadWeakRetained((id *)&self->_tiledView);
}

- (void)setTiledView:(id)a3
{
  objc_storeWeak((id *)&self->_tiledView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tiledView);
}

@end
