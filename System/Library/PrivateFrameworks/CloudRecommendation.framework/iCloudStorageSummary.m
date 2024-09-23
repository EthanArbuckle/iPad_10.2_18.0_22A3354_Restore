@implementation iCloudStorageSummary

- (iCloudStorageSummary)initWithStorageSummary:(id)a3
{
  id v4;
  iCloudStorageSummary *v5;
  uint64_t v6;
  NSNumber *totalStorage;
  uint64_t v8;
  NSNumber *usedStorage;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)iCloudStorageSummary;
  v5 = -[iCloudStorageSummary init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "totalStorage");
    v6 = objc_claimAutoreleasedReturnValue();
    totalStorage = v5->_totalStorage;
    v5->_totalStorage = (NSNumber *)v6;

    objc_msgSend(v4, "usedStorage");
    v8 = objc_claimAutoreleasedReturnValue();
    usedStorage = v5->_usedStorage;
    v5->_usedStorage = (NSNumber *)v8;

    objc_msgSend(v4, "subscriptionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isiCloudPlusSubscriber = objc_msgSend(v10, "isiCloudPlusSubscriber");

  }
  return v5;
}

- (NSNumber)totalStorage
{
  return self->_totalStorage;
}

- (void)setTotalStorage:(id)a3
{
  objc_storeStrong((id *)&self->_totalStorage, a3);
}

- (NSNumber)usedStorage
{
  return self->_usedStorage;
}

- (void)setUsedStorage:(id)a3
{
  objc_storeStrong((id *)&self->_usedStorage, a3);
}

- (BOOL)isiCloudPlusSubscriber
{
  return self->_isiCloudPlusSubscriber;
}

- (void)setIsiCloudPlusSubscriber:(BOOL)a3
{
  self->_isiCloudPlusSubscriber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedStorage, 0);
  objc_storeStrong((id *)&self->_totalStorage, 0);
}

@end
