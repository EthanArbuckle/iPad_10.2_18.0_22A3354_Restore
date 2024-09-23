@implementation AlphabeticalUDCCell

- (_TtC15HealthRecordsUI19AlphabeticalUDCCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI19AlphabeticalUDCCell *)sub_1BC3A66D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI19AlphabeticalUDCCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI19AlphabeticalUDCCell *)sub_1BC3A68CC(a3);
}

- (void)awakeFromNib
{
  _TtC15HealthRecordsUI19AlphabeticalUDCCell *v2;

  v2 = self;
  sub_1BC3A6A18();

}

- (void)showDetailViewController:(id)a3 viewController:(id)a4
{
  id v6;
  _TtC15HealthRecordsUI19AlphabeticalUDCCell *v7;
  id v8;
  _TtC15HealthRecordsUI19AlphabeticalUDCCell *v9;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1BC62D088();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a4;
    v9 = self;
  }
  sub_1BC3A7DD0((uint64_t)v10, a4);

  sub_1BC3801D0((uint64_t)v10, (uint64_t)&qword_1ED6A4840, MEMORY[0x1E0DEE9B8] + 8, (uint64_t)MEMORY[0x1E0DEB940], (uint64_t (*)(_QWORD))sub_1BC34B508);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI19AlphabeticalUDCCell____lazy_storage___store));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI19AlphabeticalUDCCell_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI19AlphabeticalUDCCell____lazy_storage___button));
  swift_bridgeObjectRelease();
  sub_1BC3801D0((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI19AlphabeticalUDCCell_item, (uint64_t)&qword_1EF43AE70, (uint64_t)&qword_1EF42ADC0, MEMORY[0x1E0D2A060], (uint64_t (*)(_QWORD))sub_1BC3A9C44);
  sub_1BC3AA0C8((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI19AlphabeticalUDCCell_sectionContext);
}

@end
