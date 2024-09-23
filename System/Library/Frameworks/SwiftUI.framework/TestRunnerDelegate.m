@implementation TestRunnerDelegate

- (BOOL)testRunner:(id)a3 shouldManagePPTLifetimeEvent:(int64_t)a4 forParamaters:(id)a5
{
  void (*v7)(int64_t);
  id v8;
  _TtC7SwiftUI18TestRunnerDelegate *v9;

  v7 = *(void (**)(int64_t))((char *)&self->super.isa
                                             + OBJC_IVAR____TtC7SwiftUI18TestRunnerDelegate_pptHandler);
  v8 = a3;
  swift_unknownObjectRetain();
  v9 = self;
  v7(a4);

  swift_unknownObjectRelease();
  return 0;
}

- (_TtC7SwiftUI18TestRunnerDelegate)init
{
  _TtC7SwiftUI18TestRunnerDelegate *result;

  result = (_TtC7SwiftUI18TestRunnerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
