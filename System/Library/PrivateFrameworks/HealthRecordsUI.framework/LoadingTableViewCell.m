@implementation LoadingTableViewCell

- (_TtC15HealthRecordsUI20LoadingTableViewCell)init
{
  void *v3;
  _TtC15HealthRecordsUI20LoadingTableViewCell *v4;

  v3 = (void *)sub_1BC62C650();
  v4 = -[LoadingTableViewCell initWithStyle:reuseIdentifier:](self, sel_initWithStyle_reuseIdentifier_, 0, v3);

  return v4;
}

- (_TtC15HealthRecordsUI20LoadingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1BC62C680();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC15HealthRecordsUI20LoadingTableViewCell *)LoadingTableViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC15HealthRecordsUI20LoadingTableViewCell)initWithCoder:(id)a3
{
  return (_TtC15HealthRecordsUI20LoadingTableViewCell *)LoadingTableViewCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20LoadingTableViewCell_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20LoadingTableViewCell_spinner));
}

@end
