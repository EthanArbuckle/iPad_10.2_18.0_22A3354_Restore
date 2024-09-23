@implementation CarouselItemLockupOverlay

- (_TtC8AppStore25CarouselItemLockupOverlay)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore25CarouselItemLockupOverlay *)sub_10061BB5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore25CarouselItemLockupOverlay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10061DA60();
}

- (void)layoutSubviews
{
  _TtC8AppStore25CarouselItemLockupOverlay *v2;

  v2 = self;
  sub_10061C658();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore25CarouselItemLockupOverlay *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10061C890(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore25CarouselItemLockupOverlay *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10061DB3C(v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)handleSelection:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC8AppStore25CarouselItemLockupOverlay *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore25CarouselItemLockupOverlay_selectionHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->materialBackground[OBJC_IVAR____TtC8AppStore25CarouselItemLockupOverlay_selectionHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8AppStore25CarouselItemLockupOverlay_smallLockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CarouselItemLockupOverlay_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CarouselItemLockupOverlay_smallLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CarouselItemLockupOverlay_tapGestureRecognizer));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore25CarouselItemLockupOverlay_selectionHandler), *(_QWORD *)&self->materialBackground[OBJC_IVAR____TtC8AppStore25CarouselItemLockupOverlay_selectionHandler]);
}

@end
