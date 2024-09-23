@implementation SUUIGiftConfirmView

- (SUUIGiftConfirmView)initWithGift:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SUUIGiftConfirmView *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  UILabel *confirmYourOrderLabel;
  UILabel *v14;
  void *v15;
  uint64_t v16;
  UILabel *chargeDisclaimerLabel;
  UILabel *v18;
  void *v19;
  UIView *v20;
  UIView *rule1;
  UIView *v22;
  void *v23;
  SUUIGiftConfirmLabeledValue *v24;
  SUUIGiftConfirmLabeledValue *recipientsView;
  SUUIGiftConfirmLabeledValue *v26;
  void *v27;
  SUUIGiftConfirmLabeledValue *v28;
  void *v29;
  void *v30;
  SUUIGiftConfirmLabeledValue *v31;
  SUUIGiftConfirmLabeledValue *senderView;
  SUUIGiftConfirmLabeledValue *v33;
  void *v34;
  SUUIGiftConfirmLabeledValue *v35;
  void *v36;
  SUUIGiftConfirmLabeledValue *v37;
  SUUIGiftConfirmLabeledValue *fromView;
  SUUIGiftConfirmLabeledValue *v39;
  void *v40;
  SUUIGiftConfirmLabeledValue *v41;
  void *v42;
  UIView *v43;
  UIView *rule2;
  UIView *v45;
  void *v46;
  uint64_t v47;
  SUUIGiftConfirmLabeledValue *v48;
  uint64_t v49;
  SUUIGiftConfirmLabeledValue *messageView;
  SUUIGiftConfirmLabeledValue *v51;
  uint64_t v52;
  uint64_t v53;
  SUUIGiftConfirmLabeledValue *v54;
  void *v55;
  SUUIGiftConfirmLabeledValue *v56;
  void *v57;
  UIView *v58;
  UIView *rule3;
  UIView *v60;
  void *v61;
  void *v62;
  SUUIGiftConfirmLabeledValue *v63;
  SUUIGiftConfirmLabeledValue *itemView;
  SUUIGiftConfirmLabeledValue *v65;
  SUUIGiftConfirmLabeledValue *v66;
  SUUIGiftConfirmLabeledValue *v67;
  void *v68;
  SUUIGiftConfirmLabeledValue *v69;
  void *v70;
  SUUIGiftConfirmLabeledValue *v71;
  SUUIGiftConfirmLabeledValue *amountView;
  SUUIGiftConfirmLabeledValue *v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  SUUIGiftConfirmLabeledValue *v85;
  void *v86;
  void *v87;
  void *v88;
  SUUIGiftConfirmLabeledValue *v89;
  void *v90;
  void *v91;
  SUUIGiftConfirmLabeledValue *v92;
  SUUIGiftConfirmLabeledValue *sendOnView;
  SUUIGiftConfirmLabeledValue *v94;
  void *v95;
  id v96;
  SUUIGiftConfirmLabeledValue *v97;
  void *v98;
  SUUIGiftConfirmLabeledValue *v99;
  UIView *v100;
  UIView *rule4;
  UIView *v102;
  void *v103;
  SUUIGiftConfirmLabeledValue *v104;
  SUUIGiftConfirmLabeledValue *themeNameView;
  SUUIGiftConfirmLabeledValue *v106;
  void *v107;
  void *v108;
  SUUIGiftConfirmLabeledValue *v109;
  void *v110;
  void *v111;
  UIView *v112;
  UIView *rule5;
  UIView *v114;
  void *v115;
  uint64_t v116;
  UILabel *totalLabel;
  void *v118;
  void *v119;
  UILabel *v120;
  void *v121;
  void *v122;
  void *v123;
  UIView *v124;
  UIView *rule6;
  UIView *v126;
  void *v127;
  void *v128;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  objc_super v136;

  v6 = a3;
  v7 = a4;
  v136.receiver = self;
  v136.super_class = (Class)SUUIGiftConfirmView;
  v8 = -[SUUIGiftConfirmView init](&v136, sel_init);
  if (v8)
  {
    v133 = v7;
    objc_msgSend(v7, "clientContext");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = a4;
    v11 = (void *)v9;
    objc_storeStrong((id *)&v8->_giftConfiguration, v10);
    v12 = -[SUUIGiftConfirmView _newLightLabelWithSize:alpha:](v8, "_newLightLabelWithSize:alpha:", 23.0, 1.0);
    confirmYourOrderLabel = v8->_confirmYourOrderLabel;
    v8->_confirmYourOrderLabel = (UILabel *)v12;

    v14 = v8->_confirmYourOrderLabel;
    if (v11)
      objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_CONFIRM_YOUR_ORDER"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_CONFIRM_YOUR_ORDER"), 0, CFSTR("Gifting"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v14, "setText:", v15);

    -[UILabel sizeToFit](v8->_confirmYourOrderLabel, "sizeToFit");
    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_confirmYourOrderLabel);
    v16 = -[SUUIGiftConfirmView _newLightLabelWithSize:alpha:](v8, "_newLightLabelWithSize:alpha:", 11.0, 0.5);
    chargeDisclaimerLabel = v8->_chargeDisclaimerLabel;
    v8->_chargeDisclaimerLabel = (UILabel *)v16;

    -[UILabel setNumberOfLines:](v8->_chargeDisclaimerLabel, "setNumberOfLines:", 0);
    v18 = v8->_chargeDisclaimerLabel;
    if (v11)
      objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_CHARGE_WARNING"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_CHARGE_WARNING"), 0, CFSTR("Gifting"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v18, "setText:", v19);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_chargeDisclaimerLabel);
    v20 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    rule1 = v8->_rule1;
    v8->_rule1 = v20;

    v22 = v8->_rule1;
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_rule1);
    v24 = -[SUUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:]([SUUIGiftConfirmLabeledValue alloc], "initWithGiftConfirmLabelStyle:", 0);
    recipientsView = v8->_recipientsView;
    v8->_recipientsView = v24;

    v26 = v8->_recipientsView;
    if (v11)
      objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_RECIPIENTS_LABEL"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_RECIPIENTS_LABEL"), 0, CFSTR("Gifting"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmLabeledValue setLabel:](v26, "setLabel:", v27);

    v28 = v8->_recipientsView;
    objc_msgSend(v6, "recipientAddresses");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", "));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmLabeledValue setValue:](v28, "setValue:", v30);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_recipientsView);
    v31 = -[SUUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:]([SUUIGiftConfirmLabeledValue alloc], "initWithGiftConfirmLabelStyle:", 0);
    senderView = v8->_senderView;
    v8->_senderView = v31;

    v33 = v8->_senderView;
    if (v11)
      objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_SENDER_LABEL"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_SENDER_LABEL"), 0, CFSTR("Gifting"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmLabeledValue setLabel:](v33, "setLabel:", v34);

    v35 = v8->_senderView;
    objc_msgSend(v6, "senderName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmLabeledValue setValue:](v35, "setValue:", v36);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_senderView);
    v37 = -[SUUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:]([SUUIGiftConfirmLabeledValue alloc], "initWithGiftConfirmLabelStyle:", 0);
    fromView = v8->_fromView;
    v8->_fromView = v37;

    v39 = v8->_fromView;
    if (v11)
      objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_FROM_LABEL"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_FROM_LABEL"), 0, CFSTR("Gifting"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmLabeledValue setLabel:](v39, "setLabel:", v40);

    v41 = v8->_fromView;
    objc_msgSend(v6, "senderEmailAddress");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmLabeledValue setValue:](v41, "setValue:", v42);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_fromView);
    v43 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    rule2 = v8->_rule2;
    v8->_rule2 = v43;

    v45 = v8->_rule2;
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v45, "setBackgroundColor:", v46);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_rule2);
    objc_msgSend(v6, "message");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v132, "length");
    v48 = [SUUIGiftConfirmLabeledValue alloc];
    if (v47)
    {
      v49 = -[SUUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:](v48, "initWithGiftConfirmLabelStyle:", 1);
      messageView = v8->_messageView;
      v8->_messageView = (SUUIGiftConfirmLabeledValue *)v49;

      v51 = v8->_messageView;
      objc_msgSend(v6, "message");
      v52 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v53 = -[SUUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:](v48, "initWithGiftConfirmLabelStyle:", 0);
      v54 = v8->_messageView;
      v8->_messageView = (SUUIGiftConfirmLabeledValue *)v53;

      v51 = v8->_messageView;
      if (v11)
        objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_NO_MESSAGE_PLACEHOLDER"), CFSTR("Gifting"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_NO_MESSAGE_PLACEHOLDER"), 0, CFSTR("Gifting"));
      v52 = objc_claimAutoreleasedReturnValue();
    }
    v55 = (void *)v52;
    -[SUUIGiftConfirmLabeledValue setValue:](v51, "setValue:", v52);

    v56 = v8->_messageView;
    if (v11)
      objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_MESSAGE_LABEL"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_MESSAGE_LABEL"), 0, CFSTR("Gifting"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmLabeledValue setLabel:](v56, "setLabel:", v57);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_messageView);
    v58 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    rule3 = v8->_rule3;
    v8->_rule3 = v58;

    v60 = v8->_rule3;
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v60, "setBackgroundColor:", v61);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_rule3);
    objc_msgSend(v6, "item");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -[SUUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:]([SUUIGiftConfirmLabeledValue alloc], "initWithGiftConfirmLabelStyle:", 2);
    v134 = v6;
    v135 = v62;
    if (v62)
    {
      itemView = v8->_itemView;
      v8->_itemView = v63;

      v65 = v8->_itemView;
      if (v11)
        objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_ITEM_LABEL"), CFSTR("Gifting"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_ITEM_LABEL"), 0, CFSTR("Gifting"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIGiftConfirmLabeledValue setLabel:](v65, "setLabel:", v68);

      v69 = v8->_itemView;
      objc_msgSend(v62, "title");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIGiftConfirmLabeledValue setValue:](v69, "setValue:", v70);

      -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_itemView);
      v71 = -[SUUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:]([SUUIGiftConfirmLabeledValue alloc], "initWithGiftConfirmLabelStyle:", 2);
      amountView = v8->_amountView;
      v8->_amountView = v71;

      v73 = v8->_amountView;
      if (v11)
        objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_PRICE_LABEL"), CFSTR("Gifting"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_PRICE_LABEL"), 0, CFSTR("Gifting"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIGiftConfirmLabeledValue setLabel:](v73, "setLabel:", v74);

      v75 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      objc_msgSend(v75, "setNumberStyle:", 1);
      objc_msgSend(v6, "recipientAddresses");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "count");

      v131 = v11;
      if (v11)
        objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_MULTIPLE_RECPIENT_PRICE_FORMAT"), CFSTR("Gifting"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_MULTIPLE_RECPIENT_PRICE_FORMAT"), 0, CFSTR("Gifting"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v77);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "stringFromNumber:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "primaryItemOffer");
      v130 = v75;
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "buttonText");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "stringWithValidatedFormat:validFormatSpecifiers:error:", v78, CFSTR("%@%@"), 0, v81, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUUIGiftConfirmLabeledValue setSubtitleLabel:](v8->_amountView, "setSubtitleLabel:", v84);
      v85 = v8->_amountView;
      objc_msgSend(v135, "primaryItemOffer");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "buttonText");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIGiftConfirmLabeledValue setValue:](v85, "setValue:", v87);

      -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_amountView);
      v6 = v134;
      v11 = v131;
    }
    else
    {
      v66 = v8->_amountView;
      v8->_amountView = v63;

      v67 = v8->_amountView;
      if (v11)
        objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_AMOUNT_LABEL"), CFSTR("Gifting"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_AMOUNT_LABEL"), 0, CFSTR("Gifting"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIGiftConfirmLabeledValue setLabel:](v67, "setLabel:", v88);

      v89 = v8->_amountView;
      objc_msgSend(v6, "giftAmountString");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIGiftConfirmLabeledValue setValue:](v89, "setValue:", v90);

      -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_amountView);
    }
    objc_msgSend(v6, "deliveryDate");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = -[SUUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:]([SUUIGiftConfirmLabeledValue alloc], "initWithGiftConfirmLabelStyle:", 2);
    sendOnView = v8->_sendOnView;
    v8->_sendOnView = v92;

    v94 = v8->_sendOnView;
    if (v11)
      objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_SEND_DATE_LABEL"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_SEND_DATE_LABEL"), 0, CFSTR("Gifting"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmLabeledValue setLabel:](v94, "setLabel:", v95);

    if (v91)
    {
      v96 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v96, "setDateStyle:", 2);
      objc_msgSend(v96, "setTimeStyle:", 0);
      v97 = v8->_sendOnView;
      objc_msgSend(v96, "stringFromDate:", v91);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIGiftConfirmLabeledValue setValue:](v97, "setValue:", v98);

    }
    else
    {
      v99 = v8->_sendOnView;
      if (v11)
        objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_DATE_TODAY"), CFSTR("Gifting"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_DATE_TODAY"), 0, CFSTR("Gifting"));
      v96 = (id)objc_claimAutoreleasedReturnValue();
      -[SUUIGiftConfirmLabeledValue setValue:](v99, "setValue:", v96);
    }

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_sendOnView);
    v100 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    rule4 = v8->_rule4;
    v8->_rule4 = v100;

    v102 = v8->_rule4;
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v102, "setBackgroundColor:", v103);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_rule4);
    v104 = -[SUUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:]([SUUIGiftConfirmLabeledValue alloc], "initWithGiftConfirmLabelStyle:", 2);
    themeNameView = v8->_themeNameView;
    v8->_themeNameView = v104;

    v106 = v8->_themeNameView;
    if (v11)
      objc_msgSend(v11, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_THEME_LABEL"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_THEME_LABEL"), 0, CFSTR("Gifting"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v11;
    -[SUUIGiftConfirmLabeledValue setLabel:](v106, "setLabel:", v107);

    v109 = v8->_themeNameView;
    v6 = v134;
    objc_msgSend(v134, "theme");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "themeName");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmLabeledValue setValue:](v109, "setValue:", v111);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_themeNameView);
    v112 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    rule5 = v8->_rule5;
    v8->_rule5 = v112;

    v114 = v8->_rule5;
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v114, "setBackgroundColor:", v115);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_rule5);
    v116 = -[SUUIGiftConfirmView _newLightLabelWithSize:alpha:](v8, "_newLightLabelWithSize:alpha:", 20.0, 1.0);
    totalLabel = v8->_totalLabel;
    v8->_totalLabel = (UILabel *)v116;

    if (v108)
      objc_msgSend(v108, "localizedStringForKey:inTable:", CFSTR("GIFTING_CONFIRM_TOTAL_LABEL"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_CONFIRM_TOTAL_LABEL"), 0, CFSTR("Gifting"));
    v118 = v108;
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v8->_totalLabel;
    v121 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v134, "totalGiftAmountString");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "stringWithValidatedFormat:validFormatSpecifiers:error:", v119, CFSTR("%@"), 0, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v120, "setText:", v123);

    -[UILabel sizeToFit](v8->_totalLabel, "sizeToFit");
    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_totalLabel);
    v124 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    rule6 = v8->_rule6;
    v8->_rule6 = v124;

    v126 = v8->_rule6;
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v126, "setBackgroundColor:", v127);

    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v8->_rule6);
    -[SUUIGiftConfirmView _termsButton](v8, "_termsButton");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftConfirmView addSubview:](v8, "addSubview:", v128);

    v7 = v133;
  }

  return v8;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  UILabel *confirmYourOrderLabel;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  UILabel *chargeDisclaimerLabel;
  double v41;
  double v42;
  double v43;
  double v44;
  double MaxY;
  void *v46;
  uint64_t v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  double v55;
  void *v56;
  uint64_t v57;
  double v58;
  CGFloat v59;
  float v60;
  double v61;
  void *v62;
  uint64_t v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  void *v70;
  uint64_t v71;
  double v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  void *v78;
  uint64_t v79;
  double v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  void *v86;
  uint64_t v87;
  double v88;
  void *v89;
  uint64_t v90;
  double v91;
  CGFloat v92;
  float v93;
  double v94;
  void *v95;
  uint64_t v96;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  double v102;
  void *v103;
  uint64_t v104;
  double v105;
  void *v106;
  uint64_t v107;
  double v108;
  CGFloat v109;
  float v110;
  double v111;
  SUUIGiftConfirmLabeledValue *itemView;
  void *v113;
  uint64_t v114;
  double v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  void *v120;
  uint64_t v121;
  double v122;
  double v123;
  CGFloat v124;
  double v125;
  CGFloat v126;
  double v127;
  void *v128;
  uint64_t v129;
  double v130;
  double v131;
  CGFloat v132;
  double v133;
  CGFloat v134;
  double v135;
  void *v136;
  uint64_t v137;
  double v138;
  void *v139;
  uint64_t v140;
  double v141;
  CGFloat v142;
  float v143;
  double v144;
  void *v145;
  uint64_t v146;
  double v147;
  double v148;
  CGFloat v149;
  double v150;
  CGFloat v151;
  double v152;
  void *v153;
  uint64_t v154;
  double v155;
  void *v156;
  uint64_t v157;
  double v158;
  CGFloat v159;
  double v160;
  void *v161;
  uint64_t v162;
  double v163;
  float v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  UILabel *totalLabel;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  void *v177;
  uint64_t v178;
  double v179;
  double v180;
  void *v181;
  uint64_t v182;
  double v183;
  void *v184;
  uint64_t v185;
  double v186;
  CGFloat v187;
  float v188;
  double v189;
  double v190;
  double v191;
  void *v192;
  uint64_t v193;
  double v194;
  void *v195;
  uint64_t v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  id v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;

  -[SUUIGiftConfirmView bounds](self, "bounds");
  v200 = v4;
  v201 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v13 = 75.0;
  else
    v13 = 30.0;
  v14 = v8 - v13;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v17 = 55.0;
  else
    v17 = 15.0;
  -[UILabel frame](self->_confirmYourOrderLabel, "frame");
  v19 = v18;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceIdiom");

  if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v22 = 75.0;
  else
    v22 = 30.0;
  v203 = v14;
  v23 = v14 - v22;
  confirmYourOrderLabel = self->_confirmYourOrderLabel;
  v199 = v6;
  if (v10)
  {
    v25 = v14 - v22;
    v26 = v200;
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v22, v17, v25, v19, v201, v6, v8, v200);
  }
  else
  {
    v27 = v22;
    v28 = v17;
    v29 = v14 - v22;
    v30 = v19;
    v26 = v200;
  }
  v31 = v8;
  -[UILabel setFrame:](confirmYourOrderLabel, "setFrame:", v27, v28, v29, v30);
  v205.origin.x = v22;
  v205.origin.y = v17;
  v205.size.width = v23;
  v205.size.height = v19;
  v32 = CGRectGetMaxY(v205) + 16.0;
  -[UILabel frame](self->_chargeDisclaimerLabel, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "userInterfaceIdiom");

  if ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v35 = 75.0;
  else
    v35 = 30.0;
  -[UILabel sizeThatFits:](self->_chargeDisclaimerLabel, "sizeThatFits:", v203 - v35, 1.79769313e308);
  v38 = v36;
  v39 = v37;
  chargeDisclaimerLabel = self->_chargeDisclaimerLabel;
  if (v10)
  {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v35, v32, v36, v37, v201, v199, v31, v26);
  }
  else
  {
    v41 = v35;
    v42 = v32;
    v43 = v38;
    v44 = v39;
  }
  -[UILabel setFrame:](chargeDisclaimerLabel, "setFrame:", v41, v42, v43, v44, *(_QWORD *)&v31);
  v206.origin.x = v35;
  v206.origin.y = v32;
  v206.size.width = v38;
  v206.size.height = v39;
  MaxY = CGRectGetMaxY(v206);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "userInterfaceIdiom");

  v48 = 10.0;
  if ((v47 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v48 = 6.0;
  v49 = MaxY + v48;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "scale");
  v52 = 1.0 / v51;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "userInterfaceIdiom");

  if ((v54 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v55 = 75.0;
  else
    v55 = 30.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "userInterfaceIdiom");

  if ((v57 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v58 = 75.0;
  else
    v58 = 30.0;
  v59 = v203 - v58;
  -[UIView setFrame:](self->_rule1, "setFrame:", v55, v49, v203 - v58, v52);
  v207.origin.x = v55;
  v207.origin.y = v49;
  v207.size.width = v59;
  v207.size.height = v52;
  v60 = CGRectGetMaxY(v207) + 6.0;
  v61 = ceilf(v60);
  -[SUUIGiftConfirmLabeledValue frame](self->_recipientsView, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "userInterfaceIdiom");

  if ((v63 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v64 = 75.0;
  else
    v64 = 30.0;
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_recipientsView, "sizeThatFits:", v203 - v64, 1.79769313e308);
  v66 = v65;
  v68 = v67;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_recipientsView, "setFrame:", v64, v61, v65, v67);
  v208.origin.x = v64;
  v208.origin.y = v61;
  v208.size.width = v66;
  v208.size.height = v68;
  v69 = CGRectGetMaxY(v208) + 3.0;
  -[SUUIGiftConfirmLabeledValue frame](self->_senderView, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "userInterfaceIdiom");

  if ((v71 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v72 = 75.0;
  else
    v72 = 30.0;
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_senderView, "sizeThatFits:", v203 - v72, 1.79769313e308);
  v74 = v73;
  v76 = v75;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_senderView, "setFrame:", v72, v69, v73, v75);
  v209.origin.x = v72;
  v209.origin.y = v69;
  v209.size.width = v74;
  v209.size.height = v76;
  v77 = CGRectGetMaxY(v209) + 3.0;
  -[SUUIGiftConfirmLabeledValue frame](self->_fromView, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v78, "userInterfaceIdiom");

  if ((v79 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v80 = 75.0;
  else
    v80 = 30.0;
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_fromView, "sizeThatFits:", v203 - v80, 1.79769313e308);
  v82 = v81;
  v84 = v83;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_fromView, "setFrame:", v80, v77, v81, v83);
  v210.origin.x = v80;
  v210.origin.y = v77;
  v210.size.width = v82;
  v210.size.height = v84;
  v85 = CGRectGetMaxY(v210) + 7.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "userInterfaceIdiom");

  if ((v87 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v88 = 75.0;
  else
    v88 = 30.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "userInterfaceIdiom");

  if ((v90 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v91 = 75.0;
  else
    v91 = 30.0;
  v92 = v203 - v91;
  -[UIView setFrame:](self->_rule2, "setFrame:", v88, v85, v203 - v91, v52);
  v211.origin.x = v88;
  v211.origin.y = v85;
  v211.size.width = v92;
  v211.size.height = v52;
  v93 = CGRectGetMaxY(v211) + 6.0;
  v94 = ceilf(v93);
  -[SUUIGiftConfirmLabeledValue frame](self->_messageView, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v95, "userInterfaceIdiom");

  if ((v96 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v97 = 75.0;
  else
    v97 = 30.0;
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_messageView, "sizeThatFits:", v203 - v97, 1.79769313e308);
  v99 = v98;
  v101 = v100;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_messageView, "setFrame:", v97, v94, v98, v100);
  v212.origin.x = v97;
  v212.origin.y = v94;
  v212.size.width = v99;
  v212.size.height = v101;
  v102 = CGRectGetMaxY(v212) + 6.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "userInterfaceIdiom");

  if ((v104 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v105 = 75.0;
  else
    v105 = 30.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "userInterfaceIdiom");

  if ((v107 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v108 = 75.0;
  else
    v108 = 30.0;
  v109 = v203 - v108;
  -[UIView setFrame:](self->_rule3, "setFrame:", v105, v102, v203 - v108, v52);
  v213.origin.x = v105;
  v213.origin.y = v102;
  v213.size.width = v109;
  v202 = v52;
  v213.size.height = v52;
  v110 = CGRectGetMaxY(v213) + 6.0;
  v111 = ceilf(v110);
  itemView = self->_itemView;
  if (itemView)
  {
    -[SUUIGiftConfirmLabeledValue frame](itemView, "frame");
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v113, "userInterfaceIdiom");

    if ((v114 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v115 = 75.0;
    else
      v115 = 30.0;
    -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_itemView, "sizeThatFits:", v203 - v115, 1.79769313e308);
    v117 = v116;
    v119 = v118;
    -[SUUIGiftConfirmLabeledValue setFrame:](self->_itemView, "setFrame:", v115, v111, v116, v118);
    v214.origin.x = v115;
    v214.origin.y = v111;
    v214.size.width = v117;
    v214.size.height = v119;
    v111 = CGRectGetMaxY(v214) + 4.0;
  }
  -[SUUIGiftConfirmLabeledValue frame](self->_amountView, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v120, "userInterfaceIdiom");

  if ((v121 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v122 = 75.0;
  else
    v122 = 30.0;
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_amountView, "sizeThatFits:", v203 - v122, 1.79769313e308);
  v124 = v123;
  v126 = v125;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_amountView, "setFrame:", v122, v111, v123, v125);
  v215.origin.x = v122;
  v215.origin.y = v111;
  v215.size.width = v124;
  v215.size.height = v126;
  v127 = CGRectGetMaxY(v215) + 4.0;
  -[SUUIGiftConfirmLabeledValue frame](self->_sendOnView, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v128, "userInterfaceIdiom");

  if ((v129 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v130 = 75.0;
  else
    v130 = 30.0;
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_sendOnView, "sizeThatFits:", v203 - v130, 1.79769313e308);
  v132 = v131;
  v134 = v133;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_sendOnView, "setFrame:", v130, v127, v131, v133);
  v216.origin.x = v130;
  v216.origin.y = v127;
  v216.size.width = v132;
  v216.size.height = v134;
  v135 = CGRectGetMaxY(v216) + 6.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v136, "userInterfaceIdiom");

  if ((v137 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v138 = 75.0;
  else
    v138 = 30.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_msgSend(v139, "userInterfaceIdiom");

  if ((v140 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v141 = 75.0;
  else
    v141 = 30.0;
  v142 = v203 - v141;
  -[UIView setFrame:](self->_rule4, "setFrame:", v138, v135, v203 - v141, v52);
  v217.origin.x = v138;
  v217.origin.y = v135;
  v217.size.width = v142;
  v217.size.height = v52;
  v143 = CGRectGetMaxY(v217) + 6.0;
  v144 = ceilf(v143);
  -[SUUIGiftConfirmLabeledValue frame](self->_themeNameView, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = objc_msgSend(v145, "userInterfaceIdiom");

  if ((v146 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v147 = 75.0;
  else
    v147 = 30.0;
  -[SUUIGiftConfirmLabeledValue sizeThatFits:](self->_themeNameView, "sizeThatFits:", v203 - v147, 1.79769313e308);
  v149 = v148;
  v151 = v150;
  -[SUUIGiftConfirmLabeledValue setFrame:](self->_themeNameView, "setFrame:", v147, v144, v148, v150);
  v218.origin.x = v147;
  v218.origin.y = v144;
  v218.size.width = v149;
  v218.size.height = v151;
  v152 = CGRectGetMaxY(v218) + 6.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = objc_msgSend(v153, "userInterfaceIdiom");

  if ((v154 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v155 = 75.0;
  else
    v155 = 30.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend(v156, "userInterfaceIdiom");

  if ((v157 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v158 = 75.0;
  else
    v158 = 30.0;
  v159 = v203 - v158;
  -[UIView setFrame:](self->_rule5, "setFrame:", v155, v152, v203 - v158, v52);
  v219.origin.x = v155;
  v219.origin.y = v152;
  v219.size.width = v159;
  v219.size.height = v52;
  v160 = CGRectGetMaxY(v219);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = objc_msgSend(v161, "userInterfaceIdiom");

  if ((v162 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v163 = 15.0;
  else
    v163 = 6.0;
  v164 = v160 + v163;
  v165 = ceilf(v164);
  -[UILabel frame](self->_totalLabel, "frame");
  v167 = v166;
  v169 = v168;
  v170 = v203 - v166;
  -[UILabel setFrame:](self->_totalLabel, "setFrame:", v203 - v166, v165);
  totalLabel = self->_totalLabel;
  v172 = v170;
  v173 = v165;
  v174 = v167;
  v175 = v169;
  if (v10)
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v170, v165, v167, v169, v201, v199, v198, v200);
  -[UILabel setFrame:](totalLabel, "setFrame:", v172, v173, v174, v175);
  v220.origin.x = v170;
  v220.origin.y = v165;
  v220.size.width = v167;
  v220.size.height = v169;
  v176 = CGRectGetMaxY(v220);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = objc_msgSend(v177, "userInterfaceIdiom");

  v179 = 6.0;
  if ((v178 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v179 = 15.0;
  v180 = v176 + v179;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = objc_msgSend(v181, "userInterfaceIdiom");

  if ((v182 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v183 = 75.0;
  else
    v183 = 30.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = objc_msgSend(v184, "userInterfaceIdiom");

  if ((v185 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v186 = 75.0;
  else
    v186 = 30.0;
  v187 = v203 - v186;
  -[UIView setFrame:](self->_rule6, "setFrame:", v183, v180, v203 - v186, v202);
  v221.origin.x = v183;
  v221.origin.y = v180;
  v221.size.width = v187;
  v221.size.height = v202;
  v188 = CGRectGetMaxY(v221) + 25.0;
  v189 = ceilf(v188);
  -[SUUIGiftConfirmView _termsButton](self, "_termsButton");
  v204 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "frame");
  v191 = v190;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = objc_msgSend(v192, "userInterfaceIdiom");

  if ((v193 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v194 = 75.0;
  else
    v194 = 30.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = objc_msgSend(v195, "userInterfaceIdiom");

  if ((v196 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v197 = 75.0;
  else
    v197 = 30.0;
  objc_msgSend(v204, "setFrame:", v194, v189, v198 - v197 - v194, v191);

}

- (id)_newBoldLabelWithSize:(double)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v7);

  objc_msgSend(v4, "setTextAlignment:", 4);
  return v4;
}

- (id)_newLightLabelWithSize:(double)a3 alpha:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlphaComponent:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v10);

  objc_msgSend(v6, "setTextAlignment:", 4);
  return v6;
}

- (id)_termsButton
{
  UIButton *termsButton;
  void *v4;
  SUUILinkButton *v5;
  UIButton *v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  UIButton *v13;
  void *v14;
  UIButton *v15;
  void *v16;
  UIButton *v17;
  void *v18;
  double v19;

  termsButton = self->_termsButton;
  if (!termsButton)
  {
    -[SUUIGiftConfiguration clientContext](self->_giftConfiguration, "clientContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SUUILinkButton initWithArrowStyle:]([SUUILinkButton alloc], "initWithArrowStyle:", 0);
    v6 = self->_termsButton;
    self->_termsButton = &v5->super;

    if (SUUIUserInterfaceIdiom(v4) == 1)
    {
      if (v4)
      {
        v7 = CFSTR("GIFTING_TERMS_LINK_IPAD");
LABEL_7:
        objc_msgSend(v4, "localizedStringForKey:inTable:", v7, CFSTR("Gifting"));
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v10 = (void *)v8;
        -[UIButton setTitle:forState:](self->_termsButton, "setTitle:forState:", v8, 0);
        -[UIButton titleLabel](self->_termsButton, "titleLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFont:", v12);

        v13 = self->_termsButton;
        objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setTitleColor:forState:](v13, "setTitleColor:forState:", v14, 0);

        v15 = self->_termsButton;
        objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setTitleColor:forState:](v15, "setTitleColor:forState:", v16, 1);

        -[UIButton setAutoresizingMask:](self->_termsButton, "setAutoresizingMask:", 5);
        v17 = self->_termsButton;
        objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setBackgroundColor:](v17, "setBackgroundColor:", v18);

        LODWORD(v19) = -1.0;
        -[UIButton setCharge:](self->_termsButton, "setCharge:", v19);
        -[UIButton sizeToFit](self->_termsButton, "sizeToFit");

        termsButton = self->_termsButton;
        return termsButton;
      }
      v9 = CFSTR("GIFTING_TERMS_LINK_IPAD");
    }
    else
    {
      if (v4)
      {
        v7 = CFSTR("GIFTING_TERMS_LINK_IPHONE");
        goto LABEL_7;
      }
      v9 = CFSTR("GIFTING_TERMS_LINK_IPHONE");
    }
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v9, 0, CFSTR("Gifting"));
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  return termsButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalLabel, 0);
  objc_storeStrong((id *)&self->_themeNameView, 0);
  objc_storeStrong((id *)&self->_termsButton, 0);
  objc_storeStrong((id *)&self->_sendOnView, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
  objc_storeStrong((id *)&self->_rule6, 0);
  objc_storeStrong((id *)&self->_rule5, 0);
  objc_storeStrong((id *)&self->_rule4, 0);
  objc_storeStrong((id *)&self->_rule3, 0);
  objc_storeStrong((id *)&self->_rule2, 0);
  objc_storeStrong((id *)&self->_rule1, 0);
  objc_storeStrong((id *)&self->_recipientsView, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
  objc_storeStrong((id *)&self->_senderView, 0);
  objc_storeStrong((id *)&self->_confirmYourOrderLabel, 0);
  objc_storeStrong((id *)&self->_chargeDisclaimerLabel, 0);
  objc_storeStrong((id *)&self->_amountView, 0);
}

@end
