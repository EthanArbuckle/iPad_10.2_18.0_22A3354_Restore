@implementation DDAddToContactsViewController

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionPresenter, a2, a1);
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionViewService, a2, a1);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  sub_10001205C();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareForAction:(id)a3
{
  id v3;
  id v4;
  NSString *v5;
  id v6;
  NSString *v7;
  id v8;
  dispatch_queue_t queue;
  NSObject *v10;
  os_log_type_t v11;
  NSArray *v12;
  id v13;
  id v14;
  id v15;
  unsigned __int8 v16;
  NSArray *v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  id v23;
  id v24;
  unsigned __int8 v25;
  id v26;
  id v27;
  void **v28;
  int v29;
  int v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  DDAddToContactsViewController *v34;
  id v35;
  uint8_t v36[15];
  char v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t v42[15];
  char v43;
  id v44;
  os_log_type_t v45;
  id v46;
  id v47;
  id v48;
  id location[2];
  DDAddToContactsViewController *v50;
  id v51;
  id v52;
  uint8_t v53[24];

  v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v48 = objc_alloc_init((Class)CNMutableContact);
  v47 = 0;
  -[DDAddToContactsViewController setAction:](v50, "setAction:", location[0]);
  v46 = &_os_log_default;
  v45 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEBUG))
  {
    sub_10000AB04((uint64_t)v53, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v46, v45, "Preparing a view controller for the action %@", v53, 0xCu);
  }
  objc_storeStrong(&v46, 0);
  v27 = objc_msgSend(location[0], "contact");

  if (v27)
  {
    v26 = objc_msgSend(location[0], "contact");
    v3 = objc_msgSend(v26, "mutableCopy");
    v4 = v48;
    v48 = v3;

    if (objc_msgSend(location[0], "result"))
    {
      v5 = sub_100012778((uint64_t)objc_msgSend(location[0], "result"));
      v6 = v47;
      v47 = v5;

    }
  }
  else if (objc_msgSend(location[0], "result"))
  {
    DDAugmentContactWithResultsFromAction(v48, location[0]);
    v7 = sub_100012778((uint64_t)objc_msgSend(location[0], "result"));
    v8 = v47;
    v47 = v7;

  }
  else
  {
    v24 = objc_msgSend(location[0], "url");
    v23 = objc_msgSend(v24, "scheme");
    v22 = objc_msgSend(v23, "lowercaseString");
    v25 = objc_msgSend(v22, "isEqualToString:", CFSTR("mailto"));

    if ((v25 & 1) != 0)
    {
      v44 = &_os_log_default;
      v43 = 16;
      if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
      {
        v20 = v44;
        v21 = v43;
        sub_100005D3C(v42);
        _os_log_error_impl((void *)&_mh_execute_header, v20, v21, "Data Detectors BUG (or use of deprecated methods): should have a result. Will fallback to the URL for now", v42, 2u);
      }
      objc_storeStrong(&v44, 0);
      v19 = objc_msgSend(location[0], "url");
      v18 = objc_msgSend(v19, "dd_emailFromMailtoScheme");
      v41 = objc_msgSend(v18, "dd_userFriendlyEmail");

      if (v41)
      {
        v40 = +[CNLabeledValue labeledValueWithLabel:value:](CNLabeledValue, "labeledValueWithLabel:value:", 0, v41);
        if (v40)
        {
          v52 = v40;
          v17 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1);
          objc_msgSend(v48, "setEmailAddresses:");

          objc_storeStrong(&v47, CNContactEmailAddressesKey);
        }
        objc_storeStrong(&v40, 0);
      }
      objc_storeStrong(&v41, 0);
    }
    else
    {
      v15 = objc_msgSend(location[0], "url");
      v16 = objc_msgSend(v15, "dd_isAnySimpleTelephonyScheme");

      if ((v16 & 1) != 0)
      {
        v14 = objc_msgSend(location[0], "url");
        v13 = objc_msgSend(v14, "dd_phoneNumberFromTelScheme");
        v39 = (id)DDPhoneLabeledValue(0);

        if (v39)
        {
          v51 = v39;
          v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1);
          objc_msgSend(v48, "setPhoneNumbers:");

          objc_storeStrong(&v47, CNContactPhoneNumbersKey);
        }
        objc_storeStrong(&v39, 0);
      }
      else
      {
        v38 = &_os_log_default;
        v37 = 16;
        if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
        {
          v10 = v38;
          v11 = v37;
          sub_100005D3C(v36);
          _os_log_error_impl((void *)&_mh_execute_header, v10, v11, "Unknown scheme", v36, 2u);
        }
        objc_storeStrong(&v38, 0);
      }
    }
  }
  queue = &_dispatch_main_q;
  v28 = _NSConcreteStackBlock;
  v29 = -1073741824;
  v30 = 0;
  v31 = sub_1000129B8;
  v32 = &unk_100020650;
  v33 = v48;
  v34 = v50;
  v35 = v47;
  dispatch_async(queue, &v28);

  objc_storeStrong(&v35, 0);
  objc_storeStrong((id *)&v34, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
}

+ (id)alternateNameForContact:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  BOOL v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  id v15;
  BOOL v16;
  id location[3];
  id v18;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = objc_msgSend(location[0], "emailAddresses");
  v8 = objc_msgSend(v7, "count") != 0;

  v16 = v8;
  if (v8)
  {
    v6 = objc_msgSend(location[0], "emailAddresses");
    v15 = objc_msgSend(v6, "objectAtIndex:", 0);

    v18 = objc_msgSend(v15, "value");
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v4 = objc_msgSend(location[0], "familyName");
    v13 = 0;
    v11 = 0;
    v9 = 0;
    v5 = 0;
    if (!objc_msgSend(v4, "length"))
    {
      v14 = objc_msgSend(location[0], "givenName");
      v13 = 1;
      v5 = 0;
      if (!objc_msgSend(v14, "length"))
      {
        v12 = objc_msgSend(location[0], "nickname");
        v11 = 1;
        v5 = 0;
        if (!objc_msgSend(v12, "length"))
        {
          v10 = objc_msgSend(location[0], "organizationName");
          v9 = 1;
          v5 = objc_msgSend(v10, "length") == 0;
        }
      }
    }
    if ((v9 & 1) != 0)

    if ((v11 & 1) != 0)
    if ((v13 & 1) != 0)

    if (v5)
      v18 = (id)DDLocalizedString(CFSTR("No Name"), CFSTR("Name that will be shown instead when the user creates a new contact based on a phone number or email address only when no names are available to show."));
    else
      v18 = 0;
  }
  objc_storeStrong(location, 0);
  return v18;
}

- (void)setCancelButtonVisible:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  BOOL v8;

  if (a3)
  {
    v7 = -[CNContactViewController navigationItem](self->_personViewController, "navigationItem");
    v3 = objc_msgSend(v7, "rightBarButtonItem");
    v8 = v3 != 0;

    if (!v8)
    {
      v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "cancelPressed:");
      v5 = -[CNContactViewController navigationItem](self->_personViewController, "navigationItem");
      objc_msgSend(v5, "setRightBarButtonItem:", v6);

    }
  }
  else
  {
    v4 = -[CNContactViewController navigationItem](self->_personViewController, "navigationItem");
    objc_msgSend(v4, "setRightBarButtonItem:", 0);

  }
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  -[DDAddToContactsViewController setCancelButtonVisible:](self, "setCancelButtonVisible:", !a3);
}

- (void)doneWithAddingContactShouldDismiss:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  v3 = -[DDAddToContactsViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  objc_msgSend(v3, "actionDidFinishShouldDismiss:", v4);

  -[DDAddToContactsViewController setCancellable:](self, "setCancellable:", 1);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v4;
  id v6;
  id v7;
  BOOL v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(id *, void *);
  void *v13;
  id v14;
  id v15;
  objc_super v16;
  id v17;
  id location[2];
  DDAddToContactsViewController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16.receiver = v19;
  v16.super_class = (Class)DDAddToContactsViewController;
  -[DDAddToContactsViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v16, "willTransitionToTraitCollection:withTransitionCoordinator:", location[0], v17);
  v6 = objc_msgSend(location[0], "verticalSizeClass");
  v7 = -[DDAddToContactsViewController traitCollection](v19, "traitCollection");
  v8 = v6 == objc_msgSend(v7, "verticalSizeClass");

  if (!v8)
  {
    v4 = v17;
    v9 = _NSConcreteStackBlock;
    v10 = -1073741824;
    v11 = 0;
    v12 = sub_100013644;
    v13 = &unk_100020880;
    v14 = location[0];
    v15 = v17;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", &v9);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  DDAddToContactsViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  if (!self->_contactBeingAdded)
    -[DDAddToContactsViewController doneWithAddingContactShouldDismiss:](v6, "doneWithAddingContactShouldDismiss:", 0);
  v3.receiver = v6;
  v3.super_class = (Class)DDAddToContactsViewController;
  -[DDAddToContactsViewController viewDidDisappear:](&v3, "viewDidDisappear:", v4);
}

- (void)cancelPressed:(id)a3
{
  id location[2];
  DDAddToContactsViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v4->_contactBeingAdded)
    -[DDAddToContactsViewController doneWithAddingContactShouldDismiss:](v4, "doneWithAddingContactShouldDismiss:", 1);
  objc_storeStrong(location, 0);
}

- (void)setCancellable:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  v3 = -[DDAddToContactsViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  objc_msgSend(v3, "actionCanBeCancelledExternally:", v4);

}

- (void)contactViewControllerForUnknownContactDidBeginAddingToContacts:(id)a3
{
  id location[2];
  DDAddToContactsViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_contactBeingAdded = 1;
  -[DDAddToContactsViewController setCancellable:](v4, "setCancellable:", 0);
  objc_storeStrong(location, 0);
}

- (void)contactViewControllerForUnknownContactDidEndAddingToContacts:(id)a3
{
  id location[2];
  DDAddToContactsViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_contactBeingAdded = 0;
  -[DDAddToContactsViewController setCancellable:](v4, "setCancellable:", 1);
  objc_storeStrong(location, 0);
}

- (DDAction)action
{
  return (DDAction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personViewController, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
