@implementation MUPlaceHeaderButtonsSectionController

- (MUPlaceHeaderButtonsSectionController)initWithPlaceItem:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MUPlaceHeaderButtonsSectionController *v10;
  NSObject *v11;
  id *p_placeItem;
  id *p_configuration;
  MUHeaderButtonsViewConfiguration *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  MUHeaderButtonsSectionController *v21;
  void *v22;
  uint64_t v23;
  MUHeaderButtonsSectionController *headerSectionController;
  NSObject *v25;
  uint8_t v27[16];
  objc_super v28;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)MUPlaceHeaderButtonsSectionController;
  v10 = -[MUPlaceSectionController initWithMapItem:](&v28, sel_initWithMapItem_, v9);

  if (!v10)
    goto LABEL_17;
  MUGetPlaceCardLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceHeaderButtonsSectionControllerInit", ", v27, 2u);
  }

  p_placeItem = (id *)&v10->_placeItem;
  objc_storeStrong((id *)&v10->_placeItem, a3);
  p_configuration = (id *)&v10->_configuration;
  objc_storeStrong((id *)&v10->_configuration, a4);
  v14 = objc_alloc_init(MUHeaderButtonsViewConfiguration);
  -[MUHeaderButtonsViewConfiguration setShowMoreButton:](v14, "setShowMoreButton:", -[MUPlaceHeaderButtonsSectionControllerConfiguration showMoreButton](v10->_configuration, "showMoreButton"));
  if (-[MUPlaceHeaderButtonsSectionControllerConfiguration canShowDetourTime](v10->_configuration, "canShowDetourTime"))
  {
    objc_msgSend(*p_placeItem, "mapItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_detourInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "detourTime");
    -[MUHeaderButtonsViewConfiguration setDetourTime:](v14, "setDetourTime:");

  }
  else
  {
    -[MUHeaderButtonsViewConfiguration setDetourTime:](v14, "setDetourTime:", 0.0);
  }
  objc_msgSend(*p_configuration, "menuProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHeaderButtonsViewConfiguration setMenuProvider:](v14, "setMenuProvider:", v17);

  objc_msgSend(*p_placeItem, "mapItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "_hasFlyover");

  if ((v19 & 1) != 0)
  {
    v20 = &unk_1E2E55D20;
LABEL_13:
    -[MUHeaderButtonsViewConfiguration setPossibleAnalyticActions:](v14, "setPossibleAnalyticActions:", v20);
    goto LABEL_14;
  }
  if ((objc_msgSend(*p_placeItem, "options") & 1) != 0)
  {
    v20 = &unk_1E2E55D38;
    goto LABEL_13;
  }
  if ((objc_msgSend(*p_placeItem, "options") & 2) != 0)
  {
    v20 = &unk_1E2E55D50;
    goto LABEL_13;
  }
LABEL_14:
  v21 = [MUHeaderButtonsSectionController alloc];
  objc_msgSend(*p_configuration, "etaProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MUHeaderButtonsSectionController initWithETAProvider:headerButtonsConfiguration:](v21, "initWithETAProvider:headerButtonsConfiguration:", v22, v14);
  headerSectionController = v10->_headerSectionController;
  v10->_headerSectionController = (MUHeaderButtonsSectionController *)v23;

  -[MUHeaderButtonsSectionController setDelegate:](v10->_headerSectionController, "setDelegate:", v10);
  MUGetPlaceCardLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceHeaderButtonsSectionControllerInit", ", v27, 2u);
  }

LABEL_17:
  return v10;
}

- (UIView)sectionView
{
  return -[MUHeaderButtonsSectionController sectionView](self->_headerSectionController, "sectionView");
}

- (NSArray)sectionViews
{
  return -[MUHeaderButtonsSectionController sectionViews](self->_headerSectionController, "sectionViews");
}

- (void)setPrimaryButtonType:(unint64_t)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t v7[16];

  if (a3 == 1)
  {
    -[MUPlaceHeaderButtonsSectionControllerConfiguration buttonModuleConfiguration](self->_configuration, "buttonModuleConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldSuppressDirections");

    if (v5)
    {
      MUGetPlaceCardLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_191DB8000, v6, OS_LOG_TYPE_INFO, "MUPlaceHeaderButtonsSectionController: The module configuration requests suppressing directions, so overriding primary button type to None", v7, 2u);
      }

      a3 = 0;
    }
    else
    {
      a3 = 1;
    }
  }
  -[MUHeaderButtonsSectionController setPrimaryButtonType:](self->_headerSectionController, "setPrimaryButtonType:", a3);
}

- (unint64_t)primaryButtonType
{
  return -[MUHeaderButtonsSectionController primaryButtonType](self->_headerSectionController, "primaryButtonType");
}

- (_MKPlaceActionButtonController)secondaryButtonController
{
  return -[MUHeaderButtonsSectionController secondaryButtonController](self->_headerSectionController, "secondaryButtonController");
}

- (void)setSecondaryButtonController:(id)a3
{
  -[MUHeaderButtonsSectionController setSecondaryButtonController:](self->_headerSectionController, "setSecondaryButtonController:", a3);
}

- (void)setAlternatePrimaryButtonController:(id)a3
{
  -[MUHeaderButtonsSectionController setAlternatePrimaryButtonController:](self->_headerSectionController, "setAlternatePrimaryButtonController:", a3);
}

- (_MKPlaceActionButtonController)alternatePrimaryButtonController
{
  return -[MUHeaderButtonsSectionController alternatePrimaryButtonController](self->_headerSectionController, "alternatePrimaryButtonController");
}

- (void)setPlaceItem:(id)a3
{
  _MKPlaceItem *v5;
  _MKPlaceItem *v6;

  v5 = (_MKPlaceItem *)a3;
  if (self->_placeItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeItem, a3);
    -[MUHeaderButtonsSectionController setPrimaryButtonType:](self->_headerSectionController, "setPrimaryButtonType:", 0);
    v5 = v6;
  }

}

- (BOOL)hasContent
{
  return -[MUHeaderButtonsSectionController hasContent](self->_headerSectionController, "hasContent");
}

- (void)setActive:(BOOL)a3
{
  -[MUHeaderButtonsSectionController setActive:](self->_headerSectionController, "setActive:", a3);
}

- (BOOL)isActive
{
  return -[MUHeaderButtonsSectionController isActive](self->_headerSectionController, "isActive");
}

- (void)headerButtonsSectionControllerDidUpdateContent:(id)a3
{
  id v4;

  -[MUPlaceSectionController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeSectionControllerDidUpdateContent:", self);

}

- (void)headerButtonsSectionController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[MUPlaceHeaderButtonsSectionController headerDelegate](self, "headerDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeHeaderButtonsSectionController:didSelectPrimaryType:withPresentationOptions:", self, a4, v7);

}

- (void)headerButtonsSectionControllerWillPresentMenu:(id)a3
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 209, 0, 0, 0);
}

- (void)setAnalyticsDelegate:(id)a3
{
  -[MUHeaderButtonsSectionController setAnalyticsDelegate:](self->_headerSectionController, "setAnalyticsDelegate:", a3);
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  return -[MUHeaderButtonsSectionController analyticsDelegate](self->_headerSectionController, "analyticsDelegate");
}

- (id)infoCardChildPossibleActions
{
  return -[MUHeaderButtonsSectionController infoCardChildPossibleActions](self->_headerSectionController, "infoCardChildPossibleActions");
}

- (id)infoCardChildUnactionableUIElements
{
  return -[MUHeaderButtonsSectionController infoCardChildUnactionableUIElements](self->_headerSectionController, "infoCardChildUnactionableUIElements");
}

- (id)analyticsModule
{
  return -[MUHeaderButtonsSectionController analyticsModule](self->_headerSectionController, "analyticsModule");
}

- (int)analyticsModuleType
{
  return -[MUHeaderButtonsSectionController analyticsModuleType](self->_headerSectionController, "analyticsModuleType");
}

- (BOOL)isImpressionable
{
  return 1;
}

- (id)revealedAnalyticsModule
{
  return -[MUHeaderButtonsSectionController revealedAnalyticsModule](self->_headerSectionController, "revealedAnalyticsModule");
}

- (MUPlaceHeaderButtonsSectionControllerDelegate)headerDelegate
{
  return (MUPlaceHeaderButtonsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_headerDelegate);
}

- (void)setHeaderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_headerDelegate, a3);
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_destroyWeak((id *)&self->_headerDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_headerSectionController, 0);
}

@end
