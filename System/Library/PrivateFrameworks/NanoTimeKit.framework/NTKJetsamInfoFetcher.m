@implementation NTKJetsamInfoFetcher

- (BOOL)getInfo:(jetsam_info *)a3
{
  void *v5;

  +[_NTKSharedJetsamInfo sharedJetsamInfo](_NTKSharedJetsamInfo, "sharedJetsamInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "getInfoFor:into:", self, a3);

  return (char)a3;
}

- (BOOL)resetInterval
{
  void *v3;

  +[_NTKSharedJetsamInfo sharedJetsamInfo](_NTKSharedJetsamInfo, "sharedJetsamInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "resetIntervalFor:", self);

  return (char)self;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[_NTKSharedJetsamInfo sharedJetsamInfo](_NTKSharedJetsamInfo, "sharedJetsamInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregister:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKJetsamInfoFetcher;
  -[NTKJetsamInfoFetcher dealloc](&v4, sel_dealloc);
}

@end
