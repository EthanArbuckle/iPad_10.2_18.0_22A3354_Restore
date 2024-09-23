@implementation SUUIGiftAddressingSection

- (SUUIGiftAddressingSection)initWithGiftConfiguration:(id)a3
{
  SUUIGiftAddressingSection *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftAddressingSection;
  result = -[SUUIGiftTableViewSection initWithGiftConfiguration:](&v4, sel_initWithGiftConfiguration_, a3);
  if (result)
    result->_textViewCellHeight = 46.0;
  return result;
}

- (void)beginEditingMessageForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((-[UITextView isFirstResponder](self->_messagingTextView, "isFirstResponder") & 1) == 0)
  {
    self->_textViewCellHeight = 137.0;
    v9[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v8, 5);

    -[UITextView setEditable:](self->_messagingTextView, "setEditable:", 1);
    -[UITextView setUserInteractionEnabled:](self->_messagingTextView, "setUserInteractionEnabled:", 1);
    -[UITextView becomeFirstResponder](self->_messagingTextView, "becomeFirstResponder");
  }

}

- (void)endEditingMessageForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  UITextView *messagingTextView;
  id v8;
  void *v9;
  uint64_t v10;
  UITextView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  messagingTextView = self->_messagingTextView;
  v8 = a3;
  -[UITextView text](messagingTextView, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = self->_messagingTextView;
    -[UITextView bounds](v11, "bounds");
    -[UITextView sizeThatFits:](v11, "sizeThatFits:", v12, v13);
    v15 = v14 + 46.0 + 10.0;
  }
  else
  {
    v15 = 46.0;
  }
  self->_textViewCellHeight = v15;
  v17[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadRowsAtIndexPaths:withRowAnimation:", v16, 5);

  -[UITextView setEditable:](self->_messagingTextView, "setEditable:", 0);
  -[UITextView setUserInteractionEnabled:](self->_messagingTextView, "setUserInteractionEnabled:", 0);

}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double footerHeight;
  SUUIGiftFooterLabelTableViewCell *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;

  v5 = objc_msgSend(a4, "row", a3);
  if (v5 == 2)
    return self->_textViewCellHeight;
  if (v5 == 1)
    return 46.0;
  if (v5)
  {
    footerHeight = self->_footerHeight;
    if (footerHeight < 0.00000011920929)
    {
      v12 = -[SUUIGiftFooterLabelTableViewCell initWithStyle:reuseIdentifier:]([SUUIGiftFooterLabelTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
      -[SUUIGiftAddressingSection _footerString](self, "_footerString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIGiftFooterLabelTableViewCell setFooterLabel:](v12, "setFooterLabel:", v13);

      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "userInterfaceIdiom");

      v16 = 320.0;
      if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v16 = 540.0;
      -[SUUIGiftFooterLabelTableViewCell sizeThatFits:](v12, "sizeThatFits:", v16, 1.79769313e308);
      self->_footerHeight = v17;

      return self->_footerHeight;
    }
  }
  else
  {
    -[SUUIGiftAddressingSection _recipientTableViewCell](self, "_recipientTableViewCell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v9 = 320.0;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v9 = 540.0;
    objc_msgSend(v6, "sizeThatFits:", v9, 1.79769313e308);
    if (v10 >= 46.0)
      footerHeight = v10;
    else
      footerHeight = 46.0;

  }
  return footerHeight;
}

- (int64_t)numberOfRowsInSection
{
  return 4;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  SUUIGiftFooterLabelTableViewCell *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  switch(v8)
  {
    case 2:
      -[SUUIGiftAddressingSection messageCell](self, "messageCell");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[SUUIGiftAddressingSection _textFieldTableViewCellForTableView:indexPath:](self, "_textFieldTableViewCellForTableView:indexPath:", v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      -[SUUIGiftAddressingSection _recipientTableViewCell](self, "_recipientTableViewCell");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = (SUUIGiftFooterLabelTableViewCell *)v9;
      goto LABEL_11;
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("GF"));
  v10 = (SUUIGiftFooterLabelTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = -[SUUIGiftFooterLabelTableViewCell initWithStyle:reuseIdentifier:]([SUUIGiftFooterLabelTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("GF"));
    -[SUUIGiftFooterLabelTableViewCell setSelectionStyle:](v10, "setSelectionStyle:", 0);
  }
  -[SUUIGiftAddressingSection _footerString](self, "_footerString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftFooterLabelTableViewCell setFooterLabel:](v10, "setFooterLabel:", v11);

LABEL_11:
  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (objc_msgSend(a5, "row") == 3)
  {
    objc_msgSend(v9, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
}

- (id)_attributedPlaceholderWithString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x24BDD1688];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);
  v6 = objc_msgSend(v4, "length");

  v7 = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:value:range:", v7, v8, 0, v6);

  v9 = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "placeholderTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:value:range:", v9, v10, 0, v6);

  v11 = *MEMORY[0x24BEBB320];
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:value:range:", v11, v12, 0, v6);

  return v5;
}

- (id)_footerString
{
  NSString *footerString;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;

  footerString = self->_footerString;
  if (!footerString)
  {
    -[SUUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("GIFTING_STOREFRONT_WARNING"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_STOREFRONT_WARNING"), 0, CFSTR("Gifting"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "storeFrontName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_footerString;
    self->_footerString = v10;

    footerString = self->_footerString;
  }
  return footerString;
}

- (id)_recipientTableViewCell
{
  SUUIGiftRecipientTableViewCell *recipientTableViewCell;
  void *v4;
  void *v5;
  SUUIGiftRecipientTableViewCell *v6;
  SUUIGiftRecipientTableViewCell *v7;
  SUUIGiftRecipientTableViewCell *v8;
  void *v9;
  void *v10;
  SUUIGiftRecipientTableViewCell *v11;
  void *v12;
  SUUIGiftRecipientTableViewCell *v13;
  void *v14;

  recipientTableViewCell = self->_recipientTableViewCell;
  if (!recipientTableViewCell)
  {
    -[SUUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[SUUIGiftRecipientTableViewCell initWithStyle:reuseIdentifier:]([SUUIGiftRecipientTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("GRF"));
    v7 = self->_recipientTableViewCell;
    self->_recipientTableViewCell = v6;

    v8 = self->_recipientTableViewCell;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("GIFTING_PLACEHOLDER_EMAIL"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_PLACEHOLDER_EMAIL"), 0, CFSTR("Gifting"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftAddressingSection _attributedPlaceholderWithString:](self, "_attributedPlaceholderWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftRecipientTableViewCell setAttributedPlaceholder:](v8, "setAttributedPlaceholder:", v10);

    v11 = self->_recipientTableViewCell;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("GIFTING_FIELD_LABEL_RECIPIENT"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_FIELD_LABEL_RECIPIENT"), 0, CFSTR("Gifting"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftRecipientTableViewCell setLabel:](v11, "setLabel:", v12);

    v13 = self->_recipientTableViewCell;
    -[SUUIGift recipientAddresses](self->_gift, "recipientAddresses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftRecipientTableViewCell setRecipientAddresses:](v13, "setRecipientAddresses:", v14);

    -[SUUIGiftRecipientTableViewCell setSelectionStyle:](self->_recipientTableViewCell, "setSelectionStyle:", 0);
    recipientTableViewCell = self->_recipientTableViewCell;
  }
  return recipientTableViewCell;
}

- (id)_textFieldTableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  SUUIGiftTextFieldTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("GTF"), a4);
  v5 = (SUUIGiftTextFieldTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SUUIGiftTextFieldTableViewCell initWithStyle:reuseIdentifier:]([SUUIGiftTextFieldTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("GTF"));
    -[SUUIGiftTextFieldTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
  }
  -[SUUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("GIFTING_PLACEHOLDER_NAME"), CFSTR("Gifting"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_PLACEHOLDER_NAME"), 0, CFSTR("Gifting"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftAddressingSection _attributedPlaceholderWithString:](self, "_attributedPlaceholderWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftTextFieldTableViewCell setAttributedPlaceholder:](v5, "setAttributedPlaceholder:", v9);

  -[SUUIGiftTextFieldTableViewCell setEnabled:](v5, "setEnabled:", 1);
  -[SUUIGiftTextFieldTableViewCell setKeyboardType:](v5, "setKeyboardType:", 0);
  if (v7)
    objc_msgSend(v7, "localizedStringForKey:inTable:", CFSTR("GIFTING_FIELD_LABEL_SENDER_NAME"), CFSTR("Gifting"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_FIELD_LABEL_SENDER_NAME"), 0, CFSTR("Gifting"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftTextFieldTableViewCell setLabel:](v5, "setLabel:", v10);

  -[SUUIGiftTextFieldTableViewCell setTextFieldDelegate:](v5, "setTextFieldDelegate:", self->_textFieldDelegate);
  -[SUUIGift senderName](self->_gift, "senderName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftTextFieldTableViewCell setValue:](v5, "setValue:", v11);

  return v5;
}

- (SUUIGiftTextTableViewCell)messageCell
{
  SUUIGiftTextTableViewCell *messageCell;
  SUUIGiftTextTableViewCell *v4;
  void *v5;
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
  UITextView *messagingTextView;
  UITextView *v17;
  UITextView *v18;
  SUUIGiftTextTableViewCell *v19;

  messageCell = self->_messageCell;
  if (!messageCell)
  {
    v4 = -[SUUIGiftTextTableViewCell initWithStyle:reuseIdentifier:]([SUUIGiftTextTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    -[SUUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "maximumMessageLength");

    -[SUUIGiftTextTableViewCell setMaximumCharacterCount:](v4, "setMaximumCharacterCount:", v6);
    -[SUUIGiftTextTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[SUUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_MESSAGE_LABEL"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_MESSAGE_LABEL"), 0, CFSTR("Gifting"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftTextTableViewCell setLabel:](v4, "setLabel:", v9);

    if (v8)
      objc_msgSend(v8, "localizedStringForKey:inTable:", CFSTR("GIFTING_PLACEHOLDER_MESSAGE"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_PLACEHOLDER_MESSAGE"), 0, CFSTR("Gifting"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v11, "setNumberStyle:", 1);
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromNumber:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftTextTableViewCell setPlaceholder:](v4, "setPlaceholder:", v15);

    messagingTextView = self->_messagingTextView;
    if (!messagingTextView)
    {
      v17 = +[SUUIGiftTextTableViewCell newTextView](SUUIGiftTextTableViewCell, "newTextView");
      v18 = self->_messagingTextView;
      self->_messagingTextView = v17;

      -[UITextView setEditable:](self->_messagingTextView, "setEditable:", 0);
      -[UITextView setUserInteractionEnabled:](self->_messagingTextView, "setUserInteractionEnabled:", 0);
      messagingTextView = self->_messagingTextView;
    }
    -[SUUIGiftTextTableViewCell setTextView:](v4, "setTextView:", messagingTextView);
    v19 = self->_messageCell;
    self->_messageCell = v4;

    messageCell = self->_messageCell;
  }
  return messageCell;
}

- (SUUIGift)gift
{
  return self->_gift;
}

- (void)setGift:(id)a3
{
  objc_storeStrong((id *)&self->_gift, a3);
}

- (UITextView)messagingTextView
{
  return self->_messagingTextView;
}

- (UITextFieldDelegate)textFieldDelegate
{
  return self->_textFieldDelegate;
}

- (void)setTextFieldDelegate:(id)a3
{
  self->_textFieldDelegate = (UITextFieldDelegate *)a3;
}

- (void)setMessageCell:(id)a3
{
  objc_storeStrong((id *)&self->_messageCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageCell, 0);
  objc_storeStrong((id *)&self->_recipientTableViewCell, 0);
  objc_storeStrong((id *)&self->_messagingTextView, 0);
  objc_storeStrong((id *)&self->_gift, 0);
  objc_storeStrong((id *)&self->_footerString, 0);
}

@end
