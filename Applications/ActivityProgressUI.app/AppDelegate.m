@implementation AppDelegate

- (_TtC18ActivityProgressUI11AppDelegate)init
{
  uint64_t v2;
  uint64_t v3;
  _TtC18ActivityProgressUI11AppDelegate *v4;
  void *v5;
  id v6;
  objc_super v8;

  v2 = OBJC_IVAR____TtC18ActivityProgressUI11AppDelegate_backgroundActivitySessionsController;
  v3 = qword_10004ED08;
  v4 = self;
  if (v3 != -1)
    swift_once(&qword_10004ED08, sub_100018C5C);
  v5 = (void *)qword_100050B18;
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_100050B18;
  v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v8, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI11AppDelegate_backgroundActivitySessionsController));
}

@end
