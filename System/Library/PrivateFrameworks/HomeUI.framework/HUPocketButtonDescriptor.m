@implementation HUPocketButtonDescriptor

+ (id)descriptorWithTitle:(id)a3 style:(unint64_t)a4 target:(id)a5 action:(SEL)a6 userInfo:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;

  v11 = a7;
  v12 = a5;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setTitle:", v13);

  objc_msgSend(v14, "setStyle:", a4);
  objc_msgSend(v14, "setTarget:", v12);

  objc_msgSend(v14, "setAction:", a6);
  objc_msgSend(v14, "setUserInfo:", v11);

  return v14;
}

+ (id)descriptorWithTitle:(id)a3 style:(unint64_t)a4 userInfo:(id)a5 block:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setTitle:", v11);

  objc_msgSend(v12, "setStyle:", a4);
  objc_msgSend(v12, "setBlock:", v9);

  objc_msgSend(v12, "setUserInfo:", v10);
  return v12;
}

- (UIColor)textColor
{
  void *v2;

  v2 = -[HUPocketButtonDescriptor style](self, "style");
  if (v2 == (void *)1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v2;
}

- (UIColor)backgroundColor
{
  void *v2;

  if (-[HUPocketButtonDescriptor style](self, "style") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (UIColor *)v2;
}

- (void)execute
{
  void *v3;
  void (**v4)(id, HUPocketButtonDescriptor *);

  -[HUPocketButtonDescriptor block](self, "block");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUPocketButtonDescriptor block](self, "block");
    v4 = (void (**)(id, HUPocketButtonDescriptor *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);
  }
  else
  {
    -[HUPocketButtonDescriptor target](self, "target");
    v4 = (void (**)(id, HUPocketButtonDescriptor *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performSelector:withObject:", -[HUPocketButtonDescriptor action](self, "action"), self);
  }

}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSCopying)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
