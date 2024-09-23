@implementation INPrivatePlayMediaIntentData

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:", a3, a4, a5, a6, 0, 0, 0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0, 0, 0,
           0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17 alternativeProviderBundleIdentifier:(id)a18 ampPAFDataSetID:(id)a19 pegasusMetaData:(id)a20
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  INPrivatePlayMediaIntentData *v34;
  uint64_t v35;
  NSNumber *appSelectionEnabled;
  uint64_t v37;
  NSNumber *appInferred;
  uint64_t v39;
  NSArray *audioSearchResults;
  uint64_t v41;
  INPrivateMediaIntentData *privateMediaIntentData;
  uint64_t v43;
  NSNumber *appSelectionSignalsEnabled;
  uint64_t v45;
  NSNumber *appSelectionSignalsFrequencyDenominator;
  uint64_t v47;
  NSNumber *shouldSuppressCommonWholeHouseAudioRoutes;
  uint64_t v49;
  NSNumber *immediatelyStartPlayback;
  uint64_t v51;
  NSNumber *isAmbiguousPlay;
  uint64_t v53;
  NSNumber *isPersonalizedRequest;
  uint64_t v55;
  NSArray *internalSignals;
  uint64_t v57;
  NSNumber *entityConfidenceSignalsEnabled;
  uint64_t v59;
  NSNumber *entityConfidenceSignalsFrequencyDenominatorInternal;
  uint64_t v61;
  NSNumber *entityConfidenceSignalsFrequencyDenominatorProd;
  uint64_t v63;
  NSNumber *entityConfidenceSignalsMaxItemsToDisambiguate;
  uint64_t v65;
  NSString *alternativeProviderBundleIdentifier;
  uint64_t v67;
  NSString *ampPAFDataSetID;
  uint64_t v69;
  NSData *pegasusMetaData;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  objc_super v82;

  v25 = a3;
  v81 = a4;
  v80 = a5;
  v79 = a6;
  v78 = a7;
  v77 = a8;
  v76 = a9;
  v75 = a10;
  v74 = a11;
  v73 = a12;
  v26 = a13;
  v27 = a14;
  v28 = a15;
  v29 = a16;
  v30 = a17;
  v31 = a18;
  v32 = a19;
  v33 = a20;
  v82.receiver = self;
  v82.super_class = (Class)INPrivatePlayMediaIntentData;
  v34 = -[INPrivatePlayMediaIntentData init](&v82, sel_init);
  if (v34)
  {
    v35 = objc_msgSend(v25, "copy");
    appSelectionEnabled = v34->_appSelectionEnabled;
    v34->_appSelectionEnabled = (NSNumber *)v35;

    v37 = objc_msgSend(v81, "copy");
    appInferred = v34->_appInferred;
    v34->_appInferred = (NSNumber *)v37;

    v39 = objc_msgSend(v80, "copy");
    audioSearchResults = v34->_audioSearchResults;
    v34->_audioSearchResults = (NSArray *)v39;

    v41 = objc_msgSend(v79, "copy");
    privateMediaIntentData = v34->_privateMediaIntentData;
    v34->_privateMediaIntentData = (INPrivateMediaIntentData *)v41;

    v43 = objc_msgSend(v78, "copy");
    appSelectionSignalsEnabled = v34->_appSelectionSignalsEnabled;
    v34->_appSelectionSignalsEnabled = (NSNumber *)v43;

    v45 = objc_msgSend(v77, "copy");
    appSelectionSignalsFrequencyDenominator = v34->_appSelectionSignalsFrequencyDenominator;
    v34->_appSelectionSignalsFrequencyDenominator = (NSNumber *)v45;

    v47 = objc_msgSend(v76, "copy");
    shouldSuppressCommonWholeHouseAudioRoutes = v34->_shouldSuppressCommonWholeHouseAudioRoutes;
    v34->_shouldSuppressCommonWholeHouseAudioRoutes = (NSNumber *)v47;

    v49 = objc_msgSend(v75, "copy");
    immediatelyStartPlayback = v34->_immediatelyStartPlayback;
    v34->_immediatelyStartPlayback = (NSNumber *)v49;

    v51 = objc_msgSend(v74, "copy");
    isAmbiguousPlay = v34->_isAmbiguousPlay;
    v34->_isAmbiguousPlay = (NSNumber *)v51;

    v53 = objc_msgSend(v73, "copy");
    isPersonalizedRequest = v34->_isPersonalizedRequest;
    v34->_isPersonalizedRequest = (NSNumber *)v53;

    v55 = objc_msgSend(v26, "copy");
    internalSignals = v34->_internalSignals;
    v34->_internalSignals = (NSArray *)v55;

    v57 = objc_msgSend(v27, "copy");
    entityConfidenceSignalsEnabled = v34->_entityConfidenceSignalsEnabled;
    v34->_entityConfidenceSignalsEnabled = (NSNumber *)v57;

    v59 = objc_msgSend(v28, "copy");
    entityConfidenceSignalsFrequencyDenominatorInternal = v34->_entityConfidenceSignalsFrequencyDenominatorInternal;
    v34->_entityConfidenceSignalsFrequencyDenominatorInternal = (NSNumber *)v59;

    v61 = objc_msgSend(v29, "copy");
    entityConfidenceSignalsFrequencyDenominatorProd = v34->_entityConfidenceSignalsFrequencyDenominatorProd;
    v34->_entityConfidenceSignalsFrequencyDenominatorProd = (NSNumber *)v61;

    v63 = objc_msgSend(v30, "copy");
    entityConfidenceSignalsMaxItemsToDisambiguate = v34->_entityConfidenceSignalsMaxItemsToDisambiguate;
    v34->_entityConfidenceSignalsMaxItemsToDisambiguate = (NSNumber *)v63;

    v65 = objc_msgSend(v31, "copy");
    alternativeProviderBundleIdentifier = v34->_alternativeProviderBundleIdentifier;
    v34->_alternativeProviderBundleIdentifier = (NSString *)v65;

    v67 = objc_msgSend(v32, "copy");
    ampPAFDataSetID = v34->_ampPAFDataSetID;
    v34->_ampPAFDataSetID = (NSString *)v67;

    v69 = objc_msgSend(v33, "copy");
    pegasusMetaData = v34->_pegasusMetaData;
    v34->_pegasusMetaData = (NSData *)v69;

  }
  return v34;
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           0,
           0,
           0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17 alternativeProviderBundleIdentifier:(id)a18
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           0,
           0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17 alternativeProviderBundleIdentifier:(id)a18 ampPAFDataSetID:(id)a19
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           0);
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;

  v3 = -[NSNumber hash](self->_appSelectionEnabled, "hash");
  v4 = -[NSNumber hash](self->_appInferred, "hash") ^ v3;
  v5 = -[NSArray hash](self->_audioSearchResults, "hash");
  v6 = v4 ^ v5 ^ -[INPrivateMediaIntentData hash](self->_privateMediaIntentData, "hash");
  v7 = -[NSNumber hash](self->_appSelectionSignalsEnabled, "hash");
  v8 = v7 ^ -[NSNumber hash](self->_appSelectionSignalsFrequencyDenominator, "hash");
  v9 = v6 ^ v8 ^ -[NSNumber hash](self->_shouldSuppressCommonWholeHouseAudioRoutes, "hash");
  v10 = -[NSNumber hash](self->_immediatelyStartPlayback, "hash");
  v11 = v10 ^ -[NSNumber hash](self->_isAmbiguousPlay, "hash");
  v12 = v11 ^ -[NSNumber hash](self->_isPersonalizedRequest, "hash");
  v13 = v9 ^ v12 ^ -[NSArray hash](self->_internalSignals, "hash");
  v14 = -[NSNumber hash](self->_entityConfidenceSignalsEnabled, "hash");
  v15 = v14 ^ -[NSNumber hash](self->_entityConfidenceSignalsFrequencyDenominatorInternal, "hash");
  v16 = v15 ^ -[NSNumber hash](self->_entityConfidenceSignalsFrequencyDenominatorProd, "hash");
  v17 = v16 ^ -[NSNumber hash](self->_entityConfidenceSignalsMaxItemsToDisambiguate, "hash");
  v18 = v13 ^ v17 ^ -[NSString hash](self->_alternativeProviderBundleIdentifier, "hash");
  v19 = -[NSString hash](self->_ampPAFDataSetID, "hash");
  return v18 ^ v19 ^ -[NSData hash](self->_pegasusMetaData, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INPrivatePlayMediaIntentData *v4;
  INPrivatePlayMediaIntentData *v5;
  NSNumber *appSelectionEnabled;
  NSNumber *appInferred;
  NSArray *audioSearchResults;
  INPrivateMediaIntentData *privateMediaIntentData;
  NSNumber *appSelectionSignalsEnabled;
  NSNumber *appSelectionSignalsFrequencyDenominator;
  NSNumber *shouldSuppressCommonWholeHouseAudioRoutes;
  NSNumber *immediatelyStartPlayback;
  NSNumber *isAmbiguousPlay;
  NSNumber *isPersonalizedRequest;
  NSArray *internalSignals;
  NSNumber *entityConfidenceSignalsEnabled;
  NSNumber *entityConfidenceSignalsFrequencyDenominatorInternal;
  NSNumber *entityConfidenceSignalsFrequencyDenominatorProd;
  NSNumber *entityConfidenceSignalsMaxItemsToDisambiguate;
  NSString *alternativeProviderBundleIdentifier;
  NSString *ampPAFDataSetID;
  NSData *pegasusMetaData;
  BOOL v24;

  v4 = (INPrivatePlayMediaIntentData *)a3;
  if (v4 == self)
  {
    v24 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      appSelectionEnabled = self->_appSelectionEnabled;
      if (appSelectionEnabled != v5->_appSelectionEnabled
        && !-[NSNumber isEqual:](appSelectionEnabled, "isEqual:"))
      {
        goto LABEL_42;
      }
      appInferred = self->_appInferred;
      if (appInferred != v5->_appInferred && !-[NSNumber isEqual:](appInferred, "isEqual:"))
        goto LABEL_42;
      audioSearchResults = self->_audioSearchResults;
      if (audioSearchResults != v5->_audioSearchResults
        && !-[NSArray isEqual:](audioSearchResults, "isEqual:"))
      {
        goto LABEL_42;
      }
      privateMediaIntentData = self->_privateMediaIntentData;
      if (privateMediaIntentData != v5->_privateMediaIntentData
        && !-[INPrivateMediaIntentData isEqual:](privateMediaIntentData, "isEqual:"))
      {
        goto LABEL_42;
      }
      appSelectionSignalsEnabled = self->_appSelectionSignalsEnabled;
      if (appSelectionSignalsEnabled != v5->_appSelectionSignalsEnabled
        && !-[NSNumber isEqual:](appSelectionSignalsEnabled, "isEqual:"))
      {
        goto LABEL_42;
      }
      appSelectionSignalsFrequencyDenominator = self->_appSelectionSignalsFrequencyDenominator;
      if (appSelectionSignalsFrequencyDenominator != v5->_appSelectionSignalsFrequencyDenominator
        && !-[NSNumber isEqual:](appSelectionSignalsFrequencyDenominator, "isEqual:"))
      {
        goto LABEL_42;
      }
      shouldSuppressCommonWholeHouseAudioRoutes = self->_shouldSuppressCommonWholeHouseAudioRoutes;
      if (shouldSuppressCommonWholeHouseAudioRoutes != v5->_shouldSuppressCommonWholeHouseAudioRoutes
        && !-[NSNumber isEqual:](shouldSuppressCommonWholeHouseAudioRoutes, "isEqual:"))
      {
        goto LABEL_42;
      }
      immediatelyStartPlayback = self->_immediatelyStartPlayback;
      if (immediatelyStartPlayback != v5->_immediatelyStartPlayback
        && !-[NSNumber isEqual:](immediatelyStartPlayback, "isEqual:"))
      {
        goto LABEL_42;
      }
      isAmbiguousPlay = self->_isAmbiguousPlay;
      if (isAmbiguousPlay != v5->_isAmbiguousPlay && !-[NSNumber isEqual:](isAmbiguousPlay, "isEqual:"))
        goto LABEL_42;
      isPersonalizedRequest = self->_isPersonalizedRequest;
      if (isPersonalizedRequest != v5->_isPersonalizedRequest
        && !-[NSNumber isEqual:](isPersonalizedRequest, "isEqual:"))
      {
        goto LABEL_42;
      }
      internalSignals = self->_internalSignals;
      if (internalSignals != v5->_internalSignals && !-[NSArray isEqual:](internalSignals, "isEqual:"))
        goto LABEL_42;
      if (((entityConfidenceSignalsEnabled = self->_entityConfidenceSignalsEnabled,
             entityConfidenceSignalsEnabled == v5->_entityConfidenceSignalsEnabled)
         || -[NSNumber isEqual:](entityConfidenceSignalsEnabled, "isEqual:"))
        && ((entityConfidenceSignalsFrequencyDenominatorInternal = self->_entityConfidenceSignalsFrequencyDenominatorInternal,
             entityConfidenceSignalsFrequencyDenominatorInternal == v5->_entityConfidenceSignalsFrequencyDenominatorInternal)
         || -[NSNumber isEqual:](entityConfidenceSignalsFrequencyDenominatorInternal, "isEqual:"))
        && ((entityConfidenceSignalsFrequencyDenominatorProd = self->_entityConfidenceSignalsFrequencyDenominatorProd,
             entityConfidenceSignalsFrequencyDenominatorProd == v5->_entityConfidenceSignalsFrequencyDenominatorProd)
         || -[NSNumber isEqual:](entityConfidenceSignalsFrequencyDenominatorProd, "isEqual:"))
        && ((entityConfidenceSignalsMaxItemsToDisambiguate = self->_entityConfidenceSignalsMaxItemsToDisambiguate,
             entityConfidenceSignalsMaxItemsToDisambiguate == v5->_entityConfidenceSignalsMaxItemsToDisambiguate)
         || -[NSNumber isEqual:](entityConfidenceSignalsMaxItemsToDisambiguate, "isEqual:"))
        && ((alternativeProviderBundleIdentifier = self->_alternativeProviderBundleIdentifier,
             alternativeProviderBundleIdentifier == v5->_alternativeProviderBundleIdentifier)
         || -[NSString isEqual:](alternativeProviderBundleIdentifier, "isEqual:"))
        && ((ampPAFDataSetID = self->_ampPAFDataSetID, ampPAFDataSetID == v5->_ampPAFDataSetID)
         || -[NSString isEqual:](ampPAFDataSetID, "isEqual:"))
        && ((pegasusMetaData = self->_pegasusMetaData, pegasusMetaData == v5->_pegasusMetaData)
         || -[NSData isEqual:](pegasusMetaData, "isEqual:")))
      {
        v24 = 1;
      }
      else
      {
LABEL_42:
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }
  }

  return v24;
}

- (INPrivatePlayMediaIntentData)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  INPrivatePlayMediaIntentData *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appSelectionEnabled"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appInferred"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("audioSearchResults"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateMediaIntentData"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appSelectionSignalsEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appSelectionSignalsFrequencyDenominator"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shouldSuppressCommonWholeHouseAudioRoutes"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("immediatelyStartPlayback"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAmbiguousPlay"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isPersonalizedRequest"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("internalSignals"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityConfidenceSignalsEnabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityConfidenceSignalsFrequencyDenominatorInternal"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityConfidenceSignalsFrequencyDenominatorProd"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityConfidenceSignalsMaxItemsToDisambiguate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternativeProviderBundleIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ampPAFDataSetID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pegasusMetaData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", v30, v29, v28, v23, v22, v21, v27, v20, v26, v19, v18, v17, v16,
          v10,
          v11,
          v12,
          v13,
          v14);

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *appSelectionEnabled;
  id v5;

  appSelectionEnabled = self->_appSelectionEnabled;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appSelectionEnabled, CFSTR("appSelectionEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appInferred, CFSTR("appInferred"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioSearchResults, CFSTR("audioSearchResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateMediaIntentData, CFSTR("privateMediaIntentData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appSelectionSignalsEnabled, CFSTR("appSelectionSignalsEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appSelectionSignalsFrequencyDenominator, CFSTR("appSelectionSignalsFrequencyDenominator"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shouldSuppressCommonWholeHouseAudioRoutes, CFSTR("shouldSuppressCommonWholeHouseAudioRoutes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_immediatelyStartPlayback, CFSTR("immediatelyStartPlayback"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isAmbiguousPlay, CFSTR("isAmbiguousPlay"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isPersonalizedRequest, CFSTR("isPersonalizedRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_internalSignals, CFSTR("internalSignals"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entityConfidenceSignalsEnabled, CFSTR("entityConfidenceSignalsEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entityConfidenceSignalsFrequencyDenominatorInternal, CFSTR("entityConfidenceSignalsFrequencyDenominatorInternal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entityConfidenceSignalsFrequencyDenominatorProd, CFSTR("entityConfidenceSignalsFrequencyDenominatorProd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entityConfidenceSignalsMaxItemsToDisambiguate, CFSTR("entityConfidenceSignalsMaxItemsToDisambiguate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternativeProviderBundleIdentifier, CFSTR("alternativeProviderBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ampPAFDataSetID, CFSTR("ampPAFDataSetID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pegasusMetaData, CFSTR("pegasusMetaData"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_appSelectionEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("appSelectionEnabled"));

  objc_msgSend(v6, "encodeObject:", self->_appInferred);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("appInferred"));

  objc_msgSend(v6, "encodeObject:", self->_audioSearchResults);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("audioSearchResults"));

  objc_msgSend(v6, "encodeObject:", self->_privateMediaIntentData);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("privateMediaIntentData"));

  objc_msgSend(v6, "encodeObject:", self->_appSelectionSignalsEnabled);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("appSelectionSignalsEnabled"));

  objc_msgSend(v6, "encodeObject:", self->_appSelectionSignalsFrequencyDenominator);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("appSelectionSignalsFrequencyDenominator"));

  objc_msgSend(v6, "encodeObject:", self->_shouldSuppressCommonWholeHouseAudioRoutes);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("shouldSuppressCommonWholeHouseAudioRoutes"));

  objc_msgSend(v6, "encodeObject:", self->_immediatelyStartPlayback);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("immediatelyStartPlayback"));

  objc_msgSend(v6, "encodeObject:", self->_isAmbiguousPlay);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("isAmbiguousPlay"));

  objc_msgSend(v6, "encodeObject:", self->_isPersonalizedRequest);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, CFSTR("isPersonalizedRequest"));

  objc_msgSend(v6, "encodeObject:", self->_internalSignals);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, CFSTR("internalSignals"));

  objc_msgSend(v6, "encodeObject:", self->_entityConfidenceSignalsEnabled);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, CFSTR("entityConfidenceSignalsEnabled"));

  objc_msgSend(v6, "encodeObject:", self->_entityConfidenceSignalsFrequencyDenominatorInternal);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, CFSTR("entityConfidenceSignalsFrequencyDenominatorInternal"));

  objc_msgSend(v6, "encodeObject:", self->_entityConfidenceSignalsFrequencyDenominatorProd);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, CFSTR("entityConfidenceSignalsFrequencyDenominatorProd"));

  objc_msgSend(v6, "encodeObject:", self->_entityConfidenceSignalsMaxItemsToDisambiguate);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, CFSTR("entityConfidenceSignalsMaxItemsToDisambiguate"));

  objc_msgSend(v6, "encodeObject:", self->_alternativeProviderBundleIdentifier);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, CFSTR("alternativeProviderBundleIdentifier"));

  objc_msgSend(v6, "encodeObject:", self->_ampPAFDataSetID);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, CFSTR("ampPAFDataSetID"));

  objc_msgSend(v6, "encodeObject:", self->_pegasusMetaData);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, CFSTR("pegasusMetaData"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INPrivatePlayMediaIntentData descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INPrivatePlayMediaIntentData;
  -[INPrivatePlayMediaIntentData description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPrivatePlayMediaIntentData _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  uint64_t appInferred;
  uint64_t audioSearchResults;
  uint64_t privateMediaIntentData;
  uint64_t appSelectionSignalsEnabled;
  uint64_t appSelectionSignalsFrequencyDenominator;
  uint64_t shouldSuppressCommonWholeHouseAudioRoutes;
  uint64_t immediatelyStartPlayback;
  uint64_t isAmbiguousPlay;
  uint64_t isPersonalizedRequest;
  uint64_t internalSignals;
  uint64_t entityConfidenceSignalsEnabled;
  NSNumber *entityConfidenceSignalsFrequencyDenominatorInternal;
  uint64_t v16;
  NSNumber *entityConfidenceSignalsFrequencyDenominatorProd;
  uint64_t v18;
  NSNumber *entityConfidenceSignalsMaxItemsToDisambiguate;
  uint64_t v20;
  NSString *alternativeProviderBundleIdentifier;
  void *v22;
  void *v23;
  NSString *ampPAFDataSetID;
  void *v25;
  NSData *pegasusMetaData;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSNumber *appSelectionEnabled;
  void *v56;
  _QWORD v57[18];
  _QWORD v58[20];

  v58[18] = *MEMORY[0x1E0C80C00];
  v57[0] = CFSTR("appSelectionEnabled");
  appSelectionEnabled = self->_appSelectionEnabled;
  v3 = (uint64_t)appSelectionEnabled;
  if (!appSelectionEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v58[0] = v3;
  v57[1] = CFSTR("appInferred");
  appInferred = (uint64_t)self->_appInferred;
  v53 = appInferred;
  if (!appInferred)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    appInferred = objc_claimAutoreleasedReturnValue();
  }
  v58[1] = appInferred;
  v57[2] = CFSTR("audioSearchResults");
  audioSearchResults = (uint64_t)self->_audioSearchResults;
  v51 = audioSearchResults;
  if (!audioSearchResults)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    audioSearchResults = objc_claimAutoreleasedReturnValue();
  }
  v58[2] = audioSearchResults;
  v57[3] = CFSTR("privateMediaIntentData");
  privateMediaIntentData = (uint64_t)self->_privateMediaIntentData;
  v49 = privateMediaIntentData;
  if (!privateMediaIntentData)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    privateMediaIntentData = objc_claimAutoreleasedReturnValue();
  }
  v58[3] = privateMediaIntentData;
  v57[4] = CFSTR("appSelectionSignalsEnabled");
  appSelectionSignalsEnabled = (uint64_t)self->_appSelectionSignalsEnabled;
  v47 = appSelectionSignalsEnabled;
  if (!appSelectionSignalsEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    appSelectionSignalsEnabled = objc_claimAutoreleasedReturnValue();
  }
  v58[4] = appSelectionSignalsEnabled;
  v57[5] = CFSTR("appSelectionSignalsFrequencyDenominator");
  appSelectionSignalsFrequencyDenominator = (uint64_t)self->_appSelectionSignalsFrequencyDenominator;
  v45 = appSelectionSignalsFrequencyDenominator;
  if (!appSelectionSignalsFrequencyDenominator)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    appSelectionSignalsFrequencyDenominator = objc_claimAutoreleasedReturnValue();
  }
  v58[5] = appSelectionSignalsFrequencyDenominator;
  v57[6] = CFSTR("shouldSuppressCommonWholeHouseAudioRoutes");
  shouldSuppressCommonWholeHouseAudioRoutes = (uint64_t)self->_shouldSuppressCommonWholeHouseAudioRoutes;
  v43 = shouldSuppressCommonWholeHouseAudioRoutes;
  if (!shouldSuppressCommonWholeHouseAudioRoutes)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    shouldSuppressCommonWholeHouseAudioRoutes = objc_claimAutoreleasedReturnValue();
  }
  v58[6] = shouldSuppressCommonWholeHouseAudioRoutes;
  v57[7] = CFSTR("immediatelyStartPlayback");
  immediatelyStartPlayback = (uint64_t)self->_immediatelyStartPlayback;
  v41 = immediatelyStartPlayback;
  if (!immediatelyStartPlayback)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    immediatelyStartPlayback = objc_claimAutoreleasedReturnValue();
  }
  v58[7] = immediatelyStartPlayback;
  v57[8] = CFSTR("isAmbiguousPlay");
  isAmbiguousPlay = (uint64_t)self->_isAmbiguousPlay;
  v39 = isAmbiguousPlay;
  if (!isAmbiguousPlay)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    isAmbiguousPlay = objc_claimAutoreleasedReturnValue();
  }
  v58[8] = isAmbiguousPlay;
  v57[9] = CFSTR("isPersonalizedRequest");
  isPersonalizedRequest = (uint64_t)self->_isPersonalizedRequest;
  v38 = isPersonalizedRequest;
  if (!isPersonalizedRequest)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    isPersonalizedRequest = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)isPersonalizedRequest;
  v58[9] = isPersonalizedRequest;
  v57[10] = CFSTR("internalSignals");
  internalSignals = (uint64_t)self->_internalSignals;
  v36 = internalSignals;
  if (!internalSignals)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    internalSignals = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)privateMediaIntentData;
  v56 = (void *)internalSignals;
  v58[10] = internalSignals;
  v57[11] = CFSTR("entityConfidenceSignalsEnabled");
  entityConfidenceSignalsEnabled = (uint64_t)self->_entityConfidenceSignalsEnabled;
  v35 = entityConfidenceSignalsEnabled;
  if (!entityConfidenceSignalsEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    entityConfidenceSignalsEnabled = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)appSelectionSignalsEnabled;
  v33 = (void *)entityConfidenceSignalsEnabled;
  v58[11] = entityConfidenceSignalsEnabled;
  v57[12] = CFSTR("entityConfidenceSignalsFrequencyDenominatorInternal");
  entityConfidenceSignalsFrequencyDenominatorInternal = self->_entityConfidenceSignalsFrequencyDenominatorInternal;
  v16 = (uint64_t)entityConfidenceSignalsFrequencyDenominatorInternal;
  if (!entityConfidenceSignalsFrequencyDenominatorInternal)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)appSelectionSignalsFrequencyDenominator;
  v50 = (void *)audioSearchResults;
  v32 = (void *)v16;
  v58[12] = v16;
  v57[13] = CFSTR("entityConfidenceSignalsFrequencyDenominatorProd");
  entityConfidenceSignalsFrequencyDenominatorProd = self->_entityConfidenceSignalsFrequencyDenominatorProd;
  v18 = (uint64_t)entityConfidenceSignalsFrequencyDenominatorProd;
  if (!entityConfidenceSignalsFrequencyDenominatorProd)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)shouldSuppressCommonWholeHouseAudioRoutes;
  v54 = (void *)v3;
  v31 = (void *)v18;
  v58[13] = v18;
  v57[14] = CFSTR("entityConfidenceSignalsMaxItemsToDisambiguate");
  entityConfidenceSignalsMaxItemsToDisambiguate = self->_entityConfidenceSignalsMaxItemsToDisambiguate;
  v20 = (uint64_t)entityConfidenceSignalsMaxItemsToDisambiguate;
  if (!entityConfidenceSignalsMaxItemsToDisambiguate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)immediatelyStartPlayback;
  v52 = (void *)appInferred;
  v30 = (void *)v20;
  v58[14] = v20;
  v57[15] = CFSTR("alternativeProviderBundleIdentifier");
  alternativeProviderBundleIdentifier = self->_alternativeProviderBundleIdentifier;
  v22 = alternativeProviderBundleIdentifier;
  if (!alternativeProviderBundleIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)isAmbiguousPlay;
  v58[15] = v22;
  v57[16] = CFSTR("ampPAFDataSetID");
  ampPAFDataSetID = self->_ampPAFDataSetID;
  v25 = ampPAFDataSetID;
  if (!ampPAFDataSetID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v58[16] = v25;
  v57[17] = CFSTR("pegasusMetaData");
  pegasusMetaData = self->_pegasusMetaData;
  v27 = pegasusMetaData;
  if (!pegasusMetaData)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v58[17] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 18);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (!pegasusMetaData)

  v28 = v56;
  if (!ampPAFDataSetID)
  {

    v28 = v56;
  }
  if (!alternativeProviderBundleIdentifier)
  {

    v28 = v56;
  }
  if (!entityConfidenceSignalsMaxItemsToDisambiguate)
  {

    v28 = v56;
  }
  if (!entityConfidenceSignalsFrequencyDenominatorProd)
  {

    v28 = v56;
  }
  if (!entityConfidenceSignalsFrequencyDenominatorInternal)
  {

    v28 = v56;
  }
  if (!v35)
  {

    v28 = v56;
  }
  if (!v36)

  if (!v38)
  if (!v39)

  if (!v41)
  if (!v43)

  if (!v45)
  if (!v47)

  if (!v49)
  if (!v51)

  if (!v53)
  if (!appSelectionEnabled)

  return v34;
}

- (NSNumber)appSelectionEnabled
{
  return self->_appSelectionEnabled;
}

- (NSNumber)appInferred
{
  return self->_appInferred;
}

- (NSArray)audioSearchResults
{
  return self->_audioSearchResults;
}

- (INPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (void)setPrivateMediaIntentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)appSelectionSignalsEnabled
{
  return self->_appSelectionSignalsEnabled;
}

- (NSNumber)appSelectionSignalsFrequencyDenominator
{
  return self->_appSelectionSignalsFrequencyDenominator;
}

- (NSNumber)shouldSuppressCommonWholeHouseAudioRoutes
{
  return self->_shouldSuppressCommonWholeHouseAudioRoutes;
}

- (NSNumber)immediatelyStartPlayback
{
  return self->_immediatelyStartPlayback;
}

- (NSNumber)isAmbiguousPlay
{
  return self->_isAmbiguousPlay;
}

- (NSNumber)isPersonalizedRequest
{
  return self->_isPersonalizedRequest;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (NSNumber)entityConfidenceSignalsEnabled
{
  return self->_entityConfidenceSignalsEnabled;
}

- (NSNumber)entityConfidenceSignalsFrequencyDenominatorInternal
{
  return self->_entityConfidenceSignalsFrequencyDenominatorInternal;
}

- (NSNumber)entityConfidenceSignalsFrequencyDenominatorProd
{
  return self->_entityConfidenceSignalsFrequencyDenominatorProd;
}

- (NSNumber)entityConfidenceSignalsMaxItemsToDisambiguate
{
  return self->_entityConfidenceSignalsMaxItemsToDisambiguate;
}

- (NSString)alternativeProviderBundleIdentifier
{
  return self->_alternativeProviderBundleIdentifier;
}

- (NSString)ampPAFDataSetID
{
  return self->_ampPAFDataSetID;
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_ampPAFDataSetID, 0);
  objc_storeStrong((id *)&self->_alternativeProviderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_entityConfidenceSignalsMaxItemsToDisambiguate, 0);
  objc_storeStrong((id *)&self->_entityConfidenceSignalsFrequencyDenominatorProd, 0);
  objc_storeStrong((id *)&self->_entityConfidenceSignalsFrequencyDenominatorInternal, 0);
  objc_storeStrong((id *)&self->_entityConfidenceSignalsEnabled, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_isPersonalizedRequest, 0);
  objc_storeStrong((id *)&self->_isAmbiguousPlay, 0);
  objc_storeStrong((id *)&self->_immediatelyStartPlayback, 0);
  objc_storeStrong((id *)&self->_shouldSuppressCommonWholeHouseAudioRoutes, 0);
  objc_storeStrong((id *)&self->_appSelectionSignalsFrequencyDenominator, 0);
  objc_storeStrong((id *)&self->_appSelectionSignalsEnabled, 0);
  objc_storeStrong((id *)&self->_privateMediaIntentData, 0);
  objc_storeStrong((id *)&self->_audioSearchResults, 0);
  objc_storeStrong((id *)&self->_appInferred, 0);
  objc_storeStrong((id *)&self->_appSelectionEnabled, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appSelectionEnabled"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appInferred"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (objc_class *)a1;
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("audioSearchResults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v9, v10);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("privateMediaIntentData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v11, v12);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appSelectionSignalsEnabled"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appSelectionSignalsFrequencyDenominator"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shouldSuppressCommonWholeHouseAudioRoutes"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("immediatelyStartPlayback"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isAmbiguousPlay"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isPersonalizedRequest"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("internalSignals"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entityConfidenceSignalsEnabled"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entityConfidenceSignalsFrequencyDenominatorInternal"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entityConfidenceSignalsFrequencyDenominatorProd"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entityConfidenceSignalsMaxItemsToDisambiguate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("alternativeProviderBundleIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ampPAFDataSetID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    objc_msgSend(v7, "decodeObjectOfClass:from:", v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pegasusMetaData"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = [v35 alloc];
    v36 = v19;
    v29 = objc_msgSend(v24, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", v43, v41, v42, v40, v39, v34, v38, v37, v33, v32, v31, v28, v30,
            v13,
            v27,
            v16,
            v20,
            v23);

    v25 = (void *)v29;
    v7 = v36;

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[INPrivatePlayMediaIntentData audioSearchResults](self, "audioSearchResults", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "_intents_cacheableObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v10 = v3;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[INPrivatePlayMediaIntentData audioSearchResults](self, "audioSearchResults", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_intents_updateContainerWithCache:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

@end
