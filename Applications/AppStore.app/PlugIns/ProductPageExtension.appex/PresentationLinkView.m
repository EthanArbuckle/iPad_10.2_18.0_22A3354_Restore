@implementation PresentationLinkView

- (_TtC20ProductPageExtension20PresentationLinkView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20PresentationLinkView *)sub_1003AD294(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20PresentationLinkView)initWithCoder:(id)a3
{
  _TtC20ProductPageExtension20PresentationLinkView *result;

  result = (_TtC20ProductPageExtension20PresentationLinkView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/PresentationLinkView.swift", 47, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t ObjectType;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _TtC20ProductPageExtension20PresentationLinkView *v12;
  CGRect v13;

  ObjectType = swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension20PresentationLinkView_linkView);
  v12 = self;
  LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v4, "sizeThatFits:", v5, v6);
  v8 = v7;
  v9 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  v11 = v10;
  v13.origin.x = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v4, "setFrame:", v9, v11, CGRectGetWidth(v13), v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20PresentationLinkView_linkView));
}

@end
