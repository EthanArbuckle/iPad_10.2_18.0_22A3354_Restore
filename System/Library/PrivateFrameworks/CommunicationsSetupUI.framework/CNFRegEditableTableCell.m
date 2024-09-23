@implementation CNFRegEditableTableCell

- (void)_updateTextFieldOffsetWithDict:(id)a3
{
  void *v4;
  float v5;
  id v6;

  objc_msgSend(a3, "propertyForKey:", CFSTR("cnf-textFieldOffset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "floatValue");
    -[CNFRegEditableTableCell setTextFieldOffset:](self, "setTextFieldOffset:", v5);
    -[CNFRegEditableTableCell setNeedsLayout](self, "setNeedsLayout");
    v4 = v6;
  }

}

- (void)notifyTextFieldEmptyStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  id *v5;
  id WeakRetained;
  id *v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  SEL emptyStateSelector;
  id v13;
  id v14;

  v3 = a3;
  v5 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75698]);
  WeakRetained = objc_loadWeakRetained(v5);
  if (WeakRetained && self->_emptyStateSelector)
  {
    v14 = WeakRetained;
    v7 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75780]);
    v8 = objc_loadWeakRetained(v7);
    if (v8)
    {
      v9 = v8;
      v10 = -[CNFRegEditableTableCell skipDelegateCallback](self, "skipDelegateCallback");

      if (v10)
        return;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained(v5);
      emptyStateSelector = self->_emptyStateSelector;
      v13 = objc_loadWeakRetained(v7);
      objc_msgSend(v11, "performSelector:withObject:withObject:", emptyStateSelector, v14, v13);

    }
    WeakRetained = v14;
  }

}

- (void)setTitle:(id)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegEditableTableCell;
  -[PSEditableTableCell setTitle:](&v5, sel_setTitle_, a3);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75780]));
  -[CNFRegEditableTableCell _updateTextFieldOffsetWithDict:](self, "_updateTextFieldOffsetWithDict:", WeakRetained);

}

- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5
{
  id v8;
  NSString *v9;
  NSString *v10;
  SEL v11;
  const char *v12;
  id WeakRetained;
  char v14;
  NSString *v15;
  NSString *v16;
  SEL v17;
  const char *v18;
  id v19;
  char v20;
  NSString *v21;
  NSString *v22;
  SEL v23;
  const char *v24;
  id v25;
  char v26;
  objc_super v27;

  v8 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CNFRegEditableTableCell;
  -[PSEditableTableCell setValueChangedTarget:action:specifier:](&v27, sel_setValueChangedTarget_action_specifier_, a3, a4, v8);
  objc_msgSend(v8, "propertyForKey:", CFSTR("cnf-textFieldEmptyStateChangeSelector"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = NSSelectorFromString(v9);
    if (v11)
    {
      v12 = v11;
      WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                                + (int)*MEMORY[0x24BE75698]));
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
        self->_emptyStateSelector = v12;
    }
  }

  objc_msgSend(v8, "propertyForKey:", CFSTR("cnf-didBeginEditingSelector"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = NSSelectorFromString(v15);
    if (v17)
    {
      v18 = v17;
      v19 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                       + (int)*MEMORY[0x24BE75698]));
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
        self->_didBeginEditingSelector = v18;
    }
  }

  objc_msgSend(v8, "propertyForKey:", CFSTR("cnf-didEndEditingSelector"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = NSSelectorFromString(v21);
    if (v23)
    {
      v24 = v23;
      v25 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                       + (int)*MEMORY[0x24BE75698]));
      v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) != 0)
        self->_didEndEditingSelector = v24;
    }
  }

  -[CNFRegEditableTableCell _updateTextFieldOffsetWithDict:](self, "_updateTextFieldOffsetWithDict:", v8);
}

- (BOOL)_textFieldIsCurrentlyEmpty
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegEditableTableCell editableTextField](self, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length") == 0;

  return v7;
}

- (void)_handleTextChanged
{
  _BOOL8 v3;

  v3 = -[CNFRegEditableTableCell _textFieldIsCurrentlyEmpty](self, "_textFieldIsCurrentlyEmpty");
  if (self->_textFieldIsEmpty != v3)
  {
    self->_textFieldIsEmpty = v3;
    -[CNFRegEditableTableCell notifyTextFieldEmptyStateChanged:](self, "notifyTextFieldEmptyStateChanged:", v3);
  }
}

- (void)_startListeningForTextChanges
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id textChangeObserver;
  _QWORD v9[5];
  _QWORD v10[5];
  CNFRegEditableTableCell *v11;

  if (!self->_textChangeObserver)
  {
    self->_textFieldIsEmpty = -[CNFRegEditableTableCell _textFieldIsCurrentlyEmpty](self, "_textFieldIsCurrentlyEmpty");
    v3 = (id)*MEMORY[0x24BEBE868];
    -[CNFRegEditableTableCell editableTextField](self, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = __Block_byref_object_copy__3;
    v10[4] = __Block_byref_object_dispose__3;
    v11 = self;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__CNFRegEditableTableCell__startListeningForTextChanges__block_invoke;
    v9[3] = &unk_24D0764D0;
    v9[4] = v10;
    v5 = (void *)MEMORY[0x2199B8E98](v9);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v3, v4, 0, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    textChangeObserver = self->_textChangeObserver;
    self->_textChangeObserver = v7;

    _Block_object_dispose(v10, 8);
  }
}

uint64_t __56__CNFRegEditableTableCell__startListeningForTextChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_handleTextChanged");
}

- (void)_stopListeningForTextChanges
{
  void *v3;
  id textChangeObserver;

  if (self->_textChangeObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_textChangeObserver);

    textChangeObserver = self->_textChangeObserver;
    self->_textChangeObserver = 0;

  }
}

- (void)notifyTextFieldDidBeginEditing
{
  id *v3;
  id WeakRetained;
  id *v5;
  id v6;
  void *v7;
  BOOL v8;
  SEL didBeginEditingSelector;
  id v10;
  id v11;

  v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75698]);
  WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained && self->_didBeginEditingSelector)
  {
    v11 = WeakRetained;
    v5 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75780]);
    v6 = objc_loadWeakRetained(v5);
    if (v6)
    {
      v7 = v6;
      v8 = -[CNFRegEditableTableCell skipDelegateCallback](self, "skipDelegateCallback");

      if (v8)
        return;
      v11 = objc_loadWeakRetained(v3);
      didBeginEditingSelector = self->_didBeginEditingSelector;
      v10 = objc_loadWeakRetained(v5);
      objc_msgSend(v11, "performSelector:withObject:", didBeginEditingSelector, v10);

    }
    WeakRetained = v11;
  }

}

- (void)notifyTextFieldDidEndEditing
{
  id *v3;
  id WeakRetained;
  id *v5;
  id v6;
  void *v7;
  BOOL v8;
  SEL didEndEditingSelector;
  id v10;
  id v11;

  v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75698]);
  WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained && self->_didEndEditingSelector)
  {
    v11 = WeakRetained;
    v5 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75780]);
    v6 = objc_loadWeakRetained(v5);
    if (v6)
    {
      v7 = v6;
      v8 = -[CNFRegEditableTableCell skipDelegateCallback](self, "skipDelegateCallback");

      if (v8)
        return;
      v11 = objc_loadWeakRetained(v3);
      didEndEditingSelector = self->_didEndEditingSelector;
      v10 = objc_loadWeakRetained(v5);
      objc_msgSend(v11, "performSelector:withObject:", didEndEditingSelector, v10);

    }
    WeakRetained = v11;
  }

}

- (void)textFieldDidBeginEditing:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegEditableTableCell;
  -[PSEditableTableCell textFieldDidBeginEditing:](&v4, sel_textFieldDidBeginEditing_, a3);
  -[CNFRegEditableTableCell notifyTextFieldDidBeginEditing](self, "notifyTextFieldDidBeginEditing");
}

- (void)textFieldDidEndEditing:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegEditableTableCell;
  -[PSEditableTableCell textFieldDidEndEditing:](&v4, sel_textFieldDidEndEditing_, a3);
  -[CNFRegEditableTableCell notifyTextFieldDidEndEditing](self, "notifyTextFieldDidEndEditing");
}

- (void)setShadowImage:(id)a3
{
  UIImage *v5;
  CNFRegShadowView *shadowView;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_shadowImage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_shadowImage, a3);
    -[CNFRegShadowView removeFromSuperview](self->_shadowView, "removeFromSuperview");
    shadowView = self->_shadowView;
    self->_shadowView = 0;

    -[CNFRegEditableTableCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setChecked:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id obj;
  objc_super v15;

  v3 = a3;
  -[CNFRegEditableTableCell customCheckmarkImage](self, "customCheckmarkImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (int)*MEMORY[0x24BE75770];
    if (*((_BYTE *)&self->super.super.super.super.super.super.isa + v6) != v3)
    {
      *((_BYTE *)&self->super.super.super.super.super.super.isa + v6) = v3;
      if (v3)
      {
        v7 = objc_alloc(MEMORY[0x24BEBD668]);
        -[CNFRegEditableTableCell customCheckmarkImage](self, "customCheckmarkImage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFRegEditableTableCell customCheckmarkImageSelected](self, "customCheckmarkImageSelected");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        obj = (id)objc_msgSend(v7, "initWithImage:highlightedImage:", v8, v9);

        if (-[CNFRegEditableTableCell accessoryType](self, "accessoryType") == 1
          || -[CNFRegEditableTableCell accessoryType](self, "accessoryType") == 2)
        {
          v10 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75778]);
          objc_storeStrong(v10, obj);
          -[CNFRegEditableTableCell contentView](self, "contentView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addSubview:", *v10);

          -[CNFRegEditableTableCell setNeedsLayout](self, "setNeedsLayout");
        }
        else
        {
          -[CNFRegEditableTableCell setAccessoryView:](self, "setAccessoryView:", obj);
        }

      }
      else if (-[CNFRegEditableTableCell accessoryType](self, "accessoryType") == 1
             || -[CNFRegEditableTableCell accessoryType](self, "accessoryType") == 2)
      {
        v12 = (int)*MEMORY[0x24BE75778];
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v12), "removeFromSuperview");
        v13 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v12);
        *(Class *)((char *)&self->super.super.super.super.super.super.isa + v12) = 0;

      }
      else
      {
        -[CNFRegEditableTableCell setAccessoryView:](self, "setAccessoryView:", 0);
      }
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CNFRegEditableTableCell;
    -[PSTableCell setChecked:](&v15, sel_setChecked_, v3);
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CNFRegShadowView *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CNFRegShadowView *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CNFRegEditableTableCell;
  -[PSEditableTableCell layoutSubviews](&v20, sel_layoutSubviews);
  -[CNFRegEditableTableCell backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNFRegEditableTableCell shadowImage](self, "shadowImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNFRegEditableTableCell shadowView](self, "shadowView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {

      if (!v6)
      {
        v7 = [CNFRegShadowView alloc];
        -[CNFRegEditableTableCell backgroundView](self, "backgroundView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bounds");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        -[CNFRegEditableTableCell shadowImage](self, "shadowImage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[CNFRegShadowView initWithFrame:shadowImage:](v7, "initWithFrame:shadowImage:", v17, v10, v12, v14, v16);

        -[CNFRegEditableTableCell backgroundView](self, "backgroundView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSubview:", v18);

        -[CNFRegEditableTableCell setShadowView:](self, "setShadowView:", v18);
      }
    }
    else
    {
      objc_msgSend(v5, "removeFromSuperview");

      -[CNFRegEditableTableCell setShadowView:](self, "setShadowView:", 0);
    }
  }
  -[CNFRegEditableTableCell _startListeningForTextChanges](self, "_startListeningForTextChanges");
}

- (void)dealloc
{
  objc_super v3;

  -[CNFRegEditableTableCell _stopListeningForTextChanges](self, "_stopListeningForTextChanges");
  v3.receiver = self;
  v3.super_class = (Class)CNFRegEditableTableCell;
  -[PSEditableTableCell dealloc](&v3, sel_dealloc);
}

- (BOOL)skipDelegateCallback
{
  return self->_skipDelegateCallback;
}

- (void)setSkipDelegateCallback:(BOOL)a3
{
  self->_skipDelegateCallback = a3;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (CNFRegShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (UIImage)customCheckmarkImage
{
  return self->_customCheckmarkImage;
}

- (void)setCustomCheckmarkImage:(id)a3
{
  objc_storeStrong((id *)&self->_customCheckmarkImage, a3);
}

- (UIImage)customCheckmarkImageSelected
{
  return self->_customCheckmarkImageSelected;
}

- (void)setCustomCheckmarkImageSelected:(id)a3
{
  objc_storeStrong((id *)&self->_customCheckmarkImageSelected, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customCheckmarkImageSelected, 0);
  objc_storeStrong((id *)&self->_customCheckmarkImage, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong(&self->_textChangeObserver, 0);
}

@end
