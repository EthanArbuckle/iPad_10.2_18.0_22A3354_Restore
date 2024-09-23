@implementation HealthPlatformContextProvider.ObserverShim

- (void)profileListDidUpdateForProfileStore:(id)a3
{
  _QWORD *Strong;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void (*)(unint64_t, void *), _QWORD *, uint64_t, uint64_t);
  id v10;
  _TtCC14HealthPlatform29HealthPlatformContextProvider12ObserverShim *v11;

  Strong = (_QWORD *)swift_weakLoadStrong();
  if (Strong)
  {
    v6 = Strong;
    v7 = Strong[5];
    v8 = Strong[6];
    __swift_project_boxed_opaque_existential_1(Strong + 2, v7);
    v9 = *(void (**)(void (*)(unint64_t, void *), _QWORD *, uint64_t, uint64_t))(v8 + 24);
    v10 = a3;
    v11 = self;
    swift_retain();
    v9(sub_1BC7ED5B8, v6, v7, v8);

    swift_release_n();
  }
}

- (_TtCC14HealthPlatform29HealthPlatformContextProvider12ObserverShim)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[HealthPlatformContextProvider.ObserverShim init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
