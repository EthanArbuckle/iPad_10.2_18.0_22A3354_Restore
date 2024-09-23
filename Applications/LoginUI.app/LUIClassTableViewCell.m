@implementation LUIClassTableViewCell

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell contactByIdentifier](self, "contactByIdentifier"));
  -[LUIClassTableViewCell _removeImageDataObserversFromContacts:](self, "_removeImageDataObserversFromContacts:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell contactByIdentifier](self, "contactByIdentifier"));
  objc_msgSend(v4, "removeAllObjects");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell instructorByIdentifier](self, "instructorByIdentifier"));
  objc_msgSend(v5, "removeAllObjects");

  v6.receiver = self;
  v6.super_class = (Class)LUIClassTableViewCell;
  -[LUIClassTableViewCell dealloc](&v6, "dealloc");
}

- (LUIClassTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  LUIClassTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  LUIUserAvatarView *avatarView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)LUIClassTableViewCell;
  v4 = -[LUIClassTableViewCell initWithStyle:reuseIdentifier:](&v20, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[LUIClassTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[LUIClassTableViewCell setSeparatorViewHidden:](v4, "setSeparatorViewHidden:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell contentView](v4, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell separatorView](v4, "separatorView"));
    objc_msgSend(v6, "addSubview:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell textLabel](v4, "textLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    objc_msgSend(v8, "setFont:", v9);

    v10 = objc_claimAutoreleasedReturnValue(+[LUIUserAvatarView avatarViewWithFrame:](LUIUserAvatarView, "avatarViewWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height));
    avatarView = v4->_avatarView;
    v4->_avatarView = (LUIUserAvatarView *)v10;

    -[LUIUserAvatarView setMonogramDiameter:](v4->_avatarView, "setMonogramDiameter:", 45.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[LUIImageCache sharedInstance](LUIImageCache, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Chevron")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "chevronColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tintedImageFromImage:color:", v13, v15));

    v17 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v16);
    objc_msgSend(v17, "setFrame:", 0.0, 0.0, 15.0, 15.0);
    objc_msgSend(v17, "setContentMode:", 1);
    -[LUIClassTableViewCell setAccessoryView:](v4, "setAccessoryView:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v18, "addSubview:", v4->_avatarView);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  double MaxX;
  double MinX;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double Width;
  double v30;
  void *v31;
  double v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  CGFloat v37;
  double v38;
  double v39;
  objc_super v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v40.receiver = self;
  v40.super_class = (Class)LUIClassTableViewCell;
  -[LUIClassTableViewCell layoutSubviews](&v40, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "frame");
  v39 = v4;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell separatorView](self, "separatorView"));
  objc_msgSend(v7, "frame");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

  if (v9 == (id)1)
  {
    -[LUIClassTableViewCell bounds](self, "bounds");
    v11 = v10 - 45.0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v12, "tableViewContentInset");
    v14 = v11 - v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell accessoryView](self, "accessoryView"));
    objc_msgSend(v15, "frame");
    MaxX = CGRectGetMaxX(v41);
    v42.origin.y = 0.0;
    v37 = v14;
    v42.origin.x = v14;
    v42.size.width = 45.0;
    v42.size.height = 45.0;
    MinX = CGRectGetMinX(v42);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v18, "tableViewContentInset");
    v20 = MinX - v19;

    v21 = MaxX + 15.0;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v22, "tableViewContentInset");
    v24 = v23;

    v43.origin.y = 0.0;
    v43.origin.x = v24;
    v43.size.width = 45.0;
    v43.size.height = 45.0;
    v25 = CGRectGetMaxX(v43);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v26, "tableViewContentInset");
    v28 = v25 + v27;
    -[LUIClassTableViewCell frame](self, "frame");
    Width = CGRectGetWidth(v44);
    v45.origin.y = 0.0;
    v37 = v24;
    v45.origin.x = v24;
    v45.size.width = 45.0;
    v45.size.height = 45.0;
    v30 = CGRectGetMaxX(v45);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    objc_msgSend(v31, "tableViewContentInset");
    v20 = Width - (v30 + v32);

    v21 = v28;
    MaxX = v28;
  }
  -[LUIClassTableViewCell frame](self, "frame", *(_QWORD *)&v37);
  v33 = (CGRectGetHeight(v46) - 45.0) * 0.5;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell avatarView](self, "avatarView"));
  objc_msgSend(v34, "setFrame:", v38, v33, 45.0, 45.0);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v35, "setFrame:", MaxX, v39, v20, v6);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell separatorView](self, "separatorView"));
  objc_msgSend(v36, "setFrame:", v21, v6 + -0.5, v20 + -15.0, 0.5);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("imageData"), a4, a5, a6))
  {
    v7 = (void *)qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
      sub_10003B384(v7, (uint64_t)self);
    -[LUIClassTableViewCell updateImage](self, "updateImage");
  }
}

- (id)_userForObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell instructorByIdentifier](self, "instructorByIdentifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("instructor1_key")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell instructorByIdentifier](self, "instructorByIdentifier"));
  v8 = v7;
  if (v6 == v4)
  {
    v11 = CFSTR("instructor1_key");
LABEL_6:
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v11));

    goto LABEL_7;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("instructor2_key")));

  if (v9 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell instructorByIdentifier](self, "instructorByIdentifier"));
    v8 = v7;
    v11 = CFSTR("instructor2_key");
    goto LABEL_6;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (void)updateName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell classInfo](self, "classInfo"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "className"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell textLabel](self, "textLabel"));
  v5 = v4;
  if (v8)
  {
    objc_msgSend(v4, "setText:", v8);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell textLabel](self, "textLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "overallTextColor"));
    objc_msgSend(v5, "setTextColor:", v7);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CLASS_NAME"), &stru_100069EB8, 0));
    objc_msgSend(v5, "setText:", v7);
  }

}

- (void)setSeparatorViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_isSeparatorViewHidden != a3)
  {
    v3 = a3;
    self->_isSeparatorViewHidden = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell separatorView](self, "separatorView"));
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)updateImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell contactByIdentifier](self, "contactByIdentifier"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("group_image_key")));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell contactByIdentifier](self, "contactByIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("instructor1_key")));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell avatarView](self, "avatarView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell contactByIdentifier](self, "contactByIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("group_image_key")));
      v17[0] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell contactByIdentifier](self, "contactByIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("instructor1_key")));
      v17[1] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
      objc_msgSend(v8, "setContacts:", v13);

      return;
    }
  }
  else
  {

  }
  v16 = (id)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell avatarView](self, "avatarView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell contactByIdentifier](self, "contactByIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allValues"));
  objc_msgSend(v16, "setContacts:", v15);

}

- (void)enableCellForUserInteraction
{
  void *v3;
  id v4;

  -[LUIClassTableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "setAlpha:", 1.0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell avatarView](self, "avatarView"));
  objc_msgSend(v4, "setAlpha:", 1.0);

}

- (void)disableCellForUserInteraction
{
  void *v3;
  id v4;

  -[LUIClassTableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "setAlpha:", 0.3);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell avatarView](self, "avatarView"));
  objc_msgSend(v4, "setAlpha:", 0.3);

}

- (void)setClassInfo:(id)a3
{
  LKClass *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LKClass *v10;

  v5 = (LKClass *)a3;
  if (self->_classInfo != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_classInfo, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell _instructorsInClass:](self, "_instructorsInClass:", self->_classInfo));
    -[LUIClassTableViewCell setInstructorByIdentifier:](self, "setInstructorByIdentifier:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell instructorByIdentifier](self, "instructorByIdentifier"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell instructorByIdentifier](self, "instructorByIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewCell _contactsForInstructors:](self, "_contactsForInstructors:", v8));
      -[LUIClassTableViewCell setContactByIdentifier:](self, "setContactByIdentifier:", v9);

    }
    -[LUIClassTableViewCell updateName](self, "updateName");
    v5 = v10;
  }

}

- (id)_instructorsInClass:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  if (v3)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructors"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructors"));
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructors"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, CFSTR("instructor1_key"));

      }
    }
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructors"));
    if (v11)
    {
      v12 = (void *)v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructors"));
      v14 = objc_msgSend(v13, "count");

      if ((unint64_t)v14 >= 2)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructors"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 1));
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v16, CFSTR("instructor2_key"));

      }
    }
  }

  return v4;
}

- (id)_contactsForInstructors:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  LKUser *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  if (v3)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = objc_msgSend(&off_10006CC80, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(&off_10006CC80);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));

          if (v10 && (v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9))) != 0)
          {
            v12 = (void *)v11;
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContactCache sharedInstance](LUIContactCache, "sharedInstance"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contactForUser:isInstructor:", v12, 1));
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, v9);

          }
          else if (objc_msgSend(v9, "isEqualToString:", CFSTR("instructor1_key")))
          {
            v15 = objc_opt_new(LKUser);
            -[LKUser setUsername:](v15, "setUsername:", CFSTR("silhouette_user"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContactCache sharedInstance](LUIContactCache, "sharedInstance"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contactForUser:isInstructor:", v15, 0));
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v17, v9);

            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(&off_10006CC80, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v6)
          continue;
        break;
      }
    }
  }
LABEL_15:
  if (-[NSMutableDictionary count](v4, "count") == (id)1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContactCache sharedInstance](LUIContactCache, "sharedInstance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contactWithGroupImage"));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v19, CFSTR("group_image_key"));

  }
  return v4;
}

- (void)_addImageDataObserversToContacts:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (a3)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allValues", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "addObserver:forKeyPath:options:context:", self, CFSTR("imageData"), 1, 0);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)_removeImageDataObserversFromContacts:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (a3)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allValues", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "removeObserver:forKeyPath:", self, CFSTR("imageData"));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (UIView)separatorView
{
  UIView *separatorView;
  UIView *v4;
  UIView *v5;
  void *v6;

  separatorView = self->_separatorView;
  if (!separatorView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_separatorView;
    self->_separatorView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.878431373, 0.6));
    -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v6);

    separatorView = self->_separatorView;
  }
  return separatorView;
}

- (void)setContactByIdentifier:(id)a3
{
  NSMutableDictionary *contactByIdentifier;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;

  contactByIdentifier = self->_contactByIdentifier;
  if (contactByIdentifier != a3)
  {
    v5 = a3;
    -[LUIClassTableViewCell _removeImageDataObserversFromContacts:](self, "_removeImageDataObserversFromContacts:", contactByIdentifier);
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v5));

    v7 = self->_contactByIdentifier;
    self->_contactByIdentifier = v6;

    -[LUIClassTableViewCell _addImageDataObserversToContacts:](self, "_addImageDataObserversToContacts:", self->_contactByIdentifier);
    -[LUIClassTableViewCell updateImage](self, "updateImage");
  }
}

- (void)setInstructorByIdentifier:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *instructorByIdentifier;

  if (self->_instructorByIdentifier != a3)
  {
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:"));
    instructorByIdentifier = self->_instructorByIdentifier;
    self->_instructorByIdentifier = v4;

  }
}

- (LKClass)classInfo
{
  return self->_classInfo;
}

- (BOOL)isSeparatorViewHidden
{
  return self->_isSeparatorViewHidden;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (NSMutableDictionary)contactByIdentifier
{
  return self->_contactByIdentifier;
}

- (NSMutableDictionary)instructorByIdentifier
{
  return self->_instructorByIdentifier;
}

- (LUIUserAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_instructorByIdentifier, 0);
  objc_storeStrong((id *)&self->_contactByIdentifier, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_classInfo, 0);
}

@end
