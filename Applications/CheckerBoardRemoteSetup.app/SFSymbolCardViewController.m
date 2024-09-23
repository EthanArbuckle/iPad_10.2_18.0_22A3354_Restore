@implementation SFSymbolCardViewController

- (_TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController)initWithContentView:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController *)sub_100008DEC(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController *v4;

  v4 = self;
  sub_100008FC4(a3);

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->remoteSetupManager[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->remoteSetupManager[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->remoteSetupManager[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->remoteSetupManager[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName]);

}

@end
