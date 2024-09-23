@implementation AMSDialogButton

- (AMSDialogButton)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  AMSDialogButton *v10;
  AMSDialogButton *v11;
  void *v12;
  id handler;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSDialogButton;
  v10 = -[AMSDialogButton init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_title, a3);
    v12 = _Block_copy(v9);
    handler = v11->_handler;
    v11->_handler = v12;

    v11->_style = 0;
  }

  return v11;
}

+ (id)buttonWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v7;
  id v8;
  AMSDialogButton *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[AMSDialogButton initWithTitle:style:handler:]([AMSDialogButton alloc], "initWithTitle:style:handler:", v8, a4, v7);

  return v9;
}

+ (id)buttonWithTitle:(id)a3 handler:(id)a4
{
  return (id)objc_msgSend(a1, "buttonWithTitle:style:handler:", a3, 0, a4);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
