@implementation AMSUIMessagingActionRunner

+ (BOOL)canRespondToDeeplink:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;

  v3 = sub_211244FE0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211244FA4();
  swift_getObjCClassMetadata();
  v7 = static ActionRunner.canRespondTo(deeplink:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

+ (BOOL)canRespondToIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = sub_21124639C();
  v5 = static ActionRunner.canRespondTo(identifier:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

+ (id)performWithDeeplink:(id)a3 context:(id)a4 parameters:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_211244FE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211244FA4();
  v10 = sub_211246324();
  swift_getObjCClassMetadata();
  v11 = a4;
  static ActionRunner.perform(deeplink:context:parameters:)((uint64_t)v9, (uint64_t)v11, v10);
  v13 = v12;

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

+ (id)performWithIdentifier:(id)a3 context:(id)a4 parameters:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  v6 = sub_21124639C();
  v8 = v7;
  v9 = sub_211246324();
  swift_getObjCClassMetadata();
  v10 = a4;
  static ActionRunner.perform(identifier:context:parameters:)(v6, v8, (uint64_t)v10, v9);
  v12 = v11;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (AMSUIMessagingActionRunner)init
{
  return (AMSUIMessagingActionRunner *)ActionRunner.init()();
}

@end
