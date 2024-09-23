@implementation DOCRenameOperation

- (NSString)actionNameForUndoing
{
  _TtC26DocumentManagerExecutables18DOCRenameOperation *v2;
  NSString *result;
  NSString *v4;
  void *v5;

  v2 = self;
  result = (NSString *)(id)_DocumentManagerBundle();
  if (result)
  {
    v4 = result;
    sub_21EB02168();

    v5 = (void *)sub_21EB02B58();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)operationForRedoing
{
  _TtC26DocumentManagerExecutables18DOCRenameOperation *v2;
  char *v3;

  v2 = self;
  v3 = DOCRenameOperation.operationForRedoing()();

  return v3;
}

- (id)operationForUndoing
{
  _TtC26DocumentManagerExecutables18DOCRenameOperation *v2;
  char *v3;

  v2 = self;
  v3 = DOCRenameOperation.operationForUndoing()();

  return v3;
}

- (void)registerUndo
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC26DocumentManagerExecutables18DOCRenameOperation_undoManager), sel_registerUndoOperationForSender_, self);
}

- (_TtC26DocumentManagerExecutables18DOCRenameOperation)initWithItem:(id)a3 newName:(id)a4
{
  sub_21EA860E8((uint64_t)self, (uint64_t)a2, a3);
}

- (_TtC26DocumentManagerExecutables18DOCRenameOperation)initWithItem:(id)a3 newFileName:(id)a4
{
  sub_21EA860E8((uint64_t)self, (uint64_t)a2, a3);
}

- (_TtC26DocumentManagerExecutables18DOCRenameOperation)initWithItem:(id)a3 newDisplayName:(id)a4
{
  sub_21EA860E8((uint64_t)self, (uint64_t)a2, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables18DOCRenameOperation_item));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables18DOCRenameOperation_undoManager));
}

@end
