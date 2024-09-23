@implementation CNContactTargetActionWrapper

- (CNContactTargetActionWrapper)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  CNContactTargetActionWrapper *v7;
  CNContactTargetActionWrapper *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactTargetActionWrapper;
  v7 = -[CNContactTargetActionWrapper init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    v8->_action = a4;
  }

  return v8;
}

- (void)performActionWithSender:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNContactTargetActionWrapper target](self, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactTargetActionWrapper action](self, "action");
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactTargetActionWrapper target](self, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, -[CNContactTargetActionWrapper action](self, "action"), v7);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactTargetActionWrapper target](self, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("target"), v4);

  v6 = (id)objc_msgSend(v3, "appendName:selector:", CFSTR("action"), -[CNContactTargetActionWrapper action](self, "action"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

@end
