@implementation MFCardAction

+ (id)cardActionWithTitle:(id)a3 shortTitle:(id)a4 imageName:(id)a5 tintColor:(id)a6 handler:(id)a7
{
  objc_msgSend(a1, "cardActionWithTitle:shortTitle:imageName:tintColor:handlerEnabled:handler:", a3, a4, a5, a6, 1, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)cardActionWithTitle:(id)a3 shortTitle:(id)a4 imageName:(id)a5 tintColor:(id)a6 handlerEnabled:(BOOL)a7 handler:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = objc_alloc_init((Class)a1);
  objc_msgSend(v19, "setTitle:", v14);
  if (v15)
    v20 = v15;
  else
    v20 = v14;
  objc_msgSend(v19, "setShortTitle:", v20);
  objc_msgSend(v19, "setImageName:", v16);
  objc_msgSend(v19, "setTintColor:", v17);
  objc_msgSend(v19, "setHandler:", v18);
  objc_msgSend(v19, "setHandlerEnabled:", v9);

  return v19;
}

- (void)executeHandlerIfEnabled
{
  if (-[MFCardAction handlerEnabled](self, "handlerEnabled"))
    -[MFCardAction executeHandler](self, "executeHandler");
}

- (void)executeHandler
{
  void (**v3)(id, MFCardAction *);

  -[MFCardAction handler](self, "handler");
  v3 = (void (**)(id, MFCardAction *))objc_claimAutoreleasedReturnValue();
  if (v3)
    v3[2](v3, self);

}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)accessibilityIdentifer
{
  return self->_accessibilityIdentifer;
}

- (void)setAccessibilityIdentifer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)shortTitle
{
  return self->_shortTitle;
}

- (void)setShortTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)handlerEnabled
{
  return self->_handlerEnabled;
}

- (void)setHandlerEnabled:(BOOL)a3
{
  self->_handlerEnabled = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)shouldDismissCardBeforeExecuteHandler
{
  return self->_shouldDismissCardBeforeExecuteHandler;
}

- (void)setShouldDismissCardBeforeExecuteHandler:(BOOL)a3
{
  self->_shouldDismissCardBeforeExecuteHandler = a3;
}

- (BOOL)shouldDeferDismissHandler
{
  return self->_shouldDeferDismissHandler;
}

- (void)setShouldDeferDismissHandler:(BOOL)a3
{
  self->_shouldDeferDismissHandler = a3;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_shortTitle, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
