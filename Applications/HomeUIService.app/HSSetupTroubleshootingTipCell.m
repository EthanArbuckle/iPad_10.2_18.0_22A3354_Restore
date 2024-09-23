@implementation HSSetupTroubleshootingTipCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HSSetupTroubleshootingTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  HSSetupTroubleshootingTipCell *v7;
  HSSetupTroubleshootingTipCell *v8;
  double left;
  double bottom;
  double right;
  void *v12;
  id v13;
  double y;
  double width;
  double height;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NAUILayoutConstraintSet *v38;
  NAUILayoutConstraintSet *constraintSet;
  _QWORD v41[4];
  id v42;
  id location;
  objc_super v44;

  v6 = a4;
  v44.receiver = self;
  v44.super_class = (Class)HSSetupTroubleshootingTipCell;
  v7 = -[HSSetupTroubleshootingTipCell initWithStyle:reuseIdentifier:](&v44, "initWithStyle:reuseIdentifier:", a3, v6);
  v8 = v7;
  if (v7)
  {
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    -[HSSetupTroubleshootingTipCell setSeparatorInset:](v7, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[HSSetupTroubleshootingTipCell setBackgroundColor:](v8, "setBackgroundColor:", v12);

    v13 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v17 = objc_msgSend(v13, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[HSSetupTroubleshootingTipCell setTitleLabel:](v8, "setTitleLabel:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell titleLabel](v8, "titleLabel"));
    objc_msgSend(v18, "setNumberOfLines:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell titleLabel](v8, "titleLabel"));
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[HUFontUtilities preferredFontForTextStyle:traits:](HUFontUtilities, "preferredFontForTextStyle:traits:", UIFontTextStyleSubheadline, 32770));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell titleLabel](v8, "titleLabel"));
    objc_msgSend(v21, "setFont:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell contentView](v8, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell titleLabel](v8, "titleLabel"));
    objc_msgSend(v22, "addSubview:", v23);

    v24 = objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[HSSetupTroubleshootingTipCell setBodyTextView:](v8, "setBodyTextView:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](v8, "bodyTextView"));
    objc_msgSend(v26, "setBackgroundColor:", v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](v8, "bodyTextView"));
    objc_msgSend(v27, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](v8, "bodyTextView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "textContainer"));
    objc_msgSend(v29, "setLineFragmentPadding:", 0.0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](v8, "bodyTextView"));
    objc_msgSend(v30, "setEditable:", 0);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](v8, "bodyTextView"));
    objc_msgSend(v31, "setScrollEnabled:", 0);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](v8, "bodyTextView"));
    objc_msgSend(v32, "setDelegate:", v8);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](v8, "bodyTextView"));
    objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](v8, "bodyTextView"));
    objc_msgSend(v34, "_setInteractiveTextSelectionDisabled:", 1);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell contentView](v8, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](v8, "bodyTextView"));
    objc_msgSend(v35, "addSubview:", v36);

    objc_initWeak(&location, v8);
    v37 = objc_alloc((Class)NAUILayoutConstraintSet);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10001FFB8;
    v41[3] = &unk_1000A1B98;
    objc_copyWeak(&v42, &location);
    v38 = (NAUILayoutConstraintSet *)objc_msgSend(v37, "initWithOwningView:constraintBuilder:", v8, v41);
    constraintSet = v8->_constraintSet;
    v8->_constraintSet = v38;

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HSSetupTroubleshootingTipCell;
  -[HSSetupTroubleshootingTipCell prepareForReuse](&v3, "prepareForReuse");
  -[HSSetupTroubleshootingTipCell setAttributedBodyString:](self, "setAttributedBodyString:", 0);
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell constraintSet](self, "constraintSet"));
  objc_msgSend(v3, "activateIfNeeded");

  v4.receiver = self;
  v4.super_class = (Class)HSSetupTroubleshootingTipCell;
  -[HSSetupTroubleshootingTipCell updateConstraints](&v4, "updateConstraints");
}

- (NSString)titleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setTitleString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSAttributedString)attributedBodyString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](self, "bodyTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attributedText"));

  return (NSAttributedString *)v3;
}

- (void)setAttributedBodyString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = objc_msgSend(a3, "mutableCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HUFontUtilities preferredFontForTextStyle:traits:](HUFontUtilities, "preferredFontForTextStyle:traits:", UIFontTextStyleSubheadline, 0x8000));
  objc_msgSend(v9, "addAttribute:value:range:", NSFontAttributeName, v4, 0, objc_msgSend(v9, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](self, "bodyTextView"));
  objc_msgSend(v5, "setAttributedText:", v9);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](self, "bodyTextView"));
  objc_msgSend(v7, "setTextColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell bodyTextView](self, "bodyTextView"));
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)setTip:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  __CFString *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;

  self->_tip = a3;
  switch(a3)
  {
    case 0uLL:
      v4 = sub_1000593D8(CFSTR("HSTroubleshootingTipManuallyEnterCodeLink"));
      v31 = (id)objc_claimAutoreleasedReturnValue(v4);
      v11 = sub_1000594F0(CFSTR("HSTroubleshootingTipManuallyEnterCodeFormat"), CFSTR("%@"), v5, v6, v7, v8, v9, v10, (uint64_t)v31);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("home://HSSetupTroubleshootingTipEnterASetupCodePunchoutURLString")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString hf_attributedLinkStringForString:linkString:linkURL:](NSAttributedString, "hf_attributedLinkStringForString:linkString:linkURL:", v12, v31, v13));
      -[HSSetupTroubleshootingTipCell setAttributedBodyString:](self, "setAttributedBodyString:", v14);
      v15 = sub_1000593D8(CFSTR("HSTroubleshootingTipManuallyEnterCodeTitle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      -[HSSetupTroubleshootingTipCell setTitleString:](self, "setTitleString:", v16);

      goto LABEL_7;
    case 1uLL:
      v17 = objc_alloc((Class)NSAttributedString);
      v18 = sub_1000593D8(CFSTR("HSSetupTroubleshootingTipMakeAccessoryDiscoverable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = objc_msgSend(v17, "initWithString:", v19);
      -[HSSetupTroubleshootingTipCell setAttributedBodyString:](self, "setAttributedBodyString:", v20);

      v21 = CFSTR("HSSetupTroubleshootingTipMakeAccessoryDiscoverableTitle");
      goto LABEL_6;
    case 2uLL:
      v22 = objc_alloc((Class)NSAttributedString);
      v23 = sub_1000593D8(CFSTR("HSSetupTroubleshootingTipUseManufacturersApp"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = objc_msgSend(v22, "initWithString:", v24);
      -[HSSetupTroubleshootingTipCell setAttributedBodyString:](self, "setAttributedBodyString:", v25);

      v21 = CFSTR("HSSetupTroubleshootingTipUseManufacturersAppTitle");
      goto LABEL_6;
    case 3uLL:
      v26 = objc_alloc((Class)NSAttributedString);
      v27 = sub_1000593D8(CFSTR("HSTroubleshootingTipReset"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = objc_msgSend(v26, "initWithString:", v28);
      -[HSSetupTroubleshootingTipCell setAttributedBodyString:](self, "setAttributedBodyString:", v29);

      v21 = CFSTR("HSTroubleshootingTipResetTitle");
LABEL_6:
      v30 = sub_1000593D8(v21);
      v31 = (id)objc_claimAutoreleasedReturnValue(v30);
      -[HSSetupTroubleshootingTipCell setTitleString:](self, "setTitleString:");
LABEL_7:

      break;
    default:
      return;
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  int v15;
  HSSetupTroubleshootingTipCell *v16;
  __int16 v17;
  id v18;

  v7 = a4;
  v9 = HFLogForCategory(68, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v15, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("home://HSSetupTroubleshootingTipEnterASetupCodePunchoutURLString"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupTroubleshootingTipCell delegate](self, "delegate"));
    objc_msgSend(v13, "actionInvokedForTip:", 0);

  }
  return v12 ^ 1;
}

- (HSSetupTroubleshootingTipCellDelegate)delegate
{
  return (HSSetupTroubleshootingTipCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)tip
{
  return self->_tip;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UITextView)bodyTextView
{
  return self->_bodyTextView;
}

- (void)setBodyTextView:(id)a3
{
  objc_storeStrong((id *)&self->_bodyTextView, a3);
}

- (NAUILayoutConstraintSet)constraintSet
{
  return self->_constraintSet;
}

- (void)setConstraintSet:(id)a3
{
  objc_storeStrong((id *)&self->_constraintSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintSet, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
