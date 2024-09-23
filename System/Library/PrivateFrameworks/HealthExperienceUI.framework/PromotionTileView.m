@implementation PromotionTileView

- (_TtC18HealthExperienceUI17PromotionTileView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI17PromotionTileView *)sub_1A99EC004(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI17PromotionTileView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI17PromotionTileViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)didMoveToSuperview
{
  _TtC18HealthExperienceUI17PromotionTileView *v2;

  v2 = self;
  sub_1A99EC344();

}

- (void)didChangePreferredContentSize
{
  id v2;
  id v3;
  _TtC18HealthExperienceUI17PromotionTileView *v4;

  v4 = self;
  v2 = sub_1A99EBA6C();
  objc_msgSend(v2, sel_invalidateIntrinsicContentSize);

  v3 = sub_1A99EBD5C();
  objc_msgSend(v3, sel_invalidateIntrinsicContentSize);

  sub_1A99EC410();
}

- (void)didTapAction:(id)a3
{
  sub_1A966943C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A99EE1E0);
}

- (void)didTapLinkAction:(id)a3
{
  sub_1A966943C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A99EE7A0);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_pluginActionHandler));
  sub_1A9623874((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_context, (uint64_t (*)(_QWORD))sub_1A96A1690);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_accessoryColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_accessoryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView____lazy_storage___heroView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView____lazy_storage___title));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView____lazy_storage___body));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView____lazy_storage___link));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView____lazy_storage___primaryButton));
  swift_bridgeObjectRelease();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1A99E9AEC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))PromotionTileView.touchesBegan(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1A99E9AEC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))PromotionTileView.touchesEnded(_:with:));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  _TtC18HealthExperienceUI17PromotionTileView *v6;
  id v7;
  void *v8;
  void **v9;
  void *v10;
  _QWORD *v11;
  objc_super v12;

  sub_1A9627620(0, (unint64_t *)&qword_1EEB135F8);
  sub_1A99ADA4C();
  sub_1A9A95C44();
  v6 = self;
  v7 = a4;
  v8 = (void *)sub_1A9A95C38();
  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for PromotionTileView();
  -[PromotionTileView touchesCancelled:withEvent:](&v12, sel_touchesCancelled_withEvent_, v8, v7);

  v9 = (void **)((char *)&v6->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_accessoryLabel);
  swift_beginAccess();
  v10 = *v9;
  if (v10)
  {
    v11 = (Class *)((char *)&v6->super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_accessoryColor);
    swift_beginAccess();
    objc_msgSend(v10, sel_setTextColor_, *v11);
  }

  swift_bridgeObjectRelease();
}

@end
