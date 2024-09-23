@implementation MFPopupButtonItem

+ (id)itemWithTitle:(id)a3
{
  objc_msgSend(a1, "itemWithTitle:popupTitle:subtitle:style:", a3, a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)itemWithTitle:(id)a3 style:(int64_t)a4
{
  objc_msgSend(a1, "itemWithTitle:popupTitle:subtitle:style:", a3, a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)itemWithTitle:(id)a3 popupTitle:(id)a4 subtitle:(id)a5 style:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  MFPopupButtonItem *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MFPopupButtonItem);
  v13 = (void *)objc_msgSend(v9, "copy");
  -[MFPopupButtonItem setTitle:](v12, "setTitle:", v13);

  v14 = (void *)objc_msgSend(v10, "copy");
  -[MFPopupButtonItem setPopupTitle:](v12, "setPopupTitle:", v14);

  v15 = (void *)objc_msgSend(v11, "copy");
  -[MFPopupButtonItem setSubtitle:](v12, "setSubtitle:", v15);

  -[MFPopupButtonItem setStyle:](v12, "setStyle:", a6);
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  int64_t v14;
  void *v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[MFPopupButtonItem title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqualToString:", v8))
    {
      v13 = 0;
LABEL_14:

      goto LABEL_15;
    }
    -[MFPopupButtonItem popupTitle](self, "popupTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "popupTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", v10))
    {
      v13 = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[MFPopupButtonItem subtitle](self, "subtitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12
      || (-[MFPopupButtonItem subtitle](self, "subtitle"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "subtitle"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "isEqualToString:", v3)))
    {
      v14 = -[MFPopupButtonItem style](self, "style");
      v13 = v14 == objc_msgSend(v6, "style");
      if (v11 == v12)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_12;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (id)copy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MFPopupButtonItem title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPopupButtonItem popupTitle](self, "popupTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPopupButtonItem subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFPopupButtonItem itemWithTitle:popupTitle:subtitle:style:](MFPopupButtonItem, "itemWithTitle:popupTitle:subtitle:style:", v3, v4, v5, -[MFPopupButtonItem style](self, "style"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)popupTitle
{
  return self->_popupTitle;
}

- (void)setPopupTitle:(id)a3
{
  objc_storeStrong((id *)&self->_popupTitle, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_popupTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
