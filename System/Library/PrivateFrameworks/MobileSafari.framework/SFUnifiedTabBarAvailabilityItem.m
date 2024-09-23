@implementation SFUnifiedTabBarAvailabilityItem

- (SFUnifiedTabBarAvailabilityItem)initWithTitle:(id)a3
{
  return -[SFUnifiedTabBarAvailabilityItem initWithTitle:image:buttonType:action:](self, "initWithTitle:image:buttonType:action:", a3, 0, 15, 0);
}

- (SFUnifiedTabBarAvailabilityItem)initWithTitle:(id)a3 image:(id)a4 buttonType:(int64_t)a5 action:(id)a6
{
  id v10;
  id v11;
  id v12;
  SFUnifiedTabBarAvailabilityItem *v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  id action;
  SFUnifiedTabBarAvailabilityItem *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SFUnifiedTabBarAvailabilityItem;
  v13 = -[SFUnifiedTabBarAvailabilityItem init](&v20, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v14;

    objc_storeStrong((id *)&v13->_image, a4);
    v13->_buttonType = a5;
    v16 = objc_msgSend(v12, "copy");
    action = v13->_action;
    v13->_action = (id)v16;

    v18 = v13;
  }

  return v13;
}

- (void)performAction
{
  void (**action)(void);

  action = (void (**)(void))self->_action;
  if (action)
    action[2]();
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
