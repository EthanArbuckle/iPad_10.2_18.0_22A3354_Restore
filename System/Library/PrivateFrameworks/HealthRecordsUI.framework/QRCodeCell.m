@implementation QRCodeCell

- (_TtC15HealthRecordsUI10QRCodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI10QRCodeCell *)sub_1BC39F6B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI10QRCodeCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC15HealthRecordsUI10QRCodeCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI10QRCodeCell____lazy_storage___QRCodeView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI10QRCodeCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC15HealthRecordsUI10QRCodeCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI10QRCodeCell____lazy_storage___QRCodeView));
  sub_1BC37AE60((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI10QRCodeCell_item);
}

@end
