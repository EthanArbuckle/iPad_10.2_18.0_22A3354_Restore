@implementation _EXExtensionProcessMannger

- (void)processDidInvalidate:(id)a3
{
  id v4;
  _EXExtensionProcessMannger *v5;

  v4 = a3;
  v5 = self;
  _EXExtensionProcessMannger.processDidInvalidate(_:)((uint64_t)v4);

}

- (_EXExtensionProcessMannger)init
{
  uint64_t v3;
  void *v4;
  _EXExtensionProcessMannger *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v3 = OBJC_IVAR____EXExtensionProcessMannger_processExtensionMap;
  v4 = (void *)objc_opt_self();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_strongToWeakObjectsMapTable);
  v6 = OBJC_IVAR____EXExtensionProcessMannger_processExtensionMapLock;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECD98DD0);
  v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = 0;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)v7;

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for _EXExtensionProcessMannger();
  return -[_EXExtensionProcessMannger init](&v9, sel_init);
}

- (void).cxx_destruct
{

  swift_release();
}

@end
