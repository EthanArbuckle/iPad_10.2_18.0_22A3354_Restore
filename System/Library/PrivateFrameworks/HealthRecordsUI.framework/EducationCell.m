@implementation EducationCell

- (_TtC15HealthRecordsUI13EducationCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI13EducationCell *)sub_1BC5BB6E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI13EducationCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI13EducationCell *)sub_1BC5BB7F8(a3);
}

- (void)awakeFromNib
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EducationCell();
  v2 = v3.receiver;
  -[EducationCell awakeFromNib](&v3, sel_awakeFromNib);
  sub_1BC5BB93C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13EducationCell_arrangedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13EducationCell_educationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI13EducationCell_attributionLabel));
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI13EducationCell_item);
}

@end
