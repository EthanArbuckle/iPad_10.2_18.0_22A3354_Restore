@implementation FAHomeUISoftLinking

- (FAHomeUISoftLinking)initWithHome:(id)a3 notificationName:(id)a4
{
  id v6;
  id v7;
  FAHomeUISoftLinking *v8;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  HUAddPeopleViewController *addPeopleController;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FAHomeUISoftLinking;
  v8 = -[FAHomeUISoftLinking init](&v14, sel_init);
  if (v8)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v9 = (void *)getHUAddPeopleViewControllerClass_softClass;
    v19 = getHUAddPeopleViewControllerClass_softClass;
    if (!getHUAddPeopleViewControllerClass_softClass)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __getHUAddPeopleViewControllerClass_block_invoke;
      v15[3] = &unk_24C88B7B0;
      v15[4] = &v16;
      __getHUAddPeopleViewControllerClass_block_invoke((uint64_t)v15);
      v9 = (void *)v17[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v16, 8);
    v11 = objc_msgSend([v10 alloc], "initWithHome:", v6);
    addPeopleController = v8->_addPeopleController;
    v8->_addPeopleController = (HUAddPeopleViewController *)v11;

    -[HUAddPeopleViewController setDelegate:](v8->_addPeopleController, "setDelegate:", v8);
    objc_storeStrong((id *)&v8->_homeReloadSignal, a4);
  }

  return v8;
}

- (id)getPeopleAddController
{
  return self->_addPeopleController;
}

+ (id)getURLScheme
{
  id *v2;
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (id *)getHFHomeURLSchemeSymbolLoc_ptr;
  v9 = getHFHomeURLSchemeSymbolLoc_ptr;
  if (!getHFHomeURLSchemeSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getHFHomeURLSchemeSymbolLoc_block_invoke;
    v5[3] = &unk_24C88B7B0;
    v5[4] = &v6;
    __getHFHomeURLSchemeSymbolLoc_block_invoke((uint64_t)v5);
    v2 = (id *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v4 = (_Unwind_Exception *)+[FAHomeUISoftLinking getURLScheme].cold.1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  return *v2;
}

+ (id)getHomeImage
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getHUImageNamedSymbolLoc_ptr;
  v9 = getHUImageNamedSymbolLoc_ptr;
  if (!getHUImageNamedSymbolLoc_ptr)
  {
    v3 = (void *)HomeUILibrary();
    v2 = dlsym(v3, "HUImageNamed");
    v7[3] = (uint64_t)v2;
    getHUImageNamedSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)+[FAHomeUISoftLinking getURLScheme].cold.1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  ((void (*)(const __CFString *))v2)(CFSTR("home"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addPeopleViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global);
}

- (void)addPeopleViewController:(id)a3 didSendInvitations:(id)a4
{
  id v5;

  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_18);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", self->_homeReloadSignal, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeReloadSignal, 0);
  objc_storeStrong((id *)&self->_addPeopleController, 0);
}

+ (uint64_t)getURLScheme
{
  dlerror();
  abort_report_np();
  return __getHUAddPeopleViewControllerClass_block_invoke_cold_1();
}

@end
