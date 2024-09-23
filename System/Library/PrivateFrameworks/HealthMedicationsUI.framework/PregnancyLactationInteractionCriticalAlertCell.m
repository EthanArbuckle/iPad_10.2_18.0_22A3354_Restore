@implementation PregnancyLactationInteractionCriticalAlertCell

- (_TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell *)sub_1BC1612EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell *)sub_1BC161654(a3);
}

- (void)awakeFromNib
{
  _TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell *v2;

  v2 = self;
  sub_1BC1618DC();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell *v8;
  uint64_t v9;

  v4 = sub_1BC2B3B00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2B3AF4();
  v8 = self;
  sub_1BC161A68();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  _TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  objc_super v14;

  sub_1BC0E1D38(0, &qword_1EF3FB3F8);
  sub_1BC16418C();
  v6 = sub_1BC2B47B4();
  v7 = self;
  v8 = a4;
  v9 = sub_1BC160F24(v6);
  if (v9
    && (v10 = (void *)v9,
        v11 = sub_1BC161DC4(),
        v12 = MEMORY[0x1BCCEE41C](v10, v11, 36.0, 36.0),
        v11,
        v10,
        (v12 & 1) != 0))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = (void *)sub_1BC2B47A8();
    v14.receiver = v7;
    v14.super_class = (Class)type metadata accessor for PregnancyLactationInteractionCriticalAlertCell();
    -[PregnancyLactationInteractionCriticalAlertCell touchesBegan:withEvent:](&v14, sel_touchesBegan_withEvent_, v13, v8);

    swift_bridgeObjectRelease();
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell *v8;

  sub_1BC0E1D38(0, &qword_1EF3FB3F8);
  sub_1BC16418C();
  v6 = sub_1BC2B47B4();
  v7 = a4;
  v8 = self;
  sub_1BC164308(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell_item);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell____lazy_storage___medmojiView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell____lazy_storage___dismissLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell_pregnancyTitleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell_lactationTitleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI46PregnancyLactationInteractionCriticalAlertCell____lazy_storage___learnMoreLabel));
}

@end
