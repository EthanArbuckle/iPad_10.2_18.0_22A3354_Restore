@implementation NameLogoMastheadViewProvider

- (_TtC7NewsUI228NameLogoMastheadViewProvider)init
{
  _TtC7NewsUI228NameLogoMastheadViewProvider *result;

  result = (_TtC7NewsUI228NameLogoMastheadViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  id v5;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228NameLogoMastheadViewProvider_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228NameLogoMastheadViewProvider_layoutAttributesFactory);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI228NameLogoMastheadViewProvider_margins;
  v4 = sub_1D6E1E4D0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI228NameLogoMastheadViewProvider_model);
  swift_unknownObjectRelease();

}

@end
