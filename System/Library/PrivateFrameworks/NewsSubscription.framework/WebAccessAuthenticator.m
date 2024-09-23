@implementation WebAccessAuthenticator

- (_TtC16NewsSubscription22WebAccessAuthenticator)init
{
  _TtC16NewsSubscription22WebAccessAuthenticator *result;

  result = (_TtC16NewsSubscription22WebAccessAuthenticator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription22WebAccessAuthenticator_purchaseController));
  sub_1BA350868((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription22WebAccessAuthenticator_authenticationURL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F98]), sel_init);
}

@end
