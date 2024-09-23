@implementation MXPredictedRoutesForSystemMusic

- (MXPredictedRoutesForSystemMusic)init
{
  MXPredictedRoutesForSystemMusic *v2;
  MXPredictedRoutesForSystemMusic *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXPredictedRoutesForSystemMusic;
  v2 = -[MXPredictedRoutesForSystemMusic init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_userInitiatedAppBundleID = 0;
    v2->_routeUUIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_userInitiatedAppBundleID = 0;
  self->_routeUUIDs = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXPredictedRoutesForSystemMusic;
  -[MXPredictedRoutesForSystemMusic dealloc](&v3, sel_dealloc);
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (NSString)userInitiatedAppBundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserInitiatedAppBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)routeUUIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRouteUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
