@implementation BCAlertActionItem

- (BCAlertActionItem)initWithTitle:(id)a3 subTitle:(id)a4 iconName:(id)a5 actionType:(unint64_t)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BCAlertActionItem *v17;
  BCAlertActionItem *v18;
  id v19;
  id handler;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BCAlertActionItem;
  v17 = -[BCAlertActionItem init](&v22, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_subTitle, a4);
    objc_storeStrong((id *)&v18->_iconName, a5);
    v18->_actionType = a6;
    v19 = objc_retainBlock(v16);
    handler = v18->_handler;
    v18->_handler = v19;

  }
  return v18;
}

- (UIImage)icon
{
  void *v3;
  id v4;
  unint64_t v5;
  UIImage *v6;
  UIImage *v7;
  UIImage *v8;
  UIImage *icon;

  if (!self->_icon)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCAlertActionItem iconName](self, "iconName"));
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      v5 = -[BCAlertActionItem actionType](self, "actionType");
      v6 = (UIImage *)objc_claimAutoreleasedReturnValue(-[BCAlertActionItem iconName](self, "iconName"));
      v7 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v6));
      v8 = v7;
      if (v5 == 2)
      {

        v7 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIImage imageWithRenderingMode:](v8, "imageWithRenderingMode:", 2));
      }
      else
      {
        v8 = v6;
      }
      icon = self->_icon;
      self->_icon = v7;

    }
  }
  return self->_icon;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
