@implementation NicknameFieldCollectionViewCell

- (_TtC12GameCenterUI31NicknameFieldCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI31NicknameFieldCollectionViewCell *)sub_1AB76FB28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI31NicknameFieldCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB76FE38();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI31NicknameFieldCollectionViewCell *v2;

  v2 = self;
  sub_1AB770590();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC12GameCenterUI31NicknameFieldCollectionViewCell *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1AB77088C((uint64_t)v4, width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)prepareForReuse
{
  _TtC12GameCenterUI31NicknameFieldCollectionViewCell *v2;

  v2 = self;
  sub_1AB770CB4();

}

- (_TtC12GameCenterUI20DynamicTypeTextField)accessibilityTextLabel
{
  id v2;

  sub_1AB771AA0();
  return (_TtC12GameCenterUI20DynamicTypeTextField *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_previousTitleTextColor));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_textLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_loadingIndicator);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_nicknamePresenter);
  sub_1AB47A074((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_suggestionsChangedSubscription, (uint64_t *)&unk_1EEC137C0);
  sub_1AB47A074((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_nicknameUpdatedSubscription, &qword_1EEC0F8D8);
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI31NicknameFieldCollectionViewCell_accessoryAction));
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  _TtC12GameCenterUI31NicknameFieldCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB771DDC(v4);

  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  _TtC12GameCenterUI31NicknameFieldCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB771E84();

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC12GameCenterUI31NicknameFieldCollectionViewCell *v13;

  length = a4.length;
  location = a4.location;
  v9 = sub_1AB7DAF90();
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1AB771FE4(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textFieldDidChangeSelection:(id)a3
{
  id v4;
  _TtC12GameCenterUI31NicknameFieldCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB772440();

}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  id v5;
  _TtC12GameCenterUI31NicknameFieldCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1AB7724FC();

}

@end
