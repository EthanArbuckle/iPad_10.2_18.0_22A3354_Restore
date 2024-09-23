@implementation DDObjcCompatibility

+ (void)swiftInitializeLocalUsersAndGroupsAndPerform:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v5[4];

  v3 = _Block_copy(a3);
  v4 = _Block_copy(v3);
  v5[2] = v4;
  if (qword_256951AC0 != -1)
    swift_once();
  sub_23A1F84EC((void (*)(unint64_t *, _QWORD **))sub_23A1F8F88, (uint64_t)v5, qword_2569524F8);
  _Block_release(v4);
  _Block_release(v3);
}

+ (BOOL)swiftUpdateLocalUsersAndGroupsAndReturnError:(id *)a3 perform:(id)a4
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v4 = _Block_copy(a4);
  v5 = _Block_copy(v4);
  _Block_copy(v5);
  if (qword_256951AC0 != -1)
    swift_once();
  v7[3] = &type metadata for ProviderSideEffects;
  v7[4] = &off_250B2F8C0;
  v7[0] = swift_allocObject();
  sub_23A1F8DB0(qword_2569524F8, (_OWORD *)(v7[0] + 16));
  sub_23A219558(v7, v5);
  _Block_release(v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  _Block_release(v5);
  _Block_release(v4);
  return 1;
}

- (DDObjcCompatibility)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[DDObjcCompatibility init](&v3, sel_init);
}

@end
