@implementation DOCCreateFolderOperation

- (NSString)actionNameForUndoing
{
  _TtC26DocumentManagerExecutables24DOCCreateFolderOperation *v2;
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
  _TtC26DocumentManagerExecutables24DOCCreateFolderOperation *v2;
  char *v3;

  v2 = self;
  v3 = DOCCreateFolderOperation.operationForRedoing()();

  return v3;
}

- (id)operationForUndoing
{
  _TtC26DocumentManagerExecutables24DOCCreateFolderOperation *v2;
  char *v3;

  v2 = self;
  v3 = DOCCreateFolderOperation.operationForUndoing()();

  return v3;
}

- (void)registerUndo
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC26DocumentManagerExecutables24DOCCreateFolderOperation_undoManager), sel_registerUndoOperationForSender_, self);
}

- (_TtC26DocumentManagerExecutables24DOCCreateFolderOperation)initWithParentItem:(id)a3 folderName:(id)a4
{
  id v4;
  _TtC26DocumentManagerExecutables24DOCCreateFolderOperation *result;

  v4 = a3;
  result = (_TtC26DocumentManagerExecutables24DOCCreateFolderOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCCreateFolderOperation_parentItem));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCCreateFolderOperation_folderItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCCreateFolderOperation_undoManager));
}

@end
