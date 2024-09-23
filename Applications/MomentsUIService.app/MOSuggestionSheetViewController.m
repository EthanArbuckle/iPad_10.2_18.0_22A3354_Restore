@implementation MOSuggestionSheetViewController

- (void)shouldDismissOnboarding
{
  _TtC16MomentsUIService31MOSuggestionSheetViewController *v2;

  v2 = self;
  MOSuggestionSheetViewController.shouldDismissOnboarding()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC16MomentsUIService31MOSuggestionSheetViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  MOSuggestionSheetViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)handleContentSizeChanged
{
  void *v2;
  _TtC16MomentsUIService31MOSuggestionSheetViewController *v3;
  _QWORD *v4;
  id v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_suggestionCollectionView);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    v5 = -[MOSuggestionSheetViewController traitCollection](v3, "traitCollection");
    v6 = objc_msgSend(v5, "preferredContentSizeCategory");

    (*(void (**)(id))((swift_isaMask & *v4) + 0x250))(v6);
  }
}

- (void)cancelSheet
{
  _TtC16MomentsUIService31MOSuggestionSheetViewController *v2;

  v2 = self;
  MOSuggestionSheetViewController.cancelSheet()();

}

- (_TtC16MomentsUIService31MOSuggestionSheetViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionSheetViewController.init(coder:)();
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MOSuggestionSheetViewController();
  v2 = v6.receiver;
  -[MOSuggestionSheetViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MomentsUIService31MOSuggestionSheetViewController *v4;

  v4 = self;
  MOSuggestionSheetViewController.viewDidAppear(_:)(a3);

}

- (void)pressedSegmentControl
{
  _TtC16MomentsUIService31MOSuggestionSheetViewController *v2;

  v2 = self;
  MOSuggestionSheetViewController.pressedSegmentControl()();

}

- (_TtC16MomentsUIService31MOSuggestionSheetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  @objc MOAngelRootViewController.init(nibName:bundle:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MomentsUIService.MOSuggestionSheetViewController", 48);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_controller);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_segmentedDelegate);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_segmentedVisibilityDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_suggestionCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_options));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController____lazy_storage___suggestionSegmentedControl));
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_presentationDelegate);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetViewController_rootControllerDelegate);
}

@end
