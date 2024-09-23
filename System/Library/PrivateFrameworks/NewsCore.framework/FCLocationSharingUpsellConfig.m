@implementation FCLocationSharingUpsellConfig

- (FCLocationSharingUpsellConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCLocationSharingUpsellConfig *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCLocationSharingUpsellConfig;
  v5 = -[FCLocationSharingUpsellConfig init](&v7, sel_init);
  if (v5)
    v5->_landingPageArticleID = (NSString *)FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("landingPageArticleId"), 0);

  return v5;
}

- (NSString)landingPageArticleID
{
  return self->_landingPageArticleID;
}

- (void)setLandingPageArticleID:(id)a3
{
  self->_landingPageArticleID = (NSString *)a3;
}

@end
