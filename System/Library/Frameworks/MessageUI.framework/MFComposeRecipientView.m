@implementation MFComposeRecipientView

- (MFComposeRecipientView)initWithFrame:(CGRect)a3
{
  double width;
  MFComposeRecipientView *v4;
  NSMutableArray *v5;
  NSMutableArray *recipients;
  NSMutableDictionary *v7;
  NSMutableDictionary *atoms;
  NSCountedSet *v9;
  NSCountedSet *uncommentedAddresses;
  _MFMailRecipientTextField *v11;
  _MFMailRecipientTextField *textField;
  _MFMailRecipientTextField *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UITapGestureRecognizer *tapGestureRecognizer;
  uint64_t v18;
  UIButton *addButton;
  UIButton *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  objc_super v27;

  width = a3.size.width;
  v27.receiver = self;
  v27.super_class = (Class)MFComposeRecipientView;
  v4 = -[MFComposeHeaderView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recipients = v4->_recipients;
    v4->_recipients = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    atoms = v4->_atoms;
    v4->_atoms = v7;

    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    uncommentedAddresses = v4->_uncommentedAddresses;
    v4->_uncommentedAddresses = v9;

    v11 = -[_MFMailRecipientTextField initWithFrame:]([_MFMailRecipientTextField alloc], "initWithFrame:", 0.0, 0.0, width, 25.0);
    textField = v4->_textField;
    v4->_textField = v11;

    -[_MFMailRecipientTextField setAutoresizingMask:](v4->_textField, "setAutoresizingMask:", 0);
    -[_MFMailRecipientTextField setTranslatesAutoresizingMaskIntoConstraints:](v4->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MFMailRecipientTextField setDelegate:](v4->_textField, "setDelegate:", v4);
    -[_MFMailRecipientTextField setBorderStyle:](v4->_textField, "setBorderStyle:", 0);
    v13 = v4->_textField;
    -[MFComposeRecipientView baseFont](v4, "baseFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFMailRecipientTextField setFont:](v13, "setFont:", v14);

    -[_MFMailRecipientTextField setForceEnableDictation:](v4->_textField, "setForceEnableDictation:", 1);
    -[_MFMailRecipientTextField setKeyboardType:](v4->_textField, "setKeyboardType:", 7);
    -[_MFMailRecipientTextField setAutocapitalizationType:](v4->_textField, "setAutocapitalizationType:", 0);
    -[_MFMailRecipientTextField setAutocorrectionType:](v4->_textField, "setAutocorrectionType:", 1);
    -[MFComposeRecipientView addSubview:](v4, "addSubview:", v4->_textField);
    -[MFComposeRecipientView setProperty:](v4, "setProperty:", *MEMORY[0x1E0CF5DA8]);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v4, sel_textChanged_, *MEMORY[0x1E0DC54D0], v4->_textField);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__tapGestureRecognized_);
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v16;

    -[UITapGestureRecognizer setDelegate:](v4->_tapGestureRecognizer, "setDelegate:", v4);
    -[MFComposeRecipientView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_tapGestureRecognizer);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 5);
    v18 = objc_claimAutoreleasedReturnValue();
    addButton = v4->_addButton;
    v4->_addButton = (UIButton *)v18;

    v20 = v4->_addButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ADD_CONTACT_ACCESSIBILITY_LABEL"), &stru_1E5A6A588, CFSTR("Main"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](v20, "setAccessibilityLabel:", v22);

    -[UIButton setAutoresizingMask:](v4->_addButton, "setAutoresizingMask:", 0);
    -[UIButton setAutoresizesSubviews:](v4->_addButton, "setAutoresizesSubviews:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_addButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v23) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v4->_addButton, "setContentHuggingPriority:forAxis:", 0, v23);
    LODWORD(v24) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_addButton, "setContentCompressionResistancePriority:forAxis:", 0, v24);
    LODWORD(v25) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_addButton, "setContentCompressionResistancePriority:forAxis:", 1, v25);
    -[UIButton addTarget:action:forControlEvents:](v4->_addButton, "addTarget:action:forControlEvents:", v4, sel_addButtonClicked_, 64);
    -[MFComposeRecipientView addSubview:](v4, "addSubview:", v4->_addButton);
    -[MFComposeRecipientView setAllowsDragAndDrop:](v4, "setAllowsDragAndDrop:", 0);
    v4->_editable = 1;
    -[MFComposeRecipientView setHideLastAtomComma:](v4, "setHideLastAtomComma:", 1);

  }
  return v4;
}

- (void)dealloc
{
  __CFDictionary *atomPresentationOptionsByRecipient;
  objc_super v4;

  -[MFComposeRecipientView _cancelDelayTimer](self, "_cancelDelayTimer");
  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  if (atomPresentationOptionsByRecipient)
    CFRelease(atomPresentationOptionsByRecipient);
  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientView;
  -[MFComposeRecipientView dealloc](&v4, sel_dealloc);
}

- (MFComposeRecipientViewDelegate)delegate
{
  return (MFComposeRecipientViewDelegate *)objc_loadWeakRetained(&self->super._delegate);
}

- (void)setLabel:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeRecipientView;
  -[MFComposeHeaderView setLabel:](&v5, sel_setLabel_, v4);
  -[MFComposeRecipientView _setNeedsReflow](self, "_setNeedsReflow");

}

- (void)setEditable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  if (self->_editable != a3)
  {
    v3 = a3;
    self->_editable = a3;
    -[NSMutableDictionary allValues](self->_atoms, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    if (v3)
      -[MFComposeRecipientView clearText](self, "clearText");
    -[MFComposeRecipientView _reflowAnimated:](self, "_reflowAnimated:", 0);
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[MFComposeRecipientView _setNeedsReflow](self, "_setNeedsReflow");
  }
}

- (NSString)text
{
  void *v2;
  void *v3;
  void *v4;

  -[_MFMailRecipientTextField searchText](self->_textField, "searchText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (double)offsetForRowWithTextField
{
  double v2;
  double v3;
  double v4;

  -[MFComposeRecipientView bounds](self, "bounds");
  v3 = v2;
  objc_msgSend((id)objc_opt_class(), "preferredHeight");
  return v3 - v4;
}

- (int64_t)numberOfRowsOfTextInField
{
  double v2;
  double v3;
  double v4;

  -[MFComposeRecipientView bounds](self, "bounds");
  v3 = v2 + -20.0;
  objc_msgSend((id)objc_opt_class(), "preferredHeight");
  return llround(v3 / (v4 + -20.0));
}

- (void)clearText
{
  -[_MFMailRecipientTextField setText:](self->_textField, "setText:", &stru_1E5A6A588);
}

- (BOOL)hasContent
{
  void *v3;
  BOOL v4;
  void *v5;

  -[MFComposeRecipientView recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[MFComposeRecipientView text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

- (void)setProperty:(int)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObject:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeRecipientView setProperties:](self, "setProperties:", v5);

}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSArray)addresses
{
  return (NSArray *)-[NSMutableArray arrayByApplyingSelector:](self->_recipients, "arrayByApplyingSelector:", sel_commentedAddress);
}

- (id)uncommentedAddresses
{
  return (id)-[NSMutableArray arrayByApplyingSelector:](self->_recipients, "arrayByApplyingSelector:", sel_uncommentedAddress);
}

- (void)setAddresses:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *recipients;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  id WeakRetained;
  NSMutableArray *v20;
  id v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  -[MFComposeRecipientView layoutIfNeeded](self, "layoutIfNeeded");
  v20 = self->_recipients;
  -[MFComposeRecipientView _removeAllRecipients](self, "_removeAllRecipients");
  v4 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
  recipients = self->_recipients;
  self->_recipients = v4;

  -[MFComposeRecipientView delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v21;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v23, "composeRecipientView:composeRecipientForAddress:", self, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSMutableArray containsObject:](self->_recipients, "containsObject:", v10) & 1) == 0)
        {
          v11 = v9;
          objc_msgSend(v11, "emailAddressValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "simpleAddress");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v15 = v13;
          }
          else
          {
            objc_msgSend(v11, "stringValue");
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          v16 = v15;

          -[MFComposeRecipientView _addUncommentedAddress:](self, "_addUncommentedAddress:", v16);
          -[NSMutableArray addObject:](self->_recipients, "addObject:", v10);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (-[NSMutableArray count](v20, "count"))
      v17 = v20;
    else
      v17 = 0;
    if (-[NSMutableArray count](self->_recipients, "count"))
      v18 = self->_recipients;
    else
      v18 = 0;
    WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    objc_msgSend(WeakRetained, "composeRecipientView:didReplaceRecipients:withRecipients:", self, v17, v18);

  }
  -[MFComposeRecipientView _setNeedsReflow](self, "_setNeedsReflow");

}

- (void)removeRecipient:(id)a3
{
  id v4;
  NSMutableArray *recipients;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  recipients = self->_recipients;
  if (recipients)
  {
    v16 = v4;
    v6 = -[NSMutableArray indexOfObject:](recipients, "indexOfObject:");
    v4 = v16;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[MFComposeRecipientView firstResponder](self, "firstResponder", v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "undoManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "registerUndoWithTarget:selector:object:", self, sel_addRecipient_, v16);
      if ((objc_msgSend(v8, "isUndoing") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ADDRESS_DELETION"), &stru_1E5A6A588, CFSTR("Main"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setActionName:", v10);

      }
      v11 = v16;
      -[MFComposeRecipientView _removeAddressAtomPresentationOptionsForRecipient:](self, "_removeAddressAtomPresentationOptionsForRecipient:", v11);
      -[NSMutableDictionary objectForKey:](self->_atoms, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      -[NSMutableDictionary removeObjectForKey:](self->_atoms, "removeObjectForKey:", v11);
      objc_msgSend(v11, "uncommentedAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeRecipientView _removeUncommentedAddress:](self, "_removeUncommentedAddress:", v13);

      -[NSMutableArray removeObjectAtIndex:](self->_recipients, "removeObjectAtIndex:", v6);
      -[MFComposeRecipientView delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "composeRecipientView:didRemoveRecipient:", self, v11);
      -[MFComposeRecipientView _setNeedsReflow](self, "_setNeedsReflow");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("MFComposeRecipientTextViewDidChangeNotification"), self, 0);

      v4 = v16;
    }
  }

}

- (void)addRecipient:(id)a3
{
  id v4;

  v4 = a3;
  -[MFComposeRecipientView addRecipient:index:animate:](self, "addRecipient:index:animate:", v4, -[NSMutableArray count](self->_recipients, "count"), 0);

}

- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "isGroup"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v8, "children", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v9);
          -[MFComposeRecipientView addRecipient:index:animate:](self, "addRecipient:index:animate:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), a4, v5);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v8)
  {
    if ((-[NSMutableArray containsObject:](self->_recipients, "containsObject:", v8) & 1) == 0)
    {
      -[NSMutableArray insertObject:atIndex:](self->_recipients, "insertObject:atIndex:", v8, a4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MFComposeRecipientView firstResponder](self, "firstResponder");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "undoManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "registerUndoWithTarget:selector:object:", self, sel_removeRecipient_, v8);
        if ((objc_msgSend(v14, "isUndoing") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ADDRESS_ADDITION"), &stru_1E5A6A588, CFSTR("Main"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setActionName:", v16);

        }
        objc_msgSend(v8, "uncommentedAddress");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFComposeRecipientView _addUncommentedAddress:](self, "_addUncommentedAddress:", v17);

        -[MFComposeRecipientView delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v24 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "composeRecipientView:didAddRecipients:", self, v19);

        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v18, "composeRecipientView:didAddRecipient:", self, v8);
        }

      }
    }
    if (v5)
      -[MFComposeRecipientView _reflowAnimated:](self, "_reflowAnimated:", 1);
    else
      -[MFComposeRecipientView _setNeedsReflow](self, "_setNeedsReflow");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("MFComposeRecipientTextViewDidChangeNotification"), self, 0);
    goto LABEL_24;
  }
LABEL_25:

}

- (void)addAddress:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  objc_msgSend(WeakRetained, "composeRecipientView:composeRecipientForAddress:", self, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFComposeRecipientView addRecipient:](self, "addRecipient:", v5);
}

- (void)_addRecord:(void *)a3 identifier:(int)a4
{
  uint64_t v4;
  id WeakRetained;
  id v8;

  v4 = *(_QWORD *)&a4;
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  objc_msgSend(WeakRetained, "composeRecipientView:composeRecipientForRecord:identifier:", self, a3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[MFComposeRecipientView addRecipient:](self, "addRecipient:", v8);
}

- (void)addRecord:(void *)a3 property:(int)a4 identifier:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  -[MFComposeRecipientView delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "composeRecipientView:composeRecipientForRecord:property:identifier:", self, a3, v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientView addRecipient:](self, "addRecipient:", v9);

  }
  else
  {
    -[MFComposeRecipientView _addRecord:identifier:](self, "_addRecord:identifier:", a3, v5);
  }

}

- (void)setPlaceholderRecipient:(id)a3
{
  MFComposeRecipient *v4;
  NSMutableDictionary *atoms;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableArray *recipients;
  void *v11;
  MFComposeRecipient *placeholderRecipient;

  v4 = (MFComposeRecipient *)a3;
  if (self->_placeholderRecipient)
  {
    atoms = self->_atoms;
    -[MFComposeRecipientView placeholderRecipient](self, "placeholderRecipient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](atoms, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    v8 = self->_atoms;
    -[MFComposeRecipientView placeholderRecipient](self, "placeholderRecipient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

    recipients = self->_recipients;
    -[MFComposeRecipientView placeholderRecipient](self, "placeholderRecipient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](recipients, "removeObject:", v11);

  }
  placeholderRecipient = self->_placeholderRecipient;
  self->_placeholderRecipient = v4;

}

- (MFComposeRecipient)placeholderRecipient
{
  return self->_placeholderRecipient;
}

- (void)setAddressAtomPresentationOptions:(unint64_t)a3 forRecipient:(id)a4
{
  id v6;
  __CFDictionary *atomPresentationOptionsByRecipient;
  void *v8;
  void *v9;
  void *key;

  v6 = a4;
  if (v6)
  {
    key = v6;
    atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
    if (!atomPresentationOptionsByRecipient)
    {
      atomPresentationOptionsByRecipient = CFDictionaryCreateMutable(0, 0, 0, 0);
      self->_atomPresentationOptionsByRecipient = atomPresentationOptionsByRecipient;
    }
    CFDictionarySetValue(atomPresentationOptionsByRecipient, key, (const void *)a3);
    -[NSMutableDictionary objectForKey:](self->_atoms, "objectForKey:", key);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "setPresentationOptions:", a3);

    v6 = key;
  }

}

- (void)_removeAddressAtomPresentationOptionsForRecipient:(id)a3
{
  __CFDictionary *atomPresentationOptionsByRecipient;
  id key;

  key = a3;
  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  if (atomPresentationOptionsByRecipient)
    CFDictionaryRemoveValue(atomPresentationOptionsByRecipient, key);

}

- (unint64_t)_addressAtomPresentationOptionsForRecipient:(id)a3
{
  id v4;
  void *defaultAtomPresentationOptions;
  __CFDictionary *atomPresentationOptionsByRecipient;
  void *value;

  v4 = a3;
  defaultAtomPresentationOptions = (void *)self->_defaultAtomPresentationOptions;
  value = defaultAtomPresentationOptions;
  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  if (atomPresentationOptionsByRecipient)
  {
    CFDictionaryGetValueIfPresent(atomPresentationOptionsByRecipient, v4, (const void **)&value);
    defaultAtomPresentationOptions = value;
  }

  return (unint64_t)defaultAtomPresentationOptions;
}

- (void)clearAllAddressAtomPresentationOptions
{
  __CFDictionary *atomPresentationOptionsByRecipient;

  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  if (atomPresentationOptionsByRecipient)
  {
    CFRelease(atomPresentationOptionsByRecipient);
    self->_atomPresentationOptionsByRecipient = 0;
  }
}

- (BOOL)containsAddress:(id)a3
{
  id v4;
  NSCountedSet *uncommentedAddresses;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  uncommentedAddresses = self->_uncommentedAddresses;
  v6 = v4;
  objc_msgSend(v6, "emailAddressValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simpleAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v6, "stringValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v12 = -[NSCountedSet countForObject:](uncommentedAddresses, "countForObject:", v11) != 0;
  return v12;
}

- (void)_addUncommentedAddress:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[NSCountedSet addObject:](self->_uncommentedAddresses, "addObject:", v4);

}

- (void)_removeUncommentedAddress:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[NSCountedSet removeObject:](self->_uncommentedAddresses, "removeObject:", v4);

}

- (void)_removeAllRecipients
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *recipients;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_atoms, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "removeFromSuperview");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  -[NSMutableDictionary removeAllObjects](self->_atoms, "removeAllObjects");
  -[MFComposeRecipientView clearAllAddressAtomPresentationOptions](self, "clearAllAddressAtomPresentationOptions");
  -[NSCountedSet removeAllObjects](self->_uncommentedAddresses, "removeAllObjects");
  recipients = self->_recipients;
  self->_recipients = 0;

}

- (BOOL)_addable
{
  return !self->_maxRecipients
      || (unint64_t)-[NSMutableArray count](self->_recipients, "count") < self->_maxRecipients;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  if (self->_selectedAtom && self->_deselectOnNextKeyboardInput)
    -[MFComposeRecipientView _deselectAtom](self, "_deselectAtom", a3);
  else
    self->_deselectOnNextKeyboardInput = 1;
}

- (void)selectComposeRecipientAtom:(id)a3
{
  MFModernComposeRecipientAtom *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v5 = (MFModernComposeRecipientAtom *)a3;
  if (self->_selectedAtom != v5)
  {
    if ((-[_MFMailRecipientTextField isFirstResponder](self->_textField, "isFirstResponder") & 1) == 0)
    {
      self->_deselectOnNextKeyboardInput = 0;
      objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __53__MFComposeRecipientView_selectComposeRecipientAtom___block_invoke;
      v8[3] = &unk_1E5A65480;
      v8[4] = self;
      v7 = (id)objc_msgSend(v6, "afterDelay:performBlock:", v8, 0.1);

    }
    -[MFComposeRecipientView finishEnteringRecipient](self, "finishEnteringRecipient");
    -[MFComposeRecipientView _deselectAtom](self, "_deselectAtom");
    -[_MFMailRecipientTextField _clearSelectionUI](self->_textField, "_clearSelectionUI");
    -[MFModernAtomView setSelected:animated:](v5, "setSelected:animated:", 1, 1);
    objc_storeStrong((id *)&self->_selectedAtom, a3);
  }

}

uint64_t __53__MFComposeRecipientView_selectComposeRecipientAtom___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "becomeFirstResponder");
}

- (void)deselectComposeRecipientAtom:(id)a3
{
  if (self->_selectedAtom == a3)
    -[MFComposeRecipientView _deselectAtom](self, "_deselectAtom");
}

- (BOOL)_shouldShowCorecipientsIndicatorAtom
{
  return 0;
}

- (void)reflow
{
  -[MFComposeRecipientView _reflowAnimated:](self, "_reflowAnimated:", 0);
}

- (void)_reflowAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSMutableArray *recipients;
  double v18;
  double v19;
  void *v20;
  void *v21;
  _MFMailRecipientTextField *textField;
  void *v23;
  id WeakRetained;
  _QWORD v25[7];
  _QWORD aBlock[7];
  _QWORD v27[3];
  char v28;
  _QWORD v29[4];

  v3 = a3;
  v5 = -[MFComposeRecipientView _addable](self, "_addable");
  v7 = !+[MFAddressBookManager isAuthorizedToUseAddressBook](MFAddressBookManager, "isAuthorizedToUseAddressBook")|| (self->_editable ? (v6 = v5) : (v6 = 0), !v6)|| !self->_expanded;
  -[UIButton setHidden:](self->_addButton, "setHidden:", v7);
  if (self->_editable)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0xAAAAAAAAAAAAAAAALL;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v28 = -86;
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__MFComposeRecipientView__reflowAnimated___block_invoke;
    aBlock[3] = &unk_1E5A66388;
    aBlock[4] = self;
    aBlock[5] = v29;
    aBlock[6] = v27;
    v9 = _Block_copy(aBlock);
    v25[0] = v8;
    v25[1] = 3221225472;
    v25[2] = __42__MFComposeRecipientView__reflowAnimated___block_invoke_2;
    v25[3] = &unk_1E5A663B0;
    v25[4] = self;
    v25[5] = v29;
    v25[6] = v27;
    v10 = _Block_copy(v25);
    v11 = 0.200000003;
    if (!v3)
      v11 = 0.0;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v9, v10, v11);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);
  }
  else
  {
    -[MFComposeRecipientView frame](self, "frame");
    v13 = v12;
    objc_msgSend((id)objc_opt_class(), "preferredHeight");
    v15 = v14;
    if (-[MFComposeRecipientView isSeparatorHidden](self, "isSeparatorHidden"))
    {
      +[MFComposeHeaderView separatorHeight](MFComposeHeaderView, "separatorHeight");
      v15 = v15 - v16;
    }
    v29[0] = 0xAAAAAAAAAAAAAAAALL;
    LOBYTE(v27[0]) = -86;
    -[MFComposeRecipientView _updateLayoutConstraintsAndGetNumberOfRows:textFieldWillBeLastRow:](self, "_updateLayoutConstraintsAndGetNumberOfRows:textFieldWillBeLastRow:", v29, v27);
    -[MFComposeHeaderView layoutSubviews](self, "layoutSubviews");
    recipients = self->_recipients;
    -[MFComposeRecipientView _topRowTextWidth](self, "_topRowTextWidth");
    v19 = v18;
    -[MFComposeRecipientView baseFont](self, "baseFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray mf_commaSeparatedRecipientListWithWidth:forFont:usingBlock:](recipients, "mf_commaSeparatedRecipientListWithWidth:forFont:usingBlock:", v20, &__block_literal_global_12, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    textField = self->_textField;
    -[MFComposeRecipientView tintColor](self, "tintColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFMailRecipientTextField setTextColor:](textField, "setTextColor:", v23);

    -[_MFMailRecipientTextField setText:](self->_textField, "setText:", v21);
    WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    objc_msgSend(WeakRetained, "composeRecipientView:didChangeSize:", self, v13, v15);

  }
  self->_needsReflow = 0;
}

uint64_t __42__MFComposeRecipientView__reflowAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MFModernComposeRecipientAtom *v15;
  void *v16;
  _BYTE *v17;
  _BOOL8 v18;
  void *v19;
  unsigned int v21;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  objc_msgSend(MEMORY[0x1E0DC3658], "mailModernLabelledAtomDefaultTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

  objc_msgSend(*(id *)(a1 + 32), "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v21 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 0);
  if (v5)
  {
    v6 = 0;
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "recipients");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "atoms");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = -[MFModernComposeRecipientAtom initWithFrame:recipient:presentationOptions:]([MFModernComposeRecipientAtom alloc], "initWithFrame:recipient:presentationOptions:", v12, 0, v7, v8, v9, v10);
        -[MFModernComposeRecipientAtom setDelegate:](v15, "setDelegate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 32), "atoms");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v12);

        objc_opt_class();
        v14 = v15;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[MFModernComposeRecipientAtom setHidden:](v15, "setHidden:", 1);
      }
      v18 = 0;
      if (v5 - 1 == v6)
      {
        v17 = *(_BYTE **)(a1 + 32);
        if (!v17[546] || !objc_msgSend(v17, "hideLastAtomComma"))
          v18 = 1;
      }
      objc_msgSend(v14, "setSeparatorHidden:", v18);
      objc_msgSend(v14, "tintColorDidChange");
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v14, "setPresentationOptions:", objc_msgSend(*(id *)(a1 + 32), "_addressAtomPresentationOptionsForRecipient:", v12));
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 608))
        objc_msgSend(v14, "setTitleFont:");
      objc_msgSend(v14, "superview");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        objc_msgSend(*(id *)(a1 + 32), "addSubview:", v14);

      ++v6;
    }
    while (v5 != v6);
  }
  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v21);
  objc_msgSend(*(id *)(a1 + 32), "_updateLayoutConstraintsAndGetNumberOfRows:textFieldWillBeLastRow:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __42__MFComposeRecipientView__reflowAnimated___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  _BYTE *v4;
  uint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  char v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = v2;
  v4 = *(_BYTE **)(a1 + 32);
  if (!v4[546])
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v5 + 24);
    if (v6 >= 2)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        *(_QWORD *)(v5 + 24) = v6 - 1;
        v4 = *(_BYTE **)(a1 + 32);
      }
    }
  }
  objc_msgSend(v4, "labelTopPadding");
  v8 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "frame");
  v10 = v8 + v9;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "_baselineOffsetFromBottom");
  v12 = v10 - v11;
  objc_msgSend((id)objc_opt_class(), "preferredHeight");
  v14 = v13 + (double)(unint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) - 1) * v12;
  if (objc_msgSend(*(id *)(a1 + 32), "isSeparatorHidden"))
  {
    +[MFComposeHeaderView separatorHeight](MFComposeHeaderView, "separatorHeight");
    v14 = v14 - v15;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
      objc_msgSend(v18, "composeRecipientView:didChangeSize:", *(_QWORD *)(a1 + 32), v3, v14);
  }

}

id __42__MFComposeRecipientView__reflowAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "displayString");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)showCorecipientIndicator:(BOOL)a3 withCorecipients:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id *p_corecipientsIndicatorAtom;
  MFCorecipientsIndicatorAtom *corecipientsIndicatorAtom;
  MFCorecipientsIndicatorAtom *v12;
  id v13;
  _QWORD v14[5];

  v5 = a5;
  v6 = a3;
  v8 = a4;
  if (-[MFComposeRecipientView _shouldShowCorecipientsIndicatorAtom](self, "_shouldShowCorecipientsIndicatorAtom"))
  {
    if (v6)
    {
      v9 = objc_msgSend(v8, "count");
      p_corecipientsIndicatorAtom = (id *)&self->_corecipientsIndicatorAtom;
      corecipientsIndicatorAtom = self->_corecipientsIndicatorAtom;
      if (!v9)
      {
        -[MFCorecipientsIndicatorAtom setRecipients:](corecipientsIndicatorAtom, "setRecipients:", 0);
        goto LABEL_11;
      }
      if (!corecipientsIndicatorAtom)
      {
        v12 = objc_alloc_init(MFCorecipientsIndicatorAtom);
        v13 = *p_corecipientsIndicatorAtom;
        *p_corecipientsIndicatorAtom = v12;

        objc_msgSend(*p_corecipientsIndicatorAtom, "setDelegate:", self);
        -[MFComposeRecipientView addSubview:](self, "addSubview:", *p_corecipientsIndicatorAtom);
        corecipientsIndicatorAtom = (MFCorecipientsIndicatorAtom *)*p_corecipientsIndicatorAtom;
      }
      -[MFCorecipientsIndicatorAtom setRecipients:](corecipientsIndicatorAtom, "setRecipients:", v8);
      objc_msgSend(*p_corecipientsIndicatorAtom, "setTitle:", CFSTR(" ..."));
      objc_msgSend(*p_corecipientsIndicatorAtom, "setAlpha:", 0.649999976);
      if (v5 && objc_msgSend(*p_corecipientsIndicatorAtom, "isHidden"))
      {
        objc_msgSend(*p_corecipientsIndicatorAtom, "setAlpha:", 0.0);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __77__MFComposeRecipientView_showCorecipientIndicator_withCorecipients_animated___block_invoke;
        v14[3] = &unk_1E5A65480;
        v14[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v14, 0.319999993);
      }
    }
    else
    {
      p_corecipientsIndicatorAtom = (id *)&self->_corecipientsIndicatorAtom;
      -[MFCorecipientsIndicatorAtom setRecipients:](self->_corecipientsIndicatorAtom, "setRecipients:", 0);
    }
    objc_msgSend(*p_corecipientsIndicatorAtom, "setHidden:", !v6);
LABEL_11:
    -[MFComposeRecipientView _reflowAnimated:](self, "_reflowAnimated:", v5);
  }

}

uint64_t __77__MFComposeRecipientView_showCorecipientIndicator_withCorecipients_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAlpha:", 0.649999976);
}

- (void)addButtonClicked:(id)a3
{
  id v4;

  -[MFComposeRecipientView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "composeRecipientViewRequestAddRecipient:", self);

}

- (void)setSeparatorHidden:(BOOL)a3
{
  if (self->_separatorHidden != a3)
  {
    self->_separatorHidden = a3;
    -[UIView setHidden:](self->super._separator, "setHidden:");
  }
}

- (void)refreshPreferredContentSize
{
  _MFMailRecipientTextField *textField;
  void *v4;
  NSArray *textFieldConstraints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFComposeRecipientView;
  -[MFComposeHeaderView refreshPreferredContentSize](&v6, sel_refreshPreferredContentSize);
  textField = self->_textField;
  -[MFComposeRecipientView baseFont](self, "baseFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFMailRecipientTextField setFont:](textField, "setFont:", v4);

  -[MFComposeRecipientView setEditable:](self, "setEditable:", 0);
  if (self->_textFieldConstraints)
  {
    -[MFComposeRecipientView removeConstraints:](self, "removeConstraints:");
    textFieldConstraints = self->_textFieldConstraints;
    self->_textFieldConstraints = 0;

  }
  -[MFComposeHeaderView layoutSubviews](self, "layoutSubviews");
  -[MFComposeRecipientView reflow](self, "reflow");
}

- (void)setBaseFont:(id)a3
{
  UIFont **p_baseFont;
  id v6;

  p_baseFont = &self->_baseFont;
  v6 = a3;
  if ((-[UIFont isEqual:](*p_baseFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_baseFont, a3);
    -[_MFMailRecipientTextField setFont:](self->_textField, "setFont:", *p_baseFont);
    -[MFComposeRecipientView _setNeedsReflow](self, "_setNeedsReflow");
  }

}

- (UIFont)baseFont
{
  UIFont *v2;

  v2 = self->_baseFont;
  if (!v2)
  {
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v2 = (UIFont *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)mf_textFieldShowingSearchResults:(id)a3
{
  void *v4;
  char v5;

  -[MFComposeRecipientView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "composeRecipientViewShowingSearchResults:", self);
  else
    v5 = 0;

  return v5;
}

- (void)mf_selectNextSearchResultForTextField:(id)a3
{
  id v4;

  -[MFComposeRecipientView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "selectNextSearchResultForComposeRecipientView:", self);

}

- (void)mf_selectPreviousSearchResultForTextField:(id)a3
{
  id v4;

  -[MFComposeRecipientView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "selectPreviousSearchResultForComposeRecipientView:", self);

}

- (BOOL)mf_presentSearchResultsForTextField:(id)a3
{
  void *v4;
  char v5;

  -[MFComposeRecipientView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "presentSearchResultsForComposeRecipientView:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)mf_chooseSelectedSearchResultForTextField:(id)a3
{
  void *v4;
  char v5;

  -[MFComposeRecipientView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "chooseSelectedSearchResultForComposeRecipientView:", self);
  else
    v5 = 0;

  return v5;
}

- (void)mf_dismissSearchResults:(id)a3
{
  id v4;

  -[MFComposeRecipientView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "dismissSearchResultsForComposeRecipientView:", self);

}

- (void)mf_recipientTextField:(id)a3 didAddRecipientAddress:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MFComposeRecipientView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "composeRecipientView:didFinishEnteringAddress:", self, v6);

}

- (void)textFieldDidBecomeFirstResponder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[MFComposeRecipientView setDidIgnoreFirstResponderResign:](self, "setDidIgnoreFirstResponderResign:", 0);
  -[MFComposeRecipientView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "recipientViewDidBecomeFirstResponder:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "composeRecipientViewDidBecomeFirstResponder:", self);
  if (!-[MFComposeRecipientView _addable](self, "_addable"))
  {
    -[NSMutableArray lastObject](self->_recipients, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_atoms, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientView selectComposeRecipientAtom:](self, "selectComposeRecipientAtom:", v5);

  }
  if (self->_clearSelectionUIAfterFirstResponder)
  {
    self->_clearSelectionUIAfterFirstResponder = 0;
    -[_MFMailRecipientTextField _clearSelectionUI](self->_textField, "_clearSelectionUI");
  }
  if (-[MFComposeRecipientView editable](self, "editable"))
    -[MFComposeRecipientView setExpanded:](self, "setExpanded:", 1);

}

- (void)textFieldDidResignFirstResponder:(id)a3
{
  id v4;

  -[MFComposeRecipientView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v4, "recipientViewShouldIgnoreFirstResponderChanges:", self))
  {
    -[MFComposeRecipientView setDidIgnoreFirstResponderResign:](self, "setDidIgnoreFirstResponderResign:", 1);
  }
  else
  {
    -[MFComposeRecipientView finishEnteringRecipient](self, "finishEnteringRecipient");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "recipientViewDidResignFirstResponder:", self);
    -[MFComposeRecipientView _deselectAtom](self, "_deselectAtom");
    -[MFComposeRecipientView setExpanded:](self, "setExpanded:", 0);
  }

}

- (void)composeRecipientAtomShowPersonCard:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFComposeRecipientView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "composeRecipientView:showPersonCardForAtom:", self, v5);

}

- (void)didTapShowCorecipientsForIndicatorAtom:(id)a3 recipients:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MFComposeRecipientView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "composeRecipientView:showCorecipients:", self, v6);

}

- (BOOL)becomeFirstResponder
{
  return -[_MFMailRecipientTextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (void)_cancelDelayTimer
{
  NSTimer *delayTimer;

  -[NSTimer invalidate](self->_delayTimer, "invalidate");
  delayTimer = self->_delayTimer;
  self->_delayTimer = 0;

}

- (void)_delayTimerFired:(id)a3
{
  void *v4;
  id WeakRetained;

  -[MFComposeRecipientView _cancelDelayTimer](self, "_cancelDelayTimer", a3);
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  -[MFComposeRecipientView text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "composeRecipientView:textDidChange:", self, v4);

}

- (void)composeRecipientAtomSelectPrevious:(id)a3
{
  id v4;
  NSMutableArray *recipients;
  void *v6;
  uint64_t v7;
  BOOL v8;
  NSMutableDictionary *atoms;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  recipients = self->_recipients;
  v12 = v4;
  objc_msgSend(v4, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSMutableArray indexOfObject:](recipients, "indexOfObject:", v6);

  if (v7)
    v8 = v7 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = 1;
  if (!v8)
  {
    atoms = self->_atoms;
    -[NSMutableArray objectAtIndex:](self->_recipients, "objectAtIndex:", v7 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](atoms, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "becomeFirstResponder");

  }
}

- (void)composeRecipientAtomSelectNext:(id)a3
{
  id v4;
  NSMutableArray *recipients;
  void *v6;
  unint64_t v7;
  NSMutableDictionary *atoms;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  recipients = self->_recipients;
  v11 = v4;
  objc_msgSend(v4, "recipient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSMutableArray indexOfObject:](recipients, "indexOfObject:", v6);

  if (v7 >= -[NSMutableArray count](self->_recipients, "count") - 1)
  {
    -[MFComposeRecipientView becomeFirstResponder](self, "becomeFirstResponder");
  }
  else
  {
    atoms = self->_atoms;
    -[NSMutableArray objectAtIndex:](self->_recipients, "objectAtIndex:", v7 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](atoms, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "becomeFirstResponder");

  }
}

- (void)textChanged:(id)a3
{
  void *WeakRetained;
  void *v5;
  NSTimer *v6;
  id v7;

  v7 = a3;
  if (self->_inputDelay <= 0.0)
  {
    WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    -[MFComposeRecipientView text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "composeRecipientView:textDidChange:", self, v5);

  }
  else if (self->_delayTimer)
  {
    WeakRetained = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", self->_inputDelay);
    -[NSTimer setFireDate:](self->_delayTimer, "setFireDate:", WeakRetained);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__delayTimerFired_, 0, 0);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    WeakRetained = self->_delayTimer;
    self->_delayTimer = v6;
  }

}

- (void)_deselectAtom
{
  MFModernComposeRecipientAtom *selectedAtom;
  MFModernComposeRecipientAtom *v4;

  selectedAtom = self->_selectedAtom;
  if (selectedAtom)
  {
    -[MFModernAtomView setSelected:animated:](selectedAtom, "setSelected:animated:", 0, 1);
    v4 = self->_selectedAtom;
    self->_selectedAtom = 0;

  }
}

- (void)_deleteSelectedAtom
{
  void *v3;

  -[MFModernComposeRecipientAtom recipient](self->_selectedAtom, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeRecipientView removeRecipient:](self, "removeRecipient:", v3);

  -[MFComposeRecipientView _deselectAtom](self, "_deselectAtom");
  -[_MFMailRecipientTextField _resetSelectionUI](self->_textField, "_resetSelectionUI");
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  id v6;
  _BOOL4 v7;

  v6 = a4;
  if (objc_msgSend(v6, "isEqual:", CFSTR(",")))
  {
    v7 = !-[MFComposeRecipientView finishEnteringRecipient](self, "finishEnteringRecipient");
  }
  else
  {
    if (self->_selectedAtom)
      -[MFComposeRecipientView _deleteSelectedAtom](self, "_deleteSelectedAtom");
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  NSMutableDictionary *atoms;
  void *v10;

  -[_MFMailRecipientTextField text](self->_textField, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = v5 != 0;
  if (!v5)
  {
    v7 = -[_MFMailRecipientTextField isShowingDictationPlaceholder](self->_textField, "isShowingDictationPlaceholder");

    if (v7)
      return 1;
    if (self->_selectedAtom)
    {
      -[MFComposeRecipientView _deleteSelectedAtom](self, "_deleteSelectedAtom");
      return 0;
    }
    atoms = self->_atoms;
    -[NSMutableArray lastObject](self->_recipients, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](atoms, "objectForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientView selectComposeRecipientAtom:](self, "selectComposeRecipientAtom:", v10);

  }
  return v6;
}

- (double)textFieldOffsetForNumberOfRowsToScroll:(unint64_t)a3 numberOfRowsAboveField:(int64_t)a4
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v6 = -[MFComposeRecipientView numberOfRowsOfTextInField](self, "numberOfRowsOfTextInField");
  if (a4 >= a3)
    v7 = a3;
  else
    v7 = a4;
  v8 = a3 - v7;
  if (v6 < a3 - v7)
    v8 = v6;
  if (a4 >= a3)
    v9 = 0;
  else
    v9 = v8;
  v10 = 0.0;
  v11 = 0.0;
  if (v7 >= 1)
  {
    v12 = (double)v7;
    objc_msgSend((id)objc_opt_class(), "preferredHeight");
    v11 = v13 * v12;
  }
  if (v9 >= 1)
  {
    objc_msgSend((id)objc_opt_class(), "preferredHeight");
    v10 = (v14 + -20.0) * (double)v9;
  }
  return v11 + v10;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;

  -[MFComposeRecipientView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MFComposeRecipientView finishEnteringRecipient](self, "finishEnteringRecipient")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "composeRecipientViewReturnPressed:", self);
  }

  return 0;
}

- (void)parentWillClose
{
  self->_parentIsClosing = 1;
}

- (void)parentDidClose
{
  self->_parentIsClosing = 0;
}

- (BOOL)finishEnteringRecipient
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (self->_parentIsClosing)
    return 0;
  if (!self->_editable)
    return 0;
  -[MFComposeRecipientView text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    return 0;
  -[MFComposeRecipientView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MFComposeRecipientView text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composeRecipientView:didFinishEnteringAddress:", self, v7);

  }
  return 1;
}

- (double)_topRowTextWidth
{
  _MFMailRecipientTextField *textField;
  double Width;
  double v5;
  CGRect v7;

  textField = self->_textField;
  -[_MFMailRecipientTextField frame](textField, "frame");
  -[_MFMailRecipientTextField alignmentRectForFrame:](textField, "alignmentRectForFrame:");
  Width = CGRectGetWidth(v7);
  if (self->_editable)
  {
    -[UIButton frame](self->_addButton, "frame");
    return Width - v5;
  }
  return Width;
}

- (void)_updateLayoutConstraintsAndGetNumberOfRows:(unint64_t *)a3 textFieldWillBeLastRow:(BOOL *)a4
{
  void *v4;
  NSArray **p_textFieldConstraints;
  NSArray *v6;
  MFComposeRecipientView *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double MaxX;
  unint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  MFHeaderLabelView *v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  void *v29;
  BOOL v30;
  MFComposeRecipientView *v31;
  MFHeaderLabelView *v32;
  MFHeaderLabelView *v33;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  MFHeaderLabelView *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  id v57;
  uint64_t v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  unint64_t v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  BOOL v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id *location;
  NSMutableArray *obj;
  id v82;
  uint64_t v83;
  uint64_t v84;
  MFHeaderLabelView *firstValue;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  _QWORD v92[4];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  -[MFComposeRecipientView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return;
  p_textFieldConstraints = &self->_textFieldConstraints;
  if (self->_textFieldConstraints)
  {
    -[MFComposeRecipientView removeConstraints:](self, "removeConstraints:");
    v6 = *p_textFieldConstraints;
    *p_textFieldConstraints = 0;

  }
  location = (id *)&self->_textFieldConstraints;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v82 = (id)objc_claimAutoreleasedReturnValue();
  v7 = self;
  firstValue = self->super._labelView;
  -[MFComposeRecipientView bounds](self, "bounds");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceLayoutDirection");

  -[MFHeaderLabelView frame](self->super._labelView, "frame");
  if (v11)
    MaxX = v9 - CGRectGetMinX(*(CGRect *)&v12);
  else
    MaxX = CGRectGetMaxX(*(CGRect *)&v12);
  v17 = 0x1E0CB3000;
  if (!-[NSMutableArray count](self->_recipients, "count"))
  {
    v58 = 1;
    goto LABEL_35;
  }
  -[UIButton sizeThatFits:](self->_addButton, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v19 = v18;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = self->_recipients;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
  v21 = 0;
  if (!v20)
  {
    v23 = 1;
    v24 = MaxX;
    goto LABEL_34;
  }
  v83 = *(_QWORD *)v88;
  v22 = v19 + 15.0;
  v23 = 1;
  v24 = MaxX;
  do
  {
    v84 = v20;
    for (i = 0; i != v84; ++i)
    {
      if (*(_QWORD *)v88 != v83)
        objc_enumerationMutation(obj);
      -[NSMutableDictionary objectForKey:](v7->_atoms, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v27) = 1148846080;
      objc_msgSend(v26, "setContentHuggingPriority:forAxis:", 0, v27);
      LODWORD(v28) = 1148846080;
      objc_msgSend(v26, "setContentCompressionResistancePriority:forAxis:", 1, v28);
      objc_msgSend(v26, "layoutIfNeeded");
      objc_msgSend(v26, "superview");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29 == 0;

      if (!v30)
      {
        v31 = self;
        v32 = self->super._labelView;
        v33 = v32;
        if (v23 == 1)
          v34 = v22;
        else
          v34 = 0.0;
        v35 = v9 - v34 - v24;
        if (v21)
        {
          objc_msgSend(v26, "preferredWidth");
          if (v36 > v35)
          {

            v37 = v23 + 1;
            v24 = MaxX;
            v35 = v9 - MaxX;
            v31 = self;
            goto LABEL_22;
          }
          v49 = v21;

          v33 = v49;
          v31 = self;
LABEL_24:
          if (v33 == v31->super._labelView)
          {
            v51 = 0.0;
          }
          else
          {
            objc_msgSend(v26, "edgeInsets");
            v51 = -v50;
          }
          v52 = (void *)MEMORY[0x1E0CB3718];
          v95[0] = CFSTR("PADDING");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v95[1] = CFSTR("maximumAtomWidth");
          v96[0] = v38;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v96[1] = v47;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          _NSDictionaryOfVariableBindings(CFSTR("alignmentView, atomView"), v33, v26, 0);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[alignmentView]-(PADDING)-[atomView(<=maximumAtomWidth)]"), 2048, v53, v54);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (v32)
            goto LABEL_24;
          v37 = v23;
LABEL_22:
          v23 = v37;
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 11, 0, v31->super._labelView, 11, (double)v37, 0.0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "edgeInsets");
          v40 = v39;
          -[MFComposeRecipientView layoutMargins](v31, "layoutMargins");
          v42 = (void *)MEMORY[0x1E0CB3718];
          v93[0] = CFSTR("PADDING");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41 + 0.0 - v40);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v93[1] = CFSTR("maximumAtomWidth");
          v94[0] = v43;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v94[1] = v44;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          _NSDictionaryOfVariableBindings(CFSTR("atomView"), v26, 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(PADDING)-[atomView(<=maximumAtomWidth)]"), 2, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v47, "arrayByAddingObject:", v38);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0;
        }

        objc_msgSend(v26, "preferredWidth");
        v56 = v55;
        objc_msgSend(v82, "addObjectsFromArray:", v48);
        v57 = v26;

        v21 = (MFHeaderLabelView *)v57;
        v24 = v24 + v56;
        firstValue = v21;
      }

      v7 = self;
    }
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
  }
  while (v20);
LABEL_34:

  MaxX = v24;
  v58 = v23;
  v7 = self;
  v17 = 0x1E0CB3000uLL;
LABEL_35:
  if (firstValue == v7->super._labelView)
    v59 = 4.0;
  else
    v59 = 0.0;
  v91[0] = CFSTR("HORIZ_INSET");
  v60 = *(void **)(v17 + 2024);
  -[MFComposeRecipientView layoutMargins](v7, "layoutMargins");
  objc_msgSend(v60, "numberWithDouble:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v62;
  v91[1] = CFSTR("PADDING");
  objc_msgSend(*(id *)(v17 + 2024), "numberWithDouble:", v59);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v63;
  v92[2] = &unk_1E5A9FFF8;
  v91[2] = CFSTR("BUTTON_PADDING");
  v91[3] = CFSTR("SPACE");
  v92[3] = &unk_1E5AA0008;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = MaxX + 80.0;
  if (v58 == 1 && v65 <= v9)
  {
    v66 = 1;
    v67 = CFSTR("%@-[_textField]-(SPACE)-[_addButton]-(BUTTON_PADDING)-|");
  }
  else
  {
    v68 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_addButton"), self->_addButton, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_addButton]-(BUTTON_PADDING)-|"), 0, v64, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "addObjectsFromArray:", v70);

    v67 = CFSTR("%@-[_textField]-(BUTTON_PADDING)-|");
    v66 = v58;
  }
  _NSDictionaryOfVariableBindings(CFSTR("textFieldBuddy, _textField, _addButton"), firstValue, self->_textField, self->_addButton, 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65 <= v9)
  {
    v72 = CFSTR("[textFieldBuddy]-(PADDING)");
    if (a4)
    {
      v73 = 0;
LABEL_47:
      *a4 = v73;
    }
  }
  else
  {
    ++v66;
    v72 = CFSTR("H:|-(HORIZ_INSET)");
    if (a4)
    {
      v73 = 1;
      goto LABEL_47;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textField, 11, 0, self->super._labelView, 11, (double)v66, 0.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObject:", v74);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v67, v72);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v75, 0, v64, v71);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObjectsFromArray:", v76);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_addButton, 10, 0, self->super._labelView, 10, 1.0, 1.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObject:", v77);
  if (a3)
    *a3 = v66;
  if (v82)
  {
    objc_storeStrong(location, v82);
    -[MFComposeRecipientView addConstraints:](self, "addConstraints:", *location);
  }
  self->_needsLayoutConstraintUpdate = 0;

}

- (void)_setNeedsReflow
{
  void *v3;
  id v4;

  if (!self->_needsReflow)
  {
    self->_needsReflow = 1;
    objc_msgSend(MEMORY[0x1E0D1F070], "__mui_nextRunLoopMainThreadScheduler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientView ef_onScheduler:](self, "ef_onScheduler:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_reflowAnimated:", 0);

  }
}

- (void)_setNeedsLayoutConstraintUpdate
{
  void *v3;
  id v4;

  if (!self->_needsLayoutConstraintUpdate)
  {
    self->_needsLayoutConstraintUpdate = 1;
    objc_msgSend(MEMORY[0x1E0D1F070], "__mui_nextRunLoopMainThreadScheduler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MFComposeRecipientView ef_onScheduler:](self, "ef_onScheduler:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateLayoutConstraintsAndGetNumberOfRows:textFieldWillBeLastRow:", 0, 0);

  }
}

- (void)didMoveToSuperview
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MFComposeRecipientView;
  -[MFComposeRecipientView viewDidMoveToSuperview](&v2, sel_viewDidMoveToSuperview);
}

- (void)_tapGestureRecognized:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
    -[_MFMailRecipientTextField becomeFirstResponder](self->_textField, "becomeFirstResponder");

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGPoint v20;
  CGRect v21;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](self->_atoms, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "frame");
        v20.x = v5;
        v20.y = v7;
        if (CGRectContainsPoint(v21, v20))
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)editable
{
  return self->_editable;
}

- (int64_t)maxRecipients
{
  return self->_maxRecipients;
}

- (void)setMaxRecipients:(int64_t)a3
{
  self->_maxRecipients = a3;
}

- (double)inputDelay
{
  return self->_inputDelay;
}

- (void)setInputDelay:(double)a3
{
  self->_inputDelay = a3;
}

- (UITextField)textField
{
  return &self->_textField->super;
}

- (NSArray)recipients
{
  return &self->_recipients->super;
}

- (UIView)addButton
{
  return &self->_addButton->super.super;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (unint64_t)defaultAtomPresentationOptions
{
  return self->_defaultAtomPresentationOptions;
}

- (void)setDefaultAtomPresentationOptions:(unint64_t)a3
{
  self->_defaultAtomPresentationOptions = a3;
}

- (MFCorecipientsIndicatorAtom)corecipientsIndicator
{
  return self->_corecipientsIndicatorAtom;
}

- (void)setCorecipientsIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_corecipientsIndicatorAtom, a3);
}

- (BOOL)didIgnoreFirstResponderResign
{
  return self->_didIgnoreFirstResponderResign;
}

- (void)setDidIgnoreFirstResponderResign:(BOOL)a3
{
  self->_didIgnoreFirstResponderResign = a3;
}

- (BOOL)allowsDragAndDrop
{
  return self->_allowsDragAndDrop;
}

- (void)setAllowsDragAndDrop:(BOOL)a3
{
  self->_allowsDragAndDrop = a3;
}

- (BOOL)isSeparatorHidden
{
  return self->_separatorHidden;
}

- (int64_t)hideLastAtomComma
{
  return self->_hideLastAtomComma;
}

- (void)setHideLastAtomComma:(int64_t)a3
{
  self->_hideLastAtomComma = a3;
}

- (NSMutableDictionary)atoms
{
  return self->_atoms;
}

- (void)setAtoms:(id)a3
{
  objc_storeStrong((id *)&self->_atoms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atoms, 0);
  objc_storeStrong((id *)&self->_corecipientsIndicatorAtom, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_placeholderRecipient, 0);
  objc_storeStrong((id *)&self->_selectedAtom, 0);
  objc_storeStrong((id *)&self->_uncommentedAddresses, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_textFieldConstraints, 0);
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
