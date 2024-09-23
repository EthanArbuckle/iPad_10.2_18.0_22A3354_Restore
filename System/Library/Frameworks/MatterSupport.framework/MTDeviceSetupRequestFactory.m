@implementation MTDeviceSetupRequestFactory

+ (id)makeRequestFrom:(id)a3
{
  uint64_t v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  id v7;

  v3 = (uint64_t)a3;
  if (a3)
  {
    v4 = a3;
    v3 = sub_23452BB00();
    v6 = v5;

  }
  else
  {
    v6 = 0xF000000000000000;
  }
  v7 = sub_234507544(v3, v6);
  sub_234506660(v3, v6);
  return v7;
}

+ (id)makeRequestWithEcosystemName:(id)a3 homes:(id)a4 blockedDevicePairings:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;

  v5 = sub_23452BC20();
  v7 = v6;
  v8 = sub_23452BC68();
  sub_234507DD0(0, &qword_25615ECB0);
  v9 = sub_23452BC68();
  v10 = (void *)sub_234507794(v5, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (MTDeviceSetupRequestFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MTDeviceSetupRequestFactory();
  return -[MTDeviceSetupRequestFactory init](&v3, sel_init);
}

@end
