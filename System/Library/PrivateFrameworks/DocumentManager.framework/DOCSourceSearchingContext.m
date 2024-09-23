@implementation DOCSourceSearchingContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_monitoringContext, 0);
}

- (id)monitoringContext
{
  return objc_getProperty(self, a2, 8, 1);
}

- (DOCSourceSearchingContext)initWithMonitoringContext:(id)a3
{
  id v5;
  DOCSourceSearchingContext *v6;
  DOCSourceSearchingContext *v7;
  DOCSourceSearchingContext *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DOCSourceSearchingContext;
  v6 = -[DOCSourceSearchingContext init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_monitoringContext, a3);
    v8 = v7;
  }

  return v7;
}

- (void)setMonitoringContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

@end
