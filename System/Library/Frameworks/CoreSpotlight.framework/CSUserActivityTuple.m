@implementation CSUserActivityTuple

- (CSUserActivityTuple)initWithAction:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  CSUserActivityTuple *v9;
  CSUserActivityTuple *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSUserActivityTuple;
  v9 = -[CSUserActivityTuple init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    objc_storeStrong((id *)&v10->_item, a4);
  }

  return v10;
}

- (id)searchableItem
{
  return self->_item;
}

- (void)updateWithItem:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[CSUserAction updateWithUserAction:](self->_action, "updateWithUserAction:", v4);
    v4 = v5;
  }

}

- (CSUserAction)action
{
  return (CSUserAction *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (id)description
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@:%p; %@ %@>"),
                                           objc_opt_class(),
                                           self,
                                           self->_action,
                                           self->_item));
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CSSearchableItem)item
{
  return (CSSearchableItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)protectionClass
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProtectionClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
