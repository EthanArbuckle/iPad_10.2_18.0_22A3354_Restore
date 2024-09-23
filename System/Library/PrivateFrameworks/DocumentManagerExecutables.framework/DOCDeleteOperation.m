@implementation DOCDeleteOperation

- (NSString)actionNameForUndoing
{
  return (NSString *)0;
}

- (id)operationForRedoing
{
  _TtC26DocumentManagerExecutables18DOCDeleteOperation *v2;
  char *v3;

  v2 = self;
  v3 = DOCDeleteOperation.operationForRedoing()();

  return v3;
}

- (id)operationForUndoing
{
  void *v2;
  _TtC26DocumentManagerExecutables18DOCDeleteOperation *v3;
  void *v4;
  id v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables18DOCDeleteOperation_undoManager);
  v3 = self;
  objc_msgSend(v2, sel_setShouldRemoveAllActions_, 1);
  v4 = *(Class *)((char *)&v3->super.super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables18DOCDeleteOperation_originalOperation);
  if (v4)
    v5 = objc_msgSend(v4, sel_operationForRedoing);
  else
    v5 = 0;

  return v5;
}

- (void)registerUndo
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC26DocumentManagerExecutables18DOCDeleteOperation_undoManager), sel_registerUndoOperationForSender_, self);
}

- (_TtC26DocumentManagerExecutables18DOCDeleteOperation)initWithItems:(id)a3
{
  _TtC26DocumentManagerExecutables18DOCDeleteOperation *result;

  result = (_TtC26DocumentManagerExecutables18DOCDeleteOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables18DOCDeleteOperation_undoManager));
}

@end
