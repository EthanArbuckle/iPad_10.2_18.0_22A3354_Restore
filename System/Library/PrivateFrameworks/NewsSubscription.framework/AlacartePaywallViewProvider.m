@implementation AlacartePaywallViewProvider

- (_TtC16NewsSubscription27AlacartePaywallViewProvider)init
{
  _TtC16NewsSubscription27AlacartePaywallViewProvider *result;

  result = (_TtC16NewsSubscription27AlacartePaywallViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[10];

  sub_1BA3110FC((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_delegate);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_styler);
  sub_1BA3000D8((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_viewModel, (uint64_t (*)(_QWORD))type metadata accessor for AlacartePaywallViewModel);
  v3 = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel + 32];
  v8[6] = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel
                                       + 16];
  v8[7] = v3;
  v4 = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel + 64];
  v8[8] = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel
                                       + 48];
  v8[9] = v4;
  v5 = *(_OWORD *)&self->styler[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel + 8];
  v8[2] = *(_OWORD *)&self->dataProvider[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel
                                       + 8];
  v8[3] = v5;
  v6 = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel];
  v8[4] = *(_OWORD *)&self->styler[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel + 24];
  v8[5] = v6;
  v7 = *(_OWORD *)&self->delegate[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa
                    + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel);
  v8[1] = v7;
  sub_1BA310EC0((uint64_t)v8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_layoutAttributesFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_subscribeButtonTextProvider);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC16NewsSubscription27AlacartePaywallViewProvider *v15;
  uint64_t v17;

  v9 = sub_1BA435EFC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA435ECC();
  v14 = a3;
  v15 = self;
  LOBYTE(a6) = sub_1BA3AC8C4((uint64_t)v13, a6);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  return a6 & 1;
}

@end
