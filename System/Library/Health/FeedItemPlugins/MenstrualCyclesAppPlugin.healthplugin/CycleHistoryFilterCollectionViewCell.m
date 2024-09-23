@implementation CycleHistoryFilterCollectionViewCell

- (_TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell *)sub_231B1DED4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  _TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell_label;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell_highlightColor;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend((id)objc_opt_self(), sel_hkmc_cycleHistoryFilterBackgroundColor);
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell_labelString);
  *v9 = 0;
  v9[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleHistoryFilterCollectionViewCell();
  return -[CycleHistoryFilterCollectionViewCell isSelected](&v3, sel_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CycleHistoryFilterCollectionViewCell();
  v4 = v5.receiver;
  -[CycleHistoryFilterCollectionViewCell setSelected:](&v5, sel_setSelected_, v3);
  sub_231B1E160();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36CycleHistoryFilterCollectionViewCell_highlightColor));
  swift_bridgeObjectRelease();
}

@end
