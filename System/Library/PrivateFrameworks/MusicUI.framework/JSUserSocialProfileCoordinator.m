@implementation JSUserSocialProfileCoordinator

- (JSValue)userProfile
{
  _TtC7MusicUI30JSUserSocialProfileCoordinator *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21D24C938();

  return (JSValue *)v3;
}

- (id)fetchUserSocialProfile
{
  _TtC7MusicUI30JSUserSocialProfileCoordinator *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21D24C938();

  return v3;
}

- (id)fetchIsCloudAndMediaAccountIdentical
{
  _TtC7MusicUI30JSUserSocialProfileCoordinator *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21D24C938();

  return v3;
}

- (_TtC7MusicUI30JSUserSocialProfileCoordinator)init
{
  sub_21D24EA98();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7MusicUI30JSUserSocialProfileCoordinator_userSocialProfileCoordinator));
  swift_release();
  sub_21CDBDA44((uint64_t)self + OBJC_IVAR____TtC7MusicUI30JSUserSocialProfileCoordinator_pendingProfileFetch, &qword_25533BA18);
  sub_21CDBDA44((uint64_t)self + OBJC_IVAR____TtC7MusicUI30JSUserSocialProfileCoordinator_pendingProfileFetchResolution, &qword_253F67410);
  sub_21CDBDA44((uint64_t)self + OBJC_IVAR____TtC7MusicUI30JSUserSocialProfileCoordinator_pendingIsCloudAndMediaAccountIdenticalFetch, &qword_25533BA18);
  OUTLINED_FUNCTION_0();
}

@end
