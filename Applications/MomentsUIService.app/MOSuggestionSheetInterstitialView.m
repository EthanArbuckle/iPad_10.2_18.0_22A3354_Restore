@implementation MOSuggestionSheetInterstitialView

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC16MomentsUIService33MOSuggestionSheetInterstitialView *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  MOSuggestionSheetInterstitialView.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)viewDidAppear:(BOOL)a3
{
  @objc MOSuggestionSheetInterstitialView.viewDidAppear(_:)(self, (uint64_t)a2, a3, (SEL *)&selRef_viewDidAppear_);
}

- (_TtC16MomentsUIService33MOSuggestionSheetInterstitialView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionSheetInterstitialView.init(coder:)();
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MOSuggestionSheetInterstitialView(0);
  v2 = v6.receiver;
  -[MOSuggestionSheetInterstitialView viewDidLoad](&v6, "viewDidLoad");
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

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MomentsUIService33MOSuggestionSheetInterstitialView *v4;

  v4 = self;
  MOSuggestionSheetInterstitialView.viewDidDisappear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  @objc MOSuggestionSheetInterstitialView.viewDidAppear(_:)(self, (uint64_t)a2, a3, (SEL *)&selRef_viewWillDisappear_);
}

- (void)cancelSheet
{
  uint64_t v2;
  _TtC16MomentsUIService33MOSuggestionSheetInterstitialView *v3;

  v2 = one-time initialization token for shared;
  v3 = self;
  if (v2 != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  (*(void (**)(void))(*(_QWORD *)static MOSuggestionAssetCacheManager.shared + 288))();
  -[MOSuggestionSheetInterstitialView dismissViewControllerAnimated:completion:](v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)journalButtonTapped:(id)a3
{
  id v4;
  _TtC16MomentsUIService33MOSuggestionSheetInterstitialView *v5;

  v4 = a3;
  v5 = self;
  specialized MOSuggestionSheetInterstitialView.journalButtonTapped(_:)();

}

- (void)addButtonTapped
{
  _TtC16MomentsUIService33MOSuggestionSheetInterstitialView *v2;

  v2 = self;
  MOSuggestionSheetInterstitialView.addButtonTapped()();

}

- (void)handleContentSizeChanged
{
  _TtC16MomentsUIService33MOSuggestionSheetInterstitialView *v2;

  v2 = self;
  MOSuggestionSheetInterstitialView.updateTitleLabelString()();

}

- (void)handleLabelEditTap:(id)a3
{
  id v4;
  _TtC16MomentsUIService33MOSuggestionSheetInterstitialView *v5;

  v4 = a3;
  v5 = self;
  specialized MOSuggestionSheetInterstitialView.handleLabelEditTap(_:)();

}

- (void)didToggleListCarouselViewButtonWithCarouselIndex:(int64_t)a3
{
  _TtC16MomentsUIService33MOSuggestionSheetInterstitialView *v3;

  v3 = self;
  specialized MOSuggestionSheetInterstitialView.didToggleListCarouselViewButton(carouselIndex:)();

}

- (_TtC16MomentsUIService33MOSuggestionSheetInterstitialView)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MomentsUIService33MOSuggestionSheetInterstitialView *result;

  v4 = a4;
  result = (_TtC16MomentsUIService33MOSuggestionSheetInterstitialView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionSheetInterstitialView", 50, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_controller);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_presentationDelegate);
  swift_release(*(_QWORD *)&self->controller[OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_selectedSuggestion]);
  v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_indexPath;
  v4 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_assetCarouselView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_assetListView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_navigationBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_photoMemoryBanner));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_cellViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_toggleListViewCarouselButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_assetTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_emptySelectionLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_portraitConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_landscapeConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_commonConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_journalButtonLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_journalButtonTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_journalButtonBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_journalButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->controller[OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_titleString]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->controller[OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_modifiedTitleString]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionSheetInterstitialView_quickAddButton));
}

@end
