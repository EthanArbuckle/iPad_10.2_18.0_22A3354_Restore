@implementation CycleFactorsSectionCollectionViewCell

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CycleFactorsSectionCollectionViewCell isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[CycleFactorsSectionCollectionViewCell setHighlighted:](&v5, sel_setHighlighted_, v3);
  sub_231B1CB14();

}

- (_TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell *)sub_231B1CCFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell____lazy_storage___healthStore) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell____lazy_storage___hostView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)awakeFromNib
{
  _TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell *v2;

  v2 = self;
  sub_231B1D0D8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell____lazy_storage___healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell____lazy_storage___hostView));
  sub_2319B8DCC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell_item);
}

@end
