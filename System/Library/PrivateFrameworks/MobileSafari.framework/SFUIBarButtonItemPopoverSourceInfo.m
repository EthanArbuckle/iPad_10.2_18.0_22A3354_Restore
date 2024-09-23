@implementation SFUIBarButtonItemPopoverSourceInfo

- (SFUIBarButtonItemPopoverSourceInfo)initWithItem:(id)a3
{
  id v5;
  SFUIBarButtonItemPopoverSourceInfo *v6;
  SFUIBarButtonItemPopoverSourceInfo *v7;
  SFUIBarButtonItemPopoverSourceInfo *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFUIBarButtonItemPopoverSourceInfo;
  v6 = -[SFUIBarButtonItemPopoverSourceInfo init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; item = %@>"), v5, self, self->_item);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
