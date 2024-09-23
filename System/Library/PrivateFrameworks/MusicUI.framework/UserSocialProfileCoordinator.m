@implementation UserSocialProfileCoordinator

- (_TtC7MusicUI28UserSocialProfileCoordinator)init
{
  sub_21D50E3E8();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  sub_21CDDB4CC(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC7MusicUI28UserSocialProfileCoordinator_pendingUserSelectedPhotoData), *(_QWORD *)&self->socialOnboardingUserAttributes[OBJC_IVAR____TtC7MusicUI28UserSocialProfileCoordinator_pendingUserSelectedPhotoData]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7MusicUI28UserSocialProfileCoordinator__userArtistFavoritesCache;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F5E268);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_11();
  sub_21CDBDA44((uint64_t)self + OBJC_IVAR____TtC7MusicUI28UserSocialProfileCoordinator_artwork, &qword_253F655E8);
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  objc_release(*(id *)((char *)&self->super.isa
                     + (unint64_t)OBJC_IVAR____TtC7MusicUI28UserSocialProfileCoordinator__userSocialProfile[0]));
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  swift_release();
}

@end
