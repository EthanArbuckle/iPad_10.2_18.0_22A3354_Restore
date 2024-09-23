@implementation DismissibleTileHeaderView

- (void)didReceiveSignificantTimeChangeNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI25DismissibleTileHeaderView *v8;
  uint64_t v9;

  v4 = sub_1A9A91A74();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A91A38();
  v8 = self;
  sub_1A9A1729C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI25DismissibleTileHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_1A9A1A1C8(a3);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1A99E9AEC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1A9A1B560);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1A99E9AEC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1A9A1B670);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  _TtC18HealthExperienceUI25DismissibleTileHeaderView *v6;
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
  v12.super_class = (Class)type metadata accessor for DismissibleTileHeaderView();
  -[DismissibleTileHeaderView touchesCancelled:withEvent:](&v12, sel_touchesCancelled_withEvent_, v8, v7);

  v9 = (void **)((char *)&v6->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessoryLabel);
  swift_beginAccess();
  v10 = *v9;
  if (v10)
  {
    v11 = (Class *)((char *)&v6->super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessoryColor);
    swift_beginAccess();
    objc_msgSend(v10, sel_setTextColor_, *v11);
  }

  swift_bridgeObjectRelease();
}

- (id)accessibilityAccessoryLabel
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessoryLabel);
  swift_beginAccess();
  return *v2;
}

- (_TtC18HealthExperienceUI25DismissibleTileHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI25DismissibleTileHeaderView *)DismissibleTileHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI25DismissibleTileHeaderView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI25DismissibleTileHeaderView *)DismissibleTileHeaderView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_heightConstraint));
  sub_1A980D878((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_dataSource, &qword_1ED27BF10, (uint64_t)&qword_1ED27BF08, (uint64_t)&protocol descriptor for TileHeaderDataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessoryColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessoryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_detailContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25DismissibleTileHeaderView_accessorySeparator));
  swift_bridgeObjectRelease();
}

@end
