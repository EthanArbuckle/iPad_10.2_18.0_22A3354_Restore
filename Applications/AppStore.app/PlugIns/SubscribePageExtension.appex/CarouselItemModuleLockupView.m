@implementation CarouselItemModuleLockupView

- (_TtC22SubscribePageExtension28CarouselItemModuleLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension28CarouselItemModuleLockupView *)sub_1005C86F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension28CarouselItemModuleLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005C9250();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension28CarouselItemModuleLockupView *v2;

  v2 = self;
  sub_1005C8C30();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension28CarouselItemModuleLockupView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1005C7F60(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension28CarouselItemModuleLockupView_smallLockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28CarouselItemModuleLockupView_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28CarouselItemModuleLockupView_smallLockupView));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension28CarouselItemModuleLockupView_selectionHandler), *(_QWORD *)&self->materialBackground[OBJC_IVAR____TtC22SubscribePageExtension28CarouselItemModuleLockupView_selectionHandler]);
}

@end
