@implementation CSVoiceProfileContext

- (CSVoiceProfileContext)initWithSharedSiriId:(id)a3 languageCode:(id)a4 productCategory:(id)a5 version:(id)a6 sharedHomeId:(id)a7 userName:(id)a8
{
  id v15;
  id v16;
  id v17;
  CSVoiceProfileContext *v18;
  CSVoiceProfileContext *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CSVoiceProfileContext;
  v18 = -[CSVoiceProfileContext init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_profileId, a3);
    objc_storeStrong((id *)&v19->_languageCode, a4);
    objc_storeStrong((id *)&v19->_productCategory, a5);
    objc_storeStrong((id *)&v19->_version, a6);
    objc_storeStrong((id *)&v19->_homeId, a7);
    objc_storeStrong((id *)&v19->_userName, a8);
  }

  return v19;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[profileId: %@, language: %@, product: %@, version: %@, homeId: %@, name: %@]"), self->_profileId, self->_languageCode, self->_productCategory, self->_version, self->_homeId, self->_userName);
}

- (NSString)profileId
{
  return self->_profileId;
}

- (void)setProfileId:(id)a3
{
  objc_storeStrong((id *)&self->_profileId, a3);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (NSString)productCategory
{
  return self->_productCategory;
}

- (void)setProductCategory:(id)a3
{
  objc_storeStrong((id *)&self->_productCategory, a3);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (unint64_t)onboardType
{
  return self->_onboardType;
}

- (void)setOnboardType:(unint64_t)a3
{
  self->_onboardType = a3;
}

- (NSString)homeId
{
  return self->_homeId;
}

- (void)setHomeId:(id)a3
{
  objc_storeStrong((id *)&self->_homeId, a3);
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
  objc_storeStrong((id *)&self->_userName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_homeId, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_profileId, 0);
}

@end
