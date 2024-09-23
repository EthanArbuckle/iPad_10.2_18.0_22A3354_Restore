@implementation MUTransitDeparturesSectionController

- (MUTransitDeparturesSectionController)initWithMapItem:(id)a3 allowTransitLineSelection:(BOOL)a4 departuresDelegate:(id)a5
{
  id v7;
  MUTransitDeparturesSectionController *v8;
  MUTransitDeparturesSectionController *v9;
  objc_super v11;

  v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MUTransitDeparturesSectionController;
  v8 = -[MUPlaceSectionController initWithMapItem:](&v11, sel_initWithMapItem_, a3);
  v9 = v8;
  if (v8)
  {
    -[MUTransitDeparturesSectionController setDeparturesDelegate:](v8, "setDeparturesDelegate:", v7);
    -[MUTransitDeparturesSectionController _setupSections](v9, "_setupSections");
  }

  return v9;
}

- (void)_setupSections
{
  MUTransitDeparturesDataSource *v3;
  void *v4;
  MUTransitDeparturesDataSource *v5;
  MUTransitDeparturesDataSource *dataSource;
  MUTransitDeparturesSectionViewProvider *v7;
  MUTransitDeparturesSectionViewProvider *viewProvider;

  v3 = [MUTransitDeparturesDataSource alloc];
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUTransitDeparturesDataSource initWithMapItem:](v3, "initWithMapItem:", v4);
  dataSource = self->_dataSource;
  self->_dataSource = v5;

  -[MUTransitDeparturesDataSource setDelegate:](self->_dataSource, "setDelegate:", self);
  v7 = -[MUTransitDeparturesSectionViewProvider initWithDataSource:userInteractionDelegate:]([MUTransitDeparturesSectionViewProvider alloc], "initWithDataSource:userInteractionDelegate:", self->_dataSource, self);
  viewProvider = self->_viewProvider;
  self->_viewProvider = v7;

}

- (NSArray)sectionViews
{
  return (NSArray *)-[MUTransitDeparturesSectionViewProvider sectionViewsForCurrentState](self->_viewProvider, "sectionViewsForCurrentState");
}

- (id)draggableContent
{
  return 0;
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", v6, v8, v5);

}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  id v12;

  v6 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = a4;
  -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:actionRichProviderId:", v8, v11, v6, v10);

}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;

  v7 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a7;
  v13 = a5;
  -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", v10, v9, v13, v7, v12);

}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10
{
  uint64_t v14;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;

  v14 = *(_QWORD *)&a4;
  v15 = *(_QWORD *)&a3;
  v17 = a10;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = a9;
  objc_msgSend(v23, "infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", v15, v14, v21, v20, v19, v18, v22, v17);

}

- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10
{
  uint64_t v10;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  v10 = *(_QWORD *)&a8;
  v15 = *(_QWORD *)&a3;
  v17 = a9;
  v18 = a7;
  v19 = a6;
  -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = a10;
  objc_msgSend(v21, "infoCardTransitAnalyticsDidSelectionAction:resultIndex:targetID:transitSystem:transitDepartureSequence:transitCardCategory:transitIncident:feedbackDelegateSelector:", v15, a4, a5, v19, v18, v10, v17, v20);

}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;

  v8 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a4;
  v12 = *(_QWORD *)&a3;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", v12, v11, v16, v15, v8, v14);

}

- (int)analyticsModuleType
{
  return 6;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (BOOL)sectionViewProvider:(id)a3 canSelect:(id)a4 using:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  -[MUTransitDeparturesSectionController departuresDelegate](self, "departuresDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "transitDeparturesSectionController:canSelectDepartureSequence:usingMapItem:", self, v8, v7);

  return (char)self;
}

- (void)sectionViewProvider:(id)a3 didSelectAttribution:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", 7006, 0, 0, 0);
  -[MUTransitDeparturesSectionController departuresDelegate](self, "departuresDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitDeparturesSectionController:didSelectAttribution:", self, v5);

}

- (void)sectionViewProvider:(id)a3 didSelectConnectionInfo:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MUTransitDeparturesSectionController departuresDelegate](self, "departuresDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitDeparturesSectionController:didSelectConnectionInformation:", self, v5);

}

- (void)sectionViewProvider:(id)a3 didSelectDepartureSequence:(id)a4 using:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[MUTransitDeparturesSectionController departuresDelegate](self, "departuresDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitDeparturesSectionController:didSelectDepartureSequence:usingMapItem:", self, v8, v7);

}

- (void)sectionViewProvider:(id)a3 didSelect:(id)a4 using:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[MUTransitDeparturesSectionController departuresDelegate](self, "departuresDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitDeparturesSectionController:didSelectTransitLine:usingPresentationOptions:completion:", self, v8, v7, &__block_literal_global_34);

}

- (void)sectionViewProvider:(id)a3 didSelectIncidents:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MUTransitDeparturesSectionController departuresDelegate](self, "departuresDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitDeparturesSectionController:showIncidents:", self, v5);

}

- (id)traitsForDeparturesDataSource:(id)a3
{
  void *v4;
  void *v5;

  -[MUTransitDeparturesSectionController departuresDelegate](self, "departuresDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitsForTransitDeparturesSectionController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)transitDeparturesDataSourceWantsReload:(id)a3
{
  id v4;

  -[MUTransitDeparturesSectionViewProvider setNeedsRebuild:](self->_viewProvider, "setNeedsRebuild:", 1);
  -[MUPlaceSectionController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeSectionControllerDidUpdateContent:", self);

}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[MUTransitDeparturesDataSource setIsActive:](self->_dataSource, "setIsActive:");
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (MUTransitDeparturesSectionControllerDelegate)departuresDelegate
{
  return (MUTransitDeparturesSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_departuresDelegate);
}

- (void)setDeparturesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_departuresDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_departuresDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
}

@end
