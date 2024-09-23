@implementation DOCSmartFolderManager

void __43__DOCSmartFolderManager_OBJC_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = v0;

  +[DOCSmartFolderManager sharedManager](_TtC26DocumentManagerExecutables21DOCSmartFolderManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedManager__sharedManager, "setUnderlyingSmartFolderManager:", v2);

}

+ (_TtC26DocumentManagerExecutables21DOCSmartFolderManager)sharedManager
{
  if (qword_255469A38 != -1)
    swift_once();
  return (_TtC26DocumentManagerExecutables21DOCSmartFolderManager *)(id)static DOCSmartFolderManager.sharedManager;
}

- (void)dealloc
{
  void *v2;
  _TtC26DocumentManagerExecutables21DOCSmartFolderManager *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC26DocumentManagerExecutables21DOCSmartFolderManager_database);
  v3 = self;
  objc_msgSend(v2, sel_close);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DOCSmartFolderManager();
  -[DOCSmartFolderManager dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables21DOCSmartFolderManager_database));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables21DOCSmartFolderManager_currentUserActivity));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables21DOCSmartFolderManager_defaultSaveLocationItemId));
}

- (_TtC26DocumentManagerExecutables21DOCSmartFolderManager)init
{
  _TtC26DocumentManagerExecutables21DOCSmartFolderManager *result;

  result = (_TtC26DocumentManagerExecutables21DOCSmartFolderManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
