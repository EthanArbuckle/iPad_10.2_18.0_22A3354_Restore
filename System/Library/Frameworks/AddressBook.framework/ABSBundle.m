@implementation ABSBundle

- (ABSBundle)initWithBackingBundle:(id)a3
{
  id v5;
  ABSBundle *v6;
  ABSBundle *v7;
  ABSBundle *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ABSBundle;
  v6 = -[ABSBundle init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingBundle, a3);
    v8 = v7;
  }

  return v7;
}

- (ABSBundle)init
{
  void *v3;
  ABSBundle *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ABSBundle initWithBackingBundle:](self, "initWithBackingBundle:", v3);

  return v4;
}

- (Class)classNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("ABAssistantManager")) & 1) != 0)
  {
    objc_opt_class();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ABSBundle backingBundle](self, "backingBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classNamed:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (Class)v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  if (sel_isEqual(sel_classNamed_, a3))
  {
    v7.receiver = self;
    v7.super_class = (Class)ABSBundle;
    -[ABSBundle forwardingTargetForSelector:](&v7, sel_forwardingTargetForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ABSBundle backingBundle](self, "backingBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  char v4;

  -[ABSBundle backingBundle](self, "backingBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (NSBundle)backingBundle
{
  return self->_backingBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingBundle, 0);
}

@end
