@implementation EmptyStateView

+ (_TtC12GameCenterUI14EmptyStateView)addFriendsEmptyStateView
{
  id v2;

  swift_getObjCClassMetadata();
  static EmptyStateView.addFriendsEmptyStateView.getter();
  return (_TtC12GameCenterUI14EmptyStateView *)v2;
}

+ (_TtC12GameCenterUI14EmptyStateView)addFriendsWithButtonEmptyStateView
{
  id v2;

  swift_getObjCClassMetadata();
  static EmptyStateView.addFriendsWithButtonEmptyStateView.getter();
  return (_TtC12GameCenterUI14EmptyStateView *)v2;
}

+ (_TtC12GameCenterUI14EmptyStateView)addFriendsEmptyStateViewTVOS
{
  id v2;

  swift_getObjCClassMetadata();
  static EmptyStateView.addFriendsEmptyStateViewTVOS.getter();
  return (_TtC12GameCenterUI14EmptyStateView *)v2;
}

+ (_TtC12GameCenterUI14EmptyStateView)addAdditionalFriendsEmptyStateView
{
  id v2;

  swift_getObjCClassMetadata();
  static EmptyStateView.addAdditionalFriendsEmptyStateView.getter();
  return (_TtC12GameCenterUI14EmptyStateView *)v2;
}

- (_TtC12GameCenterUI14EmptyStateView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI14EmptyStateView *)sub_1AB7749E4();
}

- (_TtC12GameCenterUI14EmptyStateView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB775498();
}

- (id)buttonActionBlock
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = EmptyStateView.buttonActionBlock.getter();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1AB4E2494;
  v6[3] = &block_descriptor_99;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setButtonActionBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI14EmptyStateView *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AB77718C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  EmptyStateView.buttonActionBlock.setter((uint64_t)v4, v5);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI14EmptyStateView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  JUMeasurements result;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AB776F0C();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease();

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI14EmptyStateView *v2;

  v2 = self;
  EmptyStateView.layoutSubviews()();

}

- (void)didTapButton:(id)a3
{
  _TtC12GameCenterUI14EmptyStateView *v4;
  _TtC12GameCenterUI14EmptyStateView *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AB7DB758();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1AB775F48();

  sub_1AB473FBC((uint64_t)v6, (uint64_t *)&unk_1EEBFBCA0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC12GameCenterUI14EmptyStateView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = EmptyStateView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_imageView));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_wordmarkView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_primaryLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_secondaryLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_button);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI14EmptyStateView____lazy_storage___focusGuide);
  sub_1AB49D950(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_imageType));
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI14EmptyStateView_buttonActionBlock));
}

@end
