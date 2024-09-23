@implementation InlineUnifiedMessagePresenter

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  id v7;
  _TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  InlineUnifiedMessagePresenter.messageViewController(_:didSelectActionWith:)((uint64_t)v6, (uint64_t)v7);

}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  _TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = self;
  InlineUnifiedMessagePresenter.messageViewController(_:didUpdate:)(v7, width, height);

}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  _s19AppStoreKitInternal29InlineUnifiedMessagePresenterC21messageViewController_16didFailWithErrorySo012AMSUIMessagejK0_So06UIViewK0CXc_s0O0_pSgtF_0(v6, (uint64_t)a4);

}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  uint64_t v8;
  id v9;
  _TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter *v10;

  v8 = sub_1D892AC88();
  if (a5)
    sub_1D892ADB4();
  v9 = a3;
  v10 = self;
  _s19AppStoreKitInternal29InlineUnifiedMessagePresenterC21messageViewController_22enqueueEventWithFields7inTopicySo012AMSUIMessagejK0_So06UIViewK0CXc_SDys11AnyHashableVypGSSSgtF_0(v9, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_1D860E188(self, (int)a2, a3, a4, a5, (void (*)(id, void *))_s19AppStoreKitInternal29InlineUnifiedMessagePresenterC10engagement_6handle10completionySo13AMSEngagementC_So16AMSDialogRequestCSgySo0M6ResultCSg_s5Error_pSgtctF_0);
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter *v17;

  v9 = sub_1D892ADB4();
  v11 = v10;
  v12 = sub_1D892ADB4();
  v14 = v13;
  v15 = a3;
  v16 = a4;
  v17 = self;
  InlineUnifiedMessagePresenter.engagement(_:didUpdate:placement:serviceType:)(v15, a4, v9, v11, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  sub_1D860E188(self, (int)a2, a3, a4, a5, (void (*)(id, void *))_s19AppStoreKitInternal29InlineUnifiedMessagePresenterC10engagement_6handle10completionySo13AMSEngagementC_So0L7RequestCSgySo0L6ResultCSg_s5Error_pSgtctF_0);
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
  _TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter *v19;

  v10 = _Block_copy(a7);
  v11 = sub_1D892ADB4();
  v13 = v12;
  v14 = sub_1D892ADB4();
  v16 = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  _s19AppStoreKitInternal29InlineUnifiedMessagePresenterC10engagement_9didUpdate9placement11serviceType10completionySo13AMSEngagementC_So0P7RequestCSgS2SySo0P6ResultCSg_s5Error_pSgtctF_0(v17, a4, v11, v13, v14, v16);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter)init
{
  _TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter *result;

  result = (_TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1D83634B4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter_actionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter_engagement));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal29InlineUnifiedMessagePresenter_metricsPipeline;
  v4 = sub_1D8929C2C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
