@implementation TermsAndConditionsCardViewController

- (_TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController)initWithContentView:(id)a3
{
  id v4;
  _TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController *v5;

  v4 = a3;
  v5 = (_TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController *)sub_100007DEC((uint64_t)a3);

  return v5;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TermsAndConditionsCardViewController();
  v2 = v3.receiver;
  -[TermsAndConditionsCardViewController viewDidLoad](&v3, "viewDidLoad");
  sub_10000692C();
  sub_100007118();
  sub_1000071FC();

}

- (void)agreeButtonAction
{
  _TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController *v2;

  v2 = self;
  sub_1000079AC();

}

- (void)disagreeButtonAction
{
  -[TermsAndConditionsCardViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{

}

@end
