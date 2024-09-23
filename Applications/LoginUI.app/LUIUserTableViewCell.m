@implementation LUIUserTableViewCell

- (void)dealloc
{
  LKUser *mUserInfo;
  CNContact *mContact;
  objc_super v5;

  -[CNContact removeObserver:forKeyPath:](self->mContact, "removeObserver:forKeyPath:", self, CFSTR("imageData"));
  mUserInfo = self->mUserInfo;
  self->mUserInfo = 0;

  mContact = self->mContact;
  self->mContact = 0;

  v5.receiver = self;
  v5.super_class = (Class)LUIUserTableViewCell;
  -[LUIUserTableViewCell dealloc](&v5, "dealloc");
}

- (LUIUserTableViewCell)initWithCoder:(id)a3
{
  LUIUserTableViewCell *v3;
  LUIUserTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIUserTableViewCell;
  v3 = -[LUIUserTableViewCell initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[LUIUserTableViewCell commonInit](v3, "commonInit");
  return v4;
}

- (LUIUserTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  LUIUserTableViewCell *v4;
  LUIUserTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LUIUserTableViewCell;
  v4 = -[LUIUserTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[LUIUserTableViewCell commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double y;
  double width;
  double height;
  UIView *v14;
  UIView *separatorView;
  void *v16;
  id v17;
  void *v18;
  UIActivityIndicatorView *v19;
  UIActivityIndicatorView *spinner;
  void *v21;
  LUIUserAvatarView *v22;
  LUIUserAvatarView *avatarView;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[LUIUserTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell textLabel](self, "textLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "overallTextColor"));
  objc_msgSend(v4, "setTextColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v7, "setLineBreakMode:", 4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell textLabel](self, "textLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v8, "setFont:", v9);

  v10 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v14 = (UIView *)objc_msgSend(v10, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  separatorView = self->_separatorView;
  self->_separatorView = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.878431373, 0.6));
  -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v16);

  -[LUIUserTableViewCell setSeparatorViewHidden:](self, "setSeparatorViewHidden:", 1);
  v17 = objc_alloc((Class)UIActivityIndicatorView);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v19 = (UIActivityIndicatorView *)objc_msgSend(v17, "initWithActivityIndicatorStyle:", objc_msgSend(v18, "activityIndicatorViewStyle"));
  spinner = self->_spinner;
  self->_spinner = v19;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
  -[UIActivityIndicatorView setAlpha:](self->_spinner, "setAlpha:", 1.0);
  -[LUIUserTableViewCell setAccessoryView:](self, "setAccessoryView:", self->_spinner);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell contentView](self, "contentView"));
  objc_msgSend(v21, "addSubview:", self->_separatorView);

  v22 = (LUIUserAvatarView *)objc_claimAutoreleasedReturnValue(+[LUIUserAvatarView avatarViewWithFrame:](LUIUserAvatarView, "avatarViewWithFrame:", CGRectZero.origin.x, y, width, height));
  avatarView = self->avatarView;
  self->avatarView = v22;

  -[LUIUserAvatarView setMonogramDiameter:](self->avatarView, "setMonogramDiameter:", 45.0);
  v24 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell contentView](self, "contentView"));
  objc_msgSend(v24, "addSubview:", self->avatarView);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUIUserTableViewCell;
  -[LUIUserTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[LUIUserAvatarView setSyncTaskState:animated:](self->avatarView, "setSyncTaskState:animated:", 0, 0);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  double MaxX;
  double MinX;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v32.receiver = self;
  v32.super_class = (Class)LUIUserTableViewCell;
  -[LUIUserTableViewCell layoutSubviews](&v32, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "frame");
  v31 = v4;
  v6 = v5;

  -[UIView frame](self->_separatorView, "frame");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = objc_msgSend(v7, "userInterfaceLayoutDirection");

  if (v8 == (id)1)
  {
    -[LUIUserTableViewCell bounds](self, "bounds");
    v10 = v9 - 45.0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell accessoryView](self, "accessoryView"));
    objc_msgSend(v11, "frame");
    MaxX = CGRectGetMaxX(v33);
    v34.origin.y = 0.0;
    v34.origin.x = v10;
    v34.size.width = 45.0;
    v34.size.height = 45.0;
    MinX = CGRectGetMinX(v34);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v14, "tableViewContentInset");
    v16 = MinX - v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell accessoryView](self, "accessoryView"));
    objc_msgSend(v17, "frame");
    v18 = v16 - CGRectGetMaxX(v35);

    v19 = MaxX + -15.0;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v20, "tableViewContentInset");
    v10 = v21;

    v36.origin.y = 0.0;
    v36.origin.x = v10;
    v36.size.width = 45.0;
    v36.size.height = 45.0;
    v22 = CGRectGetMaxX(v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v23, "tableViewContentInset");
    v19 = v22 + v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell accessoryView](self, "accessoryView"));
    objc_msgSend(v25, "frame");
    v26 = CGRectGetMinX(v37);
    v38.origin.y = 0.0;
    v38.origin.x = v10;
    v38.size.width = 45.0;
    v38.size.height = 45.0;
    v27 = CGRectGetMaxX(v38);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v28, "tableViewContentInset");
    v18 = v26 - (v27 + v29);

    MaxX = v19;
  }
  -[LUIUserTableViewCell frame](self, "frame");
  -[LUIUserAvatarView setFrame:](self->avatarView, "setFrame:", v10, (CGRectGetHeight(v39) - 45.0) * 0.5, 45.0, 45.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v30, "setFrame:", MaxX, v31, v18, v6);

  -[UIView setFrame:](self->_separatorView, "setFrame:", v19, v6 + -0.5, v18 + 15.0, 0.5);
  -[LUIUserTableViewCell updateName](self, "updateName");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("imageData"), a4, a5, a6))
  {
    v7 = (void *)qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
      sub_10003B29C(v7, self);
    -[LUIUserTableViewCell updateImage](self, "updateImage");
  }
}

- (BOOL)_willNameFit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSAttributedStringKey v12;
  void *v13;
  CGRect v14;

  v12 = NSFontAttributeName;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell textLabel](self, "textLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "font"));
  v13 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_msgSend(v4, "sizeWithAttributes:", v7);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v10, "bounds");
  LOBYTE(self) = v9 <= CGRectGetWidth(v14);

  return (char)self;
}

- (void)updateName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSPersonNameComponents *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell textLabel](self, "textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "overallTextColor"));
  objc_msgSend(v3, "setTextColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell userInfo](self, "userInfo"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell userInfo](self, "userInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
    v11 = -[LUIUserTableViewCell _willNameFit:](self, "_willNameFit:", v10);

    if (v11)
      goto LABEL_18;
  }
  else
  {

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell userInfo](self, "userInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "givenName"));
  if (v13)
  {

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell userInfo](self, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "familyName"));

    if (!v15)
    {
LABEL_18:
      v30 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell textLabel](self, "textLabel"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell userInfo](self, "userInfo"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "displayName"));
      objc_msgSend(v30, "setText:", v29);

      return;
    }
  }
  v16 = objc_opt_new(NSPersonNameComponents);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell userInfo](self, "userInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "givenName"));
  -[NSPersonNameComponents setGivenName:](v16, "setGivenName:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell userInfo](self, "userInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "familyName"));
  -[NSPersonNameComponents setFamilyName:](v16, "setFamilyName:", v20);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = objc_msgSend(&off_10006CC50, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    while (2)
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(&off_10006CC50);
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:](NSPersonNameComponentsFormatter, "localizedStringFromPersonNameComponents:style:options:", v16, objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v24), "integerValue"), 0));
        if (v25 && -[LUIUserTableViewCell _willNameFit:](self, "_willNameFit:", v25))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell textLabel](self, "textLabel"));
          objc_msgSend(v26, "setText:", v25);
          goto LABEL_20;
        }

        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      v22 = objc_msgSend(&off_10006CC50, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v22)
        continue;
      break;
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell textLabel](self, "textLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell userInfo](self, "userInfo"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "displayName"));
  objc_msgSend(v25, "setText:", v27);

LABEL_20:
}

- (void)updateImage
{
  LUIUserAvatarView *avatarView;
  void *v4;
  CNContact *mContact;

  avatarView = self->avatarView;
  mContact = self->mContact;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &mContact, 1));
  -[LUIUserAvatarView setContacts:](avatarView, "setContacts:", v4);

  -[LUIUserTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateCell
{
  -[LUIUserTableViewCell updateName](self, "updateName");
  -[LUIUserTableViewCell updateImage](self, "updateImage");
}

- (void)setUserInfo:(id)a3
{
  LKUser **p_mUserInfo;
  id v6;
  void *v7;
  void *v8;

  p_mUserInfo = &self->mUserInfo;
  objc_storeStrong((id *)&self->mUserInfo, a3);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LUISyncTaskMonitor sharedInstance](LUISyncTaskMonitor, "sharedInstance"));
  objc_msgSend(v7, "removeSyncTaskPresenter:", self->avatarView);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LUISyncTaskMonitor sharedInstance](LUISyncTaskMonitor, "sharedInstance"));
  objc_msgSend(v8, "addSyncTaskPresenter:forUser:", self->avatarView, *p_mUserInfo);

  -[LUIUserTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSeparatorViewHidden:(BOOL)a3
{
  if (self->_isSeparatorViewHidden != a3)
  {
    self->_isSeparatorViewHidden = a3;
    -[UIView setHidden:](self->_separatorView, "setHidden:");
    -[LUIUserTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (LKUser)userInfo
{
  return self->mUserInfo;
}

- (void)setContact:(id)a3
{
  CNContact *v4;
  CNContact *mContact;
  CNContact *v6;

  v4 = (CNContact *)a3;
  -[CNContact removeObserver:forKeyPath:](self->mContact, "removeObserver:forKeyPath:", self, CFSTR("imageData"));
  mContact = self->mContact;
  self->mContact = v4;
  v6 = v4;

  -[CNContact addObserver:forKeyPath:options:context:](self->mContact, "addObserver:forKeyPath:options:context:", self, CFSTR("imageData"), 1, 0);
  -[LUIUserTableViewCell updateImage](self, "updateImage");
}

- (CNContact)contact
{
  return self->mContact;
}

- (void)startProgressAnimation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell spinner](self, "spinner"));
  objc_msgSend(v2, "startAnimating");

}

- (void)stopProgressAnimation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserTableViewCell spinner](self, "spinner"));
  objc_msgSend(v2, "stopAnimating");

}

- (BOOL)isSeparatorViewHidden
{
  return self->_isSeparatorViewHidden;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->avatarView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->mContact, 0);
  objc_storeStrong((id *)&self->mUserInfo, 0);
}

@end
