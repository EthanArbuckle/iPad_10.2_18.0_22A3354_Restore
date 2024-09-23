@implementation HMDHomeKeySetupWalletLogEventV2

- (NSString)coreAnalyticsEventName
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_222596CD8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setCoreAnalyticsEventName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_222596CF0();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventName);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  _TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2 *v2;
  void *v3;

  v2 = self;
  HMDHomeKeySetupWalletLogEventV2.coreAnalyticsEventDictionary.getter();

  sub_221903294();
  v3 = (void *)sub_222596C54();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventOptions);
  swift_beginAccess();
  return *v2;
}

- (void)setCoreAnalyticsEventOptions:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventOptions);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2)init
{
  _QWORD *v2;
  objc_super v4;

  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_success) = 0;
  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventName);
  *v2 = 0xD000000000000026;
  v2[1] = 0x800000022261BA20;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventOptions) = (Class)1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HMDHomeKeySetupWalletLogEventV2();
  return -[HMMLogEvent init](&v4, sel_init);
}

- (_TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2)initWithStartTime:(double)a3
{
  _QWORD *v4;
  objc_super v6;

  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_success) = 0;
  v4 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventName);
  *v4 = 0xD000000000000026;
  v4[1] = 0x800000022261BA20;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventOptions) = (Class)1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HMDHomeKeySetupWalletLogEventV2();
  return -[HMMLogEvent initWithStartTime:](&v6, sel_initWithStartTime_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
