@implementation DMCPayloadViewModel

+ (id)accountPayloadClasses
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)accountPayloadClasses_accountPayloadClasses;
  if (!accountPayloadClasses_accountPayloadClasses)
  {
    v6[0] = objc_opt_class();
    v6[1] = objc_opt_class();
    v6[2] = objc_opt_class();
    v6[3] = objc_opt_class();
    v6[4] = objc_opt_class();
    v6[5] = objc_opt_class();
    v6[6] = objc_opt_class();
    v6[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)accountPayloadClasses_accountPayloadClasses;
    accountPayloadClasses_accountPayloadClasses = v3;

    v2 = (void *)accountPayloadClasses_accountPayloadClasses;
  }
  return v2;
}

+ (id)managedAppClasses
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)managedAppClasses_managedAppPayloadClasses;
  if (!managedAppClasses_managedAppPayloadClasses)
  {
    v6[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)managedAppClasses_managedAppPayloadClasses;
    managedAppClasses_managedAppPayloadClasses = v3;

    v2 = (void *)managedAppClasses_managedAppPayloadClasses;
  }
  return v2;
}

+ (id)managedBookClasses
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)managedBookClasses_managedBookPayloadClasses;
  if (!managedBookClasses_managedBookPayloadClasses)
  {
    v6[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)managedBookClasses_managedBookPayloadClasses;
    managedBookClasses_managedBookPayloadClasses = v3;

    v2 = (void *)managedBookClasses_managedBookPayloadClasses;
  }
  return v2;
}

+ (id)restrictionPayloadClasses
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)restrictionPayloadClasses_restrictionPayloadClasses;
  if (!restrictionPayloadClasses_restrictionPayloadClasses)
  {
    v6[0] = objc_opt_class();
    v6[1] = objc_opt_class();
    v6[2] = objc_opt_class();
    v6[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)restrictionPayloadClasses_restrictionPayloadClasses;
    restrictionPayloadClasses_restrictionPayloadClasses = v3;

    v2 = (void *)restrictionPayloadClasses_restrictionPayloadClasses;
  }
  return v2;
}

+ (int64_t)payloadTypeForPayloadClass:(Class)a3
{
  void *v4;
  char v5;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  +[DMCPayloadViewModel accountPayloadClasses](DMCPayloadViewModel, "accountPayloadClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", a3);

  if ((v5 & 1) != 0)
    return 1;
  +[DMCPayloadViewModel managedAppClasses](DMCPayloadViewModel, "managedAppClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", a3);

  if ((v8 & 1) != 0)
    return 2;
  +[DMCPayloadViewModel managedBookClasses](DMCPayloadViewModel, "managedBookClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", a3);

  if ((v10 & 1) != 0)
    return 3;
  +[DMCPayloadViewModel restrictionPayloadClasses](DMCPayloadViewModel, "restrictionPayloadClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", a3);

  if (v12)
    return 4;
  else
    return 5;
}

+ (id)payloadViewModelsFromPayload:(id)a3
{
  id v3;
  void *v4;
  DMCPayloadViewModel *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  DMCPayloadViewModel *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (DMCPayloadViewModel *)v3;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[DMCPayloadViewModel localizedRestrictionStrings](v5, "localizedRestrictionStrings", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
            v12 = -[DMCPayloadViewModel initWithPayload:]([DMCPayloadViewModel alloc], "initWithPayload:", v5);
            -[DMCPayloadViewModel setTitle:](v12, "setTitle:", v11);
            -[DMCPayloadViewModel setSubtitle1Label:](v12, "setSubtitle1Label:", 0);
            -[DMCPayloadViewModel setSubtitle1Description:](v12, "setSubtitle1Description:", 0);
            -[DMCPayloadViewModel setShowIcon:](v12, "setShowIcon:", 0);
            objc_msgSend(v4, "addObject:", v12);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v8);
      }

    }
    else
    {
      v5 = -[DMCPayloadViewModel initWithPayload:]([DMCPayloadViewModel alloc], "initWithPayload:", v3);
      objc_msgSend(v4, "addObject:", v5);
    }

    v13 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)removeDuplicatesFromRestrictionPayloadViewModels:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "title", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (DMCPayloadViewModel)initWithManagedApp:(id)a3
{
  id v5;
  DMCPayloadViewModel *v6;
  uint64_t v7;
  NSString *title;
  uint64_t v9;
  NSString *localizedSingularForm;
  uint64_t v11;
  NSString *localizedPluralForm;
  NSArray *typeStrings;
  NSArray *payloadDescriptionKeyValueSections;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMCPayloadViewModel;
  v6 = -[DMCPayloadViewModel init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "bundleID");
    v7 = objc_claimAutoreleasedReturnValue();
    title = v6->_title;
    v6->_title = (NSString *)v7;

    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APPS_SINGULAR"));
    v9 = objc_claimAutoreleasedReturnValue();
    localizedSingularForm = v6->_localizedSingularForm;
    v6->_localizedSingularForm = (NSString *)v9;

    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APPS_PLURAL"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedPluralForm = v6->_localizedPluralForm;
    v6->_localizedPluralForm = (NSString *)v11;

    typeStrings = v6->_typeStrings;
    v6->_typeStrings = (NSArray *)&unk_24D548768;

    payloadDescriptionKeyValueSections = v6->_payloadDescriptionKeyValueSections;
    v6->_payloadDescriptionKeyValueSections = 0;

    v6->_showIcon = 1;
    objc_storeStrong((id *)&v6->_managedApp, a3);
    v6->_isManagedAppPayload = 1;
    v6->_hasDetails = 1;
  }

  return v6;
}

- (DMCPayloadViewModel)initWithManagedBook:(id)a3
{
  id v5;
  DMCPayloadViewModel *v6;
  uint64_t v7;
  NSString *title;
  uint64_t v9;
  NSString *localizedSingularForm;
  uint64_t v11;
  NSString *localizedPluralForm;
  NSArray *typeStrings;
  NSArray *payloadDescriptionKeyValueSections;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMCPayloadViewModel;
  v6 = -[DMCPayloadViewModel init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "friendlyName");
    v7 = objc_claimAutoreleasedReturnValue();
    title = v6->_title;
    v6->_title = (NSString *)v7;

    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_BOOKS_SINGULAR"));
    v9 = objc_claimAutoreleasedReturnValue();
    localizedSingularForm = v6->_localizedSingularForm;
    v6->_localizedSingularForm = (NSString *)v9;

    DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_APPS_PLURAL"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedPluralForm = v6->_localizedPluralForm;
    v6->_localizedPluralForm = (NSString *)v11;

    typeStrings = v6->_typeStrings;
    v6->_typeStrings = (NSArray *)&unk_24D548780;

    payloadDescriptionKeyValueSections = v6->_payloadDescriptionKeyValueSections;
    v6->_payloadDescriptionKeyValueSections = 0;

    v6->_showIcon = 1;
    objc_storeStrong((id *)&v6->_managedBook, a3);
    v6->_isManagedBookPayload = 1;
    v6->_hasDetails = 1;
  }

  return v6;
}

- (DMCPayloadViewModel)initWithPayload:(id)a3
{
  id v4;
  DMCPayloadViewModel *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *localizedSingularForm;
  uint64_t v10;
  NSString *localizedPluralForm;
  uint64_t v12;
  NSArray *typeStrings;
  uint64_t v14;
  NSArray *payloadDescriptionKeyValueSections;
  uint64_t v16;
  NSString *friendlyName;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *subtitle1Label;
  uint64_t v22;
  NSString *subtitle1Description;
  uint64_t v24;
  NSString *subtitle2Label;
  uint64_t v26;
  NSString *subtitle2Description;
  uint64_t v28;
  const void *v29;
  void *v30;
  const void *v31;
  uint64_t v32;
  NSDate *certificateExpirationDate;
  NSArray *v34;
  BOOL v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DMCPayloadViewModel;
  v5 = -[DMCPayloadViewModel init](&v37, sel_init);
  if (v5)
  {
    v5->_type = +[DMCPayloadViewModel payloadTypeForPayloadClass:](DMCPayloadViewModel, "payloadTypeForPayloadClass:", objc_opt_class());
    objc_msgSend(v4, "title");
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend((id)objc_opt_class(), "localizedSingularForm");
    v8 = objc_claimAutoreleasedReturnValue();
    localizedSingularForm = v5->_localizedSingularForm;
    v5->_localizedSingularForm = (NSString *)v8;

    objc_msgSend((id)objc_opt_class(), "localizedPluralForm");
    v10 = objc_claimAutoreleasedReturnValue();
    localizedPluralForm = v5->_localizedPluralForm;
    v5->_localizedPluralForm = (NSString *)v10;

    objc_msgSend((id)objc_opt_class(), "typeStrings");
    v12 = objc_claimAutoreleasedReturnValue();
    typeStrings = v5->_typeStrings;
    v5->_typeStrings = (NSArray *)v12;

    objc_msgSend(v4, "payloadDescriptionKeyValueSections");
    v14 = objc_claimAutoreleasedReturnValue();
    payloadDescriptionKeyValueSections = v5->_payloadDescriptionKeyValueSections;
    v5->_payloadDescriptionKeyValueSections = (NSArray *)v14;

    objc_msgSend(v4, "friendlyName");
    v16 = objc_claimAutoreleasedReturnValue();
    friendlyName = v5->_friendlyName;
    v5->_friendlyName = (NSString *)v16;

    objc_msgSend(v4, "title");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v5->_title;
    v5->_title = (NSString *)v18;

    objc_msgSend(v4, "subtitle1Label");
    v20 = objc_claimAutoreleasedReturnValue();
    subtitle1Label = v5->_subtitle1Label;
    v5->_subtitle1Label = (NSString *)v20;

    objc_msgSend(v4, "subtitle1Description");
    v22 = objc_claimAutoreleasedReturnValue();
    subtitle1Description = v5->_subtitle1Description;
    v5->_subtitle1Description = (NSString *)v22;

    objc_msgSend(v4, "subtitle2Label");
    v24 = objc_claimAutoreleasedReturnValue();
    subtitle2Label = v5->_subtitle2Label;
    v5->_subtitle2Label = (NSString *)v24;

    objc_msgSend(v4, "subtitle2Description");
    v26 = objc_claimAutoreleasedReturnValue();
    subtitle2Description = v5->_subtitle2Description;
    v5->_subtitle2Description = (NSString *)v26;

    objc_opt_class();
    v5->_isCertificate = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    v5->_isManagedAppPayload = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    v5->_isManagedBookPayload = objc_opt_isKindOfClass() & 1;
    if (v5->_isCertificate || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v28 = objc_msgSend(v4, "copyCertificate");
      if (v28)
      {
        v29 = (const void *)v28;
        v30 = (void *)SecCertificateCopyProperties();
        if (v30)
        {
          v31 = v30;
          objc_storeStrong((id *)&v5->_certificateProperties, v30);
          CFRelease(v31);
        }
        SecCertificateNotValidAfter();
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:");
        v32 = objc_claimAutoreleasedReturnValue();
        certificateExpirationDate = v5->_certificateExpirationDate;
        v5->_certificateExpirationDate = (NSDate *)v32;

        CFRelease(v29);
      }
    }
    v5->_showIcon = 1;
    v34 = v5->_payloadDescriptionKeyValueSections;
    v35 = v34 && -[NSArray count](v34, "count")
       || v5->_isManagedAppPayload
       || v5->_isManagedBookPayload
       || v5->_certificateProperties != 0;
    v5->_hasDetails = v35;
  }

  return v5;
}

- (id)_sendableCertificateProperties
{
  return +[DMCCertificateProperties sendablePropertiesFromProperties:](DMCCertificateProperties, "sendablePropertiesFromProperties:", self->_certificateProperties);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v4 = a3;
  -[DMCPayloadViewModel typeStrings](self, "typeStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("typeStrings"));

  -[DMCPayloadViewModel localizedSingularForm](self, "localizedSingularForm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localizedSingularForm"));

  -[DMCPayloadViewModel localizedPluralForm](self, "localizedPluralForm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("localizedPluralForm"));

  -[DMCPayloadViewModel payloadDescriptionKeyValueSections](self, "payloadDescriptionKeyValueSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("payloadDescriptionKeyValueSections"));

  -[DMCPayloadViewModel friendlyName](self, "friendlyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("friendlyName"));

  -[DMCPayloadViewModel title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("title"));

  -[DMCPayloadViewModel subtitle1Label](self, "subtitle1Label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("subtitle1Label"));

  -[DMCPayloadViewModel subtitle1Description](self, "subtitle1Description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("subtitle1Description"));

  -[DMCPayloadViewModel subtitle2Label](self, "subtitle2Label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("subtitle2Label"));

  -[DMCPayloadViewModel subtitle2Description](self, "subtitle2Description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("subtitle2Description"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DMCPayloadViewModel showIcon](self, "showIcon"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("showIcon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DMCPayloadViewModel hasDetails](self, "hasDetails"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("hasDetails"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DMCPayloadViewModel isCertificate](self, "isCertificate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("isCertificate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DMCPayloadViewModel isManagedAppPayload](self, "isManagedAppPayload"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("isManagedAppPayload"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DMCPayloadViewModel isManagedBookPayload](self, "isManagedBookPayload"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("isManagedBookPayload"));

  -[DMCPayloadViewModel managedApp](self, "managedApp");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("managedApp"));

  -[DMCPayloadViewModel managedBook](self, "managedBook");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("managedBook"));

  -[DMCPayloadViewModel certificateExpirationDate](self, "certificateExpirationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("certificateExpirationDate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DMCPayloadViewModel type](self, "type"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("type"));

  -[DMCPayloadViewModel _sendableCertificateProperties](self, "_sendableCertificateProperties");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("certificateProperties"));

}

- (DMCPayloadViewModel)initWithCoder:(id)a3
{
  id v4;
  DMCPayloadViewModel *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *typeStrings;
  void *v11;
  uint64_t v12;
  NSString *localizedSingularForm;
  void *v14;
  uint64_t v15;
  NSString *localizedPluralForm;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *payloadDescriptionKeyValueSections;
  void *v22;
  uint64_t v23;
  NSString *friendlyName;
  void *v25;
  uint64_t v26;
  NSString *title;
  void *v28;
  uint64_t v29;
  NSString *subtitle1Label;
  void *v31;
  uint64_t v32;
  NSString *subtitle1Description;
  void *v34;
  uint64_t v35;
  NSString *subtitle2Label;
  void *v37;
  uint64_t v38;
  NSString *subtitle2Description;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  DMCApplicationProxy *managedApp;
  void *v48;
  uint64_t v49;
  MDMBook *managedBook;
  void *v51;
  uint64_t v52;
  NSDate *certificateExpirationDate;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSArray *certificateProperties;
  NSObject *v66;
  NSArray *v67;
  NSArray *v68;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  objc_super v73;
  uint8_t buf[4];
  NSArray *v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)DMCPayloadViewModel;
  v5 = -[DMCPayloadViewModel init](&v73, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("typeStrings"));
    v9 = objc_claimAutoreleasedReturnValue();
    typeStrings = v5->_typeStrings;
    v5->_typeStrings = (NSArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("localizedSingularForm"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedSingularForm = v5->_localizedSingularForm;
    v5->_localizedSingularForm = (NSString *)v12;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("localizedPluralForm"));
    v15 = objc_claimAutoreleasedReturnValue();
    localizedPluralForm = v5->_localizedPluralForm;
    v5->_localizedPluralForm = (NSString *)v15;

    v17 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("payloadDescriptionKeyValueSections"));
    v20 = objc_claimAutoreleasedReturnValue();
    payloadDescriptionKeyValueSections = v5->_payloadDescriptionKeyValueSections;
    v5->_payloadDescriptionKeyValueSections = (NSArray *)v20;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("friendlyName"));
    v23 = objc_claimAutoreleasedReturnValue();
    friendlyName = v5->_friendlyName;
    v5->_friendlyName = (NSString *)v23;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("title"));
    v26 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v26;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("subtitle1Label"));
    v29 = objc_claimAutoreleasedReturnValue();
    subtitle1Label = v5->_subtitle1Label;
    v5->_subtitle1Label = (NSString *)v29;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("subtitle1Description"));
    v32 = objc_claimAutoreleasedReturnValue();
    subtitle1Description = v5->_subtitle1Description;
    v5->_subtitle1Description = (NSString *)v32;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("subtitle2Label"));
    v35 = objc_claimAutoreleasedReturnValue();
    subtitle2Label = v5->_subtitle2Label;
    v5->_subtitle2Label = (NSString *)v35;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("subtitle2Description"));
    v38 = objc_claimAutoreleasedReturnValue();
    subtitle2Description = v5->_subtitle2Description;
    v5->_subtitle2Description = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("showIcon"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_showIcon = objc_msgSend(v40, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasDetails"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasDetails = objc_msgSend(v41, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isCertificate"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isCertificate = objc_msgSend(v42, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isManagedAppPayload"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isManagedAppPayload = objc_msgSend(v43, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isManagedBookPayload"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isManagedBookPayload = objc_msgSend(v44, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("managedApp"));
    v46 = objc_claimAutoreleasedReturnValue();
    managedApp = v5->_managedApp;
    v5->_managedApp = (DMCApplicationProxy *)v46;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("managedBook"));
    v49 = objc_claimAutoreleasedReturnValue();
    managedBook = v5->_managedBook;
    v5->_managedBook = (MDMBook *)v49;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v51, CFSTR("certificateExpirationDate"));
    v52 = objc_claimAutoreleasedReturnValue();
    certificateExpirationDate = v5->_certificateExpirationDate;
    v5->_certificateExpirationDate = (NSDate *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v54, "integerValue");

    v72 = (void *)MEMORY[0x24BDBCF20];
    v71 = objc_opt_class();
    v70 = objc_opt_class();
    v55 = objc_opt_class();
    v56 = objc_opt_class();
    v57 = objc_opt_class();
    v58 = objc_opt_class();
    v59 = objc_opt_class();
    v60 = objc_opt_class();
    v61 = objc_opt_class();
    v62 = objc_opt_class();
    objc_msgSend(v72, "setWithObjects:", v71, v70, v55, v56, v57, v58, v59, v60, v61, v62, objc_opt_class(), 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v63, CFSTR("certificateProperties"));
    v64 = objc_claimAutoreleasedReturnValue();
    certificateProperties = v5->_certificateProperties;
    v5->_certificateProperties = (NSArray *)v64;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v66 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v67 = v5->_certificateProperties;
        *(_DWORD *)buf = 138543362;
        v75 = v67;
        _os_log_impl(&dword_216358000, v66, OS_LOG_TYPE_ERROR, "DMCPayloadViewModel decoder encountered invalid certificateProperties array: %{public}@", buf, 0xCu);
      }
      v68 = v5->_certificateProperties;
      v5->_certificateProperties = (NSArray *)MEMORY[0x24BDBD1A8];

    }
  }

  return v5;
}

- (NSArray)typeStrings
{
  return self->_typeStrings;
}

- (void)setTypeStrings:(id)a3
{
  objc_storeStrong((id *)&self->_typeStrings, a3);
}

- (NSString)localizedSingularForm
{
  return self->_localizedSingularForm;
}

- (void)setLocalizedSingularForm:(id)a3
{
  objc_storeStrong((id *)&self->_localizedSingularForm, a3);
}

- (NSString)localizedPluralForm
{
  return self->_localizedPluralForm;
}

- (void)setLocalizedPluralForm:(id)a3
{
  objc_storeStrong((id *)&self->_localizedPluralForm, a3);
}

- (NSArray)payloadDescriptionKeyValueSections
{
  return self->_payloadDescriptionKeyValueSections;
}

- (void)setPayloadDescriptionKeyValueSections:(id)a3
{
  objc_storeStrong((id *)&self->_payloadDescriptionKeyValueSections, a3);
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (void)setFriendlyName:(id)a3
{
  objc_storeStrong((id *)&self->_friendlyName, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle1Label
{
  return self->_subtitle1Label;
}

- (void)setSubtitle1Label:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle1Label, a3);
}

- (NSString)subtitle1Description
{
  return self->_subtitle1Description;
}

- (void)setSubtitle1Description:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle1Description, a3);
}

- (NSString)subtitle2Label
{
  return self->_subtitle2Label;
}

- (void)setSubtitle2Label:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle2Label, a3);
}

- (NSString)subtitle2Description
{
  return self->_subtitle2Description;
}

- (void)setSubtitle2Description:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle2Description, a3);
}

- (BOOL)showIcon
{
  return self->_showIcon;
}

- (void)setShowIcon:(BOOL)a3
{
  self->_showIcon = a3;
}

- (BOOL)hasDetails
{
  return self->_hasDetails;
}

- (void)setHasDetails:(BOOL)a3
{
  self->_hasDetails = a3;
}

- (BOOL)isCertificate
{
  return self->_isCertificate;
}

- (void)setIsCertificate:(BOOL)a3
{
  self->_isCertificate = a3;
}

- (BOOL)isManagedAppPayload
{
  return self->_isManagedAppPayload;
}

- (void)setIsManagedAppPayload:(BOOL)a3
{
  self->_isManagedAppPayload = a3;
}

- (BOOL)isManagedBookPayload
{
  return self->_isManagedBookPayload;
}

- (void)setIsManagedBookPayload:(BOOL)a3
{
  self->_isManagedBookPayload = a3;
}

- (DMCApplicationProxy)managedApp
{
  return self->_managedApp;
}

- (void)setManagedApp:(id)a3
{
  objc_storeStrong((id *)&self->_managedApp, a3);
}

- (MDMBook)managedBook
{
  return self->_managedBook;
}

- (void)setManagedBook:(id)a3
{
  objc_storeStrong((id *)&self->_managedBook, a3);
}

- (NSArray)certificateProperties
{
  return self->_certificateProperties;
}

- (void)setCertificateProperties:(id)a3
{
  objc_storeStrong((id *)&self->_certificateProperties, a3);
}

- (NSDate)certificateExpirationDate
{
  return self->_certificateExpirationDate;
}

- (void)setCertificateExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_certificateExpirationDate, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateExpirationDate, 0);
  objc_storeStrong((id *)&self->_certificateProperties, 0);
  objc_storeStrong((id *)&self->_managedBook, 0);
  objc_storeStrong((id *)&self->_managedApp, 0);
  objc_storeStrong((id *)&self->_subtitle2Description, 0);
  objc_storeStrong((id *)&self->_subtitle2Label, 0);
  objc_storeStrong((id *)&self->_subtitle1Description, 0);
  objc_storeStrong((id *)&self->_subtitle1Label, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_payloadDescriptionKeyValueSections, 0);
  objc_storeStrong((id *)&self->_localizedPluralForm, 0);
  objc_storeStrong((id *)&self->_localizedSingularForm, 0);
  objc_storeStrong((id *)&self->_typeStrings, 0);
}

@end
