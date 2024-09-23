@implementation FeatureRequestHandler

- (void)requestFeatureWithId:(id)a3 ignoreCache:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v12;

  v5 = a4;
  v7 = _Block_copy(a5);
  v8 = sub_1A5BC9B60();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = self;
  sub_1A5B514E8(v8, v10, v5, (uint64_t)sub_1A5B5D7A0, v11);
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)getFeatureEligibilityFor:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v14;

  v6 = _Block_copy(a5);
  v7 = sub_1A5BC9B60();
  v9 = v8;
  v10 = sub_1A5BC9B60();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v6;
  v14 = self;
  sub_1A5B533B8(v7, v9, v10, v12, (uint64_t)sub_1A5B5D968, v13);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)clearCacheAndNotify
{
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v2;

  v2 = self;
  sub_1A5B7C0C8();

}

- (void)requestGeoClassificationFor:(id)a3 bundleID:(id)a4 altDSID:(id)a5 ignoreCache:(BOOL)a6 completion:(id)a7
{
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v20;

  v9 = _Block_copy(a7);
  v10 = sub_1A5BC9B60();
  v12 = v11;
  v13 = sub_1A5BC9B60();
  v15 = v14;
  v16 = sub_1A5BC9B60();
  v18 = v17;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v9;
  v20 = self;
  sub_1A5B7CAFC(v10, v12, v13, v15, v16, v18, a6, (uint64_t)sub_1A5B81FC0, v19);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)getSharedAlbumsStatusWithCompletion:(id)a3
{
  void *v4;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1A5B8103C((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)getTicketStatusForFeature:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v10;

  v5 = _Block_copy(a4);
  v6 = sub_1A5BC9B60();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  sub_1A5B7E7A0(v6, v8, (uint64_t)sub_1A5B81FC0, v9, "Fetching ticket %s", (uint64_t)&unk_1E4F6EC28, (uint64_t)&unk_1EE7FA748);
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)getTicketStatusFromCacheForFeature:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v9;

  v5 = _Block_copy(a4);
  v6 = sub_1A5BC9B60();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_1A5B812A0(v6, v8, (uint64_t)v9, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)getTicketForFeature:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v10;

  v5 = _Block_copy(a4);
  v6 = sub_1A5BC9B60();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  sub_1A5B7E7A0(v6, v8, (uint64_t)sub_1A5B81FC0, v9, "Getting or fetching ticket %s", (uint64_t)&unk_1E4F6EBB0, (uint64_t)&unk_1EE7FA720);
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)clearCFUGateWithCompletion:(id)a3
{
  void *v4;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1A5B81518((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)clearCFUWithCompletion:(id)a3
{
  void (**v4)(void *, _QWORD);
  id v5;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v6;

  v4 = (void (**)(void *, _QWORD))_Block_copy(a3);
  type metadata accessor for FollowUp();
  swift_allocObject();
  v6 = self;
  if (FollowUp.init()())
  {
    sub_1A5BB0EA0();
    v4[2](v4, 0);
    swift_release();
  }
  else
  {
    v5 = sub_1A5B68C48(7);
    ((void (**)(void *, id))v4)[2](v4, v5);

  }
  _Block_release(v4);

}

- (void)postCFUIfEligibleWithCompletion:(id)a3
{
  void *v4;
  char v5;
  id v6;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v7;

  v4 = _Block_copy(a3);
  type metadata accessor for FollowUp();
  swift_allocObject();
  v7 = self;
  if (FollowUp.init()())
  {
    v5 = sub_1A5BAFF90();
    (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, v5 & 1, 0);
    swift_release();
  }
  else
  {
    v6 = sub_1A5B68C48(7);
    (*((void (**)(void *, _QWORD, id))v4 + 2))(v4, 0, v6);

  }
  _Block_release(v4);

}

- (void)gmOptInToggleWithCompletion:(id)a3
{
  void *v4;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v5;
  id v6;
  objc_class *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v13;
  objc_super v14;

  v4 = _Block_copy(a3);
  v5 = self;
  v6 = sub_1A5B74938();
  v7 = (objc_class *)type metadata accessor for GMOptIn();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = OBJC_IVAR____TtC25CloudSubscriptionFeatures7GMOptIn_globalUserDefaults;
  v10 = (void *)objc_opt_self();
  v11 = v8;
  *(_QWORD *)&v8[v9] = objc_msgSend(v10, sel_standardUserDefaults);
  *(_QWORD *)&v11[OBJC_IVAR____TtC25CloudSubscriptionFeatures7GMOptIn_userDefaults] = v6;
  v12 = v6;

  v14.receiver = v11;
  v14.super_class = v7;
  v13 = -[FeatureRequestHandler init](&v14, sel_init);

  LOBYTE(v12) = sub_1A5B73094();
  (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, v12 & 1, 0);
  _Block_release(v4);

}

- (void)forcePostCFUWithCompletion:(id)a3
{
  void (**v4)(void *, _QWORD);
  id v5;
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *v6;

  v4 = (void (**)(void *, _QWORD))_Block_copy(a3);
  type metadata accessor for FollowUp();
  swift_allocObject();
  v6 = self;
  if (FollowUp.init()())
  {
    sub_1A5BB013C();
    swift_release();
    v4[2](v4, 0);
  }
  else
  {
    v5 = sub_1A5B68C48(4);
    ((void (**)(void *, id))v4)[2](v4, v5);

  }
  _Block_release(v4);

}

- (_TtC25CloudSubscriptionFeatures21FeatureRequestHandler)init
{
  _TtC25CloudSubscriptionFeatures21FeatureRequestHandler *result;

  result = (_TtC25CloudSubscriptionFeatures21FeatureRequestHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_geoCache));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_accountStore);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25CloudSubscriptionFeatures21FeatureRequestHandler_urlSession));
}

- (void)clearTicketCacheAndNotify
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_1ED1110F0 != -1)
    swift_once();
  v0 = sub_1A5BC9A64();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED111100);
  v1 = sub_1A5BC9A4C();
  v2 = sub_1A5BC9DA0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A5B4D000, v1, v2, "Ticket cache clear message received.", v3, 2u);
    MEMORY[0x1A85B2FC0](v3, -1, -1);
  }

  if (qword_1ED110488 != -1)
    swift_once();
  sub_1A5B78558();
  sub_1A5B8B328();
}

@end
