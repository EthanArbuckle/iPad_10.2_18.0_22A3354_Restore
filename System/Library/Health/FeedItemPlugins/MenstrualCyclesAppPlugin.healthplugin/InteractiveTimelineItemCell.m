@implementation InteractiveTimelineItemCell

- (NSString)description
{
  _TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell *v3;
  void *v4;

  swift_getObjectType();
  v3 = self;
  sub_231CA2D0C();
  sub_231CA1CC8();
  swift_bridgeObjectRelease();
  sub_231CA1CC8();
  sub_231CA29AC();

  v4 = (void *)sub_231CA1BD8();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell *)sub_2319B80AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell____lazy_storage___hostView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractiveTimelineItemCell();
  return -[InteractiveTimelineItemCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void)awakeFromNib
{
  _TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell *v2;

  v2 = self;
  sub_2319B83A4();

}

- (void).cxx_destruct
{
  sub_2319B8DCC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27InteractiveTimelineItemCell____lazy_storage___hostView));
}

@end
