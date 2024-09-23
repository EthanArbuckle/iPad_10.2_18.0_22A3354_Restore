@implementation MOSuggestionInterstitialAlertContentViewController

- (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController)init
{
  return (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController *)MOSuggestionInterstitialAlertContentViewController.init()();
}

- (void)handleTraitChange
{
  void *v2;
  _TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController *v3;
  id v4;
  id v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController_textView);
  v3 = self;
  v4 = objc_msgSend(v2, "layer");
  v5 = objc_msgSend((id)objc_opt_self(UIColor), "separatorColor");
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v4, "setBorderColor:", v6);
}

- (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController *result;

  v5 = OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController_textView;
  v6 = objc_allocWithZone((Class)UITextView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionInterstitialAlertController.swift", 62, 2, 42, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController *result;

  v4 = a4;
  result = (_TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionInterstitialAlertContentViewController", 67, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialAlertContentViewController_textView));
}

@end
