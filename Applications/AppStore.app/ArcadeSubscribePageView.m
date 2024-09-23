@implementation ArcadeSubscribePageView

- (_TtC8AppStore23ArcadeSubscribePageView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8AppStore23ArcadeSubscribePageView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_dismissActionBlock);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_headerView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_contentView) = 0;
  v5 = a3;

  result = (_TtC8AppStore23ArcadeSubscribePageView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ArcadeSubscribePageView.swift", 38, 2, 216, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore23ArcadeSubscribePageView *v2;

  v2 = self;
  sub_1003D0A28();

}

- (void)didTapDismiss:(id)a3
{
  _TtC8AppStore23ArcadeSubscribePageView *v5;
  void (*v6)(_QWORD *, __n128);
  uint64_t v7;
  __n128 v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v9, a3);
  swift_unknownObjectRelease(a3);
  v6 = *(void (**)(_QWORD *, __n128))((char *)&v5->super.super.super.isa
                                               + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_dismissActionBlock);
  if (v6)
  {
    v7 = *(_QWORD *)&v5->style[OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_dismissActionBlock];
    v8 = swift_retain(v7);
    v6(v9, v8);
    sub_10003A350((uint64_t)v6, v7);
  }

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v9);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self, a2);
  v4 = a3;
  v5 = v6.receiver;
  -[ArcadeSubscribePageView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  objc_msgSend(v5, "setNeedsLayout", v6.receiver, v6.super_class);

}

- (_TtC8AppStore23ArcadeSubscribePageView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore23ArcadeSubscribePageView *result;

  result = (_TtC8AppStore23ArcadeSubscribePageView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.ArcadeSubscribePageView", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_dismissActionBlock), *(_QWORD *)&self->style[OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_dismissActionBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_detailsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_contentView));
}

@end
