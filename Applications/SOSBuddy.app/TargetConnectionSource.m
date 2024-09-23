@implementation TargetConnectionSource

- (_TtC8SOSBuddy22TargetConnectionSource)init
{
  return (_TtC8SOSBuddy22TargetConnectionSource *)sub_1000EDBF4();
}

- (void)dealloc
{
  _TtC8SOSBuddy22TargetConnectionSource *v2;

  v2 = self;
  sub_1000EDECC();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8SOSBuddy22TargetConnectionSource_connectionDidChange));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8SOSBuddy22TargetConnectionSource_carrierNameDidChange));

  sub_100007FF0((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy22TargetConnectionSource__lastStateForwarded, &qword_10031FA70);
}

@end
