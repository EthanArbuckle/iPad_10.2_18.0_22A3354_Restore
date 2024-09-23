@implementation HRSideBySideLabelCell

- (NSString)title
{
  return (NSString *)sub_1BC49BD98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRSideBySideLabelCell_title);
}

- (void)setTitle:(id)a3
{
  sub_1BC49BE24(self, (uint64_t)a2, (uint64_t)a3, sub_1BC51A6B4);
}

- (NSString)detail
{
  return (NSString *)sub_1BC49BD98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRSideBySideLabelCell_detail);
}

- (void)setDetail:(id)a3
{
  sub_1BC49BE24(self, (uint64_t)a2, (uint64_t)a3, sub_1BC51A750);
}

- (HRSideBySideLabelCell)initWithReuseIdentifier:(id)a3
{
  void *v4;
  HRSideBySideLabelCell *v5;
  HRSideBySideLabelCell *v6;

  sub_1BC62C680();
  v4 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  v5 = -[HRSideBySideLabelCell initWithStyle:reuseIdentifier:](self, sel_initWithStyle_reuseIdentifier_, 0, v4);

  v6 = v5;
  sub_1BC51AA74();

  return v6;
}

- (HRSideBySideLabelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (HRSideBySideLabelCell *)SideBySideLabelCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (HRSideBySideLabelCell)initWithCoder:(id)a3
{
  return (HRSideBySideLabelCell *)SideBySideLabelCell.init(coder:)(a3);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
