@implementation AdComponentView

- (void)presentComponentWithChanges:(id)a3
{
  int v3;
  id v4;
  objc_super v5;

  v3 = *(_DWORD *)&a3.var0;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[SXComponentView presentComponentWithChanges:](&v5, sel_presentComponentWithChanges_, *(_QWORD *)&v3 & 0x10101);
  sub_1B9E4DD24();

}

- (void)renderContents
{
  _TtC12NewsArticles15AdComponentView *v2;

  v2 = self;
  sub_1B9E4E04C();

}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v6;
  _TtC12NewsArticles15AdComponentView *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[32];

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_1BA0BF218();
  swift_unknownObjectRelease();
  v8 = sub_1BA0BE840();
  v10 = v9;

  sub_1B9E4E33C((uint64_t)v11, v8, v10);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  _TtC12NewsArticles15AdComponentView *v4;

  v4 = self;
  sub_1B9E4E528(a3);

}

- (_TtC12NewsArticles15AdComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6
{
  id v7;
  _TtC12NewsArticles15AdComponentView *result;

  swift_unknownObjectRetain();
  v7 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  result = (_TtC12NewsArticles15AdComponentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles15AdComponentView_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles15AdComponentView____lazy_storage___debugView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles15AdComponentView_bannerAdFactory);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles15AdComponentView_bannerAdRenderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles15AdComponentView_integrator);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles15AdComponentView_tracker);
  swift_release();
  sub_1B9E4F9E8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles15AdComponentView_layoutAttributes, &qword_1ED595158, (void (*)(uint64_t))MEMORY[0x1E0D535B0]);
}

@end
