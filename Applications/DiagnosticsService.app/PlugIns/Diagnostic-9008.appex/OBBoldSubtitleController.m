@implementation OBBoldSubtitleController

- (OBBoldSubtitleController)initWithTitle:(id)a3 subtitle:(id)a4 detailText:(id)a5 icon:(id)a6
{
  id v10;
  OBBoldSubtitleController *v11;
  OBBoldSubtitleController *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)OBBoldSubtitleController;
  v11 = -[OBBoldSubtitleController initWithTitle:detailText:icon:](&v16, "initWithTitle:detailText:icon:", a3, a5, a6);
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OBBoldSubtitleController navigationItem](v11, "navigationItem"));
    objc_msgSend(v13, "setHidesBackButton:", 1);

    -[OBBoldSubtitleController setScrollingDisabled:](v12, "setScrollingDisabled:", 0);
    if (v10)
    {
      -[OBBoldSubtitleController setSubtitleText:](v12, "setSubtitleText:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OBBoldSubtitleController headerView](v12, "headerView"));
      objc_msgSend(v14, "setSubtitleText:", v10);

    }
  }

  return v12;
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OBBoldSubtitleController;
  -[OBBoldSubtitleController viewIsAppearing:](&v11, "viewIsAppearing:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OBBoldSubtitleController subtitleText](self, "subtitleText"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OBBoldSubtitleController subtitleText](self, "subtitleText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OBBoldSubtitleController headerView](self, "headerView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OBBoldSubtitleController _findLabelWithText:inView:](self, "_findLabelWithText:inView:", v5, v6));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "font"));
      objc_msgSend(v8, "pointSize");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
      objc_msgSend(v7, "setFont:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      objc_msgSend(v7, "setTextColor:", v10);

    }
  }
}

- (id)_findLabelWithText:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "subviews"));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(UILabel);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "text"));
          v15 = objc_msgSend(v14, "isEqualToString:", v6);

          if ((v15 & 1) != 0)
            goto LABEL_14;

        }
        v16 = objc_claimAutoreleasedReturnValue(-[OBBoldSubtitleController _findLabelWithText:inView:](self, "_findLabelWithText:inView:", v6, v11));
        if (v16)
        {
          v13 = (id)v16;
          goto LABEL_14;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleText, 0);
}

@end
