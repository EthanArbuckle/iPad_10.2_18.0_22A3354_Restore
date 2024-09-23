@implementation DEDNotifierConfiguration

- (DEDNotifierConfiguration)initWithHostAppIdentifier:(id)a3 localizedNotificationTitle:(id)a4 localizedNotificationBody:(id)a5
{
  id v9;
  id v10;
  id v11;
  DEDNotifierConfiguration *v12;
  DEDNotifierConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DEDNotifierConfiguration;
  v12 = -[DEDNotifierConfiguration init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hostAppIdentifier, a3);
    objc_storeStrong((id *)&v13->_localizedNotificationTitle, a4);
    objc_storeStrong((id *)&v13->_localizedNotificationBody, a5);
  }

  return v13;
}

- (DEDNotifierConfiguration)initWithCoder:(id)a3
{
  id v4;
  DEDNotifierConfiguration *v5;
  uint64_t v6;
  NSString *hostAppIdentifier;
  uint64_t v8;
  NSString *localizedNotificationTitle;
  uint64_t v10;
  NSString *localizedNotificationBody;
  uint64_t v12;
  NSString *reviewActionLabel;
  uint64_t v14;
  NSString *sendActionLabel;
  uint64_t v16;
  NSString *followupUniqueIdentifier;
  double v18;
  uint64_t v19;
  NSURL *followupReviewActionURL;
  uint64_t v21;
  NSURL *followupSendActionURL;
  void *v23;
  uint64_t v24;
  NSDictionary *followupReviewActionUserInfo;
  void *v26;
  uint64_t v27;
  NSDictionary *followupSendActionUserInfo;
  uint64_t v29;
  NSString *followupLocalizedTitle;
  uint64_t v31;
  NSString *followupLocalizedInformativeText;
  uint64_t v33;
  NSString *followupExtensionIdentifier;
  uint64_t v35;
  NSURL *followupNotificationActionURL;
  uint64_t v37;
  NSString *followupNotificationActionTitle;
  uint64_t v39;
  NSString *followupNotificationBundlePath;
  uint64_t v41;
  NSString *followupNotificationBundleIconName;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)DEDNotifierConfiguration;
  v5 = -[DEDNotifierConfiguration init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostAppIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    hostAppIdentifier = v5->_hostAppIdentifier;
    v5->_hostAppIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedNotificationTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedNotificationTitle = v5->_localizedNotificationTitle;
    v5->_localizedNotificationTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedNotificationBody"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedNotificationBody = v5->_localizedNotificationBody;
    v5->_localizedNotificationBody = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reviewActionLabel"));
    v12 = objc_claimAutoreleasedReturnValue();
    reviewActionLabel = v5->_reviewActionLabel;
    v5->_reviewActionLabel = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendActionLabel"));
    v14 = objc_claimAutoreleasedReturnValue();
    sendActionLabel = v5->_sendActionLabel;
    v5->_sendActionLabel = (NSString *)v14;

    v5->_userNotificationShouldPlaySound = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userNotificationShouldPlaySound"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("followupUniqueIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    followupUniqueIdentifier = v5->_followupUniqueIdentifier;
    v5->_followupUniqueIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("followupFrequency"));
    v5->_followupFrequency = v18;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("followupReviewActionURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    followupReviewActionURL = v5->_followupReviewActionURL;
    v5->_followupReviewActionURL = (NSURL *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("followupSendActionURL"));
    v21 = objc_claimAutoreleasedReturnValue();
    followupSendActionURL = v5->_followupSendActionURL;
    v5->_followupSendActionURL = (NSURL *)v21;

    objc_msgSend((id)objc_opt_class(), "archivedClasses");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("followupReviewActionUserInfo"));
    v24 = objc_claimAutoreleasedReturnValue();
    followupReviewActionUserInfo = v5->_followupReviewActionUserInfo;
    v5->_followupReviewActionUserInfo = (NSDictionary *)v24;

    objc_msgSend((id)objc_opt_class(), "archivedClasses");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("followupSendActionUserInfo"));
    v27 = objc_claimAutoreleasedReturnValue();
    followupSendActionUserInfo = v5->_followupSendActionUserInfo;
    v5->_followupSendActionUserInfo = (NSDictionary *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("followupLocalizedTitle"));
    v29 = objc_claimAutoreleasedReturnValue();
    followupLocalizedTitle = v5->_followupLocalizedTitle;
    v5->_followupLocalizedTitle = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("followupLocalizedInformativeText"));
    v31 = objc_claimAutoreleasedReturnValue();
    followupLocalizedInformativeText = v5->_followupLocalizedInformativeText;
    v5->_followupLocalizedInformativeText = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("followupExtensionIdentifier"));
    v33 = objc_claimAutoreleasedReturnValue();
    followupExtensionIdentifier = v5->_followupExtensionIdentifier;
    v5->_followupExtensionIdentifier = (NSString *)v33;

    v5->_followupUseSpringboardNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("followupUseSpringboardNotification"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("followupNotificationActionURL"));
    v35 = objc_claimAutoreleasedReturnValue();
    followupNotificationActionURL = v5->_followupNotificationActionURL;
    v5->_followupNotificationActionURL = (NSURL *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("followupNotificationActionTitle"));
    v37 = objc_claimAutoreleasedReturnValue();
    followupNotificationActionTitle = v5->_followupNotificationActionTitle;
    v5->_followupNotificationActionTitle = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("followupNotificationBundlePath"));
    v39 = objc_claimAutoreleasedReturnValue();
    followupNotificationBundlePath = v5->_followupNotificationBundlePath;
    v5->_followupNotificationBundlePath = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("followupNotificationBundleIconName"));
    v41 = objc_claimAutoreleasedReturnValue();
    followupNotificationBundleIconName = v5->_followupNotificationBundleIconName;
    v5->_followupNotificationBundleIconName = (NSString *)v41;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[DEDNotifierConfiguration hostAppIdentifier](self, "hostAppIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("hostAppIdentifier"));

  -[DEDNotifierConfiguration localizedNotificationTitle](self, "localizedNotificationTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localizedNotificationTitle"));

  -[DEDNotifierConfiguration localizedNotificationBody](self, "localizedNotificationBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("localizedNotificationBody"));

  -[DEDNotifierConfiguration reviewActionLabel](self, "reviewActionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("reviewActionLabel"));

  -[DEDNotifierConfiguration sendActionLabel](self, "sendActionLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("sendActionLabel"));

  objc_msgSend(v4, "encodeBool:forKey:", -[DEDNotifierConfiguration userNotificationShouldPlaySound](self, "userNotificationShouldPlaySound"), CFSTR("userNotificationShouldPlaySound"));
  -[DEDNotifierConfiguration followupUniqueIdentifier](self, "followupUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("followupUniqueIdentifier"));

  -[DEDNotifierConfiguration followupFrequency](self, "followupFrequency");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("followupFrequency"));
  -[DEDNotifierConfiguration followupReviewActionURL](self, "followupReviewActionURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("followupReviewActionURL"));

  -[DEDNotifierConfiguration followupSendActionURL](self, "followupSendActionURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("followupSendActionURL"));

  -[DEDNotifierConfiguration followupLocalizedTitle](self, "followupLocalizedTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("followupLocalizedTitle"));

  -[DEDNotifierConfiguration followupLocalizedInformativeText](self, "followupLocalizedInformativeText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("followupLocalizedInformativeText"));

  -[DEDNotifierConfiguration followupExtensionIdentifier](self, "followupExtensionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("followupExtensionIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[DEDNotifierConfiguration followupUseSpringboardNotification](self, "followupUseSpringboardNotification"), CFSTR("followupUseSpringboardNotification"));
  -[DEDNotifierConfiguration followupNotificationActionURL](self, "followupNotificationActionURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("followupNotificationActionURL"));

  -[DEDNotifierConfiguration followupNotificationActionTitle](self, "followupNotificationActionTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("followupNotificationActionTitle"));

  -[DEDNotifierConfiguration followupNotificationBundlePath](self, "followupNotificationBundlePath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("followupNotificationBundlePath"));

  -[DEDNotifierConfiguration followupNotificationBundleIconName](self, "followupNotificationBundleIconName");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("followupNotificationBundleIconName"));

}

+ (id)archivedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[DEDNotifierConfiguration hostAppIdentifier](self, "hostAppIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostAppIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[DEDNotifierConfiguration localizedNotificationTitle](self, "localizedNotificationTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedNotificationTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[DEDNotifierConfiguration localizedNotificationBody](self, "localizedNotificationBody");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedNotificationBody");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {
          -[DEDNotifierConfiguration reviewActionLabel](self, "reviewActionLabel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "reviewActionLabel");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqualToString:"))
          {
            v46 = v10;
            -[DEDNotifierConfiguration sendActionLabel](self, "sendActionLabel");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "sendActionLabel");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v13;
            if (objc_msgSend(v13, "isEqualToString:"))
            {
              v45 = v12;
              v14 = -[DEDNotifierConfiguration userNotificationShouldPlaySound](self, "userNotificationShouldPlaySound");
              if (v14 == objc_msgSend(v5, "userNotificationShouldPlaySound"))
              {
                -[DEDNotifierConfiguration followupUniqueIdentifier](self, "followupUniqueIdentifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "followupUniqueIdentifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = v45;
                v44 = v16;
                if (objc_msgSend(v16, "isEqualToString:")
                  && (-[DEDNotifierConfiguration followupFrequency](self, "followupFrequency"),
                      v18 = v17,
                      objc_msgSend(v5, "followupFrequency"),
                      v18 == v19))
                {
                  -[DEDNotifierConfiguration followupReviewActionURL](self, "followupReviewActionURL");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "followupReviewActionURL");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = v20;
                  if (objc_msgSend(v20, "isEqual:"))
                  {
                    -[DEDNotifierConfiguration followupSendActionURL](self, "followupSendActionURL");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "followupSendActionURL");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = v21;
                    if (objc_msgSend(v21, "isEqual:"))
                    {
                      -[DEDNotifierConfiguration followupLocalizedTitle](self, "followupLocalizedTitle");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "followupLocalizedTitle");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v38, "isEqualToString:"))
                      {
                        -[DEDNotifierConfiguration followupLocalizedInformativeText](self, "followupLocalizedInformativeText");
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v5, "followupLocalizedInformativeText");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        v36 = v22;
                        if (objc_msgSend(v22, "isEqualToString:"))
                        {
                          v23 = -[DEDNotifierConfiguration followupUseSpringboardNotification](self, "followupUseSpringboardNotification");
                          if (v23 == objc_msgSend(v5, "followupUseSpringboardNotification"))
                          {
                            -[DEDNotifierConfiguration followupNotificationActionURL](self, "followupNotificationActionURL");
                            v24 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v5, "followupNotificationActionURL");
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v24, "isEqual:"))
                            {
                              -[DEDNotifierConfiguration followupNotificationActionTitle](self, "followupNotificationActionTitle");
                              v25 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v5, "followupNotificationActionTitle");
                              v32 = (void *)objc_claimAutoreleasedReturnValue();
                              v33 = v25;
                              if (objc_msgSend(v25, "isEqualToString:"))
                              {
                                -[DEDNotifierConfiguration followupNotificationBundlePath](self, "followupNotificationBundlePath");
                                v26 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v5, "followupNotificationBundlePath");
                                v30 = (void *)objc_claimAutoreleasedReturnValue();
                                v31 = v26;
                                if (objc_msgSend(v26, "isEqualToString:"))
                                {
                                  -[DEDNotifierConfiguration followupNotificationBundleIconName](self, "followupNotificationBundleIconName");
                                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v5, "followupNotificationBundleIconName");
                                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                                  v15 = objc_msgSend(v29, "isEqualToString:", v27);

                                }
                                else
                                {
                                  v15 = 0;
                                }

                              }
                              else
                              {
                                v15 = 0;
                              }

                            }
                            else
                            {
                              v15 = 0;
                            }

                          }
                          else
                          {
                            v15 = 0;
                          }
                          v12 = v45;
                        }
                        else
                        {
                          v15 = 0;
                        }
                        v10 = v46;

                      }
                      else
                      {
                        v15 = 0;
                        v10 = v46;
                      }

                    }
                    else
                    {
                      v15 = 0;
                      v10 = v46;
                    }

                  }
                  else
                  {
                    v15 = 0;
                    v10 = v46;
                  }

                }
                else
                {
                  v15 = 0;
                  v10 = v46;
                }

              }
              else
              {
                v15 = 0;
                v12 = v45;
                v10 = v46;
              }
            }
            else
            {
              v15 = 0;
              v10 = v46;
            }

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSString)hostAppIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHostAppIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)localizedNotificationTitle
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalizedNotificationTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)localizedNotificationBody
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalizedNotificationBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)reviewActionLabel
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReviewActionLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)sendActionLabel
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSendActionLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)userNotificationShouldPlaySound
{
  return self->_userNotificationShouldPlaySound;
}

- (void)setUserNotificationShouldPlaySound:(BOOL)a3
{
  self->_userNotificationShouldPlaySound = a3;
}

- (NSString)followupUniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFollowupUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (double)followupFrequency
{
  return self->_followupFrequency;
}

- (void)setFollowupFrequency:(double)a3
{
  self->_followupFrequency = a3;
}

- (NSURL)followupReviewActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFollowupReviewActionURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSURL)followupSendActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFollowupSendActionURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)followupReviewActionUserInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFollowupReviewActionUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDictionary)followupSendActionUserInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFollowupSendActionUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)followupLocalizedTitle
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFollowupLocalizedTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)followupLocalizedInformativeText
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFollowupLocalizedInformativeText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)followupExtensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFollowupExtensionIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)followupUseSpringboardNotification
{
  return self->_followupUseSpringboardNotification;
}

- (void)setFollowupUseSpringboardNotification:(BOOL)a3
{
  self->_followupUseSpringboardNotification = a3;
}

- (NSURL)followupNotificationActionURL
{
  return (NSURL *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFollowupNotificationActionURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)followupNotificationActionTitle
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFollowupNotificationActionTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)followupNotificationBundlePath
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFollowupNotificationBundlePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)followupNotificationBundleIconName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFollowupNotificationBundleIconName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followupNotificationBundleIconName, 0);
  objc_storeStrong((id *)&self->_followupNotificationBundlePath, 0);
  objc_storeStrong((id *)&self->_followupNotificationActionTitle, 0);
  objc_storeStrong((id *)&self->_followupNotificationActionURL, 0);
  objc_storeStrong((id *)&self->_followupExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_followupLocalizedInformativeText, 0);
  objc_storeStrong((id *)&self->_followupLocalizedTitle, 0);
  objc_storeStrong((id *)&self->_followupSendActionUserInfo, 0);
  objc_storeStrong((id *)&self->_followupReviewActionUserInfo, 0);
  objc_storeStrong((id *)&self->_followupSendActionURL, 0);
  objc_storeStrong((id *)&self->_followupReviewActionURL, 0);
  objc_storeStrong((id *)&self->_followupUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_sendActionLabel, 0);
  objc_storeStrong((id *)&self->_reviewActionLabel, 0);
  objc_storeStrong((id *)&self->_localizedNotificationBody, 0);
  objc_storeStrong((id *)&self->_localizedNotificationTitle, 0);
  objc_storeStrong((id *)&self->_hostAppIdentifier, 0);
}

@end
