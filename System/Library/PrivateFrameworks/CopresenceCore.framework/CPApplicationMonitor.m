@implementation CPApplicationMonitor

- (CPApplicationMonitor)initWithApplicationController:(id)a3 queue:(id)a4
{
  uint64_t ObjectType;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  CPApplicationMonitor *v11;
  _QWORD v13[5];

  ObjectType = swift_getObjectType();
  v7 = one-time initialization token for shared;
  v8 = a3;
  v9 = a4;
  if (v7 != -1)
    swift_once();
  v10 = (void *)static CPApplicationPolicyManager.shared;
  v13[3] = type metadata accessor for CPApplicationController();
  v13[4] = &protocol witness table for CPApplicationController;
  v13[0] = v8;
  v11 = (CPApplicationMonitor *)(*(uint64_t (**)(void *, _QWORD *, id))(ObjectType + 136))(v10, v13, v9);
  swift_deallocPartialClassInstance();
  return v11;
}

- (void)dealloc
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  CPApplicationMonitor *v7;
  CPApplicationMonitor *v8;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CPApplicationMonitor_appVisibilityMonitor);
  swift_beginAccess();
  if (*v3)
  {
    v4 = v3[1];
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 24);
    v7 = self;
    swift_unknownObjectRetain();
    v6(ObjectType, v4);
    swift_unknownObjectRelease();
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CPApplicationMonitor();
  -[CPApplicationMonitor dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___CPApplicationMonitor_applicationController);
  swift_unknownObjectRelease();
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
  id v7;
  CPApplicationMonitor *v8;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  specialized CPApplicationMonitor.conversationManager(_:conversationChanged:)(a3);
  swift_unknownObjectRelease();

}

- (CPApplicationMonitor)init
{
  CPApplicationMonitor *result;

  result = (CPApplicationMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
