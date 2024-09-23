@implementation HDMCExperienceStoreServer

- (HDMCExperienceStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v15;

  v9 = sub_2196815BC();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2196815A4();
  v12 = a4;
  v13 = a5;
  swift_unknownObjectRetain();
  return (HDMCExperienceStoreServer *)HDMCExperienceStoreServer.init(uuid:configuration:client:delegate:)((uint64_t)v11, a4, v13, (uint64_t)a6);
}

+ (NSString)taskIdentifier
{
  objc_class *ObjCClassFromMetadata;
  NSString *v3;
  void *v4;

  sub_219654DFC(0, (unint64_t *)&unk_253E60AE0);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v3 = NSStringFromClass(ObjCClassFromMetadata);
  sub_219681A6C();

  v4 = (void *)sub_219681A48();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (id)exportedInterface
{
  return (id)HKMCExperienceStoreServerInterface();
}

- (id)remoteInterface
{
  return (id)HKMCExperienceStoreClientInterface();
}

+ (Class)configurationClass
{
  sub_219654DFC(0, &qword_253E60DC8);
  return (Class)swift_getObjCClassFromMetadata();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  sub_21966CC5C(v7);

  return 1;
}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
  sub_21966C434(self, (int)a2, a3, (uint64_t)&unk_24DB23748, (uint64_t)sub_21966CEC4, (void (*)(uint64_t, uint64_t))sub_21966AF6C);
}

- (void)remote_stopObservingChanges
{
  HDMCExperienceStoreServer *v2;

  v2 = self;
  sub_21966B1A0();

}

- (void)remote_getExperienceModelWithCompletion:(id)a3
{
  sub_21966C434(self, (int)a2, a3, (uint64_t)&unk_24DB23720, (uint64_t)sub_21966CEAC, (void (*)(uint64_t, uint64_t))sub_21966B374);
}

- (void)remote_persistSetupRecord:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  HDMCExperienceStoreServer *v8;

  v6 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = a3;
  v8 = self;
  sub_21966B824(v7, (void (*)(uint64_t, _QWORD))sub_21966CEC4);

  swift_release();
}

- (void)remote_getCachedPregnancyModelWithCompletion:(id)a3
{
  sub_21966C434(self, (int)a2, a3, (uint64_t)&unk_24DB236D0, (uint64_t)sub_21966CEC8, (void (*)(uint64_t, uint64_t))sub_21966BD34);
}

- (void)remote_deleteAllPregnancySetupRecordsWithCompletion:(id)a3
{
  sub_21966C434(self, (int)a2, a3, (uint64_t)&unk_24DB236A8, (uint64_t)sub_21966CEA4, (void (*)(uint64_t, uint64_t))sub_21966BF98);
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy();
}

- (void)experienceModelManagerDidUpdateModel
{
  HDMCExperienceStoreServer *v2;

  v2 = self;
  HDMCExperienceStoreServer.experienceModelManagerDidUpdateModel()();

}

@end
