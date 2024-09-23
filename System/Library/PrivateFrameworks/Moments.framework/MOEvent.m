@implementation MOEvent

- (id)bundleSourceType
{
  unint64_t v2;

  v2 = -[MOEvent category](self, "category") - 1;
  if (v2 <= 0x17 && ((0xF1E2BFu >> v2) & 1) != 0)
    return *off_1E8541960[v2];
  else
    return 0;
}

- (MOEvent)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 creationDate:(id)a6 provider:(unint64_t)a7 category:(unint64_t)a8
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  MOEvent *v21;
  MOEvent *v22;
  uint64_t v23;
  NSDate *startDate;
  uint64_t v25;
  NSDate *endDate;
  uint64_t v27;
  NSDate *creationDate;
  MOEvent *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  SEL v34;
  MOEvent *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  objc_super v41;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = v19;
  if (!v16)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v33 = CFSTR("Invalid parameter not satisfying: eventIdentifier");
    v34 = a2;
    v35 = self;
    v36 = 31;
    goto LABEL_20;
  }
  if (!v17)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v33 = CFSTR("Invalid parameter not satisfying: startDate");
    v34 = a2;
    v35 = self;
    v36 = 32;
    goto LABEL_20;
  }
  if (!v18)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.3();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v33 = CFSTR("Invalid parameter not satisfying: endDate");
    v34 = a2;
    v35 = self;
    v36 = 33;
    goto LABEL_20;
  }
  if (!v19)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.4();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v33 = CFSTR("Invalid parameter not satisfying: creationDate");
    v34 = a2;
    v35 = self;
    v36 = 34;
LABEL_20:
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v34, v35, CFSTR("MOEvent.m"), v36, v33);

    v29 = 0;
    goto LABEL_21;
  }
  v41.receiver = self;
  v41.super_class = (Class)MOEvent;
  v21 = -[MOEvent init](&v41, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_eventIdentifier, a3);
    v23 = objc_msgSend(v17, "copy");
    startDate = v22->_startDate;
    v22->_startDate = (NSDate *)v23;

    v25 = objc_msgSend(v18, "copy");
    endDate = v22->_endDate;
    v22->_endDate = (NSDate *)v25;

    v27 = objc_msgSend(v20, "copy");
    creationDate = v22->_creationDate;
    v22->_creationDate = (NSDate *)v27;

    v22->_provider = a7;
    v22->_category = a8;
    -[MOEvent initSubEvent](v22, "initSubEvent");
  }
  self = v22;
  v29 = self;
LABEL_21:

  return v29;
}

- (void)initSubEvent
{
  unint64_t category;
  MOEventRoutine *v4;
  MOEventRoutine *routineEvent;
  MOEventMotionActivity *v6;
  MOEventMotionActivity *motionActivityEvent;
  MOEventWorkout *v8;
  MOEventWorkout *workoutEvent;

  category = self->_category;
  if (category == 16)
  {
    v6 = objc_alloc_init(MOEventMotionActivity);
    motionActivityEvent = self->_motionActivityEvent;
    self->_motionActivityEvent = v6;

  }
  else if (category != 2)
  {
    if (category == 1)
    {
      v4 = objc_alloc_init(MOEventRoutine);
      routineEvent = self->_routineEvent;
      self->_routineEvent = v4;

    }
    return;
  }
  v8 = objc_alloc_init(MOEventWorkout);
  workoutEvent = self->_workoutEvent;
  self->_workoutEvent = v8;

}

+ (id)describeProvider:(unint64_t)a3
{
  __CFString *v3;

  if (a3 >= 0xC)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown (%lu)"), a3);
  else
    v3 = off_1E8542988[a3];
  return v3;
}

+ (id)describeCategory:(unint64_t)a3
{
  if (a3 - 1 > 0x17)
    return CFSTR("Unknown Category");
  else
    return off_1E85429E8[a3 - 1];
}

- (id)describeCategory
{
  return +[MOEvent describeCategory:](MOEvent, "describeCategory:", -[MOEvent category](self, "category"));
}

- (id)describeProvider
{
  return +[MOEvent describeProvider:](MOEvent, "describeProvider:", -[MOEvent provider](self, "provider"));
}

- (unint64_t)photoMomentSource
{
  unint64_t result;

  result = (unint64_t)self->_photoEvent;
  if (result)
    return objc_msgSend((id)result, "photoMomentSource");
  return result;
}

- (MOEventExtendedAttributes)extendedAttributes
{
  void *photoEvent;

  photoEvent = self->_photoEvent;
  if (photoEvent)
  {
    objc_msgSend(photoEvent, "extendedAttributes");
    photoEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (MOEventExtendedAttributes *)photoEvent;
}

- (PHAsset)photoAsset
{
  void *photoEvent;

  photoEvent = self->_photoEvent;
  if (photoEvent)
  {
    objc_msgSend(photoEvent, "photoAsset");
    photoEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PHAsset *)photoEvent;
}

- (NSString)photoMemoryTitle
{
  void *photoEvent;

  photoEvent = self->_photoEvent;
  if (photoEvent)
  {
    objc_msgSend(photoEvent, "photoMemoryTitle");
    photoEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)photoEvent;
}

- (NSArray)photoMemoryAssets
{
  void *photoEvent;

  photoEvent = self->_photoEvent;
  if (photoEvent)
  {
    objc_msgSend(photoEvent, "photoMemoryAssets");
    photoEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)photoEvent;
}

- (unint64_t)photoMemoryCategory
{
  unint64_t result;

  result = (unint64_t)self->_photoEvent;
  if (result)
    return objc_msgSend((id)result, "photoMemoryCategory");
  return result;
}

- (unint64_t)timeAtHomeSubType
{
  unint64_t result;

  result = (unint64_t)self->_analyticsEvent;
  if (result)
    return objc_msgSend((id)result, "timeAtHomeSubType");
  return result;
}

- (BOOL)isHighConfidence
{
  MOEventRoutine *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
    LOBYTE(routineEvent) = -[MOEventRoutine isHighConfidence](routineEvent, "isHighConfidence");
  return (char)routineEvent;
}

- (BOOL)isInvalid
{
  MOEventRoutine *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
    LOBYTE(routineEvent) = -[MOEventRoutine isInvalid](routineEvent, "isInvalid");
  return (char)routineEvent;
}

- (unint64_t)placeType
{
  unint64_t result;

  result = (unint64_t)self->_routineEvent;
  if (result)
    return objc_msgSend((id)result, "placeType");
  return result;
}

- (unint64_t)placeUserType
{
  unint64_t result;

  result = (unint64_t)self->_routineEvent;
  if (result)
    return objc_msgSend((id)result, "placeUserType");
  return result;
}

- (NSString)placeName
{
  void *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    objc_msgSend(routineEvent, "placeName");
    routineEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)routineEvent;
}

- (double)placeNameConfidence
{
  MOEventRoutine *routineEvent;
  double result;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
    return 0.0;
  -[MOEventRoutine placeNameConfidence](routineEvent, "placeNameConfidence");
  return result;
}

- (unint64_t)placeDiscovery
{
  unint64_t result;

  result = (unint64_t)self->_routineEvent;
  if (result)
    return objc_msgSend((id)result, "placeDiscovery");
  return result;
}

- (RTLocation)location
{
  void *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    objc_msgSend(routineEvent, "location");
    routineEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (RTLocation *)routineEvent;
}

- (RTAddress)address
{
  void *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    objc_msgSend(routineEvent, "address");
    routineEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (RTAddress *)routineEvent;
}

- (GEOAddressObject)geoAddressObject
{
  void *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    objc_msgSend(routineEvent, "geoAddressObject");
    routineEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (GEOAddressObject *)routineEvent;
}

- (unint64_t)mode
{
  unint64_t result;

  result = (unint64_t)self->_routineEvent;
  if (result)
    return objc_msgSend((id)result, "mode");
  return result;
}

- (NSData)placeMapItem
{
  void *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    objc_msgSend(routineEvent, "placeMapItem");
    routineEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSData *)routineEvent;
}

- (NSString)poiCategory
{
  void *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    objc_msgSend(routineEvent, "poiCategory");
    routineEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)routineEvent;
}

- (unint64_t)placeSource
{
  unint64_t result;

  result = (unint64_t)self->_routineEvent;
  if (result)
    return objc_msgSend((id)result, "placeSource");
  return result;
}

- (double)familiarityIndexLOI
{
  MOEventRoutine *routineEvent;
  double result;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
    return 0.0;
  -[MOEventRoutine familiarityIndexLOI](routineEvent, "familiarityIndexLOI");
  return result;
}

- (NSString)workoutType
{
  void *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    objc_msgSend(workoutEvent, "workoutType");
    workoutEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)workoutEvent;
}

- (NSNumber)workoutTotalDistance
{
  void *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    objc_msgSend(workoutEvent, "workoutTotalDistance");
    workoutEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)workoutEvent;
}

- (NSNumber)workoutTotalEnergyBurned
{
  void *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    objc_msgSend(workoutEvent, "workoutTotalEnergyBurned");
    workoutEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)workoutEvent;
}

- (NSNumber)workoutDuration
{
  void *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    objc_msgSend(workoutEvent, "workoutDuration");
    workoutEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)workoutEvent;
}

- (CLLocation)workoutLocationStart
{
  void *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    objc_msgSend(workoutEvent, "workoutLocationStart");
    workoutEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (CLLocation *)workoutEvent;
}

- (NSArray)workoutLocationRoute
{
  void *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
  {
    objc_msgSend(workoutEvent, "workoutLocationRoute");
    workoutEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)workoutEvent;
}

- (NSNumber)motionStepCount
{
  void *motionActivityEvent;

  motionActivityEvent = self->_motionActivityEvent;
  if (motionActivityEvent)
  {
    objc_msgSend(motionActivityEvent, "motionStepCount");
    motionActivityEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)motionActivityEvent;
}

- (BOOL)isFitnessPlusSession
{
  MOEventWorkout *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
    LOBYTE(workoutEvent) = -[MOEventWorkout isFitnessPlusSession](workoutEvent, "isFitnessPlusSession");
  return (char)workoutEvent;
}

- (NSString)suggestedEventTitle
{
  void *proactiveSuggestedEvent;

  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (proactiveSuggestedEvent)
  {
    objc_msgSend(proactiveSuggestedEvent, "suggestedEventTitle");
    proactiveSuggestedEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)proactiveSuggestedEvent;
}

- (NSString)suggestedEventIdentifier
{
  void *proactiveSuggestedEvent;

  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (proactiveSuggestedEvent)
  {
    objc_msgSend(proactiveSuggestedEvent, "suggestedEventIdentifier");
    proactiveSuggestedEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)proactiveSuggestedEvent;
}

- (unint64_t)suggestedEventCategory
{
  unint64_t result;

  result = (unint64_t)self->_proactiveSuggestedEvent;
  if (result)
    return objc_msgSend((id)result, "suggestedEventCategory");
  return result;
}

- (PPEvent)suggestedEvent
{
  void *proactiveSuggestedEvent;

  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (proactiveSuggestedEvent)
  {
    objc_msgSend(proactiveSuggestedEvent, "suggestedEvent");
    proactiveSuggestedEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PPEvent *)proactiveSuggestedEvent;
}

- (NSString)tripTitle
{
  void *travelEvent;

  travelEvent = self->_travelEvent;
  if (travelEvent)
  {
    objc_msgSend(travelEvent, "tripTitle");
    travelEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)travelEvent;
}

- (NSArray)tripParts
{
  void *travelEvent;

  travelEvent = self->_travelEvent;
  if (travelEvent)
  {
    objc_msgSend(travelEvent, "tripParts");
    travelEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)travelEvent;
}

- (NSString)mediaTitle
{
  void *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    objc_msgSend(mediaEvent, "mediaTitle");
    mediaEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaAlbum
{
  void *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    objc_msgSend(mediaEvent, "mediaAlbum");
    mediaEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaPlayerBundleId
{
  void *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    objc_msgSend(mediaEvent, "mediaPlayerBundleId");
    mediaEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaProductId
{
  void *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    objc_msgSend(mediaEvent, "mediaProductId");
    mediaEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaGenre
{
  void *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    objc_msgSend(mediaEvent, "mediaGenre");
    mediaEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaType
{
  void *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    objc_msgSend(mediaEvent, "mediaType");
    mediaEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)mediaEvent;
}

- (NSString)mediaArtist
{
  void *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    objc_msgSend(mediaEvent, "mediaArtist");
    mediaEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)mediaEvent;
}

- (NSNumber)mediaRepetitions
{
  void *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    objc_msgSend(mediaEvent, "mediaRepetitions");
    mediaEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)mediaEvent;
}

- (NSNumber)mediaSumTimePlayed
{
  void *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    objc_msgSend(mediaEvent, "mediaSumTimePlayed");
    mediaEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)mediaEvent;
}

- (NSArray)mediaPlaySessions
{
  void *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
  {
    objc_msgSend(mediaEvent, "mediaPlaySessions");
    mediaEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)mediaEvent;
}

- (MOWeather)predominantWeather
{
  void *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    objc_msgSend(routineEvent, "predominantWeather");
    routineEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (MOWeather *)routineEvent;
}

- (NSURL)itemURL
{
  void *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
  {
    objc_msgSend(sharedWithYouEvent, "itemURL");
    sharedWithYouEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)sharedWithYouEvent;
}

- (NSArray)itemSenders
{
  void *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
  {
    objc_msgSend(sharedWithYouEvent, "itemSenders");
    sharedWithYouEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)sharedWithYouEvent;
}

- (NSArray)itemRecipients
{
  void *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
  {
    objc_msgSend(sharedWithYouEvent, "itemRecipients");
    sharedWithYouEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)sharedWithYouEvent;
}

- (unint64_t)itemShareDirection
{
  unint64_t result;

  result = (unint64_t)self->_sharedWithYouEvent;
  if (result)
    return objc_msgSend((id)result, "itemShareDirection");
  return result;
}

- (BOOL)itemIsPinned
{
  MOEventSharedWithYou *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
    LOBYTE(sharedWithYouEvent) = -[MOEventSharedWithYou itemIsPinned](sharedWithYouEvent, "itemIsPinned");
  return (char)sharedWithYouEvent;
}

- (unint64_t)itemSyndicationStatus
{
  MOEventSharedWithYou *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
    return -[MOEventSharedWithYou itemSyndicationStatus](sharedWithYouEvent, "itemSyndicationStatus");
  else
    return 1;
}

- (NSNumber)itemAttributionsCount
{
  void *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
  {
    objc_msgSend(sharedWithYouEvent, "itemAttributionsCount");
    sharedWithYouEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)sharedWithYouEvent;
}

- (NSNumber)interactionContactScore
{
  void *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    objc_msgSend(significantContactEvent, "interactionContactScore");
    significantContactEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)significantContactEvent;
}

- (PPScoredContact)interactionScoredContact
{
  void *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    objc_msgSend(significantContactEvent, "interactionScoredContact");
    significantContactEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PPScoredContact *)significantContactEvent;
}

- (NSString)interactionGroupName
{
  void *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    objc_msgSend(significantContactEvent, "interactionGroupName");
    significantContactEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)significantContactEvent;
}

- (NSArray)interactionContacts
{
  void *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    objc_msgSend(significantContactEvent, "interactionContacts");
    significantContactEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)significantContactEvent;
}

- (NSDictionary)contactClassificationMap
{
  void *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    objc_msgSend(significantContactEvent, "contactClassificationMap");
    significantContactEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDictionary *)significantContactEvent;
}

- (NSSet)interactionMechanisms
{
  void *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    objc_msgSend(significantContactEvent, "interactionMechanisms");
    significantContactEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)significantContactEvent;
}

- (NSArray)interactions
{
  void *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
  {
    objc_msgSend(significantContactEvent, "interactions");
    significantContactEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)significantContactEvent;
}

- (BOOL)isGComplete
{
  MOEventPeopleDiscovery *peopleDiscoveryEvent;

  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent)
    LOBYTE(peopleDiscoveryEvent) = -[MOEventPeopleDiscovery isGComplete](peopleDiscoveryEvent, "isGComplete");
  return (char)peopleDiscoveryEvent;
}

- (int64_t)gaPR
{
  int64_t result;

  result = (int64_t)self->_peopleDiscoveryEvent;
  if (result)
    return objc_msgSend((id)result, "gaPR");
  return result;
}

- (NSNumber)pCount
{
  void *peopleDiscoveryEvent;

  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent)
  {
    objc_msgSend(peopleDiscoveryEvent, "pCount");
    peopleDiscoveryEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)peopleDiscoveryEvent;
}

- (NSNumber)densityScore
{
  void *peopleDiscoveryEvent;

  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent)
  {
    objc_msgSend(peopleDiscoveryEvent, "densityScore");
    peopleDiscoveryEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)peopleDiscoveryEvent;
}

- (NSNumber)densityScanDuration
{
  void *peopleDiscoveryEvent;

  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent)
  {
    objc_msgSend(peopleDiscoveryEvent, "densityScanDuration");
    peopleDiscoveryEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)peopleDiscoveryEvent;
}

- (NSDictionary)scoredTopics
{
  void *portraitEvent;

  portraitEvent = self->_portraitEvent;
  if (portraitEvent)
  {
    objc_msgSend(portraitEvent, "scoredTopics");
    portraitEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDictionary *)portraitEvent;
}

- (unint64_t)motionType
{
  unint64_t result;

  result = (unint64_t)self->_motionActivityEvent;
  if (result)
    return objc_msgSend((id)result, "motionType");
  return result;
}

- (NSDictionary)trends
{
  void *analyticsEvent;

  analyticsEvent = self->_analyticsEvent;
  if (analyticsEvent)
  {
    objc_msgSend(analyticsEvent, "trends");
    analyticsEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDictionary *)analyticsEvent;
}

- (NSDictionary)patterns
{
  void *analyticsEvent;

  analyticsEvent = self->_analyticsEvent;
  if (analyticsEvent)
  {
    objc_msgSend(analyticsEvent, "patterns");
    analyticsEvent = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDictionary *)analyticsEvent;
}

- (unint64_t)lifeEventCategory
{
  unint64_t result;

  result = (unint64_t)self->_lifeEventsEvent;
  if (result)
    return objc_msgSend((id)result, "lifeEventCategory");
  return result;
}

- (double)confidenceScore
{
  MOEventLifeEvents *lifeEventsEvent;
  double result;

  lifeEventsEvent = self->_lifeEventsEvent;
  if (!lifeEventsEvent)
    return 0.0;
  -[MOEventLifeEvents confidenceScore](lifeEventsEvent, "confidenceScore");
  return result;
}

- (void)setPhotoMomentSource:(unint64_t)a3
{
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;

  photoEvent = self->_photoEvent;
  if (!photoEvent)
  {
    v6 = objc_alloc_init(MOEventPhoto);
    v7 = self->_photoEvent;
    self->_photoEvent = v6;

    photoEvent = self->_photoEvent;
  }
  -[MOEventPhoto setPhotoMomentSource:](photoEvent, "setPhotoMomentSource:", a3);
}

- (void)setExtendedAttributes:(id)a3
{
  id v4;
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    -[MOEventPhoto setExtendedAttributes:](photoEvent, "setExtendedAttributes:", v8);
    v4 = v8;
  }

}

- (void)setPhotoAsset:(id)a3
{
  id v4;
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    -[MOEventPhoto setPhotoAsset:](photoEvent, "setPhotoAsset:", v8);
    v4 = v8;
  }

}

- (void)setPhotoMemoryTitle:(id)a3
{
  id v4;
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    -[MOEventPhoto setPhotoMemoryTitle:](photoEvent, "setPhotoMemoryTitle:", v8);
    v4 = v8;
  }

}

- (void)setPhotoMemoryAssets:(id)a3
{
  id v4;
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    -[MOEventPhoto setPhotoMemoryAssets:](photoEvent, "setPhotoMemoryAssets:", v8);
    v4 = v8;
  }

}

- (void)setPhotoMemoryCategory:(unint64_t)a3
{
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;

  photoEvent = self->_photoEvent;
  if (!photoEvent)
  {
    v6 = objc_alloc_init(MOEventPhoto);
    v7 = self->_photoEvent;
    self->_photoEvent = v6;

    photoEvent = self->_photoEvent;
  }
  -[MOEventPhoto setPhotoMemoryCategory:](photoEvent, "setPhotoMemoryCategory:", a3);
}

- (void)setTimeAtHomeSubType:(unint64_t)a3
{
  MOEventAnalytics *analyticsEvent;
  MOEventAnalytics *v6;
  MOEventAnalytics *v7;

  analyticsEvent = self->_analyticsEvent;
  if (!analyticsEvent)
  {
    v6 = objc_alloc_init(MOEventAnalytics);
    v7 = self->_analyticsEvent;
    self->_analyticsEvent = v6;

    analyticsEvent = self->_analyticsEvent;
  }
  -[MOEventAnalytics setTimeAtHomeSubType:](analyticsEvent, "setTimeAtHomeSubType:", a3);
}

- (void)setIsHighConfidence:(BOOL)a3
{
  _BOOL8 v3;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  v3 = a3;
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setIsHighConfidence:](routineEvent, "setIsHighConfidence:", v3);
}

- (void)setIsInvalid:(BOOL)a3
{
  _BOOL8 v3;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  v3 = a3;
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setIsInvalid:](routineEvent, "setIsInvalid:", v3);
}

- (void)setPlaceType:(unint64_t)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setPlaceType:](routineEvent, "setPlaceType:", a3);
}

- (void)setPlaceUserType:(unint64_t)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setPlaceUserType:](routineEvent, "setPlaceUserType:", a3);
}

- (void)setPlaceName:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setPlaceName:](routineEvent, "setPlaceName:", v8);
    v4 = v8;
  }

}

- (void)setPlaceNameConfidence:(double)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setPlaceNameConfidence:](routineEvent, "setPlaceNameConfidence:", a3);
}

- (void)setPlaceDiscovery:(unint64_t)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setPlaceDiscovery:](routineEvent, "setPlaceDiscovery:", a3);
}

- (void)setLocation:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setLocation:](routineEvent, "setLocation:", v8);
    v4 = v8;
  }

}

- (void)setAddress:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setAddress:](routineEvent, "setAddress:", v8);
    v4 = v8;
  }

}

- (void)setGeoAddressObject:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setGeoAddressObject:](routineEvent, "setGeoAddressObject:", v8);
    v4 = v8;
  }

}

- (void)setMode:(unint64_t)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setMode:](routineEvent, "setMode:", a3);
}

- (void)setPlaceMapItem:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setPlaceMapItem:](routineEvent, "setPlaceMapItem:", v8);
    v4 = v8;
  }

}

- (void)setPoiCategory:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setPoiCategory:](routineEvent, "setPoiCategory:", v8);
    v4 = v8;
  }

}

- (void)setPlaceSource:(unint64_t)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setPlaceSource:](routineEvent, "setPlaceSource:", a3);
}

- (void)setFamiliarityIndexLOI:(double)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setFamiliarityIndexLOI:](routineEvent, "setFamiliarityIndexLOI:", a3);
}

- (void)setWorkoutType:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutType:](workoutEvent, "setWorkoutType:", v8);
    v4 = v8;
  }

}

- (void)setWorkoutTotalDistance:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutTotalDistance:](workoutEvent, "setWorkoutTotalDistance:", v8);
    v4 = v8;
  }

}

- (void)setWorkoutTotalEnergyBurned:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutTotalEnergyBurned:](workoutEvent, "setWorkoutTotalEnergyBurned:", v8);
    v4 = v8;
  }

}

- (void)setWorkoutDuration:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutDuration:](workoutEvent, "setWorkoutDuration:", v8);
    v4 = v8;
  }

}

- (void)setWorkoutLocationStart:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutLocationStart:](workoutEvent, "setWorkoutLocationStart:", v8);
    v4 = v8;
  }

}

- (void)setWorkoutLocationRoute:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutLocationRoute:](workoutEvent, "setWorkoutLocationRoute:", v8);
    v4 = v8;
  }

}

- (void)setMotionStepCount:(id)a3
{
  id v4;
  MOEventMotionActivity *motionActivityEvent;
  MOEventMotionActivity *v6;
  MOEventMotionActivity *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    motionActivityEvent = self->_motionActivityEvent;
    v8 = v4;
    if (!motionActivityEvent)
    {
      v6 = objc_alloc_init(MOEventMotionActivity);
      v7 = self->_motionActivityEvent;
      self->_motionActivityEvent = v6;

      motionActivityEvent = self->_motionActivityEvent;
    }
    -[MOEventMotionActivity setMotionStepCount:](motionActivityEvent, "setMotionStepCount:", v8);
    v4 = v8;
  }

}

- (void)setIsFitnessPlusSession:(BOOL)a3
{
  _BOOL8 v3;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;

  v3 = a3;
  workoutEvent = self->_workoutEvent;
  if (!workoutEvent)
  {
    v6 = objc_alloc_init(MOEventWorkout);
    v7 = self->_workoutEvent;
    self->_workoutEvent = v6;

    workoutEvent = self->_workoutEvent;
  }
  -[MOEventWorkout setIsFitnessPlusSession:](workoutEvent, "setIsFitnessPlusSession:", v3);
}

- (void)setSuggestedEventTitle:(id)a3
{
  id v4;
  MOEventProactiveSuggested *proactiveSuggestedEvent;
  MOEventProactiveSuggested *v6;
  MOEventProactiveSuggested *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    v8 = v4;
    if (!proactiveSuggestedEvent)
    {
      v6 = objc_alloc_init(MOEventProactiveSuggested);
      v7 = self->_proactiveSuggestedEvent;
      self->_proactiveSuggestedEvent = v6;

      proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    }
    -[MOEventProactiveSuggested setSuggestedEventTitle:](proactiveSuggestedEvent, "setSuggestedEventTitle:", v8);
    v4 = v8;
  }

}

- (void)setSuggestedEventIdentifier:(id)a3
{
  id v4;
  MOEventProactiveSuggested *proactiveSuggestedEvent;
  MOEventProactiveSuggested *v6;
  MOEventProactiveSuggested *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    v8 = v4;
    if (!proactiveSuggestedEvent)
    {
      v6 = objc_alloc_init(MOEventProactiveSuggested);
      v7 = self->_proactiveSuggestedEvent;
      self->_proactiveSuggestedEvent = v6;

      proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    }
    -[MOEventProactiveSuggested setSuggestedEventIdentifier:](proactiveSuggestedEvent, "setSuggestedEventIdentifier:", v8);
    v4 = v8;
  }

}

- (void)setSuggestedEventCategory:(unint64_t)a3
{
  MOEventProactiveSuggested *proactiveSuggestedEvent;
  MOEventProactiveSuggested *v6;
  MOEventProactiveSuggested *v7;

  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (!proactiveSuggestedEvent)
  {
    v6 = objc_alloc_init(MOEventProactiveSuggested);
    v7 = self->_proactiveSuggestedEvent;
    self->_proactiveSuggestedEvent = v6;

    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  }
  -[MOEventProactiveSuggested setSuggestedEventCategory:](proactiveSuggestedEvent, "setSuggestedEventCategory:", a3);
}

- (void)setSuggestedEvent:(id)a3
{
  id v4;
  MOEventProactiveSuggested *proactiveSuggestedEvent;
  MOEventProactiveSuggested *v6;
  MOEventProactiveSuggested *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    v8 = v4;
    if (!proactiveSuggestedEvent)
    {
      v6 = objc_alloc_init(MOEventProactiveSuggested);
      v7 = self->_proactiveSuggestedEvent;
      self->_proactiveSuggestedEvent = v6;

      proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    }
    -[MOEventProactiveSuggested setSuggestedEvent:](proactiveSuggestedEvent, "setSuggestedEvent:", v8);
    v4 = v8;
  }

}

- (void)setTripTitle:(id)a3
{
  id v4;
  MOEventTravel *travelEvent;
  MOEventTravel *v6;
  MOEventTravel *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    travelEvent = self->_travelEvent;
    v8 = v4;
    if (!travelEvent)
    {
      v6 = objc_alloc_init(MOEventTravel);
      v7 = self->_travelEvent;
      self->_travelEvent = v6;

      travelEvent = self->_travelEvent;
    }
    -[MOEventTravel setTripTitle:](travelEvent, "setTripTitle:", v8);
    v4 = v8;
  }

}

- (void)setTripParts:(id)a3
{
  id v4;
  MOEventTravel *travelEvent;
  MOEventTravel *v6;
  MOEventTravel *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    travelEvent = self->_travelEvent;
    v8 = v4;
    if (!travelEvent)
    {
      v6 = objc_alloc_init(MOEventTravel);
      v7 = self->_travelEvent;
      self->_travelEvent = v6;

      travelEvent = self->_travelEvent;
    }
    -[MOEventTravel setTripParts:](travelEvent, "setTripParts:", v8);
    v4 = v8;
  }

}

- (void)setMediaTitle:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaTitle:](mediaEvent, "setMediaTitle:", v8);
    v4 = v8;
  }

}

- (void)setMediaAlbum:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaAlbum:](mediaEvent, "setMediaAlbum:", v8);
    v4 = v8;
  }

}

- (void)setMediaPlayerBundleId:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaPlayerBundleId:](mediaEvent, "setMediaPlayerBundleId:", v8);
    v4 = v8;
  }

}

- (void)setMediaProductId:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaProductId:](mediaEvent, "setMediaProductId:", v8);
    v4 = v8;
  }

}

- (void)setMediaGenre:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaGenre:](mediaEvent, "setMediaGenre:", v8);
    v4 = v8;
  }

}

- (void)setMediaType:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaType:](mediaEvent, "setMediaType:", v8);
    v4 = v8;
  }

}

- (void)setMediaArtist:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaArtist:](mediaEvent, "setMediaArtist:", v8);
    v4 = v8;
  }

}

- (void)setMediaRepetitions:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaRepetitions:](mediaEvent, "setMediaRepetitions:", v8);
    v4 = v8;
  }

}

- (void)setMediaSumTimePlayed:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaSumTimePlayed:](mediaEvent, "setMediaSumTimePlayed:", v8);
    v4 = v8;
  }

}

- (void)setMediaPlaySessions:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaPlaySessions:](mediaEvent, "setMediaPlaySessions:", v8);
    v4 = v8;
  }

}

- (void)setPredominantWeather:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setPredominantWeather:](routineEvent, "setPredominantWeather:", v8);
    v4 = v8;
  }

}

- (void)setItemURL:(id)a3
{
  id v4;
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    -[MOEventSharedWithYou setItemURL:](sharedWithYouEvent, "setItemURL:", v8);
    v4 = v8;
  }

}

- (void)setItemSenders:(id)a3
{
  id v4;
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    -[MOEventSharedWithYou setItemSenders:](sharedWithYouEvent, "setItemSenders:", v8);
    v4 = v8;
  }

}

- (void)setItemRecipients:(id)a3
{
  id v4;
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    -[MOEventSharedWithYou setItemRecipients:](sharedWithYouEvent, "setItemRecipients:", v8);
    v4 = v8;
  }

}

- (void)setItemShareDirection:(unint64_t)a3
{
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (!sharedWithYouEvent)
  {
    v6 = objc_alloc_init(MOEventSharedWithYou);
    v7 = self->_sharedWithYouEvent;
    self->_sharedWithYouEvent = v6;

    sharedWithYouEvent = self->_sharedWithYouEvent;
  }
  -[MOEventSharedWithYou setItemShareDirection:](sharedWithYouEvent, "setItemShareDirection:", a3);
}

- (void)setItemIsPinned:(BOOL)a3
{
  _BOOL8 v3;
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;

  v3 = a3;
  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (!sharedWithYouEvent)
  {
    v6 = objc_alloc_init(MOEventSharedWithYou);
    v7 = self->_sharedWithYouEvent;
    self->_sharedWithYouEvent = v6;

    sharedWithYouEvent = self->_sharedWithYouEvent;
  }
  -[MOEventSharedWithYou setItemIsPinned:](sharedWithYouEvent, "setItemIsPinned:", v3);
}

- (void)setItemSyndicationStatus:(unint64_t)a3
{
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (!sharedWithYouEvent)
  {
    v6 = objc_alloc_init(MOEventSharedWithYou);
    v7 = self->_sharedWithYouEvent;
    self->_sharedWithYouEvent = v6;

    sharedWithYouEvent = self->_sharedWithYouEvent;
  }
  -[MOEventSharedWithYou setItemSyndicationStatus:](sharedWithYouEvent, "setItemSyndicationStatus:", a3);
}

- (void)setItemAttributionsCount:(id)a3
{
  id v4;
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    -[MOEventSharedWithYou setItemAttributionsCount:](sharedWithYouEvent, "setItemAttributionsCount:", v8);
    v4 = v8;
  }

}

- (void)setInteractionContactScore:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractionContactScore:](significantContactEvent, "setInteractionContactScore:", v8);
    v4 = v8;
  }

}

- (void)setInteractionScoredContact:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractionScoredContact:](significantContactEvent, "setInteractionScoredContact:", v8);
    v4 = v8;
  }

}

- (void)setInteractionGroupName:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractionGroupName:](significantContactEvent, "setInteractionGroupName:", v8);
    v4 = v8;
  }

}

- (void)setInteractionContacts:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractionContacts:](significantContactEvent, "setInteractionContacts:", v8);
    v4 = v8;
  }

}

- (void)setContactClassificationMap:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setContactClassificationMap:](significantContactEvent, "setContactClassificationMap:", v8);
    v4 = v8;
  }

}

- (void)setInteractionMechanisms:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractionMechanisms:](significantContactEvent, "setInteractionMechanisms:", v8);
    v4 = v8;
  }

}

- (void)setInteractions:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractions:](significantContactEvent, "setInteractions:", v8);
    v4 = v8;
  }

}

- (void)setIsGComplete:(BOOL)a3
{
  _BOOL8 v3;
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  MOEventPeopleDiscovery *v6;
  MOEventPeopleDiscovery *v7;

  v3 = a3;
  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (!peopleDiscoveryEvent)
  {
    v6 = objc_alloc_init(MOEventPeopleDiscovery);
    v7 = self->_peopleDiscoveryEvent;
    self->_peopleDiscoveryEvent = v6;

    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  }
  -[MOEventPeopleDiscovery setIsGComplete:](peopleDiscoveryEvent, "setIsGComplete:", v3);
}

- (void)setGaPR:(int64_t)a3
{
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  MOEventPeopleDiscovery *v6;
  MOEventPeopleDiscovery *v7;

  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (!peopleDiscoveryEvent)
  {
    v6 = objc_alloc_init(MOEventPeopleDiscovery);
    v7 = self->_peopleDiscoveryEvent;
    self->_peopleDiscoveryEvent = v6;

    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  }
  -[MOEventPeopleDiscovery setGaPR:](peopleDiscoveryEvent, "setGaPR:", a3);
}

- (void)setPCount:(id)a3
{
  id v4;
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  MOEventPeopleDiscovery *v6;
  MOEventPeopleDiscovery *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    v8 = v4;
    if (!peopleDiscoveryEvent)
    {
      v6 = objc_alloc_init(MOEventPeopleDiscovery);
      v7 = self->_peopleDiscoveryEvent;
      self->_peopleDiscoveryEvent = v6;

      peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    }
    -[MOEventPeopleDiscovery setPCount:](peopleDiscoveryEvent, "setPCount:", v8);
    v4 = v8;
  }

}

- (void)setDensityScore:(id)a3
{
  id v4;
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  MOEventPeopleDiscovery *v6;
  MOEventPeopleDiscovery *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    v8 = v4;
    if (!peopleDiscoveryEvent)
    {
      v6 = objc_alloc_init(MOEventPeopleDiscovery);
      v7 = self->_peopleDiscoveryEvent;
      self->_peopleDiscoveryEvent = v6;

      peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    }
    -[MOEventPeopleDiscovery setDensityScore:](peopleDiscoveryEvent, "setDensityScore:", v8);
    v4 = v8;
  }

}

- (void)setDensityScanDuration:(id)a3
{
  id v4;
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  MOEventPeopleDiscovery *v6;
  MOEventPeopleDiscovery *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    v8 = v4;
    if (!peopleDiscoveryEvent)
    {
      v6 = objc_alloc_init(MOEventPeopleDiscovery);
      v7 = self->_peopleDiscoveryEvent;
      self->_peopleDiscoveryEvent = v6;

      peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    }
    -[MOEventPeopleDiscovery setDensityScanDuration:](peopleDiscoveryEvent, "setDensityScanDuration:", v8);
    v4 = v8;
  }

}

- (void)setScoredTopics:(id)a3
{
  id v4;
  MOEventPortrait *portraitEvent;
  MOEventPortrait *v6;
  MOEventPortrait *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    portraitEvent = self->_portraitEvent;
    v8 = v4;
    if (!portraitEvent)
    {
      v6 = objc_alloc_init(MOEventPortrait);
      v7 = self->_portraitEvent;
      self->_portraitEvent = v6;

      portraitEvent = self->_portraitEvent;
    }
    -[MOEventPortrait setScoredTopics:](portraitEvent, "setScoredTopics:", v8);
    v4 = v8;
  }

}

- (void)setMotionType:(unint64_t)a3
{
  MOEventMotionActivity *motionActivityEvent;
  MOEventMotionActivity *v6;
  MOEventMotionActivity *v7;

  motionActivityEvent = self->_motionActivityEvent;
  if (!motionActivityEvent)
  {
    v6 = objc_alloc_init(MOEventMotionActivity);
    v7 = self->_motionActivityEvent;
    self->_motionActivityEvent = v6;

    motionActivityEvent = self->_motionActivityEvent;
  }
  -[MOEventMotionActivity setMotionType:](motionActivityEvent, "setMotionType:", a3);
}

- (void)setTrends:(id)a3
{
  id v4;
  MOEventAnalytics *analyticsEvent;
  MOEventAnalytics *v6;
  MOEventAnalytics *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    analyticsEvent = self->_analyticsEvent;
    v8 = v4;
    if (!analyticsEvent)
    {
      v6 = objc_alloc_init(MOEventAnalytics);
      v7 = self->_analyticsEvent;
      self->_analyticsEvent = v6;

      analyticsEvent = self->_analyticsEvent;
    }
    -[MOEventAnalytics setTrends:](analyticsEvent, "setTrends:", v8);
    v4 = v8;
  }

}

- (void)setPatterns:(id)a3
{
  id v4;
  MOEventAnalytics *analyticsEvent;
  MOEventAnalytics *v6;
  MOEventAnalytics *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    analyticsEvent = self->_analyticsEvent;
    v8 = v4;
    if (!analyticsEvent)
    {
      v6 = objc_alloc_init(MOEventAnalytics);
      v7 = self->_analyticsEvent;
      self->_analyticsEvent = v6;

      analyticsEvent = self->_analyticsEvent;
    }
    -[MOEventAnalytics setPatterns:](analyticsEvent, "setPatterns:", v8);
    v4 = v8;
  }

}

- (void)setLifeEventCategory:(unint64_t)a3
{
  MOEventLifeEvents *lifeEventsEvent;
  MOEventLifeEvents *v6;
  MOEventLifeEvents *v7;

  lifeEventsEvent = self->_lifeEventsEvent;
  if (!lifeEventsEvent)
  {
    v6 = objc_alloc_init(MOEventLifeEvents);
    v7 = self->_lifeEventsEvent;
    self->_lifeEventsEvent = v6;

    lifeEventsEvent = self->_lifeEventsEvent;
  }
  -[MOEventLifeEvents setLifeEventCategory:](lifeEventsEvent, "setLifeEventCategory:", a3);
}

- (void)setConfidenceScore:(double)a3
{
  MOEventLifeEvents *lifeEventsEvent;
  MOEventLifeEvents *v6;
  MOEventLifeEvents *v7;

  lifeEventsEvent = self->_lifeEventsEvent;
  if (!lifeEventsEvent)
  {
    v6 = objc_alloc_init(MOEventLifeEvents);
    v7 = self->_lifeEventsEvent;
    self->_lifeEventsEvent = v6;

    lifeEventsEvent = self->_lifeEventsEvent;
  }
  -[MOEventLifeEvents setConfidenceScore:](lifeEventsEvent, "setConfidenceScore:", a3);
}

- (id)_descriptionOf:(unint64_t)a3
{
  return +[MOEventProactiveSuggested describeCategory:](MOEventProactiveSuggested, "describeCategory:", a3);
}

- (id)displayNameOfScoredTopics:(id)a3
{
  return +[MOEventPortrait displayNameOfScoredTopics:](MOEventPortrait, "displayNameOfScoredTopics:", a3);
}

+ (id)FormatDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3578];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v5, "setDateStyle:", 4);
    objc_msgSend(v5, "setTimeStyle:", 3);
    objc_msgSend(v5, "stringFromDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)descriptionOfMode:(unint64_t)a3
{
  return +[MOEventRoutine descriptionOfMode:](MOEventRoutine, "descriptionOfMode:", a3);
}

- (id)descriptionOfPhotoMomentSource:(unint64_t)a3
{
  return +[MOEventPhoto descriptionOfPhotoMomentSource:](MOEventPhoto, "descriptionOfPhotoMomentSource:", a3);
}

- (id)descriptionOfMotionType:(unint64_t)a3
{
  return +[MOEventMotionActivity descriptionOfMotionType:](MOEventMotionActivity, "descriptionOfMotionType:", a3);
}

- (id)descriptionOfLifeEventCategory:(unint64_t)a3
{
  return +[MOEventLifeEvents descriptionOfLifeEventCategory:](MOEventLifeEvents, "descriptionOfLifeEventCategory:", a3);
}

- (id)description
{
  __CFString *analyticsEvent;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;

  if (-[MOEvent provider](self, "provider") == 5)
  {
    analyticsEvent = (__CFString *)self->_analyticsEvent;
    if (analyticsEvent)
    {
LABEL_3:
      -[__CFString description](analyticsEvent, "description");
      analyticsEvent = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v13 = -[MOEvent category](self, "category") - 1;
    analyticsEvent = 0;
    switch(v13)
    {
      case 0uLL:
        analyticsEvent = (__CFString *)self->_routineEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 1uLL:
        analyticsEvent = (__CFString *)self->_workoutEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 2uLL:
      case 3uLL:
      case 5uLL:
        analyticsEvent = (__CFString *)self->_mediaEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 4uLL:
      case 0x10uLL:
        analyticsEvent = (__CFString *)self->_photoEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 6uLL:
        analyticsEvent = (__CFString *)self->_portraitEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 7uLL:
        analyticsEvent = (__CFString *)self->_travelEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 8uLL:
        analyticsEvent = (__CFString *)self->_sharedWithYouEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 9uLL:
        analyticsEvent = (__CFString *)self->_significantContactEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 0xAuLL:
      case 0xBuLL:
        analyticsEvent = (__CFString *)self->_proactiveSuggestedEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 0xCuLL:
        break;
      case 0xEuLL:
      case 0x14uLL:
      case 0x16uLL:
        analyticsEvent = (__CFString *)self->_peopleDiscoveryEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 0xFuLL:
        analyticsEvent = (__CFString *)self->_motionActivityEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 0x15uLL:
        analyticsEvent = (__CFString *)self->_lifeEventsEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      default:
        analyticsEvent = CFSTR("no other details");
        break;
    }
  }
  v23 = analyticsEvent;
  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MOEvent eventIdentifier](self, "eventIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent identifierFromProvider](self, "identifierFromProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent startDate](self, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEvent FormatDate:](MOEvent, "FormatDate:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent endDate](self, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEvent FormatDate:](MOEvent, "FormatDate:", v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent creationDate](self, "creationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEvent FormatDate:](MOEvent, "FormatDate:", v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent sourceCreationDate](self, "sourceCreationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEvent FormatDate:](MOEvent, "FormatDate:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEvent FormatDate:](MOEvent, "FormatDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent timeZone](self, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent describeProvider](self, "describeProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent describeCategory](self, "describeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("<MOEvent eventIdentifier, %@, identifierFromProvider, %@, startDate, %@, endDate, %@, creationDate, %@, sourceCreationDate, %@, expirationDate, %@, timeZone, %@, provider, %@, category, %@, rehydrationFailCount, %lu, source app, %@, %@>"), v18, v14, v15, v4, v5, v6, v8, v9, v10, v11, -[MOEvent rehydrationFailCount](self, "rehydrationFailCount"), self->_appBundle, v23);

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  MOEvent *v13;
  MOEvent *v14;
  MOEvent *v15;
  uint64_t v16;
  NSString *identifierFromProvider;
  uint64_t v18;
  NSDate *expirationDate;
  uint64_t v20;
  NSDate *sourceCreationDate;
  uint64_t v22;
  NSString *appBundle;
  uint64_t v24;
  MOEventPhoto *photoEvent;
  uint64_t v26;
  MOEventRoutine *routineEvent;
  uint64_t v28;
  MOEventWorkout *workoutEvent;
  uint64_t v30;
  MOEventProactiveSuggested *proactiveSuggestedEvent;
  uint64_t v32;
  MOEventTravel *travelEvent;
  uint64_t v34;
  MOEventMedia *mediaEvent;
  uint64_t v36;
  MOEventSharedWithYou *sharedWithYouEvent;
  uint64_t v38;
  MOEventSignificantContact *significantContactEvent;
  uint64_t v40;
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  uint64_t v42;
  MOEventPortrait *portraitEvent;
  uint64_t v44;
  MOEventMotionActivity *motionActivityEvent;
  uint64_t v46;
  MOEventAnalytics *analyticsEvent;
  uint64_t v48;
  MOEventLifeEvents *lifeEventsEvent;
  uint64_t v50;
  MOEventStateOfMind *stateOfMindEvent;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10 || v6 == 0 || v7 == 0)
  {
    v13 = 0;
  }
  else
  {
    v14 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](self, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v5, v6, v7, v8, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("provider")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category")));
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifierFromProvider"));
      v16 = objc_claimAutoreleasedReturnValue();
      identifierFromProvider = v15->_identifierFromProvider;
      v15->_identifierFromProvider = (NSString *)v16;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
      v18 = objc_claimAutoreleasedReturnValue();
      expirationDate = v15->_expirationDate;
      v15->_expirationDate = (NSDate *)v18;

      v15->_fromFirstParty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fromFirstParty"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceCreationDate"));
      v20 = objc_claimAutoreleasedReturnValue();
      sourceCreationDate = v15->_sourceCreationDate;
      v15->_sourceCreationDate = (NSDate *)v20;

      v15->_rehydrationFailCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rehydrationFailCount"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundle"));
      v22 = objc_claimAutoreleasedReturnValue();
      appBundle = v15->_appBundle;
      v15->_appBundle = (NSString *)v22;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoEvent"));
      v24 = objc_claimAutoreleasedReturnValue();
      photoEvent = v15->_photoEvent;
      v15->_photoEvent = (MOEventPhoto *)v24;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routineEvent"));
      v26 = objc_claimAutoreleasedReturnValue();
      routineEvent = v15->_routineEvent;
      v15->_routineEvent = (MOEventRoutine *)v26;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workoutEvent"));
      v28 = objc_claimAutoreleasedReturnValue();
      workoutEvent = v15->_workoutEvent;
      v15->_workoutEvent = (MOEventWorkout *)v28;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proactiveSuggestedEvent"));
      v30 = objc_claimAutoreleasedReturnValue();
      proactiveSuggestedEvent = v15->_proactiveSuggestedEvent;
      v15->_proactiveSuggestedEvent = (MOEventProactiveSuggested *)v30;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("travelEvent"));
      v32 = objc_claimAutoreleasedReturnValue();
      travelEvent = v15->_travelEvent;
      v15->_travelEvent = (MOEventTravel *)v32;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaEvent"));
      v34 = objc_claimAutoreleasedReturnValue();
      mediaEvent = v15->_mediaEvent;
      v15->_mediaEvent = (MOEventMedia *)v34;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedWithYouEvent"));
      v36 = objc_claimAutoreleasedReturnValue();
      sharedWithYouEvent = v15->_sharedWithYouEvent;
      v15->_sharedWithYouEvent = (MOEventSharedWithYou *)v36;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("significantContactEvent"));
      v38 = objc_claimAutoreleasedReturnValue();
      significantContactEvent = v15->_significantContactEvent;
      v15->_significantContactEvent = (MOEventSignificantContact *)v38;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peopleDiscoveryEvent"));
      v40 = objc_claimAutoreleasedReturnValue();
      peopleDiscoveryEvent = v15->_peopleDiscoveryEvent;
      v15->_peopleDiscoveryEvent = (MOEventPeopleDiscovery *)v40;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("portraitEvent"));
      v42 = objc_claimAutoreleasedReturnValue();
      portraitEvent = v15->_portraitEvent;
      v15->_portraitEvent = (MOEventPortrait *)v42;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("motionActivityEvent"));
      v44 = objc_claimAutoreleasedReturnValue();
      motionActivityEvent = v15->_motionActivityEvent;
      v15->_motionActivityEvent = (MOEventMotionActivity *)v44;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("analyticsEvent"));
      v46 = objc_claimAutoreleasedReturnValue();
      analyticsEvent = v15->_analyticsEvent;
      v15->_analyticsEvent = (MOEventAnalytics *)v46;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lifeEventsEvent"));
      v48 = objc_claimAutoreleasedReturnValue();
      lifeEventsEvent = v15->_lifeEventsEvent;
      v15->_lifeEventsEvent = (MOEventLifeEvents *)v48;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateOfMindEvent"));
      v50 = objc_claimAutoreleasedReturnValue();
      stateOfMindEvent = v15->_stateOfMindEvent;
      v15->_stateOfMindEvent = (MOEventStateOfMind *)v50;

    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *eventIdentifier;
  id v5;

  eventIdentifier = self->_eventIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eventIdentifier, CFSTR("eventIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_provider, CFSTR("provider"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifierFromProvider, CFSTR("identifierFromProvider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fromFirstParty, CFSTR("fromFirstParty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceCreationDate, CFSTR("sourceCreationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rehydrationFailCount, CFSTR("rehydrationFailCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appBundle, CFSTR("appBundle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoEvent, CFSTR("photoEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routineEvent, CFSTR("routineEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutEvent, CFSTR("workoutEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proactiveSuggestedEvent, CFSTR("proactiveSuggestedEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_travelEvent, CFSTR("travelEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaEvent, CFSTR("mediaEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedWithYouEvent, CFSTR("sharedWithYouEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_significantContactEvent, CFSTR("significantContactEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peopleDiscoveryEvent, CFSTR("peopleDiscoveryEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_portraitEvent, CFSTR("portraitEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_motionActivityEvent, CFSTR("motionActivityEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_analyticsEvent, CFSTR("analyticsEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lifeEventsEvent, CFSTR("lifeEventsEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stateOfMindEvent, CFSTR("stateOfMindEvent"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MOEvent eventIdentifier](self, "eventIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copy
{
  MOEvent *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;

  v3 = [MOEvent alloc];
  -[MOEvent eventIdentifier](self, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v3, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v4, v5, v6, v7, -[MOEvent provider](self, "provider"), -[MOEvent category](self, "category"));

  objc_storeStrong((id *)(v8 + 64), self->_expirationDate);
  objc_storeStrong((id *)(v8 + 56), self->_sourceCreationDate);
  objc_storeStrong((id *)(v8 + 88), self->_identifierFromProvider);
  *(_QWORD *)(v8 + 96) = self->_rehydrationFailCount;
  objc_storeStrong((id *)(v8 + 104), self->_appBundle);
  v9 = -[MOEventPhoto copy](self->_photoEvent, "copy");
  v10 = *(void **)(v8 + 112);
  *(_QWORD *)(v8 + 112) = v9;

  v11 = -[MOEventRoutine copy](self->_routineEvent, "copy");
  v12 = *(void **)(v8 + 120);
  *(_QWORD *)(v8 + 120) = v11;

  v13 = -[MOEventWorkout copy](self->_workoutEvent, "copy");
  v14 = *(void **)(v8 + 128);
  *(_QWORD *)(v8 + 128) = v13;

  v15 = -[MOEventProactiveSuggested copy](self->_proactiveSuggestedEvent, "copy");
  v16 = *(void **)(v8 + 136);
  *(_QWORD *)(v8 + 136) = v15;

  v17 = -[MOEventTravel copy](self->_travelEvent, "copy");
  v18 = *(void **)(v8 + 144);
  *(_QWORD *)(v8 + 144) = v17;

  v19 = -[MOEventMedia copy](self->_mediaEvent, "copy");
  v20 = *(void **)(v8 + 152);
  *(_QWORD *)(v8 + 152) = v19;

  v21 = -[MOEventSharedWithYou copy](self->_sharedWithYouEvent, "copy");
  v22 = *(void **)(v8 + 160);
  *(_QWORD *)(v8 + 160) = v21;

  v23 = -[MOEventSignificantContact copy](self->_significantContactEvent, "copy");
  v24 = *(void **)(v8 + 168);
  *(_QWORD *)(v8 + 168) = v23;

  v25 = -[MOEventPeopleDiscovery copy](self->_peopleDiscoveryEvent, "copy");
  v26 = *(void **)(v8 + 176);
  *(_QWORD *)(v8 + 176) = v25;

  v27 = -[MOEventPortrait copy](self->_portraitEvent, "copy");
  v28 = *(void **)(v8 + 184);
  *(_QWORD *)(v8 + 184) = v27;

  v29 = -[MOEventMotionActivity copy](self->_motionActivityEvent, "copy");
  v30 = *(void **)(v8 + 192);
  *(_QWORD *)(v8 + 192) = v29;

  v31 = -[MOEventAnalytics copy](self->_analyticsEvent, "copy");
  v32 = *(void **)(v8 + 200);
  *(_QWORD *)(v8 + 200) = v31;

  v33 = -[MOEventLifeEvents copy](self->_lifeEventsEvent, "copy");
  v34 = *(void **)(v8 + 208);
  *(_QWORD *)(v8 + 208) = v33;

  v35 = -[MOEventStateOfMind copy](self->_stateOfMindEvent, "copy");
  v36 = *(void **)(v8 + 216);
  *(_QWORD *)(v8 + 216) = v35;

  return (id)v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOEvent *v5;
  MOEvent *v6;
  MOEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (MOEvent *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[MOEvent eventIdentifier](self, "eventIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (-[MOEvent eventIdentifier](v7, "eventIdentifier"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[MOEvent eventIdentifier](self, "eventIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOEvent eventIdentifier](v7, "eventIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSDate)sourceCreationDate
{
  NSDate *sourceCreationDate;

  sourceCreationDate = self->_sourceCreationDate;
  if (!sourceCreationDate)
    sourceCreationDate = self->_endDate;
  return sourceCreationDate;
}

- (BOOL)isHomeWorkVisit
{
  unint64_t v3;

  if (self->_category != 1)
    goto LABEL_5;
  v3 = -[MOEvent placeUserType](self, "placeUserType");
  if (v3 != 1)
  {
    if (-[MOEvent placeUserType](self, "placeUserType") == 2)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (double)duration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[MOEvent endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEvent startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (id)formatAddressWithFormatOption:(id)a3
{
  MOEventRoutine *routineEvent;
  void *v5;
  NSObject *v7;
  void *v8;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    -[MOEventRoutine formatAddressWithFormatOption:](routineEvent, "formatAddressWithFormatOption:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOEvent formatAddressWithFormatOption:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEvent.m"), 1736, CFSTR("request formatAddressWithFormatOption on non routine event instance (in %s:%d)"), "-[MOEvent formatAddressWithFormatOption:]", 1736);

    v5 = 0;
  }
  return v5;
}

- (id)formatLocalityWithFormatOption:(id)a3
{
  MOEventRoutine *routineEvent;
  void *v5;
  NSObject *v7;
  void *v8;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    -[MOEventRoutine formatLocalityWithFormatOption:](routineEvent, "formatLocalityWithFormatOption:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOEvent formatLocalityWithFormatOption:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEvent.m"), 1745, CFSTR("request formatLocalityWithFormatOption on non routine event instance (in %s:%d)"), "-[MOEvent formatLocalityWithFormatOption:]", 1745);

    v5 = 0;
  }
  return v5;
}

- (id)formatAdministrativeAreaWithFormatOption:(id)a3
{
  MOEventRoutine *routineEvent;
  void *v5;
  NSObject *v7;
  void *v8;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    -[MOEventRoutine formatAdministrativeAreaWithFormatOption:](routineEvent, "formatAdministrativeAreaWithFormatOption:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOEvent formatAdministrativeAreaWithFormatOption:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEvent.m"), 1754, CFSTR("request formatLocalityWithFormatOption on non routine event instance (in %s:%d)"), "-[MOEvent formatAdministrativeAreaWithFormatOption:]", 1754);

    v5 = 0;
  }
  return v5;
}

- (id)formatCountryWithFormatOption:(id)a3
{
  MOEventRoutine *routineEvent;
  void *v5;
  NSObject *v7;
  void *v8;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    -[MOEventRoutine formatCountryWithFormatOption:](routineEvent, "formatCountryWithFormatOption:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOEvent formatCountryWithFormatOption:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEvent.m"), 1763, CFSTR("request formatCountryWithFormatOption on non routine event instance (in %s:%d)"), "-[MOEvent formatCountryWithFormatOption:]", 1763);

    v5 = 0;
  }
  return v5;
}

- (NSUUID)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eventIdentifier, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setSourceCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_sourceCreationDate, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (unint64_t)provider
{
  return self->_provider;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)identifierFromProvider
{
  return self->_identifierFromProvider;
}

- (void)setIdentifierFromProvider:(id)a3
{
  objc_storeStrong((id *)&self->_identifierFromProvider, a3);
}

- (BOOL)fromFirstParty
{
  return self->_fromFirstParty;
}

- (void)setFromFirstParty:(BOOL)a3
{
  self->_fromFirstParty = a3;
}

- (unint64_t)rehydrationFailCount
{
  return self->_rehydrationFailCount;
}

- (void)setRehydrationFailCount:(unint64_t)a3
{
  self->_rehydrationFailCount = a3;
}

- (NSString)appBundle
{
  return self->_appBundle;
}

- (void)setAppBundle:(id)a3
{
  objc_storeStrong((id *)&self->_appBundle, a3);
}

- (MOEventPhoto)photoEvent
{
  return self->_photoEvent;
}

- (void)setPhotoEvent:(id)a3
{
  objc_storeStrong((id *)&self->_photoEvent, a3);
}

- (MOEventRoutine)routineEvent
{
  return self->_routineEvent;
}

- (void)setRoutineEvent:(id)a3
{
  objc_storeStrong((id *)&self->_routineEvent, a3);
}

- (MOEventWorkout)workoutEvent
{
  return self->_workoutEvent;
}

- (void)setWorkoutEvent:(id)a3
{
  objc_storeStrong((id *)&self->_workoutEvent, a3);
}

- (MOEventProactiveSuggested)proactiveSuggestedEvent
{
  return self->_proactiveSuggestedEvent;
}

- (void)setProactiveSuggestedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveSuggestedEvent, a3);
}

- (MOEventTravel)travelEvent
{
  return self->_travelEvent;
}

- (void)setTravelEvent:(id)a3
{
  objc_storeStrong((id *)&self->_travelEvent, a3);
}

- (MOEventMedia)mediaEvent
{
  return self->_mediaEvent;
}

- (void)setMediaEvent:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEvent, a3);
}

- (MOEventSharedWithYou)sharedWithYouEvent
{
  return self->_sharedWithYouEvent;
}

- (void)setSharedWithYouEvent:(id)a3
{
  objc_storeStrong((id *)&self->_sharedWithYouEvent, a3);
}

- (MOEventSignificantContact)significantContactEvent
{
  return self->_significantContactEvent;
}

- (void)setSignificantContactEvent:(id)a3
{
  objc_storeStrong((id *)&self->_significantContactEvent, a3);
}

- (MOEventPeopleDiscovery)peopleDiscoveryEvent
{
  return self->_peopleDiscoveryEvent;
}

- (void)setPeopleDiscoveryEvent:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDiscoveryEvent, a3);
}

- (MOEventPortrait)portraitEvent
{
  return self->_portraitEvent;
}

- (void)setPortraitEvent:(id)a3
{
  objc_storeStrong((id *)&self->_portraitEvent, a3);
}

- (MOEventMotionActivity)motionActivityEvent
{
  return self->_motionActivityEvent;
}

- (void)setMotionActivityEvent:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityEvent, a3);
}

- (MOEventAnalytics)analyticsEvent
{
  return self->_analyticsEvent;
}

- (void)setAnalyticsEvent:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEvent, a3);
}

- (MOEventLifeEvents)lifeEventsEvent
{
  return self->_lifeEventsEvent;
}

- (void)setLifeEventsEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lifeEventsEvent, a3);
}

- (MOEventStateOfMind)stateOfMindEvent
{
  return self->_stateOfMindEvent;
}

- (void)setStateOfMindEvent:(id)a3
{
  objc_storeStrong((id *)&self->_stateOfMindEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateOfMindEvent, 0);
  objc_storeStrong((id *)&self->_lifeEventsEvent, 0);
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_motionActivityEvent, 0);
  objc_storeStrong((id *)&self->_portraitEvent, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryEvent, 0);
  objc_storeStrong((id *)&self->_significantContactEvent, 0);
  objc_storeStrong((id *)&self->_sharedWithYouEvent, 0);
  objc_storeStrong((id *)&self->_mediaEvent, 0);
  objc_storeStrong((id *)&self->_travelEvent, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestedEvent, 0);
  objc_storeStrong((id *)&self->_workoutEvent, 0);
  objc_storeStrong((id *)&self->_routineEvent, 0);
  objc_storeStrong((id *)&self->_photoEvent, 0);
  objc_storeStrong((id *)&self->_appBundle, 0);
  objc_storeStrong((id *)&self->_identifierFromProvider, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_sourceCreationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: eventIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: startDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: endDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: creationDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)formatAddressWithFormatOption:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "request formatAddressWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)formatLocalityWithFormatOption:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "request formatLocalityWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)formatAdministrativeAreaWithFormatOption:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "request formatLocalityWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)formatCountryWithFormatOption:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "request formatCountryWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
