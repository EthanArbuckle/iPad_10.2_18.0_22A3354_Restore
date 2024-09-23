@implementation CNUIUserActionItemList

- (CNUIUserActionItemList)initWithItems:(id)a3 type:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNUIUserActionItemList *v11;
  uint64_t v12;
  NSArray *items;
  uint64_t v14;
  NSString *type;
  uint64_t v16;
  UIImage *icon;
  CNUIUserActionItemList *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNUIUserActionItemList;
  v11 = -[CNUIUserActionItemList init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    items = v11->_items;
    v11->_items = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    type = v11->_type;
    v11->_type = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    icon = v11->_icon;
    v11->_icon = (UIImage *)v16;

    v18 = v11;
  }

  return v11;
}

- (NSString)type
{
  return self->_type;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
