@implementation UserAlertPresenterController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  UserAlertPresenterController *v7;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100001EF4((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

}

- (void)start
{
  UserAlertPresenterController *v2;

  v2 = self;
  sub_100002144();

}

- (UserAlertPresenterController)init
{
  objc_super v3;

  *(_QWORD *)&self->DKDiagnosticController_opaque[OBJC_IVAR___UserAlertPresenterController_inputs] = 0;
  *(_QWORD *)&self->DKDiagnosticController_opaque[OBJC_IVAR___UserAlertPresenterController_responder] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UserAlertPresenterController();
  return -[UserAlertPresenterController init](&v3, "init");
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(_QWORD *)&self->DKDiagnosticController_opaque[OBJC_IVAR___UserAlertPresenterController_responder]);
}

@end
