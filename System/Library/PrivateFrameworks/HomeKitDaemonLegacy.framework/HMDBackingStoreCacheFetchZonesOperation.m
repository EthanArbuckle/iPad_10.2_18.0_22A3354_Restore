@implementation HMDBackingStoreCacheFetchZonesOperation

- (HMDBackingStoreCacheFetchZonesOperation)initWithFetchResult:(id)a3
{
  id v4;
  HMDBackingStoreCacheFetchZonesOperation *v5;
  void *v6;
  id fetchResult;
  HMDBackingStoreCacheFetchZonesOperation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDBackingStoreCacheFetchZonesOperation;
  v5 = -[HMDBackingStoreOperation init](&v10, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    fetchResult = v5->_fetchResult;
    v5->_fetchResult = v6;

    v8 = v5;
  }

  return v5;
}

- (id)mainReturningError
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;

  -[HMDBackingStoreCacheFetchZonesOperation fetchResult](self, "fetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDBackingStoreCacheFetchZonesOperation fetchResult](self, "fetchResult");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreOperation store](self, "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "local");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v4)[2](v4, v7, 0);

  }
  return 0;
}

- (id)fetchResult
{
  return self->_fetchResult;
}

- (void)setFetchResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchResult, 0);
}

@end
