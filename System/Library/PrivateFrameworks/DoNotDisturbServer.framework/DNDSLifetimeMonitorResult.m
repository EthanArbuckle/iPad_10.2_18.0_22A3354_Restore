@implementation DNDSLifetimeMonitorResult

- (DNDSLifetimeMonitorResult)initWithActiveUUIDs:(id)a3 expiredUUIDs:(id)a4
{
  id v6;
  id v7;
  DNDSLifetimeMonitorResult *v8;
  uint64_t v9;
  NSArray *activeUUIDs;
  uint64_t v11;
  NSArray *expiredUUIDs;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSLifetimeMonitorResult;
  v8 = -[DNDSLifetimeMonitorResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    activeUUIDs = v8->_activeUUIDs;
    v8->_activeUUIDs = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    expiredUUIDs = v8->_expiredUUIDs;
    v8->_expiredUUIDs = (NSArray *)v11;

  }
  return v8;
}

- (NSArray)activeUUIDs
{
  return self->_activeUUIDs;
}

- (NSArray)expiredUUIDs
{
  return self->_expiredUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiredUUIDs, 0);
  objc_storeStrong((id *)&self->_activeUUIDs, 0);
}

@end
