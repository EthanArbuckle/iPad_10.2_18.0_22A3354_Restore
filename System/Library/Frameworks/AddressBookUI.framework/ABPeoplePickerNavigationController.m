@implementation ABPeoplePickerNavigationController

- (ABPeoplePickerNavigationController)initWithAddressBook:(void *)a3
{
  ABPeoplePickerNavigationController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABPeoplePickerNavigationController;
  v4 = -[ABPeoplePickerNavigationController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
  {
    if ((-[ABPeoplePickerNavigationController isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
      NSLog(&CFSTR("ABPeoplePickerNavigationController does not support subclassing in iOS 7.0 and later. In the future, a nil "
                   "instance will be returned.").isa);
    if (a3)
      v5 = (void *)CFRetain(a3);
    else
      v5 = 0;
    v4->_addressBook = v5;
    -[ABPeoplePickerNavigationController _setClipUnderlapWhileTransitioning:](v4, "_setClipUnderlapWhileTransitioning:", 1);
  }
  return v4;
}

- (ABPeoplePickerNavigationController)init
{
  return -[ABPeoplePickerNavigationController initWithAddressBook:](self, "initWithAddressBook:", 0);
}

- (ABPeoplePickerNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[ABPeoplePickerNavigationController initWithAddressBook:](self, "initWithAddressBook:", 0, a4);
}

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  addressBook = self->_addressBook;
  if (addressBook)
  {
    CFRelease(addressBook);
    self->_addressBook = 0;
  }
  self->_peoplePickerDelegate = 0;

  v4.receiver = self;
  v4.super_class = (Class)ABPeoplePickerNavigationController;
  -[ABPeoplePickerNavigationController dealloc](&v4, sel_dealloc);
}

- (void)_setViewController:(id)a3 animated:(BOOL)a4
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = a3;
  -[ABPeoplePickerNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1), a4);
}

- (void)setupViewControllers
{
  CNContactPickerViewController *v3;
  objc_super v4;

  if (!objc_msgSend((id)-[ABPeoplePickerNavigationController viewControllers](self, "viewControllers"), "count"))
  {
    if ((-[ABPeoplePickerNavigationController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
      NSLog(&CFSTR("ABPeoplePickerNavigationController does not support subclassing in iOS 7.0 and later. In the future, a nil "
                   "instance will be returned.").isa);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BE19228], "sharedInstance"), "isAccessGranted"))
    {
      if (!self->_addressBook)
        self->_addressBook = (void *)ABAddressBookCreateWithOptionsAndPolicy();
    }
    v3 = (CNContactPickerViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAE78]), "initWithNibName:bundle:", 0, 0);
    self->_contactPicker = v3;
    -[CNContactPickerViewController setDelegate:](v3, "setDelegate:", self);
    -[CNContactPickerViewController setPredicateForEnablingContact:](self->_contactPicker, "setPredicateForEnablingContact:", -[ABPeoplePickerNavigationController predicateForEnablingPerson](self, "predicateForEnablingPerson"));
    -[CNContactPickerViewController setPredicateForSelectionOfContact:](self->_contactPicker, "setPredicateForSelectionOfContact:", -[ABPeoplePickerNavigationController predicateForSelectionOfPerson](self, "predicateForSelectionOfPerson"));
    -[CNContactPickerViewController setDisplayedPropertyKeys:](self->_contactPicker, "setDisplayedPropertyKeys:", -[ABPeoplePickerNavigationController displayedPropertyKeys](self, "displayedPropertyKeys"));
    -[CNContactPickerViewController setAllowsCancel:](self->_contactPicker, "setAllowsCancel:", -[ABPeoplePickerNavigationController _shouldPreventCancelButtonsFromShowing](self, "_shouldPreventCancelButtonsFromShowing") ^ 1);
    v4.receiver = self;
    v4.super_class = (Class)ABPeoplePickerNavigationController;
    -[ABPeoplePickerNavigationController setNavigationBarHidden:animated:](&v4, sel_setNavigationBarHidden_animated_, 1, 0);
    -[ABPeoplePickerNavigationController _setViewController:animated:](self, "_setViewController:animated:", self->_contactPicker, 0);
    -[CNContactPickerViewController _viewWillBePresented](self->_contactPicker, "_viewWillBePresented");
  }
}

- (id)displayedPropertyKeys
{
  return (id)-[NSArray _cn_map:](-[ABPeoplePickerNavigationController displayedProperties](self, "displayedProperties"), "_cn_map:", &__block_literal_global_0);
}

uint64_t __59__ABPeoplePickerNavigationController_displayedPropertyKeys__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDBACA0], "contactPropertyKeyFromPublicABPropertyID:", objc_msgSend(a2, "intValue"));
}

- (BOOL)respondsToSelector:(SEL)a3
{
  unsigned __int8 v3;
  objc_super v5;

  if (sel_contactPicker_didSelectContactProperty_ == a3 || sel_contactPicker_didSelectContact_ == a3)
  {
    -[ABPeoplePickerNavigationController peoplePickerDelegate](self, "peoplePickerDelegate");
    v3 = objc_opt_respondsToSelector();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ABPeoplePickerNavigationController;
    v3 = -[ABPeoplePickerNavigationController respondsToSelector:](&v5, sel_respondsToSelector_);
  }
  return v3 & 1;
}

- (BOOL)_allowsAutorotation
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ABPeoplePickerNavigationController;
  v2 = -[ABPeoplePickerNavigationController _allowsAutorotation](&v4, sel__allowsAutorotation);
  if (v2)
    LOBYTE(v2) = ABAddressBookShouldAllowAutorotation();
  return v2;
}

- (BOOL)_isDelayingPresentation
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ABPeoplePickerNavigationController;
  if (-[ABPeoplePickerNavigationController _isDelayingPresentation](&v5, sel__isDelayingPresentation))
    return 1;
  if (!self->_ignoreViewWillBePresented && (objc_opt_respondsToSelector() & 1) != 0)
    -[ABPeoplePickerNavigationController _viewWillBePresented](self, "_viewWillBePresented");
  v4.receiver = self;
  v4.super_class = (Class)ABPeoplePickerNavigationController;
  return -[ABPeoplePickerNavigationController _isDelayingPresentation](&v4, sel__isDelayingPresentation);
}

- (void)_endDelayingPresentation
{
  objc_super v3;

  self->_ignoreViewWillBePresented = 1;
  v3.receiver = self;
  v3.super_class = (Class)ABPeoplePickerNavigationController;
  -[ABPeoplePickerNavigationController _endDelayingPresentation](&v3, sel__endDelayingPresentation);
  self->_ignoreViewWillBePresented = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ABPeoplePickerNavigationController;
  -[ABPeoplePickerNavigationController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[ABPeoplePickerNavigationController setupViewControllers](self, "setupViewControllers");
  if ((-[ABPeoplePickerNavigationController isBeingPresented](self, "isBeingPresented") & 1) != 0
    || -[ABPeoplePickerNavigationController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBAED0], "sharedCollector"), "logPresentation");
  }
}

- (ABAddressBookRef)addressBook
{
  return self->_addressBook;
}

- (void)setAddressBook:(ABAddressBookRef)addressBook
{
  int v5;
  void *v6;

  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BE19228], "sharedInstance"), "isAccessGranted");
  if (addressBook && v5 && self->_addressBook != addressBook)
  {
    CFRetain(addressBook);
    v6 = self->_addressBook;
    if (v6)
      CFRelease(v6);
    self->_addressBook = (void *)addressBook;
  }
}

- (id)contactStore
{
  return (id)objc_msgSend(MEMORY[0x24BDBACF8], "contactStoreForPublicAddressBook:", -[ABPeoplePickerNavigationController addressBook](self, "addressBook"));
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  ABAddressBookRef v8;

  _CNUILog();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[ABPeoplePickerNavigationController contactStore](self, "contactStore", a4);
    if (!v6)
      v6 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    v8 = -[ABPeoplePickerNavigationController addressBook](self, "addressBook");
    objc_msgSend(self->_peoplePickerDelegate, "peoplePickerNavigationController:didSelectPerson:", self, objc_msgSend(v6, "publicABPersonFromContact:publicAddressBook:", a4, &v8));
  }
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6;
  uint64_t v7;
  ABAddressBookRef v9;

  _CNUILog();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[ABPeoplePickerNavigationController contactStore](self, "contactStore", a4);
    if (!v6)
      v6 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    v9 = -[ABPeoplePickerNavigationController addressBook](self, "addressBook");
    v7 = objc_msgSend(v6, "publicABPersonFromContact:publicAddressBook:", objc_msgSend(a4, "contact"), &v9);
    objc_msgSend(self->_peoplePickerDelegate, "peoplePickerNavigationController:didSelectPerson:property:identifier:", self, v7, objc_msgSend(MEMORY[0x24BDBACA0], "publicABPropertyIDFromContactPropertyKey:", objc_msgSend(a4, "key")), objc_msgSend(v6, "publicMultiValueIdentifierFromLabeledValue:", objc_msgSend(a4, "labeledValue")));
  }
}

- (void)contactPickerDidCancel:(id)a3
{
  _CNUILog();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_peoplePickerDelegate, "peoplePickerNavigationControllerDidCancel:", self);
}

- (id)peoplePickerDelegate
{
  return self->_peoplePickerDelegate;
}

- (void)setPeoplePickerDelegate:(id)peoplePickerDelegate
{
  self->_peoplePickerDelegate = peoplePickerDelegate;
}

- (NSArray)displayedProperties
{
  return self->_displayedProperties;
}

- (void)setDisplayedProperties:(NSArray *)displayedProperties
{
  objc_setProperty_nonatomic_copy(self, a2, displayedProperties, 1440);
}

- (NSPredicate)predicateForEnablingPerson
{
  return self->_predicateForEnablingPerson;
}

- (void)setPredicateForEnablingPerson:(NSPredicate *)predicateForEnablingPerson
{
  objc_setProperty_nonatomic_copy(self, a2, predicateForEnablingPerson, 1448);
}

- (NSPredicate)predicateForSelectionOfPerson
{
  return self->_predicateForSelectionOfPerson;
}

- (void)setPredicateForSelectionOfPerson:(NSPredicate *)predicateForSelectionOfPerson
{
  objc_setProperty_nonatomic_copy(self, a2, predicateForSelectionOfPerson, 1456);
}

- (NSPredicate)predicateForSelectionOfProperty
{
  return self->_predicateForSelectionOfProperty;
}

- (void)setPredicateForSelectionOfProperty:(NSPredicate *)predicateForSelectionOfProperty
{
  objc_setProperty_nonatomic_copy(self, a2, predicateForSelectionOfProperty, 1464);
}

@end
