@implementation MUPersonalizedSuggestionSectionArbiter

- (int64_t)bestSuggestionSectionType
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  int v9;

  -[MUPersonalizedSuggestionSectionArbiter placeNotesSectionController](self, "placeNotesSectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasContentBeforePersonalizedSuggestionArbitration");

  if ((v4 & 1) != 0)
    return 1;
  -[MUPersonalizedSuggestionSectionArbiter placeCallToActionSectionController](self, "placeCallToActionSectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasContentBeforePersonalizedSuggestionArbitration");

  if ((v7 & 1) != 0)
    return 2;
  -[MUPersonalizedSuggestionSectionArbiter hikingTipSectionController](self, "hikingTipSectionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasContentBeforePersonalizedSuggestionArbitration");

  if (v9)
    return 3;
  else
    return 0;
}

- (BOOL)shouldShowPlaceNotesSection
{
  return -[MUPersonalizedSuggestionSectionArbiter bestSuggestionSectionType](self, "bestSuggestionSectionType") == 1;
}

- (BOOL)shouldShowPlaceCallToActionSection
{
  return -[MUPersonalizedSuggestionSectionArbiter bestSuggestionSectionType](self, "bestSuggestionSectionType") == 2;
}

- (BOOL)shouldShowHikingTipSection
{
  return -[MUPersonalizedSuggestionSectionArbiter bestSuggestionSectionType](self, "bestSuggestionSectionType") == 3;
}

- (_TtC6MapsUI29MUPlaceNotesSectionController)placeNotesSectionController
{
  return (_TtC6MapsUI29MUPlaceNotesSectionController *)objc_loadWeakRetained((id *)&self->_placeNotesSectionController);
}

- (void)setPlaceNotesSectionController:(id)a3
{
  objc_storeWeak((id *)&self->_placeNotesSectionController, a3);
}

- (MUPassiveCallToActionSectionController)placeCallToActionSectionController
{
  return (MUPassiveCallToActionSectionController *)objc_loadWeakRetained((id *)&self->_placeCallToActionSectionController);
}

- (void)setPlaceCallToActionSectionController:(id)a3
{
  objc_storeWeak((id *)&self->_placeCallToActionSectionController, a3);
}

- (MUHikingTipSectionController)hikingTipSectionController
{
  return (MUHikingTipSectionController *)objc_loadWeakRetained((id *)&self->_hikingTipSectionController);
}

- (void)setHikingTipSectionController:(id)a3
{
  objc_storeWeak((id *)&self->_hikingTipSectionController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hikingTipSectionController);
  objc_destroyWeak((id *)&self->_placeCallToActionSectionController);
  objc_destroyWeak((id *)&self->_placeNotesSectionController);
}

@end
