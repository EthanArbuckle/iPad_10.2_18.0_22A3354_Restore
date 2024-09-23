@implementation BuddyTCController

- (BuddyTCController)init
{
  unsigned __int8 v2;
  BuddyTCController *v3;
  objc_super v5;
  SEL v6;
  id location;

  v6 = a2;
  location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyTCController;
  location = -[BuddyTCController init](&v5, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = +[BYWarranty shouldDisplay](BYWarranty, "shouldDisplay");
    *((_BYTE *)location + 8) = v2 & 1;
  }
  v3 = (BuddyTCController *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (BuddyiOSTCController)iOSTermsController
{
  BuddyiOSTCController *v2;
  BuddyiOSTCController *iOSTermsController;

  if (!self->_iOSTermsController)
  {
    v2 = objc_alloc_init(BuddyiOSTCController);
    iOSTermsController = self->_iOSTermsController;
    self->_iOSTermsController = v2;

    -[BuddySimpleTCController setTermsAndConditionsDelegate:](self->_iOSTermsController, "setTermsAndConditionsDelegate:", self, a2);
  }
  return self->_iOSTermsController;
}

- (BuddyWarrantyTCController)warrantyTermsController
{
  BuddyWarrantyTCController *v2;
  BuddyWarrantyTCController *warrantyTermsController;

  if (!self->_warrantyTermsController)
  {
    v2 = objc_alloc_init(BuddyWarrantyTCController);
    warrantyTermsController = self->_warrantyTermsController;
    self->_warrantyTermsController = v2;

    -[BuddySimpleTCController setTermsAndConditionsDelegate:](self->_warrantyTermsController, "setTermsAndConditionsDelegate:", self, a2);
  }
  return self->_warrantyTermsController;
}

- (id)multiTermsController
{
  RUIObjectModel *v2;
  id v3;
  id v4;
  RUIObjectModel *v5;
  id v6;
  id v9;

  v2 = -[BuddyTCController objectModel](self, "objectModel");
  v3 = -[RUIObjectModel defaultPages](v2, "defaultPages");
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = -[BuddyTCController objectModel](self, "objectModel");
    v6 = -[RUIObjectModel defaultPages](v5, "defaultPages");
    v9 = objc_msgSend(v6, "objectAtIndex:", 0);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupTOS;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  NSBundle *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  id v7;
  NSString *v8;
  NSBundle *v9;
  NSString *v10;
  id v11;
  id v12;
  NSString *v13;
  NSString *v14;
  id v15;
  uint64_t v16;
  NSString *v17;
  NSBundle *v18;
  NSURL *v19;
  NSString *v20;
  NSBundle *v21;
  NSBundle *v22;
  NSBundle *v23;
  NSBundle *v24;
  NSBundle *v25;
  id v26;
  id v27;
  char v28;
  id v29;
  char v30;
  id v31;
  os_log_type_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id location[2];
  BuddyTCController *v39;
  uint8_t buf[16];

  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[BuddyTCController includeWarranty](v39, "includeWarranty"))
  {
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v37 = -[NSBundle pathForResource:ofType:](v3, "pathForResource:ofType:", CFSTR("multiterms"), CFSTR("xml"));

    v36 = +[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v37, 4, 0);
    v35 = 0;
    v34 = 0;
    v25 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v4 = -[NSBundle localizedStringForKey:value:table:](v25, "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS"), &stru_100284738, CFSTR("Localizable"));
    v24 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = -[NSBundle localizedStringForKey:value:table:](v24, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_100284738, CFSTR("Localizable"));
    v23 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v20 = -[NSBundle localizedStringForKey:value:table:](v23, "localizedStringForKey:value:table:", CFSTR("DISAGREE"), &stru_100284738, CFSTR("Localizable"));
    v22 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v6 = -[NSBundle localizedStringForKey:value:table:](v22, "localizedStringForKey:value:table:", CFSTR("IMPORTANT"), &stru_100284738, CFSTR("Localizable"));
    v7 = (id)SFLocalizedMultipickerStringForKey(CFSTR("Part1"));
    v21 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v8 = -[NSBundle localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", CFSTR("TC_HEADER"), &stru_100284738, CFSTR("Localizable"));
    v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("WARRANTY_HEADER"), &stru_100284738, CFSTR("Localizable"));
    v11 = (id)SFLocalizedMultipickerStringForKey(CFSTR("Part2"));
    v12 = (id)SFLocalizedMultipickerStringForKey(CFSTR("Part3"));
    v13 = v4;
    v14 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v36, CFSTR("%@%@%@%@%@%@%@%@%@"), &v34, v4, v5, v20, v6, v7, v8, v10, v11, v12);
    objc_storeStrong(&v35, v34);
    v15 = v36;
    v36 = v14;

    if (!v36)
    {
      v33 = (id)_BYLoggingFacility(v16);
      v32 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
      {
        v30 = 0;
        v28 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v17 = (NSString *)v35;
        }
        else if (v35)
        {
          v31 = objc_msgSend(v35, "domain");
          v30 = 1;
          v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v31, objc_msgSend(v35, "code"));
          v29 = v17;
          v28 = 1;
        }
        else
        {
          v17 = 0;
        }
        sub_100039500((uint64_t)buf, (uint64_t)v17);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v33, v32, "Failed to load/format terms strings: %{public}@", buf, 0xCu);
        if ((v28 & 1) != 0)

        if ((v30 & 1) != 0)
      }
      objc_storeStrong(&v33, 0);
    }
    v27 = objc_msgSend(v36, "dataUsingEncoding:", 4);
    if (objc_msgSend(v27, "length"))
    {
      v26 = objc_alloc_init((Class)RUILoader);
      objc_msgSend(v26, "setDelegate:", v39);
      v18 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v19 = -[NSBundle resourceURL](v18, "resourceURL");
      objc_msgSend(v26, "loadXMLUIWithData:baseURL:", v27, v19);

      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
  }
  if (location[0])
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  id location[2];
  BuddyTCController *v4;
  BuddyiOSTCController *v5;

  v4 = self;
  location[1] = (id)a2;
  location[0] = -[BuddyTCController multiTermsController](self, "multiTermsController");
  if (location[0])
    v5 = (BuddyiOSTCController *)location[0];
  else
    v5 = -[BuddyTCController iOSTermsController](v4, "iOSTermsController");
  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (BOOL)shouldPresentModally
{
  return 1;
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  id v6;
  id v7;
  BuddyTCController *v8;
  RUIObjectModel *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  BuddyTCController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v6 = objc_msgSend(v14, "defaultPages");
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[BuddyTCController setObjectModel:](v16, "setObjectModel:", v14);
    v8 = v16;
    v9 = -[BuddyTCController objectModel](v16, "objectModel");
    -[RUIObjectModel setDelegate:](v9, "setDelegate:", v8);

    v10 = objc_msgSend(v14, "defaultPages");
    v11 = objc_msgSend(v10, "objectAtIndex:", 0);
    v12 = objc_msgSend(v11, "navigationItem");
    objc_msgSend(v12, "setHidesBackButton:", 1);

    v13 = +[RUIStyle setupAssistantStyle](RUIStyle, "setupAssistantStyle");
    objc_msgSend(v13, "applyToObjectModel:", v14);

  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)loader:(id)a3 didFailWithError:(id)a4
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

- (id)parentViewControllerForObjectModel:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (void)objectModel:(id)a3 didNavigateBackFromController:(id)a4 withGesture:(BOOL)a5
{
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  BuddyWarrantyTCController *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  BuddyTCController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v13 = -[BuddyTCController multiTermsController](v17, "multiTermsController");
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("agree")) & 1) != 0)
  {
    -[BuddyTCController buddyTCSubController:didFinishWithAgree:](v17, "buddyTCSubController:didFinishWithAgree:", v13, 1);
  }
  else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("disagree")) & 1) != 0)
  {
    -[BuddyTCController buddyTCSubController:didFinishWithAgree:](v17, "buddyTCSubController:didFinishWithAgree:", v13, 0);
  }
  else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("iOSTerms")) & 1) != 0)
  {
    v12 = -[BuddyTCController iOSTermsController](v17, "iOSTermsController");
    v7 = objc_msgSend(v12, "navigationItem");
    objc_msgSend(v7, "setHidesBackButton:", 0);

    v8 = objc_msgSend(v13, "navigationController");
    objc_msgSend(v8, "pushViewController:animated:", v12, 1);

    objc_storeStrong(&v12, 0);
  }
  else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("iOSWarranty")) & 1) != 0)
  {
    v11 = -[BuddyTCController warrantyTermsController](v17, "warrantyTermsController");
    v9 = -[BuddyWarrantyTCController navigationItem](v11, "navigationItem");
    objc_msgSend(v9, "setHidesBackButton:", 0);

    v10 = objc_msgSend(v13, "navigationController");
    objc_msgSend(v10, "pushViewController:animated:", v11, 1);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)buddyTCSubController:(id)a3 didFinishWithAgree:(BOOL)a4
{
  NSBundle *v5;
  NSString *v6;
  NSBundle *v7;
  NSString *v8;
  NSBundle *v9;
  NSString *v10;
  UIAlertAction *v11;
  id v12;
  NSBundle *v13;
  NSString *v14;
  UIAlertAction *v15;
  BFFFlowItemDelegate *v16;
  id v17;
  id v18;
  BuddyWarrantyTCController *v19;
  BOOL v20;
  id v21;
  id v22;
  char v23;
  id v24;
  char v25;
  BuddyiOSTCController *v26;
  char *i;
  id v28;
  id v29;
  id v30;
  void **v31;
  int v32;
  int v33;
  void (*v34)(id *, void *);
  void *v35;
  BuddyTCController *v36;
  id v37;
  id v38;
  BOOL v39;
  id location[2];
  BuddyTCController *v41;

  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = a4;
  if (a4)
  {
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("AGREE_DIALOG_TITLE"), &stru_100284738, CFSTR("Localizable"));
    v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", CFSTR("AGREE_DIALOG_TEXT"), &stru_100284738, CFSTR("Localizable"));
    v38 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);

    v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100284738, CFSTR("Localizable"));
    v11 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, 0);
    objc_msgSend(v38, "addAction:", v11);

    v12 = v38;
    v13 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_100284738, CFSTR("Localizable"));
    v31 = _NSConcreteStackBlock;
    v32 = -1073741824;
    v33 = 0;
    v34 = sub_10017B3FC;
    v35 = &unk_100280A50;
    v36 = v41;
    v37 = location[0];
    v15 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, &v31);
    objc_msgSend(v12, "addAction:", v15);

    objc_msgSend(location[0], "presentViewController:animated:completion:", v38, 1, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong((id *)&v36, 0);
    objc_storeStrong(&v38, 0);
  }
  else
  {
    v30 = objc_msgSend(location[0], "navigationController");
    v29 = objc_msgSend(v30, "viewControllers");
    if (objc_msgSend(v29, "count") == (id)1)
    {
      v16 = -[BuddyTCController delegate](v41, "delegate");
      -[BFFFlowItemDelegate flowItemCancelled:](v16, "flowItemCancelled:", v41);

    }
    else
    {
      v28 = 0;
      for (i = (char *)objc_msgSend(v29, "count") - 1; i; --i)
      {
        v17 = objc_msgSend(v29, "objectAtIndex:", i);
        v18 = v28;
        v28 = v17;

        v19 = -[BuddyTCController warrantyTermsController](v41, "warrantyTermsController");
        v25 = 0;
        v23 = 0;
        v20 = 0;
        if (v28 != v19)
        {
          v26 = -[BuddyTCController iOSTermsController](v41, "iOSTermsController");
          v25 = 1;
          v20 = 0;
          if (v28 != v26)
          {
            v24 = -[BuddyTCController multiTermsController](v41, "multiTermsController");
            v23 = 1;
            v20 = v28 != v24;
          }
        }
        if ((v23 & 1) != 0)

        if ((v25 & 1) != 0)
        if (v20)
          break;
      }
      v21 = objc_msgSend(v29, "objectAtIndex:", i);
      v22 = objc_msgSend(v30, "popToViewController:animated:", v21, 1);

      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)includeWarranty
{
  return self->_includeWarranty;
}

- (void)setIncludeWarranty:(BOOL)a3
{
  self->_includeWarranty = a3;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RUIObjectModel)objectModel
{
  return self->_objectModel;
}

- (void)setObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_objectModel, a3);
}

- (void)setIOSTermsController:(id)a3
{
  objc_storeStrong((id *)&self->_iOSTermsController, a3);
}

- (void)setWarrantyTermsController:(id)a3
{
  objc_storeStrong((id *)&self->_warrantyTermsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warrantyTermsController, 0);
  objc_storeStrong((id *)&self->_iOSTermsController, 0);
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
