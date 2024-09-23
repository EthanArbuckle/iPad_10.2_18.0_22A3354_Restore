@implementation MUPlaceSectionController

- (MUPlaceSectionController)initWithMapItem:(id)a3
{
  id v5;
  MUPlaceSectionController *v6;
  MUPlaceSectionController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceSectionController;
  v6 = -[MUPlaceSectionController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapItem, a3);

  return v7;
}

- (UIView)sectionView
{
  UIView *sectionView;
  id v4;
  UIView *v5;
  UIView *v6;

  sectionView = self->_sectionView;
  if (!sectionView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_sectionView;
    self->_sectionView = v5;

    sectionView = self->_sectionView;
  }
  return sectionView;
}

- (NSArray)sectionViews
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[MUPlaceSectionController sectionView](self, "sectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  -[MUPlaceSectionController sectionView](self, "sectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)draggableContent
{
  return 0;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  return 0;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  return 0;
}

- (BOOL)hasContent
{
  void *v2;
  BOOL v3;

  -[MUPlaceSectionController sectionViews](self, "sectionViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)infoCardChildPossibleActions
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)captureInfoCardAction:(int)a3 eventValue:(id)a4
{
  -[MUPlaceSectionController captureInfoCardAction:target:eventValue:](self, "captureInfoCardAction:target:eventValue:", *(_QWORD *)&a3, 201, a4);
}

- (void)captureInfoCardAction:(int)a3 target:(int)a4 eventValue:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController analyticsModule](self, "analyticsModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", v6, v5, v8, v9, 0, 0);

}

- (void)captureInfoCardAction:(int)a3 eventValue:(id)a4 feedbackType:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController analyticsModule](self, "analyticsModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", v6, 201, v8, v9, v5, 0);

}

- (void)captureInfoCardAction:(int)a3 eventValue:(id)a4 feedbackType:(int)a5 actionRichProviderId:(id)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  id v13;

  v6 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = a4;
  -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController analyticsModule](self, "analyticsModule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "infoCardAnalyticsDidSelectAction:target:eventValue:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", v8, 201, v11, v12, v6, v10);

}

- (void)captureInfoCardPartnerAction:(int)a3 target:(int)a4 eventValue:(id)a5 sharedStateButtonList:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v14 = a5;
  v10 = a6;
  -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "infoCardAnalyticsPopulateSharedStateWithButtonList:", v10);

  }
  -[MUPlaceSectionController captureInfoCardAction:target:eventValue:](self, "captureInfoCardAction:target:eventValue:", v8, v7, v14);

}

- (void)captureInfoCardPartnerAction:(int)a3 eventValue:(id)a4 sharedStateButtonList:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v6 = *(_QWORD *)&a3;
  v12 = a4;
  v8 = a5;
  -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MUPlaceSectionController analyticsDelegate](self, "analyticsDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "infoCardAnalyticsPopulateSharedStateWithButtonList:", v8);

  }
  -[MUPlaceSectionController captureInfoCardAction:eventValue:](self, "captureInfoCardAction:eventValue:", v6, v12);

}

- (GEOAPPlaceCardModule)analyticsModule
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", -[MUPlaceSectionController analyticsModuleType](self, "analyticsModuleType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController _populateAnalyticsModule:](self, "_populateAnalyticsModule:", v3);
  return (GEOAPPlaceCardModule *)v3;
}

- (GEORevealedPlaceCardModule)revealedAnalyticsModule
{
  void *v3;

  if (-[MUPlaceSectionController isImpressionable](self, "isImpressionable"))
  {
    objc_msgSend(MEMORY[0x1E0D27450], "moduleWithType:", -[MUPlaceSectionController analyticsModuleType](self, "analyticsModuleType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionController _populateRevealedAnalyticsModule:](self, "_populateRevealedAnalyticsModule:", v3);
  }
  else
  {
    v3 = 0;
  }
  return (GEORevealedPlaceCardModule *)v3;
}

- (int)analyticsModuleType
{
  return 0;
}

- (MUImpressionElement)impressionElement
{
  MUImpressionElement *impressionElement;
  double v4;
  double v5;
  MUImpressionElement *v6;
  void *v7;
  MUImpressionElement *v8;
  MUImpressionElement *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  MUImpressionElement *v13;

  if (-[MUPlaceSectionController isImpressionable](self, "isImpressionable"))
  {
    impressionElement = self->_impressionElement;
    if (!impressionElement)
    {
      +[MUPlaceModuleVisibilityConfigStore visibilityThresholdForModuleType:](MUPlaceModuleVisibilityConfigStore, "visibilityThresholdForModuleType:", -[MUPlaceSectionController analyticsModuleType](self, "analyticsModuleType"));
      v5 = v4;
      v6 = [MUImpressionElement alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MUImpressionElement initWithElementIdentifier:visibilityThreshold:](v6, "initWithElementIdentifier:visibilityThreshold:", v7, v5);
      v9 = self->_impressionElement;
      self->_impressionElement = v8;

      -[MUPlaceSectionController _placeCardImpressionsMetadata](self, "_placeCardImpressionsMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUImpressionElement setCustomData:](self->_impressionElement, "setCustomData:", v10);

      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUImpressionElement setDebugString:](self->_impressionElement, "setDebugString:", v12);

      impressionElement = self->_impressionElement;
    }
    v13 = impressionElement;
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)_placeCardImpressionsMetadata
{
  MUPlaceCardImpressionsMetadata *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MUPlaceCardImpressionsMetadata);
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCardImpressionsMetadata setBusinessId:](v3, "setBusinessId:", objc_msgSend(v4, "_muid"));

  -[MUPlaceSectionController mapItem](self, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "place");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceCardImpressionsMetadata setLocalSearchProviderId:](v3, "setLocalSearchProviderId:", objc_msgSend(v6, "localSearchProviderID"));

  -[MUPlaceSectionController analyticsModuleType](self, "analyticsModuleType");
  -[MUPlaceCardImpressionsMetadata setModuleType:](v3, "setModuleType:", GEOPDPlaceDataLayoutConfigurationFromGEOModuleType());
  return v3;
}

- (BOOL)isImpressionable
{
  return 0;
}

- (CGRect)impressionsFrame
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  v31 = *MEMORY[0x1E0C80C00];
  -[MUPlaceSectionController sectionViews](self, "sectionViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  objc_msgSend(v2, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  x = v5;
  y = v7;
  width = v9;
  height = v11;

  if (v3 != 1)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v2;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v17), "frame", (_QWORD)v26);
          v35.origin.x = v18;
          v35.origin.y = v19;
          v35.size.width = v20;
          v35.size.height = v21;
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v33 = CGRectUnion(v32, v35);
          x = v33.origin.x;
          y = v33.origin.y;
          width = v33.size.width;
          height = v33.size.height;
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (void)setSubmissionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_submissionStatus, a3);
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  return (MUInfoCardAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (MUPlaceSectionControllerDelegate)delegate
{
  return (MUPlaceSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MUPersonalizedSuggestionSectionArbiterDelegate)personalizedSuggestionsArbiterDelegate
{
  return (MUPersonalizedSuggestionSectionArbiterDelegate *)objc_loadWeakRetained((id *)&self->_personalizedSuggestionsArbiterDelegate);
}

- (void)setPersonalizedSuggestionsArbiterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_personalizedSuggestionsArbiterDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_personalizedSuggestionsArbiterDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_impressionElement, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end
