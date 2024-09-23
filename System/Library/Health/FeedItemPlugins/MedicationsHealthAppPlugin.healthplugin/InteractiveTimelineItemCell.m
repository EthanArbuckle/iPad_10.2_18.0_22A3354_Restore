@implementation InteractiveTimelineItemCell

- (NSString)description
{
  _TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell *v3;
  void *v4;

  swift_getObjectType();
  v3 = self;
  sub_2318D63CC();
  sub_2318D56A0();
  swift_bridgeObjectRelease();
  sub_2318D56A0();
  sub_2318D6138();

  v4 = (void *)sub_2318D558C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell *)sub_2318883D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell____lazy_storage___hostView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InteractiveTimelineItemCell();
  return -[InteractiveTimelineItemCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_2317FAF6C((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin27InteractiveTimelineItemCell____lazy_storage___hostView));
}

@end
