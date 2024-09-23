@implementation MSVSystemDialogTextField

- (MSVSystemDialogTextField)initWithTitle:(id)a3
{
  id v4;
  MSVSystemDialogTextField *v5;
  uint64_t v6;
  NSString *title;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSVSystemDialogTextField;
  v5 = -[MSVSystemDialogTextField init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_secure = 0;
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)textFieldWithTitle:(id)a3
{
  id v3;
  MSVSystemDialogTextField *v4;

  v3 = a3;
  v4 = -[MSVSystemDialogTextField initWithTitle:]([MSVSystemDialogTextField alloc], "initWithTitle:", v3);

  return v4;
}

+ (id)textFieldWithTitle:(id)a3 secure:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  MSVSystemDialogTextField *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[MSVSystemDialogTextField initWithTitle:]([MSVSystemDialogTextField alloc], "initWithTitle:", v5);

  -[MSVSystemDialogTextField setSecure:](v6, "setSecure:", v4);
  return v6;
}

@end
