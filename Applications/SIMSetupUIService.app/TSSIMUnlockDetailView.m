@implementation TSSIMUnlockDetailView

- (TSSIMUnlockDetailView)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4 lockedSIMName:(id)a5
{
  id v8;
  TSSIMUnlockDetailView *v9;
  NSString *v10;
  NSString *lockedSIMName;

  v8 = a5;
  v9 = -[TSSIMUnlockDetailView initWithActionType:actionSubtype:](self, "initWithActionType:actionSubtype:", a3, a4);
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    lockedSIMName = v9->_lockedSIMName;
    v9->_lockedSIMName = v10;

    -[TSSIMUnlockDetailView _configureTitleLabelText](v9, "_configureTitleLabelText");
  }

  return v9;
}

- (TSSIMUnlockDetailView)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4
{
  double y;
  double width;
  double height;
  TSSIMUnlockDetailView *v9;
  TSSIMUnlockDetailView *v10;
  UILabel *v11;
  UILabel *titleLabel;
  UILabel *v13;
  id v14;
  void *v15;
  UILabel *v16;
  UILabel *descriptionLabel;
  UILabel *v18;
  void *v19;
  void *v20;
  TSSIMUnlockEntryView *v21;
  TSSIMUnlockEntryView *entryView;
  void *v23;
  unsigned int v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)TSSIMUnlockDetailView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = -[TSSIMUnlockDetailView initWithFrame:](&v31, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = v9;
  if (v9)
  {
    v9->_actionType = a3;
    v9->_actionSubtype = a4;
    v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v11;

    v13 = v10->_titleLabel;
    v14 = sub_10000150C();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[UILabel setFont:](v13, "setFont:", v15);

    -[UILabel setTextAlignment:](v10->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v10->_titleLabel, "setNumberOfLines:", 0);
    -[TSSIMUnlockDetailView _configureTitleLabelText](v10, "_configureTitleLabelText");
    -[TSSIMUnlockDetailView addSubview:](v10, "addSubview:", v10->_titleLabel);
    v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    descriptionLabel = v10->_descriptionLabel;
    v10->_descriptionLabel = v16;

    -[UILabel setTextAlignment:](v10->_descriptionLabel, "setTextAlignment:", 1);
    v18 = v10->_descriptionLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v18, "setFont:", v19);

    -[UILabel setNumberOfLines:](v10->_descriptionLabel, "setNumberOfLines:", 0);
    -[TSSIMUnlockDetailView _configureDescriptionLabelText](v10, "_configureDescriptionLabelText");
    -[TSSIMUnlockDetailView addSubview:](v10, "addSubview:", v10->_descriptionLabel);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[TSSIMUnlockDetailView setBackgroundColor:](v10, "setBackgroundColor:", v20);

    if ((v10->_actionType & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v21 = -[TSSIMUnlockEntryView initWithActionType:actionSubtype:]([TSSIMUnlockEntryView alloc], "initWithActionType:actionSubtype:", v10->_actionType, v10->_actionSubtype);
      entryView = v10->_entryView;
      v10->_entryView = v21;

      -[TSSIMUnlockDetailView addSubview:](v10, "addSubview:", v10->_entryView);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance"));
      v24 = objc_msgSend(v23, "isOnScreen");

      if (v24)
      {
        +[UIPeripheralHost visiblePeripheralFrame](UIPeripheralHost, "visiblePeripheralFrame");
        v10->_keyboardFrame.origin.x = v25;
        v10->_keyboardFrame.origin.y = v26;
        v10->_keyboardFrame.size.width = v27;
        v10->_keyboardFrame.size.height = v28;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v29, "addObserver:selector:name:object:", v10, "_keyboardWillShow:", UIKeyboardWillShowNotification, 0);

    }
  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TSSIMUnlockDetailView;
  -[TSSIMUnlockDetailView dealloc](&v4, "dealloc");
}

- (void)layoutSubviews
{
  id v3;
  NSObject *v4;
  double Width;
  double v6;
  double v7;
  double MaxY;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  TSSIMUnlockEntryView *entryView;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v28.receiver = self;
  v28.super_class = (Class)TSSIMUnlockDetailView;
  -[TSSIMUnlockDetailView layoutSubviews](&v28, "layoutSubviews");
  v3 = sub_10000CE68();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[TSSIMUnlockDetailView layoutSubviews]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, " @%s", buf, 0xCu);
  }

  -[TSSIMUnlockDetailView bounds](self, "bounds");
  Width = CGRectGetWidth(v31);
  -[TSSIMUnlockDetailView _titleLabelHeightForWidth:](self, "_titleLabelHeightForWidth:");
  v7 = v6;
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = Width;
  v32.size.height = v7;
  MaxY = CGRectGetMaxY(v32);
  v9 = sub_10000157C();
  v11 = v10 + 0.0;
  v12 = v9 + 0.0;
  v14 = Width - (v10 + v13);
  v16 = v7 - (v9 + v15);
  -[TSSIMUnlockDetailView _descriptionLabelHeightForWidth:](self, "_descriptionLabelHeightForWidth:", Width);
  v18 = v17;
  v33.origin.x = 0.0;
  v33.origin.y = MaxY;
  v33.size.width = Width;
  v33.size.height = v18;
  CGRectGetMaxY(v33);
  v19 = sub_100001590();
  v21 = v20 + 0.0;
  v22 = MaxY + v19;
  v24 = Width - (v20 + v23);
  v26 = v18 - (v19 + v25);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v11, v12, v14, v16);
  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v21, v22, v24, v26);
  entryView = self->_entryView;
  -[TSSIMUnlockDetailView _calculateEntryViewFrame](self, "_calculateEntryViewFrame");
  -[TSSIMUnlockEntryView setFrame:](entryView, "setFrame:");
}

- (void)setUnlocking:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_unlocking != a3)
  {
    v3 = a3;
    self->_unlocking = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockDetailView entryView](self, "entryView"));
    objc_msgSend(v5, "setUnlocking:", v3);

    -[TSSIMUnlockDetailView _configureTitleLabelText](self, "_configureTitleLabelText");
    -[TSSIMUnlockDetailView _configureDescriptionLabelText](self, "_configureDescriptionLabelText");
  }
}

- (void)_keyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25[5];
  id location;
  CGRect v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v6, "CGRectValue");
  self->_keyboardFrame.origin.x = v7;
  self->_keyboardFrame.origin.y = v8;
  self->_keyboardFrame.size.width = v9;
  self->_keyboardFrame.size.height = v10;

  -[TSSIMUnlockEntryView frame](self->_entryView, "frame");
  if (!CGRectIsEmpty(v27))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", UIKeyboardAnimationCurveUserInfoKey));
    v12 = (_QWORD)objc_msgSend(v11, "unsignedIntegerValue") << 16;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", UIKeyboardAnimationDurationUserInfoKey));
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    -[TSSIMUnlockDetailView _calculateEntryViewFrame](self, "_calculateEntryViewFrame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_initWeak(&location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000B67C;
    v24[3] = &unk_10001C8F8;
    objc_copyWeak(v25, &location);
    v25[1] = v17;
    v25[2] = v19;
    v25[3] = v21;
    v25[4] = v23;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v12, v24, 0, v15, 0.0);
    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }

}

- (void)_configureTitleLabelText
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  int64_t actionSubtype;
  void *v9;
  id v10;

  if (self->_unlocking)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("SIM_UNLOCKING_TITLE");
LABEL_3:
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10001CAA0, CFSTR("Localizable")));
  }
  else
  {
    switch(self->_actionType)
    {
      case 0:
      case 1:
        goto LABEL_5;
      case 2:
        if (self->_lockedSIMName)
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v6;
          v7 = CFSTR("PIN_LOCKED_TITLE_FORMAT");
          goto LABEL_22;
        }
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v4 = v3;
        v5 = CFSTR("PIN_LOCKED_TITLE");
        goto LABEL_3;
      case 3:
        actionSubtype = self->_actionSubtype;
        switch(actionSubtype)
        {
          case 3:
LABEL_5:
            if (-[NSString length](self->_lockedSIMName, "length"))
            {
              v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v4 = v6;
              v7 = CFSTR("ENTER_NEW_PIN_2_TITLE_FORMAT");
              goto LABEL_22;
            }
            v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v4 = v3;
            v5 = CFSTR("ENTER_NEW_PIN_2_TITLE");
            break;
          case 2:
            if (-[NSString length](self->_lockedSIMName, "length"))
            {
              v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v4 = v6;
              v7 = CFSTR("ENTER_NEW_PIN_1_TITLE_FORMAT");
              goto LABEL_22;
            }
            v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v4 = v3;
            v5 = CFSTR("ENTER_NEW_PIN_1_TITLE");
            break;
          case 1:
            if (-[NSString length](self->_lockedSIMName, "length"))
            {
              v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v4 = v6;
              v7 = CFSTR("PUK_LOCKED_TITLE_FORMAT");
              goto LABEL_22;
            }
            v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v4 = v3;
            v5 = CFSTR("PUK_LOCKED_TITLE");
            break;
          default:
LABEL_14:
            v10 = 0;
            -[UILabel setText:](self->_titleLabel, "setText:", 0);
            goto LABEL_24;
        }
        goto LABEL_3;
      case 4:
        if (!-[NSString length](self->_lockedSIMName, "length"))
        {
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v3;
          v5 = CFSTR("PERMANENTLY_LOCKED_TITLE");
          goto LABEL_3;
        }
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v4 = v6;
        v7 = CFSTR("PERMANENTLY_LOCKED_TITLE_FORMAT");
LABEL_22:
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_10001CAA0, CFSTR("Localizable")));
        v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, self->_lockedSIMName));

        break;
      default:
        goto LABEL_14;
    }
  }

  -[UILabel setText:](self->_titleLabel, "setText:", v10);
LABEL_24:
  -[TSSIMUnlockDetailView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)_configureDescriptionLabelText
{
  id v3;
  int64_t actionType;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  id v9;

  if (self->_unlocking)
    goto LABEL_2;
  actionType = self->_actionType;
  if (actionType == 4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("PERMANENTLY_LOCKED_DESCRIPTION");
    goto LABEL_9;
  }
  if (actionType == 3 && self->_actionSubtype == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("PUK_LOCKED_DESCRIPTION");
LABEL_9:
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_10001CAA0, CFSTR("Localizable")));

    v3 = v9;
    goto LABEL_3;
  }
LABEL_2:
  v3 = 0;
LABEL_3:
  v8 = v3;
  -[UILabel setText:](self->_descriptionLabel, "setText:", v3);
  -[TSSIMUnlockDetailView setNeedsDisplay](self, "setNeedsDisplay");

}

- (CGRect)_calculateEntryViewFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  TSSIMUnlockEntryView *entryView;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;

  -[TSSIMUnlockDetailView convertRect:fromView:](self, "convertRect:fromView:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSSIMUnlockDetailView bounds](self, "bounds");
  v33.origin.x = v11;
  v33.origin.y = v12;
  v33.size.width = v13;
  v33.size.height = v14;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  v30 = CGRectIntersection(v29, v33);
  CGRectGetHeight(v30);
  -[UILabel frame](self->_descriptionLabel, "frame");
  CGRectGetHeight(v31);
  entryView = self->_entryView;
  -[TSSIMUnlockDetailView size](self, "size");
  -[TSSIMUnlockEntryView sizeThatFits:](entryView, "sizeThatFits:");
  v17 = v16;
  v19 = v18;
  v20 = UIRectInset(-[TSSIMUnlockDetailView bounds](self, "bounds"));
  v25 = UIRectCenteredYInRect(v20, 0.0, 0.0, v17, v19, v21, v22, v23, v24);
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)_titleLabelHeightForWidth:(double)a3
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 0.0;
  v7 = sub_10000157C();
  v9 = v8;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3 - v10 - v11, 1.79769313e308);
  return v9 + v7 + v12;
}

- (double)_descriptionLabelHeightForWidth:(double)a3
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_descriptionLabel, "text"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 0.0;
  v7 = sub_100001590();
  v9 = v8;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", a3 - v10 - v11, 1.79769313e308);
  return v9 + v7 + v12;
}

- (BOOL)unlocking
{
  return self->_unlocking;
}

- (TSSIMUnlockEntryView)entryView
{
  return self->_entryView;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (int64_t)actionSubtype
{
  return self->_actionSubtype;
}

- (NSString)lockedSIMName
{
  return self->_lockedSIMName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedSIMName, 0);
  objc_storeStrong((id *)&self->_entryView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
