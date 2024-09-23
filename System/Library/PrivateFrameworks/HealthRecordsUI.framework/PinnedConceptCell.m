@implementation PinnedConceptCell

- (_TtC15HealthRecordsUI17PinnedConceptCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI17PinnedConceptCell____lazy_storage___accessoryImageView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PinnedConceptCell();
  return -[ListCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15HealthRecordsUI17PinnedConceptCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI17PinnedConceptCell____lazy_storage___accessoryImageView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PinnedConceptCell();
  return -[ListCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17PinnedConceptCell____lazy_storage___accessoryImageView));
}

@end
