@implementation HUBaseIconView

- (CGSize)intrinsicContentSize
{
  HUBaseIconView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1B8E45A8C();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (HUBaseIconView)initWithFrame:(CGRect)a3
{
  return (HUBaseIconView *)BaseIconView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateConstraints
{
  HUBaseIconView *v2;

  v2 = self;
  sub_1B8E4BB30();

}

- (HUBaseIconViewConfiguration)configuration
{
  HUBaseIconView *v2;
  void *v3;

  v2 = self;
  v3 = BaseIconView.__configuration.getter();

  return (HUBaseIconViewConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v5;
  HUBaseIconView *v6;

  v5 = a3;
  v6 = self;
  BaseIconView.__configuration.setter((uint64_t)a3);

}

- (HUBaseIconViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUBaseIconView_delegate;
  swift_beginAccess();
  return (HUBaseIconViewDelegate *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (HUBaseIconView)initWithCoder:(id)a3
{
  return (HUBaseIconView *)BaseIconView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  _QWORD v3[17];

  swift_bridgeObjectRelease();

  sub_1B8F4E76C((uint64_t)self + OBJC_IVAR___HUBaseIconView_configuration, (uint64_t)v3);
  sub_1B8ECA37C(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B8E2B514);
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUBaseIconView_delegate);

}

- (void)startTransitionToTargetViewState:(int64_t)a3
{
  HUBaseIconView *v4;

  v4 = self;
  BaseIconView.startTransition(targetAppearance:)(a3);

}

- (void)prepareForTransitionToTargetViewState:(int64_t)a3
{
  HUBaseIconView *v4;

  v4 = self;
  BaseIconView.prepareForTransition(targetAppearance:)(a3);

}

@end
