@implementation EKShareePickerViewController

- (EKShareePickerViewController)initWithFrame:(CGRect)a3 calendar:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  EKShareePickerViewController *v10;
  EKCalendarShareePicker *v11;
  EKCalendarShareePicker *picker;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)EKShareePickerViewController;
  v10 = -[EKShareePickerViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  if (v10)
  {
    v11 = -[EKEventAttendeePicker initWithFrame:event:calendar:overriddenEventStartDate:overriddenEventEndDate:]([EKCalendarShareePicker alloc], "initWithFrame:event:calendar:overriddenEventStartDate:overriddenEventEndDate:", 0, v9, 0, 0, x, y, width, height);
    picker = v10->_picker;
    v10->_picker = v11;

    -[EKEventAttendeePicker setAddressValidationDelegate:](v10->_picker, "setAddressValidationDelegate:", v10);
    -[EKShareePickerViewController addChildViewController:](v10, "addChildViewController:", v10->_picker);
    EventKitUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Add Person VC title"), CFSTR("Add Person"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKShareePickerViewController setTitle:](v10, "setTitle:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v10, sel_cancel);
    -[EKShareePickerViewController navigationItem](v10, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLeftBarButtonItem:", v15);

    v17 = objc_alloc(MEMORY[0x1E0DC34F0]);
    EventKitUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Add"), &stru_1E601DFA8, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 2, v10, &sel_add);
    -[EKShareePickerViewController navigationItem](v10, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRightBarButtonItem:", v20);

  }
  return v10;
}

- (void)setSearchAccountID:(id)a3
{
  -[EKEventAttendeePicker setSearchAccountID:](self->_picker, "setSearchAccountID:", a3);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)EKShareePickerViewController;
  -[EKShareePickerViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[EKShareePickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[EKCalendarShareePicker view](self->_picker, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[EKShareePickerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarShareePicker view](self->_picker, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

}

- (void)cancel
{
  EKShareePickerViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "shareePickerViewController:didCompleteWithAction:", self, 0);

  }
}

- (void)add
{
  id WeakRetained;
  char v4;
  id v5;

  -[EKEventAttendeePicker commitRemainingText](self->_picker, "commitRemainingText");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "shareePickerViewController:didCompleteWithAction:", self, 1);

  }
}

- (id)_shareeFromRecipient:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_getAssociatedObject(v4, &shareeKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[EKShareePickerViewController _createShareeFromRecipient:](self, "_createShareeFromRecipient:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (id)_createShareeFromRecipient:(id)a3
{
  id v3;
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
  void *v15;

  v3 = a3;
  if (!objc_msgSend(v3, "kind"))
  {
    v11 = (void *)MEMORY[0x1E0CAA138];
    objc_msgSend(v3, "displayString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = v5;
    v9 = v6;
    v10 = 0;
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "kind") == 1)
  {
    v4 = (void *)MEMORY[0x1E0CAA138];
    IdentityNameFromRecipient(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "normalizedAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = v5;
    v9 = 0;
    v10 = v6;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  if (objc_msgSend(v3, "kind") != 4)
  {
    v13 = 0;
    goto LABEL_7;
  }
  v15 = (void *)MEMORY[0x1E0CAA138];
  objc_msgSend(v3, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  v8 = v5;
  v9 = 0;
  v10 = 0;
  v12 = v6;
LABEL_6:
  objc_msgSend(v7, "shareeWithName:emailAddress:phoneNumber:externalID:", v8, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v13;
}

- (id)_recipientFromSharee:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    -[EKShareePickerViewController _createRecipientFromSharee:](self, "_createRecipientFromSharee:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, &shareeKey, v4, (void *)0x301);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_createRecipientFromSharee:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "contactPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCNComposeRecipientClass_0(), "descriptorsForRequiredKeysForContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unifiedContactsMatchingPredicate:keysToFetch:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc((Class)getCNComposeRecipientClass_0());
    objc_msgSend(v3, "emailAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v8;
    v14 = v11;
    v15 = 0;
  }
  else
  {
    objc_msgSend(v3, "phoneNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_6;
    v17 = objc_alloc((Class)getCNComposeRecipientClass_0());
    objc_msgSend(v3, "phoneNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    v13 = v8;
    v14 = v11;
    v15 = 1;
  }
  v16 = (void *)objc_msgSend(v12, "initWithContact:address:kind:", v13, v14, v15);

LABEL_6:
  if (v8)
  {
    objc_msgSend(v8, "CalDisplayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDisplayString:", v18);

  }
  return v16;
}

- (NSArray)sharees
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[EKEventAttendeePicker recipients](self->_picker, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[EKShareePickerViewController _shareeFromRecipient:](self, "_shareeFromRecipient:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (void)setSharees:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[EKShareePickerViewController _recipientFromSharee:](self, "_recipientFromSharee:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[EKEventAttendeePicker setRecipients:](self->_picker, "setRecipients:", v5);
}

- (CGSize)preferredContentSize
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = EKUIContainedControllerIdealWidth();
  -[EKShareePickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeThatFits:", v3, 1100.0);
  v6 = v5;

  v7 = v3;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (void)setShouldSuggestFamilySharees:(BOOL)a3
{
  -[EKEventAttendeePicker setShouldSuggestFamilySharees:](self->_picker, "setShouldSuggestFamilySharees:", a3);
}

- (BOOL)shouldSuggestFamilySharees
{
  return -[EKEventAttendeePicker shouldSuggestFamilySharees](self->_picker, "shouldSuggestFamilySharees");
}

- (void)setFilterOutFamilySharees:(id)a3
{
  -[EKEventAttendeePicker setFilterOutFamilySharees:](self->_picker, "setFilterOutFamilySharees:", a3);
}

- (NSArray)filterOutFamilySharees
{
  return -[EKEventAttendeePicker filterOutFamilySharees](self->_picker, "filterOutFamilySharees");
}

- (void)eventAttendeePicker:(id)a3 cacheValidationStatus:(unint64_t)a4 forAddress:(id)a5
{
  EKShareePickerViewControllerDelegate **p_delegate;
  id v8;
  void *v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "eventStoreForShareePickerViewController:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cacheValidationStatusForAddress:status:", v8, a4);

}

- (unint64_t)eventAttendeePicker:(id)a3 getValidationStatusForAddress:(id)a4
{
  EKShareePickerViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;
  void *v8;
  unint64_t v9;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "eventStoreForShareePickerViewController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "addressValidationStatus:", v6);

  return v9;
}

- (EKShareePickerViewControllerDelegate)delegate
{
  return (EKShareePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
