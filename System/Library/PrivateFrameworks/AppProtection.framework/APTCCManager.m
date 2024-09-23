@implementation APTCCManager

+ (id)sharedManager
{
  if (qword_2563D69E0 != -1)
    swift_once();
  return (id)qword_2563D7280;
}

- (id)TCCServicesForBundleIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  APTCCManager *v7;
  void *v8;

  v4 = sub_2362CB698();
  v6 = v5;
  v7 = self;
  sub_236268578(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_2362CB758();
  swift_bridgeObjectRelease();
  return v8;
}

- (void)accessingRecordsForTCCService:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  APTCCManager *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = _Block_copy(a4);
  v6 = sub_2362CB698();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = qword_2563D3FC8;
  v11 = self;
  if (v10 != -1)
    swift_once();
  v12 = qword_2563DB5B0;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_236267FB4;
  *(_QWORD *)(v13 + 24) = v9;
  swift_retain();
  sub_236266458(v6, v8, (uint64_t)sub_236267FE0, v13, v12);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (APTCCManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APTCCManager;
  return -[APTCCManager init](&v3, sel_init);
}

@end
