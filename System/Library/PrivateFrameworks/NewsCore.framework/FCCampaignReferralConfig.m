@implementation FCCampaignReferralConfig

- (FCCampaignReferralConfig)initWithCampaignID:(id)a3 configDictionary:(id)a4
{
  id v7;
  id v8;
  FCCampaignReferralConfig *v9;
  FCCampaignReferralConfig *v10;
  uint64_t v11;
  NSArray *autoFavoriteTagIDs;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCCampaignReferralConfig;
  v9 = -[FCCampaignReferralConfig init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_campaignID, a3);
    FCAppConfigurationArrayValueWithDefaultValue(v8, (uint64_t)CFSTR("autoFavoriteTagIds"), 0);
    v11 = objc_claimAutoreleasedReturnValue();
    autoFavoriteTagIDs = v10->_autoFavoriteTagIDs;
    v10->_autoFavoriteTagIDs = (NSArray *)v11;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFavoriteTagIDs, 0);
  objc_storeStrong((id *)&self->_campaignID, 0);
}

- (NSString)campaignID
{
  return self->_campaignID;
}

- (void)setCampaignID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)autoFavoriteTagIDs
{
  return self->_autoFavoriteTagIDs;
}

- (void)setAutoFavoriteTagIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
