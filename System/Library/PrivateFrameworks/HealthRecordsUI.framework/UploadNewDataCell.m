@implementation UploadNewDataCell

- (_TtC15HealthRecordsUI17UploadNewDataCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC15HealthRecordsUI17UploadNewDataCell *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell____lazy_storage___button) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for UploadNewDataCell();
  v8 = -[UploadNewDataCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1BC5A9E70();

  return v8;
}

- (_TtC15HealthRecordsUI17UploadNewDataCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC15HealthRecordsUI17UploadNewDataCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell____lazy_storage___button) = 0;
  v5 = a3;

  result = (_TtC15HealthRecordsUI17UploadNewDataCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC348D78((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell_item, (uint64_t (*)(_QWORD))sub_1BC3A0AB8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17UploadNewDataCell____lazy_storage___button));
}

@end
