@implementation ENUIViewControllerFactory

+ (ENUIViewControllerFactory)sharedInstance
{
  if (qword_2540B3B90 != -1)
    swift_once();
  return (ENUIViewControllerFactory *)(id)static ViewControllerFactory.shared;
}

- (UIViewController)inflightOnboardingStack
{
  return (UIViewController *)sub_21CD69B18((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ENUIViewControllerFactory_inflightOnboardingStack);
}

- (void)setInflightOnboardingStack:(id)a3
{
  sub_21CD69BB8();
}

- (UIViewController)inflightVerificationStack
{
  return (UIViewController *)sub_21CD69B18((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ENUIViewControllerFactory_inflightVerificationStack);
}

- (void)setInflightVerificationStack:(id)a3
{
  sub_21CD69BB8();
}

- (UIViewController)inflightPreAuthorizationStack
{
  return (UIViewController *)sub_21CD69B18((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ENUIViewControllerFactory_inflightPreAuthorizationStack);
}

- (void)setInflightPreAuthorizationStack:(id)a3
{
  sub_21CD69BB8();
}

- (id)createOnboardingStackForAgencyModel:(id)a3 exposureManager:(id)a4 fromAvailabilityAlert:(BOOL)a5 fromDeepLink:(BOOL)a6 subsequentFlow:(int64_t)a7 completion:(id)a8
{
  void *v14;
  uint64_t v15;
  id v16;
  ENUIViewControllerFactory *v17;
  id v18;

  v14 = _Block_copy(a8);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  v16 = a3;
  swift_unknownObjectRetain();
  v17 = self;
  v18 = ViewControllerFactory.createOnboardingStack(forAgencyModel:exposureManager:fromAvailabilityAlert:fromDeepLink:subsequentFlow:completion:)(a3, (uint64_t)a4, a5, a6, a7, (uint64_t)sub_21CD40FEC, v15);

  swift_unknownObjectRelease();
  swift_release();
  return v18;
}

- (id)createAnalyticsConsentStackForAgencyModel:(id)a3 exposureManager:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  ENUIViewControllerFactory *v11;
  id v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  v12 = _s28HealthExposureNotificationUI21ViewControllerFactoryC27createAnalyticsConsentStack14forAgencyModel15exposureManager10completionSo06UIViewF0CAA010ENUIPublicamN0C_AA0B9Notifying_pyAA10FlowResultOctF_0(v10, (uint64_t)a4, (uint64_t)sub_21CD40FEC, v9);

  swift_unknownObjectRelease();
  swift_release();
  return v12;
}

- (id)createVerificationStackForAgencyModel:(id)a3 exposureManager:(id)a4 sessionIdentifier:(id)a5 reportType:(unsigned int)a6 enteredFromMainScreen:(BOOL)a7 completion:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  ENUIViewControllerFactory *v23;
  id v24;
  uint64_t v26;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255326C70);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  if (a5)
  {
    sub_21CD76364();
    v19 = sub_21CD76370();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v17, 0, 1, v19);
  }
  else
  {
    v20 = sub_21CD76370();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v17, 1, 1, v20);
  }
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v18;
  v22 = a3;
  swift_unknownObjectRetain();
  v23 = self;
  v24 = ViewControllerFactory.createVerificationStack(forAgencyModel:exposureManager:sessionIdentifier:reportType:enteredFromMainScreen:completion:)(v22, (uint64_t)a4, (uint64_t)v17, a6, a7, (uint64_t)sub_21CD40FEC, v21);

  swift_unknownObjectRelease();
  swift_release();
  sub_21CD6B388((uint64_t)v17);
  return v24;
}

- (id)createPreAuthorizationStackForAgencyModel:(id)a3 exposureManager:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  ENUIViewControllerFactory *v11;
  id v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  v12 = ViewControllerFactory.createPreAuthorizationStack(forAgencyModel:exposureManager:completion:)(v10, (uint64_t)a4, (uint64_t)sub_21CD408F4, v9);

  swift_unknownObjectRelease();
  swift_release();
  return v12;
}

- (id)createTurndownStackWithEnteredFromMainScreen:(BOOL)a3 completion:(id)a4
{
  void *v5;
  ENUIViewControllerFactory *v6;
  id v7;

  v5 = _Block_copy(a4);
  v6 = self;
  v7 = _s28HealthExposureNotificationUI21ViewControllerFactoryC19createTurndownStack21enteredFromMainScreen10completionSo06UIViewF0CSgSb_yAA10FlowResultOctF_0();
  _Block_release(v5);

  return v7;
}

- (id)createKeyReleaseDialogueWithBundleIdentifier:(id)a3 region:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  ENUIViewControllerFactory *v14;
  id v15;
  __int128 v17[7];

  v7 = _Block_copy(a5);
  v8 = sub_21CD765B0();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_21CD6B3EC;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = a4;
  v14 = self;
  swift_retain();
  sub_21CD55428((uint64_t)v17);
  objc_allocWithZone((Class)type metadata accessor for KeyReleaseAuthorizationViewController());
  swift_bridgeObjectRetain();
  v15 = sub_21CCFF8DC(v17, v8, v10, a4, (uint64_t)sub_21CD0FB9C, v12);

  swift_release();
  sub_21CCFF41C((void **)v17);
  objc_msgSend(v15, sel_setModalPresentationStyle_, 0);

  swift_bridgeObjectRelease();
  swift_release();
  return v15;
}

- (id)createPreApprovalDialogueWithBundleIdentifier:(id)a3 region:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  ENUIViewControllerFactory *v14;
  id v15;
  id v16;
  __int128 v18[7];

  v7 = _Block_copy(a5);
  v8 = sub_21CD765B0();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_21CD6B374;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = a4;
  v14 = self;
  swift_retain();
  sub_21CCFED70((uint64_t)v18);
  objc_allocWithZone((Class)type metadata accessor for PreApprovalViewController());
  v15 = v13;
  swift_bridgeObjectRetain();
  v16 = sub_21CCFF154(v18, v8, v10, a4, (uint64_t)sub_21CD0FB9C, v12);

  swift_release();
  sub_21CCFF41C((void **)v18);
  objc_msgSend(v16, sel_setModalPresentationStyle_, 0);

  swift_bridgeObjectRelease();
  swift_release();
  return v16;
}

- (ENUIViewControllerFactory)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ViewControllerFactory();
  return -[ENUIViewControllerFactory init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end
