@implementation DDUIAction

- (void)dd_performAction
{
  void *v3;
  void (**v4)(id, DDUIAction *);

  -[DDUIAction dd_handler](self, "dd_handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DDUIAction dd_handler](self, "dd_handler");
    v4 = (void (**)(id, DDUIAction *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);

  }
}

- (void)dd_performActionWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[DDUIAction dd_action](self, "dd_action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateSourceRect:", x, y, width, height);

  -[DDUIAction dd_performAction](self, "dd_performAction");
}

- (DDAction)dd_action
{
  return self->_dd_action;
}

- (void)setDd_action:(id)a3
{
  objc_storeStrong((id *)&self->_dd_action, a3);
}

- (id)dd_handler
{
  return self->_dd_handler;
}

- (void)setDd_handler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dd_handler, 0);
  objc_storeStrong((id *)&self->_dd_action, 0);
}

@end
