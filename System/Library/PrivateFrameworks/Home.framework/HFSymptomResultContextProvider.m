@implementation HFSymptomResultContextProvider

- (HFSymptomResultContextProvider)initWithAccessory:(id)a3 mediaSystem:(id)a4
{
  id v7;
  id v8;
  HFSymptomResultContextProvider *v9;
  HFSymptomResultContextProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFSymptomResultContextProvider;
  v9 = -[HFSymptomResultContextProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_mediaSystem, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSystem, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (HFSymptomResultContextProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessory_mediaSystem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFErrorResultComponent.m"), 579, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSymptomResultContextProvider init]",
    v5);

  return 0;
}

- (NSUUID)accessoryUUID
{
  void *v2;
  void *v3;

  -[HFSymptomResultContextProvider accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSString)accessoryName
{
  void *v2;
  void *v3;

  -[HFSymptomResultContextProvider accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)accessoryCategory
{
  void *v2;
  void *v3;
  void *v4;

  -[HFSymptomResultContextProvider accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)homeKitObjectName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HFSymptomResultContextProvider mediaSystem](self, "mediaSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[HFSymptomResultContextProvider accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)currentDeviceNetworkSSID
{
  return (NSString *)+[HFUtilities networkSSID](HFUtilities, "networkSSID");
}

- (NSString)accessoryNetworkSSID
{
  void *v2;
  void *v3;
  void *v4;

  -[HFSymptomResultContextProvider accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wifiNetworkInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)currentUserID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HFSymptomResultContextProvider accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)currentAppleMusicAccountName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HFSymptomResultContextProvider accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_appleMusicCurrentLoggedInAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)shouldDisplayManualFixOptionForSymptom:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[HFSymptomResultContextProvider accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "type");

  LOBYTE(v4) = objc_msgSend(v5, "hf_shouldDisplayManualFixOptionForSymptom:", v6);
  return (char)v4;
}

- (NSString)detailedErrorDescriptionForiCloudSymptom
{
  void *v3;
  int v4;
  __CFString *v5;
  void *v6;
  int v7;

  -[HFSymptomResultContextProvider accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isHomePod");

  if (v4)
  {
    v5 = CFSTR("HFSymptomLongDescriptionNeediCloudCredential_HomePod");
  }
  else
  {
    -[HFSymptomResultContextProvider accessory](self, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hf_isAppleTV");

    if (v7)
      v5 = CFSTR("HFSymptomLongDescriptionNeediCloudCredential_AppleTV");
    else
      v5 = CFSTR("HFSymptomLongDescriptionNeediCloudCredential_Accessory");
  }
  _HFLocalizedStringWithDefaultValue(v5, v5, 1);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)fixStateForSymptom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  +[HFSymptomFixManager sharedManager](HFSymptomFixManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSymptomResultContextProvider accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fixStateForSymptom:accessory:", v4, v6);

  return v7;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMMediaSystem)mediaSystem
{
  return self->_mediaSystem;
}

@end
