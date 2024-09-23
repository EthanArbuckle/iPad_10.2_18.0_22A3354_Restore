@implementation Plugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v11;
  id v12;
  id v13;
  _TtC37LockdownModeAccountNotificationPlugin6Plugin *v14;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_232BF4318(a3, a4, a6);

}

- (_TtC37LockdownModeAccountNotificationPlugin6Plugin)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Plugin();
  return -[Plugin init](&v3, sel_init);
}

@end
