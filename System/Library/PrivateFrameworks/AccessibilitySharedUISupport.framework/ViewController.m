@implementation ViewController

- (void)homeHandler
{
  _TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController *v2;

  v2 = self;
  NavigationModel.goHome()();

}

- (void)doneHandler
{
  _TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController *v2;

  v2 = self;
  sub_21C78FC4C();

}

- (void)previousHandler
{
  _TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController *v2;
  unsigned __int8 v3;

  v3 = 1;
  v2 = self;
  sub_21C793B0C(&v3);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController *v5;

  v4 = a3;
  v5 = self;
  sub_21C78FC4C();

}

- (void)viewDidLoad
{
  _TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController *v2;

  v2 = self;
  sub_21C790B38();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ViewController();
  v4 = v5.receiver;
  -[ViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_21C78FC4C();

}

- (BOOL)accessibilityPerformEscape
{
  _TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController *v2;

  v2 = self;
  sub_21C78FC4C();

  return 1;
}

- (_TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21C791214();
}

- (_TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController *result;

  v4 = a4;
  result = (_TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupportP33_DEAF73D7C474C94E24616C25DC2EB0AC14ViewController_contentView));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
