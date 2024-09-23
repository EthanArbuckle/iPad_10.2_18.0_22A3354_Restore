@implementation SharedMedicationsMonthHighlightCell

- (_TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell)initWithFrame:(CGRect)a3
{
  _TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell *result;

  sub_2317F9DD8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell)initWithCoder:(id)a3
{
  return (_TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell *)sub_2317FA01C(a3);
}

- (void)awakeFromNib
{
  _TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell *v2;

  v2 = self;
  sub_2317FA12C();

}

- (void).cxx_destruct
{
  sub_2317FAF6C((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell_item);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin35SharedMedicationsMonthHighlightCell____lazy_storage___hostingController));
}

@end
