@implementation LUIUserGridViewCell

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
  v5.super_class = (Class)LUIUserGridViewCell;
  -[LUIUserGridViewCell dealloc](&v5, "dealloc");
}

- (LUIUserGridViewCell)initWithCoder:(id)a3
{
  LUIUserGridViewCell *v3;
  LUIUserGridViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIUserGridViewCell;
  v3 = -[LUIUserGridViewCell initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[LUIUserGridViewCell commonInit](v3, "commonInit");
  return v4;
}

- (LUIUserGridViewCell)initWithFrame:(CGRect)a3
{
  LUIUserGridViewCell *v3;
  LUIUserGridViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIUserGridViewCell;
  v3 = -[LUIUserGridViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LUIUserGridViewCell commonInit](v3, "commonInit");
  return v4;
}

- (void)setAvatarAlpha:(double)a3
{
  -[LUIUserAvatarView setImageViewAlpha:](self->avatarView, "setImageViewAlpha:", a3);
}

- (void)commonInit
{
  double y;
  double width;
  double height;
  LUIUserAvatarView *v6;
  LUIUserAvatarView *avatarView;
  UILabel *v8;
  UILabel *mNameLabel;
  UILabel *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  UIActivityIndicatorView *v15;
  UIActivityIndicatorView *spinner;

  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v6 = (LUIUserAvatarView *)objc_claimAutoreleasedReturnValue(+[LUIUserAvatarView avatarViewWithFrame:](LUIUserAvatarView, "avatarViewWithFrame:", CGRectZero.origin.x, y, width, height));
  avatarView = self->avatarView;
  self->avatarView = v6;

  v8 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  mNameLabel = self->mNameLabel;
  self->mNameLabel = v8;

  -[UILabel setLineBreakMode:](self->mNameLabel, "setLineBreakMode:", 4);
  v10 = self->mNameLabel;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "overallTextColor"));
  -[UILabel setTextColor:](v10, "setTextColor:", v12);

  -[UILabel setTextAlignment:](self->mNameLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->mNameLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](self->mNameLabel, "setMinimumScaleFactor:", 0.705882353);
  v13 = objc_alloc((Class)UIActivityIndicatorView);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v15 = (UIActivityIndicatorView *)objc_msgSend(v13, "initWithActivityIndicatorStyle:", objc_msgSend(v14, "activityIndicatorViewStyle"));
  spinner = self->_spinner;
  self->_spinner = v15;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
  -[UIActivityIndicatorView setAlpha:](self->_spinner, "setAlpha:", 1.0);
  -[LUIUserGridViewCell addSubview:](self, "addSubview:", self->avatarView);
  -[LUIUserGridViewCell addSubview:](self, "addSubview:", self->mNameLabel);
  -[LUIUserGridViewCell addSubview:](self, "addSubview:", self->_spinner);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LUIUserGridViewCell;
  -[LUIUserGridViewCell prepareForReuse](&v3, "prepareForReuse");
  -[LUIUserAvatarView setSyncTaskState:animated:](self->avatarView, "setSyncTaskState:animated:", 0, 0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  LUIUserAvatarView *avatarView;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)LUIUserGridViewCell;
  -[LUIUserGridViewCell layoutSubviews](&v20, "layoutSubviews");
  -[LUIUserGridViewCell frame](self, "frame");
  v4 = v3;
  avatarView = self->avatarView;
  -[LUIUserGridViewCell diameterForFrame:](self, "diameterForFrame:");
  -[LUIUserAvatarView setMonogramDiameter:](avatarView, "setMonogramDiameter:");
  -[LUIUserAvatarView sizeToFit](self->avatarView, "sizeToFit");
  -[LUIUserGridViewCell updateName](self, "updateName");
  -[UILabel sizeToFit](self->mNameLabel, "sizeToFit");
  -[LUIUserAvatarView frame](self->avatarView, "frame");
  v7 = v6;
  v9 = (v4 - v8) * 0.5;
  if (v8 >= v4)
    v9 = 0.0;
  -[LUIUserAvatarView setFrame:](self->avatarView, "setFrame:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LUICollectionViewStyle sharedStyle](LUICollectionViewStyle, "sharedStyle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->mNameLabel, "font"));
  objc_msgSend(v10, "spaceBetweenAvatarAndNameForFont:", v11);
  v13 = v7 + 0.0 + v12;

  -[UILabel frame](self->mNameLabel, "frame");
  v15 = v14;
  -[LUIUserGridViewCell frame](self, "frame");
  v17 = v16;
  -[UILabel setFrame:](self->mNameLabel, "setFrame:", 0.0, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell spinner](self, "spinner"));
  objc_msgSend(v18, "frame");

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell spinner](self, "spinner"));
  objc_msgSend(v19, "setFrame:", (v17 - v15) * 0.5, v13 + (v15 - v15) * 0.5, v15, v15);

  -[LUIUserAvatarView layoutSubviews](self->avatarView, "layoutSubviews");
  -[UILabel layoutSubviews](self->mNameLabel, "layoutSubviews");
  -[LUIUserGridViewCell sizeToFit](self, "sizeToFit");
}

- (double)diameterForFrame:(CGRect)a3
{
  double height;
  void *v4;
  id v5;
  double v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  float v11;
  float v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (a3.size.width >= a3.size.height)
    height = a3.size.height;
  else
    height = a3.size.width;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIMonogrammerSupport supportedMonogramDiametersSortedInDescendingOrder](LUIMonogrammerSupport, "supportedMonogramDiametersSortedInDescendingOrder", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v6 = 0.0;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "floatValue");
        if (height >= v11)
        {
          objc_msgSend(v10, "floatValue");
          v6 = v12;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

  return v6;
}

- (void)setAvatarDiameter:(double)a3
{
  -[LUIUserAvatarView setMonogramDiameter:](self->avatarView, "setMonogramDiameter:", a3);
  -[LUIUserGridViewCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setClassID:(id)a3
{
  NSNumber *v5;
  NSNumber *v6;

  v5 = (NSNumber *)a3;
  if (self->_classID != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_classID, a3);
    v5 = v6;
  }

}

- (void)setEnableEnglishLocaleNaming:(BOOL)a3
{
  if (self->_enableEnglishLocaleNaming != a3)
    self->_enableEnglishLocaleNaming = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("imageData"), a4, a5, a6))
    -[LUIUserAvatarView updateMonogram](self->avatarView, "updateMonogram");
}

- (BOOL)_inEnglishLocale
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localeIdentifier"));
  if ((objc_msgSend(v3, "containsString:", CFSTR("en-")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localeIdentifier"));
    v4 = objc_msgSend(v6, "containsString:", CFSTR("en_"));

  }
  return v4;
}

- (id)_nameForEnglishLocaleWithPersonNameComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell userInfo](self, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "namingSimilarityInfoByClassID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", self->_classID));
  v8 = objc_msgSend(v7, "similarity");

  if (v8 == (id)2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "givenName"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "givenName"));
      v11 = -[LUIUserGridViewCell _willNameFit:](self, "_willNameFit:", v10);

      if (v11)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "givenName"));
        goto LABEL_9;
      }
LABEL_8:
      v9 = 0;
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersonNameComponentsFormatter _localizedShortNameForComponents:withStyle:options:](NSPersonNameComponentsFormatter, "_localizedShortNameForComponents:withStyle:options:", v4, 1, 0));
    if (!v9 || !-[LUIUserGridViewCell _willNameFit:](self, "_willNameFit:", v9))
    {

      goto LABEL_8;
    }
  }
LABEL_9:

  return v9;
}

- (BOOL)_willNameFit:(id)a3
{
  LUIUserGridViewCell *v3;
  UILabel *mNameLabel;
  id v5;
  void *v6;

  v3 = self;
  mNameLabel = self->mNameLabel;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](mNameLabel, "font"));
  LOBYTE(v3) = -[LUIUserGridViewCell _willNameFit:forFont:](v3, "_willNameFit:forFont:", v5, v6);

  return (char)v3;
}

- (BOOL)_willNameFit:(id)a3 forFont:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  NSAttributedStringKey v20;
  id v21;
  CGRect v22;

  v20 = NSFontAttributeName;
  v21 = a4;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  objc_msgSend(v7, "sizeWithAttributes:", v8);
  v10 = v9;

  -[UILabel bounds](self->mNameLabel, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v22.origin.x = v12;
  v22.origin.y = v14;
  v22.size.width = v16;
  v22.size.height = v18;
  return v10 <= CGRectGetWidth(v22);
}

- (void)updateName
{
  UILabel *mNameLabel;
  void *v4;
  void *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSPersonNameComponents *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  UILabel *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  unsigned int v37;
  UILabel *v38;
  UILabel *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  mNameLabel = self->mNameLabel;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "overallTextColor"));
  -[UILabel setTextColor:](mNameLabel, "setTextColor:", v5);

  v6 = self->mNameLabel;
  -[LUIUserGridViewCell frame](self, "frame");
  -[UILabel setFrame:](v6, "setFrame:", 0.0, 0.0);
  if (!self->_classID)
  {
    self->_classID = (NSNumber *)&off_10006C938;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell userInfo](self, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "givenName"));
  if (v8)
  {

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell userInfo](self, "userInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "familyName"));

    if (!v10)
    {
      v39 = self->mNameLabel;
      v43 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell userInfo](self, "userInfo"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "displayName"));
      -[UILabel setText:](v39, "setText:", v40);

      return;
    }
  }
  v11 = objc_opt_new(NSPersonNameComponents);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell userInfo](self, "userInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "givenName"));
  -[NSPersonNameComponents setGivenName:](v11, "setGivenName:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell userInfo](self, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "familyName"));
  -[NSPersonNameComponents setFamilyName:](v11, "setFamilyName:", v15);

  if (-[LUIUserGridViewCell _inEnglishLocale](self, "_inEnglishLocale") && self->_enableEnglishLocaleNaming)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell _nameForEnglishLocaleWithPersonNameComponents:](self, "_nameForEnglishLocaleWithPersonNameComponents:", v11));
    if (v16)
    {
      v17 = (void *)v16;
      -[UILabel setText:](self->mNameLabel, "setText:", v16);
LABEL_29:

      goto LABEL_30;
    }
LABEL_23:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->mNameLabel, "font"));
    objc_msgSend(v32, "pointSize");
    v34 = v33;
    -[UILabel minimumScaleFactor](self->mNameLabel, "minimumScaleFactor");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v34 * v35));

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:](NSPersonNameComponentsFormatter, "localizedStringFromPersonNameComponents:style:options:", v11, 1, 0));
    v37 = -[LUIUserGridViewCell _willNameFit:forFont:](self, "_willNameFit:forFont:", v36, v17);
    v38 = self->mNameLabel;
    if (v37)
    {
      -[UILabel setText:](self->mNameLabel, "setText:", v36);
    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell userInfo](self, "userInfo"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "displayName"));
      -[UILabel setText:](v38, "setText:", v42);

    }
    goto LABEL_29;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell userInfo](self, "userInfo"));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "displayName"));
  if (!v19)
  {

LABEL_14:
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v27 = objc_msgSend(&off_10006CC68, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v29)
            objc_enumerationMutation(&off_10006CC68);
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:](NSPersonNameComponentsFormatter, "localizedStringFromPersonNameComponents:style:options:", v11, objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), "integerValue"), 0));
          if (v31 && -[LUIUserGridViewCell _willNameFit:](self, "_willNameFit:", v31))
          {
            -[UILabel setText:](self->mNameLabel, "setText:", v31);

            goto LABEL_30;
          }

        }
        v28 = objc_msgSend(&off_10006CC68, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v28)
          continue;
        break;
      }
    }
    goto LABEL_23;
  }
  v20 = (void *)v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell userInfo](self, "userInfo"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "displayName"));
  v23 = -[LUIUserGridViewCell _willNameFit:](self, "_willNameFit:", v22);

  if (!v23)
    goto LABEL_14;
  v24 = self->mNameLabel;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell userInfo](self, "userInfo"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayName"));
  -[UILabel setText:](v24, "setText:", v26);

LABEL_30:
}

- (void)updateImage
{
  LUIUserAvatarView *avatarView;
  void *v3;
  CNContact *mContact;

  avatarView = self->avatarView;
  mContact = self->mContact;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &mContact, 1));
  -[LUIUserAvatarView setContacts:](avatarView, "setContacts:", v3);

}

- (void)startProgressAnimation
{
  id v3;

  -[UILabel setHidden:](self->mNameLabel, "setHidden:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell spinner](self, "spinner"));
  objc_msgSend(v3, "startAnimating");

}

- (void)stopProgressAnimation
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserGridViewCell spinner](self, "spinner"));
  objc_msgSend(v3, "stopAnimating");

  -[UILabel setHidden:](self->mNameLabel, "setHidden:", 0);
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

  -[LUIUserGridViewCell setNeedsLayout](self, "setNeedsLayout");
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
  -[LUIUserGridViewCell updateImage](self, "updateImage");
}

- (CNContact)contact
{
  return self->mContact;
}

- (double)avatarAlpha
{
  return self->_avatarAlpha;
}

- (NSNumber)classID
{
  return self->_classID;
}

- (BOOL)enableEnglishLocaleNaming
{
  return self->_enableEnglishLocaleNaming;
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
  objc_storeStrong((id *)&self->_classID, 0);
  objc_storeStrong((id *)&self->mContact, 0);
  objc_storeStrong((id *)&self->mUserInfo, 0);
  objc_storeStrong((id *)&self->avatarView, 0);
  objc_storeStrong((id *)&self->mNameLabel, 0);
}

@end
