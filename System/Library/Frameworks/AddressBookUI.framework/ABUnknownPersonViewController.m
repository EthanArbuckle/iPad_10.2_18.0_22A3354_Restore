@implementation ABUnknownPersonViewController

- (ABUnknownPersonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ABUnknownPersonViewController *v4;
  ABUnknownPersonViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABUnknownPersonViewController;
  v4 = -[ABUnknownPersonViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_allowsAddingToAddressBook = 1;
    v4->_allowsActions = 0;
    objc_msgSend((id)-[ABUnknownPersonViewController navigationItem](v4, "navigationItem"), "_setBackgroundHidden:", 1);
  }
  return v5;
}

- (void)dealloc
{
  void *addressBook;
  void *displayedPerson;
  objc_super v5;

  -[CNContactViewController setDelegate:](self->_cnContactViewController, "setDelegate:", 0);

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  displayedPerson = self->_displayedPerson;
  if (displayedPerson)
    CFRelease(displayedPerson);

  v5.receiver = self;
  v5.super_class = (Class)ABUnknownPersonViewController;
  -[ABUnknownPersonViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  -[ABUnknownPersonViewController setView:](self, "setView:", (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24)));
  objc_msgSend((id)-[ABUnknownPersonViewController view](self, "view"), "setAutoresizingMask:", 18);
  -[ABUnknownPersonViewController loadContactViewController](self, "loadContactViewController");
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  void *v5;
  ABRecordRef v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)ABUnknownPersonViewController;
  -[ABUnknownPersonViewController encodeRestorableStateWithCoder:](&v7, sel_encodeRestorableStateWithCoder_);
  if (-[ABUnknownPersonViewController displayedPerson](self, "displayedPerson"))
  {
    v5 = (void *)MEMORY[0x24BDBACA0];
    v6 = -[ABUnknownPersonViewController displayedPerson](self, "displayedPerson");
    v8[0] = objc_msgSend(MEMORY[0x24BDBAE90], "descriptorForRequiredKeys");
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v5, "contactFromPublicABPerson:keysToFetch:", v6, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1)), CFSTR("kABUnknownPersonRecordKey"));
  }
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  ABAddressBookRef v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ABUnknownPersonViewController;
  -[ABUnknownPersonViewController decodeRestorableStateWithCoder:](&v9, sel_decodeRestorableStateWithCoder_);
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kABUnknownPersonRecordKey"));
  if (v5)
  {
    v6 = v5;
    v8 = -[ABUnknownPersonViewController addressBook](self, "addressBook");
    v7 = objc_msgSend(-[ABUnknownPersonViewController contactStore](self, "contactStore"), "publicABPersonFromContact:publicAddressBook:", v6, &v8);
    if (v7)
      -[ABUnknownPersonViewController setDisplayedPerson:](self, "setDisplayedPerson:", v7);
  }
}

- (CGSize)preferredContentSize
{
  CNContactViewController *cnContactViewController;
  double v3;
  double v4;
  CGSize result;

  cnContactViewController = self->_cnContactViewController;
  if (cnContactViewController)
  {
    -[CNContactViewController preferredContentSize](cnContactViewController, "preferredContentSize");
  }
  else
  {
    v3 = *MEMORY[0x24BDBF148];
    v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ABUnknownPersonViewController;
  -[ABUnknownPersonViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ABUnknownPersonViewController preferredContentSize](self, "preferredContentSize");
  -[ABUnknownPersonViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (ABAddressBookRef)addressBook
{
  ABAddressBookRef result;
  void *v4;

  result = self->_addressBook;
  if (!result)
  {
    if (-[ABUnknownPersonViewController displayedPerson](self, "displayedPerson"))
    {
      v4 = (void *)MEMORY[0x22E2C70D8](-[ABUnknownPersonViewController displayedPerson](self, "displayedPerson"));
      self->_addressBook = v4;
      if (!v4)
      {
LABEL_6:
        result = (ABAddressBookRef)ABAddressBookCreateWithOptionsAndPolicy();
        self->_addressBook = (void *)result;
        return result;
      }
      CFRetain(v4);
    }
    result = self->_addressBook;
    if (result)
      return result;
    goto LABEL_6;
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

- (id)contactStore
{
  return (id)objc_msgSend(MEMORY[0x24BDBACF8], "contactStoreForPublicAddressBook:", -[ABUnknownPersonViewController addressBook](self, "addressBook"));
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

- (CNContactViewController)cnContactViewController
{
  if (!self->_cnContactViewController
    && (-[ABUnknownPersonViewController displayedPerson](self, "displayedPerson")
     || -[ABUnknownPersonViewController alternateName](self, "alternateName")))
  {
    -[ABUnknownPersonViewController loadContactViewController](self, "loadContactViewController");
  }
  return self->_cnContactViewController;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  ABAddressBookRef v6;
  void *v7;
  ABRecordRef v8;
  ABRecordRef v9;
  ABAddressBookRef v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[ABUnknownPersonViewController unknownPersonViewDelegate](self, "unknownPersonViewDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (a4)
    {
      v6 = -[ABUnknownPersonViewController addressBook](self, "addressBook");
      v10 = v6;
      if (!-[ABUnknownPersonViewController displayedPerson](self, "displayedPerson"))
        goto LABEL_8;
      v7 = (void *)MEMORY[0x24BDBACA0];
      v8 = -[ABUnknownPersonViewController displayedPerson](self, "displayedPerson");
      v11[0] = *MEMORY[0x24BDBA2E0];
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "contactFromPublicABPerson:keysToFetch:", v8, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1)), "identifier"), "isEqualToString:", objc_msgSend(a4, "identifier")))goto LABEL_8;
      if ((objc_msgSend(a4, "updateNewPublicABPerson:inAddressBook:", -[ABUnknownPersonViewController displayedPerson](self, "displayedPerson"), v6) & 1) == 0)NSLog(CFSTR("Couldn't update displayedPerson with %@"), a4);
      v9 = -[ABUnknownPersonViewController displayedPerson](self, "displayedPerson");
      if (!v9)
LABEL_8:
        v9 = (ABRecordRef)objc_msgSend(-[ABUnknownPersonViewController contactStore](self, "contactStore"), "publicABPersonFromContact:publicAddressBook:", a4, &v10);
      objc_msgSend(-[ABUnknownPersonViewController unknownPersonViewDelegate](self, "unknownPersonViewDelegate"), "unknownPersonViewController:didResolveToPerson:", self, v9);
    }
    else
    {
      objc_msgSend(-[ABUnknownPersonViewController unknownPersonViewDelegate](self, "unknownPersonViewDelegate"), "unknownPersonViewController:didResolveToPerson:", self, 0);
    }
  }
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 property:(id)a5 labeledValue:(id)a6
{
  uint64_t v10;
  ABAddressBookRef v12;

  -[ABUnknownPersonViewController unknownPersonViewDelegate](self, "unknownPersonViewDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 1;
  v12 = -[ABUnknownPersonViewController addressBook](self, "addressBook");
  v10 = objc_msgSend(-[ABUnknownPersonViewController contactStore](self, "contactStore"), "publicABPersonFromContact:publicAddressBook:", a4, &v12);
  return objc_msgSend(-[ABUnknownPersonViewController unknownPersonViewDelegate](self, "unknownPersonViewDelegate"), "unknownPersonViewController:shouldPerformDefaultActionForPerson:property:identifier:", self, v10, objc_msgSend(MEMORY[0x24BDBACA0], "publicABPropertyIDFromContactPropertyKey:", a5), objc_msgSend(-[ABUnknownPersonViewController contactStore](self, "contactStore"), "publicMultiValueIdentifierFromLabeledValue:", a6));
}

- (void)loadContactViewController
{
  void *v4;
  ABRecordRef v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (!-[ABUnknownPersonViewController displayedPerson](self, "displayedPerson")
    && !-[ABUnknownPersonViewController alternateName](self, "alternateName"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ABUnknownPersonViewController.m"), 249, CFSTR("We should always have a person here."));
  }
  v4 = (void *)MEMORY[0x24BDBACA0];
  v5 = -[ABUnknownPersonViewController displayedPerson](self, "displayedPerson");
  v9[0] = objc_msgSend(MEMORY[0x24BDBAE90], "descriptorForRequiredKeys");
  v6 = objc_msgSend(v4, "contactFromPublicABPerson:keysToFetch:", v5, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1));
  -[CNContactViewController willMoveToParentViewController:](self->_cnContactViewController, "willMoveToParentViewController:", 0);
  if (-[CNContactViewController isViewLoaded](self->_cnContactViewController, "isViewLoaded"))
    objc_msgSend((id)-[CNContactViewController view](self->_cnContactViewController, "view"), "removeFromSuperview");
  -[CNContactViewController removeFromParentViewController](self->_cnContactViewController, "removeFromParentViewController");
  self->_cnContactViewController = 0;
  -[ABUnknownPersonViewController setCnContactViewController:](self, "setCnContactViewController:", objc_msgSend(MEMORY[0x24BDBAE90], "viewControllerForUnknownContact:", v6));
  -[CNContactViewController setAllowsEditing:](self->_cnContactViewController, "setAllowsEditing:", 0);
  -[CNContactViewController setMessage:](self->_cnContactViewController, "setMessage:", -[ABUnknownPersonViewController message](self, "message"));
  -[CNContactViewController setAllowsActions:](self->_cnContactViewController, "setAllowsActions:", -[ABUnknownPersonViewController allowsActions](self, "allowsActions"));
  -[CNContactViewController setAlternateName:](self->_cnContactViewController, "setAlternateName:", -[ABUnknownPersonViewController alternateName](self, "alternateName"));
  if (-[ABUnknownPersonViewController allowsAddingToAddressBook](self, "allowsAddingToAddressBook"))
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BE19228], "sharedInstance"), "isAccessGranted"))
      v7 = -[ABUnknownPersonViewController contactStore](self, "contactStore");
    else
      v7 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    -[CNContactViewController setContactStore:](self->_cnContactViewController, "setContactStore:", v7);
  }
  if (-[ABUnknownPersonViewController unknownPersonViewDelegate](self, "unknownPersonViewDelegate"))
    -[CNContactViewController setDelegate:](self->_cnContactViewController, "setDelegate:", self);
  -[ABUnknownPersonViewController addChildViewController:](self, "addChildViewController:", self->_cnContactViewController);
  v8 = (void *)-[CNContactViewController view](self->_cnContactViewController, "view");
  objc_msgSend(v8, "setAutoresizingMask:", 18);
  objc_msgSend((id)-[ABUnknownPersonViewController view](self, "view"), "bounds");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend((id)-[ABUnknownPersonViewController view](self, "view"), "addSubview:", v8);
  -[CNContactViewController didMoveToParentViewController:](self->_cnContactViewController, "didMoveToParentViewController:", self);
}

- (id)unknownPersonViewDelegate
{
  return self->_unknownPersonViewDelegate;
}

- (void)setUnknownPersonViewDelegate:(id)unknownPersonViewDelegate
{
  self->_unknownPersonViewDelegate = (ABUnknownPersonViewControllerDelegate *)unknownPersonViewDelegate;
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setAlternateName:(NSString *)alternateName
{
  objc_setProperty_nonatomic_copy(self, a2, alternateName, 1000);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(NSString *)message
{
  objc_setProperty_nonatomic_copy(self, a2, message, 1008);
}

- (BOOL)allowsActions
{
  return self->_allowsActions;
}

- (void)setAllowsActions:(BOOL)allowsActions
{
  self->_allowsActions = allowsActions;
}

- (BOOL)allowsAddingToAddressBook
{
  return self->_allowsAddingToAddressBook;
}

- (void)setAllowsAddingToAddressBook:(BOOL)allowsAddingToAddressBook
{
  self->_allowsAddingToAddressBook = allowsAddingToAddressBook;
}

- (void)setCnContactViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

@end
