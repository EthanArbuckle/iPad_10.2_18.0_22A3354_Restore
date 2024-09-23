@implementation ActionButtonCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_titleLabel));
}

- (UIImage)icon
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_icon);
  swift_beginAccess();
  return (UIImage *)*v2;
}

- (void)setIcon:(id)a3
{
  _TtC15HealthRecordsUI16ActionButtonCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1BC461B4C(a3);

}

- (BOOL)actionEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_actionEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setActionEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_actionEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC15HealthRecordsUI16ActionButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC15HealthRecordsUI16ActionButtonCell *)ActionButtonCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC15HealthRecordsUI16ActionButtonCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC461E00();
}

- (void)setBusy:(BOOL)a3
{
  _TtC15HealthRecordsUI16ActionButtonCell *v4;

  v4 = self;
  sub_1BC461854(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_titleLabelLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_nonBusyTitleLabelColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI16ActionButtonCell_icon));
}

@end
