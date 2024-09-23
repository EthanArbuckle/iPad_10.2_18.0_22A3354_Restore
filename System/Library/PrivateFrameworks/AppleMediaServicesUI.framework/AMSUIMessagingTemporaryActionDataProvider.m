@implementation AMSUIMessagingTemporaryActionDataProvider

+ (id)parametersForAppStoreOptInNotificationWithDeeplink:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = sub_211244FE0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211244FA4();
  v7 = static ActionDataProvider.parametersForAppStoreOptInNotification(deeplink:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (!v7)
    return 0;
  v8 = (void *)sub_211246300();
  swift_bridgeObjectRelease();
  return v8;
}

- (AMSUIMessagingTemporaryActionDataProvider)init
{
  return (AMSUIMessagingTemporaryActionDataProvider *)ActionDataProvider.init()();
}

@end
