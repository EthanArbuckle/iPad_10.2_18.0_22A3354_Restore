@implementation SocialOnboardingContactsMatchingRequestOperation

- (void)execute
{
  _TtC7MusicUI48SocialOnboardingContactsMatchingRequestOperation *v2;

  v2 = self;
  sub_21D174240();

}

- (void)finishWithError:(id)a3
{
  _TtC7MusicUI48SocialOnboardingContactsMatchingRequestOperation *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_21D174814((uint64_t)a3);

}

- (_TtC7MusicUI48SocialOnboardingContactsMatchingRequestOperation)init
{
  sub_21D176F28();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUI48SocialOnboardingContactsMatchingRequestOperation_accessQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUI48SocialOnboardingContactsMatchingRequestOperation_contactStore));
  swift_bridgeObjectRelease();
  sub_21CDBD660(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC7MusicUI48SocialOnboardingContactsMatchingRequestOperation__responseHandler));
}

@end
