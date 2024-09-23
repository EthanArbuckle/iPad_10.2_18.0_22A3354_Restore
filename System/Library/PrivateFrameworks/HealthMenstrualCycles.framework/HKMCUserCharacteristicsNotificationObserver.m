@implementation HKMCUserCharacteristicsNotificationObserver

- (HKMCUserCharacteristicsNotificationObserver)initWithQueue:(id)a3 completion:(id)a4
{
  NSObject *v6;
  id v7;
  HKMCUserCharacteristicsNotificationObserver *v8;
  const char *v9;
  _QWORD handler[4];
  id v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKMCUserCharacteristicsNotificationObserver;
  v8 = -[HKMCUserCharacteristicsNotificationObserver init](&v13, sel_init);
  if (v8)
  {
    v9 = (const char *)*MEMORY[0x24BDD46E8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __72__HKMCUserCharacteristicsNotificationObserver_initWithQueue_completion___block_invoke;
    handler[3] = &unk_24D99D608;
    v12 = v7;
    notify_register_dispatch(v9, &v8->_characteristicUpdateToken, v6, handler);

  }
  return v8;
}

uint64_t __72__HKMCUserCharacteristicsNotificationObserver_initWithQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_characteristicUpdateToken))
    notify_cancel(self->_characteristicUpdateToken);
  v3.receiver = self;
  v3.super_class = (Class)HKMCUserCharacteristicsNotificationObserver;
  -[HKMCUserCharacteristicsNotificationObserver dealloc](&v3, sel_dealloc);
}

@end
