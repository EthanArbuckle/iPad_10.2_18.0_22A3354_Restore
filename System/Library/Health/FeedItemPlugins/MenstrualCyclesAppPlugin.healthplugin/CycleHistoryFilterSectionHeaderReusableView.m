@implementation CycleHistoryFilterSectionHeaderReusableView

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView *v10;
  _QWORD *v11;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabel;
  v9 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = (Class *)((char *)&v10->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabelText);
  *v11 = 0;
  v11[1] = 0;

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for CycleHistoryFilterSectionHeaderReusableView();
  v12 = -[CycleHistoryFilterSectionHeaderReusableView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_231C663C0();

  return v12;
}

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  _TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabel;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabelText);
  *v8 = 0;
  v8[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFilterSectionHeaderReusableView_sectionHeaderLabel));
  swift_bridgeObjectRelease();
}

@end
