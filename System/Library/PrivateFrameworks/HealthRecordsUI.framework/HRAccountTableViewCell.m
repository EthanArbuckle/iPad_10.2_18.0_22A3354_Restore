@implementation HRAccountTableViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (HRAccountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_1BC62C680();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (HRAccountTableViewCell *)sub_1BC4F22BC(v4, v5);
}

- (HRAccountTableViewCell)initWithCoder:(id)a3
{
  return (HRAccountTableViewCell *)sub_1BC4F18CC(a3);
}

- (void)configureWithAccount:(id)a3 dataProvider:(id)a4
{
  sub_1BC4F1AE4(self, (uint64_t)a2, a3, a4, 0);
}

- (void)configureIgnoreActionWithAccount:(id)a3 dataProvider:(id)a4
{
  sub_1BC4F1AE4(self, (uint64_t)a2, a3, a4, 1);
}

- (void)prepareForReuse
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccountTableViewCell();
  v2 = (char *)v3.receiver;
  -[HRAccountTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  objc_msgSend(*(id *)&v2[OBJC_IVAR___HRAccountTableViewCell_brandView], sel_setBrandable_dataProvider_, 0, 0, v3.receiver, v3.super_class);

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for AccountTableViewCell();
  v2 = (char *)v16.receiver;
  -[HRAccountTableViewCell layoutSubviews](&v16, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR___HRAccountTableViewCell_brandView];
  v4 = objc_msgSend(v3, sel_brandTitleLabel, v16.receiver, v16.super_class);
  objc_msgSend(v4, sel_bounds);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = objc_msgSend(v3, sel_brandTitleLabel);
  objc_msgSend(v2, sel_convertRect_fromCoordinateSpace_, v13, v6, v8, v10, v12);
  v15 = v14;

  objc_msgSend(v2, sel_setSeparatorInset_, 0.0, v15, 0.0, 0.0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HRAccountTableViewCell_brandView));
}

@end
