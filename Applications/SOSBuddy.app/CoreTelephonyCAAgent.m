@implementation CoreTelephonyCAAgent

- (void)dealloc
{
  _TtC8SOSBuddy20CoreTelephonyCAAgent *v2;

  v2 = self;
  sub_10001742C();
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->_queue[OBJC_IVAR____TtC8SOSBuddy20CoreTelephonyCAAgent__caStateHandler]);
  swift_release(*(_QWORD *)&self->_queue[OBJC_IVAR____TtC8SOSBuddy20CoreTelephonyCAAgent__carrierNameHandler]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8SOSBuddy20CoreTelephonyCAAgent__carrierNames));
}

- (_TtC8SOSBuddy20CoreTelephonyCAAgent)init
{
  _TtC8SOSBuddy20CoreTelephonyCAAgent *result;

  result = (_TtC8SOSBuddy20CoreTelephonyCAAgent *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.CoreTelephonyCAAgent", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)connectionAssistantStateChanged:(id)a3
{
  id v4;
  _TtC8SOSBuddy20CoreTelephonyCAAgent *v5;

  v4 = a3;
  v5 = self;
  sub_1000189EC(v4);

}

@end
