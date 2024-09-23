@implementation HRExplainerTextFooterCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (NSString)content
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___HRExplainerTextFooterCell_content;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setContent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  HRExplainerTextFooterCell *v7;

  if (a3)
  {
    v4 = sub_1BC62C680();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1BC4FB5E0(v4, v6);

}

- (HRExplainerTextFooterCell)initWithReuseIdentifier:(id)a3
{
  void *v4;
  HRExplainerTextFooterCell *v5;
  HRExplainerTextFooterCell *v6;

  sub_1BC62C680();
  v4 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  v5 = -[HRExplainerTextFooterCell initWithStyle:reuseIdentifier:](self, sel_initWithStyle_reuseIdentifier_, 0, v4);

  v6 = v5;
  sub_1BC4FB8E0();

  return v6;
}

- (HRExplainerTextFooterCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (HRExplainerTextFooterCell *)ExplainerTextFooterCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (HRExplainerTextFooterCell)initWithCoder:(id)a3
{
  return (HRExplainerTextFooterCell *)ExplainerTextFooterCell.init(coder:)(a3);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
