@implementation MFComposeFromView

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__MFComposeFromView_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (id)log_log_0;
}

void __24__MFComposeFromView_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.messageui", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

- (MFComposeFromView)initWithFrame:(CGRect)a3
{
  MFComposeFromView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFComposeFromView;
  v3 = -[MFComposeFromView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FROM"), &stru_1E5A6A588, CFSTR("Main"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeFromView setLabel:](v3, "setLabel:", v5);

  }
  return v3;
}

- (MFPopupButton)popupButton
{
  MFPopupButton *popupButton;
  MFPopupButton *v4;
  MFPopupButton *v5;
  MFPopupButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  popupButton = self->_popupButton;
  if (!popupButton)
  {
    v4 = [MFPopupButton alloc];
    v5 = -[MFPopupButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_popupButton;
    self->_popupButton = v5;

    -[MFPopupButton setOpaque:](self->_popupButton, "setOpaque:", 0);
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFPopupButton setFont:](self->_popupButton, "setFont:", v7);

    -[MFPopupButton setDelegate:](self->_popupButton, "setDelegate:", self);
    -[MFPopupButton setTranslatesAutoresizingMaskIntoConstraints:](self->_popupButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFComposeFromView addSubview:](self, "addSubview:", self->_popupButton);
    -[UIView mf_pinToView:layoutMarginEdges:flexibleEdges:](self->_popupButton, "mf_pinToView:layoutMarginEdges:flexibleEdges:", self, 8, 2);
    v8 = (void *)MEMORY[0x1E0CB3718];
    -[MFPopupButton leadingAnchor](self->_popupButton, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeFromView labelView](self, "labelView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    -[MFPopupButton label](self->_popupButton, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstBaselineAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeFromView labelView](self, "labelView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstBaselineAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateConstraints:", v15);

    popupButton = self->_popupButton;
  }
  return popupButton;
}

- (id)_buttonItemWithAddress:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isEqualToString:", v5);

    if (v6)
      -[MFComposeFromView _hideMyEmailButtonItemWithAddress:]((uint64_t)a1, v3);
    else
      +[MFPopupButtonItem itemWithTitle:style:](MFPopupButtonItem, "itemWithTitle:style:", v3, MFAddressHasSafeDomain(v3) ^ 1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (id)_hideMyEmailButtonItemWithAddress:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_DESCRIPTION"), &stru_1E5A6A588, CFSTR("Main"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPopupButtonItem itemWithTitle:popupTitle:subtitle:style:](MFPopupButtonItem, "itemWithTitle:popupTitle:subtitle:style:", v3, v5, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)showLoadingState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[MFPopupButton label](self->_popupButton, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "startAnimating");

    -[MFPopupButton disableMenu](self->_popupButton, "disableMenu");
  }
  else
  {
    objc_msgSend(v5, "stopAnimating");

    -[MFPopupButton enableMenu](self->_popupButton, "enableMenu");
  }
}

- (void)refreshPreferredContentSize
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFComposeFromView;
  -[MFComposeFromView refreshPreferredContentSize](&v6, sel_refreshPreferredContentSize);
  objc_msgSend(MEMORY[0x1E0D13628], "sharedFontMetricCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureCacheIsValid");

  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeFromView popupButton](self, "popupButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[MFComposeFromView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelectedAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    -[MFComposeFromView _buttonItemWithAddress:](self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeFromView popupButton](self, "popupButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedItem:", v5);

  }
  else
  {
    -[MFComposeFromView popupButton](self, "popupButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectedItem:", 0);
  }

}

- (void)setSelectedAddressToHME:(id)a3
{
  void *v4;
  id v5;

  -[MFComposeFromView _hideMyEmailButtonItemWithAddress:]((uint64_t)self, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFComposeFromView popupButton](self, "popupButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedItem:", v5);

}

- (ECEmailAddressConvertible)selectedAddress
{
  void *v2;
  void *v3;
  void *v4;

  -[MFComposeFromView popupButton](self, "popupButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ECEmailAddressConvertible *)v4;
}

- (void)setAvailableAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v4 = (id)MEMORY[0x1E0C9AA60];
  if (a3)
    v4 = a3;
  v8[1] = 3221225472;
  v8[2] = __43__MFComposeFromView_setAvailableAddresses___block_invoke;
  v8[3] = &unk_1E5A65C00;
  v8[4] = self;
  v7 = v4;
  v8[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v7, "ef_map:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeFromView popupButton](self, "popupButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v5);

}

id __43__MFComposeFromView_setAvailableAddresses___block_invoke(uint64_t a1, void *a2)
{
  -[MFComposeFromView _buttonItemWithAddress:](*(void **)(a1 + 32), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)availableAddresses
{
  void *v2;
  void *v3;
  void *v4;

  -[MFComposeFromView popupButton](self, "popupButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_mapSelector:", sel_title);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setDeferredAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v4 = (id)MEMORY[0x1E0C9AA60];
  if (a3)
    v4 = a3;
  v8[1] = 3221225472;
  v8[2] = __42__MFComposeFromView_setDeferredAddresses___block_invoke;
  v8[3] = &unk_1E5A65C00;
  v8[4] = self;
  v7 = v4;
  v8[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v7, "ef_map:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeFromView popupButton](self, "popupButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeferredItems:", v5);

}

id __42__MFComposeFromView_setDeferredAddresses___block_invoke(uint64_t a1, void *a2)
{
  -[MFComposeFromView _buttonItemWithAddress:](*(void **)(a1 + 32), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)deferredAddresses
{
  void *v2;
  void *v3;
  void *v4;

  -[MFComposeFromView popupButton](self, "popupButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deferredItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_mapSelector:", sel_title);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)didMoveToWindow
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFComposeFromView;
  -[MFComposeFromView didMoveToWindow](&v3, sel_didMoveToWindow);
  objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isAvailable:", &__block_literal_global_6);

}

- (id)menuForPopupButton:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__MFComposeFromView_menuForPopupButton___block_invoke;
  v11[3] = &unk_1E5A65C70;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36F8], "elementWithProvider:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __40__MFComposeFromView_menuForPopupButton___block_invoke_3;
  v10[3] = &unk_1E5A65C70;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36F8], "elementWithProvider:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E5A6A588, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __40__MFComposeFromView_menuForPopupButton___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, void *);
  _QWORD v7[5];

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "popupButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MFComposeFromView_menuForPopupButton___block_invoke_2;
  v7[3] = &unk_1E5A65C48;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "ef_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v5);
}

id __40__MFComposeFromView_menuForPopupButton___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "popupButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __40__MFComposeFromView_menuForPopupButton___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__MFComposeFromView_menuForPopupButton___block_invoke_4;
  v6[3] = &unk_1E5A65C98;
  v6[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "isAvailable:", v6);

}

void __40__MFComposeFromView_menuForPopupButton___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v5 = a3;
  if (v5)
  {
    +[MFComposeFromView log](MFComposeFromView, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __40__MFComposeFromView_menuForPopupButton___block_invoke_4_cold_1((uint64_t)v5, v6);

    goto LABEL_7;
  }
  if (!a2)
  {
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "popupButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deferredItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__MFComposeFromView_menuForPopupButton___block_invoke_38;
  v10[3] = &unk_1E5A65C48;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "ef_map:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_8:

}

id __40__MFComposeFromView_menuForPopupButton___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "popupButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)popupButton:(id)a3 didSelectItem:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[MFComposeFromView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popupTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "composeFromView:didSelectAddress:", self, v6);

}

- (void)popupButtonWillPresentMenu:(id)a3 animator:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  if (a4)
  {
    -[MFComposeFromView backgroundColor](self, "backgroundColor", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeFromView setBackgroundColor:](self, "setBackgroundColor:", v6);

    v7 = (void *)MEMORY[0x1E0DC3F10];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__MFComposeFromView_popupButtonWillPresentMenu_animator___block_invoke;
    v9[3] = &unk_1E5A65430;
    v9[4] = self;
    v8 = v5;
    v10 = v8;
    objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0x20000, v9, 0, 0.76, 0.0);

  }
}

uint64_t __57__MFComposeFromView_popupButtonWillPresentMenu_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (void)setPopupButton:(id)a3
{
  objc_storeStrong((id *)&self->_popupButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popupButton, 0);
}

void __40__MFComposeFromView_menuForPopupButton___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB96A000, a2, OS_LOG_TYPE_ERROR, "Unable to determine if user has iCloud+: %@", (uint8_t *)&v2, 0xCu);
}

@end
