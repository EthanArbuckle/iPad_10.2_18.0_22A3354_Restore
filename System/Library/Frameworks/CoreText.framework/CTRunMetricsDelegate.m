@implementation CTRunMetricsDelegate

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTRunMetricsDelegate;
  -[CTRunMetricsDelegate dealloc](&v3, sel_dealloc);
}

- (id)beginClusterModificationHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setBeginClusterModificationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)clusterModificationHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setClusterModificationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)endClusterModificationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setEndClusterModificationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
