@implementation DSFaceIDController

- (DSFaceIDController)init
{
  os_log_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DSFaceIDController *v11;
  objc_super v13;

  v3 = os_log_create("com.apple.DigitalSeparation", "DSBiometrics");
  v4 = (void *)DSLogBiometrics;
  DSLogBiometrics = (uint64_t)v3;

  v5 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithHierarchicalColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  DSUILocStringForKey(CFSTR("FACE_ID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("FACE_ID_DETAIL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("faceid"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)DSFaceIDController;
  v11 = -[DSFaceIDController initWithTitle:detailText:icon:](&v13, sel_initWithTitle_detailText_icon_, v8, v9, v10);

  return v11;
}

- (void)shouldShowWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  sharedWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__DSFaceIDController_shouldShowWithCompletion___block_invoke;
  block[3] = &unk_24EFF3898;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __47__DSFaceIDController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  _BOOL8 v5;
  uint8_t v6[16];

  if (objc_msgSend(MEMORY[0x24BE2CC70], "isFingerprintModificationRestricted"))
  {
    v2 = DSLogBiometrics;
    if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2278DF000, v2, OS_LOG_TYPE_INFO, "Cannot reset FaceID due to device restrictions", v6, 2u);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (+[DSFaceIDController hasAlternateAppearance](DSFaceIDController, "hasAlternateAppearance")
       || !+[DSFaceIDController isPearlEnrolled](DSFaceIDController, "isPearlEnrolled"))
      && +[DSFaceIDController supportsPearl](DSFaceIDController, "supportsPearl");
    return (*(uint64_t (**)(uint64_t, _BOOL8))(v4 + 16))(v4, v5);
  }
}

- (void)viewDidLoad
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DSFaceIDController;
  -[DSOBWelcomeController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = +[DSFaceIDController isPearlEnrolled](DSFaceIDController, "isPearlEnrolled");
  -[DSFaceIDController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    DSUILocStringForKey(CFSTR("FACE_ID_DETAIL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDetailText:", v5);

    DSUILocStringForKey(CFSTR("RESET_FACEID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = sel_resetFaceID;
  }
  else
  {
    DSUILocStringForKey(CFSTR("FACE_ID_ENROLL_DETAIL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDetailText:", v8);

    DSUILocStringForKey(CFSTR("CONTINUE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = sel_beginFaceIDEnrollment;
  }
  +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v6, self, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSFaceIDController setBoldButton:](self, "setBoldButton:", v9);

  DSUILocStringForKey(CFSTR("NOT_NOW"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSFaceIDController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", self, v10, v11, sel_pushNextPane);

}

+ (id)pearlIdentities
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  id v10;
  id v11;

  if (!objc_msgSend(a1, "supportsPearl"))
    return 0;
  v2 = (void *)MEMORY[0x24BE0CE08];
  objc_msgSend(MEMORY[0x24BE0CE18], "deviceDescriptorForType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "deviceWithDescriptor:error:", v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v10 = 0;
    objc_msgSend(v4, "identitiesForUser:error:", getuid(), &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
  }
  else
  {
    v7 = DSLogBiometrics;
    if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_ERROR))
      +[DSFaceIDController pearlIdentities].cold.1((uint64_t)v5, v7);
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isPearlEnrolled
{
  void *v2;
  void *v3;
  BOOL v4;

  +[DSFaceIDController pearlIdentities](DSFaceIDController, "pearlIdentities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "count") != 0;
  else
    v4 = 0;

  return v4;
}

+ (BOOL)hasAlternateAppearance
{
  void *v2;
  void *v3;
  BOOL v4;

  +[DSFaceIDController pearlIdentities](DSFaceIDController, "pearlIdentities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (unint64_t)objc_msgSend(v2, "count") > 1;
  else
    v4 = 0;

  return v4;
}

- (void)updateFaceIDPaneConfiguration
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char **v9;
  void *v10;
  id v11;

  v3 = +[DSFaceIDController isPearlEnrolled](DSFaceIDController, "isPearlEnrolled");
  -[DSFaceIDController boldButton](self, "boldButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  -[DSFaceIDController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    DSUILocStringForKey(CFSTR("FACE_ID_DETAIL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDetailText:", v6);

    -[DSFaceIDController boldButton](self, "boldButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("RESET_FACEID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v8, 0);
    v9 = &selRef_resetFaceID;
  }
  else
  {
    DSUILocStringForKey(CFSTR("FACE_ID_ENROLL_DETAIL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDetailText:", v10);

    -[DSFaceIDController boldButton](self, "boldButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("CONTINUE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v8, 0);
    v9 = &selRef_beginFaceIDEnrollment;
  }

  -[DSFaceIDController boldButton](self, "boldButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, *v9, 64);

}

- (void)resetFaceID
{
  if (objc_msgSend(MEMORY[0x24BE2CC98], "shouldShowBioRatchetFlow"))
    -[DSFaceIDController startRatchetEvalInPresentationContext:](self, "startRatchetEvalInPresentationContext:", self);
  else
    -[DSFaceIDController beginFaceIDEnrollment](self, "beginFaceIDEnrollment");
}

- (void)beginFaceIDEnrollment
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v3 = (void *)getBKUIPearlEnrollControllerClass_softClass;
  v18 = getBKUIPearlEnrollControllerClass_softClass;
  v4 = MEMORY[0x24BDAC760];
  if (!getBKUIPearlEnrollControllerClass_softClass)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getBKUIPearlEnrollControllerClass_block_invoke;
    v14[3] = &unk_24EFF3F88;
    v14[4] = &v15;
    __getBKUIPearlEnrollControllerClass_block_invoke((uint64_t)v14);
    v3 = (void *)v16[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v15, 8);
  v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "setEnrollmentConfiguration:", 0);
  -[DSFaceIDController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke;
  v11[3] = &unk_24EFF3F40;
  v11[4] = self;
  v12 = v6;
  v13 = v8;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v9, "evaluatePolicy:options:reply:", 1007, MEMORY[0x24BDBD1B8], v11);

}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD block[5];
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    objc_initWeak(&location, a1[4]);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_2;
    v11[3] = &unk_24EFF3F18;
    objc_copyWeak(&v14, &location);
    v12 = a1[5];
    v13 = a1[6];
    dispatch_async(MEMORY[0x24BDAC9B8], v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDDA908]))
  {
    v9 = objc_msgSend(v7, "code");

    if (v9 == -5)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_3;
      block[3] = &unk_24EFF33A0;
      block[4] = a1[4];
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_ERROR))
    __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_cold_1();
LABEL_9:

}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_2(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "deleteAllIdentities");
  v2 = a1[4];
  objc_msgSend(a1[5], "externalizedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primeWithExternalizedAuthContext:", v3);

  objc_msgSend(a1[4], "setDelegate:", WeakRetained);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", a1[4]);
  objc_msgSend(WeakRetained, "setFaceIDEnrollmentNavigationController:", v4);

  objc_msgSend(WeakRetained, "faceIDEnrollmentNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setModalPresentationStyle:", 0);

  objc_msgSend(WeakRetained, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "faceIDEnrollmentNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

  objc_msgSend(a1[4], "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BEBD410]);
  DSUILocStringForKey(CFSTR("QUICK_EXIT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v10, 0, v11, sel_quickExit);
  objc_msgSend(v8, "setRightBarButtonItem:", v12);

}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[16];

  v2 = DSLogBiometrics;
  if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2278DF000, v2, OS_LOG_TYPE_INFO, "Cannot evaluate authentication policy for FaceID, no passcode set.", buf, 2u);
  }
  v3 = (void *)MEMORY[0x24BEBD3B0];
  DSUILocStringForKey(CFSTR("FACEID_REQUIRES_PASSCODE_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("FACEID_REQUIRES_PASSCODE_DETAIL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("SKIP"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_236;
  v15[3] = &unk_24EFF3418;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10);

  v11 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("BACK_TO_PASSCODE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_2_240;
  v14[3] = &unk_24EFF3418;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v13);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);
}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_236(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pushNextPane");

}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_2_240(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

- (void)deleteAllIdentities
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[DSFaceIDController deleteGlobalAuthACL](self, "deleteGlobalAuthACL");
  objc_msgSend(MEMORY[0x24BE75448], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identitiesForIdentityType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x24BE75448], "sharedInstance", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeIdentity:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (_os_feature_enabled_impl())
    -[DSFaceIDController configurePeriocularEnabled:](self, "configurePeriocularEnabled:", 0);

}

- (void)configurePeriocularEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];

  v3 = a3;
  v20[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE75448], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSFaceIDController authContext](self, "authContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = &unk_24F00B208;
  v20[0] = &unk_24F00B220;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "evaluatePolicy:options:error:", 1007, v8, 0);

  -[DSFaceIDController authContext](self, "authContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "externalizedContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v12 = (void *)getBKUIPeriocularEnableSplashViewControllerClass_softClass;
  v18 = getBKUIPeriocularEnableSplashViewControllerClass_softClass;
  if (!getBKUIPeriocularEnableSplashViewControllerClass_softClass)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke;
    v14[3] = &unk_24EFF3F88;
    v14[4] = &v15;
    __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke((uint64_t)v14);
    v12 = (void *)v16[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v13, "setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:credentialSet:enabled:", v6, v11, v3);

}

- (void)deleteGlobalAuthACL
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__DSFaceIDController_deleteGlobalAuthACL__block_invoke;
  v3[3] = &unk_24EFF3670;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __41__DSFaceIDController_deleteGlobalAuthACL__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_biometricBindingFlowManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deleteBoundACLWithCompletion:", &__block_literal_global_11);

}

void __41__DSFaceIDController_deleteGlobalAuthACL__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_ERROR))
    __41__DSFaceIDController_deleteGlobalAuthACL__block_invoke_2_cold_1();

}

- (CIDVUIBiometricBindingFlowManager)_biometricBindingFlowManager
{
  CIDVUIBiometricBindingFlowManager *biometricBindingFlowManager;
  void *v4;
  objc_class *v5;
  CIDVUIBiometricBindingFlowManager *v6;
  CIDVUIBiometricBindingFlowManager *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  biometricBindingFlowManager = self->__biometricBindingFlowManager;
  if (!biometricBindingFlowManager)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getCIDVUIBiometricBindingFlowManagerClass_softClass;
    v13 = getCIDVUIBiometricBindingFlowManagerClass_softClass;
    if (!getCIDVUIBiometricBindingFlowManagerClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getCIDVUIBiometricBindingFlowManagerClass_block_invoke;
      v9[3] = &unk_24EFF3F88;
      v9[4] = &v10;
      __getCIDVUIBiometricBindingFlowManagerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (CIDVUIBiometricBindingFlowManager *)objc_alloc_init(v5);
    v7 = self->__biometricBindingFlowManager;
    self->__biometricBindingFlowManager = v6;

    biometricBindingFlowManager = self->__biometricBindingFlowManager;
  }
  return biometricBindingFlowManager;
}

- (void)pearlEnrollController:(id)a3 finishedEnrollWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = DSLogBiometrics;
  if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_INFO))
  {
    v19 = 138543362;
    v20 = v7;
    _os_log_impl(&dword_2278DF000, v8, OS_LOG_TYPE_INFO, "Enroll finished with error: %{public}@", (uint8_t *)&v19, 0xCu);
  }
  if (!v7)
  {
    -[DSFaceIDController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);

    -[DSFaceIDController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushNextPane");
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.biometrickitui.pearl_enroll")))
  {

LABEL_9:
    objc_msgSend(v7, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.biometrickitui.pearl_enroll")))
    {
      v14 = objc_msgSend(v7, "code");

      if (v14 != -2)
      {
LABEL_17:
        -[DSFaceIDController navigationController](self, "navigationController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);
        goto LABEL_18;
      }
      objc_msgSend(v7, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.preferences.biokit")))
      {
        v17 = objc_msgSend(v13, "code");

        if (v17 == 8)
        {
          v18 = DSLogBiometrics;
          if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_ERROR))
            -[DSFaceIDController pearlEnrollController:finishedEnrollWithError:].cold.1(v18);
        }
      }
      else
      {

      }
    }

    goto LABEL_17;
  }
  v10 = objc_msgSend(v7, "code");

  if (v10 != -1)
    goto LABEL_9;
  -[DSFaceIDController _didTapCancelButton](self, "_didTapCancelButton");
LABEL_19:

}

- (void)_didTapCancelButton
{
  void *v3;

  -[DSFaceIDController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[DSFaceIDController updateFaceIDPaneConfiguration](self, "updateFaceIDPaneConfiguration");
}

- (void)startRatchetEvalInPresentationContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  LARatchetViewController *v15;
  LARatchetViewController *ratchetVC;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDDAA08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  DSUIDTOLocStringForKey(CFSTR("RATCHET_ACTION_BUTTON_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCountdownPrimaryActionTitle:", v7);

  -[DSFaceIDController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deepLinkForCurrentFlowAndPane");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDDAA00];
  v17[0] = &unk_24F00B238;
  DSUIDTOLocStringForKey(CFSTR("RATCHET_REASON_FACEID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v17[1] = &unk_24F00B250;
  DSUIDTOLocStringForKey(CFSTR("RATCHET_ENDED_DETAIL_FACEID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  v17[2] = &unk_24F00B268;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = &unk_24F00B280;
  v18[2] = v13;
  v18[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "makeViewControllerWithOptions:configuration:", v14, v6);
  v15 = (LARatchetViewController *)objc_claimAutoreleasedReturnValue();
  ratchetVC = self->_ratchetVC;
  self->_ratchetVC = v15;

  -[LARatchetViewController setDelegate:](self->_ratchetVC, "setDelegate:", self);
  -[LARatchetViewController evaluateAndShowViewController](self->_ratchetVC, "evaluateAndShowViewController");

}

- (void)ratchetViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[DSFaceIDController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", &unk_24F00B250);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__DSFaceIDController_ratchetViewController_didFinishWithResult_error___block_invoke;
    block[3] = &unk_24EFF3778;
    block[4] = self;
    v24 = v11;
    v25 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(v9, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDDA928]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "code") || !v14)
    {
      v16 = DSLogBiometrics;
      if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_impl(&dword_2278DF000, v16, OS_LOG_TYPE_INFO, "FaceID Change Ratchet not armed. Reason: %@", buf, 0xCu);
      }
      -[DSFaceIDController navigationController](self, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "topViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_class();
      v20 = objc_opt_class();

      if (v19 == v20)
      {
        -[DSFaceIDController navigationController](self, "navigationController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v21, "popToViewController:animated:", self, 0);

        objc_msgSend(v11, "pushNextPane");
      }
    }
    else if (objc_msgSend(v14, "rawValue") == 1)
    {
      v15 = DSLogBiometrics;
      if (os_log_type_enabled((os_log_t)DSLogBiometrics, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2278DF000, v15, OS_LOG_TYPE_INFO, "FaceID Change Ratchet initiated, timer counting down. User exiting Safety Check.", buf, 2u);
      }
      objc_msgSend(v11, "exitFlowForRatchetWait");
    }

  }
}

void __70__DSFaceIDController_ratchetViewController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "beginFaceIDEnrollment");
  objc_msgSend(*(id *)(a1 + 40), "sendSummaryAnalyticsWithEventName:", CFSTR("com.apple.DigitalSeparation.RatchedEnded"));
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "viewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setViewControllers:", v5);

  }
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (UINavigationController)faceIDEnrollmentNavigationController
{
  return self->_faceIDEnrollmentNavigationController;
}

- (void)setFaceIDEnrollmentNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_faceIDEnrollmentNavigationController, a3);
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
  objc_storeStrong((id *)&self->_boldButton, a3);
}

- (void)set_biometricBindingFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->__biometricBindingFlowManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__biometricBindingFlowManager, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_storeStrong((id *)&self->_faceIDEnrollmentNavigationController, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ratchetVC, 0);
}

+ (void)pearlIdentities
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2278DF000, a2, OS_LOG_TYPE_ERROR, "DS Face ID: Failed to fetch BKDevice: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0_0();
}

void __43__DSFaceIDController_beginFaceIDEnrollment__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_2278DF000, v0, v1, "%s: Encountered error '%{public}@' when trying to authenticate", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0_0();
}

void __41__DSFaceIDController_deleteGlobalAuthACL__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_2278DF000, v0, v1, "%s: Encountered error '%{public}@'", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0_0();
}

- (void)pearlEnrollController:(os_log_t)log finishedEnrollWithError:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2278DF000, log, OS_LOG_TYPE_ERROR, "DS Enroll observed interlock error", v1, 2u);
}

@end
