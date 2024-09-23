@implementation ClinicalSharingSelectableAuthorizationCategoryCell

- (_TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell *)ClinicalSharingSelectableAuthorizationCategoryCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell_switchTrailingMargin) = (Class)0x4034000000000000;
  v6 = OBJC_IVAR____TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell_selectionSwitch;
  v7 = objc_allocWithZone(MEMORY[0x1E0DC3D18]);
  v8 = a3;
  v9 = objc_msgSend(v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 1);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v6) = (Class)v9;

  result = (_TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)switchUpdated
{
  _TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell *v2;

  v2 = self;
  sub_1BC3AE910();

}

- (void).cxx_destruct
{
  sub_1BC377E3C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell_item, (unint64_t *)&qword_1EF43AE70, (uint64_t (*)(uint64_t))sub_1BC37AE0C);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI50ClinicalSharingSelectableAuthorizationCategoryCell_selectionSwitch));
}

@end
