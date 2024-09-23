@implementation MedicationListItemCell

- (UILabel)primaryLabel
{
  _TtC19HealthMedicationsUI22MedicationListItemCell *v2;
  id v3;

  v2 = self;
  v3 = sub_1BC1779B4();

  return (UILabel *)v3;
}

- (void)setPrimaryLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___primaryLabel);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___primaryLabel) = (Class)a3;
  v3 = a3;

}

- (_TtC27HealthMedicationsExperience14MedicationView)pillImageView
{
  _TtC19HealthMedicationsUI22MedicationListItemCell *v2;
  id v3;

  v2 = self;
  v3 = sub_1BC177D80();

  return (_TtC27HealthMedicationsExperience14MedicationView *)v3;
}

- (void)setPillImageView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___pillImageView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___pillImageView) = (Class)a3;
  v3 = a3;

}

- (UIStackView)medicationDetailStackView
{
  _TtC19HealthMedicationsUI22MedicationListItemCell *v2;
  id v3;

  v2 = self;
  v3 = sub_1BC177E90();

  return (UIStackView *)v3;
}

- (void)setMedicationDetailStackView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___medicationDetailStackView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___medicationDetailStackView) = (Class)a3;
  v3 = a3;

}

- (UIStackView)scheduleStackView
{
  _TtC19HealthMedicationsUI22MedicationListItemCell *v2;
  id v3;

  v2 = self;
  v3 = sub_1BC177F04();

  return (UIStackView *)v3;
}

- (void)setScheduleStackView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___scheduleStackView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___scheduleStackView) = (Class)a3;
  v3 = a3;

}

- (UIStackView)metaScheduleStackView
{
  _TtC19HealthMedicationsUI22MedicationListItemCell *v2;
  id v3;

  v2 = self;
  v3 = sub_1BC177F78();

  return (UIStackView *)v3;
}

- (void)setMetaScheduleStackView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___metaScheduleStackView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___metaScheduleStackView) = (Class)a3;
  v3 = a3;

}

- (UIStackView)itemsStackView
{
  _TtC19HealthMedicationsUI22MedicationListItemCell *v2;
  id v3;

  v2 = self;
  v3 = sub_1BC1780B4();

  return (UIStackView *)v3;
}

- (void)setItemsStackView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___itemsStackView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___itemsStackView) = (Class)a3;
  v3 = a3;

}

- (_TtC19HealthMedicationsUI22MedicationListItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI22MedicationListItemCell *)sub_1BC178314(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI22MedicationListItemCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI22MedicationListItemCell *)sub_1BC1785E8(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC19HealthMedicationsUI22MedicationListItemCell *v8;
  uint64_t v9;

  v4 = sub_1BC2B3B00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC2B3AF4();
  v8 = self;
  sub_1BC179600();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  sub_1BC0F7954((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___disclosureIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___pillImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___medicationDetailStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___scheduleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___metaScheduleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___itemsStackView));
  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell_logger;
  v4 = sub_1BC2B39E0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationListItemCell____lazy_storage___minHeightConstraint));
}

@end
