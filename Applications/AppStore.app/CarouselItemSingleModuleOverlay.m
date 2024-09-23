@implementation CarouselItemSingleModuleOverlay

- (_TtC8AppStore31CarouselItemSingleModuleOverlay)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31CarouselItemSingleModuleOverlay *)sub_10027CBB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31CarouselItemSingleModuleOverlay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10027DADC();
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC8AppStore31CarouselItemSingleModuleOverlay *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v18.receiver = self;
  v18.super_class = ObjectType;
  v4 = self;
  -[CarouselItemSingleModuleOverlay layoutSubviews](&v18, "layoutSubviews");
  sub_10027CFB4(v15);
  v5 = v16;
  v6 = v17;
  sub_100060B40(v15, v16);
  *(_QWORD *)&v7 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType).n128_u64[0];
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[CarouselItemSingleModuleOverlay traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v14, v5, v6, v7, v9, v11, v13);

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v15);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore31CarouselItemSingleModuleOverlay *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[5];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10024B4EC(width, height);
  sub_10027CFB4(v12);
  v7 = sub_1005725C0((uint64_t)v12, v6, height);
  v9 = v8;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v12);

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore31CarouselItemSingleModuleOverlay *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10027DCD4(v7);

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
  _TtC8AppStore31CarouselItemSingleModuleOverlay *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_selectionHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->headerView[OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_selectionHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_tapGestureRecognizer));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_displayOptions;
  v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_selectionHandler), *(_QWORD *)&self->headerView[OBJC_IVAR____TtC8AppStore31CarouselItemSingleModuleOverlay_selectionHandler]);
}

@end
