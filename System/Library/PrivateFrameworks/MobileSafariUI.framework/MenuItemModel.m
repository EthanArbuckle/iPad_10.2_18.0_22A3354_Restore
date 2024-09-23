@implementation MenuItemModel

- (MenuItemModel)initWithTitle:(id)a3 subtitle:(id)a4 payload:(id)a5 action:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MenuItemModel *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSString *subtitle;
  uint64_t v19;
  id action;
  MenuItemModel *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MenuItemModel;
  v14 = -[MenuItemModel init](&v23, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    subtitle = v14->_subtitle;
    v14->_subtitle = (NSString *)v17;

    objc_storeStrong(&v14->_payload, a5);
    v19 = objc_msgSend(v13, "copy");
    action = v14->_action;
    v14->_action = (id)v19;

    v21 = v14;
  }

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (id)payload
{
  return self->_payload;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong(&self->_payload, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
