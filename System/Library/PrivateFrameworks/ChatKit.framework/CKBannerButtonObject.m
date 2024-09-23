@implementation CKBannerButtonObject

- (CKBannerButtonObject)initWithTitle:(id)a3 handler:(id)a4 menuItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKBannerButtonObject *v11;
  CKBannerButtonObject *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKBannerButtonObject;
  v11 = -[CKBannerButtonObject init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[CKBannerButtonObject setTitle:](v11, "setTitle:", v8);
    -[CKBannerButtonObject setHandler:](v12, "setHandler:", v9);
    -[CKBannerButtonObject setMenuItems:](v12, "setMenuItems:", v10);
  }

  return v12;
}

- (CKBannerButtonObject)initWithTitle:(id)a3 handler:(id)a4
{
  return -[CKBannerButtonObject initWithTitle:handler:menuItems:](self, "initWithTitle:handler:menuItems:", a3, a4, 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_menuItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
