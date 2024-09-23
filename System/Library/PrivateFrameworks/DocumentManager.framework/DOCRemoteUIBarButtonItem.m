@implementation DOCRemoteUIBarButtonItem

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[DOCRemoteUIBarButtonItem uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DOCRemoteUIBarButtonItem *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DOCRemoteUIBarButtonItem *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = [DOCRemoteUIBarButtonItem alloc];
  v6 = -[DOCRemoteUIBarButtonItem style](self, "style");
  -[DOCRemoteUIBarButtonItem title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);

  -[DOCRemoteUIBarButtonItem image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCRemoteUIBarButtonItem landscapeImagePhone](self, "landscapeImagePhone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[DOCRemoteUIBarButtonItem isSystemItem](self, "isSystemItem"))
  {
    if (v8)
    {
      v12 = -[DOCRemoteUIBarButtonItem initWithTitle:style:target:action:](v5, "initWithTitle:style:target:action:", v8, v6, 0, 0);
    }
    else if (v9 && v10)
    {
      v12 = -[DOCRemoteUIBarButtonItem initWithImage:landscapeImagePhone:style:target:action:](v5, "initWithImage:landscapeImagePhone:style:target:action:", v9, v10, v6, 0, 0);
    }
    else
    {
      if (!v9)
        goto LABEL_11;
      v12 = -[DOCRemoteUIBarButtonItem initWithImage:style:target:action:](v5, "initWithImage:style:target:action:", v9, v6, 0, 0);
    }
    v5 = (DOCRemoteUIBarButtonItem *)v12;
    goto LABEL_11;
  }
  v11 = v5;
  v5 = -[DOCRemoteUIBarButtonItem initWithBarButtonSystemItem:target:action:](v11, "initWithBarButtonSystemItem:target:action:", -[DOCRemoteUIBarButtonItem systemItem](self, "systemItem"), 0, 0);

LABEL_11:
  -[DOCRemoteUIBarButtonItem uuid](self, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  -[DOCRemoteUIBarButtonItem setUuid:](v5, "setUuid:", v14);

  -[DOCRemoteUIBarButtonItem target](self, "target");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCRemoteUIBarButtonItem setTarget:](v5, "setTarget:", v15);

  -[DOCRemoteUIBarButtonItem setAction:](v5, "setAction:", -[DOCRemoteUIBarButtonItem action](self, "action"));
  -[DOCRemoteUIBarButtonItem setEnabled:](v5, "setEnabled:", -[DOCRemoteUIBarButtonItem isEnabled](self, "isEnabled"));
  -[DOCRemoteUIBarButtonItem possibleTitles](self, "possibleTitles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  -[DOCRemoteUIBarButtonItem setPossibleTitles:](v5, "setPossibleTitles:", v17);

  -[DOCRemoteUIBarButtonItem width](self, "width");
  -[DOCRemoteUIBarButtonItem setWidth:](v5, "setWidth:");
  -[DOCRemoteUIBarButtonItem imageInsets](self, "imageInsets");
  -[DOCRemoteUIBarButtonItem setImageInsets:](v5, "setImageInsets:");
  -[DOCRemoteUIBarButtonItem landscapeImagePhoneInsets](self, "landscapeImagePhoneInsets");
  -[DOCRemoteUIBarButtonItem setLandscapeImagePhoneInsets:](v5, "setLandscapeImagePhoneInsets:");
  -[DOCRemoteUIBarButtonItem accessibilityLabel](self, "accessibilityLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCRemoteUIBarButtonItem setAccessibilityLabel:](v5, "setAccessibilityLabel:", v18);

  -[DOCRemoteUIBarButtonItem accessibilityHint](self, "accessibilityHint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCRemoteUIBarButtonItem setAccessibilityHint:](v5, "setAccessibilityHint:", v19);

  -[DOCRemoteUIBarButtonItem menuRepresentation](self, "menuRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCRemoteUIBarButtonItem setMenuRepresentation:](v5, "setMenuRepresentation:", v20);

  +[DOCRemoteUIBarButtonItemRegistry shared](DOCRemoteUIBarButtonItemRegistry, "shared");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerInstance:", v5);

  return v5;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 400, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
