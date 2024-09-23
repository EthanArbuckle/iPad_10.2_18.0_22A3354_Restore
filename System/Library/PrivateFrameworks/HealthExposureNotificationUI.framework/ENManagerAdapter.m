@implementation ENManagerAdapter

- (int64_t)exposureNotificationStatus
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_exposureNotificationStatus);
  swift_beginAccess();
  return *v2;
}

- (void)setExposureNotificationStatus:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_exposureNotificationStatus);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isExposureLoggingDataPresent
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_isExposureLoggingDataPresent;
  swift_beginAccess();
  return *v2;
}

- (void)setIsExposureLoggingDataPresent:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_isExposureLoggingDataPresent;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)areAvailabilityAlertsEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_areAvailabilityAlertsEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setAreAvailabilityAlertsEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_areAvailabilityAlertsEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isAvailabilityAlertsSwitchEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_isAvailabilityAlertsSwitchEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAvailabilityAlertsSwitchEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_isAvailabilityAlertsSwitchEnabled;
  swift_beginAccess();
  *v4 = a3;
}

+ (_TtC28HealthExposureNotificationUI16ENManagerAdapter)defaultAdapter
{
  if (qword_2540B3B78 != -1)
    swift_once();
  swift_beginAccess();
  return (_TtC28HealthExposureNotificationUI16ENManagerAdapter *)(id)static ENManagerAdapter.defaultAdapter;
}

+ (void)setDefaultAdapter:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_2540B3B78;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = (void *)static ENManagerAdapter.defaultAdapter;
  static ENManagerAdapter.defaultAdapter = (uint64_t)v4;

}

- (ENManager)manager
{
  return (ENManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_manager));
}

- (NSSet)statusChangeObservers
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for ENManagerAdapter.StatusChangeObserver();
  sub_21CCFD020((unint64_t *)&qword_255327848, (uint64_t (*)(uint64_t))type metadata accessor for ENManagerAdapter.StatusChangeObserver, MEMORY[0x24BEE5BD8]);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21CD766B8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)setStatusChangeObservers:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for ENManagerAdapter.StatusChangeObserver();
  sub_21CCFD020((unint64_t *)&qword_255327848, (uint64_t (*)(uint64_t))type metadata accessor for ENManagerAdapter.StatusChangeObserver, MEMORY[0x24BEE5BD8]);
  v4 = sub_21CD766C4();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_statusChangeObservers);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC28HealthExposureNotificationUI16ENManagerAdapter)init
{
  return (_TtC28HealthExposureNotificationUI16ENManagerAdapter *)ENManagerAdapter.init()();
}

- (void)dealloc
{
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v2;

  v2 = self;
  ENManagerAdapter.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_manager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_activationGroup));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_statusObservation));
  swift_bridgeObjectRelease();
}

- (void)refreshStatusWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_21CD409D4;
  v6[4] = v5;
  v7 = self;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40FD4, (uint64_t)v6);

  swift_release();
  swift_release();
}

- (void)setExposureNotificationEnabled:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = self;
  *(_BYTE *)(v8 + 24) = a3;
  *(_QWORD *)(v8 + 32) = sub_21CD35CE8;
  *(_QWORD *)(v8 + 40) = v7;
  v9 = self;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40E1C, v8);

  swift_release();
  swift_release();
}

- (void)onboardingDidStartForRegion:(id)a3 source:(int64_t)a4
{
  _QWORD *v7;
  id v8;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v9;
  id v10;

  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a4;
  v7[3] = self;
  v7[4] = a3;
  v8 = a3;
  v9 = self;
  v10 = v8;
  sub_21CD36EAC((uint64_t)sub_21CD1EDD8, (uint64_t)v7);

  swift_release();
}

- (void)didEnterLegalConsentPageForRegion:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v7;
  id v8;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = self;
  *(_QWORD *)(v5 + 24) = a3;
  v6 = a3;
  v7 = self;
  v8 = v6;
  sub_21CD36EAC((uint64_t)sub_21CD40DF8, v5);

  swift_release();
}

- (void)fetchSubdivisionsForRegion:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_21CD40964;
  v8[5] = v7;
  v9 = a3;
  v10 = self;
  v11 = v9;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40E18, (uint64_t)v8);

  swift_release();
  swift_release();
}

- (void)setActiveRegion:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_21CD40E20;
  v8[5] = v7;
  v9 = a3;
  v10 = self;
  v11 = v9;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40E14, (uint64_t)v8);

  swift_release();
  swift_release();
}

- (void)setActivePhaseOneAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v11;

  v5 = _Block_copy(a4);
  v6 = sub_21CD765B0();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = self;
  v10[3] = v6;
  v10[4] = v8;
  v10[5] = sub_21CD40E20;
  v10[6] = v9;
  v11 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD384F0, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)latestExposureNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_21CD40FEC;
  v6[4] = v5;
  v7 = self;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40FD0, (uint64_t)v6);

  swift_release();
  swift_release();
}

- (void)fetchAgencyModelForRegionCode:(id)a3 reason:(unsigned int)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v13;
  id v14;

  v7 = _Block_copy(a5);
  sub_21CD765B0();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = self;
  v10 = (void *)sub_21CD7658C();
  v11 = objc_msgSend((id)objc_opt_self(), sel_regionWithCode_, v10);

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  *(_QWORD *)(v12 + 24) = v11;
  *(_DWORD *)(v12 + 32) = a4;
  *(_QWORD *)(v12 + 40) = sub_21CD40918;
  *(_QWORD *)(v12 + 48) = v8;
  v13 = v9;
  v14 = v11;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD2BD30, v12);

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)fetchAllEntities:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_21CD4090C;
  v6[4] = v5;
  v7 = self;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40FCC, (uint64_t)v6);

  swift_release();
  swift_release();
}

- (void)getAgencyModelForBundleID:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v11;

  v5 = _Block_copy(a4);
  v6 = sub_21CD765B0();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = sub_21CD40FEC;
  v10[3] = v9;
  v10[4] = v6;
  v10[5] = v8;
  v11 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_21CD36EAC((uint64_t)sub_21CD40E10, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)getAgencyModelForRegionCode:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v11;

  v5 = _Block_copy(a4);
  v6 = sub_21CD765B0();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = sub_21CD408F4;
  v10[3] = v9;
  v10[4] = v6;
  v10[5] = v8;
  v11 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_21CD36EAC((uint64_t)sub_21CD40E0C, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)getLastVisitedRegionWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_21CD408E8;
  v6[4] = v5;
  v7 = self;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40FC8, (uint64_t)v6);

  swift_release();
  swift_release();
}

- (void)allRegionConfigurations:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_21CD408DC;
  v6[4] = v5;
  v7 = self;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40FC4, (uint64_t)v6);

  swift_release();
  swift_release();
}

- (void)setShareAnalyticsEnabled:(BOOL)a3 region:(id)a4 version:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v16;
  id v17;

  v9 = _Block_copy(a6);
  v10 = sub_21CD765B0();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v10;
  *(_QWORD *)(v14 + 24) = v12;
  *(_BYTE *)(v14 + 32) = a3;
  *(_QWORD *)(v14 + 40) = self;
  *(_QWORD *)(v14 + 48) = a4;
  *(_QWORD *)(v14 + 56) = sub_21CD40E20;
  *(_QWORD *)(v14 + 64) = v13;
  v15 = a4;
  v16 = self;
  v17 = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD3A928, v14);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)isTravelStatusEnabledForRegion:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_21CD40DF4;
  v8[5] = v7;
  v9 = a3;
  v10 = self;
  v11 = v9;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40E08, (uint64_t)v8);

  swift_release();
  swift_release();
}

- (void)setTravelStatusEnabled:(BOOL)a3 region:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v12;
  id v13;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = self;
  *(_BYTE *)(v10 + 24) = a3;
  *(_QWORD *)(v10 + 32) = a4;
  *(_QWORD *)(v10 + 40) = sub_21CD40E20;
  *(_QWORD *)(v10 + 48) = v9;
  v11 = a4;
  v12 = self;
  v13 = v11;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD3ACF0, v10);

  swift_release();
  swift_release();
}

- (void)isKeyReleasePreAuthorizedForRegion:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_21CD4082C;
  v8[5] = v7;
  v9 = a3;
  v10 = self;
  v11 = v9;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40E04, (uint64_t)v8);

  swift_release();
  swift_release();
}

- (void)setPreAuthorizeDiagnosisKeysEnabled:(BOOL)a3 forRegion:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v11;
  ENManager *v12;
  void *v13;
  _QWORD v14[6];

  v6 = a3;
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a4;
  v11 = self;
  v12 = -[ENManagerAdapter manager](v11, sel_manager);
  v14[4] = sub_21CD40E20;
  v14[5] = v9;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_21CD36D30;
  v14[3] = &block_descriptor_123;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  -[ENManager setPreAuthorizeDiagnosisKeysEnabled:region:completionHandler:](v12, sel_setPreAuthorizeDiagnosisKeysEnabled_region_completionHandler_, v6, v10, v13);
  _Block_release(v13);

  swift_release();
}

- (void)resetAllDataAndDisableExposureNotifications:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_21CD40E20;
  v6[4] = v5;
  v7 = self;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40FC0, (uint64_t)v6);

  swift_release();
  swift_release();
}

- (void)setAvailabilityAlertsEnabled:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = self;
  *(_BYTE *)(v8 + 24) = a3;
  *(_QWORD *)(v8 + 32) = sub_21CD40E20;
  *(_QWORD *)(v8 + 40) = v7;
  v9 = self;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40E00, v8);

  swift_release();
  swift_release();
}

- (void)setWeeklySummaryEnabled:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = self;
  *(_BYTE *)(v8 + 24) = a3;
  *(_QWORD *)(v8 + 32) = sub_21CD40E20;
  *(_QWORD *)(v8 + 40) = v7;
  v9 = self;
  swift_retain();
  sub_21CD36EAC((uint64_t)sub_21CD40DFC, v8);

  swift_release();
  swift_release();
}

- (void)setUserConsent:(int64_t)a3 region:(id)a4 text:(id)a5 version:(id)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v20;
  id v21;

  v11 = _Block_copy(a7);
  if (a5)
  {
    v12 = sub_21CD765B0();
    a5 = v13;
  }
  else
  {
    v12 = 0;
  }
  v14 = sub_21CD765B0();
  v16 = v15;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v11;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = v14;
  v18[3] = v16;
  v18[4] = a3;
  v18[5] = v12;
  v18[6] = a5;
  v18[7] = self;
  v18[8] = a4;
  v18[9] = sub_21CD407F0;
  v18[10] = v17;
  swift_bridgeObjectRetain();
  swift_retain();
  v19 = a4;
  v20 = self;
  v21 = v19;
  swift_bridgeObjectRetain();
  sub_21CD36EAC((uint64_t)sub_21CD1E80C, (uint64_t)v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (BOOL)tccContainsRecordForBundleIdentifier:(id)a3
{
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v4;
  char v5;
  char v6;

  sub_21CD765B0();
  v4 = self;
  _s28HealthExposureNotificationUI16ENManagerAdapterC17tccContainsRecord19forBundleIdentifierSbSS_tF_0();
  v6 = v5;

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)notifyChangeObserversForChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  _TtC28HealthExposureNotificationUI16ENManagerAdapter *v7;
  uint64_t v8;

  swift_beginAccess();
  v7 = self;
  v8 = swift_bridgeObjectRetain();
  sub_21CD63A64(v8, a3, a4);

  swift_bridgeObjectRelease();
}

@end
