@implementation ENRegionConfiguration

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  unint64_t v13;
  const char *v14;
  const char *v15;
  const __CFString *v16;
  void *v17;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ENRegionConfiguration region](self, "region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ENRegionConfiguration enVersion](self, "enVersion");
  -[ENRegionConfiguration userConsent](self, "userConsent");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[ENRegionConfiguration creationDateTimeInterval](self, "creationDateTimeInterval");
  v9 = v8;
  -[ENRegionConfiguration lastConfigurationUpdateTimeInterval](self, "lastConfigurationUpdateTimeInterval");
  v11 = v10;
  v12 = -[ENRegionConfiguration everStartedOnboarding](self, "everStartedOnboarding");
  v13 = -[ENRegionConfiguration travelerModeEnabled](self, "travelerModeEnabled");
  if (v13 > 2)
    v14 = "?";
  else
    v14 = (&off_24C38BA50)[v13];
  if (v12)
    v15 = "yes";
  else
    v15 = "no";
  if (v7)
    v16 = v7;
  else
    v16 = CFSTR("Unknown");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("System - %@, version: %lu, %@, createdOn: %f, lastUpdated: %f, EverOnbrd: %s, Traveler %s, rampMode: %lu"), v5, v6, v16, v9, v11, v15, v14, -[ENRegionConfiguration enRampMode](self, "enRampMode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (ENRegionConfiguration)initWithVersion:(unint64_t)a3 region:(id)a4
{
  id v7;
  ENRegionConfiguration *v8;
  ENRegionConfiguration *v9;
  void *v10;
  double v11;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ENRegionConfiguration;
  v8 = -[ENRegionConfiguration init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_enVersion = a3;
    objc_storeStrong((id *)&v8->_region, a4);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v9->_creationDateTimeInterval = v11;

  }
  return v9;
}

- (ENRegionConfiguration)initWithCoder:(id)a3
{
  id v4;
  ENRegionConfiguration *v5;
  uint64_t v6;
  uint64_t v7;
  ENRegionUserConsent *userConsent;
  void *v9;
  void *v10;
  uint64_t v11;
  ENUserAuthorization *diagnosisKeysPreAuthorization;
  void *v13;
  void *v14;
  const __CFString *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  ENRegionConfiguration *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ENRegionConfiguration;
  v5 = -[ENRegionConfiguration init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("enVersion"));
    v5->_enVersion = v6;
    if (v6 == 2)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userConsent"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        if (gLogCategory_ENRegionConfiguration > 90
          || gLogCategory_ENRegionConfiguration == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_25;
        }
        goto LABEL_21;
      }
      userConsent = v5->_userConsent;
      v5->_userConsent = (ENRegionUserConsent *)v7;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      objc_storeStrong((id *)&v5->_region, v9);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diagnosisKeysPreAuthorization"));
      v11 = objc_claimAutoreleasedReturnValue();
      diagnosisKeysPreAuthorization = v5->_diagnosisKeysPreAuthorization;
      v5->_diagnosisKeysPreAuthorization = (ENUserAuthorization *)v11;

      v5->_everStartedOnboarding = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("everStartedOnboarding"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("travelerStatusModeEnabled"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        v13 = (void *)objc_msgSend(v13, "integerValue");
      v5->_travelerModeEnabled = (int64_t)v13;
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("creationTimeInterval")))
        v15 = CFSTR("creationTimeInterval");
      else
        v15 = CFSTR("lastConfigurationUpdateTimeInterval");
      objc_msgSend(v4, "decodeDoubleForKey:", v15);
      v5->_creationDateTimeInterval = v16;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastConfigurationUpdateTimeInterval"));
      v5->_lastConfigurationUpdateTimeInterval = v17;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enRampMode"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
        v18 = (void *)objc_msgSend(v18, "unsignedIntegerValue");
      v5->_enRampMode = (unint64_t)v18;

      goto LABEL_14;
    }
    if (gLogCategory_ENRegionConfiguration > 90
      || gLogCategory_ENRegionConfiguration == -1 && !_LogCategory_Initialize())
    {
LABEL_25:
      v20 = 0;
      goto LABEL_15;
    }
LABEL_21:
    LogPrintF_safe();
    goto LABEL_25;
  }
LABEL_14:
  v20 = v5;
LABEL_15:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ENRegionConfiguration diagnosisKeysPreAuthorization](self, "diagnosisKeysPreAuthorization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("diagnosisKeysPreAuthorization"));

  objc_msgSend(v10, "encodeInt64:forKey:", -[ENRegionConfiguration enVersion](self, "enVersion"), CFSTR("enVersion"));
  objc_msgSend(v10, "encodeBool:forKey:", -[ENRegionConfiguration everStartedOnboarding](self, "everStartedOnboarding"), CFSTR("everStartedOnboarding"));
  -[ENRegionConfiguration region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("region"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[ENRegionConfiguration travelerModeEnabled](self, "travelerModeEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("travelerStatusModeEnabled"));

  -[ENRegionConfiguration creationDateTimeInterval](self, "creationDateTimeInterval");
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("creationTimeInterval"));
  -[ENRegionConfiguration lastConfigurationUpdateTimeInterval](self, "lastConfigurationUpdateTimeInterval");
  objc_msgSend(v10, "encodeDouble:forKey:", CFSTR("lastConfigurationUpdateTimeInterval"));
  if (-[ENRegionConfiguration enRampMode](self, "enRampMode"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ENRegionConfiguration enRampMode](self, "enRampMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("enRampMode"));

  }
  if (-[ENRegionConfiguration enVersion](self, "enVersion") == 2)
  {
    -[ENRegionConfiguration userConsent](self, "userConsent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ENRegionConfiguration userConsent](self, "userConsent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("userConsent"));
    }
    else
    {
      ENErrorF(10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "failWithError:", v9);
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  ENRegionConfiguration *v4;
  unint64_t v5;
  void *v6;
  ENRegionConfiguration *v7;
  void *v8;
  void *v9;

  v4 = +[ENRegionConfiguration allocWithZone:](ENRegionConfiguration, "allocWithZone:", a3);
  v5 = -[ENRegionConfiguration enVersion](self, "enVersion");
  -[ENRegionConfiguration region](self, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ENRegionConfiguration initWithVersion:region:](v4, "initWithVersion:region:", v5, v6);

  -[ENRegionConfiguration diagnosisKeysPreAuthorization](self, "diagnosisKeysPreAuthorization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionConfiguration setDiagnosisKeysPreAuthorization:](v7, "setDiagnosisKeysPreAuthorization:", v8);

  -[ENRegionConfiguration setEverStartedOnboarding:](v7, "setEverStartedOnboarding:", -[ENRegionConfiguration everStartedOnboarding](self, "everStartedOnboarding"));
  -[ENRegionConfiguration setTravelerModeEnabled:](v7, "setTravelerModeEnabled:", -[ENRegionConfiguration travelerModeEnabled](self, "travelerModeEnabled"));
  -[ENRegionConfiguration userConsent](self, "userConsent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionConfiguration setUserConsent:](v7, "setUserConsent:", v9);

  -[ENRegionConfiguration creationDateTimeInterval](self, "creationDateTimeInterval");
  -[ENRegionConfiguration setCreationDateTimeInterval:](v7, "setCreationDateTimeInterval:");
  -[ENRegionConfiguration lastConfigurationUpdateTimeInterval](self, "lastConfigurationUpdateTimeInterval");
  -[ENRegionConfiguration setLastConfigurationUpdateTimeInterval:](v7, "setLastConfigurationUpdateTimeInterval:");
  -[ENRegionConfiguration setEnRampMode:](v7, "setEnRampMode:", -[ENRegionConfiguration enRampMode](self, "enRampMode"));
  return v7;
}

- (id)updatedWithConfiguration:(id)a3
{
  ENRegionConfiguration *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  ENRegionConfiguration *v11;
  uint64_t v12;
  int64_t v13;
  ENRegionConfiguration *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (ENRegionConfiguration *)a3;
  -[ENRegionConfiguration region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionConfiguration region](v4, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    v8 = (void *)-[ENRegionConfiguration copy](self, "copy");
    if (!-[ENRegionConfiguration enVersion](v4, "enVersion")
      || (v9 = -[ENRegionConfiguration enVersion](v4, "enVersion"),
          v10 = -[ENRegionConfiguration enVersion](self, "enVersion"),
          v11 = v4,
          v9 == v10))
    {
      v11 = self;
    }
    objc_msgSend(v8, "setEnVersion:", -[ENRegionConfiguration enVersion](v11, "enVersion"));
    if (!-[ENRegionConfiguration travelerModeEnabled](v4, "travelerModeEnabled")
      || (v12 = -[ENRegionConfiguration travelerModeEnabled](v4, "travelerModeEnabled"),
          v13 = -[ENRegionConfiguration travelerModeEnabled](self, "travelerModeEnabled"),
          v14 = v4,
          v12 == v13))
    {
      v14 = self;
    }
    objc_msgSend(v8, "setTravelerModeEnabled:", -[ENRegionConfiguration travelerModeEnabled](v14, "travelerModeEnabled"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    objc_msgSend(v8, "setLastConfigurationUpdateTimeInterval:");

    if (!-[ENRegionConfiguration everStartedOnboarding](self, "everStartedOnboarding"))
      objc_msgSend(v8, "setEverStartedOnboarding:", -[ENRegionConfiguration everStartedOnboarding](v4, "everStartedOnboarding"));
    -[ENRegionConfiguration userConsent](v4, "userConsent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[ENRegionConfiguration userConsent](self, "userConsent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[ENRegionConfiguration userConsent](self, "userConsent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "updatedConsent:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setUserConsent:", v19);

      }
      else
      {
        objc_msgSend(v8, "setUserConsent:", v16);
      }

    }
    -[ENRegionConfiguration diagnosisKeysPreAuthorization](v4, "diagnosisKeysPreAuthorization");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v8, "setDiagnosisKeysPreAuthorization:", v20);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  unint64_t v6;
  int v7;
  BOOL v8;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  int64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[ENRegionConfiguration enVersion](self, "enVersion");
    if (v6 == objc_msgSend(v5, "enVersion"))
    {
      v7 = -[ENRegionConfiguration everStartedOnboarding](self, "everStartedOnboarding");
      if (v7 == objc_msgSend(v5, "everStartedOnboarding"))
      {
        -[ENRegionConfiguration userConsent](self, "userConsent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "userConsent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10;
        v13 = v11;
        v14 = v13;
        if (v12 == v13)
        {

        }
        else
        {
          if ((v12 == 0) == (v13 != 0))
          {
            v8 = 0;
            v24 = v13;
            v25 = v12;
LABEL_34:

            goto LABEL_35;
          }
          v15 = objc_msgSend(v12, "isEqual:", v13);

          if (!v15)
          {
            v8 = 0;
LABEL_35:

            goto LABEL_5;
          }
        }
        v16 = -[ENRegionConfiguration enVersion](self, "enVersion");
        if (v16 == 1)
        {
          -[ENRegionConfiguration region](self, "region");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "countryCode");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "lowercaseString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "region");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "countryCode");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "lowercaseString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v17;
          v21 = v19;
          v36 = v18;
          if (v20 == v21)
          {
            v23 = 0;
            v32 = v20;
            v3 = v20;
            goto LABEL_25;
          }
          v3 = v21;
          if ((v20 == 0) != (v21 != 0))
          {
            v22 = objc_msgSend(v20, "isEqual:", v21);

            if ((v22 & 1) != 0)
            {
              v23 = 0;
              v32 = v20;
              goto LABEL_26;
            }
          }
          else
          {

          }
          v32 = v20;
        }
        -[ENRegionConfiguration region](self, "region");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "region");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v26;
        v28 = v27;
        if (v20 != v28)
        {
          v22 = (uint64_t)v28;
          if ((v20 == 0) == (v28 != 0))
          {

            v8 = 0;
            goto LABEL_29;
          }
          v29 = objc_msgSend(v20, "isEqual:", v28);

          if ((v29 & 1) == 0)
          {
            v8 = 0;
            goto LABEL_32;
          }
          v23 = 1;
LABEL_26:
          v30 = -[ENRegionConfiguration travelerModeEnabled](self, "travelerModeEnabled");
          v8 = v30 == objc_msgSend(v5, "travelerModeEnabled");
          if (v23)
          {
LABEL_32:
            v31 = v36;

            if (v16 != 1)
              goto LABEL_35;
            goto LABEL_33;
          }
LABEL_29:
          v31 = v36;
          if (v16 != 1)
            goto LABEL_35;
LABEL_33:

          v24 = v34;
          v25 = v35;
          goto LABEL_34;
        }
        v23 = 1;
LABEL_25:

        v22 = (uint64_t)v20;
        goto LABEL_26;
      }
    }
  }
  v8 = 0;
LABEL_5:

  return v8;
}

- (unint64_t)enVersion
{
  return self->_enVersion;
}

- (void)setEnVersion:(unint64_t)a3
{
  self->_enVersion = a3;
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (ENRegionUserConsent)userConsent
{
  return self->_userConsent;
}

- (void)setUserConsent:(id)a3
{
  objc_storeStrong((id *)&self->_userConsent, a3);
}

- (BOOL)everStartedOnboarding
{
  return self->_everStartedOnboarding;
}

- (void)setEverStartedOnboarding:(BOOL)a3
{
  self->_everStartedOnboarding = a3;
}

- (ENUserAuthorization)diagnosisKeysPreAuthorization
{
  return self->_diagnosisKeysPreAuthorization;
}

- (void)setDiagnosisKeysPreAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosisKeysPreAuthorization, a3);
}

- (int64_t)travelerModeEnabled
{
  return self->_travelerModeEnabled;
}

- (void)setTravelerModeEnabled:(int64_t)a3
{
  self->_travelerModeEnabled = a3;
}

- (double)creationDateTimeInterval
{
  return self->_creationDateTimeInterval;
}

- (void)setCreationDateTimeInterval:(double)a3
{
  self->_creationDateTimeInterval = a3;
}

- (double)lastConfigurationUpdateTimeInterval
{
  return self->_lastConfigurationUpdateTimeInterval;
}

- (void)setLastConfigurationUpdateTimeInterval:(double)a3
{
  self->_lastConfigurationUpdateTimeInterval = a3;
}

- (unint64_t)enRampMode
{
  return self->_enRampMode;
}

- (void)setEnRampMode:(unint64_t)a3
{
  self->_enRampMode = a3;
}

- (int64_t)differentialPrivacyConsent
{
  return self->_differentialPrivacyConsent;
}

- (double)differentialPrivacyConsentTimestamp
{
  return self->_differentialPrivacyConsentTimestamp;
}

- (int64_t)consent
{
  return self->_consent;
}

- (double)consentTimestamp
{
  return self->_consentTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosisKeysPreAuthorization, 0);
  objc_storeStrong((id *)&self->_userConsent, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
