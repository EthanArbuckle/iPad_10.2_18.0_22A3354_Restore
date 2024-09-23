@implementation MPCModelGenericAVItemAssetLoadProperties

- (BOOL)allowsHLSContent
{
  return -[MPCModelGenericAVItemAssetLoadProperties HLSContentPolicy](self, "HLSContentPolicy") != 3;
}

- (int64_t)HLSContentPolicy
{
  return self->_HLSContentPolicy;
}

- (void)setHLSContentPolicy:(int64_t)a3
{
  self->_HLSContentPolicy = a3;
}

- (BOOL)prefersVideoContent
{
  return self->_prefersVideoContent;
}

- (void)setPrefersVideoContent:(BOOL)a3
{
  self->_prefersVideoContent = a3;
}

- (MPCModelPlaybackAssetCacheProviding)assetCacheProvider
{
  return self->_assetCacheProvider;
}

- (void)setAssetCacheProvider:(id)a3
{
  objc_storeStrong((id *)&self->_assetCacheProvider, a3);
}

- (MPModelFileAsset)fileAsset
{
  return self->_fileAsset;
}

- (void)setFileAsset:(id)a3
{
  objc_storeStrong((id *)&self->_fileAsset, a3);
}

- (MPModelGenericObject)genericObject
{
  return self->_genericObject;
}

- (void)setGenericObject:(id)a3
{
  objc_storeStrong((id *)&self->_genericObject, a3);
}

- (MPModelHomeSharingAsset)homeSharingAsset
{
  return self->_homeSharingAsset;
}

- (void)setHomeSharingAsset:(id)a3
{
  objc_storeStrong((id *)&self->_homeSharingAsset, a3);
}

- (MPIdentifierSet)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifiers, a3);
}

- (BOOL)prefersHighQualityContent
{
  return self->_prefersHighQualityContent;
}

- (void)setPrefersHighQualityContent:(BOOL)a3
{
  self->_prefersHighQualityContent = a3;
}

- (BOOL)isRadioPlayback
{
  return self->_radioPlayback;
}

- (void)setRadioPlayback:(BOOL)a3
{
  self->_radioPlayback = a3;
}

- (MPModelStoreAsset)storeAsset
{
  return self->_storeAsset;
}

- (void)setStoreAsset:(id)a3
{
  objc_storeStrong((id *)&self->_storeAsset, a3);
}

- (BOOL)isFollowUp
{
  return self->_followUp;
}

- (void)setFollowUp:(BOOL)a3
{
  self->_followUp = a3;
}

- (unint64_t)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(unint64_t)a3
{
  self->_accountID = a3;
}

- (unint64_t)delegatedAccountID
{
  return self->_delegatedAccountID;
}

- (void)setDelegatedAccountID:(unint64_t)a3
{
  self->_delegatedAccountID = a3;
}

- (NSString)householdID
{
  return self->_householdID;
}

- (void)setHouseholdID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (void)setStorefrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)preferredAudioAssetType
{
  return self->_preferredAudioAssetType;
}

- (void)setPreferredAudioAssetType:(int64_t)a3
{
  self->_preferredAudioAssetType = a3;
}

- (MPCAudioAssetTypeSelection)audioAssetTypeSelection
{
  return self->_audioAssetTypeSelection;
}

- (void)setAudioAssetTypeSelection:(id)a3
{
  objc_storeStrong((id *)&self->_audioAssetTypeSelection, a3);
}

- (BOOL)supportsVocalAttenuation
{
  return self->_supportsVocalAttenuation;
}

- (void)setSupportsVocalAttenuation:(BOOL)a3
{
  self->_supportsVocalAttenuation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAssetTypeSelection, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_householdID, 0);
  objc_storeStrong((id *)&self->_storeAsset, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_homeSharingAsset, 0);
  objc_storeStrong((id *)&self->_genericObject, 0);
  objc_storeStrong((id *)&self->_fileAsset, 0);
  objc_storeStrong((id *)&self->_assetCacheProvider, 0);
}

@end
