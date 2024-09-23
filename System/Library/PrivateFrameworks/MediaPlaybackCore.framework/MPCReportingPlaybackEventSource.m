@implementation MPCReportingPlaybackEventSource

- (MPCReportingPlaybackEventSource)init
{
  MPCReportingPlaybackEventSource *v2;
  uint64_t v3;
  MPCReportingIdentityPropertiesLoading *identityPropertiesLoader;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPCReportingPlaybackEventSource;
  v2 = -[MPCReportingPlaybackEventSource init](&v6, sel_init);
  if (v2)
  {
    +[MPCReportingDeviceIdentityPropertiesLoader sharedLoader](MPCReportingDeviceIdentityPropertiesLoader, "sharedLoader");
    v3 = objc_claimAutoreleasedReturnValue();
    identityPropertiesLoader = v2->_identityPropertiesLoader;
    v2->_identityPropertiesLoader = (MPCReportingIdentityPropertiesLoading *)v3;

  }
  return v2;
}

- (MPCReportingIdentityPropertiesLoading)identityPropertiesLoader
{
  return self->_identityPropertiesLoader;
}

- (void)setIdentityPropertiesLoader:(id)a3
{
  objc_storeStrong((id *)&self->_identityPropertiesLoader, a3);
}

- (int64_t)equivalencySourceAdamID
{
  return self->_equivalencySourceAdamID;
}

- (void)setEquivalencySourceAdamID:(int64_t)a3
{
  self->_equivalencySourceAdamID = a3;
}

- (double)eventDuration
{
  return self->_eventDuration;
}

- (void)setEventDuration:(double)a3
{
  self->_eventDuration = a3;
}

- (unint64_t)overrideItemType
{
  return self->_overrideItemType;
}

- (void)setOverrideItemType:(unint64_t)a3
{
  self->_overrideItemType = a3;
}

- (NSString)lyricsID
{
  return self->_lyricsID;
}

- (void)setLyricsID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MPModelGenericObject)itemGenericObject
{
  return self->_itemGenericObject;
}

- (void)setItemGenericObject:(id)a3
{
  objc_storeStrong((id *)&self->_itemGenericObject, a3);
}

- (NSNumber)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (void)setPrivateListeningEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)isSiriInitiated
{
  return self->_siriInitiated;
}

- (void)setSiriInitiated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)shouldReportPlayEventsToStore
{
  return self->_shouldReportPlayEventsToStore;
}

- (void)setShouldReportPlayEventsToStore:(BOOL)a3
{
  self->_shouldReportPlayEventsToStore = a3;
}

- (NSData)trackInfo
{
  return self->_trackInfo;
}

- (void)setTrackInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (MPModelPlayEvent)modelPlayEvent
{
  return self->_modelPlayEvent;
}

- (void)setModelPlayEvent:(id)a3
{
  objc_storeStrong((id *)&self->_modelPlayEvent, a3);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)jingleTimedMetadata
{
  return self->_jingleTimedMetadata;
}

- (void)setJingleTimedMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (void)setRecommendationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (void)setRequestingBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (void)setRequestingBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recommendationData, 0);
  objc_storeStrong((id *)&self->_jingleTimedMetadata, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_modelPlayEvent, 0);
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_siriInitiated, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_itemGenericObject, 0);
  objc_storeStrong((id *)&self->_lyricsID, 0);
  objc_storeStrong((id *)&self->_identityPropertiesLoader, 0);
}

@end
