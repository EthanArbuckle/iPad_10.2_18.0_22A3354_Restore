@implementation MastheadViewProvider

- (_TtC7NewsUI220MastheadViewProvider)init
{
  _TtC7NewsUI220MastheadViewProvider *result;

  result = (_TtC7NewsUI220MastheadViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220MastheadViewProvider_layoutAttributesFactory);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI220MastheadViewProvider_margins;
  v4 = sub_1D6E1E4D0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();

  swift_release();
  sub_1D64C0A80((uint64_t)self + OBJC_IVAR____TtC7NewsUI220MastheadViewProvider_lastLayoutOptions);
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI220MastheadViewProvider_mastheadable);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4;
  _TtC7NewsUI220MastheadViewProvider *v5;

  v4 = a3;
  v5 = self;
  sub_1D64C0B98();

}

@end
