@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC11FinanceStub11AppDelegate *v11;
  char v12;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = sub_1000078E4(v10);
  _Block_release(v8);

  return v12 & 1;
}

- (_TtC11FinanceStub11AppDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v3, "init");
}

@end
