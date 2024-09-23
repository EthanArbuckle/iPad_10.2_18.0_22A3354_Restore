@implementation TIAboutKeyboardPrivacyController

- (TIAboutKeyboardPrivacyController)initWithGroupSpecifier:(id)a3 asHeader:(BOOL)a4 inListController:(id)a5
{
  TIAboutKeyboardPrivacyController *v8;
  TIAboutKeyboardPrivacyController *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TIAboutKeyboardPrivacyController;
  v8 = -[TIAboutKeyboardPrivacyController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_listController = (PSListController *)a5;
    v8->_asHeader = a4;
    -[TIAboutKeyboardPrivacyController setSpecifier:](v8, "setSpecifier:", a3);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextView removeFromSuperview](self->_infoTextView, "removeFromSuperview");

  v3.receiver = self;
  v3.super_class = (Class)TIAboutKeyboardPrivacyController;
  -[TIAboutKeyboardPrivacyController dealloc](&v3, sel_dealloc);
}

- (void)setSpecifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t *v8;
  uint64_t v9;
  PSSpecifier *v10;

  self->_specifier = (PSSpecifier *)a3;
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("APP_KEYBOARDS_INFO"), &stru_24E732B90, CFSTR("Keyboard"));
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("APP_KEYBOARDS_INFO_LINK"), &stru_24E732B90, CFSTR("Keyboard"));
  v7 = -[TIAboutKeyboardPrivacyController asHeader](self, "asHeader");
  v8 = (uint64_t *)MEMORY[0x24BE75AA8];
  if (!v7)
    v8 = (uint64_t *)MEMORY[0x24BE75A68];
  v9 = *v8;
  v10 = -[TIAboutKeyboardPrivacyController specifier](self, "specifier");
  -[PSSpecifier setProperty:forKey:](v10, "setProperty:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v5, v6), v9);
}

- (void)addPrivacyLinkViewIfNecessaryToHeaderView:(id)a3 forSection:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MaxX;
  double v27;
  CGRect v28;

  if (-[TIAboutKeyboardPrivacyController specifier](self, "specifier"))
  {
    v7 = (void *)-[PSListController indexPathForSpecifier:](-[TIAboutKeyboardPrivacyController listController](self, "listController"), "indexPathForSpecifier:", -[TIAboutKeyboardPrivacyController specifier](self, "specifier"));
    v8 = -[TIAboutKeyboardPrivacyController asHeader](self, "asHeader")
       ? objc_msgSend(a3, "detailTextLabel")
       : objc_msgSend(a3, "textLabel");
    v9 = (void *)v8;
    if (objc_msgSend(v7, "section") == a4)
    {
      v10 = -[UITextView superview](self->_infoTextView, "superview");
      if (v10 != objc_msgSend(a3, "contentView"))
      {
        objc_msgSend(a3, "layoutIfNeeded");
        objc_msgSend(v9, "setHidden:", 1);
        -[UITextView removeFromSuperview](self->_infoTextView, "removeFromSuperview");

        v11 = objc_alloc(MEMORY[0x24BDF6EF8]);
        objc_msgSend(v9, "frame");
        self->_infoTextView = (UITextView *)objc_msgSend(v11, "initWithFrame:");
        -[UITextView setBackgroundColor:](self->_infoTextView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
        -[UITextView setShowsVerticalScrollIndicator:](self->_infoTextView, "setShowsVerticalScrollIndicator:", 0);
        -[UITextView setEditable:](self->_infoTextView, "setEditable:", 0);
        -[UITextView setSelectable:](self->_infoTextView, "setSelectable:", 1);
        -[UITextView setScrollEnabled:](self->_infoTextView, "setScrollEnabled:", 0);
        -[UITextView setTextContainerInset:](self->_infoTextView, "setTextContainerInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
        -[NSTextContainer setLineFragmentPadding:](-[UITextView textContainer](self->_infoTextView, "textContainer"), "setLineFragmentPadding:", 0.0);
        -[UITextView setContentInsetAdjustmentBehavior:](self->_infoTextView, "setContentInsetAdjustmentBehavior:", 3);
        objc_msgSend((id)objc_msgSend(a3, "contentView"), "addSubview:", self->_infoTextView);
        v12 = (void *)objc_msgSend((id)objc_msgSend(v9, "attributedText"), "mutableCopy");
        v13 = (void *)objc_msgSend(v9, "text");
        v14 = objc_msgSend(v13, "rangeOfString:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("APP_KEYBOARDS_INFO_LINK"), &stru_24E732B90, CFSTR("Keyboard")));
        v16 = v15;
        objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x24BDF6600], objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor"), v14, v15);
        objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x24BDF6618], objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24E732B90), v14, v16);
        objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x24BDF66D8], MEMORY[0x24BDBD1C0], v14, v16);
        objc_msgSend(v12, "removeAttribute:range:", *MEMORY[0x24BDF6628], 0, objc_msgSend(v12, "length"));
        -[UITextView setAttributedText:](self->_infoTextView, "setAttributedText:", v12);
        -[UITextView setDelegate:](self->_infoTextView, "setDelegate:", self);
        objc_msgSend(v9, "frame");
        v18 = v17;
        v20 = v19;
        -[UITextView sizeThatFits:](self->_infoTextView, "sizeThatFits:", v21, 1.79769313e308);
        v23 = v22;
        v25 = v24;
        if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection") == 1)
        {
          objc_msgSend((id)objc_msgSend(a3, "textLabel"), "frame");
          MaxX = CGRectGetMaxX(v28);
          -[UITextView frame](self->_infoTextView, "frame");
          v18 = MaxX - v27;
        }
        -[UITextView setFrame:](self->_infoTextView, "setFrame:", v18, v20, v23, v25);
      }
    }
  }
}

- (void)aboutDonePressed
{
  -[PSListController dismissViewControllerAnimated:completion:](-[TIAboutKeyboardPrivacyController listController](self, "listController"), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  PSSpecifier *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v7 = -[TIAboutKeyboardPrivacyController specifier](self, "specifier", a3, a4, a5.location, a5.length, a6);
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDF6F98]);
    objc_msgSend(v8, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ABOUT_APP_KEYBOARDS_TITLE"), &stru_24E732B90, CFSTR("Keyboard")));
    v9 = (void *)objc_msgSend(v8, "navigationItem");
    objc_msgSend(v9, "setRightBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_aboutDonePressed));
    v10 = objc_alloc(MEMORY[0x24BDF6EF8]);
    v11 = (id)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v11, "setText:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ABOUT_APP_KEYBOARDS_INFO_TEXT"), &stru_24E732B90, CFSTR("Keyboard")));
    objc_msgSend(v11, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]));
    objc_msgSend(v11, "setEditable:", 0);
    objc_msgSend(v11, "setContentInsetAdjustmentBehavior:", 3);
    objc_msgSend(v8, "setView:", v11);
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v8);
    objc_msgSend(v12, "setModalPresentationStyle:", 2);
    -[PSListController presentViewController:animated:completion:](-[TIAboutKeyboardPrivacyController listController](self, "listController"), "presentViewController:animated:completion:", v12, 1, 0);
  }
  return v7 == 0;
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (PSListController)listController
{
  return self->_listController;
}

- (void)setListController:(id)a3
{
  self->_listController = (PSListController *)a3;
}

- (BOOL)asHeader
{
  return self->_asHeader;
}

- (void)setAsHeader:(BOOL)a3
{
  self->_asHeader = a3;
}

@end
