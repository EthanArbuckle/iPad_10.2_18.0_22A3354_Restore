@implementation MUPlaceHeaderSectionController

- (MUPlaceHeaderSectionController)initWithPlaceItem:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MUPlaceHeaderSectionController *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceHeaderSectionController;
  v10 = -[MUPlaceSectionController initWithMapItem:](&v15, sel_initWithMapItem_, v9);

  if (v10)
  {
    MUGetPlaceCardLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceHeaderSectionControllerInit", ", v14, 2u);
    }

    objc_storeStrong((id *)&v10->_placeItem, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    -[MUPlaceHeaderSectionController _setupHeaderView](v10, "_setupHeaderView");
    MUGetPlaceCardLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceHeaderSectionControllerInit", ", v14, 2u);
    }

  }
  return v10;
}

- (void)_setupHeaderView
{
  MUPlaceCoverPhotoOptions *v3;
  MUPlaceItemHeaderViewModel *v4;
  _MKPlaceItem *placeItem;
  _BOOL8 v6;
  void *v7;
  MUPlaceItemHeaderViewModel *v8;
  MUPlaceHeaderView *v9;
  MUPlaceHeaderView *v10;
  MUPlaceHeaderView *headerView;
  void *v12;
  _BOOL4 v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v3 = objc_alloc_init(MUPlaceCoverPhotoOptions);
  -[MUPlaceCoverPhotoOptions setShowShareButton:](v3, "setShowShareButton:", -[MUPlaceHeaderSectionControllerConfiguration showShareButton](self->_configuration, "showShareButton"));
  -[MUPlaceCoverPhotoOptions setInsetsCoverPhoto:](v3, "setInsetsCoverPhoto:", -[MUPlaceHeaderSectionControllerConfiguration shouldInsetRoundCoverPhoto](self->_configuration, "shouldInsetRoundCoverPhoto"));
  v4 = [MUPlaceItemHeaderViewModel alloc];
  placeItem = self->_placeItem;
  v6 = -[MUPlaceHeaderSectionControllerConfiguration isDeveloperPlaceCard](self->_configuration, "isDeveloperPlaceCard");
  -[MUPlaceHeaderSectionControllerConfiguration developerPlaceCardAuditToken](self->_configuration, "developerPlaceCardAuditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MUPlaceItemHeaderViewModel initWithPlaceItem:isDeveloperPlaceCard:developerPlaceCardAuditToken:](v4, "initWithPlaceItem:isDeveloperPlaceCard:developerPlaceCardAuditToken:", placeItem, v6, v7);

  objc_initWeak(&location, self);
  v9 = [MUPlaceHeaderView alloc];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __50__MUPlaceHeaderSectionController__setupHeaderView__block_invoke;
  v18 = &unk_1E2E03960;
  objc_copyWeak(&v19, &location);
  v10 = -[MUPlaceHeaderView initWithViewModel:coverPhotoOptions:trailingConstraintProvider:](v9, "initWithViewModel:coverPhotoOptions:trailingConstraintProvider:", v8, v3, &v15);
  headerView = self->_headerView;
  self->_headerView = v10;

  -[MUPlaceHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v15, v16, v17, v18);
  -[MUPlaceHeaderView setSuppressContainmentTap:](self->_headerView, "setSuppressContainmentTap:", -[MUPlaceHeaderSectionControllerConfiguration suppressContainmentPunchout](self->_configuration, "suppressContainmentPunchout"));
  if (-[MUPlaceHeaderSectionControllerConfiguration drawDynamicPlacecardDebugBackground](self->_configuration, "drawDynamicPlacecardDebugBackground"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.0500000007);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceHeaderView setBackgroundColor:](self->_headerView, "setBackgroundColor:", v12);

  }
  v13 = -[MUPlaceHeaderSectionControllerConfiguration alwaysShowExpandedVerifiedBusinessHeader](self->_configuration, "alwaysShowExpandedVerifiedBusinessHeader");
  v14 = 0.0;
  if (v13)
    v14 = 1.0;
  -[MUPlaceHeaderView setVerifiedBusinessHeaderExpansionProgress:](self->_headerView, "setVerifiedBusinessHeaderExpansionProgress:", v14);
  -[MUPlaceHeaderView setDelegate:](self->_headerView, "setDelegate:", self);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

double __50__MUPlaceHeaderSectionController__setupHeaderView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  void *v4;
  char v5;
  void *v6;
  double v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  v3 = 0.0;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "headerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v2, "headerDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "placeHeaderSectionControllerRequestsTrailingConstant:", v2);
      v3 = v7;

    }
  }

  return v3;
}

- (id)sectionView
{
  return self->_headerView;
}

- (UILayoutGuide)headerViewTitleLabelToTopLayoutGuide
{
  return -[MUPlaceHeaderView titleLabelToTopLayoutGuide](self->_headerView, "titleLabelToTopLayoutGuide");
}

- (void)setHeaderDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_headerDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_headerDelegate, obj);
    -[MUPlaceHeaderView reloadTrailingConstraint](self->_headerView, "reloadTrailingConstraint");
    v5 = obj;
  }

}

+ (double)minimalModeHeight
{
  double result;

  +[MUPlaceHeaderView minimalModeHeight](MUPlaceHeaderView, "minimalModeHeight");
  return result;
}

- (void)hideTitle:(BOOL)a3
{
  -[MUPlaceHeaderView hideTitle:](self->_headerView, "hideTitle:", a3);
}

- (double)verifiedBusinessHeaderHeight
{
  double result;

  -[MUPlaceHeaderView verifiedBusinessHeaderHeight](self->_headerView, "verifiedBusinessHeaderHeight");
  return result;
}

- (void)verifiedBusinessHeaderScrollPositionChanged:(double)a3
{
  -[MUPlaceHeaderView setVerifiedBusinessHeaderAlpha:](self->_headerView, "setVerifiedBusinessHeaderAlpha:", a3);
}

- (void)setCardExpansionProgress:(double)a3
{
  if (!-[MUPlaceHeaderSectionControllerConfiguration alwaysShowExpandedVerifiedBusinessHeader](self->_configuration, "alwaysShowExpandedVerifiedBusinessHeader"))-[MUPlaceHeaderView setVerifiedBusinessHeaderExpansionProgress:](self->_headerView, "setVerifiedBusinessHeaderExpansionProgress:", a3);
}

- (void)headerView:(id)a3 didSelectEnclosingMapItem:(id)a4
{
  -[MUPlaceHeaderSectionController _notifyDidTapParentMapItem:](self, "_notifyDidTapParentMapItem:", a4);
}

- (void)headerView:(id)a3 didSelectEnclosingMapItemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id buf[2];

  v6 = a3;
  v7 = a4;
  -[MUPlaceHeaderSectionController headerDelegate](self, "headerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MUGetPlaceCardLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_191DB8000, v9, OS_LOG_TYPE_INFO, "MUPlaceHeaderSectionController: About to refine enclosing map item", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    -[MUPlaceHeaderView beginAnimatingActivityIndicator](self->_headerView, "beginAnimatingActivityIndicator");
    -[MUPlaceHeaderView viewModel](self->_headerView, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__MUPlaceHeaderSectionController_headerView_didSelectEnclosingMapItemIdentifier___block_invoke;
    v12[3] = &unk_1E2E02818;
    objc_copyWeak(&v13, buf);
    objc_msgSend(v11, "refineEnclosingMapItemWithCompletion:", v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  else
  {
    if (v10)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_191DB8000, v9, OS_LOG_TYPE_INFO, "MUPlaceHeaderSectionController: User tapped enclosing map item identifier but no delegate set, early return", (uint8_t *)buf, 2u);
    }

  }
}

void __81__MUPlaceHeaderSectionController_headerView_didSelectEnclosingMapItemIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *WeakRetained;
  id *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MUGetPlaceCardLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_DEBUG, "MUPlaceHeaderSectionController: Finished refining enclosing map item %@ with error %@", (uint8_t *)&v10, 0x16u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_notifyDidTapParentMapItem:", v5);
    objc_msgSend(v9[9], "endAnimatingActivityIndicatorWithError:", v6);
  }

}

- (void)headerView:(id)a3 didSelectShareWithPresentationOptions:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MUPlaceHeaderSectionController headerDelegate](self, "headerDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeHeaderSectionController:didSelectShareWithPresentationOptions:", self, v5);

}

- (void)_notifyDidTapParentMapItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v5, "_muid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 6047, v6, 0, 0);

  -[MUPlaceHeaderSectionController headerDelegate](self, "headerDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placeHeaderSectionController:didTapMapItem:", self, v5);

}

- (id)draggableContent
{
  MUInfoCardDraggableContent *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!self->_headerView)
    return MEMORY[0x1E0C9AA60];
  v3 = objc_alloc_init(MUInfoCardDraggableContent);
  -[MUInfoCardDraggableContent setView:](v3, "setView:", self->_headerView);
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUInfoCardDraggableContent setDraggableContent:](v3, "setDraggableContent:", v4);

  -[MUInfoCardDraggableContent setHeader:](v3, "setHeader:", 1);
  -[MUInfoCardDraggableContent setAnalyticsTarget:](v3, "setAnalyticsTarget:", 1501);
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)analyticsModuleType
{
  return 1;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void)_populateRevealedAnalyticsModule:(id)a3
{
  MUPlaceHeaderView *headerView;
  id v4;
  void *v5;
  id v6;

  headerView = self->_headerView;
  v4 = a3;
  -[MUPlaceHeaderView viewModel](headerView, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  MUHeaderRevealedModuleForViewModel(v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

}

- (BOOL)shouldBlurChromeHeaderButtons
{
  return -[MUPlaceHeaderView shouldBlurChromeHeaderButtons](self->_headerView, "shouldBlurChromeHeaderButtons");
}

- (void)reloadTrailingConstraint
{
  -[MUPlaceHeaderView reloadTrailingConstraint](self->_headerView, "reloadTrailingConstraint");
}

- (UIView)viewForContainmentString
{
  return -[MUPlaceHeaderView viewForContainmentString](self->_headerView, "viewForContainmentString");
}

- (MUPlaceHeaderSectionControllerDelegate)headerDelegate
{
  return (MUPlaceHeaderSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_headerDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_headerDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
