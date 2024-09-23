@implementation GKDashboardShowMoreFooterView

- (_TtC12GameCenterUI29GKDashboardShowMoreFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI29GKDashboardShowMoreFooterView *)sub_1AB555B40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI29GKDashboardShowMoreFooterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB556170();
}

- (id)actionHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  GKDashboardShowMoreFooterView.actionHandler.getter();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1AB4E2494;
  v6[3] = &block_descriptor_8;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setActionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI29GKDashboardShowMoreFooterView *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AB48638C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  GKDashboardShowMoreFooterView.actionHandler.setter((uint64_t)v4, v5);

}

- (NSString)showMoreText
{
  uint64_t v2;
  void *v3;

  GKDashboardShowMoreFooterView.showMoreText.getter();
  if (v2)
  {
    v3 = (void *)sub_1AB7DAF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setShowMoreText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12GameCenterUI29GKDashboardShowMoreFooterView *v7;

  if (a3)
  {
    v4 = sub_1AB7DAF90();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  GKDashboardShowMoreFooterView.showMoreText.setter(v4, v6);

}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC12GameCenterUI29GKDashboardShowMoreFooterView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  GKDashboardShowMoreFooterView.didUpdateFocus(in:with:)((UIFocusUpdateContext)v6, (UIFocusAnimationCoordinator)v7);

}

- (void)layoutSubviews
{
  _TtC12GameCenterUI29GKDashboardShowMoreFooterView *v2;

  v2 = self;
  GKDashboardShowMoreFooterView.layoutSubviews()();

}

- (void)didTap:(id)a3
{
  id v4;
  _TtC12GameCenterUI29GKDashboardShowMoreFooterView *v5;

  v4 = a3;
  v5 = self;
  sub_1AB556D38();

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC12GameCenterUI29GKDashboardShowMoreFooterView *v8;

  sub_1AB46D7C0(0, &qword_1EEC03450);
  sub_1AB556ED4();
  v6 = sub_1AB7DB278();
  v7 = a4;
  v8 = self;
  GKDashboardShowMoreFooterView.pressesEnded(_:with:)(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29GKDashboardShowMoreFooterView_label));
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI29GKDashboardShowMoreFooterView_actionHandler));
  swift_bridgeObjectRelease();
}

@end
