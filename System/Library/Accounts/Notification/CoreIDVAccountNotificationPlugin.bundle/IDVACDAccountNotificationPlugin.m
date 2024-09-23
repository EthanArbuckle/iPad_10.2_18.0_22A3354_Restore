@implementation IDVACDAccountNotificationPlugin

- (_TtC32CoreIDVAccountNotificationPlugin31IDVACDAccountNotificationPlugin)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IDVACDAccountNotificationPlugin();
  return -[IDVACDAccountNotificationPlugin init](&v3, sel_init);
}

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v11;
  id v12;
  id v13;
  _TtC32CoreIDVAccountNotificationPlugin31IDVACDAccountNotificationPlugin *v14;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = self;
  LOBYTE(a6) = sub_230EF99C8(a3, a4, a6);

  return a6 & 1;
}

@end
