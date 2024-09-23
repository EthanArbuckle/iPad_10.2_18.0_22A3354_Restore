@implementation PersonalizedMediaTokenService

- (id)fetchMediaToken
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC19AppStoreKitInternal29PersonalizedMediaTokenService_tokenService), sel_fetchMediaToken);
}

- (void)accountsDidChange
{
  _TtC19AppStoreKitInternal29PersonalizedMediaTokenService *v2;

  v2 = self;
  sub_1D883063C();

}

- (void)invalidateMediaToken
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal29PersonalizedMediaTokenService_tokenService), sel_invalidateMediaToken);
}

- (_TtC19AppStoreKitInternal29PersonalizedMediaTokenService)init
{
  _TtC19AppStoreKitInternal29PersonalizedMediaTokenService *result;

  result = (_TtC19AppStoreKitInternal29PersonalizedMediaTokenService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal29PersonalizedMediaTokenService_tokenService));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal29PersonalizedMediaTokenService_queue));
}

@end
