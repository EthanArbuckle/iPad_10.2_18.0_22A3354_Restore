@implementation HistoricalSampleCell

- (_TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell *)sub_23198B404(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell_titleLabel;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell_dateRangeLabel;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell____lazy_storage___chevronImage) = 0;

  result = (_TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HistoricalSampleCell();
  return -[HistoricalSampleCell isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  char **v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HistoricalSampleCell();
  v4 = v8.receiver;
  -[HistoricalSampleCell setHighlighted:](&v8, sel_setHighlighted_, v3);
  LODWORD(v3) = objc_msgSend(v4, sel_isHighlighted, v8.receiver, v8.super_class);
  v5 = (void *)objc_opt_self();
  v6 = &selRef_quaternarySystemFillColor;
  if (!(_DWORD)v3)
    v6 = &selRef_secondarySystemGroupedBackgroundColor;
  v7 = objc_msgSend(v5, *v6);
  objc_msgSend(v4, sel_setBackgroundColor_, v7);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell_dateRangeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20HistoricalSampleCell____lazy_storage___chevronImage));
}

@end
