@implementation HRContentStatusCell

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                            + OBJC_IVAR___HRContentStatusCell_spinner));
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___HRContentStatusCell_titleLabel));
}

- (HRContentStatusCell)init
{
  return (HRContentStatusCell *)ContentStatusCell.init()();
}

- (HRContentStatusCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC51A574();
}

- (HRContentStatusCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HRContentStatusCell *result;

  result = (HRContentStatusCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
