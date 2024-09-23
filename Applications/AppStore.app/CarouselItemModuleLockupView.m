@implementation CarouselItemModuleLockupView

- (_TtC8AppStore28CarouselItemModuleLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28CarouselItemModuleLockupView *)sub_10024A484(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28CarouselItemModuleLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10024B954();
}

- (void)layoutSubviews
{
  _TtC8AppStore28CarouselItemModuleLockupView *v2;

  v2 = self;
  sub_10024A9BC();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore28CarouselItemModuleLockupView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10024ABC4(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore28CarouselItemModuleLockupView_smallLockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28CarouselItemModuleLockupView_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28CarouselItemModuleLockupView_smallLockupView));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore28CarouselItemModuleLockupView_selectionHandler), *(_QWORD *)&self->materialBackground[OBJC_IVAR____TtC8AppStore28CarouselItemModuleLockupView_selectionHandler]);
}

@end
