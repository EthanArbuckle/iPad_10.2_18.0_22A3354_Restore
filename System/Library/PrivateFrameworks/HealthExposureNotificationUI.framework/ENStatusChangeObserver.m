@implementation ENStatusChangeObserver

- (ENStatusChangeObserver)initWithAdapter:(id)a3 didChangeHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t (**v7)();
  objc_super v9;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ENStatusChangeObserver_active) = 0;
  swift_unknownObjectWeakAssign();
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___ENStatusChangeObserver_didChangeHandler);
  *v7 = sub_21CD35D84;
  v7[1] = (uint64_t (*)())v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ENManagerAdapter.StatusChangeObserver();
  return -[ENStatusChangeObserver init](&v9, sel_init);
}

- (BOOL)active
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___ENStatusChangeObserver_active;
  swift_beginAccess();
  return *v2;
}

- (void)setActive:(BOOL)a3
{
  ENStatusChangeObserver *v4;

  v4 = self;
  ENManagerAdapter.StatusChangeObserver.active.setter(a3);

}

- (void)dealloc
{
  _BYTE *v3;
  ENStatusChangeObserver *v4;
  objc_super v5;

  v3 = (char *)self + OBJC_IVAR___ENStatusChangeObserver_active;
  swift_beginAccess();
  *v3 = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ENManagerAdapter.StatusChangeObserver();
  v4 = self;
  -[ENStatusChangeObserver dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
}

- (ENStatusChangeObserver)init
{
  ENStatusChangeObserver *result;

  result = (ENStatusChangeObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
