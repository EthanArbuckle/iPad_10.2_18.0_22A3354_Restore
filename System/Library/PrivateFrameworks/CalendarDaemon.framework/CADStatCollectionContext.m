@implementation CADStatCollectionContext

- (CADStatCollectionContext)initWithDatabase:(CalDatabase *)a3 accountStore:(id)a4
{
  id v7;
  CADStatCollectionContext *v8;
  objc_super v10;

  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CADStatCollectionContext;
  v8 = -[CADStatCollectionContext init](&v10, sel_init);
  if (v8)
  {
    v8->_database = (CalDatabase *)CFRetain(a3);
    objc_storeStrong((id *)&v8->_accountStore, a4);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_database);
  v3.receiver = self;
  v3.super_class = (Class)CADStatCollectionContext;
  -[CADStatCollectionContext dealloc](&v3, sel_dealloc);
}

- (CalDatabase)database
{
  CalDatabase *result;
  NSObject *v4;
  uint8_t v5[16];

  result = self->_database;
  if (!result)
  {
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEBUG, "Creating database for stats collection", v5, 2u);
    }
    result = (CalDatabase *)CalDatabaseCreateWithOptions();
    self->_database = result;
  }
  return result;
}

- (ACAccountStore)accountStore
{
  ACAccountStore *accountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (void)setDatabase:(CalDatabase *)a3
{
  self->_database = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
