@implementation CycleFactorsShowAllFactorsCollectionViewCell

- (_TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell *v10;
  _TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell_textLabel;
  v9 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  *(Class *)((char *)&v10->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell____lazy_storage___chevronImage) = 0;

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for CycleFactorsShowAllFactorsCollectionViewCell();
  v11 = -[CycleFactorsShowAllFactorsCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_231B375C4();

  return v11;
}

- (_TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell_textLabel;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell____lazy_storage___chevronImage) = 0;

  result = (_TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleFactorsShowAllFactorsCollectionViewCell();
  return -[CycleFactorsShowAllFactorsCollectionViewCell isHighlighted](&v3, sel_isHighlighted);
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
  v8.super_class = (Class)type metadata accessor for CycleFactorsShowAllFactorsCollectionViewCell();
  v4 = v8.receiver;
  -[CycleFactorsShowAllFactorsCollectionViewCell setHighlighted:](&v8, sel_setHighlighted_, v3);
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
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin44CycleFactorsShowAllFactorsCollectionViewCell____lazy_storage___chevronImage));
}

@end
