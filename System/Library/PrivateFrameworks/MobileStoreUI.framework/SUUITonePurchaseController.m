@implementation SUUITonePurchaseController

- (SUUITonePurchaseController)initWithItem:(id)a3
{
  id v5;
  SUUITonePurchaseController *v6;
  SUUITonePurchaseController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUITonePurchaseController;
  v6 = -[SUUITonePurchaseController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CNContactPickerViewController setDelegate:](self->_contactPickerController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUITonePurchaseController;
  -[SUUITonePurchaseController dealloc](&v3, sel_dealloc);
}

- (void)showPurchaseFlowWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id completionBlock;
  void *v10;
  SUUIClientContext *clientContext;
  void *v12;
  void *v13;
  uint64_t v14;
  SUUIClientContext *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SUUIClientContext *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  SUUIClientContext *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  SUUIClientContext *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SUUIClientContext *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id location[2];

  v4 = a3;
  v5 = (void *)__TonePurchaseControllers;
  if (!__TonePurchaseControllers)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = (void *)__TonePurchaseControllers;
    __TonePurchaseControllers = (uint64_t)v6;

    v5 = (void *)__TonePurchaseControllers;
  }
  objc_msgSend(v5, "addObject:", self);
  v8 = (void *)objc_msgSend(v4, "copy");
  completionBlock = self->_completionBlock;
  self->_completionBlock = v8;

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  clientContext = self->_clientContext;
  if (clientContext)
    -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("BUY_TONE_ALERT_TITLE"), CFSTR("Tones"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("BUY_TONE_ALERT_TITLE"), 0, CFSTR("Tones"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v12);

  -[SUUIItem title](self->_item, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    v15 = self->_clientContext;
    if (v15)
      -[SUUIClientContext localizedStringForKey:inTable:](v15, "localizedStringForKey:inTable:", CFSTR("BUY_TONE_BODY_FORMAT"), CFSTR("Tones"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("BUY_TONE_BODY_FORMAT"), 0, CFSTR("Tones"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD17C8];
    -[SUUIItem title](self->_item, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMessage:", v19);

  }
  objc_initWeak(location, self);
  if (MGGetBoolAnswer())
  {
    v20 = self->_clientContext;
    v21 = CFSTR("Tones");
    if (v20)
      -[SUUIClientContext localizedStringForKey:inTable:](v20, "localizedStringForKey:inTable:", CFSTR("BUY_TONE_SET_AS_DEFAULT_RINGTONE"), v21);
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("BUY_TONE_SET_AS_DEFAULT_RINGTONE"), 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BEBD3A8];
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke;
    v47[3] = &unk_2511F5608;
    objc_copyWeak(&v48, location);
    objc_msgSend(v23, "actionWithTitle:style:handler:", v22, 0, v47);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v24);

    objc_destroyWeak(&v48);
  }
  v25 = self->_clientContext;
  v26 = CFSTR("Tones");
  if (v25)
    -[SUUIClientContext localizedStringForKey:inTable:](v25, "localizedStringForKey:inTable:", CFSTR("BUY_TONE_SET_AS_DEFAULT_TEXT_TONE"), v26);
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("BUY_TONE_SET_AS_DEFAULT_TEXT_TONE"), 0, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x24BEBD3A8];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_2;
  v45[3] = &unk_2511F5608;
  objc_copyWeak(&v46, location);
  objc_msgSend(v28, "actionWithTitle:style:handler:", v27, 0, v45);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v29);

  v30 = self->_clientContext;
  v31 = v26;
  if (v30)
    -[SUUIClientContext localizedStringForKey:inTable:](v30, "localizedStringForKey:inTable:", CFSTR("BUY_TONE_ASSIGN_TO_CONTACT"), v31);
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("BUY_TONE_ASSIGN_TO_CONTACT"), 0, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v4;

  v34 = (void *)MEMORY[0x24BEBD3A8];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_3;
  v43[3] = &unk_2511F5608;
  objc_copyWeak(&v44, location);
  objc_msgSend(v34, "actionWithTitle:style:handler:", v32, 0, v43);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v35);

  v36 = self->_clientContext;
  v37 = v31;
  if (v36)
    -[SUUIClientContext localizedStringForKey:inTable:](v36, "localizedStringForKey:inTable:", CFSTR("BUY_TONE_DONE"), v37);
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("BUY_TONE_DONE"), 0, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x24BEBD3A8];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_4;
  v41[3] = &unk_2511F5608;
  objc_copyWeak(&v42, location);
  objc_msgSend(v39, "actionWithTitle:style:handler:", v38, 1, v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v40);

  -[SUUITonePurchaseController _presentViewController:](self, "_presentViewController:", v10);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);

  objc_destroyWeak(location);
}

void __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BEB1FE8]);
  objc_msgSend(v3, "setShouldMakeDefaultRingtone:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishWithTonePurchase:", v3);

}

void __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BEB1FE8]);
  objc_msgSend(v3, "setShouldMakeDefaultTextTone:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishWithTonePurchase:", v3);

}

void __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showContactPicker");

}

void __66__SUUITonePurchaseController_showPurchaseFlowWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishWithTonePurchase:", 0);

}

- (void)contactPickerDidCancel:(id)a3
{
  -[SUUITonePurchaseController _dismissContactPicker](self, "_dismissContactPicker", a3);
  -[SUUITonePurchaseController _finishWithTonePurchase:](self, "_finishWithTonePurchase:", 0);
}

- (void)_dismissContactPicker
{
  CNContactPickerViewController *contactPickerController;
  CNContactPickerViewController *v4;

  v4 = self->_contactPickerController;
  -[CNContactPickerViewController setDelegate:](v4, "setDelegate:", 0);
  contactPickerController = self->_contactPickerController;
  self->_contactPickerController = 0;

  -[CNContactPickerViewController dismissViewControllerAnimated:completion:](v4, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_finishContactPicker:(id)a3 withContact:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  SUUIClientContext *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  SUUIClientContext *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BEB1FE8]);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "iOSLegacyIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssigneeIdentifier:", v9);
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAssigneeContactIdentifier:", v10);

  }
  -[SUUITonePurchaseController _dismissContactPicker](self, "_dismissContactPicker");
  if ((MGGetBoolAnswer() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    v12 = self->_clientContext;
    v13 = CFSTR("Tones");
    v26 = v6;
    if (v12)
      -[SUUIClientContext localizedStringForKey:inTable:](v12, "localizedStringForKey:inTable:", CFSTR("BUY_TONE_SET_AS_RINGTONE"), v13);
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("BUY_TONE_SET_AS_RINGTONE"), 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BEBD3A8];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke;
    v32[3] = &unk_2511FCD40;
    v16 = v8;
    v33 = v16;
    objc_copyWeak(&v34, location);
    objc_msgSend(v15, "actionWithTitle:style:handler:", v14, 0, v32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = self->_clientContext;
    v19 = v13;
    if (v18)
      -[SUUIClientContext localizedStringForKey:inTable:](v18, "localizedStringForKey:inTable:", CFSTR("BUY_TONE_SET_AS_TEXT_TONE"), v19, &v34);
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("BUY_TONE_SET_AS_TEXT_TONE"), 0, v19, &v34);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x24BEBD3A8];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke_2;
    v29[3] = &unk_2511FCD40;
    v30 = v16;
    objc_copyWeak(&v31, location);
    objc_msgSend(v21, "actionWithTitle:style:handler:", v20, 0, v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SUUIItem itemKind](self->_item, "itemKind") == 16)
    {
      objc_msgSend(v11, "addAction:", v17);
      v23 = v22;
    }
    else
    {
      objc_msgSend(v11, "addAction:", v22);
      v23 = v17;
    }
    objc_msgSend(v11, "addAction:", v23);
    objc_msgSend(v26, "transitionCoordinator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke_3;
      v27[3] = &unk_2511FB0A8;
      v27[4] = self;
      v28 = v11;
      objc_msgSend(v24, "animateAlongsideTransition:completion:", 0, v27);

    }
    else
    {
      -[SUUITonePurchaseController _presentViewController:](self, "_presentViewController:", v11);
    }

    objc_destroyWeak(&v31);
    objc_destroyWeak(v25);

    objc_destroyWeak(location);
    v6 = v26;
  }
  else
  {
    objc_msgSend(v8, "setAssigneeToneStyle:", *MEMORY[0x24BEB2758]);
    -[SUUITonePurchaseController _finishWithTonePurchase:](self, "_finishWithTonePurchase:", v8);
  }

}

void __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setAssigneeToneStyle:", *MEMORY[0x24BEB2750]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishWithTonePurchase:", *(_QWORD *)(a1 + 32));

}

void __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setAssigneeToneStyle:", *MEMORY[0x24BEB2758]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishWithTonePurchase:", *(_QWORD *)(a1 + 32));

}

uint64_t __63__SUUITonePurchaseController__finishContactPicker_withContact___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentViewController:", *(_QWORD *)(a1 + 40));
}

- (void)_finishWithTonePurchase:(id)a3
{
  id completionBlock;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  completionBlock = self->_completionBlock;
  v5 = a3;
  v9 = (id)objc_msgSend(completionBlock, "copy");
  v6 = self->_completionBlock;
  self->_completionBlock = 0;

  +[SUUIItemStateCenter defaultCenter](SUUIItemStateCenter, "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purchaseTone:withProperties:clientContext:completionBlock:", self->_item, v5, self->_clientContext, v9);

  objc_msgSend((id)__TonePurchaseControllers, "removeObject:", self);
  if (!objc_msgSend((id)__TonePurchaseControllers, "count"))
  {
    v8 = (void *)__TonePurchaseControllers;
    __TonePurchaseControllers = 0;

  }
}

- (void)_presentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SUUITonePurchaseController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    do
    {
      objc_msgSend(v4, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v6;
    }
    while (v7);
  }
  else
  {
    v6 = v4;
  }
  objc_msgSend(v6, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)_showContactPicker
{
  uint64_t v3;
  objc_class *v4;
  CNContactPickerViewController *v5;
  CNContactPickerViewController *contactPickerController;

  v3 = SUUIContactsUIFramework();
  v4 = (objc_class *)SUUIWeakLinkedClassForString(CFSTR("CNContactPickerViewController"), v3);
  if (v4)
  {
    v5 = (CNContactPickerViewController *)objc_alloc_init(v4);
    contactPickerController = self->_contactPickerController;
    self->_contactPickerController = v5;

    -[CNContactPickerViewController setDelegate:](self->_contactPickerController, "setDelegate:", self);
    -[SUUITonePurchaseController _presentViewController:](self, "_presentViewController:", self->_contactPickerController);
  }
  else
  {
    -[SUUITonePurchaseController _finishWithTonePurchase:](self, "_finishWithTonePurchase:", 0);
  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_contactPickerController, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
