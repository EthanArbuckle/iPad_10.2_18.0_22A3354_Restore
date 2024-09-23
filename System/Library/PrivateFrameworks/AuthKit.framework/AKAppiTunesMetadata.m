@implementation AKAppiTunesMetadata

- (AKAppiTunesMetadata)initWithBundleId:(id)a3 shortName:(id)a4 appName:(id)a5 appDeveloperName:(id)a6 adamID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AKAppiTunesMetadata *v17;
  uint64_t v18;
  NSString *bundleId;
  void *v20;
  uint64_t v21;
  NSString *appName;
  uint64_t v23;
  NSString *appDeveloperName;
  uint64_t v25;
  NSString *adamID;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)AKAppiTunesMetadata;
  v17 = -[AKAppiTunesMetadata init](&v28, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    bundleId = v17->_bundleId;
    v17->_bundleId = (NSString *)v18;

    if (objc_msgSend(v13, "length"))
      v20 = v13;
    else
      v20 = v14;
    v21 = objc_msgSend(v20, "copy");
    appName = v17->_appName;
    v17->_appName = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    appDeveloperName = v17->_appDeveloperName;
    v17->_appDeveloperName = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    adamID = v17->_adamID;
    v17->_adamID = (NSString *)v25;

  }
  return v17;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)appDeveloperName
{
  return self->_appDeveloperName;
}

- (void)setAppDeveloperName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)privacyURL
{
  return self->_privacyURL;
}

- (void)setPrivacyURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)hasEula
{
  return self->_hasEula;
}

- (void)setHasEula:(BOOL)a3
{
  self->_hasEula = a3;
}

- (NSString)eula
{
  return self->_eula;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eula, 0);
  objc_storeStrong((id *)&self->_privacyURL, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_appDeveloperName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
