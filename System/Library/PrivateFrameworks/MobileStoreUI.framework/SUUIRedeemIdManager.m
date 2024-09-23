@implementation SUUIRedeemIdManager

- (SUUIRedeemIdManager)initWithClientContext:(id)a3
{
  id v5;
  SUUIRedeemIdManager *v6;
  SUUIRedeemIdManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIRedeemIdManager;
  v6 = -[SUUIRedeemIdManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientContext, a3);

  return v7;
}

- (SUUIPinnedFooterView)pinnedFooterView
{
  SUUIPinnedFooterView *pinnedFooterView;
  SUUIPinnedFooterView *v4;
  SUUIPinnedFooterView *v5;
  SUUIPinnedFooterView *v6;
  SUUIPinnedFooterView *v7;
  void *v8;
  SUUIPinnedFooterView *v9;
  void *v10;
  double v11;

  pinnedFooterView = self->_pinnedFooterView;
  if (!pinnedFooterView)
  {
    v4 = [SUUIPinnedFooterView alloc];
    v5 = -[SUUIPinnedFooterView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_pinnedFooterView;
    self->_pinnedFooterView = v5;

    v7 = self->_pinnedFooterView;
    -[SUUIRedeemIdManager _disclosureAttributedString](self, "_disclosureAttributedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPinnedFooterView setAttributedText:](v7, "setAttributedText:", v8);

    v9 = self->_pinnedFooterView;
    -[SUUIRedeemIdManager tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "separatorInset");
    -[SUUIPinnedFooterView setHorizontalPadding:](v9, "setHorizontalPadding:", v11);

    pinnedFooterView = self->_pinnedFooterView;
  }
  return pinnedFooterView;
}

- (void)setTableView:(id)a3
{
  UITableView *v5;
  void *v6;
  UITableView *v7;

  v5 = (UITableView *)a3;
  if (self->_tableView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_tableView, a3);
    -[SUUIRedeemIdManager tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("redeemIdCell"));

    v5 = v7;
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SUUIRedeemIdManager activeIndexPath](self, "activeIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  -[SUUIRedeemIdManager setActiveIndexPath:](self, "setActiveIndexPath:", v8);
  objc_msgSend(v13, "cellForRowAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutocapitalizationType:", -[SUUIRedeemIdManager _autoCapitalizationTypeForIndexPath:](self, "_autoCapitalizationTypeForIndexPath:", v8));

  objc_msgSend(v9, "becomeFirstResponder");
  if (v7 && (objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
  {
    objc_msgSend(v13, "cellForRowAtIndexPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resignFirstResponder");

  }
  -[SUUIRedeemIdManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "redeemIdManager:movedToRowAtIndexPath:", self, v8);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a3;
  if (a4 == 3)
  {
    -[SUUIRedeemIdManager _heightForDisclosureFooter](self, "_heightForDisclosureFooter");
    v7 = v8;
  }
  else if (a4 == 2)
  {
    v7 = 50.0;
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 != 3)
    return 0;
  -[SUUIRedeemIdManager pinnedFooterView](self, "pinnedFooterView", a3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[SUUIRedeemIdManager _numberOfRowsInSection:](self, "_numberOfRowsInSection:", a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;

  v6 = a3;
  switch(a4)
  {
    case 2:
      -[SUUIRedeemIdManager clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = CFSTR("REDEEM_NATIONAL_ID_SECTION_NATIONAL_ID");
        goto LABEL_10;
      }
      v11 = CFSTR("REDEEM_NATIONAL_ID_SECTION_NATIONAL_ID");
LABEL_15:
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v11, 0, CFSTR("Redeem"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 1:
      -[SUUIRedeemIdManager clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = CFSTR("REDEEM_NATIONAL_ID_SECTION_PHONE");
        goto LABEL_10;
      }
      v11 = CFSTR("REDEEM_NATIONAL_ID_SECTION_PHONE");
      goto LABEL_15;
    case 0:
      -[SUUIRedeemIdManager clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = CFSTR("REDEEM_NATIONAL_ID_SECTION_NAME");
LABEL_10:
        objc_msgSend(v7, "localizedStringForKey:inTable:", v8, CFSTR("Redeem"));
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v10 = (__CFString *)v9;

        goto LABEL_17;
      }
      v11 = CFSTR("REDEEM_NATIONAL_ID_SECTION_NAME");
      goto LABEL_15;
  }
  v10 = &stru_2511FF0C8;
LABEL_17:

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  if (a4 == 2)
  {
    -[SUUIRedeemIdManager clientContext](self, "clientContext", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("REDEEM_NATIONAL_ID_DESCRIPTION"), CFSTR("Redeem"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_NATIONAL_ID_DESCRIPTION"), 0, CFSTR("Redeem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("redeemIdCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    -[SUUIRedeemIdManager _placeholderTextForIndexPath:](self, "_placeholderTextForIndexPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaceholderText:", v11);

  }
  objc_msgSend(v7, "setKeyboardType:", -[SUUIRedeemIdManager _keyboardTypeForIndexPath:](self, "_keyboardTypeForIndexPath:", v6));
  objc_msgSend(v7, "setReturnKeyType:", -[SUUIRedeemIdManager _returnKeyTypeForIndexPath:](self, "_returnKeyTypeForIndexPath:", v6));
  objc_msgSend(v7, "setAutoCapitalizationType:", -[SUUIRedeemIdManager _autoCapitalizationTypeForIndexPath:](self, "_autoCapitalizationTypeForIndexPath:", v6));
  objc_msgSend(v7, "setDelegate:", self);

  return v7;
}

- (void)redeemIdCell:(id)a3 didReturnWithText:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  -[SUUIRedeemIdManager activeIndexPath](self, "activeIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemIdManager _nextIndexPath:](self, "_nextIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemIdManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "redeemIdManager:didReturnText:forCellAtIndexPath:", self, v14, v5);

  -[SUUIRedeemIdManager setActiveIndexPath:](self, "setActiveIndexPath:", v6);
  if (v6)
  {
    -[SUUIRedeemIdManager tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "becomeFirstResponder");
  }
  -[SUUIRedeemIdManager tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cellForRowAtIndexPath:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "resignFirstResponder");
  if (objc_msgSend(v14, "length"))
  {
    -[SUUIRedeemIdManager _placeholderTextForIndexPath:](self, "_placeholderTextForIndexPath:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPlaceholderText:", v12);

  }
  -[SUUIRedeemIdManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "redeemIdManager:movedToRowAtIndexPath:", self, v6);

}

- (void)redeemIdCell:(id)a3 didChangeToText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[SUUIRedeemIdManager tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIRedeemIdManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "redeemIdManager:didChangeToText:forCellAtIndexPath:", self, v6, v10);

}

- (void)setFooterHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SUUIRedeemIdManager pinnedFooterView](self, "pinnedFooterView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)dismissActiveCell
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SUUIRedeemIdManager activeIndexPath](self, "activeIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUUIRedeemIdManager tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemIdManager activeIndexPath](self, "activeIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForRowAtIndexPath:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "resignFirstResponder");
  }
}

- (id)_regulationsLinkString
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIRedeemIdManager clientContext](self, "clientContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "localizedStringForKey:inTable:", CFSTR("REDEEM_NATIONAL_ID_DISCLOSURE_LINK_REGULATIONS"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_NATIONAL_ID_DISCLOSURE_LINK_REGULATIONS"), 0, CFSTR("Redeem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_pcLinkString
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIRedeemIdManager clientContext](self, "clientContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "localizedStringForKey:inTable:", CFSTR("REDEEM_NATIONAL_ID_DISCLOSURE_LINK_PC"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_NATIONAL_ID_DISCLOSURE_LINK_PC"), 0, CFSTR("Redeem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_placeholderTextForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 == 2 || v5 == 1)
  {
    -[SUUIRedeemIdManager clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = CFSTR("REDEEM_NATIONAL_ID_PLACEHOLDER_REQUIRED");
      goto LABEL_10;
    }
    v11 = CFSTR("REDEEM_NATIONAL_ID_PLACEHOLDER_REQUIRED");
LABEL_13:
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v11, 0, CFSTR("Redeem"));
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (!v5)
  {
    v6 = objc_msgSend(v4, "row");
    if (v6 == 1)
    {
      -[SUUIRedeemIdManager clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = CFSTR("REDEEM_NATIONAL_ID_PLACEHOLDER_FIRST_NAME");
        goto LABEL_10;
      }
      v11 = CFSTR("REDEEM_NATIONAL_ID_PLACEHOLDER_FIRST_NAME");
      goto LABEL_13;
    }
    if (!v6)
    {
      -[SUUIRedeemIdManager clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = CFSTR("REDEEM_NATIONAL_ID_PLACEHOLDER_LAST_NAME");
LABEL_10:
        objc_msgSend(v7, "localizedStringForKey:inTable:", v8, CFSTR("Redeem"));
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v10 = (__CFString *)v9;

        goto LABEL_15;
      }
      v11 = CFSTR("REDEEM_NATIONAL_ID_PLACEHOLDER_LAST_NAME");
      goto LABEL_13;
    }
  }
  v10 = &stru_2511FF0C8;
LABEL_15:

  return v10;
}

- (id)_disclosureAttributedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;

  -[SUUIRedeemIdManager clientContext](self, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("REDEEM_NATIONAL_ID_DISCLOSURE"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_NATIONAL_ID_DISCLOSURE"), 0, CFSTR("Redeem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIRedeemIdManager _pcLinkString](self, "_pcLinkString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemIdManager _regulationsLinkString](self, "_regulationsLinkString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@%@"), 0, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeOfString:options:", v6, 4);
  v23 = v10;
  v24 = v9;
  v11 = objc_msgSend(v8, "rangeOfString:options:", v7, 4);
  v13 = v12;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v8);
  v15 = objc_alloc_init(MEMORY[0x24BEB1FF0]);
  v26 = 0;
  objc_msgSend(v15, "valueForKey:error:", CFSTR("redeemPartnerTerms"), &v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v26;
  v18 = v17;
  if (v17 || !v16)
    NSLog(CFSTR("Unable to load national ID url string (service laws and regulations) from bag. Error: %@"), v17);
  else
    objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x24BEBB388], v16, v11, v13);
  v25 = v18;
  objc_msgSend(v15, "valueForKey:error:", CFSTR("redeemPartnerInfo"), &v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v25;

  if (v20 || !v19)
    NSLog(CFSTR("Unable to load national ID url string (P&C) from bag. Error: %@"), v20);
  else
    objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x24BEBB388], v19, v24, v23);
  v21 = (void *)objc_msgSend(v14, "copy");

  return v21;
}

- (id)_nextIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;

  v4 = a3;
  -[SUUIRedeemIdManager tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfRowsInSection:", objc_msgSend(v4, "section"));

  -[SUUIRedeemIdManager tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfSections");

  if (objc_msgSend(v4, "row") >= (unint64_t)(v6 - 1))
  {
    -[SUUIRedeemIdManager activeIndexPath](self, "activeIndexPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "section") + 1;

    if (v15 >= v8 - 1)
    {
      v17 = 0;
      goto LABEL_7;
    }
    v16 = (void *)MEMORY[0x24BDD15D8];
    v11 = objc_msgSend(v4, "section") + 1;
    v12 = v16;
    v13 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD15D8];
    v10 = objc_msgSend(v4, "row") + 1;
    v11 = objc_msgSend(v4, "section");
    v12 = v9;
    v13 = v10;
  }
  objc_msgSend(v12, "indexPathForRow:inSection:", v13, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v17;
}

- (double)_heightForDisclosureFooter
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarFrame");
  v5 = v4;

  -[SUUIRedeemIdManager tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7 - v5;

  -[SUUIRedeemIdManager _tableViewNonFooterContentHeight](self, "_tableViewNonFooterContentHeight");
  v10 = v9 + 150.0;
  v11 = v8 - v9;
  if (v10 <= v8)
    v12 = v11;
  else
    v12 = 150.0;
  -[SUUIRedeemIdManager tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInset");
  v15 = v12 - v14;

  return v15;
}

- (double)_tableViewNonFooterContentHeight
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[SUUIRedeemIdManager tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (!v4)
    return 0.0;
  v5 = 0;
  v6 = 0.0;
  do
  {
    if (v5 != 3)
    {
      -[SUUIRedeemIdManager tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rectForSection:", v5);
      v9 = v8;

      v6 = v6 + v9;
    }
    ++v5;
  }
  while (v4 != v5);
  return v6;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return qword_241EFD0F8[a3];
}

- (int64_t)_keyboardTypeForIndexPath:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "section");
  if (v3 > 2)
    return 0;
  else
    return qword_241EFD118[v3];
}

- (int64_t)_returnKeyTypeForIndexPath:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "section");
  if (v3 > 2)
    return 0;
  else
    return qword_241EFD130[v3];
}

- (int64_t)_autoCapitalizationTypeForIndexPath:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "section");
  if (v3 > 2)
    return 0;
  else
    return qword_241EFD148[v3];
}

- (SUUIRedeemIdManagerDelegate)delegate
{
  return (SUUIRedeemIdManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NSIndexPath)activeIndexPath
{
  return self->_activeIndexPath;
}

- (void)setActiveIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_activeIndexPath, a3);
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (void)setPinnedFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedFooterView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedFooterView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_activeIndexPath, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
