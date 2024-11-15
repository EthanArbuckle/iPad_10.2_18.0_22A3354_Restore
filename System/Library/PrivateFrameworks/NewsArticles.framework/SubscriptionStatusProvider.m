@implementation SubscriptionStatusProvider

- (int64_t)bundleSubscriptionStatus
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus);
}

- (void)setBundleSubscriptionStatus:(int64_t)a3
{
  uint64_t v3;
  _TtC12NewsArticles26SubscriptionStatusProvider *v4;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus) = (Class)a3;
  v4 = self;
  sub_1B9F11240(v3, (SEL *)&selRef_bundleSubscriptionStatusDidChangeFromStatus_);

}

- (int64_t)channelSubscriptionStatus
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus);
}

- (void)setChannelSubscriptionStatus:(int64_t)a3
{
  uint64_t v3;
  _TtC12NewsArticles26SubscriptionStatusProvider *v4;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus) = (Class)a3;
  v4 = self;
  sub_1B9F11240(v3, (SEL *)&selRef_channelSubscriptionStatusDidChangeFromStatus_);

}

- (void)purchaseListChangedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC12NewsArticles26SubscriptionStatusProvider *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_1BA0B97B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA0B9794();
  v8 = self;
  v9 = sub_1B9F11760();
  v10 = *(uint64_t *)((char *)&v8->super.isa
                   + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus);
  *(Class *)((char *)&v8->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus) = (Class)v9;
  sub_1B9F11240(v10, (SEL *)&selRef_channelSubscriptionStatusDidChangeFromStatus_);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC12NewsArticles26SubscriptionStatusProvider)init
{
  _TtC12NewsArticles26SubscriptionStatusProvider *result;

  result = (_TtC12NewsArticles26SubscriptionStatusProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)addObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_observers), sel_addObject_, a3);
}

- (void)removeObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_observers), sel_removeObject_, a3);
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _TtC12NewsArticles26SubscriptionStatusProvider *v8;

  v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus) = (Class)2;
  v5 = a3;
  v8 = self;
  sub_1B9F11240(v4, (SEL *)&selRef_bundleSubscriptionStatusDidChangeFromStatus_);
  v6 = sub_1B9F11760();
  v7 = *(uint64_t *)((char *)&v8->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus);
  *(Class *)((char *)&v8->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus) = (Class)v6;
  sub_1B9F11240(v7, (SEL *)&selRef_channelSubscriptionStatusDidChangeFromStatus_);

}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _TtC12NewsArticles26SubscriptionStatusProvider *v8;

  v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_bundleSubscriptionStatus) = (Class)1;
  v5 = a3;
  v8 = self;
  sub_1B9F11240(v4, (SEL *)&selRef_bundleSubscriptionStatusDidChangeFromStatus_);
  v6 = sub_1B9F11760();
  v7 = *(uint64_t *)((char *)&v8->super.isa
                  + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus);
  *(Class *)((char *)&v8->super.isa
           + OBJC_IVAR____TtC12NewsArticles26SubscriptionStatusProvider_channelSubscriptionStatus) = (Class)v6;
  sub_1B9F11240(v7, (SEL *)&selRef_channelSubscriptionStatusDidChangeFromStatus_);

}

@end
