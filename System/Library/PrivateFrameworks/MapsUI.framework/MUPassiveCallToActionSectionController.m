@implementation MUPassiveCallToActionSectionController

- (id)sectionView
{
  -[MUPassiveCallToActionSectionController _loadContentIfNeeded](self, "_loadContentIfNeeded");
  return self->_sectionView;
}

- (BOOL)hasContentBeforePersonalizedSuggestionArbitration
{
  return self->_suggestionView != 0;
}

- (BOOL)hasContent
{
  void *v3;
  void *v4;
  char v5;

  -[MUPlaceSectionController personalizedSuggestionsArbiterDelegate](self, "personalizedSuggestionsArbiterDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -[MUPassiveCallToActionSectionController hasContentBeforePersonalizedSuggestionArbitration](self, "hasContentBeforePersonalizedSuggestionArbitration");
  -[MUPlaceSectionController personalizedSuggestionsArbiterDelegate](self, "personalizedSuggestionsArbiterDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowPlaceCallToActionSection");

  return v5;
}

- (void)updateSuggestionView
{
  void *v3;
  void *v4;
  UIView *obj;

  -[MUCallToActionSectionController callToActionDelegate](self, "callToActionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestionViewForCallToActionSectionController:", self);
  obj = (UIView *)objc_claimAutoreleasedReturnValue();

  if (obj != self->_suggestionView)
  {
    -[MUPassiveCallToActionSectionController _unloadContent](self, "_unloadContent");
    objc_storeStrong((id *)&self->_suggestionView, obj);
    -[MUPassiveCallToActionSectionController _loadContentIfNeeded](self, "_loadContentIfNeeded");
    -[MUPlaceSectionController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placeSectionControllerDidUpdateContent:", self);

  }
}

- (void)_unloadContent
{
  MUPlaceSectionView *sectionView;

  sectionView = self->_sectionView;
  self->_sectionView = 0;

}

- (void)_loadContentIfNeeded
{
  UIView *suggestionView;
  void *v4;
  UIView *v5;
  UIView *v6;
  MUPlaceSectionView *v7;
  MUPlaceSectionView *sectionView;

  if (!self->_sectionView)
  {
    suggestionView = self->_suggestionView;
    if (suggestionView)
      goto LABEL_5;
    -[MUCallToActionSectionController callToActionDelegate](self, "callToActionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestionViewForCallToActionSectionController:", self);
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_suggestionView;
    self->_suggestionView = v5;

    suggestionView = self->_suggestionView;
    if (suggestionView)
    {
LABEL_5:
      +[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:", suggestionView, 0);
      v7 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue();
      sectionView = self->_sectionView;
      self->_sectionView = v7;

      -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
    }
  }
}

- (void)_instrumentUserAction:(int)a3
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", *(_QWORD *)&a3, CFSTR("business info"), 0, 0);
}

- (int)analyticsModuleType
{
  return 41;
}

- (BOOL)isImpressionable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end
