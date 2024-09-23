@implementation FLHSA2LoginNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_informativeText, CFSTR("_informativeText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_codePrompt, CFSTR("_codePrompt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_footerText, CFSTR("_footerText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_approveButtonTitle, CFSTR("_approveButtonTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dismissButtonTitle, CFSTR("_dismissButtonTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleID, CFSTR("_appleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latitude, CFSTR("_latitude"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_longitude, CFSTR("_longitude"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceType, CFSTR("_deviceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceModel, CFSTR("_deviceModel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceColorString, CFSTR("_deviceColorString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pushMessageID, CFSTR("_pushMessageID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedDismissActions, CFSTR("_supportedDismissActions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userAllowedSignIn, CFSTR("_userAllowedSignIn"));

}

- (FLHSA2LoginNotification)initWithCoder:(id)a3
{
  id v4;
  FLHSA2LoginNotification *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *informativeText;
  uint64_t v10;
  NSString *codePrompt;
  uint64_t v12;
  NSString *footerText;
  uint64_t v14;
  NSString *approveButtonTitle;
  uint64_t v16;
  NSString *dismissButtonTitle;
  uint64_t v18;
  NSString *appleID;
  uint64_t v20;
  NSNumber *latitude;
  uint64_t v22;
  NSNumber *longitude;
  uint64_t v24;
  NSString *deviceType;
  uint64_t v26;
  NSString *deviceModel;
  uint64_t v28;
  NSString *deviceColorString;
  uint64_t v30;
  NSString *altDSID;
  uint64_t v32;
  NSString *pushMessageID;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSSet *supportedDismissActions;

  v4 = a3;
  v5 = -[FLHSA2LoginNotification init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_informativeText"));
    v8 = objc_claimAutoreleasedReturnValue();
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_codePrompt"));
    v10 = objc_claimAutoreleasedReturnValue();
    codePrompt = v5->_codePrompt;
    v5->_codePrompt = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_footerText"));
    v12 = objc_claimAutoreleasedReturnValue();
    footerText = v5->_footerText;
    v5->_footerText = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_approveButtonTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    approveButtonTitle = v5->_approveButtonTitle;
    v5->_approveButtonTitle = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dismissButtonTitle"));
    v16 = objc_claimAutoreleasedReturnValue();
    dismissButtonTitle = v5->_dismissButtonTitle;
    v5->_dismissButtonTitle = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appleID"));
    v18 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_latitude"));
    v20 = objc_claimAutoreleasedReturnValue();
    latitude = v5->_latitude;
    v5->_latitude = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_longitude"));
    v22 = objc_claimAutoreleasedReturnValue();
    longitude = v5->_longitude;
    v5->_longitude = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deviceType"));
    v24 = objc_claimAutoreleasedReturnValue();
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deviceModel"));
    v26 = objc_claimAutoreleasedReturnValue();
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deviceColorString"));
    v28 = objc_claimAutoreleasedReturnValue();
    deviceColorString = v5->_deviceColorString;
    v5->_deviceColorString = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v30 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pushMessageID"));
    v32 = objc_claimAutoreleasedReturnValue();
    pushMessageID = v5->_pushMessageID;
    v5->_pushMessageID = (NSString *)v32;

    v34 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("_supportedDismissActions"));
    v37 = objc_claimAutoreleasedReturnValue();
    supportedDismissActions = v5->_supportedDismissActions;
    v5->_supportedDismissActions = (NSSet *)v37;

    v5->_userAllowedSignIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_userAllowedSignIn"));
  }

  return v5;
}

- (FLHSA2LoginNotification)initWithFollowUpItemUserInfo:(id)a3
{
  id v4;
  FLHSA2LoginNotification *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *informativeText;
  uint64_t v10;
  NSString *codePrompt;
  uint64_t v12;
  NSString *footerText;
  uint64_t v14;
  NSString *approveButtonTitle;
  uint64_t v16;
  NSString *dismissButtonTitle;
  uint64_t v18;
  NSString *appleID;
  uint64_t v20;
  NSNumber *latitude;
  uint64_t v22;
  NSNumber *longitude;
  uint64_t v24;
  NSString *deviceType;
  uint64_t v26;
  NSString *deviceModel;
  uint64_t v28;
  NSString *deviceColorString;
  uint64_t v30;
  NSString *altDSID;
  uint64_t v32;
  NSString *pushMessageID;
  void *v34;

  v4 = a3;
  v5 = -[FLHSA2LoginNotification init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("informativeText"));
    v8 = objc_claimAutoreleasedReturnValue();
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("codePrompt"));
    v10 = objc_claimAutoreleasedReturnValue();
    codePrompt = v5->_codePrompt;
    v5->_codePrompt = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footerText"));
    v12 = objc_claimAutoreleasedReturnValue();
    footerText = v5->_footerText;
    v5->_footerText = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("approveButtonTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    approveButtonTitle = v5->_approveButtonTitle;
    v5->_approveButtonTitle = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dismissButtonTitle"));
    v16 = objc_claimAutoreleasedReturnValue();
    dismissButtonTitle = v5->_dismissButtonTitle;
    v5->_dismissButtonTitle = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleID"));
    v18 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latitude"));
    v20 = objc_claimAutoreleasedReturnValue();
    latitude = v5->_latitude;
    v5->_latitude = (NSNumber *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longitude"));
    v22 = objc_claimAutoreleasedReturnValue();
    longitude = v5->_longitude;
    v5->_longitude = (NSNumber *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v24 = objc_claimAutoreleasedReturnValue();
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceModel"));
    v26 = objc_claimAutoreleasedReturnValue();
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceColorString"));
    v28 = objc_claimAutoreleasedReturnValue();
    deviceColorString = v5->_deviceColorString;
    v5->_deviceColorString = (NSString *)v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("altDSID"));
    v30 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v30;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pushMessageID"));
    v32 = objc_claimAutoreleasedReturnValue();
    pushMessageID = v5->_pushMessageID;
    v5->_pushMessageID = (NSString *)v32;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAllowedSignIn"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_userAllowedSignIn = objc_msgSend(v34, "BOOLValue");

  }
  return v5;
}

- (id)followUpItemUserInfo
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("FLHSA2LoginNotification"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_title, CFSTR("title"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_informativeText, CFSTR("informativeText"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_codePrompt, CFSTR("codePrompt"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_footerText, CFSTR("footerText"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_approveButtonTitle, CFSTR("approveButtonTitle"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_dismissButtonTitle, CFSTR("dismissButtonTitle"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appleID, CFSTR("appleID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_latitude, CFSTR("latitude"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_longitude, CFSTR("longitude"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceModel, CFSTR("deviceModel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceColorString, CFSTR("deviceColorString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_pushMessageID, CFSTR("pushMessageID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userAllowedSignIn);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("userAllowedSignIn"));

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)codePrompt
{
  return self->_codePrompt;
}

- (void)setCodePrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)approveButtonTitle
{
  return self->_approveButtonTitle;
}

- (void)setApproveButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)dismissButtonTitle
{
  return self->_dismissButtonTitle;
}

- (void)setDismissButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSSet)supportedDismissActions
{
  return self->_supportedDismissActions;
}

- (void)setSupportedDismissActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)deviceColorString
{
  return self->_deviceColorString;
}

- (void)setDeviceColorString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)pushMessageID
{
  return self->_pushMessageID;
}

- (void)setPushMessageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)userAllowedSignIn
{
  return self->_userAllowedSignIn;
}

- (void)setUserAllowedSignIn:(BOOL)a3
{
  self->_userAllowedSignIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushMessageID, 0);
  objc_storeStrong((id *)&self->_deviceColorString, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_supportedDismissActions, 0);
  objc_storeStrong((id *)&self->_dismissButtonTitle, 0);
  objc_storeStrong((id *)&self->_approveButtonTitle, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_codePrompt, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
