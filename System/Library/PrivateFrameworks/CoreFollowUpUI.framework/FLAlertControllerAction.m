@implementation FLAlertControllerAction

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v7;
  id v8;
  FLAlertControllerAction *v9;

  v7 = a5;
  v8 = a3;
  v9 = objc_alloc_init(FLAlertControllerAction);
  -[FLAlertControllerAction setTitle:](v9, "setTitle:", v8);

  -[FLAlertControllerAction setStyle:](v9, "setStyle:", a4);
  -[FLAlertControllerAction setHandler:](v9, "setHandler:", v7);

  return v9;
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
