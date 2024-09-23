@implementation MUCuratedCollectionsPlacecardAnalyticsManager

- (MUCuratedCollectionsPlacecardAnalyticsManager)init
{
  MUCuratedCollectionsPlacecardAnalyticsManager *v2;
  MUCuratedCollectionsPlacecardAnalyticsManager *v3;
  NSNumber *verticalIndex;
  NSMutableArray *possibleActions;
  NSMutableArray *impossibleActions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MUCuratedCollectionsPlacecardAnalyticsManager;
  v2 = -[MUCuratedCollectionsPlacecardAnalyticsManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_event.target = 0xE000000C9;
    verticalIndex = v2->_event.verticalIndex;
    v2->_event.verticalIndex = 0;

    possibleActions = v3->_event.possibleActions;
    v3->_event.possibleActions = 0;

    impossibleActions = v3->_event.impossibleActions;
    v3->_event.impossibleActions = 0;

  }
  return v3;
}

- (void)placecardCollectionsScrollBackward
{
  -[MUCuratedCollectionsPlacecardAnalyticsManager cleanUp](self, "cleanUp");
  self->_event.action = 9037;
  -[MUCuratedCollectionsPlacecardAnalyticsManager logEvent](self, "logEvent");
}

- (void)placecardCollectionsScrollForward
{
  -[MUCuratedCollectionsPlacecardAnalyticsManager cleanUp](self, "cleanUp");
  self->_event.action = 9036;
  -[MUCuratedCollectionsPlacecardAnalyticsManager logEvent](self, "logEvent");
}

- (void)placecardCollectionTapped:(id)a3 atIndex:(unint64_t)a4 isCurrentlySaved:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  NSNumber *v11;
  NSNumber *collectionId;
  NSNumber *v13;
  NSNumber *collectionCurrentlySaved;
  NSNumber *v15;
  NSNumber *horizontalIndex;

  v5 = a5;
  v8 = a3;
  -[MUCuratedCollectionsPlacecardAnalyticsManager cleanUp](self, "cleanUp");
  self->_event.action = 2099;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v8, "muid");

  objc_msgSend(v9, "numberWithUnsignedLongLong:", v10);
  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  collectionId = self->_event.collectionId;
  self->_event.collectionId = v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  collectionCurrentlySaved = self->_event.collectionCurrentlySaved;
  self->_event.collectionCurrentlySaved = v13;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  horizontalIndex = self->_event.horizontalIndex;
  self->_event.horizontalIndex = v15;

  -[MUCuratedCollectionsPlacecardAnalyticsManager logEvent](self, "logEvent");
}

- (void)placecardCollectionsSeeAllTapped
{
  -[MUCuratedCollectionsPlacecardAnalyticsManager cleanUp](self, "cleanUp");
  self->_event.action = 2094;
  -[MUCuratedCollectionsPlacecardAnalyticsManager logEvent](self, "logEvent");
}

- (void)placecardExploreGuidesButtonTapped
{
  -[MUCuratedCollectionsPlacecardAnalyticsManager cleanUp](self, "cleanUp");
  self->_event.action = 180;
  -[MUCuratedCollectionsPlacecardAnalyticsManager logEvent](self, "logEvent");
}

- (void)logEvent
{
  void *v3;
  NSString *value;
  NSNumber *verticalIndex;
  NSNumber *horizontalIndex;
  NSNumber *collectionCurrentlySaved;
  uint64_t target;
  void *v9;
  NSMutableArray *possibleActions;
  NSMutableArray *impossibleActions;
  void *v12;
  unsigned int action;
  void *v14;
  NSNumber *collectionId;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", 31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  action = self->_event.action;
  value = self->_event.value;
  v14 = (void *)MEMORY[0x1E0D263E8];
  collectionId = self->_event.collectionId;
  verticalIndex = self->_event.verticalIndex;
  collectionCurrentlySaved = self->_event.collectionCurrentlySaved;
  horizontalIndex = self->_event.horizontalIndex;
  target = self->_event.target;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_event.cardType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  possibleActions = self->_event.possibleActions;
  impossibleActions = self->_event.impossibleActions;
  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:", action, target, value, 0, 0, collectionId, 0, collectionCurrentlySaved, verticalIndex, horizontalIndex, v9, possibleActions, impossibleActions, v12);

}

- (void)cleanUp
{
  NSString *value;
  NSNumber *collectionId;
  NSNumber *collectionCurrentlySaved;
  NSNumber *horizontalIndex;

  self->_event.action = 0;
  value = self->_event.value;
  self->_event.value = 0;

  collectionId = self->_event.collectionId;
  self->_event.collectionId = 0;

  collectionCurrentlySaved = self->_event.collectionCurrentlySaved;
  self->_event.collectionCurrentlySaved = 0;

  horizontalIndex = self->_event.horizontalIndex;
  self->_event.horizontalIndex = 0;

}

- (void).cxx_destruct
{

}

@end
