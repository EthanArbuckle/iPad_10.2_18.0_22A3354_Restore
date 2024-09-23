@implementation CLSTestInvestigationItem

- (CLSTestInvestigationItem)init
{
  CLSTestInvestigationItem *v2;
  void *v3;
  uint64_t v4;
  NSString *clsIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSTestInvestigationItem;
  v2 = -[CLSTestInvestigationItem init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    clsIdentifier = v2->_clsIdentifier;
    v2->_clsIdentifier = (NSString *)v4;

    v2->_clsAestheticScore = 0.5;
  }
  return v2;
}

- (unint64_t)clsPeopleCount
{
  void *v2;
  unint64_t v3;

  -[CLSTestInvestigationItem clsPersonLocalIdentifiers](self, "clsPersonLocalIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSArray)clsPersonAndPetLocalIdentifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  -[CLSTestInvestigationItem clsPersonLocalIdentifiers](self, "clsPersonLocalIdentifiers");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v6 = (void *)v3;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  -[CLSTestInvestigationItem clsPetLocalIdentifiers](self, "clsPetLocalIdentifiers");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v5;
  v11 = v10;

  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (NSDate)cls_localDate
{
  void *v3;
  void *v4;
  void *v5;

  -[CLSTestInvestigationItem cls_universalDate](self, "cls_universalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSTestInvestigationItem clsLocation](self, "clsLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar localDateFromUniversalDate:atLocation:](CLSCalendar, "localDateFromUniversalDate:atLocation:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (NSDateComponents)cls_localDateComponents
{
  void *v3;
  void *v4;
  void *v5;

  -[CLSTestInvestigationItem cls_universalDate](self, "cls_universalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSTestInvestigationItem cls_localDate](self, "cls_localDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar dateComponentsWithUTCDate:localDate:](CLSCalendar, "dateComponentsWithUTCDate:localDate:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v5;
}

- (double)scoreInContext:(id)a3
{
  double result;

  objc_msgSend((id)sCurationModel, "scoreWithAsset:inContext:", self, a3);
  return result;
}

- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4 reason:(id *)a5
{
  return self->_clsAvoidIfPossibleForKeyItem;
}

- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4
{
  return -[CLSTestInvestigationItem clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:reason:](self, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:reason:", a3, a4, 0);
}

- (CLSCurationModel)curationModel
{
  return 0;
}

- (unint64_t)clsSimilarityModelVersion
{
  return 33;
}

- (CLLocationCoordinate2D)pl_coordinate
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CLLocationCoordinate2D result;

  -[CLSTestInvestigationItem location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CLSTestInvestigationItem location](self, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9E500];
    v8 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  v9 = v6;
  v10 = v8;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

- (double)pl_gpsHorizontalAccuracy
{
  return *MEMORY[0x1E0D72F40];
}

- (NSString)clsIdentifier
{
  return self->_clsIdentifier;
}

- (CLLocation)clsLocation
{
  return self->_clsLocation;
}

- (void)setClsLocation:(id)a3
{
  objc_storeStrong((id *)&self->_clsLocation, a3);
}

- (NSArray)clsPersonLocalIdentifiers
{
  return self->_clsPersonLocalIdentifiers;
}

- (void)setClsPersonLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_clsPersonLocalIdentifiers, a3);
}

- (NSArray)clsConsolidatedPersonLocalIdentifiers
{
  return self->_clsConsolidatedPersonLocalIdentifiers;
}

- (int64_t)clsViewCount
{
  return self->_clsViewCount;
}

- (int64_t)clsPlayCount
{
  return self->_clsPlayCount;
}

- (int64_t)clsShareCount
{
  return self->_clsShareCount;
}

- (BOOL)clsIsUtility
{
  return self->_clsIsUtility;
}

- (BOOL)clsIsBlurry
{
  return self->_clsIsBlurry;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)clsIsScreenshotOrScreenRecording
{
  return self->_clsIsScreenshotOrScreenRecording;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (double)clsContentScore
{
  return self->_clsContentScore;
}

- (void)setClsContentScore:(double)a3
{
  self->_clsContentScore = a3;
}

- (NSSet)clsSceneClassifications
{
  return self->_clsSceneClassifications;
}

- (void)setClsSceneClassifications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (VNSceneprint)clsSceneprint
{
  return self->_clsSceneprint;
}

- (NSArray)clsUnprefetchedPersonLocalIdentifiers
{
  return self->_clsUnprefetchedPersonLocalIdentifiers;
}

- (BOOL)clsIsInterestingVideo
{
  return self->_clsIsAnInterestingVideo;
}

- (BOOL)clsIsInterestingLivePhoto
{
  return self->_clsIsAnInterestingPhoto;
}

- (BOOL)clsIsInterestingPanorama
{
  return self->_clsIsAnInterestingPanorama;
}

- (BOOL)clsIsInterestingSDOF
{
  return self->_clsIsAnInterestingSDOF;
}

- (BOOL)clsIsInterestingHDR
{
  return self->_clsIsAnInterestingHDR;
}

- (BOOL)clsHasInterestingAudioClassification
{
  return self->_clsHasInterestingAudioClassification;
}

- (BOOL)clsHasCustomPlaybackVariation
{
  return self->_clsHasCustomPlaybackVariation;
}

- (double)clsSharpnessScore
{
  return self->_clsSharpnessScore;
}

- (double)clsExposureScore
{
  return self->_clsExposureScore;
}

- (double)clsAestheticScore
{
  return self->_clsAestheticScore;
}

- (BOOL)clsIsAestheticallyPrettyGood
{
  return self->_clsIsAestheticallyPrettyGood;
}

- (double)clsFaceScore
{
  return self->_clsFaceScore;
}

- (BOOL)clsIsInhabited
{
  return self->_clsIsInhabited;
}

- (BOOL)clsAvoidIfPossibleForKeyItem
{
  return self->_clsAvoidIfPossibleForKeyItem;
}

- (void)setClsAvoidIfPossibleForKeyItem:(BOOL)a3
{
  self->_clsAvoidIfPossibleForKeyItem = a3;
}

- (BOOL)clsHasPoorResolution
{
  return self->_clsHasPoorResolution;
}

- (BOOL)clsHasInterestingScenes
{
  return self->_clsHasInterestingScenes;
}

- (NSDate)cls_universalDate
{
  return self->_cls_universalDate;
}

- (void)setCls_universalDate:(id)a3
{
  objc_storeStrong((id *)&self->_cls_universalDate, a3);
}

- (double)clsHighlightVisibilityScore
{
  return self->_clsHighlightVisibilityScore;
}

- (double)clsAutoplaySuggestionScore
{
  return self->_clsAutoplaySuggestionScore;
}

- (double)clsDuration
{
  return self->_clsDuration;
}

- (BOOL)clsIsNonMemorable
{
  return self->_clsIsNonMemorable;
}

- (BOOL)clsIsLoopOrBounce
{
  return self->_clsIsLoopOrBounce;
}

- (BOOL)clsIsLongExposure
{
  return self->_clsIsLongExposure;
}

- (double)clsSquareCropScore
{
  return self->_clsSquareCropScore;
}

- (NSArray)clsPetLocalIdentifiers
{
  return self->_clsPetLocalIdentifiers;
}

- (BOOL)clsIsInSharedLibrary
{
  return self->_clsIsInSharedLibrary;
}

- (double)clsIconicScore
{
  return self->_clsIconicScore;
}

- (NSSet)clsVisualLookupSceneClassifications
{
  return self->_clsVisualLookupSceneClassifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clsVisualLookupSceneClassifications, 0);
  objc_storeStrong((id *)&self->_clsPetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_cls_universalDate, 0);
  objc_storeStrong((id *)&self->_clsUnprefetchedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsSceneprint, 0);
  objc_storeStrong((id *)&self->_clsSceneClassifications, 0);
  objc_storeStrong((id *)&self->_clsConsolidatedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsLocation, 0);
  objc_storeStrong((id *)&self->_clsIdentifier, 0);
}

+ (id)itemWithPeopleNames:(id)a3 universalDate:(id)a4 coordinate:(CLLocationCoordinate2D)a5
{
  double longitude;
  double latitude;
  id v8;
  id v9;
  void *v10;
  void *v11;
  CLLocationCoordinate2D v13;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  v13.latitude = latitude;
  v13.longitude = longitude;
  if (CLLocationCoordinate2DIsValid(v13))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
    objc_msgSend(v10, "setClsLocation:", v11);

  }
  objc_msgSend(v10, "setClsPersonLocalIdentifiers:", v8);
  objc_msgSend(v10, "setCls_universalDate:", v9);

  return v10;
}

+ (id)itemWithUniversalDate:(id)a3 sceneClassifications:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setCls_universalDate:", v6);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setClsSceneClassifications:", v8);
  return v7;
}

@end
