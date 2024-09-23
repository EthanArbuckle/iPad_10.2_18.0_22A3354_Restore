@implementation AXDeviceRemoteScreenUtil

+ (AXDeviceRemoteScreenUtil)sharedInstance
{
  if (qword_2553A5A08 != -1)
    swift_once();
  return (AXDeviceRemoteScreenUtil *)(id)qword_2553A5F18;
}

+ (NSString)AXWatchRemoteScreenFeatureDomain
{
  void *v2;

  if (qword_2553A5A10 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21DC008A0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)AXWatchRemoteScreenFeatureKey
{
  return (NSString *)(id)sub_21DC008A0();
}

- (NSString)caSessionIntervalEvent
{
  return (NSString *)sub_21DBFDD80();
}

- (NSString)caSessionIntervalKey
{
  return (NSString *)sub_21DBFDD80();
}

- (NSString)caErrorEvent
{
  return (NSString *)sub_21DBFDD80();
}

- (NSString)caErrorKey
{
  return (NSString *)sub_21DBFDD80();
}

- (NSString)caInactiveEvent
{
  return (NSString *)sub_21DBFDD80();
}

- (NSString)caInactiveKey
{
  return (NSString *)sub_21DBFDD80();
}

- (BOOL)isTwiceFeatureOn
{
  AXDeviceRemoteScreenUtil *v3;
  char v4;
  _BYTE v6[24];
  ValueMetadata *v7;
  unint64_t v8;

  v7 = &type metadata for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags;
  v8 = sub_21DBFF71C();
  v3 = self;
  v4 = sub_21DC0084C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);

  return v4 & 1;
}

- (id)localizedStringWithKey:(id)a3
{
  return sub_21DBFE018(self);
}

- (id)localizedStingStringWithKey:(id)a3
{
  return sub_21DBFE018(self);
}

- (BOOL)isPairedGizmoHasStingSupport
{
  return _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC28isPairedGizmoHasStingSupportSbyF_0() & 1;
}

- (BOOL)isPairedGizmoSupported
{
  return _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC22isPairedGizmoSupportedSbyF_0() & 1;
}

- (BOOL)isPairedGizmoSupportedWithDeviceID:(id)a3
{
  AXDeviceRemoteScreenUtil *v4;
  char v5;

  sub_21DC008AC();
  v4 = self;
  v5 = _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC22isPairedGizmoSupported8deviceIDSbSS_tF_0();

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (id)pairedGizmoName
{
  uint64_t v2;
  void *v3;

  _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC15pairedGizmoNameSSSgyF_0();
  if (v2)
  {
    v3 = (void *)sub_21DC008A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)currentPairedGizmo
{
  return sub_21DBFF83C();
}

- (void)logSessionIntervalBeforeDate:(id)a3 afterDate:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  AXDeviceRemoteScreenUtil *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  AXDeviceRemoteScreenUtil *v20;
  void (*v21)(char *, uint64_t);
  _QWORD aBlock[6];

  v5 = sub_21DC00810();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)aBlock - v10;
  sub_21DC00804();
  sub_21DC00804();
  v12 = self;
  sub_21DC007F8();
  v14 = v13;
  sub_21DC007F8();
  v16 = v14 - v15;
  v17 = (void *)sub_21DC008A0();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v12;
  *(double *)(v18 + 24) = v16;
  aBlock[4] = sub_21DC00724;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21DBF6AEC;
  aBlock[3] = &block_descriptor_33;
  v19 = _Block_copy(aBlock);
  v20 = v12;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v19);

  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v9, v5);
  v21(v11, v5);
}

- (void)logSessionErrorWithErrorName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AXDeviceRemoteScreenUtil *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  AXDeviceRemoteScreenUtil *v11;
  _QWORD v12[6];

  v4 = sub_21DC008AC();
  v6 = v5;
  v7 = self;
  v8 = (void *)sub_21DC008A0();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v7;
  v9[3] = v4;
  v9[4] = v6;
  v12[4] = sub_21DC0075C;
  v12[5] = v9;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_21DBF6AEC;
  v12[3] = &block_descriptor_26;
  v10 = _Block_copy(v12);
  v11 = v7;
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

- (void)logInactiveSession
{
  AXDeviceRemoteScreenUtil *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  AXDeviceRemoteScreenUtil *v6;
  _QWORD v7[6];

  v2 = self;
  v3 = (void *)sub_21DC008A0();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v2;
  v7[4] = sub_21DC0074C;
  v7[5] = v4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_21DBF6AEC;
  v7[3] = &block_descriptor_19;
  v5 = _Block_copy(v7);
  v6 = v2;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v5);

}

- (AXDeviceRemoteScreenUtil)init
{
  return (AXDeviceRemoteScreenUtil *)AXDeviceRemoteScreenUtil.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
