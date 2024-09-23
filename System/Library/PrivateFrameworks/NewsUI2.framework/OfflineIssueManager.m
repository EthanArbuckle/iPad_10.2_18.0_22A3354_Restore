@implementation OfflineIssueManager

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  void *v5;
  _TtC7NewsUI219OfflineIssueManager *v6;
  id v7;
  _TtC7NewsUI219OfflineIssueManager *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC7NewsUI219OfflineIssueManager_backgroundAppRefreshChangeObserver);
  if (v4)
  {
    v5 = (void *)objc_opt_self();
    v6 = self;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v5, sel_defaultCenter);
    objc_msgSend(v7, sel_removeObserver_, v4);
    swift_unknownObjectRelease();

  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = ObjectType;
  -[OfflineIssueManager dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219OfflineIssueManager_offlineContentManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219OfflineIssueManager_storageLevelProvider);

  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC7NewsUI219OfflineIssueManager)init
{
  _TtC7NewsUI219OfflineIssueManager *result;

  result = (_TtC7NewsUI219OfflineIssueManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
