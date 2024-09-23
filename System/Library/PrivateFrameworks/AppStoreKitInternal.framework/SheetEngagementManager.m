@implementation SheetEngagementManager

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC19AppStoreKitInternal22SheetEngagementManager *v11;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v11 = self;
  _s19AppStoreKitInternal22SheetEngagementManagerC10engagement_6handle10completionySo13AMSEngagementC_So0K7RequestCSgySo0K6ResultCSg_s5Error_pSgtctF_0(v9, a4);
  _Block_release(v8);

}

- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _TtC19AppStoreKitInternal22SheetEngagementManager *v19;

  v10 = _Block_copy(a7);
  v11 = sub_1D892ADB4();
  v13 = v12;
  v14 = sub_1D892ADB4();
  v16 = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  _s19AppStoreKitInternal22SheetEngagementManagerC10engagement_9didUpdate9placement11serviceType10completionySo13AMSEngagementC_So0O7RequestCSgS2SySo0O6ResultCSg_s5Error_pSgtctF_0(v17, a4, v11, v13, v14, v16);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC19AppStoreKitInternal22SheetEngagementManager *v11;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v11 = self;
  _s19AppStoreKitInternal22SheetEngagementManagerC10engagement_6handle10completionySo13AMSEngagementC_So16AMSDialogRequestCSgySo0L6ResultCSg_s5Error_pSgtctF_0(v9, a4);
  _Block_release(v8);

}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _TtC19AppStoreKitInternal22SheetEngagementManager *v17;

  v9 = sub_1D892ADB4();
  v11 = v10;
  v12 = sub_1D892ADB4();
  v14 = v13;
  v15 = a3;
  v16 = a4;
  v17 = self;
  _s19AppStoreKitInternal22SheetEngagementManagerC10engagement_9didUpdate9placement11serviceTypeySo13AMSEngagementC_So16AMSDialogRequestCSgS2StF_0(v15, a4, v9, v11, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)engagementTaskViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC19AppStoreKitInternal22SheetEngagementManager *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  LOBYTE(self) = SheetEngagementManager.engagementTaskViewController(_:handleDynamicDelegateAction:completionHandler:)(v10, v11, (uint64_t)sub_1D857E25C, v9);
  swift_release();

  return self & 1;
}

- (_TtC19AppStoreKitInternal22SheetEngagementManager)init
{
  _TtC19AppStoreKitInternal22SheetEngagementManager *result;

  result = (_TtC19AppStoreKitInternal22SheetEngagementManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal22SheetEngagementManager_engagement));
  swift_unknownObjectWeakDestroy();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  sub_1D857A090(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC19AppStoreKitInternal22SheetEngagementManager_previousArcadeSubscriptionState), self->engagement[OBJC_IVAR____TtC19AppStoreKitInternal22SheetEngagementManager_previousArcadeSubscriptionState]);
  sub_1D83634B4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal22SheetEngagementManager_flowActionViewControllerFactory));
}

@end
