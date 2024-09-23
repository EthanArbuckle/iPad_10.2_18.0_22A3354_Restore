@implementation MFPopupButton

- (MFPopupButton)initWithFrame:(CGRect)a3
{
  MFPopupButton *v3;
  MFPopupButton *v4;
  NSArray *items;
  NSArray *v6;
  NSArray *deferredItems;
  MFActivityIndicatorLabel *v8;
  MFActivityIndicatorLabel *label;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MFPopupButton;
  v3 = -[MFPopupButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    items = v3->_items;
    v6 = (NSArray *)MEMORY[0x1E0C9AA60];
    v3->_items = (NSArray *)MEMORY[0x1E0C9AA60];

    deferredItems = v4->_deferredItems;
    v4->_deferredItems = v6;

    v8 = objc_alloc_init(MFActivityIndicatorLabel);
    label = v4->_label;
    v4->_label = v8;

    -[MFPopupButton bounds](v4, "bounds");
    -[MFActivityIndicatorLabel setFrame:](v4->_label, "setFrame:");
    -[MFActivityIndicatorLabel textLabel](v4->_label, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextAlignment:", 4);

    -[MFPopupButton addSubview:](v4, "addSubview:", v4->_label);
    -[UIView mf_pinToView:layoutMarginEdges:flexibleEdges:](v4->_label, "mf_pinToView:layoutMarginEdges:flexibleEdges:", v4, 0, 13);
    -[MFPopupButton setContextMenuInteractionEnabled:](v4, "setContextMenuInteractionEnabled:", 0);
    -[MFPopupButton setShowsMenuAsPrimaryAction:](v4, "setShowsMenuAsPrimaryAction:", 1);
  }
  return v4;
}

- (void)setSelectedItem:(id)a3
{
  MFPopupButtonItem *v4;
  MFPopupButtonItem *selectedItem;
  id v6;

  v6 = a3;
  if (!-[MFPopupButtonItem isEqual:](self->_selectedItem, "isEqual:"))
  {
    v4 = (MFPopupButtonItem *)objc_msgSend(v6, "copy");
    selectedItem = self->_selectedItem;
    self->_selectedItem = v4;

    -[MFPopupButton updateItem:](self, "updateItem:", v6);
    -[MFPopupButton _updateUI](self, "_updateUI");
  }

}

- (void)setItems:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v7;

  if ((objc_msgSend(v8, "isEqualToArray:", self->_items) & 1) == 0)
  {
    -[MFPopupButton dismissMenu](self, "dismissMenu");
    objc_storeStrong((id *)&self->_items, v7);
    -[MFPopupButton setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", -[NSArray count](self->_items, "count") != 0);
    -[MFPopupButton _updateUI](self, "_updateUI");
  }

}

- (void)setDeferredItems:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v7;

  if ((objc_msgSend(v8, "isEqualToArray:", self->_deferredItems) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_deferredItems, v7);
    -[MFPopupButton _updateUI](self, "_updateUI");
  }

}

- (NSArray)combinedItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[MFPopupButton items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  -[MFPopupButton deferredItems](self, "deferredItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_flatten");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)updateItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MFPopupButton combinedItems](self, "combinedItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "popupTitle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "popupTitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) != 0)
        {
          objc_msgSend(v8, "title");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "title");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if ((v13 & 1) == 0)
          {
            objc_msgSend(v4, "title");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setTitle:", v14);

            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
LABEL_12:

}

- (UIFont)font
{
  void *v2;
  void *v3;
  void *v4;

  -[MFPopupButton label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v4;
}

- (void)setFont:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MFPopupButton label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

}

- (void)dismissMenu
{
  id v2;

  -[MFPopupButton contextMenuInteraction](self, "contextMenuInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissMenu");

}

- (void)disableMenu
{
  -[MFPopupButton setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", 0);
}

- (void)enableMenu
{
  -[MFPopupButton setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", 1);
}

- (void)sizeToFit
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFPopupButton;
  -[MFPopupButton sizeToFit](&v5, sel_sizeToFit);
  -[MFPopupButton label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[MFPopupButton label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  -[MFPopupButton setBounds:](self, "setBounds:");

}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0DC3658], "mailSenderAddressPickerColorNormalTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPopupButton selectedItem](self, "selectedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPopupButton updateItem:](self, "updateItem:", v4);
  if (v4
    && (-[MFPopupButton combinedItems](self, "combinedItems"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsObject:", v4),
        v5,
        v6))
  {
    -[MFPopupButton selectedItem](self, "selectedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "style") == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "mailSenderAddressPickerUnsafeDomainColorTextColor");
      v8 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v8;
    }
  }
  else
  {
    v13 = &stru_1E5A6A588;
  }
  -[MFPopupButton label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v13);

  -[MFPopupButton label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v3);

}

- (void)_didSelectItem:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  -[MFPopupButton delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPopupButton combinedItems](self, "combinedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v7);

  if (v6)
  {
    -[MFPopupButton setSelectedItem:](self, "setSelectedItem:", v7);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "popupButton:didSelectItem:", self, v7);
  }

}

- (id)actionForItem:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[MFPopupButton selectedItem](self, "selectedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(v4, "popupTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __31__MFPopupButton_actionForItem___block_invoke;
  v14[3] = &unk_1E5A68800;
  objc_copyWeak(&v16, &location);
  v9 = v4;
  v15 = v9;
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSubtitle:", v11);

  if (objc_msgSend(v9, "style") == 1)
  {
    v12 = 2;
LABEL_5:
    objc_msgSend(v10, "setAttributes:", v12);
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "style") == 2)
  {
    v12 = 1;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v10, "setState:", v6);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __31__MFPopupButton_actionForItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didSelectItem:", *(_QWORD *)(a1 + 32));

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC36B8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__MFPopupButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v7[3] = &unk_1E5A699E8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

id __71__MFPopupButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuForPopupButton:", WeakRetained);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v8 = a5;
  v10.receiver = self;
  v10.super_class = (Class)MFPopupButton;
  -[MFPopupButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v10, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, a3, a4, v8);
  -[MFPopupButton delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "popupButtonWillPresentMenu:animator:", self, v8);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v8 = a5;
  v10.receiver = self;
  v10.super_class = (Class)MFPopupButton;
  -[MFPopupButton contextMenuInteraction:willEndForConfiguration:animator:](&v10, sel_contextMenuInteraction_willEndForConfiguration_animator_, a3, a4, v8);
  -[MFPopupButton delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "popupButtonWillDismissMenu:animator:", self, v8);

}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  uint64_t v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat MaxX;
  double MaxY;
  double v15;
  CGPoint result;
  CGRect v17;

  v4 = -[MFPopupButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection", a3);
  -[MFPopupButton bounds](self, "bounds");
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  MaxX = v5;
  if (v4 == 1)
    MaxX = CGRectGetMaxX(*(CGRect *)&v5);
  v17.origin.x = v9;
  v17.origin.y = v10;
  v17.size.width = v11;
  v17.size.height = v12;
  MaxY = CGRectGetMaxY(v17);
  v15 = MaxX;
  result.y = MaxY;
  result.x = v15;
  return result;
}

- (MFActivityIndicatorLabel)label
{
  return self->_label;
}

- (MFPopupButtonDelegate)delegate
{
  return (MFPopupButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MFPopupButtonItem)selectedItem
{
  return self->_selectedItem;
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)deferredItems
{
  return self->_deferredItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
