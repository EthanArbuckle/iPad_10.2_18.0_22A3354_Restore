@implementation FMItemBTConnectionManager

- (void)dealloc
{
  void *v3;
  _TtC11FMFindingUI25FMItemBTConnectionManager *v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_name_object_, v4, *MEMORY[0x24BEBE008], 0);

  v6 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_name_object_, v4, *MEMORY[0x24BEBDF98], 0);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for FMItemBTConnectionManager();
  -[FMConnectionManager dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)applicationWillEnterForeground
{
  sub_23A9C5628(self, (uint64_t)a2, "FMItemBTConnectionManager: applicationWillEnterForeground", (void (*)(void))sub_23A9C52E0);
}

- (void)applicationDidEnterBackground
{
  sub_23A9C5628(self, (uint64_t)a2, "FMItemBTConnectionManager: applicationDidEnterBackground", (void (*)(void))sub_23A9C531C);
}

@end
