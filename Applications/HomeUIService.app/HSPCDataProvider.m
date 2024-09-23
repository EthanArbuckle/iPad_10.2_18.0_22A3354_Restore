@implementation HSPCDataProvider

- (HSPCDataProvider)initWithCoordinator:(id)a3 configuration:(id)a4
{
  id v6;
  HSPCDataProvider *v7;
  HSPCDataProvider *v8;
  NSArray *items;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HSPCDataProvider;
  v7 = -[HSPCDataProvider init](&v11, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_config, a4);
    items = v8->_items;
    v8->_items = (NSArray *)&__NSArray0__struct;

  }
  return v8;
}

- (id)userFacingStringForItem:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (id)loadData
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (unint64_t)initialRowIndex
{
  return self->_initialRowIndex;
}

- (void)setInitialRowIndex:(unint64_t)a3
{
  self->_initialRowIndex = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HSSetupStateMachineConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
