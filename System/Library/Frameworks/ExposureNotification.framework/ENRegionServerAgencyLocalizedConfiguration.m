@implementation ENRegionServerAgencyLocalizedConfiguration

- (ENRegionServerAgencyLocalizedConfiguration)initWithRegion:(id)a3
{
  id v5;
  ENRegionServerAgencyLocalizedConfiguration *v6;
  ENRegionServerAgencyLocalizedConfiguration *v7;
  uint64_t v8;
  NSLocale *locale;
  NSString *agencyMessage;
  NSString *displayName;
  NSString *regionName;
  ENRegionServerAgencyLocalizedConfiguration *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ENRegionServerAgencyLocalizedConfiguration;
  v6 = -[ENRegionServerAgencyLocalizedConfiguration init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_region, a3);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v8 = objc_claimAutoreleasedReturnValue();
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v8;

    agencyMessage = v7->_agencyMessage;
    v7->_agencyMessage = (NSString *)&stru_24C38BCC8;

    displayName = v7->_displayName;
    v7->_displayName = (NSString *)&stru_24C38BCC8;

    regionName = v7->_regionName;
    v7->_regionName = (NSString *)&stru_24C38BCC8;

    v13 = v7;
  }

  return v7;
}

- (id)notificationConfigurationForName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ENRegionServerAgencyLocalizedConfiguration notificationConfigurations](self, "notificationConfigurations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "classificationName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)getLocalizedAgencyConfiguration:(id *)a3 region:(id)a4 fromDictionary:(id)a5 locale:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  id v22;
  unsigned __int8 v23;
  void *v24;
  unsigned int v25;
  id v26;
  ENRegionServerAgencyLocalizedConfiguration *v27;
  NSString *onboardingNotificationBody;
  NSString *revokedNotificationBody;
  NSString *v30;
  NSString *revokedNotificationSubject;
  NSString *v32;
  NSString *phaTelemetryOptInMessage;
  NSString *v34;
  uint64_t v35;
  NSArray *notificationConfigurations;
  ENRegionServerAgencyLocalizedConfiguration *v37;
  NSString *v39;
  NSString *v40;
  NSString *v41;
  id *v42;
  id v43;
  void *v44;
  id v45;
  id obj;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NSDictionaryGetNSNumber();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = 0;
    if (v11 && v12)
    {
      obj = a6;
      objc_msgSend(v11, "localeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uppercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __107__ENRegionServerAgencyLocalizedConfiguration_getLocalizedAgencyConfiguration_region_fromDictionary_locale___block_invoke;
      v60[3] = &unk_24C38B1E0;
      v17 = v16;
      v61 = v17;
      v18 = v10;
      v62 = v18;
      v63 = v13;
      v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD2F464](v60);
      ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("testVerificationIntroMessage"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("testVerificationNotificationBody"));
      v57 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("selfReportIntroMessage"));
      v56 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("selfReportNotificationBody"));
      v55 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("symptomsOnsetDescription"));
      v54 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("agencyMessage"));
      v53 = (id)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("agencyTurndownMessage"));
        v52 = (id)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("traveledQuestionText"));
        v51 = (id)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("vaccinationQuestionText"));
        v50 = (id)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("vaccinationQuestionTextAlt"));
        v49 = (id)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("agencyDisplayName"));
        v48 = (id)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          v47 = v9;
          ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("legalConsentText"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("agencyRegionName"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v21 != 0;
          if (v21)
          {
            v42 = a3;
            v43 = v17;
            v44 = v13;
            v45 = v10;
            ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("revokedNotificationBody"));
            v39 = (NSString *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("revokedNotificationSubject"));
            v40 = (NSString *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, const __CFString *))v19)[2](v19, CFSTR("telemetryOptInMessage"));
            v41 = (NSString *)objc_claimAutoreleasedReturnValue();
            v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v23 = 1;
            do
            {
              v24 = (void *)MEMORY[0x20BD2F320]();
              v59 = 0;
              v25 = v23;
              +[ENRegionServerAgencyExposureNotificationConfiguration getNotificationConfiguration:fromDictionary:locale:index:](ENRegionServerAgencyExposureNotificationConfiguration, "getNotificationConfiguration:fromDictionary:locale:index:", &v59, v18, v11, v23);
              v26 = v59;
              objc_autoreleasePoolPop(v24);
              if (v26)
                objc_msgSend(v22, "addObject:", v26);

              ++v23;
            }
            while (v25 < 4);
            v27 = -[ENRegionServerAgencyLocalizedConfiguration initWithRegion:]([ENRegionServerAgencyLocalizedConfiguration alloc], "initWithRegion:", v47);
            objc_storeStrong((id *)&v27->_locale, obj);
            objc_storeStrong((id *)&v27->_testVerificationIntroMessage, v58);
            objc_storeStrong((id *)&v27->_testVerificationNotificationBody, v57);
            objc_storeStrong((id *)&v27->_selfReportIntroMessage, v56);
            objc_storeStrong((id *)&v27->_selfReportNotificationBody, v55);
            objc_storeStrong((id *)&v27->_symptomsOnsetDescription, v54);
            objc_storeStrong((id *)&v27->_agencyMessage, v53);
            objc_storeStrong((id *)&v27->_agencyTurndownMessage, v52);
            objc_storeStrong((id *)&v27->_traveledQuestionText, v51);
            objc_storeStrong((id *)&v27->_vaccinationQuestionText, v50);
            objc_storeStrong((id *)&v27->_vaccinationQuestionTextAlt, v49);
            objc_storeStrong((id *)&v27->_displayName, v48);
            objc_storeStrong((id *)&v27->_legalConsentText, v20);
            onboardingNotificationBody = v27->_onboardingNotificationBody;
            v27->_onboardingNotificationBody = (NSString *)&stru_24C38BCC8;

            objc_storeStrong((id *)&v27->_regionName, v21);
            revokedNotificationBody = v27->_revokedNotificationBody;
            v27->_revokedNotificationBody = v39;
            v30 = v39;

            revokedNotificationSubject = v27->_revokedNotificationSubject;
            v27->_revokedNotificationSubject = v40;
            v32 = v40;

            phaTelemetryOptInMessage = v27->_phaTelemetryOptInMessage;
            v27->_phaTelemetryOptInMessage = v41;
            v34 = v41;

            v35 = objc_msgSend(v22, "copy");
            notificationConfigurations = v27->_notificationConfigurations;
            v27->_notificationConfigurations = (NSArray *)v35;

            v37 = objc_retainAutorelease(v27);
            *v42 = v37;

            v13 = v44;
            v10 = v45;
            v17 = v43;
            v14 = 1;
          }

          v9 = v47;
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __107__ENRegionServerAgencyLocalizedConfiguration_getLocalizedAgencyConfiguration_region_fromDictionary_locale___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%@_%@"), v4, *(_QWORD *)(a1 + 32));

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v15 = (void *)MEMORY[0x24BDD17C8];
  -[ENRegionServerAgencyLocalizedConfiguration locale](self, "locale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration agencyMessage](self, "agencyMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration agencyTurndownMessage](self, "agencyTurndownMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration legalConsentText](self, "legalConsentText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration revokedNotificationSubject](self, "revokedNotificationSubject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration revokedNotificationBody](self, "revokedNotificationBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration testVerificationIntroMessage](self, "testVerificationIntroMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration testVerificationNotificationBody](self, "testVerificationNotificationBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration selfReportIntroMessage](self, "selfReportIntroMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration selfReportNotificationBody](self, "selfReportNotificationBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration traveledQuestionText](self, "traveledQuestionText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration vaccinationQuestionText](self, "vaccinationQuestionText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyLocalizedConfiguration phaTelemetryOptInMessage](self, "phaTelemetryOptInMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("[Locale]: %@, [Message]: %@, [Turndown]: %@, [Legal Consent Text]: %@, [Revoked Notification Title]: %@,            [Revoked Notification Body]: %@, [TestVerificationIntroMessage]: %@, [TestVerificationNotificationBody]: %@, [SelfReportIntroMessage]: %@, [SelfReportNotificationBody]: %@, [TraveledQuestionText]: %@, [VaccinationQuestionText]: %@, [PHATelemetryOptInMessage]: %@"), v19, v14, v18, v3, v4, v5, v6, v13, v7, v8, v9, v10, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSLocale *locale;
  id v5;

  locale = self->_locale;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", locale, CFSTR("locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_agencyMessage, CFSTR("agencyMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_agencyTurndownMessage, CFSTR("agencyTurndownMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("agencyDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_legalConsentText, CFSTR("legalConsentText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_onboardingNotificationBody, CFSTR("agencyOnboardingNotificationBody"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phaTelemetryOptInMessage, CFSTR("telemetryOptInMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_region, CFSTR("region"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_regionName, CFSTR("agencyRegionName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_revokedNotificationBody, CFSTR("revokedNotificationBody"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_revokedNotificationSubject, CFSTR("revokedNotificationSubject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_symptomsOnsetDescription, CFSTR("symptomsOnsetDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_testVerificationIntroMessage, CFSTR("testVerificationIntroMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_testVerificationNotificationBody, CFSTR("testVerificationNotificationBody"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selfReportIntroMessage, CFSTR("selfReportIntroMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selfReportNotificationBody, CFSTR("selfReportNotificationBody"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_traveledQuestionText, CFSTR("traveledQuestionText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vaccinationQuestionText, CFSTR("vaccinationQuestionText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vaccinationQuestionTextAlt, CFSTR("vaccinationQuestionTextAlt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notificationConfigurations, CFSTR("notifications"));

}

- (ENRegionServerAgencyLocalizedConfiguration)initWithCoder:(id)a3
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
  ENRegionServerAgencyLocalizedConfiguration *v13;
  id *p_isa;
  id v15;
  ENRegionServerAgencyLocalizedConfiguration *v16;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id obj;
  objc_super v29;
  id v30;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("agencyMessage"));
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("agencyTurndownMessage"));
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("agencyDisplayName"));
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("legalConsentText"));
          v23 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("agencyOnboardingNotificationBody"));
          v22 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("telemetryOptInMessage"));
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("agencyRegionName"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if (v5)
          {
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("revokedNotificationBody"));
            v20 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("revokedNotificationSubject"));
            v19 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symptomsOnsetDescription"));
            v18 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testVerificationIntroMessage"));
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testVerificationNotificationBody"));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selfReportIntroMessage"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selfReportNotificationBody"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traveledQuestionText"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vaccinationQuestionText"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vaccinationQuestionTextAlt"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = 0;
            objc_opt_class();
            NSDecodeNSArrayOfClassIfPresent();
            v29.receiver = self;
            v29.super_class = (Class)ENRegionServerAgencyLocalizedConfiguration;
            v13 = -[ENRegionServerAgencyLocalizedConfiguration init](&v29, sel_init);
            p_isa = (id *)&v13->super.isa;
            if (v13)
            {
              objc_storeStrong((id *)&v13->_locale, obj);
              objc_storeStrong(p_isa + 2, v27);
              objc_storeStrong(p_isa + 13, v6);
              objc_storeStrong(p_isa + 14, v7);
              objc_storeStrong(p_isa + 19, v8);
              objc_storeStrong(p_isa + 18, v9);
              objc_storeStrong(p_isa + 12, v18);
              objc_storeStrong(p_isa + 3, v26);
              objc_storeStrong(p_isa + 4, v25);
              objc_storeStrong(p_isa + 15, v10);
              objc_storeStrong(p_isa + 16, v11);
              objc_storeStrong(p_isa + 17, v12);
              objc_storeStrong(p_isa + 5, v24);
              objc_storeStrong(p_isa + 6, v23);
              objc_storeStrong(p_isa + 7, v22);
              objc_storeStrong(p_isa + 8, v21);
              objc_storeStrong(p_isa + 9, v5);
              objc_storeStrong(p_isa + 10, v20);
              objc_storeStrong(p_isa + 11, v19);
              if (v30)
                v15 = v30;
              else
                v15 = (id)MEMORY[0x24BDBD1A8];
              objc_storeStrong(p_isa + 20, v15);
            }
            self = p_isa;

            v16 = self;
          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ENRegion)region
{
  return self->_region;
}

- (NSString)agencyMessage
{
  return self->_agencyMessage;
}

- (void)setAgencyMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)agencyTurndownMessage
{
  return self->_agencyTurndownMessage;
}

- (void)setAgencyTurndownMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)legalConsentText
{
  return self->_legalConsentText;
}

- (void)setLegalConsentText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)onboardingNotificationBody
{
  return self->_onboardingNotificationBody;
}

- (void)setOnboardingNotificationBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)phaTelemetryOptInMessage
{
  return self->_phaTelemetryOptInMessage;
}

- (void)setPhaTelemetryOptInMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)regionName
{
  return self->_regionName;
}

- (void)setRegionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)revokedNotificationBody
{
  return self->_revokedNotificationBody;
}

- (void)setRevokedNotificationBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)revokedNotificationSubject
{
  return self->_revokedNotificationSubject;
}

- (void)setRevokedNotificationSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)symptomsOnsetDescription
{
  return self->_symptomsOnsetDescription;
}

- (void)setSymptomsOnsetDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)testVerificationIntroMessage
{
  return self->_testVerificationIntroMessage;
}

- (void)setTestVerificationIntroMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)testVerificationNotificationBody
{
  return self->_testVerificationNotificationBody;
}

- (void)setTestVerificationNotificationBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)traveledQuestionText
{
  return self->_traveledQuestionText;
}

- (void)setTraveledQuestionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)vaccinationQuestionText
{
  return self->_vaccinationQuestionText;
}

- (void)setVaccinationQuestionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)vaccinationQuestionTextAlt
{
  return self->_vaccinationQuestionTextAlt;
}

- (void)setVaccinationQuestionTextAlt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)selfReportNotificationBody
{
  return self->_selfReportNotificationBody;
}

- (void)setSelfReportNotificationBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)selfReportIntroMessage
{
  return self->_selfReportIntroMessage;
}

- (void)setSelfReportIntroMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)notificationConfigurations
{
  return self->_notificationConfigurations;
}

- (void)setNotificationConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationConfigurations, 0);
  objc_storeStrong((id *)&self->_selfReportIntroMessage, 0);
  objc_storeStrong((id *)&self->_selfReportNotificationBody, 0);
  objc_storeStrong((id *)&self->_vaccinationQuestionTextAlt, 0);
  objc_storeStrong((id *)&self->_vaccinationQuestionText, 0);
  objc_storeStrong((id *)&self->_traveledQuestionText, 0);
  objc_storeStrong((id *)&self->_testVerificationNotificationBody, 0);
  objc_storeStrong((id *)&self->_testVerificationIntroMessage, 0);
  objc_storeStrong((id *)&self->_symptomsOnsetDescription, 0);
  objc_storeStrong((id *)&self->_revokedNotificationSubject, 0);
  objc_storeStrong((id *)&self->_revokedNotificationBody, 0);
  objc_storeStrong((id *)&self->_regionName, 0);
  objc_storeStrong((id *)&self->_phaTelemetryOptInMessage, 0);
  objc_storeStrong((id *)&self->_onboardingNotificationBody, 0);
  objc_storeStrong((id *)&self->_legalConsentText, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_agencyTurndownMessage, 0);
  objc_storeStrong((id *)&self->_agencyMessage, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
