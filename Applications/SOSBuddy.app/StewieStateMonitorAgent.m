@implementation StewieStateMonitorAgent

- (void)dealloc
{
  _TtC8SOSBuddy23StewieStateMonitorAgent *v2;

  v2 = self;
  sub_100118644();
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->queue[OBJC_IVAR____TtC8SOSBuddy23StewieStateMonitorAgent_handler]);
}

- (void)stateChanged:(id)a3
{
  id v4;
  _TtC8SOSBuddy23StewieStateMonitorAgent *v5;

  v4 = a3;
  v5 = self;
  sub_1001188AC(v4);

}

- (_TtC8SOSBuddy23StewieStateMonitorAgent)init
{
  _TtC8SOSBuddy23StewieStateMonitorAgent *result;

  result = (_TtC8SOSBuddy23StewieStateMonitorAgent *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.StewieStateMonitorAgent", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
