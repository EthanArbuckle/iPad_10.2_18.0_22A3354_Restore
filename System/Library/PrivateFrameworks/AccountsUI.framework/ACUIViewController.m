@implementation ACUIViewController

- (ACUIViewController)init
{
  ACUIViewController *v3;
  ACUIViewController *v4;
  objc_super v5;
  SEL v6;
  ACUIViewController *v7;

  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)ACUIViewController;
  v4 = -[ACUIViewController init](&v5, sel_init);
  v7 = v4;
  objc_storeStrong((id *)&v7, v4);
  if (v4)
  {
    v7->_validationInProgress = 0;
    v7->_addedToTaskList = 0;
    v7->_activityInProgress = 0;
  }
  v3 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  ACUIViewController *v4;

  v4 = self;
  v3 = a2;
  -[ACUIViewController hideActivityInProgressUI](self, "hideActivityInProgressUI");
  v2.receiver = v4;
  v2.super_class = (Class)ACUIViewController;
  -[ACUIViewController dealloc](&v2, sel_dealloc);
}

- (void)viewDidLoad
{
  uint64_t v2;
  UIBarButtonItem *cancelButton;
  uint64_t v4;
  UIBarButtonItem *doneButton;
  UIBarButtonItem *v6;
  id v7;
  UIBarButtonItem *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v16;
  SEL v17;
  ACUIViewController *v18;

  v18 = self;
  v17 = a2;
  v16.receiver = self;
  v16.super_class = (Class)ACUIViewController;
  -[ACUIViewController viewDidLoad](&v16, sel_viewDidLoad);
  if (!v18->_cancelButton)
  {
    v13 = objc_alloc(MEMORY[0x1E0CEA380]);
    v15 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A15E98, CFSTR("Localizable"));
    v2 = objc_msgSend(v13, "initWithTitle:style:target:action:");
    cancelButton = v18->_cancelButton;
    v18->_cancelButton = (UIBarButtonItem *)v2;

  }
  if (!v18->_doneButton)
  {
    v10 = objc_alloc(MEMORY[0x1E0CEA380]);
    v12 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1E9A15E98, CFSTR("Localizable"));
    v4 = objc_msgSend(v10, "initWithTitle:style:target:action:");
    doneButton = v18->_doneButton;
    v18->_doneButton = (UIBarButtonItem *)v4;

  }
  v6 = v18->_cancelButton;
  v7 = (id)-[ACUIViewController navigationItem](v18, "navigationItem");
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  v8 = v18->_doneButton;
  v9 = (id)-[ACUIViewController navigationItem](v18, "navigationItem");
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

}

- (id)specifiers
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x1E0D80590]));
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

+ (BOOL)shouldPresentAsModalSheet
{
  return 1;
}

+ (id)guestUserModeContentUnavailableConfiguration:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = (id)objc_msgSend(MEMORY[0x1E0CEA4A8], "emptyConfiguration");
  v8 = (id)objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("person.crop.circle.dashed"));
  objc_msgSend(v25, "setImage:");

  v9 = (void *)MEMORY[0x1E0CEA650];
  v12 = (id)objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
  objc_msgSend(v12, "scaledValueForValue:", 28.0);
  v11 = (id)objc_msgSend(v9, "configurationWithPointSize:");
  v10 = (id)objc_msgSend(v25, "imageProperties");
  objc_msgSend(v10, "setPreferredSymbolConfiguration:", v11);

  v13 = (id)objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
  objc_msgSend(v13, "scaledValueForValue:", 12.0);
  objc_msgSend(v25, "setImageToTextPadding:");

  v15 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CONTENT_UNAVAILABLE_SHARING_MODE_TEXT"));
  objc_msgSend(v25, "setText:");

  v16 = (void *)MEMORY[0x1E0CEA5E8];
  v19 = (id)objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
  objc_msgSend(v19, "scaledValueForValue:", 22.0);
  v18 = (id)objc_msgSend(v16, "systemFontOfSize:weight:");
  v17 = (id)objc_msgSend(v25, "textProperties");
  objc_msgSend(v17, "setFont:", v18);

  v21 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v20 = (id)objc_msgSend(v25, "textProperties");
  objc_msgSend(v20, "setColor:", v21);

  v23 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v22 = (id)objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CONTENT_UNAVAILABLE_SHARING_MODE_SECONDARY_TEXT"), &stru_1E9A15E98, CFSTR("Localizable"));
  objc_msgSend(v25, "setSecondaryText:");

  objc_msgSend(v25, "directionalLayoutMargins");
  objc_msgSend(location[0], "safeAreaInsets");
  objc_msgSend(location[0], "safeAreaInsets");
  objc_msgSend(location[0], "safeAreaInsets");
  objc_msgSend(location[0], "safeAreaInsets");
  NSDirectionalEdgeInsetsMake();
  objc_msgSend(v25, "setDirectionalLayoutMargins:", v3, v4, v5, v6);
  v24 = v25;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v24;
}

- (BOOL)isPresentedAsModalSheet
{
  id v3;
  char isKindOfClass;

  v3 = (id)-[ACUIViewController parentController](self, "parentController");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)dismissAnimated:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  BOOL v6;

  v6 = a3;
  if (-[ACUIViewController isPresentedAsModalSheet](self, "isPresentedAsModalSheet"))
  {
    v5 = (id)-[ACUIViewController navigationController](self, "navigationController");
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v6, 0);

  }
  else
  {
    v4 = (id)-[ACUIViewController navigationController](self, "navigationController");
    v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", v6);

  }
}

- (void)cancelButtonTapped:(id)a3
{
  uint64_t v3;
  NSObject *log;
  os_log_type_t v5;
  NSString *v6;
  NSString *v7;
  os_log_type_t type;
  os_log_t oslog;
  id location;
  SEL v11;
  ACUIViewController *v12;
  uint8_t v13[56];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12 = self;
  v11 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  oslog = (os_log_t)_ACUILogSystem();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    v5 = type;
    v3 = (uint64_t)v12;
    v6 = NSStringFromSelector(v11);
    v7 = v6;
    __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_66((uint64_t)v13, (uint64_t)"-[ACUIViewController cancelButtonTapped:]", 147, v3, (uint64_t)v7, (uint64_t)location);
    _os_log_impl(&dword_1D573D000, log, v5, "%s (%d) @\"%{public}@ %{public}@: %{public}@\", v13, 0x30u);

    objc_storeStrong((id *)&v7, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&location, 0);
}

- (void)doneButtonTapped:(id)a3
{
  uint64_t v3;
  NSObject *log;
  os_log_type_t v5;
  NSString *v6;
  NSString *v7;
  os_log_type_t type;
  os_log_t oslog;
  id location;
  SEL v11;
  ACUIViewController *v12;
  uint8_t v13[56];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12 = self;
  v11 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  oslog = (os_log_t)_ACUILogSystem();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    v5 = type;
    v3 = (uint64_t)v12;
    v6 = NSStringFromSelector(v11);
    v7 = v6;
    __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_66((uint64_t)v13, (uint64_t)"-[ACUIViewController doneButtonTapped:]", 152, v3, (uint64_t)v7, (uint64_t)location);
    _os_log_impl(&dword_1D573D000, log, v5, "%s (%d) @\"%{public}@ %{public}@: %{public}@\", v13, 0x30u);

    objc_storeStrong((id *)&v7, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&location, 0);
}

- (void)showConfirmationWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 completion:(id)a7
{
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(_QWORD *, void *);
  void *v21;
  id v22;
  int v23;
  id v24;
  uint64_t v25;
  int i;
  id v27;
  id v28;
  BOOL v29;
  id v30;
  id v31;
  id location[2];
  ACUIViewController *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = 0;
  objc_storeStrong(&v31, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  v29 = a6;
  v28 = 0;
  objc_storeStrong(&v28, a7);
  v27 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(location[0], "count"));
  for (i = 0; ; ++i)
  {
    v12 = i;
    if (v12 >= objc_msgSend(location[0], "count"))
      break;
    v25 = 0;
    v11 = i;
    if (v11 == objc_msgSend(location[0], "count") - 1)
    {
      v25 = 1;
    }
    else if (v29)
    {
      v10 = i;
      if (v10 == objc_msgSend(location[0], "count") - 2)
        v25 = 2;
    }
    v8 = (void *)MEMORY[0x1E0CEA2E0];
    v9 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", i);
    v7 = v25;
    v17 = MEMORY[0x1E0C809B0];
    v18 = -1073741824;
    v19 = 0;
    v20 = __87__ACUIViewController_showConfirmationWithButtons_title_message_destructive_completion___block_invoke;
    v21 = &unk_1E9A15228;
    v22 = v28;
    v23 = i;
    v24 = (id)objc_msgSend(v8, "actionWithTitle:style:handler:", v9, v7, &v17);

    objc_msgSend(v27, "addObject:", v24);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v22, 0);
  }
  -[ACUIViewController showConfirmationWithActions:title:message:](v33, "showConfirmationWithActions:title:message:", v27, v31, v30);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

void __87__ACUIViewController_showConfirmationWithButtons_title_message_destructive_completion___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)showConfirmationWithActions:(id)a3 title:(id)a4 message:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  _QWORD __b[8];
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id location[2];
  ACUIViewController *v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v13 = (void *)MEMORY[0x1E0CEA2E8];
  v14 = v23;
  v15 = v22;
  v26 = 0;
  v16 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  v26 = v17;
  v18 = 1;
  if (v17 != 1)
    v18 = v26 == 5;
  v21 = (id)objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v14, v15, v18);
  memset(__b, 0, sizeof(__b));
  v9 = location[0];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
  if (v10)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v10;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(v9);
      v20 = *(_QWORD *)(__b[1] + 8 * v7);
      objc_msgSend(v21, "addAction:", v20);
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
        if (!v8)
          break;
      }
    }
  }

  -[ACUIViewController presentViewController:animated:completion:](v25, "presentViewController:animated:completion:", v21, 1);
  -[ACUIViewController setTaskCompletionAssertionEnabled:](v25, "setTaskCompletionAssertionEnabled:", 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)showConfirmationForDeletingAccount:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  ACUIViewController *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location[2];
  ACUIViewController *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v5 = (id)objc_msgSend(location[0], "enabledDataclasses");
  v20 = (id)objc_msgSend(v5, "allObjects");

  v6 = (void *)MEMORY[0x1E0CB3940];
  v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_WARNING_FORMAT"));
  v7 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v20, 0, location[0]);
  v19 = (id)objc_msgSend(v6, "stringWithFormat:", v8, v7);

  v13 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:");
  v24[0] = v12;
  v11 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A15E98, CFSTR("Localizable"));
  v24[1] = v10;
  v18 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);

  v15 = v23;
  v14 = v18;
  v17 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));
  -[ACUIViewController showConfirmationWithButtons:title:message:destructive:completion:](v15, "showConfirmationWithButtons:title:message:destructive:completion:", v14);

  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (id)showConfirmationViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 cancelButtonIndex:(int64_t)a7 context:(id)a8 forceAlert:(BOOL)a9 completion:(id)a10
{
  uint64_t v10;
  id confirmationViewCompletion;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  id v26;
  os_log_type_t v27;
  id v28;
  int v29;
  os_log_type_t v30;
  id v31;
  id v32;
  BOOL v33;
  id v34;
  int64_t v35;
  BOOL v36;
  id v37;
  id v38;
  id location[2];
  ACUIViewController *v40;
  id v41;
  uint64_t v42;
  uint8_t v43[32];
  uint8_t v44[24];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = 0;
  objc_storeStrong(&v38, a4);
  v37 = 0;
  objc_storeStrong(&v37, a5);
  v36 = a6;
  v35 = a7;
  v34 = 0;
  objc_storeStrong(&v34, a8);
  v33 = a9;
  v32 = 0;
  objc_storeStrong(&v32, a10);
  if (v40->_confirmationViewCompletion)
  {
    v31 = _ACUILogSystem();
    v30 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v44, (uint64_t)"-[ACUIViewController showConfirmationViewWithButtons:title:message:destructive:cancelButtonIndex:context:forceAlert:completion:]", 242);
      _os_log_error_impl(&dword_1D573D000, (os_log_t)v31, v30, "%s (%d) \"Not showing confirmation view because another confirmation view's completion handler is still pending.\", v44, 0x12u);
    }
    objc_storeStrong(&v31, 0);
    v41 = 0;
    v29 = 1;
  }
  else
  {
    v28 = _ACUILogSystem();
    v27 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v43, (uint64_t)"-[ACUIViewController showConfirmationViewWithButtons:title:message:destructive:cancelButtonIndex:context:forceAlert:completion:]", 246);
      _os_log_debug_impl(&dword_1D573D000, (os_log_t)v28, v27, "%s (%d) \"Setting confirmation view completion handler.\", v43, 0x12u);
    }
    objc_storeStrong(&v28, 0);
    v10 = MEMORY[0x1D8277444](v32);
    confirmationViewCompletion = v40->_confirmationViewCompletion;
    v40->_confirmationViewCompletion = (id)v10;

    v26 = 0;
    v42 = 0;
    v18 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v19 = objc_msgSend(v18, "userInterfaceIdiom");

    v42 = v19;
    v20 = 1;
    if (v19 != 1)
      v20 = v42 == 5;
    if (v20 || v33)
    {
      v12 = -[ACUIViewController _alertViewWithButtons:title:message:cancelButtonIndex:context:](v40, "_alertViewWithButtons:title:message:cancelButtonIndex:context:", location[0], v38, v37, v35, v34);
      v13 = v26;
      v26 = v12;

      objc_msgSend(v26, "show");
    }
    else
    {
      v14 = -[ACUIViewController _actionSheetWithButtons:title:destructive:cancelButtonIndex:context:](v40, "_actionSheetWithButtons:title:destructive:cancelButtonIndex:context:", location[0], v37, v36, v35, v34);
      v15 = v26;
      v26 = v14;

      v17 = (id)-[ACUIViewController view](v40, "view");
      objc_msgSend(v26, "showInView:");

    }
    -[ACUIViewController setTaskCompletionAssertionEnabled:](v40, "setTaskCompletionAssertionEnabled:", 0);
    v41 = v26;
    v29 = 1;
    objc_storeStrong(&v26, 0);
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
  return v41;
}

- (id)showConfirmationViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 cancelButtonIndex:(int64_t)a7 context:(id)a8 completion:(id)a9
{
  uint64_t v10;
  id v16;
  id v17;
  id v18;
  int64_t v19;
  BOOL v20;
  id v21;
  id v22;
  id location[2];
  ACUIViewController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = a6;
  v19 = a7;
  v18 = 0;
  objc_storeStrong(&v18, a8);
  v17 = 0;
  objc_storeStrong(&v17, a9);
  LOBYTE(v10) = 0;
  v16 = -[ACUIViewController showConfirmationViewWithButtons:title:message:destructive:cancelButtonIndex:context:forceAlert:completion:](v24, "showConfirmationViewWithButtons:title:message:destructive:cancelButtonIndex:context:forceAlert:completion:", location[0], v22, v21, v20, v19, v18, v10, v17);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (id)showConfirmationViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 context:(id)a7 completion:(id)a8
{
  id v8;
  id v9;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  id v16;
  ACUIViewController *v17;
  id v18;
  id v19;
  id v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  int v29;
  int v30;
  void (*v31)(_QWORD *, void *);
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  BOOL v37;
  id v38;
  id v39;
  id location[2];
  ACUIViewController *v41;
  uint64_t v42;

  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = 0;
  objc_storeStrong(&v39, a4);
  v38 = 0;
  objc_storeStrong(&v38, a5);
  v37 = a6;
  v36 = 0;
  objc_storeStrong(&v36, a7);
  v35 = 0;
  objc_storeStrong(&v35, a8);
  v34 = objc_msgSend(location[0], "count") - 1;
  v42 = 0;
  v25 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v26 = objc_msgSend(v25, "userInterfaceIdiom");

  v42 = v26;
  v27 = 1;
  if (v26 != 1)
    v27 = v42 == 5;
  if (v27 && objc_msgSend(location[0], "count") == 2 && !v37)
  {
    v19 = (id)objc_msgSend(location[0], "reverseObjectEnumerator");
    v8 = (id)objc_msgSend(v19, "allObjects");
    v9 = location[0];
    location[0] = v8;

    v34 = 0;
  }
  v17 = v41;
  v11 = location[0];
  v12 = v39;
  v13 = v38;
  v14 = v37;
  v15 = v34;
  v16 = v36;
  v28 = MEMORY[0x1E0C809B0];
  v29 = -1073741824;
  v30 = 0;
  v31 = __99__ACUIViewController_showConfirmationViewWithButtons_title_message_destructive_context_completion___block_invoke;
  v32 = &unk_1E9A15250;
  v33 = v35;
  v18 = -[ACUIViewController showConfirmationViewWithButtons:title:message:destructive:cancelButtonIndex:context:completion:](v17, "showConfirmationViewWithButtons:title:message:destructive:cancelButtonIndex:context:completion:", v11, v12, v13, v14, v15, v16, &v28);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  return v18;
}

void __99__ACUIViewController_showConfirmationViewWithButtons_title_message_destructive_context_completion___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (id)showAlertViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 cancelButtonIndex:(int64_t)a7 context:(id)a8 completion:(id)a9
{
  uint64_t v10;
  id v16;
  id v17;
  id v18;
  int64_t v19;
  BOOL v20;
  id v21;
  id v22;
  id location[2];
  ACUIViewController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = a6;
  v19 = a7;
  v18 = 0;
  objc_storeStrong(&v18, a8);
  v17 = 0;
  objc_storeStrong(&v17, a9);
  LOBYTE(v10) = 1;
  v16 = -[ACUIViewController showConfirmationViewWithButtons:title:message:destructive:cancelButtonIndex:context:forceAlert:completion:](v24, "showConfirmationViewWithButtons:title:message:destructive:cancelButtonIndex:context:forceAlert:completion:", location[0], v22, v21, v20, v19, v18, v10, v17);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (id)showAlertViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 destructive:(BOOL)a6 context:(id)a7 completion:(id)a8
{
  id v8;
  id v9;
  id v11;
  id v12;
  uint64_t v18;
  id v19;
  id v20;
  BOOL v21;
  id v22;
  id v23;
  id location[2];
  ACUIViewController *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = a6;
  v20 = 0;
  objc_storeStrong(&v20, a7);
  v19 = 0;
  objc_storeStrong(&v19, a8);
  v18 = objc_msgSend(location[0], "count") - 1;
  if (objc_msgSend(location[0], "count") == 2 && !v21)
  {
    v12 = (id)objc_msgSend(location[0], "reverseObjectEnumerator");
    v8 = (id)objc_msgSend(v12, "allObjects");
    v9 = location[0];
    location[0] = v8;

    v18 = 0;
  }
  v11 = -[ACUIViewController showAlertViewWithButtons:title:message:destructive:cancelButtonIndex:context:completion:](v25, "showAlertViewWithButtons:title:message:destructive:cancelButtonIndex:context:completion:", location[0], v23, v22, v21, v18, v20, v19);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)_alertViewWithButtons:(id)a3 title:(id)a4 message:(id)a5 cancelButtonIndex:(int64_t)a6 context:(id)a7
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v17;
  uint64_t v18;
  _QWORD __b[8];
  uint64_t v20;
  id v21;
  id v22;
  int64_t v23;
  id v24;
  id v25;
  id location[2];
  ACUIViewController *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = a6;
  v22 = 0;
  objc_storeStrong(&v22, a7);
  v21 = objc_alloc_init(MEMORY[0x1E0CEA2F0]);
  memset(__b, 0, sizeof(__b));
  v17 = location[0];
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
  if (v18)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v18;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(v17);
      v20 = *(_QWORD *)(__b[1] + 8 * v11);
      objc_msgSend(v21, "addButtonWithTitle:", v20);
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
        if (!v12)
          break;
      }
    }
  }

  objc_msgSend(v21, "setTitle:", v25);
  objc_msgSend(v21, "setMessage:", v24);
  objc_msgSend(v21, "setCancelButtonIndex:", v23);
  objc_msgSend(v21, "setContext:", v22);
  objc_msgSend(v21, "setDelegate:", v27);
  v8 = v21;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_actionSheetWithButtons:(id)a3 title:(id)a4 destructive:(BOOL)a5 cancelButtonIndex:(int64_t)a6 context:(id)a7
{
  id *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v19;
  uint64_t v20;
  _QWORD __b[8];
  uint64_t v22;
  id v23;
  id v24;
  int64_t v25;
  BOOL v26;
  id v27;
  id location[2];
  ACUIViewController *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = 0;
  objc_storeStrong(&v27, a4);
  v26 = a5;
  v25 = a6;
  v24 = 0;
  objc_storeStrong(&v24, a7);
  v23 = objc_alloc_init(MEMORY[0x1E0CEA2B0]);
  memset(__b, 0, sizeof(__b));
  v19 = location[0];
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
  if (v20)
  {
    v12 = *(_QWORD *)__b[2];
    v13 = 0;
    v14 = v20;
    while (1)
    {
      v11 = v13;
      if (*(_QWORD *)__b[2] != v12)
        objc_enumerationMutation(v19);
      v22 = *(_QWORD *)(__b[1] + 8 * v13);
      objc_msgSend(v23, "addButtonWithTitle:", v22);
      ++v13;
      if (v11 + 1 >= v14)
      {
        v13 = 0;
        v14 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
        if (!v14)
          break;
      }
    }
  }

  objc_msgSend(v23, "setCancelButtonIndex:", v25);
  if (v26)
    v10 = objc_msgSend(v23, "cancelButtonIndex") - 1;
  else
    v10 = -1;
  objc_msgSend(v23, "setDestructiveButtonIndex:", v10, &v23);
  objc_msgSend(v23, "setTitle:", v27);
  objc_msgSend(v23, "setContext:", v24);
  objc_msgSend(v23, "setDelegate:", v29);
  v9 = v23;
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (void)confirmationView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  id confirmationViewCompletion;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  os_log_type_t v7;
  id v8;
  int64_t v9;
  id location[2];
  ACUIViewController *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  if (v11->_confirmationViewCompletion)
  {
    v8 = _ACUILogSystem();
    v7 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v12, (uint64_t)"-[ACUIViewController confirmationView:clickedButtonAtIndex:]", 403);
      _os_log_debug_impl(&dword_1D573D000, (os_log_t)v8, v7, "%s (%d) \"Confirmative view calling completion handler.\", v12, 0x12u);
    }
    objc_storeStrong(&v8, 0);
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8277444](v11->_confirmationViewCompletion);
    confirmationViewCompletion = v11->_confirmationViewCompletion;
    v11->_confirmationViewCompletion = 0;

    ((void (**)(_QWORD, id, int64_t))v6)[2](v6, location[0], v9);
    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  id location[2];
  ACUIViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[ACUIViewController confirmationView:clickedButtonAtIndex:](v6, "confirmationView:clickedButtonAtIndex:", location[0], a4);
  objc_storeStrong(location, 0);
}

- (void)actionSheet:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  id location[2];
  ACUIViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[ACUIViewController confirmationView:clickedButtonAtIndex:](v6, "confirmationView:clickedButtonAtIndex:", location[0], a4);
  objc_storeStrong(location, 0);
}

- (id)showConfirmationViewForDeletingAccount:(id)a3 context:(id)a4 completion:(id)a5
{
  id v6;
  ACUIViewController *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  BOOL v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  char v29;
  id v30;
  char v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id location[2];
  ACUIViewController *v39;
  uint64_t v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  v36 = 0;
  objc_storeStrong(&v36, a5);
  v16 = (id)objc_msgSend(location[0], "enabledDataclasses");
  v35 = (id)objc_msgSend(v16, "allObjects");

  v17 = (void *)MEMORY[0x1E0CB3940];
  v20 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (id)objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_WARNING_FORMAT"), &stru_1E9A15E98, CFSTR("Localizable"));
  v18 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v35, 0, location[0]);
  v34 = (id)objc_msgSend(v17, "stringWithFormat:", v19, v18);

  v40 = 0;
  v21 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  v40 = v22;
  v23 = 1;
  if (v22 != 1)
    v23 = v40 == 5;
  v31 = 0;
  v29 = 0;
  v27 = 0;
  v25 = 0;
  if (v23)
  {
    v32 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v31 = 1;
    v30 = (id)objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E9A15E98, CFSTR("Localizable"));
    v29 = 1;
    v13 = v30;
  }
  else
  {
    v28 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = 1;
    v26 = (id)objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));
    v25 = 1;
    v13 = v26;
  }
  v41[0] = v13;
  v12 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A15E98, CFSTR("Localizable"));
  v41[1] = v11;
  v33 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);

  if ((v25 & 1) != 0)
  if ((v27 & 1) != 0)

  if ((v29 & 1) != 0)
  if ((v31 & 1) != 0)

  v7 = v39;
  v6 = v33;
  v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));
  v24 = -[ACUIViewController showConfirmationViewWithButtons:title:message:destructive:context:completion:](v7, "showConfirmationViewWithButtons:title:message:destructive:context:completion:", v6);

  v10 = v24;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)startValidationWithPrompt:(id)a3
{
  id location[2];
  ACUIViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[ACUIViewController startValidationWithPrompt:userInteraction:](v4, "startValidationWithPrompt:userInteraction:", location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)startValidationWithPrompt:(id)a3 userInteraction:(BOOL)a4
{
  ACUISpinnerTitle *v4;
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  id location[2];
  ACUIViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = a4;
  if (!-[ACUIViewController validationInProgress](v14, "validationInProgress"))
  {
    v5 = (id)-[ACUIViewController navigationItem](v14, "navigationItem");
    v11 = (id)objc_msgSend(v5, "leftBarButtonItem");

    v6 = (id)-[ACUIViewController navigationItem](v14, "navigationItem");
    v10 = (id)objc_msgSend(v6, "rightBarButtonItem");

    if (v11)
      -[ACUIViewController setCancelButton:](v14, "setCancelButton:", v11);
    if (v10)
      -[ACUIViewController setDoneButton:](v14, "setDoneButton:", v10);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  -[ACUIViewController setValidationInProgress:](v14, "setValidationInProgress:", 1);
  v9 = (id)-[ACUIViewController navigationItem](v14, "navigationItem");
  v4 = [ACUISpinnerTitle alloc];
  v8 = -[ACUISpinnerTitle initWithTitle:](v4, "initWithTitle:", location[0]);
  objc_msgSend(v9, "setTitleView:", v8);
  objc_msgSend(v9, "setLeftBarButtonItem:animated:");
  objc_msgSend(v9, "setRightBarButtonItem:animated:", 0, 1);
  if ((objc_msgSend((id)*MEMORY[0x1E0CEB258], "isIgnoringInteractionEvents") & 1) == 0 && !v12)
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "beginIgnoringInteractionEvents");
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)updateValidationPrompt:(id)a3
{
  ACUISpinnerTitle *v3;
  ACUISpinnerTitle *v4;
  id v5;
  id v6;
  id location[2];
  ACUIViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)-[ACUIViewController navigationItem](v8, "navigationItem");
  v5 = (id)objc_msgSend(v6, "titleView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = [ACUISpinnerTitle alloc];
    v4 = -[ACUISpinnerTitle initWithTitle:](v3, "initWithTitle:", location[0]);
    objc_msgSend(v6, "setTitleView:", v4);
    objc_storeStrong((id *)&v4, 0);
  }
  else
  {
    objc_msgSend(v6, "_setTitle:animated:", location[0], 1);
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)stopValidationWithPrompt:(id)a3 showButtons:(BOOL)a4
{
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  id v7;
  os_log_type_t v8;
  id v9;
  BOOL v10;
  id location[2];
  ACUIViewController *v12;
  uint8_t v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  v9 = _ACUILogSystem();
  v8 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v13, (uint64_t)"-[ACUIViewController stopValidationWithPrompt:showButtons:]", 486, (uint64_t)location[0]);
    _os_log_debug_impl(&dword_1D573D000, (os_log_t)v9, v8, "%s (%d) \"ACUIViewController stopValidatingWithprompt %@\", v13, 0x1Cu);
  }
  objc_storeStrong(&v9, 0);
  -[ACUIViewController setValidationInProgress:](v12, "setValidationInProgress:", 0);
  v7 = (id)-[ACUIViewController navigationItem](v12, "navigationItem");
  objc_msgSend(v7, "setTitleView:", 0);
  if (v10)
  {
    v4 = -[ACUIViewController cancelButton](v12, "cancelButton");
    objc_msgSend(v7, "setLeftBarButtonItem:animated:");

    v5 = -[ACUIViewController doneButton](v12, "doneButton");
    objc_msgSend(v7, "setRightBarButtonItem:animated:");

  }
  else
  {
    objc_msgSend(v7, "setLeftBarButtonItems:animated:", 0, 1);
  }
  objc_msgSend(v7, "_setTitle:animated:", location[0], 1);
  if ((objc_msgSend((id)*MEMORY[0x1E0CEB258], "isIgnoringInteractionEvents") & 1) == 1)
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "endIgnoringInteractionEvents");
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)setCellsChecked:(BOOL)a3
{
  void *v3;
  id v4;
  id location;
  unint64_t v6;
  unint64_t i;
  BOOL v8;
  SEL v9;
  ACUIViewController *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  i = 0;
  v6 = 0;
  v6 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), "count");
  for (i = 0; i < v6; ++i)
  {
    v3 = *(Class *)((char *)&v10->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]);
    v4 = (id)-[ACUIViewController indexPathForIndex:](v10, "indexPathForIndex:", i);
    location = (id)objc_msgSend(v3, "cellForRowAtIndexPath:");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 1)
      objc_msgSend(location, "setChecked:", v8);
    objc_storeStrong(&location, 0);
  }
}

- (void)reloadParentSpecifier
{
  id v2;
  id location[2];
  ACUIViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = -[ACUIViewController _effectiveParentController](self, "_effectiveParentController");
  v2 = (id)objc_msgSend(*(id *)((char *)&v4->super.super.super.super.super.isa+ (int)*MEMORY[0x1E0D80628]), "identifier");
  objc_msgSend(location[0], "reloadSpecifierID:animated:");

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(location[0], "performSelector:", sel_reloadParentSpecifier);
  objc_storeStrong(location, 0);
}

- (void)reloadAllParentSpecifiers
{
  id v3;
  uint64_t v4;
  BOOL v5;

  v3 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 1;
  if (v4 != 1)
    v5 = v4 == 5;
  -[ACUIViewController reloadAllParentSpecifiersAnimated:](self, "reloadAllParentSpecifiersAnimated:", v5);
}

- (void)reloadAllParentSpecifiersAnimated:(BOOL)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id obj;
  uint64_t v9;
  _QWORD __b[8];
  uint64_t v11;
  id location;
  BOOL v13;
  SEL v14;
  ACUIViewController *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = self;
  v14 = a2;
  v13 = a3;
  location = -[ACUIViewController _effectiveParentController](self, "_effectiveParentController");
  if (location)
  {
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(location, "specifiers");
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
    if (v9)
    {
      v5 = *(_QWORD *)__b[2];
      v6 = 0;
      v7 = v9;
      while (1)
      {
        v4 = v6;
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(__b[1] + 8 * v6);
        objc_msgSend(location, "reloadSpecifier:animated:", v11, v13, v7);
        ++v6;
        v7 = v3;
        if (v4 + 1 >= v3)
        {
          v6 = 0;
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
          if (!v7)
            break;
        }
      }
    }

    if ((objc_msgSend((id)objc_opt_class(), "shouldPresentAsModalSheet") & 1) == 1
      && !-[ACUIViewController isPresentedAsModalSheet](v15, "isPresentedAsModalSheet")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(location, "performSelector:", sel_reloadAllParentSpecifiers);
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)removeParentSpecifier
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  BOOL v5;
  id location[2];
  ACUIViewController *v7;
  uint64_t v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = -[ACUIViewController _effectiveParentController](self, "_effectiveParentController");
  v2 = *(uint64_t *)((char *)&v7->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]);
  v3 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v8 = v4;
  v5 = 1;
  if (v4 != 1)
    v5 = v8 == 5;
  objc_msgSend(location[0], "removeSpecifier:animated:", v2, v5);
  objc_storeStrong(location, 0);
}

- (id)_effectiveParentController
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id location[2];
  ACUIViewController *v9;
  id v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  if (-[ACUIViewController isPresentedAsModalSheet](self, "isPresentedAsModalSheet"))
  {
    v7 = (id)-[ACUIViewController rootController](v9, "rootController");
    v2 = (id)objc_msgSend(v7, "parentController");
    v3 = location[0];
    location[0] = v2;

  }
  else
  {
    v4 = (id)-[ACUIViewController parentController](v9, "parentController");
    v5 = location[0];
    location[0] = v4;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = location[0];
  else
    v10 = 0;
  objc_storeStrong(location, 0);
  return v10;
}

- (void)setTaskCompletionAssertionEnabled:(BOOL)a3
{
  const __CFString *v3;
  id v4;
  id WeakRetained;
  os_log_t oslog;
  BOOL v7;
  SEL v8;
  ACUIViewController *v9;
  uint8_t v10[40];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = self;
  v8 = a2;
  v7 = a3;
  oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    if (v7)
      v3 = CFSTR("enabled");
    else
      v3 = CFSTR("disabled");
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v10, (uint64_t)"-[ACUIViewController setTaskCompletionAssertionEnabled:]", 579, (uint64_t)v3);
    _os_log_debug_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUIViewController setTaskCompletionAssertionEnabled: %{public}@\", v10, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v7)
  {
    if (!v9->_addedToTaskList)
    {
      WeakRetained = objc_loadWeakRetained((id *)((char *)&v9->super.super.super.super.super.isa
                                                + (int)*MEMORY[0x1E0D80620]));
      objc_msgSend(WeakRetained, "addTask:", v9);

      v9->_addedToTaskList = 1;
    }
  }
  else if (v9->_addedToTaskList)
  {
    v4 = objc_loadWeakRetained((id *)((char *)&v9->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80620]));
    objc_msgSend(v4, "taskFinished:", v9);

    v9->_addedToTaskList = 0;
  }
}

- (ACUIAccountOperationsHelper)accountOperationsHelper
{
  ACUIAccountOperationsHelper *v2;
  ACUIAccountOperationsHelper *accountOperationsHelper;
  ACUIAccountOperationsHelper *v5;
  ACAccountStore *v6;

  if (!self->_accountOperationsHelper)
  {
    v5 = [ACUIAccountOperationsHelper alloc];
    v6 = -[ACUIViewController accountStore](self, "accountStore");
    v2 = -[ACUIAccountOperationsHelper initWithAccountStore:](v5, "initWithAccountStore:");
    accountOperationsHelper = self->_accountOperationsHelper;
    self->_accountOperationsHelper = v2;

    -[ACUIAccountOperationsHelper setDelegate:](self->_accountOperationsHelper, "setDelegate:", self);
  }
  return self->_accountOperationsHelper;
}

+ (id)acuiAccountStore
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&acuiAccountStore_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_1);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)acuiAccountStore___acuiAccountStore;
}

void __38__ACUIViewController_acuiAccountStore__block_invoke(void *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9[3];
  uint8_t v10[40];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9[2] = a1;
  v9[1] = a1;
  v4 = objc_alloc(MEMORY[0x1E0C8F2D8]);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v6 = ACUIVisibleAccountTypes();
  v5 = (id)objc_msgSend(v3, "setWithArray:");
  v1 = objc_msgSend(v4, "initWithAccountTypes:delegate:");
  v2 = (void *)acuiAccountStore___acuiAccountStore;
  acuiAccountStore___acuiAccountStore = v1;

  v9[0] = 0;
  v8 = 0;
  objc_msgSend((id)acuiAccountStore___acuiAccountStore, "registerSynchronouslyWithError:", &v8);
  objc_storeStrong(v9, v8);
  if (v9[0])
  {
    v7 = _ACUILogSystem();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v10, (uint64_t)"+[ACUIViewController acuiAccountStore]_block_invoke", 615, (uint64_t)v9[0]);
      _os_log_error_impl(&dword_1D573D000, (os_log_t)v7, OS_LOG_TYPE_ERROR, "%s (%d) @\"Error registering account monitor: %@\", v10, 0x1Cu);
    }
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v9, 0);
}

- (ACAccountStore)accountStore
{
  return (ACAccountStore *)objc_msgSend((id)objc_opt_class(), "acuiAccountStore");
}

- (id)operationsHelper:(id)a3 desiredDataclassActionFromPicker:(id)a4
{
  id v6;
  id v7;
  id location[2];
  ACUIViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = (id)objc_msgSend(v7, "showInViewController:", v9);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)showActivityInProgressUIWithMessage:(id)a3
{
  id v3;
  UIProgressHUD *v4;
  UIProgressHUD *hud;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  id *v17;
  id *v18;
  id *v19;
  id *v20;
  id *v21;
  id obj;
  id *v23;
  id v24;
  id v25;
  id v26;
  NSDictionary *v27;
  id v28;
  id v29;
  id v30;
  id location[2];
  ACUIViewController *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32->_activityInProgress = 1;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "beginIgnoringInteractionEvents");
  v30 = *(id *)((char *)&v32->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]);
  v29 = 0;
  v28 = v30;
  while (1)
  {
    v24 = (id)objc_msgSend(v30, "superview");
    v3 = v29;
    v29 = v24;

    if (!v24)
      break;
    v23 = &v30;
    objc_storeStrong(&v28, v30);
    objc_storeStrong(&v30, v29);
  }
  v4 = (UIProgressHUD *)objc_alloc_init(MEMORY[0x1E0CEA8E0]);
  v13 = 0x1EFF45000uLL;
  hud = v32->_hud;
  v32->_hud = v4;

  objc_msgSend(*(id *)((char *)&v32->super.super.super.super.super.isa + *(int *)(v13 + 1388)), "setFontSize:", 16);
  v6 = *(Class *)((char *)&v32->super.super.super.super.super.isa + *(int *)(v13 + 1388));
  v21 = location;
  objc_msgSend(v6, "setText:", location[0]);
  v7 = *(Class *)((char *)&v32->super.super.super.super.super.isa + *(int *)(v13 + 1388));
  v16 = 1;
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = *(Class *)((char *)&v32->super.super.super.super.super.isa + *(int *)(v13 + 1388));
  v20 = &v28;
  objc_msgSend(v8, "showInView:", v28);
  v9 = *(Class *)((char *)&v32->super.super.super.super.super.isa + *(int *)(v13 + 1388));
  obj = 0;
  v10 = _NSDictionaryOfVariableBindings(CFSTR("_hud"), v9, 0);
  v19 = (id *)&v27;
  v27 = v10;
  v15 = 0x1E0CB3000uLL;
  v14 = 0;
  v11 = (id)objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_hud]-|"));
  v18 = &v26;
  v26 = v11;
  v12 = (id)objc_msgSend(*(id *)(v15 + 1816), "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_hud]-|"), v14, obj, v27);
  v17 = &v25;
  v25 = v12;
  objc_msgSend(*(id *)(v15 + 1816), "activateConstraints:", v26);
  objc_msgSend(*(id *)(v15 + 1816), "activateConstraints:", v25);
  -[ACUIViewController setTaskCompletionAssertionEnabled:](v32, "setTaskCompletionAssertionEnabled:", v16 & 1);
  objc_storeStrong(v17, obj);
  objc_storeStrong(v18, obj);
  objc_storeStrong(v19, obj);
  objc_storeStrong(v20, obj);
  objc_storeStrong(&v29, obj);
  objc_storeStrong(&v30, obj);
  objc_storeStrong(v21, obj);
}

- (void)hideActivityInProgressUI
{
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "endIgnoringInteractionEvents");
  -[UIProgressHUD removeFromSuperview](self->_hud, "removeFromSuperview");
  objc_storeStrong((id *)&self->_hud, 0);
  -[ACUIViewController setTaskCompletionAssertionEnabled:](self, "setTaskCompletionAssertionEnabled:", 0);
  self->_activityInProgress = 0;
}

- (void)hideActivityInProgressUIWithDelay:(double)a3
{
  if (a3 <= 0.0)
  {
    -[ACUIViewController hideActivityInProgressUI](self, "hideActivityInProgressUI");
  }
  else
  {
    -[UIProgressHUD done](self->_hud, "done");
    -[ACUIViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hideActivityInProgressUI, self, a3);
  }
}

- (BOOL)isShowingActivityInProgressUI
{
  return self->_activityInProgress;
}

- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  NSObject *queue;
  ACUIViewControllerAccountChangeObserver *v10;
  char v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  ACUIViewController *v17;
  BOOL v18;
  id v19;
  BOOL v20;
  id v21;
  id location[2];
  ACUIViewController *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = a5;
  v19 = 0;
  objc_storeStrong(&v19, a6);
  v10 = -[ACUIViewController accountChangeObserver](v23, "accountChangeObserver");
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    queue = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C809B0];
    v13 = -1073741824;
    v14 = 0;
    v15 = __72__ACUIViewController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke;
    v16 = &unk_1E9A15298;
    v17 = v23;
    v18 = v20;
    dispatch_async(queue, &v12);

    objc_storeStrong((id *)&v17, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __72__ACUIViewController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "accountChangeObserver");
  objc_msgSend(v2, "viewController:didFinishSavingAccountWithSuccess:", *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) & 1);

}

- (void)operationsHelper:(id)a3 willRemoveAccount:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  NSObject *queue;
  ACUIViewControllerAccountChangeObserver *v10;
  char v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  ACUIViewController *v17;
  BOOL v18;
  id v19;
  BOOL v20;
  id v21;
  id location[2];
  ACUIViewController *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = a5;
  v19 = 0;
  objc_storeStrong(&v19, a6);
  v10 = -[ACUIViewController accountChangeObserver](v23, "accountChangeObserver");
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    queue = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C809B0];
    v13 = -1073741824;
    v14 = 0;
    v15 = __74__ACUIViewController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke;
    v16 = &unk_1E9A15298;
    v17 = v23;
    v18 = v20;
    dispatch_async(queue, &v12);

    objc_storeStrong((id *)&v17, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __74__ACUIViewController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "accountChangeObserver");
  objc_msgSend(v2, "viewController:didFinishRemovingAccountWithSuccess:", *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) & 1);

}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void)setAccountOperationsHelper:(id)a3
{
  objc_storeStrong((id *)&self->_accountOperationsHelper, a3);
}

- (ACUIViewControllerAccountChangeObserver)accountChangeObserver
{
  return (ACUIViewControllerAccountChangeObserver *)objc_loadWeakRetained((id *)&self->_accountChangeObserver);
}

- (void)setAccountChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->_accountChangeObserver, a3);
}

- (BOOL)validationInProgress
{
  return self->_validationInProgress;
}

- (void)setValidationInProgress:(BOOL)a3
{
  self->_validationInProgress = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accountChangeObserver);
  objc_storeStrong((id *)&self->_accountOperationsHelper, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_hud, 0);
  objc_storeStrong(&self->_confirmationViewCompletion, 0);
}

@end
