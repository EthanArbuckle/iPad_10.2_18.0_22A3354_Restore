@implementation IdentityServicesAgent

- (void)dealloc
{
  _TtC8SOSBuddy21IdentityServicesAgent *v2;

  v2 = self;
  sub_100202A70();
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->_callback[OBJC_IVAR____TtC8SOSBuddy21IdentityServicesAgent__callback]);

}

- (_TtC8SOSBuddy21IdentityServicesAgent)init
{
  _TtC8SOSBuddy21IdentityServicesAgent *result;

  result = (_TtC8SOSBuddy21IdentityServicesAgent *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.IdentityServicesAgent", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6
{
  id v10;
  id v11;
  _TtC8SOSBuddy21IdentityServicesAgent *v12;

  v10 = a3;
  v11 = a6;
  v12 = self;
  sub_100204FB4(a4, a5);

}

@end
