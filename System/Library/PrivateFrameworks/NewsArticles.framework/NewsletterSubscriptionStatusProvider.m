@implementation NewsletterSubscriptionStatusProvider

- (_TtC12NewsArticles36NewsletterSubscriptionStatusProvider)init
{
  uint64_t v3;
  _TtC12NewsArticles36NewsletterSubscriptionStatusProvider *result;

  v3 = OBJC_IVAR____TtC12NewsArticles36NewsletterSubscriptionStatusProvider_observers;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable);

  result = (_TtC12NewsArticles36NewsletterSubscriptionStatusProvider *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles36NewsletterSubscriptionStatusProvider_observers));
}

- (unint64_t)newsletterSubscriptionStatus
{
  _TtC12NewsArticles36NewsletterSubscriptionStatusProvider *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1B9F40704();

  return v3;
}

- (void)addObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles36NewsletterSubscriptionStatusProvider_observers), sel_addObject_, a3);
}

- (void)removeObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles36NewsletterSubscriptionStatusProvider_observers), sel_removeObject_, a3);
}

- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3
{
  _TtC12NewsArticles36NewsletterSubscriptionStatusProvider *v4;

  v4 = self;
  sub_1B9F40868(a3);

}

@end
