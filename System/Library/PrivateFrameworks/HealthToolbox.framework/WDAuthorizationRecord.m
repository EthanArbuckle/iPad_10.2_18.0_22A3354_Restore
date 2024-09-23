@implementation WDAuthorizationRecord

- (WDAuthorizationRecord)initWithInternalAuthorizationRecord:(id)a3
{
  id v5;
  WDAuthorizationRecord *v6;
  WDAuthorizationRecord *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDAuthorizationRecord;
  v6 = -[WDAuthorizationRecord init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalAuthorizationRecord, a3);
    v7->_status = objc_msgSend(v5, "status");
  }

  return v7;
}

- (WDAuthorizationRecord)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (BOOL)requestedSharing
{
  return -[_HKAuthorizationRecord requestedSharing](self->_internalAuthorizationRecord, "requestedSharing");
}

- (BOOL)requestedReading
{
  return -[_HKAuthorizationRecord requestedReading](self->_internalAuthorizationRecord, "requestedReading");
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAuthorizationRecord, 0);
}

@end
