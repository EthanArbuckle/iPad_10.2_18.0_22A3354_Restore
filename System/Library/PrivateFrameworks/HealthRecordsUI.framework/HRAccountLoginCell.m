@implementation HRAccountLoginCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (HRAccountLoginCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (HRAccountLoginCell *)sub_1BC49C888((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))AccountLoginCell.init(style:reuseIdentifier:));
}

- (HRAccountLoginCell)initWithCoder:(id)a3
{
  return (HRAccountLoginCell *)sub_1BC49B244(a3);
}

- (void)layoutSubviews
{
  HRAccountLoginCell *v2;

  v2 = self;
  sub_1BC49B564(type metadata accessor for AccountLoginCell, &OBJC_IVAR___HRAccountLoginCell_accountStatusView);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = sub_1BC49B6E0(self, a3.width, a3.height, (uint64_t)a2, &OBJC_IVAR___HRAccountLoginCell_accountStatusView);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  HRAccountLoginCell *v6;

  v5 = a3;
  v6 = self;
  sub_1BC49B7A4(a3);

}

- (void)layoutMarginsDidChange
{
  sub_1BC49B92C(self, (uint64_t)a2, type metadata accessor for AccountLoginCell, &OBJC_IVAR___HRAccountLoginCell_accountStatusView);
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  HRAccountLoginCell *v7;
  uint64_t v8;
  objc_super v9;

  sub_1BC384E68(0, &qword_1EF432340, (void (*)(uint64_t))type metadata accessor for AccountStatusSummaryTileFeedItemViewData);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - v4;
  v6 = (objc_class *)type metadata accessor for AccountLoginCell();
  v9.receiver = self;
  v9.super_class = v6;
  v7 = self;
  -[HRAccountLoginCell prepareForReuse](&v9, sel_prepareForReuse);
  v8 = type metadata accessor for AccountStatusSummaryTileFeedItemViewData();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_1BC59EF68((uint64_t)v5);
  sub_1BC384EB4((uint64_t)v5, &qword_1EF432340, (void (*)(uint64_t))type metadata accessor for AccountStatusSummaryTileFeedItemViewData);

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  HRAccountLoginCell *v5;

  v5 = self;
  sub_1BC49DADC(a3);

}

- (void).cxx_destruct
{

}

- (void)configureWithAccount:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  HRAccountLoginCell *v9;
  uint64_t v10;

  sub_1BC384E68(0, &qword_1EF432340, (void (*)(uint64_t))type metadata accessor for AccountStatusSummaryTileFeedItemViewData);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v10 - v6;
  if (a3)
  {
    v8 = a3;
    v9 = self;
    AccountStatusSummaryTileFeedItemViewData.init(_:)(v8, (uint64_t)v7);
    sub_1BC59EF68((uint64_t)v7);
    sub_1BC384EB4((uint64_t)v7, &qword_1EF432340, (void (*)(uint64_t))type metadata accessor for AccountStatusSummaryTileFeedItemViewData);

  }
}

@end
