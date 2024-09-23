@implementation CBSUIAlertAction

- (CBSUIAlertAction)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v9;
  id v10;
  CBSUIAlertAction *v11;
  CBSUIAlertAction *v12;
  uint64_t v13;
  id handler;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CBSUIAlertAction;
  v11 = -[CBSUIAlertAction init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    v12->_style = a4;
    v13 = MEMORY[0x2348A1388](v10);
    handler = v12->_handler;
    v12->_handler = (id)v13;

  }
  return v12;
}

+ (id)alertActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:style:handler:", v9, a4, v8);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBSUIAlertAction)initWithCoder:(id)a3
{
  id v4;
  CBSUIAlertAction *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  id handler;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CBSUIAlertAction;
  v5 = -[CBSUIAlertAction init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    handler = v5->_handler;
    v5->_style = v8;
    v5->_handler = &__block_literal_global_0;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CBSUIAlertAction title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("title"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[CBSUIAlertAction style](self, "style"), CFSTR("style"));
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
