@implementation MiniMastheadViewProvider

- (_TtC7NewsUI224MiniMastheadViewProvider)init
{
  _TtC7NewsUI224MiniMastheadViewProvider *result;

  result = (_TtC7NewsUI224MiniMastheadViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_compactMiniMastheadView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_regularMiniMastheadView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider____lazy_storage___regularContainerTitleView));
  sub_1D5E8D20C((uint64_t)self + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_model, (uint64_t (*)(_QWORD))type metadata accessor for MiniMastheadModel);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_layoutAttributesFactory);
  swift_unknownObjectRelease();
}

- (id)styleTitleText:(id)a3 styleType:(unint64_t)a4 boundingSize:(CGSize)a5
{
  int v6;
  int v7;
  int v8;
  void *v9;
  _TtC7NewsUI224MiniMastheadViewProvider *v10;
  id v11;
  id v12;

  v6 = sub_1D6E26978();
  v8 = v7;
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_compactMiniMastheadView);
  v10 = self;
  v11 = objc_msgSend(v9, sel_traitCollection);
  v12 = sub_1D6D62E84(v6, v8, v11);

  swift_bridgeObjectRelease();
  return v12;
}

- (void)feedTitleViewDidTapOnTitleView:(id)a3
{
  id v4;
  _TtC7NewsUI224MiniMastheadViewProvider *v5;

  v4 = a3;
  v5 = self;
  sub_1D66F2ADC(v4);

}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4;
  _TtC7NewsUI224MiniMastheadViewProvider *v5;

  v4 = a3;
  v5 = self;
  sub_1D66F2C70(v4);

}

@end
