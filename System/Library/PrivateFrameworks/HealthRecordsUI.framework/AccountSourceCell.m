@implementation AccountSourceCell

- (_TtC15HealthRecordsUI17AccountSourceCell)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI17AccountSourceCell *)sub_1BC5D5188(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI17AccountSourceCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC5D6774();
}

- (void)prepareForReuse
{
  _TtC15HealthRecordsUI17AccountSourceCell *v2;

  v2 = self;
  sub_1BC5D6208();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___logoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___webLinkButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell____lazy_storage___stackView));
  sub_1BC384EB4((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell_accountURL, (unint64_t *)&qword_1EF42B258, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  sub_1BC384EB4((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI17AccountSourceCell_item, (unint64_t *)&qword_1EF43AE70, (void (*)(uint64_t))sub_1BC37AE0C);
}

@end
