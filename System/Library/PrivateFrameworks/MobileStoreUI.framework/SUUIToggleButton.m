@implementation SUUIToggleButton

- (SUUIToggleButton)init
{
  SUUIToggleButton *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIToggleButton;
  v2 = -[SUUIToggleButton init](&v5, sel_init);
  if (v2)
  {
    +[SUUIToggleStateCenter defaultCenter](SUUIToggleStateCenter, "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", v2);

    v2->_toggled = 0;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SUUIToggleStateCenter defaultCenter](SUUIToggleStateCenter, "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SUUIToggleButton;
  -[SUUIStyledButton dealloc](&v4, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGSize result;

  if (self->_toggleButtonType)
  {
    v22.receiver = self;
    v22.super_class = (Class)SUUIToggleButton;
    -[SUUIStyledButton sizeThatFits:](&v22, sel_sizeThatFits_, a3.width, a3.height);
    v5 = v4;
    v7 = v6;
  }
  else
  {
    if (self->_toggled)
      -[SUUIToggleButton _toggledLayout](self, "_toggledLayout", a3.width, a3.height);
    else
      -[SUUIToggleButton _nonToggledLayout](self, "_nonToggledLayout", a3.width, a3.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v5 = v10;
    v7 = v11;

    -[SUUIStyledButton borderStyle](self, "borderStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "borderWidth");
      *(float *)&v14 = v14 + v14;
      v15 = floorf(*(float *)&v14);
      objc_msgSend(v13, "contentInset");
      v7 = v7 + v17 + v16 + v15;
      v5 = v5 + v18 + v19 + v15;
    }

  }
  v20 = v5;
  v21 = v7;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)setToggled:(BOOL)a3
{
  self->_toggled = a3;
  -[SUUIToggleButton setToggled:animated:](self, "setToggled:animated:");
}

- (void)setToggled:(BOOL)a3 animated:(BOOL)a4
{
  self->_toggled = a3;
  -[SUUIToggleButton _showToggleState:](self, "_showToggleState:", a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t autoIncrementCount;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (-[SUUIToggleButton isTouchInside](self, "isTouchInside"))
  {
    if (self->_toggleItemIdentifier)
    {
      +[SUUIToggleStateCenter defaultCenter](SUUIToggleStateCenter, "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemForIdentifier:", self->_toggleItemIdentifier);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (self->_autoIncrement)
      {
        autoIncrementCount = objc_msgSend(v9, "count");
        self->_count = autoIncrementCount;
        if (autoIncrementCount == -1)
          autoIncrementCount = self->_autoIncrementCount;
        if (self->_toggled)
          v12 = autoIncrementCount - 1;
        else
          v12 = autoIncrementCount + 1;
        self->_count = v12 & ~(v12 >> 63);
        if (v12 < 1)
        {
          v15 = CFSTR(" ");
        }
        else
        {
          if (touchesEnded_withEvent__sOnceToken != -1)
            dispatch_once(&touchesEnded_withEvent__sOnceToken, &__block_literal_global_7);
          v13 = (void *)touchesEnded_withEvent__sNumberFormatter;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_count);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringFromNumber:", v14);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v10, "setToggledString:", v15);
        objc_msgSend(v10, "setCount:", self->_count);

      }
      objc_msgSend(v10, "setToggled:", !self->_toggled);
      objc_msgSend(v8, "updateItem:", v10);

    }
    else
    {
      -[SUUIToggleButton setToggled:](self, "setToggled:", !self->_toggled);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SUUIToggleButton;
  -[SUUIStyledButton touchesEnded:withEvent:](&v16, sel_touchesEnded_withEvent_, v6, v7);

}

uint64_t __43__SUUIToggleButton_touchesEnded_withEvent___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)touchesEnded_withEvent__sNumberFormatter;
  touchesEnded_withEvent__sNumberFormatter = (uint64_t)v0;

  return objc_msgSend((id)touchesEnded_withEvent__sNumberFormatter, "setNumberStyle:", 1);
}

- (void)setButtonTitleText:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    objc_storeStrong((id *)&self->_titleToggleString, a3);
    -[SUUIToggleButton _layoutForString:](self, "_layoutForString:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStyledButton setTitleLayout:](self, "setTitleLayout:", v5);

    -[SUUIToggleButton setNeedsLayout](self, "setNeedsLayout");
    -[SUUIToggleButton setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (id)_layoutForString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  SUUIAttributedStringLayoutRequest *v9;
  SUUIAttributedStringLayout *v10;

  v4 = (objc_class *)MEMORY[0x24BDD1458];
  v5 = a3;
  v6 = [v4 alloc];
  -[SUUIToggleButton _titleAttributes](self, "_titleAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v7);

  v9 = -[SUUIAttributedStringLayoutRequest initWithAttributedString:]([SUUIAttributedStringLayoutRequest alloc], "initWithAttributedString:", v8);
  -[SUUIAttributedStringLayoutRequest setNumberOfLines:](v9, "setNumberOfLines:", 1);
  -[SUUIAttributedStringLayoutRequest setWantsBaselineOffset:](v9, "setWantsBaselineOffset:", 1);
  objc_msgSend(v8, "size");
  -[SUUIAttributedStringLayoutRequest setWidth:](v9, "setWidth:");
  v10 = -[SUUIAttributedStringLayout initWithLayoutRequest:]([SUUIAttributedStringLayout alloc], "initWithLayoutRequest:", v9);

  return v10;
}

- (id)_nonToggledLayout
{
  SUUIAttributedStringLayout *nonToggledLayout;
  void *v4;
  SUUIAttributedStringLayout *v5;
  SUUIAttributedStringLayout *v6;

  nonToggledLayout = self->_nonToggledLayout;
  if (!nonToggledLayout)
  {
    -[SUUIToggleButton nonToggledTitle](self, "nonToggledTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIToggleButton _layoutForString:](self, "_layoutForString:", v4);
    v5 = (SUUIAttributedStringLayout *)objc_claimAutoreleasedReturnValue();
    v6 = self->_nonToggledLayout;
    self->_nonToggledLayout = v5;

    nonToggledLayout = self->_nonToggledLayout;
  }
  return nonToggledLayout;
}

- (void)_sendDidAnimate
{
  SUUIToggleButtonDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "toggleButtonDidAnimateTransition:", self);

  }
}

- (void)_sendWillAnimate
{
  SUUIToggleButtonDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "toggleButtonWillAnimateTransition:", self);

  }
}

- (void)_showToggleState:(BOOL)a3
{
  int64_t toggleButtonType;
  _BOOL4 v5;
  void *v6;
  _BOOL4 toggled;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];

  toggleButtonType = self->_toggleButtonType;
  if (toggleButtonType == 1)
  {
    toggled = self->_toggled;
    -[SUUIStyledButton imageView](self, "imageView", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (toggled)
      -[SUUIToggleButton toggledContents](self, "toggledContents");
    else
      -[SUUIToggleButton nonToggledContents](self, "nonToggledContents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContents:", v8);

  }
  else if (!toggleButtonType)
  {
    v5 = a3;
    -[SUUIToggleButton window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIToggleButton _sendWillAnimate](self, "_sendWillAnimate");
    if (v6 && v5)
    {
      v11[4] = self;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __37__SUUIToggleButton__showToggleState___block_invoke;
      v12[3] = &unk_2511F47C0;
      v12[4] = self;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __37__SUUIToggleButton__showToggleState___block_invoke_2;
      v11[3] = &unk_2511F4908;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v12, v11, 0.4);
    }
    else
    {
      if (self->_toggled)
        -[SUUIToggleButton _toggledLayout](self, "_toggledLayout");
      else
        -[SUUIToggleButton _nonToggledLayout](self, "_nonToggledLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIStyledButton setTitleLayout:](self, "setTitleLayout:", v9);

      -[SUUIToggleButton _sendDidAnimate](self, "_sendDidAnimate");
    }
  }
}

void __37__SUUIToggleButton__showToggleState___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  id v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[696])
    objc_msgSend(*(id *)(a1 + 32), "_toggledLayout");
  else
    objc_msgSend(*(id *)(a1 + 32), "_nonToggledLayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTitleLayout:", v2);

}

uint64_t __37__SUUIToggleButton__showToggleState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDidAnimate");
}

- (id)_titleAttributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SUUIStyledButton titleLayout](self, "titleLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[SUUIStyledButton titleLayout](self, "titleLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributesAtIndex:effectiveRange:", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_element);
    objc_msgSend(WeakRetained, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    SUUIViewElementFontWithStyle(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 10.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "ikColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setLineBreakMode:", 4);
    v14 = objc_alloc(MEMORY[0x24BDBCE70]);
    v8 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", v7, *MEMORY[0x24BEBB360], v13, *MEMORY[0x24BEBB3A8], v11, *MEMORY[0x24BEBB368], 0);

  }
  return v8;
}

- (id)_toggledLayout
{
  SUUIAttributedStringLayout *toggledLayout;
  void *v4;
  SUUIAttributedStringLayout *v5;
  SUUIAttributedStringLayout *v6;

  toggledLayout = self->_toggledLayout;
  if (!toggledLayout)
  {
    -[SUUIToggleButton toggledTitle](self, "toggledTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIToggleButton _layoutForString:](self, "_layoutForString:", v4);
    v5 = (SUUIAttributedStringLayout *)objc_claimAutoreleasedReturnValue();
    v6 = self->_toggledLayout;
    self->_toggledLayout = v5;

    toggledLayout = self->_toggledLayout;
  }
  return toggledLayout;
}

- (void)itemStateCenter:(id)a3 itemStateChanged:(id)a4
{
  id v5;
  void *v6;
  int v7;
  _QWORD v8[4];
  id v9;
  SUUIToggleButton *v10;

  v5 = a4;
  objc_msgSend(v5, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", self->_toggleItemIdentifier);

  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__SUUIToggleButton_itemStateCenter_itemStateChanged___block_invoke;
    v8[3] = &unk_2511F46D0;
    v9 = v5;
    v10 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
}

void __53__SUUIToggleButton_itemStateCenter_itemStateChanged___block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  unsigned __int8 *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "toggled") & 0x80000000) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "toggled");
    v3 = *(unsigned __int8 **)(a1 + 40);
    if (v3[696] != v2)
      objc_msgSend(v3, "setToggled:", objc_msgSend(*(id *)(a1 + 32), "toggled") == 1);
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v4 + 744) == 1 && *(_BYTE *)(v4 + 624))
  {
    objc_msgSend(*(id *)(a1 + 32), "toggledString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "toggledString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 680));

      if ((v6 & 1) != 0)
        return;
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "toggledString");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setButtonTitleText:");
    }

  }
}

- (BOOL)autoIncrement
{
  return self->_autoIncrement;
}

- (void)setAutoIncrement:(BOOL)a3
{
  self->_autoIncrement = a3;
}

- (int64_t)autoIncrementCount
{
  return self->_autoIncrementCount;
}

- (void)setAutoIncrementCount:(int64_t)a3
{
  self->_autoIncrementCount = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (SUUIButtonViewElement)element
{
  return (SUUIButtonViewElement *)objc_loadWeakRetained((id *)&self->_element);
}

- (void)setElement:(id)a3
{
  objc_storeWeak((id *)&self->_element, a3);
}

- (NSString)toggleItemIdentifier
{
  return self->_toggleItemIdentifier;
}

- (void)setToggleItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_toggleItemIdentifier, a3);
}

- (BOOL)isToggled
{
  return self->_toggled;
}

- (SUUIToggleButtonDelegate)delegate
{
  return (SUUIToggleButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)nonToggledTitle
{
  return self->_nonToggledTitle;
}

- (void)setNonToggledTitle:(id)a3
{
  objc_storeStrong((id *)&self->_nonToggledTitle, a3);
}

- (NSString)toggledTitle
{
  return self->_toggledTitle;
}

- (void)setToggledTitle:(id)a3
{
  objc_storeStrong((id *)&self->_toggledTitle, a3);
}

- (id)nonToggledContents
{
  return self->_nonToggledContents;
}

- (void)setNonToggledContents:(id)a3
{
  objc_storeStrong(&self->_nonToggledContents, a3);
}

- (id)toggledContents
{
  return self->_toggledContents;
}

- (void)setToggledContents:(id)a3
{
  objc_storeStrong(&self->_toggledContents, a3);
}

- (int64_t)toggleButtonType
{
  return self->_toggleButtonType;
}

- (void)setToggleButtonType:(int64_t)a3
{
  self->_toggleButtonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_toggledContents, 0);
  objc_storeStrong(&self->_nonToggledContents, 0);
  objc_storeStrong((id *)&self->_toggledTitle, 0);
  objc_storeStrong((id *)&self->_nonToggledTitle, 0);
  objc_storeStrong((id *)&self->_toggleItemIdentifier, 0);
  objc_storeStrong((id *)&self->_toggledLayout, 0);
  objc_storeStrong((id *)&self->_titleToggleString, 0);
  objc_storeStrong((id *)&self->_nonToggledLayout, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_element);
}

@end
