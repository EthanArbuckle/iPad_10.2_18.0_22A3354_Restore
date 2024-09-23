@implementation ABPersonViewController

- (ABPersonViewController)init
{
  return -[ABPersonViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (ABPersonViewController)initWithNibName:(id)a3 bundle:(id)a4 addressBook:(void *)a5 style:(int)a6
{
  uint64_t v6;
  ABPersonViewController *v8;
  ABPersonViewController *v9;
  objc_super v11;

  v6 = *(_QWORD *)&a6;
  v11.receiver = self;
  v11.super_class = (Class)ABPersonViewController;
  v8 = -[ABPersonViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[ABPersonViewController setAddressBook:](v8, "setAddressBook:", a5);
    -[ABPersonViewController setAllowsEditing:](v9, "setAllowsEditing:", 1);
    -[ABPersonViewController setAllowsActions:](v9, "setAllowsActions:", 1);
    -[ABPersonViewController setShouldShowLinkedPeople:](v9, "setShouldShowLinkedPeople:", 0);
    -[ABPersonViewController setRestorationIdentifier:](v9, "setRestorationIdentifier:", CFSTR("PeoplePickerPersonRestorationIdentifier"));
    -[ABPersonViewController setRestorationClass:](v9, "setRestorationClass:", objc_opt_class());
    objc_msgSend((id)-[ABPersonViewController navigationItem](v9, "navigationItem"), "_setBackgroundHidden:", 1);
    -[ABPersonViewController setStyle:](v9, "setStyle:", v6);
  }
  return v9;
}

- (ABPersonViewController)initWithNibName:(id)a3 bundle:(id)a4 addressBook:(void *)a5
{
  return -[ABPersonViewController initWithNibName:bundle:addressBook:style:](self, "initWithNibName:bundle:addressBook:style:", a3, a4, a5, 0);
}

- (ABPersonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[ABPersonViewController initWithNibName:bundle:addressBook:](self, "initWithNibName:bundle:addressBook:", a3, a4, 0);
}

- (ABPersonViewController)initWithStyle:(int)a3
{
  return -[ABPersonViewController initWithNibName:bundle:addressBook:style:](self, "initWithNibName:bundle:addressBook:style:", 0, 0, 0, *(_QWORD *)&a3);
}

- (ABPersonViewController)initWithAddressBook:(void *)a3
{
  return -[ABPersonViewController initWithNibName:bundle:addressBook:](self, "initWithNibName:bundle:addressBook:", 0, 0, a3);
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
  v5.super_class = (Class)ABPersonViewController;
  -[ABPersonViewController dealloc](&v5, sel_dealloc);
}

- (ABAddressBookRef)addressBook
{
  ABAddressBookRef result;
  void *v4;

  result = self->_addressBook;
  if (!result)
  {
    if (-[ABPersonViewController displayedPerson](self, "displayedPerson"))
    {
      v4 = (void *)MEMORY[0x22E2C70D8](-[ABPersonViewController displayedPerson](self, "displayedPerson"));
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

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_msgSend(MEMORY[0x24BDBACF8], "contactStoreForPublicAddressBook:", -[ABPersonViewController addressBook](self, "addressBook"));
}

- (ABRecordRef)displayedPerson
{
  return self->_displayedPerson;
}

- (void)setDisplayedPerson:(ABRecordRef)displayedPerson
{
  void *v5;

  if (self->_displayedPerson != displayedPerson)
  {
    -[ABPersonViewController setAddressBook:](self, "setAddressBook:", 0);
    v5 = self->_displayedPerson;
    if (v5)
    {
      CFRelease(v5);
      self->_displayedPerson = (void *)displayedPerson;
    }
    if (displayedPerson)
      self->_displayedPerson = (void *)CFRetain(displayedPerson);
    if (-[ABPersonViewController cnContactViewController](self, "cnContactViewController"))
      -[ABPersonViewController reloadContactViewController](self, "reloadContactViewController");
  }
}

- (void)setHighlightedItemForProperty:(ABPropertyID)property withIdentifier:(ABMultiValueIdentifier)identifier
{
  -[ABPersonViewController setHighlightedItemForProperty:withIdentifier:important:](self, "setHighlightedItemForProperty:withIdentifier:important:", *(_QWORD *)&property, *(_QWORD *)&identifier, 0);
}

- (void)loadView
{
  -[ABPersonViewController setView:](self, "setView:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 500.0, 500.0));
  objc_msgSend((id)-[ABPersonViewController view](self, "view"), "setAutoresizingMask:", 18);
  if (!-[ABPersonViewController cnContactViewController](self, "cnContactViewController"))
    -[ABPersonViewController reloadContactViewController](self, "reloadContactViewController");
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  ABRecordRef v5;
  const void *v6;
  CFTypeRef v7;
  CFTypeRef v8;
  int v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ABPersonViewController;
  -[ABPersonViewController encodeRestorableStateWithCoder:](&v10, sel_encodeRestorableStateWithCoder_);
  v5 = -[ABPersonViewController displayedPerson](self, "displayedPerson");
  if (v5)
  {
    v6 = v5;
    v7 = ABRecordCopyValue(v5, *MEMORY[0x24BDB4AC8]);
    v8 = ABRecordCopyValue(v6, *MEMORY[0x24BDB4AE0]);
    v9 = MEMORY[0x22E2C70E4](v6);
    if (v7)
    {
      objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("FirstName"));
      CFRelease(v7);
    }
    if (v8)
    {
      objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("LastName"));
      CFRelease(v8);
    }
    objc_msgSend(a3, "encodeInteger:forKey:", v9, CFSTR("Identifier"));
  }
  objc_msgSend(a3, "encodeBool:forKey:", -[ABPersonViewController shouldShowLinkedPeople](self, "shouldShowLinkedPeople"), CFSTR("kABDisplayedPersonShowLinkedPeople"));
}

+ (ABPersonViewController)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ABRecordRef PersonWithRecordID;
  const void *v10;
  CFTypeRef v11;
  CFTypeRef v12;
  ABPersonViewController *v13;

  v5 = (const void *)ABAddressBookCreateWithOptionsAndPolicy();
  v6 = (void *)objc_msgSend(a4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstName"));
  v7 = (void *)objc_msgSend(a4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastName"));
  v8 = objc_msgSend(a4, "decodeIntegerForKey:", CFSTR("Identifier"));
  if ((_DWORD)v8 == -1)
    goto LABEL_17;
  PersonWithRecordID = ABAddressBookGetPersonWithRecordID(v5, v8);
  if (!PersonWithRecordID)
  {
    NSLog(CFSTR("%s: No person found for id %ld, was looking for first name %@ and last name %@"), "ABRecordRef _getPersonFromSavedState(NSCoder *, ABAddressBookRef)", (int)v8, v6, v7);
    goto LABEL_17;
  }
  v10 = PersonWithRecordID;
  v11 = ABRecordCopyValue(PersonWithRecordID, *MEMORY[0x24BDB4AC8]);
  v12 = ABRecordCopyValue(v10, *MEMORY[0x24BDB4AE0]);
  if (v6 && !objc_msgSend(v6, "isEqualToString:", v11)
    || v7 && !objc_msgSend(v7, "isEqualToString:", v12))
  {
    NSLog(CFSTR("%s: Mismatch on name for id %i with first name %@ and last name %@, record first name %@, record last name %@"), "ABRecordRef _getPersonFromSavedState(NSCoder *, ABAddressBookRef)", v8, v6, v7, v11, v12);
    v10 = 0;
    if (!v11)
      goto LABEL_12;
    goto LABEL_11;
  }
  NSLog(CFSTR("%s: Found person for id %i with first name %@ and last name %@"), "ABRecordRef _getPersonFromSavedState(NSCoder *, ABAddressBookRef)", v8, v6, v7);
  if (v11)
LABEL_11:
    CFRelease(v11);
LABEL_12:
  if (v12)
    CFRelease(v12);
  if (v10)
  {
    v13 = -[ABPersonViewController initWithAddressBook:]([ABPersonViewController alloc], "initWithAddressBook:", v5);
    -[ABPersonViewController setDisplayedPerson:](v13, "setDisplayedPerson:", v10);
    -[ABPersonViewController setShouldShowLinkedPeople:](v13, "setShouldShowLinkedPeople:", objc_msgSend(a4, "decodeBoolForKey:", CFSTR("kABDisplayedPersonShowLinkedPeople")));
    if (!v5)
      return v13;
    goto LABEL_18;
  }
LABEL_17:
  NSLog(CFSTR("%s: No person found from info in state archive, no person controller for you"), "+[ABPersonViewController viewControllerWithRestorationIdentifierPath:coder:]");
  v13 = 0;
  if (v5)
LABEL_18:
    CFRelease(v5);
  return v13;
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
  v4.super_class = (Class)ABPersonViewController;
  -[ABPersonViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ABPersonViewController preferredContentSize](self, "preferredContentSize");
  -[ABPersonViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  uint64_t v6;
  ABAddressBookRef v8;

  -[ABPersonViewController personViewDelegate](self, "personViewDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 1;
  v8 = -[ABPersonViewController addressBook](self, "addressBook");
  v6 = -[CNContactStore publicABPersonFromContact:publicAddressBook:](-[ABPersonViewController contactStore](self, "contactStore"), "publicABPersonFromContact:publicAddressBook:", objc_msgSend(a4, "contact"), &v8);
  return objc_msgSend(-[ABPersonViewController personViewDelegate](self, "personViewDelegate"), "personViewController:shouldPerformDefaultActionForPerson:property:identifier:", self, v6, objc_msgSend(MEMORY[0x24BDBACA0], "publicABPropertyIDFromContactPropertyKey:", objc_msgSend(a4, "key")), -[CNContactStore publicMultiValueIdentifierFromLabeledValue:](-[ABPersonViewController contactStore](self, "contactStore"), "publicMultiValueIdentifierFromLabeledValue:", objc_msgSend(a4, "labeledValue")));
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  if (-[ABPersonViewController displayedPerson](self, "displayedPerson", a3))
    objc_msgSend(a4, "overwritePublicABPerson:", -[ABPersonViewController displayedPerson](self, "displayedPerson"));
}

- (void)setHighlightedItemForProperty:(int)a3 withIdentifier:(int)a4 important:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  -[ABPersonViewController setHighlightedProperty:](self, "setHighlightedProperty:", *(_QWORD *)&a3);
  -[ABPersonViewController setHighlightedMultiValueIdentifier:](self, "setHighlightedMultiValueIdentifier:", v6);
  -[ABPersonViewController setHighlightedImportant:](self, "setHighlightedImportant:", v5);
}

- (void)setHighlightedItemForProperty:(int)a3 withIdentifier:(int)a4 person:(void *)a5 important:(BOOL)a6
{
  -[ABPersonViewController setHighlightedItemForProperty:withIdentifier:important:](self, "setHighlightedItemForProperty:withIdentifier:important:", *(_QWORD *)&a3, *(_QWORD *)&a4, a6);
}

- (void)reloadContactViewController
{
  ABRecordRef v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[3];

  v24[1] = *MEMORY[0x24BDAC8D0];
  if (!-[ABPersonViewController displayedPerson](self, "displayedPerson"))
  {
    v3 = ABPersonCreate();
    -[ABPersonViewController setDisplayedPerson:](self, "setDisplayedPerson:", v3);
    if (v3)
      CFRelease(v3);
  }
  v4 = objc_msgSend(MEMORY[0x24BDBACA0], "contactPropertyKeyFromPublicABPropertyID:", -[ABPersonViewController highlightedProperty](self, "highlightedProperty"));
  v24[0] = objc_msgSend(MEMORY[0x24BDBAE90], "descriptorForRequiredKeys");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v6 = (uint64_t)v5;
  if (v4)
    v6 = objc_msgSend(v5, "arrayByAddingObject:", v4);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBACA0], "contactFromPublicABPerson:keysToFetch:", -[ABPersonViewController displayedPerson](self, "displayedPerson"), v6);
  v8 = v7;
  if (v4
    && (v9 = (void *)objc_msgSend(v7, "valueForKey:", v4), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v21 = 0u,
        v22 = 0u,
        v19 = 0u,
        v20 = 0u,
        (v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16)) != 0))
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "iOSLegacyIdentifier");
        if (v15 == -[ABPersonViewController highlightedMultiValueIdentifier](self, "highlightedMultiValueIdentifier"))
        {
          v16 = objc_msgSend(v14, "identifier");
          goto LABEL_18;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v16 = 0;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_18:
  v17 = -[NSArray _cn_map:](-[ABPersonViewController displayedProperties](self, "displayedProperties"), "_cn_map:", &__block_literal_global_1);
  -[CNContactViewController willMoveToParentViewController:](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "willMoveToParentViewController:", 0);
  if (-[CNContactViewController isViewLoaded](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "isViewLoaded"))objc_msgSend((id)-[CNContactViewController view](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "view"), "removeFromSuperview");
  -[CNContactViewController removeFromParentViewController](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "removeFromParentViewController");
  -[ABPersonViewController setCnContactViewController:](self, "setCnContactViewController:", 0);
  -[ABPersonViewController setCnContactViewController:](self, "setCnContactViewController:", objc_msgSend(MEMORY[0x24BDBAE90], "viewControllerForContact:", v8));
  -[CNContactViewController setAllowsEditing:](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "setAllowsEditing:", -[ABPersonViewController allowsEditing](self, "allowsEditing"));
  -[CNContactViewController setAllowsActions:](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "setAllowsActions:", -[ABPersonViewController allowsActions](self, "allowsActions"));
  -[CNContactViewController setShouldShowLinkedContacts:](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "setShouldShowLinkedContacts:", -[ABPersonViewController shouldShowLinkedPeople](self, "shouldShowLinkedPeople"));
  -[CNContactViewController setDisplayedPropertyKeys:](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "setDisplayedPropertyKeys:", v17);
  -[CNContactViewController setDelegate:](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "setDelegate:", self);
  -[CNContactViewController highlightPropertyWithKey:identifier:important:](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "highlightPropertyWithKey:identifier:important:", v4, v16, -[ABPersonViewController highlightedImportant](self, "highlightedImportant"));
  -[CNContactViewController setContactStore:](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "setContactStore:", -[ABPersonViewController contactStore](self, "contactStore"));
  -[ABPersonViewController addChildViewController:](self, "addChildViewController:", -[ABPersonViewController cnContactViewController](self, "cnContactViewController"));
  v18 = (void *)-[CNContactViewController view](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "view");
  objc_msgSend((id)-[ABPersonViewController view](self, "view"), "bounds");
  objc_msgSend(v18, "setFrame:");
  objc_msgSend(v18, "setAutoresizingMask:", 18);
  objc_msgSend((id)-[ABPersonViewController view](self, "view"), "addSubview:", v18);
  -[CNContactViewController didMoveToParentViewController:](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "didMoveToParentViewController:", self);
}

uint64_t __53__ABPersonViewController_reloadContactViewController__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDBACA0], "contactPropertyKeyFromPublicABPropertyID:", objc_msgSend(a2, "intValue"));
}

- (id)personViewDelegate
{
  return self->_personViewDelegate;
}

- (void)setPersonViewDelegate:(id)personViewDelegate
{
  self->_personViewDelegate = (ABPersonViewControllerDelegate *)personViewDelegate;
}

- (NSArray)displayedProperties
{
  return self->_displayedProperties;
}

- (void)setDisplayedProperties:(NSArray *)displayedProperties
{
  objc_setProperty_nonatomic_copy(self, a2, displayedProperties, 1008);
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)allowsEditing
{
  self->_allowsEditing = allowsEditing;
}

- (BOOL)allowsActions
{
  return self->_allowsActions;
}

- (void)setAllowsActions:(BOOL)allowsActions
{
  self->_allowsActions = allowsActions;
}

- (BOOL)shouldShowLinkedPeople
{
  return self->_shouldShowLinkedPeople;
}

- (void)setShouldShowLinkedPeople:(BOOL)shouldShowLinkedPeople
{
  self->_shouldShowLinkedPeople = shouldShowLinkedPeople;
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (int)highlightedProperty
{
  return self->_highlightedProperty;
}

- (void)setHighlightedProperty:(int)a3
{
  self->_highlightedProperty = a3;
}

- (int)highlightedMultiValueIdentifier
{
  return self->_highlightedMultiValueIdentifier;
}

- (void)setHighlightedMultiValueIdentifier:(int)a3
{
  self->_highlightedMultiValueIdentifier = a3;
}

- (BOOL)highlightedImportant
{
  return self->_highlightedImportant;
}

- (void)setHighlightedImportant:(BOOL)a3
{
  self->_highlightedImportant = a3;
}

- (CNContactViewController)cnContactViewController
{
  return self->_cnContactViewController;
}

- (void)setCnContactViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

@end
