@implementation HRSourceTableViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (HRSourceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  HRSourceTableViewCell *v7;
  objc_super v9;

  if (a4)
  {
    sub_1BC62C680();
    *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HRSourceTableViewCell_sourceModel) = 0;
    v6 = (void *)sub_1BC62C650();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HRSourceTableViewCell_sourceModel) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SourceTableViewCell();
  v7 = -[HRStandardTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, v6);

  return v7;
}

- (HRSourceTableViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HRSourceTableViewCell_sourceModel) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SourceTableViewCell();
  return -[HRStandardTableViewCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{

}

@end
