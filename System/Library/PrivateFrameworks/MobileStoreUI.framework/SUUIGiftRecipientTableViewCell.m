@implementation SUUIGiftRecipientTableViewCell

- (SUUIGiftRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SUUIGiftRecipientTableViewCell *v4;
  uint64_t v5;
  CNComposeRecipientTextView *v6;
  CNComposeRecipientTextView *recipientView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNComposeRecipientTextView *v14;
  void *v15;
  CNComposeRecipientTextView *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  double v28;
  void *v29;
  UIView *v30;
  UIView *topBorderView;
  UIView *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)SUUIGiftRecipientTableViewCell;
  v4 = -[SUUIGiftRecipientTableViewCell initWithStyle:reuseIdentifier:](&v41, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = SUUIContactsAutocompleteUIFramework();
    v6 = (CNComposeRecipientTextView *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("CNComposeRecipientTextView"), v5));
    recipientView = v4->_recipientView;
    v4->_recipientView = v6;

    -[CNComposeRecipientTextView labelView](v4->_recipientView, "labelView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    -[CNComposeRecipientTextView labelView](v4->_recipientView, "labelView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v11);

    -[CNComposeRecipientTextView labelView](v4->_recipientView, "labelView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    v14 = v4->_recipientView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTextView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[CNComposeRecipientTextView setDelegate:](v4->_recipientView, "setDelegate:", v4);
    v16 = v4->_recipientView;
    -[CNComposeRecipientTextView labelView](v16, "labelView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTextView setBaseFont:](v16, "setBaseFont:", v18);

    v19 = *MEMORY[0x24BEBE0C0];
    -[CNComposeRecipientTextView setMaximumContentSizeCategory:](v4->_recipientView, "setMaximumContentSizeCategory:", *MEMORY[0x24BEBE0C0]);
    -[CNComposeRecipientTextView setMinimumContentSizeCategory:](v4->_recipientView, "setMinimumContentSizeCategory:", v19);
    -[CNComposeRecipientTextView textView](v4->_recipientView, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "textContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLineFragmentPadding:", 0.0);

    -[CNComposeRecipientTextView subviews](v4->_recipientView, "subviews");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v38 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v27, "frame", (_QWORD)v37);
          if (v28 <= 1.0)
          {
            objc_msgSend(v27, "setHidden:", 1);
            goto LABEL_12;
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v24)
          continue;
        break;
      }
    }
LABEL_12:

    -[CNComposeRecipientTextView sizeToFit](v4->_recipientView, "sizeToFit");
    -[SUUIGiftRecipientTableViewCell contentView](v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v4->_recipientView);

    v30 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    topBorderView = v4->_topBorderView;
    v4->_topBorderView = v30;

    v32 = v4->_topBorderView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v32, "setBackgroundColor:", v33);

    -[SUUIGiftRecipientTableViewCell contentView](v4, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", v4->_topBorderView);

    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_leftToRight = objc_msgSend(v35, "userInterfaceLayoutDirection") == 0;

    -[SUUIGiftRecipientTableViewCell setDidLayoutSubviews:](v4, "setDidLayoutSubviews:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CNContactPickerViewController setDelegate:](self->_contactPickerController, "setDelegate:", 0);
  -[CNComposeRecipientTextView setDelegate:](self->_recipientView, "setDelegate:", 0);
  -[SUUIGiftContactSearchController setDelegate:](self->_searchController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIGiftRecipientTableViewCell;
  -[SUUIGiftRecipientTableViewCell dealloc](&v3, sel_dealloc);
}

- (NSAttributedString)attributedPlaceholder
{
  return -[UILabel attributedText](self->_placeholderLabel, "attributedText");
}

- (NSString)label
{
  void *v2;
  void *v3;

  -[CNComposeRecipientTextView labelView](self->_recipientView, "labelView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)presentPeoplePickerPopover:(id)a3 animated:(BOOL)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v5 = a3;
  -[SUUIGiftRecipientTableViewCell frame](self, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SUUIGiftRecipientTableViewCell superview](self, "superview");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v14, 15, 1, v7, v9, v11, v13);

}

- (void)presentSearchResultsPopover:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CNComposeRecipientTextView *recipientView;
  id v6;
  id v7;

  v4 = a4;
  recipientView = self->_recipientView;
  v6 = a3;
  -[CNComposeRecipientTextView textView](recipientView, "textView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v7, 1, v4);

}

- (NSArray)recipientAddresses
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView recipients](self->_recipientView, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "address");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setAttributedPlaceholder:(id)a3
{
  id v4;
  UILabel *placeholderLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  uint64_t v12;
  UILabel *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SUUIGiftRecipientTableViewCell attributedPlaceholder](self, "attributedPlaceholder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqual:", v4) & 1) == 0)
  {
    placeholderLabel = self->_placeholderLabel;
    if (v15)
    {
      if (!placeholderLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_placeholderLabel;
        self->_placeholderLabel = v6;

        v8 = self->_placeholderLabel;
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_placeholderLabel;
        -[CNComposeRecipientTextView textView](self->_recipientView, "textView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isFirstResponder") & 1) != 0)
          v12 = 1;
        else
          v12 = -[CNComposeRecipientTextView hasContent](self->_recipientView, "hasContent");
        -[UILabel setHidden:](v10, "setHidden:", v12);

        -[SUUIGiftRecipientTableViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertSubview:belowSubview:", self->_placeholderLabel, self->_recipientView);

        placeholderLabel = self->_placeholderLabel;
      }
      -[UILabel setAttributedText:](placeholderLabel, "setAttributedText:");
      -[UILabel sizeToFit](self->_placeholderLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](placeholderLabel, "removeFromSuperview");
      v13 = self->_placeholderLabel;
      self->_placeholderLabel = 0;

    }
    -[SUUIGiftRecipientTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setLabel:(id)a3
{
  -[CNComposeRecipientTextView setLabel:](self->_recipientView, "setLabel:", a3);
}

- (void)setRecipientAddresses:(id)a3
{
  -[CNComposeRecipientTextView setAddresses:](self->_recipientView, "setAddresses:", a3);
}

- (void)layoutSubviews
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  UIView *topBorderView;
  void *v36;
  double v37;
  objc_super v38;
  CGRect v39;

  v38.receiver = self;
  v38.super_class = (Class)SUUIGiftRecipientTableViewCell;
  -[SUUIGiftRecipientTableViewCell layoutSubviews](&v38, sel_layoutSubviews);
  -[SUUIGiftRecipientTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CNComposeRecipientTextView setFrame:](self->_recipientView, "setFrame:", v5, v7, v9, v11);
  if (-[SUUIGiftRecipientTableViewCell didLayoutSubviews](self, "didLayoutSubviews"))
    -[CNComposeRecipientTextView reflow](self->_recipientView, "reflow");
  -[CNComposeRecipientTextView layoutIfNeeded](self->_recipientView, "layoutIfNeeded");
  if (self->_placeholderLabel)
  {
    -[CNComposeRecipientTextView labelView](self->_recipientView, "labelView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v12, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftRecipientTableViewCell convertRect:fromView:](self, "convertRect:fromView:", v21, v14, v16, v18, v20);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    -[UILabel frame](self->_placeholderLabel, "frame");
    v31 = v30;
    if (-[SUUIGiftRecipientTableViewCell leftToRight](self, "leftToRight"))
    {
      v39.origin.x = v23;
      v39.origin.y = v25;
      v39.size.width = v27;
      v39.size.height = v29;
      v32 = CGRectGetMaxX(v39) + 4.0;
      v33 = v9 + -15.0 - v32;
    }
    else
    {
      v33 = v9 + -15.0 + -4.0 + v23 - v9;
      v32 = 15.0;
    }
    v34 = (v29 - v31) * 0.5;
    -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v32, v25 + floorf(v34), v33, v31);

  }
  topBorderView = self->_topBorderView;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "scale");
  -[UIView setFrame:](topBorderView, "setFrame:", 0.0, 0.0, v9, 1.0 / v37);

  -[SUUIGiftRecipientTableViewCell setDidLayoutSubviews:](self, "setDidLayoutSubviews:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[CNComposeRecipientTextView frame](self->_recipientView, "frame", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = SUUIContactsAutocompleteUIFramework();
  v7 = objc_alloc((Class)SUUIWeakLinkedClassForString(CFSTR("CNComposeRecipient"), v6));
  objc_msgSend(v5, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v7, "initWithContact:address:kind:", v8, v9, 0);
  -[CNComposeRecipientTextView addRecipient:](self->_recipientView, "addRecipient:", v10);
  -[SUUIGiftRecipientTableViewCell _sendDismissContactPicker](self, "_sendDismissContactPicker");

}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  height = a4.height;
  v11 = a3;
  objc_msgSend(v11, "frame");
  v6 = v11;
  if (height != v7)
  {
    objc_msgSend(v11, "setFrame:");
    -[SUUIGiftRecipientTableViewCell superview](self, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v8, "superview");
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      while (v9);
    }
    objc_msgSend(v8, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "tableView:giftRecipientCellDidChangeSize:", v8, self);

    v6 = v11;
  }

}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a4;
  v5 = SUUIContactsAutocompleteUIFramework();
  v6 = (void *)objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(CFSTR("CNComposeRecipient"), v5)), "initWithContact:address:kind:", 0, v4, 0);

  return v6;
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", objc_msgSend(a3, "hasContent"));
  -[SUUIGiftRecipientTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v7, "clearText");
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v7, "addAddress:", v6);
  -[SUUIGiftRecipientTableViewCell _resetSearchController](self, "_resetSearchController");
  -[SUUIGiftRecipientTableViewCell _sendDidChangeRecipients](self, "_sendDidChangeRecipients");

}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v6;
  SUUIGiftContactSearchController *v7;
  SUUIGiftContactSearchController *searchController;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!self->_searchController)
  {
    v7 = objc_alloc_init(SUUIGiftContactSearchController);
    searchController = self->_searchController;
    self->_searchController = v7;

    -[SUUIGiftContactSearchController setDelegate:](self->_searchController, "setDelegate:", self);
  }
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", objc_msgSend(v9, "hasContent"));
  -[SUUIGiftContactSearchController searchForText:](self->_searchController, "searchForText:", v6);

}

- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3
{
  void *v3;
  id v4;

  -[SUUIGiftRecipientTableViewCell _contactStore](self, "_contactStore", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "requestAccessForEntityType:completionHandler:", 0, &__block_literal_global_14);
    v3 = v4;
  }

}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  -[SUUIGiftRecipientTableViewCell _sendDismissContactPicker](self, "_sendDismissContactPicker", a3);
  -[SUUIGiftRecipientTableViewCell _sendDidChangeRecipients](self, "_sendDidChangeRecipients");
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  CNContactPickerViewController *contactPickerController;
  uint64_t v8;
  CNContactPickerViewController *v9;
  CNContactPickerViewController *v10;
  void *v11;
  id *v12;
  CNContactPickerViewController *v13;
  void *v14;
  id v15;
  void *v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x24BDAC8D0];
  -[SUUIGiftRecipientTableViewCell superview](self, "superview", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v4, "superview");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    while (v5);
  }
  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    contactPickerController = self->_contactPickerController;
    if (!contactPickerController)
    {
      v8 = SUUIContactsUIFramework();
      v9 = (CNContactPickerViewController *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("CNContactPickerViewController"), v8));
      v10 = self->_contactPickerController;
      self->_contactPickerController = v9;

      -[CNContactPickerViewController setDelegate:](self->_contactPickerController, "setDelegate:", self);
      v11 = (void *)SUUIContactsFramework();
      v12 = (id *)SUUIWeakLinkedSymbolForString("CNContactEmailAddressesKey", v11);
      v13 = self->_contactPickerController;
      v17[0] = *v12;
      v14 = (void *)MEMORY[0x24BDBCE30];
      v15 = v17[0];
      objc_msgSend(v14, "arrayWithObjects:count:", v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactPickerViewController setDisplayedPropertyKeys:](v13, "setDisplayedPropertyKeys:", v16);

      contactPickerController = self->_contactPickerController;
    }
    objc_msgSend(v6, "tableView:giftRecipientCell:presentContactPicker:", v4, self, contactPickerController, v17[0]);
  }

}

- (void)recipientViewDidResignFirstResponder:(id)a3
{
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", -[CNComposeRecipientTextView hasContent](self->_recipientView, "hasContent", a3));
  -[SUUIGiftRecipientTableViewCell _resetSearchController](self, "_resetSearchController");
}

- (void)searchController:(id)a3 didSelectRecipient:(id)a4
{
  -[CNComposeRecipientTextView addRecipient:](self->_recipientView, "addRecipient:", a4);
  -[CNComposeRecipientTextView clearText](self->_recipientView, "clearText");
  -[SUUIGiftRecipientTableViewCell _resetSearchController](self, "_resetSearchController");
  -[SUUIGiftRecipientTableViewCell _sendDidChangeRecipients](self, "_sendDidChangeRecipients");
}

- (id)_contactStore
{
  CNContactStore *contactStore;
  uint64_t v4;
  CNContactStore *v5;
  CNContactStore *v6;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = SUUIContactsFramework();
    v5 = (CNContactStore *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("CNContactStore"), v4));
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)_resetSearchController
{
  SUUIGiftContactSearchController *searchController;

  searchController = self->_searchController;
  if (searchController)
  {
    -[SUUIGiftContactSearchController resetSearch](searchController, "resetSearch");
    -[SUUIGiftRecipientTableViewCell _sendDidUpdateSearchController](self, "_sendDidUpdateSearchController");
  }
}

- (void)_sendDidChangeRecipients
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  -[SUUIGiftRecipientTableViewCell superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v6, "superview");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:
  v7 = v3;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "tableView:giftRecipientCellDidChangeRecipients:", v7, self);

}

- (void)_sendDidUpdateSearchController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  -[SUUIGiftRecipientTableViewCell superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v6, "superview");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:
  v7 = v3;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "tableView:giftRecipientCell:didUpdateSearchController:", v7, self, self->_searchController);

}

- (void)_sendDismissContactPicker
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  -[SUUIGiftRecipientTableViewCell superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v6, "superview");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
      if (!v4)
        goto LABEL_6;
    }
    v3 = v6;
  }
LABEL_6:
  v7 = v3;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "tableView:giftRecipientCell:dismissContactPicker:", v7, self, self->_contactPickerController);

}

- (BOOL)didLayoutSubviews
{
  return self->_didLayoutSubviews;
}

- (void)setDidLayoutSubviews:(BOOL)a3
{
  self->_didLayoutSubviews = a3;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_recipientView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_contactPickerController, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
