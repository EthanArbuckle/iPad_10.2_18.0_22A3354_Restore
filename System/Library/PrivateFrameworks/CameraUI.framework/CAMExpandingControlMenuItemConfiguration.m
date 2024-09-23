@implementation CAMExpandingControlMenuItemConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = -[CAMExpandingControlMenuItemConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  CAMExpandingControlMenuItemConfiguration *v4;
  CAMExpandingControlMenuItemConfiguration *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = (CAMExpandingControlMenuItemConfiguration *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (v4 == self)
  {
    v12 = 1;
    goto LABEL_11;
  }
  v6 = -[CAMExpandingControlMenuItemConfiguration slashesTitle](self, "slashesTitle");
  if (v6 == -[CAMExpandingControlMenuItemConfiguration slashesTitle](v5, "slashesTitle")
    && (v7 = -[CAMExpandingControlMenuItemConfiguration hidden](self, "hidden"),
        v7 == -[CAMExpandingControlMenuItemConfiguration hidden](v5, "hidden"))
    && (v8 = -[CAMExpandingControlMenuItemConfiguration tintsTitle](self, "tintsTitle"),
        v8 == -[CAMExpandingControlMenuItemConfiguration tintsTitle](v5, "tintsTitle"))
    && (v9 = -[CAMExpandingControlMenuItemConfiguration titleBorder](self, "titleBorder"),
        v9 == -[CAMExpandingControlMenuItemConfiguration titleBorder](v5, "titleBorder")))
  {
    -[CAMExpandingControlMenuItemConfiguration axHUDSymbolName](self, "axHUDSymbolName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExpandingControlMenuItemConfiguration axHUDSymbolName](v5, "axHUDSymbolName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {
      -[CAMExpandingControlMenuItemConfiguration axHUDSymbolConfiguration](self, "axHUDSymbolConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMExpandingControlMenuItemConfiguration axHUDSymbolConfiguration](v5, "axHUDSymbolConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {
        v12 = 1;
      }
      else
      {
        -[CAMExpandingControlMenuItemConfiguration axHUDSymbolConfiguration](self, "axHUDSymbolConfiguration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMExpandingControlMenuItemConfiguration axHUDSymbolConfiguration](v5, "axHUDSymbolConfiguration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v16, "isEqualToConfiguration:", v17);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
LABEL_9:
    v12 = 0;
  }
LABEL_11:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CAMExpandingControlMenuItemConfiguration *v4;
  void *v5;
  void *v6;

  v4 = -[CAMExpandingControlMenuItemConfiguration init](+[CAMExpandingControlMenuItemConfiguration allocWithZone:](CAMExpandingControlMenuItemConfiguration, "allocWithZone:", a3), "init");
  -[CAMExpandingControlMenuItemConfiguration setSlashesTitle:](v4, "setSlashesTitle:", -[CAMExpandingControlMenuItemConfiguration slashesTitle](self, "slashesTitle"));
  -[CAMExpandingControlMenuItemConfiguration setTintsTitle:](v4, "setTintsTitle:", -[CAMExpandingControlMenuItemConfiguration tintsTitle](self, "tintsTitle"));
  -[CAMExpandingControlMenuItemConfiguration setTitleBorder:](v4, "setTitleBorder:", -[CAMExpandingControlMenuItemConfiguration titleBorder](self, "titleBorder"));
  -[CAMExpandingControlMenuItemConfiguration setHidden:](v4, "setHidden:", -[CAMExpandingControlMenuItemConfiguration hidden](self, "hidden"));
  -[CAMExpandingControlMenuItemConfiguration axHUDSymbolName](self, "axHUDSymbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControlMenuItemConfiguration setAxHUDSymbolName:](v4, "setAxHUDSymbolName:", v5);

  -[CAMExpandingControlMenuItemConfiguration axHUDSymbolConfiguration](self, "axHUDSymbolConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControlMenuItemConfiguration setAxHUDSymbolConfiguration:](v4, "setAxHUDSymbolConfiguration:", v6);

  return v4;
}

- (BOOL)tintsTitle
{
  return self->_tintsTitle;
}

- (void)setTintsTitle:(BOOL)a3
{
  self->_tintsTitle = a3;
}

- (BOOL)slashesTitle
{
  return self->_slashesTitle;
}

- (void)setSlashesTitle:(BOOL)a3
{
  self->_slashesTitle = a3;
}

- (int64_t)titleBorder
{
  return self->_titleBorder;
}

- (void)setTitleBorder:(int64_t)a3
{
  self->_titleBorder = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSString)axHUDSymbolName
{
  return self->_axHUDSymbolName;
}

- (void)setAxHUDSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_axHUDSymbolName, a3);
}

- (UIImageSymbolConfiguration)axHUDSymbolConfiguration
{
  return self->_axHUDSymbolConfiguration;
}

- (void)setAxHUDSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_axHUDSymbolConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axHUDSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_axHUDSymbolName, 0);
}

@end
