@implementation BundleSoftPaywallViewProvider

- (_TtC16NewsSubscription29BundleSoftPaywallViewProvider)init
{
  _TtC16NewsSubscription29BundleSoftPaywallViewProvider *result;

  result = (_TtC16NewsSubscription29BundleSoftPaywallViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BA3110FC((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29BundleSoftPaywallViewProvider_delegate);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29BundleSoftPaywallViewProvider_styler);
  sub_1BA3000D8((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29BundleSoftPaywallViewProvider_viewModel, type metadata accessor for BundlePaywallViewModel);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription29BundleSoftPaywallViewProvider_bundleSoftPaywallView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29BundleSoftPaywallViewProvider_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29BundleSoftPaywallViewProvider_layoutAttributesFactory);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BA30A084((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29BundleSoftPaywallViewProvider_videoFileURL, &qword_1ED5C2050, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC16NewsSubscription29BundleSoftPaywallViewProvider *v15;
  uint64_t v17;

  v9 = sub_1BA435EFC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA435ECC();
  v14 = a3;
  v15 = self;
  LOBYTE(a6) = sub_1BA311074((uint64_t)v13, a6);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  return a6 & 1;
}

@end
