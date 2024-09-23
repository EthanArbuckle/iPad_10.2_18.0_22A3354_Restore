@implementation GameModeButton

- (void)accessibilityElementDidLoseFocus
{
  uint64_t Strong;
  void *v4;
  _TtC13GameOverlayUI14GameModeButton *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC13GameOverlayUI14GameModeButton_controller);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    sub_10005D8A0(1.0);

  }
}

- (_TtC13GameOverlayUI14GameModeButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC13GameOverlayUI14GameModeButton_controller, 0);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for GameModeButton();
  return -[GameModeButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC13GameOverlayUI14GameModeButton)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC13GameOverlayUI14GameModeButton_controller, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for GameModeButton();
  return -[GameModeButton initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC13GameOverlayUI14GameModeButton_controller, a2);
}

@end
