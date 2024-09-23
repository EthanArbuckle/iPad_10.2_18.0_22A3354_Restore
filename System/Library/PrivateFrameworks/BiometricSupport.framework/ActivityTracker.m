@implementation ActivityTracker

- (ActivityTracker)initWithDescription:(id)a3
{
  id v4;
  ActivityTracker *v5;
  uint64_t v6;
  NSString *description;
  OS_os_transaction *transaction;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ActivityTracker;
  v5 = -[ActivityTracker init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    description = v5->_description;
    v5->_description = (NSString *)v6;

    transaction = v5->_transaction;
    v5->_transaction = 0;

  }
  return v5;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  OS_os_transaction *transaction;
  uint64_t v5;
  OS_os_transaction *v6;
  void (**activityUpdateBlock)(id, uint64_t);
  ActivityTracker *v8;
  void (**v9)(id, _QWORD);
  ActivityTracker *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  transaction = obj->_transaction;
  if (v3)
  {
    if (!transaction)
    {
      -[NSString UTF8String](obj->_description, "UTF8String");
      v5 = os_transaction_create();
      v6 = obj->_transaction;
      obj->_transaction = (OS_os_transaction *)v5;

      activityUpdateBlock = (void (**)(id, uint64_t))obj->_activityUpdateBlock;
      if (activityUpdateBlock)
        activityUpdateBlock[2](activityUpdateBlock, 1);
    }
  }
  else if (transaction)
  {
    v8 = obj;
    v9 = (void (**)(id, _QWORD))obj->_activityUpdateBlock;
    if (v9)
    {
      v9[2](v9, 0);
      v8 = obj;
      transaction = obj->_transaction;
    }
    v8->_transaction = 0;

  }
  objc_sync_exit(obj);

}

- (id)activityUpdateBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setActivityUpdateBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityUpdateBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
