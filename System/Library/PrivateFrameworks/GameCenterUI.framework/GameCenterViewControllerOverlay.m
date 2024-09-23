@implementation GameCenterViewControllerOverlay

- (_TtC12GameCenterUI31GameCenterViewControllerOverlay)init
{
  return (_TtC12GameCenterUI31GameCenterViewControllerOverlay *)sub_1AB539940();
}

- (void)didDismissDashboard
{
  _TtC12GameCenterUI31GameCenterViewControllerOverlay *v2;

  v2 = self;
  sub_1AB539A80();

}

- (void)finishAndPlay:(id)a3
{
  id v4;
  _TtC12GameCenterUI31GameCenterViewControllerOverlay *v5;

  v4 = a3;
  v5 = self;
  sub_1AB539FBC(v4);

}

- (void)finishWith:(id)a3
{
  id v4;
  _TtC12GameCenterUI31GameCenterViewControllerOverlay *v5;

  v4 = a3;
  v5 = self;
  sub_1AB539FBC(v4);

}

- (void)quitTurnBasedMatch:(id)a3
{
  id v4;
  _TtC12GameCenterUI31GameCenterViewControllerOverlay *v5;

  v4 = a3;
  v5 = self;
  sub_1AB539FBC(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31GameCenterViewControllerOverlay_clientProxy));
  swift_unknownObjectWeakDestroy();
}

@end
