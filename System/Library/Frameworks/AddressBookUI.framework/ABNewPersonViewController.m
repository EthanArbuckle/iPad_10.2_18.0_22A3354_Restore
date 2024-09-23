@implementation ABNewPersonViewController

- (ABNewPersonViewController)initWithNibName:(id)a3 bundle:(id)a4 style:(int)a5
{
  ABNewPersonViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABNewPersonViewController;
  v5 = -[ABNewPersonViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0, *(_QWORD *)&a5);
  if (v5)
  {
    -[ABNewPersonViewController setTitle:](v5, "setTitle:", objc_msgSend((id)ABAddressBookUIBundle(), "localizedStringForKey:value:table:", CFSTR("CREATE_NEW_CONTACT_TITLE"), &stru_24F203440, CFSTR("AB")));
    -[ABNewPersonViewController setRestorationClass:](v5, "setRestorationClass:", objc_opt_class());
    -[ABNewPersonViewController setRestorationIdentifier:](v5, "setRestorationIdentifier:", CFSTR("kABNewPersonViewControllerRestorationIdentifier"));
  }
  return v5;
}

- (ABNewPersonViewController)init
{
  return -[ABNewPersonViewController initWithNibName:bundle:style:](self, "initWithNibName:bundle:style:", 0, 0, 0);
}

- (ABNewPersonViewController)initWithStyle:(int)a3
{
  return -[ABNewPersonViewController initWithNibName:bundle:style:](self, "initWithNibName:bundle:style:", 0, 0, *(_QWORD *)&a3);
}

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[CNContactViewController setDelegate:](self->_cnContactViewController, "setDelegate:", 0);

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);

  v4.receiver = self;
  v4.super_class = (Class)ABNewPersonViewController;
  -[ABNewPersonViewController dealloc](&v4, sel_dealloc);
}

- (id)newPersonViewDelegate
{
  return self->_newPersonViewDelegate;
}

- (void)setNewPersonViewDelegate:(id)newPersonViewDelegate
{
  self->_newPersonViewDelegate = (ABNewPersonViewControllerDelegate *)newPersonViewDelegate;
}

- (ABAddressBookRef)addressBook
{
  ABAddressBookRef result;
  void *v4;
  void *v5;

  result = self->_addressBook;
  if (!result)
  {
    if (-[ABNewPersonViewController displayedPerson](self, "displayedPerson"))
    {
      v4 = (void *)MEMORY[0x22E2C70D8](-[ABNewPersonViewController displayedPerson](self, "displayedPerson"));
      self->_addressBook = v4;
      if (v4)
        CFRetain(v4);
    }
    if (-[ABNewPersonViewController parentGroup](self, "parentGroup"))
    {
      v5 = (void *)MEMORY[0x22E2C70D8](-[ABNewPersonViewController parentGroup](self, "parentGroup"));
      self->_addressBook = v5;
      if (!v5)
      {
LABEL_9:
        result = (ABAddressBookRef)ABAddressBookCreateWithOptionsAndPolicy();
        self->_addressBook = (void *)result;
        return result;
      }
      CFRetain(v5);
    }
    result = self->_addressBook;
    if (result)
      return result;
    goto LABEL_9;
  }
  return result;
}

- (void)setAddressBook:(ABAddressBookRef)addressBook
{
  ABAddressBookRef v4;

  v4 = self->_addressBook;
  if (v4 != addressBook)
  {
    if (v4)
    {
      CFRelease(v4);
      self->_addressBook = 0;
    }
    if (addressBook)
      self->_addressBook = (void *)CFRetain(addressBook);
  }
}

- (ABRecordRef)displayedPerson
{
  return self->_displayedPerson;
}

- (void)setDisplayedPerson:(ABRecordRef)displayedPerson
{
  void *v5;

  v5 = self->_displayedPerson;
  if (v5)
  {
    CFRelease(v5);
    self->_displayedPerson = 0;
  }
  if (displayedPerson)
    self->_displayedPerson = (void *)CFRetain(displayedPerson);
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  -[ABNewPersonViewController setView:](self, "setView:", (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24)));
  objc_msgSend((id)-[ABNewPersonViewController view](self, "view"), "setAutoresizingMask:", 18);
  -[ABNewPersonViewController loadContactViewController](self, "loadContactViewController");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ABNewPersonViewController;
  -[ABNewPersonViewController setEditing:animated:](&v5, sel_setEditing_animated_, 1, 0);
  -[CNContactViewController setEditing:animated:](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "setEditing:animated:", 1, 0);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CNContactViewController preferredContentSize](self->_cnContactViewController, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ABNewPersonViewController;
  -[ABNewPersonViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ABNewPersonViewController preferredContentSize](self, "preferredContentSize");
  -[ABNewPersonViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  ABAddressBookRef v6;
  ABNewPersonViewControllerDelegate *v7;
  ABNewPersonViewController *v8;
  ABRecordRef v9;
  ABNewPersonViewControllerDelegate *newPersonViewDelegate;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (a4)
    {
      if (-[ABNewPersonViewController displayedPerson](self, "displayedPerson"))
      {
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BE19228], "sharedInstance"), "isAccessGranted"))
          v6 = -[ABNewPersonViewController addressBook](self, "addressBook");
        else
          v6 = 0;
        objc_msgSend(a4, "updateNewPublicABPerson:inAddressBook:", -[ABNewPersonViewController displayedPerson](self, "displayedPerson"), v6);
      }
      newPersonViewDelegate = self->_newPersonViewDelegate;
      v9 = -[ABNewPersonViewController displayedPerson](self, "displayedPerson");
      v7 = newPersonViewDelegate;
      v8 = self;
    }
    else
    {
      v7 = self->_newPersonViewDelegate;
      v8 = self;
      v9 = 0;
    }
    -[ABNewPersonViewControllerDelegate newPersonViewController:didCompleteWithNewPerson:](v7, "newPersonViewController:didCompleteWithNewPerson:", v8, v9);
  }
}

- (void)loadContactViewController
{
  ABRecordRef v3;
  const void *v4;
  ABRecordRef v5;
  ABRecordRef v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (!-[ABNewPersonViewController displayedPerson](self, "displayedPerson"))
  {
    if (-[ABNewPersonViewController parentGroup](self, "parentGroup"))
    {
      v3 = ABGroupCopySource(-[ABNewPersonViewController parentGroup](self, "parentGroup"));
      if (!v3)
      {
        -[ABNewPersonViewController setDisplayedPerson:](self, "setDisplayedPerson:", 0);
        goto LABEL_12;
      }
      v4 = v3;
      v5 = ABPersonCreateInSource(v3);
      CFRelease(v4);
    }
    else
    {
      if (-[ABNewPersonViewController parentSource](self, "parentSource"))
        v6 = ABPersonCreateInSource(-[ABNewPersonViewController parentSource](self, "parentSource"));
      else
        v6 = ABPersonCreate();
      v5 = v6;
    }
    -[ABNewPersonViewController setDisplayedPerson:](self, "setDisplayedPerson:", v5);
    if (v5)
      CFRelease(v5);
  }
LABEL_12:
  v15[0] = objc_msgSend(MEMORY[0x24BDBAE90], "descriptorForRequiredKeys");
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = objc_msgSend(v7, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBAE80], "allCardProperties"));
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBACA0], "contactFromPublicABPerson:keysToFetch:mutable:", -[ABNewPersonViewController displayedPerson](self, "displayedPerson"), v8, 1);
  if (-[ABNewPersonViewController parentGroup](self, "parentGroup"))
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BE19228], "sharedInstance"), "isAccessGranted"))
    {
      v14 = 0;
      v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBACF8], "contactStoreForPublicAddressBook:", -[ABNewPersonViewController addressBook](self, "addressBook")), "groupsMatchingPredicate:error:", objc_msgSend(MEMORY[0x24BDBAD30], "predicateForiOSLegacyIdentifier:", MEMORY[0x22E2C70E4](-[ABNewPersonViewController parentGroup](self, "parentGroup"))), &v14);
      v11 = v10;
      if (!v10)
      {
        NSLog(CFSTR("Can't retrieve group matching parentGroup with error %@, ignoring parentGroup property."), v14);
        goto LABEL_21;
      }
      if (objc_msgSend(v10, "count") == 1)
      {
        v11 = (void *)objc_msgSend(v11, "firstObject");
        goto LABEL_21;
      }
      NSLog(CFSTR("Can't retrieve a single group matching parentGroup (found %@ group(s)), ignoring parentGroup property."), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "count")));
    }
    else
    {
      NSLog(CFSTR("Can't retrieve group matching parentGroup: no contact access"));
    }
  }
  v11 = 0;
LABEL_21:
  if (-[ABNewPersonViewController mergeContact](self, "mergeContact"))
  {
    v12 = objc_msgSend(MEMORY[0x24BDBAE80], "allCardProperties");
    objc_msgSend(v9, "addProperties:excludingProperties:fromContact:", v12, objc_msgSend(MEMORY[0x24BDBAE80], "nameProperties"), -[ABNewPersonViewController mergeContact](self, "mergeContact"));
  }
  -[CNContactViewController willMoveToParentViewController:](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "willMoveToParentViewController:", 0);
  if (-[CNContactViewController isViewLoaded](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "isViewLoaded"))objc_msgSend((id)-[CNContactViewController view](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "view"), "removeFromSuperview");
  -[CNContactViewController removeFromParentViewController](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "removeFromParentViewController");
  -[ABNewPersonViewController setCnContactViewController:](self, "setCnContactViewController:", 0);
  -[ABNewPersonViewController setCnContactViewController:](self, "setCnContactViewController:", objc_msgSend(MEMORY[0x24BDBAE90], "viewControllerForNewContact:", v9));
  -[CNContactViewController setAllowsEditing:](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "setAllowsEditing:", 1);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BE19228], "sharedInstance"), "isAccessGranted"))
    -[CNContactViewController setContactStore:](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "setContactStore:", objc_msgSend(MEMORY[0x24BDBACF8], "contactStoreForPublicAddressBook:", -[ABNewPersonViewController addressBook](self, "addressBook")));
  if (self->_newPersonViewDelegate)
    -[CNContactViewController setDelegate:](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "setDelegate:", self);
  if (v11)
    -[CNContactViewController setParentGroup:](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "setParentGroup:", v11);
  -[ABNewPersonViewController addChildViewController:](self, "addChildViewController:", -[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"));
  v13 = (void *)-[CNContactViewController view](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "view");
  objc_msgSend((id)-[ABNewPersonViewController view](self, "view"), "bounds");
  objc_msgSend(v13, "setFrame:");
  objc_msgSend(v13, "setAutoresizingMask:", 18);
  objc_msgSend((id)-[ABNewPersonViewController view](self, "view"), "addSubview:", v13);
  -[CNContactViewController didMoveToParentViewController:](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "didMoveToParentViewController:", self);
  -[ABNewPersonViewController setEditing:animated:](self, "setEditing:animated:", 1, 0);
}

- (BOOL)showsCancelButton
{
  return 0;
}

- (BOOL)savesNewContactOnSuspend
{
  return 0;
}

- (ABRecordRef)parentGroup
{
  return self->_parentGroup;
}

- (void)setParentGroup:(ABRecordRef)parentGroup
{
  self->_parentGroup = (void *)parentGroup;
}

- (CNContactViewController)cnContactViewController
{
  return self->_cnContactViewController;
}

- (void)setCnContactViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1000);
}

- (void)parentSource
{
  return self->_parentSource;
}

- (void)setParentSource:(void *)a3
{
  self->_parentSource = a3;
}

- (CNContact)mergeContact
{
  return self->_mergeContact;
}

- (void)setMergeContact:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

@end
