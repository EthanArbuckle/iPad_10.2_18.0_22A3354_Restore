@implementation ClimateButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateButton();
  return -[ClimateButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClimateButton();
  v4 = v5.receiver;
  -[ClimateButton setHighlighted:](&v5, "setHighlighted:", v3);
  sub_100043EB4();

}

- (_TtC7Climate13ClimateButton)init
{
  return (_TtC7Climate13ClimateButton *)ClimateButton.init()();
}

- (_TtC7Climate13ClimateButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s7Climate0A6ButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  _TtC7Climate13ClimateButton *v2;

  v2 = self;
  ClimateButton.layoutSubviews()();

}

- (void)touchUpInsideActionTriggered
{
  _TtC7Climate13ClimateButton *v2;

  v2 = self;
  ClimateButton.touchUpInsideActionTriggered()();

}

- (void)longPressGestureTriggered:(id)a3
{
  id v4;
  _TtC7Climate13ClimateButton *v5;

  v4 = a3;
  v5 = self;
  ClimateButton.longPressGestureTriggered(_:)(v4);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100044CAC(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesBegan_withEvent_, 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_100044CAC(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_, 0);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_100044EB4(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_pressesBegan_withEvent_, 1);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  sub_100044EB4(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_pressesEnded_withEvent_, 0);
}

- (void)didMoveToSuperview
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateButton();
  v2 = v3.receiver;
  -[ClimateButton didMoveToSuperview](&v3, "didMoveToSuperview");
  sub_10005A0F0();

}

- (_TtC7Climate13ClimateButton)initWithFrame:(CGRect)a3
{
  _TtC7Climate13ClimateButton *result;

  result = (_TtC7Climate13ClimateButton *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimateButton", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  sub_100005118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7Climate13ClimateButton_action), *(_QWORD *)&self->action[OBJC_IVAR____TtC7Climate13ClimateButton_action]);
  sub_10001BF8C((uint64_t)self + OBJC_IVAR____TtC7Climate13ClimateButton_popoverDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate13ClimateButton____lazy_storage___imageSymbolConfiguration));
  swift_bridgeObjectRelease(*(_QWORD *)&self->action[OBJC_IVAR____TtC7Climate13ClimateButton_imageSystemName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->action[OBJC_IVAR____TtC7Climate13ClimateButton_title]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate13ClimateButton_attributedTitle));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7Climate13ClimateButton_colorConfig);
  v4 = *(void **)&self->action[OBJC_IVAR____TtC7Climate13ClimateButton_colorConfig];
  swift_bridgeObjectRelease(*(_QWORD *)&self->action[OBJC_IVAR____TtC7Climate13ClimateButton_colorConfig + 8]);

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate13ClimateButton_backgroundView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->action[OBJC_IVAR____TtC7Climate13ClimateButton_accessibilityLabelModifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->action[OBJC_IVAR____TtC7Climate13ClimateButton_accessibilityIdentifierModifier]);
}

@end
