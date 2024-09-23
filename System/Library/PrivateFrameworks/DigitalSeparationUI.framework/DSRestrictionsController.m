@implementation DSRestrictionsController

- (DSRestrictionsController)init
{
  void *v3;
  DSRestrictionsController *v4;
  objc_super v6;

  DSUILocStringForKey(CFSTR("RESTRICTIONS_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)DSRestrictionsController;
  v4 = -[OBTextWelcomeController initWithTitle:](&v6, sel_initWithTitle_, v3);

  return v4;
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
  block[2] = __53__DSRestrictionsController_shouldShowWithCompletion___block_invoke;
  block[3] = &unk_24EFF3898;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __53__DSRestrictionsController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(MEMORY[0x24BE2CC70], "hasRestriction"));
}

- (id)restrictionList
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
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

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isSourceRestricted:", *MEMORY[0x24BE2CC28]))
  {
    DSUILocStringForKey(CFSTR("FIND_MY_RESTRICTIONS"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isSourceRestricted:", *MEMORY[0x24BE2CC40]))
  {
    DSUILocStringForKey(CFSTR("SHARED_PHOTO_RESTRICTIONS"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isPermissionRestricted:", CFSTR("location")))
  {
    objc_msgSend(MEMORY[0x24BE2CC48], "localizedNameForPermission:", CFSTR("DSLocationAlways"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DSLocStringForKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isPermissionRestricted:", *MEMORY[0x24BEB3830]))
  {
    objc_msgSend(MEMORY[0x24BE2CC48], "localizedNameForPermission:", CFSTR("DSContacts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DSLocStringForKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  v10 = (_QWORD *)MEMORY[0x24BEB3840];
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isPermissionRestricted:", *MEMORY[0x24BEB3840]))
  {
    objc_msgSend(MEMORY[0x24BE2CC48], "localizedNameForPermission:", *v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    DSLocStringForKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  v13 = (_QWORD *)MEMORY[0x24BEB38E8];
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isPermissionRestricted:", *MEMORY[0x24BEB38E8]))
  {
    objc_msgSend(MEMORY[0x24BE2CC48], "localizedNameForPermission:", *v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    DSLocStringForKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

  }
  v16 = (_QWORD *)MEMORY[0x24BEB38D8];
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isPermissionRestricted:", *MEMORY[0x24BEB38D8]))
  {
    objc_msgSend(MEMORY[0x24BE2CC48], "localizedNameForPermission:", *v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    DSLocStringForKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

  }
  v19 = (_QWORD *)MEMORY[0x24BEB3838];
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isPermissionRestricted:", *MEMORY[0x24BEB3838]))
  {
    objc_msgSend(MEMORY[0x24BE2CC48], "localizedNameForPermission:", *v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    DSLocStringForKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);

  }
  v22 = (_QWORD *)MEMORY[0x24BEB38C0];
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isPermissionRestricted:", *MEMORY[0x24BEB38C0]))
  {
    objc_msgSend(MEMORY[0x24BE2CC48], "localizedNameForPermission:", *v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    DSLocStringForKey();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24);

  }
  v25 = (_QWORD *)MEMORY[0x24BEB38B8];
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isPermissionRestricted:", *MEMORY[0x24BEB38B8]))
  {
    objc_msgSend(MEMORY[0x24BE2CC48], "localizedNameForPermission:", *v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    DSLocStringForKey();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v27);

  }
  objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "length"))
  {
    v29 = (void *)MEMORY[0x24BDD17C8];
    DSUILocStringForKey(CFSTR("APP_RESTRICTIONS"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", v30, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "addObject:", v31);
  }
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isPasscodeModificationRestricted"))
  {
    DSUILocStringForKey(CFSTR("PASSCODE_RESTRICTIONS"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v32);

  }
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isFingerprintModificationRestricted"))
  {
    if (PSIsPearlAvailable())
    {
      DSUILocStringForKey(CFSTR("FACE_ID_RESTRICTIONS"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v33);

    }
    if (PSSupportsMesa())
    {
      DSUILocStringForKey(CFSTR("TOUCH_ID_RESTRICTIONS"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v34);

    }
  }
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isAppRemovalRestricted"))
  {
    DSUILocStringForKey(CFSTR("APP_DELETION_RESTRICTION"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v35);

  }
  if (objc_msgSend(MEMORY[0x24BE2CC70], "isPrivateRelayRestricted"))
  {
    DSUILocStringForKey(CFSTR("PRIVATE_RELAY_RESTRICTIONS"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v36);

  }
  return v2;
}

- (void)learnMoreRestrictionsPressed
{
  void *v3;
  id v4;

  -[DSRestrictionsController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("RESTRICTIONS_LEARN_MORE_URL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "learnMorePressedForController:withURL:", self, v3);

}

- (void)viewDidLoad
{
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)DSRestrictionsController;
  -[OBBaseWelcomeController viewDidLoad](&v28, sel_viewDidLoad);
  -[DSRestrictionsController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("RESTRICTIONS_DETAIL_1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDetailText:", v4);

  v5 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithHierarchicalColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSRestrictionsController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageNamed:inBundle:withConfiguration:", CFSTR("custom.nosign"), v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIcon:accessibilityLabel:", v11, 0);

  objc_msgSend(MEMORY[0x24BE6E400], "accessoryButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("RESTRICTIONS_LEARN_MORE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:forState:", v13, 0);

  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_learnMoreRestrictionsPressed, 64);
  -[DSRestrictionsController headerView](self, "headerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAccessoryButton:", v12);

  DSUILocStringForKey(CFSTR("RESTRICTIONS_DETAIL_2"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", 0, v15);

  -[DSRestrictionsController restrictionList](self, "restrictionList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20++), 0);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }
  DSUILocStringForKey(CFSTR("CONTINUE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSRestrictionsController delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v21, v22, sel_pushNextPane);

}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
