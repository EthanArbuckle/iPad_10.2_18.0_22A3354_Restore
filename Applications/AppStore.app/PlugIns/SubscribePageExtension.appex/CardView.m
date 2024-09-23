@implementation CardView

- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView *)sub_1005C4C80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView)initWithCoder:(id)a3
{
  return (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView *)sub_1005C4DA8(a3);
}

- (void)didTapFrom:(id)a3
{
  id v4;
  void (*v5)(__n128);
  uint64_t v6;
  __n128 v7;
  _TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView *v8;

  v4 = a3;
  v8 = self;
  if (objc_msgSend(v4, "state") == (id)3)
  {
    v5 = *(void (**)(__n128))((char *)&v8->super.super.super.isa
                                       + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView_tapAction);
    if (v5)
    {
      v6 = *(_QWORD *)&v8->tintView[OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView_tapAction];
      v7 = swift_retain(v6);
      v5(v7);
      sub_100019310((uint64_t)v5, v6);
    }
  }

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView_tintView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView_viewConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView_view));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView_tapAction), *(_QWORD *)&self->tintView[OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D11068CardView_tapAction]);
}

@end
