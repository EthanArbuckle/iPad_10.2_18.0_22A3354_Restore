@implementation UnpairSessionAccessoryController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  uint64_t v7;
  UnpairSessionAccessoryController *v8;
  uint64_t v9;

  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRetain(a4, v7);
  v8 = self;
  if (objc_msgSend(a4, "respondsToSelector:", "unpairSessionAccessoryOnTestCompletion"))
  {
    v9 = *(_QWORD *)&v8->DKDiagnosticController_opaque[OBJC_IVAR___UnpairSessionAccessoryController_accessoryResponder];
    *(_QWORD *)&v8->DKDiagnosticController_opaque[OBJC_IVAR___UnpairSessionAccessoryController_accessoryResponder] = a4;

    swift_unknownObjectRelease(v9);
  }
  else
  {
    swift_unknownObjectRelease(a4);

  }
  swift_unknownObjectRelease(a3);
}

- (void)start
{
  uint64_t v2;
  UnpairSessionAccessoryController *v3;

  v3 = self;
  sub_100003744((uint64_t)v3, v2);

}

- (UnpairSessionAccessoryController)init
{
  objc_super v3;

  *(_QWORD *)&self->DKDiagnosticController_opaque[OBJC_IVAR___UnpairSessionAccessoryController_accessoryResponder] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UnpairSessionAccessoryController();
  return -[UnpairSessionAccessoryController init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)&self->DKDiagnosticController_opaque[OBJC_IVAR___UnpairSessionAccessoryController_accessoryResponder]);
}

@end
