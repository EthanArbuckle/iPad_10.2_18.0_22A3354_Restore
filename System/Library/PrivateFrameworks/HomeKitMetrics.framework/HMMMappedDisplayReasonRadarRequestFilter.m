@implementation HMMMappedDisplayReasonRadarRequestFilter

- (BOOL)shouldRequestRadarForDisplayReason:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  HMMMappedDisplayReasonRadarRequestFilter *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = sub_1CD041A14();
  v6 = v5;
  v7 = self;
  v8 = (void *)sub_1CD02BFEC(v4, v6);
  v9 = (void *)sub_1CD041A08();
  v10 = objc_msgSend(v8, sel_shouldRequestRadarForDisplayReason_, v9);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return v10;
}

- (void)radarRequestedForDisplayReason:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  HMMMappedDisplayReasonRadarRequestFilter *v7;
  void *v8;
  id v9;

  v4 = sub_1CD041A14();
  v6 = v5;
  v7 = self;
  v8 = (void *)sub_1CD02BFEC(v4, v6);
  v9 = (id)sub_1CD041A08();
  objc_msgSend(v8, sel_radarRequestedForDisplayReason_, v9);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

}

- (HMMMappedDisplayReasonRadarRequestFilter)init
{
  HMMMappedDisplayReasonRadarRequestFilter *result;

  result = (HMMMappedDisplayReasonRadarRequestFilter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
