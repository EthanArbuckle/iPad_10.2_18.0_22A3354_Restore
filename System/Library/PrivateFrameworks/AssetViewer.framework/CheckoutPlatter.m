@implementation CheckoutPlatter

- (void)applePayButtonPressed
{
  if (MEMORY[0x1DF08DD88]((char *)self + OBJC_IVAR____TtC11AssetViewer15CheckoutPlatter_delegate, a2))
  {
    swift_retain();
    sub_1D9435E50();
    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)contentSizeCategoryDidChange
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer15CheckoutPlatter_traitManager);
  v3 = (void *)objc_opt_self();
  swift_retain();
  v4 = objc_msgSend(v3, sel_currentTraitCollection);
  v5 = objc_msgSend(v4, sel_preferredContentSizeCategory);

  v6 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v5;

  sub_1D94BFDC0();
  swift_release();
}

@end
