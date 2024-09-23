@implementation CAMControlDrawerMenuItem

- (CAMControlDrawerMenuItem)initWithTitle:(id)a3 value:(id)a4
{
  return -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](self, "initWithTitle:selectedTitle:value:", a3, a3, a4);
}

- (CAMControlDrawerMenuItem)initWithTitle:(id)a3 selectedTitle:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  CAMControlDrawerMenuItem *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *selectedTitle;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CAMControlDrawerMenuItem;
  v11 = -[CAMControlDrawerMenuItem init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    selectedTitle = v11->_selectedTitle;
    v11->_selectedTitle = (NSString *)v14;

    objc_storeStrong((id *)&v11->_value, a5);
  }

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)selectedTitle
{
  return self->_selectedTitle;
}

- (NSNumber)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_selectedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
