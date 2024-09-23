@implementation DefaultSubjectMonitorRegistry

- (id)addMonitor:(id)a3
{
  _TtC13AppProtection29DefaultSubjectMonitorRegistry *v5;
  id v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_236289064((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (id)addMonitor:(id)a3 subjectMask:(unint64_t)a4
{
  _TtC13AppProtection29DefaultSubjectMonitorRegistry *v7;
  id v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_2362891B0((uint64_t)a3, a4);
  swift_unknownObjectRelease();

  return v8;
}

- (id)addMonitor:(id)a3 subjectMask:(unint64_t)a4 subscriptionOptions:(unint64_t)a5
{
  char v5;
  _TtC13AppProtection29DefaultSubjectMonitorRegistry *v9;
  id v10;

  v5 = a5;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_236289304((uint64_t)a3, a4, v5);
  swift_unknownObjectRelease();

  return v10;
}

- (_TtC13AppProtection29DefaultSubjectMonitorRegistry)init
{
  _TtC13AppProtection29DefaultSubjectMonitorRegistry *result;

  result = (_TtC13AppProtection29DefaultSubjectMonitorRegistry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
