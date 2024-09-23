@implementation DTAssertionManager

+ (void)defaultAssertionFactories:(id *)a3 andDisableKeys:(id *)a4
{
  if (qword_25576FBD0 == -1)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_25576FBD0, &unk_24EB27970);
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease((id)qword_25576FBD8);
LABEL_4:
  if (a4)
    *a4 = objc_retainAutorelease((id)qword_25576FBE0);
}

+ (id)sharedInstance
{
  if (qword_25576FBE8 != -1)
    dispatch_once(&qword_25576FBE8, &unk_24EB2A758);
  return (id)qword_25576FBF0;
}

- (DTAssertionManager)init
{
  id v3;
  id v4;
  DTAssertionManager *v5;
  id v7;
  id v8;

  v7 = 0;
  v8 = 0;
  +[DTAssertionManager defaultAssertionFactories:andDisableKeys:](DTAssertionManager, "defaultAssertionFactories:andDisableKeys:", &v8, &v7);
  v3 = v8;
  v4 = v7;
  v5 = -[DTAssertionManager initWithAssertionFactories:andDisableKeys:](self, "initWithAssertionFactories:andDisableKeys:", v3, v4);

  return v5;
}

- (DTAssertionManager)initWithAssertionFactories:(id)a3 andDisableKeys:(id)a4
{
  id v6;
  id v7;
  DTAssertionManager *v8;
  uint64_t v9;
  NSArray *assertionFactories;
  uint64_t v11;
  NSArray *disableKeys;
  dispatch_queue_t v13;
  OS_dispatch_queue *guard;
  uint64_t v15;
  NSMutableDictionary *pidInfosByPid;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DTAssertionManager;
  v8 = -[DTAssertionManager init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    assertionFactories = v8->_assertionFactories;
    v8->_assertionFactories = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    disableKeys = v8->_disableKeys;
    v8->_disableKeys = (NSArray *)v11;

    v13 = dispatch_queue_create("DTAssertionManager", 0);
    guard = v8->_guard;
    v8->_guard = (OS_dispatch_queue *)v13;

    v15 = objc_opt_new();
    pidInfosByPid = v8->_pidInfosByPid;
    v8->_pidInfosByPid = (NSMutableDictionary *)v15;

  }
  return v8;
}

- (void)takeAssertionsForPid:(int)a3 onBehalfOfClient:(id)a4 withOptions:(id)a5
{
  id v8;
  NSObject *guard;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  int v14;

  v10 = a4;
  v8 = a5;
  if (v10)
  {
    guard = self->_guard;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B80798;
    block[3] = &unk_24EB29800;
    v14 = a3;
    block[4] = self;
    v12 = v10;
    v13 = v8;
    dispatch_sync(guard, block);

  }
}

- (void)removeAssertionsForPid:(int)a3 onBehalfOfClient:(id)a4
{
  id v6;
  NSObject *guard;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  if (v6)
  {
    guard = self->_guard;
    block[1] = 3221225472;
    block[2] = sub_222B80C04;
    block[3] = &unk_24EB297D8;
    v11 = a3;
    block[4] = self;
    v8 = v6;
    block[0] = MEMORY[0x24BDAC760];
    v10 = v6;
    dispatch_sync(guard, block);

    v6 = v8;
  }

}

- (void)removeClaimsHeldByClient:(id)a3
{
  id v4;
  NSObject *guard;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    guard = self->_guard;
    block[1] = 3221225472;
    block[2] = sub_222B80D18;
    block[3] = &unk_24EB28350;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    dispatch_sync(guard, block);

    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidInfosByPid, 0);
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong((id *)&self->_disableKeys, 0);
  objc_storeStrong((id *)&self->_assertionFactories, 0);
}

@end
