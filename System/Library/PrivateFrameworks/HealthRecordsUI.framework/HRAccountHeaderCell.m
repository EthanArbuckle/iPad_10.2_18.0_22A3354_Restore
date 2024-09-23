@implementation HRAccountHeaderCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (HRAccountHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (HRAccountHeaderCell *)sub_1BC49C888((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))AccountHeaderCell.init(style:reuseIdentifier:));
}

- (HRAccountHeaderCell)initWithCoder:(id)a3
{
  HRAccountHeaderCell *result;

  result = (HRAccountHeaderCell *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  HRAccountHeaderCell *v2;

  v2 = self;
  sub_1BC49B564(type metadata accessor for AccountHeaderCell, &OBJC_IVAR___HRAccountHeaderCell_paddedView);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = sub_1BC49B6E0(self, a3.width, a3.height, (uint64_t)a2, &OBJC_IVAR___HRAccountHeaderCell_paddedView);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutMarginsDidChange
{
  sub_1BC49B92C(self, (uint64_t)a2, type metadata accessor for AccountHeaderCell, &OBJC_IVAR___HRAccountHeaderCell_accountView);
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  HRAccountHeaderCell *v7;
  uint64_t v8;
  objc_super v9;

  sub_1BC384E68(0, &qword_1EF42B7C8, (void (*)(uint64_t))type metadata accessor for AccountViewData);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - v4;
  v6 = (objc_class *)type metadata accessor for AccountHeaderCell();
  v9.receiver = self;
  v9.super_class = v6;
  v7 = self;
  -[HRAccountHeaderCell prepareForReuse](&v9, sel_prepareForReuse);
  v8 = type metadata accessor for AccountViewData(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_1BC3A1B50((uint64_t)v5);
  sub_1BC384EB4((uint64_t)v5, &qword_1EF42B7C8, (void (*)(uint64_t))type metadata accessor for AccountViewData);

}

- (void)configureWithAccount:(id)a3
{
  id v5;
  HRAccountHeaderCell *v6;

  v5 = a3;
  v6 = self;
  sub_1BC49AE50(a3);

}

- (void).cxx_destruct
{

}

@end
