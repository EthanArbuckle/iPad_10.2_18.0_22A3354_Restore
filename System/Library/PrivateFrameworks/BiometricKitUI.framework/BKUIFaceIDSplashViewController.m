@implementation BKUIFaceIDSplashViewController

- (id)initInBuddy:(BOOL)a3 isDemo:(BOOL)a4 bkDevice:(id)a5 withEndEnrollmentActionPrimary:(id)a6 enrollmentActionSecondary:(id)a7
{
  return -[BKUIFaceIDSplashViewController initInBuddy:bkDevice:withEndEnrollmentActionPrimary:enrollmentActionSecondary:](self, "initInBuddy:bkDevice:withEndEnrollmentActionPrimary:enrollmentActionSecondary:", a3, a5, a6, a7);
}

- (id)initInBuddy:(BOOL)a3 bkDevice:(id)a4 withEndEnrollmentActionPrimary:(id)a5 enrollmentActionSecondary:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  BKUIFaceIDSplashViewController *v16;
  void *v17;
  id endEnrollActionPrimary;
  void *v19;
  id endEnrollActionSecondary;
  void *v21;
  void *v22;
  objc_super v24;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FACE_ID"), &stru_1EA281248, CFSTR("Pearl"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)BKUIFaceIDSplashViewController;
  v16 = -[BKUIFaceIDSplashViewController initWithTitle:detailText:icon:contentLayout:](&v24, sel_initWithTitle_detailText_icon_contentLayout_, v15, &stru_1EA281248, 0, 3);

  if (v16)
  {
    v16->_inBuddy = a3;
    v17 = _Block_copy(v12);
    endEnrollActionPrimary = v16->_endEnrollActionPrimary;
    v16->_endEnrollActionPrimary = v17;

    v19 = _Block_copy(v13);
    endEnrollActionSecondary = v16->_endEnrollActionSecondary;
    v16->_endEnrollActionSecondary = v19;

    objc_storeStrong((id *)&v16->_device, a4);
    -[BKUIFaceIDSplashViewController headerView](v16, "headerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTintColor:", v22);

  }
  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)BKUIFaceIDSplashViewController;
  -[OBBaseWelcomeController viewDidLoad](&v34, sel_viewDidLoad);
  -[BKUIFaceIDSplashViewController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrivacyLinkForBundles:", &unk_1EA298968);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65128]), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 1"), CFSTR("Dark 1"), 0.01, 1.0);
  v35[0] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65128]), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("State 2"), CFSTR("Dark 2"), 1.5, 0.8);
  v35[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D65120]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("FaceID"), CFSTR("ca"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIFaceIDSplashViewController headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "animationView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithUrlToPackage:animationView:animatedStates:startAtFirstState:", v9, v11, v6, v12);
  -[BKUIFaceIDSplashViewController setAnimationController:](self, "setAnimationController:", v13);

  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v14, "isN69");

  if ((_DWORD)v13)
    v15 = 0.0333333333;
  else
    v15 = 0.0666666667;
  -[BKUIFaceIDSplashViewController headerView](self, "headerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "animationView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "defaultScale");
  v19 = v15 + v18;
  -[BKUIFaceIDSplashViewController headerView](self, "headerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "animationView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setScale:", v19);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA281248, CFSTR("Pearl"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitle:forState:", v24, 0);

  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__didSelectEnroll, 64);
  -[BKUIFaceIDSplashViewController buttonTray](self, "buttonTray");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addButton:", v22);

  if (!-[BKUIFaceIDSplashViewController inBuddy](self, "inBuddy"))
  {
    -[BKUIFaceIDSplashViewController headerView](self, "headerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FACE_ID_DETAIL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", v28, &stru_1EA281248, CFSTR("Pearl"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDetailText:", v29);

  }
  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER"), &stru_1EA281248, CFSTR("Pearl"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTitle:forState:", v32, 0);

  objc_msgSend(v30, "addTarget:action:forControlEvents:", self, sel__didSelectSkip, 64);
  -[BKUIFaceIDSplashViewController buttonTray](self, "buttonTray");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addButton:", v30);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIFaceIDSplashViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[BKUIFaceIDSplashViewController animationController](self, "animationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimation");

}

- (void)_didSelectEnroll
{
  void *v3;
  void (**v4)(void);

  -[BKUIFaceIDSplashViewController endEnrollActionPrimary](self, "endEnrollActionPrimary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BKUIFaceIDSplashViewController endEnrollActionPrimary](self, "endEnrollActionPrimary");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)_didSelectSkip
{
  void *v3;
  void (**v4)(void);

  -[BKUIFaceIDSplashViewController endEnrollActionSecondary](self, "endEnrollActionSecondary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BKUIFaceIDSplashViewController endEnrollActionSecondary](self, "endEnrollActionSecondary");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (OBTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (id)endEnrollActionPrimary
{
  return self->_endEnrollActionPrimary;
}

- (void)setEndEnrollActionPrimary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (id)endEnrollActionSecondary
{
  return self->_endEnrollActionSecondary;
}

- (void)setEndEnrollActionSecondary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (BKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong(&self->_endEnrollActionSecondary, 0);
  objc_storeStrong(&self->_endEnrollActionPrimary, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
}

@end
