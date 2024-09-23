@implementation HMDManagedObjectContext

- (void)performBlock:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  HMDManagedObjectContext *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __40__HMDManagedObjectContext_performBlock___block_invoke;
  v5[3] = &unk_24E79C2B8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)HMDManagedObjectContext;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[HMDManagedObjectContext performBlock:](&v4, sel_performBlock_, v5);

}

- (void)performBlockAndWait:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  HMDManagedObjectContext *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __47__HMDManagedObjectContext_performBlockAndWait___block_invoke;
  v5[3] = &unk_24E79C2B8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)HMDManagedObjectContext;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[HMDManagedObjectContext performBlockAndWait:](&v4, sel_performBlockAndWait_, v5);

}

- (BOOL)save:(id *)a3
{
  objc_super v6;

  -[NSManagedObjectContext hmd_logPendingChangesWithReason:](self, "hmd_logPendingChangesWithReason:", CFSTR("preparing to save"));
  v6.receiver = self;
  v6.super_class = (Class)HMDManagedObjectContext;
  return -[HMDManagedObjectContext save:](&v6, sel_save_, a3);
}

uint64_t __47__HMDManagedObjectContext_performBlockAndWait___block_invoke(uint64_t a1)
{
  _HMFThreadLocalAsyncContextPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return _HMFThreadLocalAsyncContextPop();
}

uint64_t __40__HMDManagedObjectContext_performBlock___block_invoke(uint64_t a1)
{
  _HMFThreadLocalAsyncContextPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return _HMFThreadLocalAsyncContextPop();
}

@end
