@implementation MCPasswordPolicyPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.mobiledevice.passwordpolicy"));
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("PASSWORD_POLICY_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("PASSWORD_POLICY_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCPasswordPolicyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCPasswordPolicyPayload *v9;
  uint64_t v10;
  id v11;
  NSNumber *isSimplePasscodeAllowed;
  uint64_t v13;
  NSNumber *isPasscodeRequired;
  uint64_t v15;
  NSNumber *isAlphanumericPasscodeRequired;
  uint64_t v17;
  NSNumber *isManualFetchingWhenRoaming;
  uint64_t v19;
  NSNumber *minLength;
  uint64_t v21;
  NSNumber *maxFailedAttempts;
  NSNumber *v23;
  NSNumber *v24;
  uint64_t v25;
  NSNumber *maxGracePeriodMinutes;
  uint64_t v27;
  NSNumber *maxInactivityMinutes;
  uint64_t v29;
  NSNumber *maxPasscodeAgeDays;
  uint64_t v31;
  NSNumber *passcodeHistoryCount;
  uint64_t v33;
  NSNumber *minComplexCharacters;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
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
  objc_super v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v57.receiver = self;
  v57.super_class = (Class)MCPasswordPolicyPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v57, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (v9)
  {
    v56 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("allowSimple"), 0, &v56);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v56;
    isSimplePasscodeAllowed = v9->_isSimplePasscodeAllowed;
    v9->_isSimplePasscodeAllowed = (NSNumber *)v10;

    if (v11)
      goto LABEL_16;
    v55 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("forcePIN"), 0, &v55);
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = v55;
    isPasscodeRequired = v9->_isPasscodeRequired;
    v9->_isPasscodeRequired = (NSNumber *)v13;

    if (v11)
      goto LABEL_16;
    v54 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("requireAlphanumeric"), 0, &v54);
    v15 = objc_claimAutoreleasedReturnValue();
    v11 = v54;
    isAlphanumericPasscodeRequired = v9->_isAlphanumericPasscodeRequired;
    v9->_isAlphanumericPasscodeRequired = (NSNumber *)v15;

    if (v11)
      goto LABEL_16;
    v53 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("manualFetchingWhenRoaming"), 0, &v53);
    v17 = objc_claimAutoreleasedReturnValue();
    v11 = v53;
    isManualFetchingWhenRoaming = v9->_isManualFetchingWhenRoaming;
    v9->_isManualFetchingWhenRoaming = (NSNumber *)v17;

    if (v11)
      goto LABEL_16;
    v52 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("minLength"), 0, &v52);
    v19 = objc_claimAutoreleasedReturnValue();
    v11 = v52;
    minLength = v9->_minLength;
    v9->_minLength = (NSNumber *)v19;

    if (v11)
      goto LABEL_16;
    v51 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("maxFailedAttempts"), 0, &v51);
    v21 = objc_claimAutoreleasedReturnValue();
    v11 = v51;
    maxFailedAttempts = v9->_maxFailedAttempts;
    v9->_maxFailedAttempts = (NSNumber *)v21;

    if (v11)
      goto LABEL_16;
    v23 = v9->_maxFailedAttempts;
    if (v23 && -[NSNumber intValue](v23, "intValue") <= 1)
    {
      v24 = v9->_maxFailedAttempts;
      v9->_maxFailedAttempts = (NSNumber *)&unk_1E42127F0;

    }
    v50 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("maxGracePeriod"), 0, &v50);
    v25 = objc_claimAutoreleasedReturnValue();
    v11 = v50;
    maxGracePeriodMinutes = v9->_maxGracePeriodMinutes;
    v9->_maxGracePeriodMinutes = (NSNumber *)v25;

    if (v11)
      goto LABEL_16;
    v49 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("maxInactivity"), 0, &v49);
    v27 = objc_claimAutoreleasedReturnValue();
    v11 = v49;
    maxInactivityMinutes = v9->_maxInactivityMinutes;
    v9->_maxInactivityMinutes = (NSNumber *)v27;

    if (v11)
      goto LABEL_16;
    v48 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("maxPINAgeInDays"), 0, &v48);
    v29 = objc_claimAutoreleasedReturnValue();
    v11 = v48;
    maxPasscodeAgeDays = v9->_maxPasscodeAgeDays;
    v9->_maxPasscodeAgeDays = (NSNumber *)v29;

    if (v11)
      goto LABEL_16;
    v47 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("pinHistory"), 0, &v47);
    v31 = objc_claimAutoreleasedReturnValue();
    v11 = v47;
    passcodeHistoryCount = v9->_passcodeHistoryCount;
    v9->_passcodeHistoryCount = (NSNumber *)v31;

    if (v11
      || (v46 = 0,
          objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("minComplexChars"), 0, &v46), v33 = objc_claimAutoreleasedReturnValue(), v11 = v46, minComplexCharacters = v9->_minComplexCharacters, v9->_minComplexCharacters = (NSNumber *)v33, minComplexCharacters, v11))
    {
LABEL_16:
      -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (a5)
        *a5 = objc_retainAutorelease(v35);
      v37 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v38 = v37;
        v39 = (void *)objc_opt_class();
        v40 = v39;
        objc_msgSend(v36, "MCVerboseDescription");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v39;
        v60 = 2114;
        v61 = v41;
        _os_log_impl(&dword_19ECC4000, v38, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v9 = 0;
    }
    else if (objc_msgSend(v8, "count"))
    {
      v43 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v44 = v43;
        -[MCPayload friendlyName](v9, "friendlyName");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v45;
        v60 = 2114;
        v61 = v8;
        _os_log_impl(&dword_19ECC4000, v44, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);

      }
    }
  }

  return v9;
}

- (id)stubDictionary
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCPasswordPolicyPayload;
  -[MCPayload stubDictionary](&v5, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_isSimplePasscodeAllowed, CFSTR("allowSimple"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_isPasscodeRequired, CFSTR("forcePIN"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_isAlphanumericPasscodeRequired, CFSTR("requireAlphanumeric"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_isManualFetchingWhenRoaming, CFSTR("manualFetchingWhenRoaming"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_minLength, CFSTR("minLength"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_maxFailedAttempts, CFSTR("maxFailedAttempts"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_maxGracePeriodMinutes, CFSTR("maxGracePeriod"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_maxInactivityMinutes, CFSTR("maxInactivity"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_maxPasscodeAgeDays, CFSTR("maxPINAgeInDays"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_passcodeHistoryCount, CFSTR("pinHistory"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_minComplexCharacters, CFSTR("minComplexChars"));
  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  NSNumber *minLength;
  NSNumber *minComplexCharacters;
  NSNumber *maxFailedAttempts;
  NSNumber *maxGracePeriodMinutes;
  NSNumber *maxInactivityMinutes;
  NSNumber *maxPasscodeAgeDays;
  NSNumber *passcodeHistoryCount;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v14.receiver = self;
  v14.super_class = (Class)MCPasswordPolicyPayload;
  -[MCPayload verboseDescription](&v14, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSNumber BOOLValue](self->_isPasscodeRequired, "BOOLValue"))
    objc_msgSend(v5, "appendFormat:", CFSTR("- Passcode required\n"));
  if (-[NSNumber BOOLValue](self->_isSimplePasscodeAllowed, "BOOLValue"))
    objc_msgSend(v5, "appendFormat:", CFSTR("- Simple passcodes allowed\n"));
  if (-[NSNumber BOOLValue](self->_isAlphanumericPasscodeRequired, "BOOLValue"))
    objc_msgSend(v5, "appendFormat:", CFSTR("- Alphanumeric required\n"));
  if (-[NSNumber BOOLValue](self->_isManualFetchingWhenRoaming, "BOOLValue"))
    objc_msgSend(v5, "appendFormat:", CFSTR("- Manual fetching when roaming\n"));
  minLength = self->_minLength;
  if (minLength)
    objc_msgSend(v5, "appendFormat:", CFSTR("- Minimum length: %d\n"), -[NSNumber intValue](minLength, "intValue"));
  minComplexCharacters = self->_minComplexCharacters;
  if (minComplexCharacters)
    objc_msgSend(v5, "appendFormat:", CFSTR("- Minimum complex chars: %d\n"), -[NSNumber intValue](minComplexCharacters, "intValue"));
  maxFailedAttempts = self->_maxFailedAttempts;
  if (maxFailedAttempts)
    objc_msgSend(v5, "appendFormat:", CFSTR("- Max failed attempts: %d\n"), -[NSNumber intValue](maxFailedAttempts, "intValue"));
  maxGracePeriodMinutes = self->_maxGracePeriodMinutes;
  if (maxGracePeriodMinutes)
    objc_msgSend(v5, "appendFormat:", CFSTR("- Max grace period: %d minutes\n"), -[NSNumber intValue](maxGracePeriodMinutes, "intValue"));
  maxInactivityMinutes = self->_maxInactivityMinutes;
  if (maxInactivityMinutes)
    objc_msgSend(v5, "appendFormat:", CFSTR("- Max inactivity: %d minutes\n"), -[NSNumber intValue](maxInactivityMinutes, "intValue"));
  maxPasscodeAgeDays = self->_maxPasscodeAgeDays;
  if (maxPasscodeAgeDays)
    objc_msgSend(v5, "appendFormat:", CFSTR("- Max passcode age: %d days\n"), -[NSNumber intValue](maxPasscodeAgeDays, "intValue"));
  passcodeHistoryCount = self->_passcodeHistoryCount;
  if (passcodeHistoryCount)
    objc_msgSend(v5, "appendFormat:", CFSTR("- Passcode history: %d\n"), -[NSNumber intValue](passcodeHistoryCount, "intValue"));
  return v5;
}

- (id)title
{
  return MCLocalizedString(CFSTR("PASSCODE_TITLE"));
}

- (id)subtitle1Description
{
  void *v2;
  void *v3;

  -[MCPasswordPolicyPayload restrictions](self, "restrictions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCPasscodeManager localizedDescriptionOfPasscodePolicyFromRestrictions:](MCPasscodeManager, "localizedDescriptionOfPasscodePolicyFromRestrictions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MCKeyValue *v8;
  void *v9;
  void *v10;
  MCKeyValue *v11;
  _BOOL4 v12;
  MCKeyValue *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MCKeyValue *v17;
  void *v18;
  void *v19;
  MCKeyValue *v20;
  void *v21;
  MCKeyValue *v22;
  void *v23;
  void *v24;
  void *v25;
  MCKeyValue *v26;
  void *v27;
  void *v28;
  MCKeyValue *v29;
  void *v30;
  void *v31;
  MCKeyValue *v32;
  void *v33;
  void *v34;
  MCKeyValue *v35;
  void *v36;
  void *v37;
  MCKeyValue *v38;
  void *v39;
  void *v40;
  MCKeyValue *v41;
  void *v42;
  void *v43;
  MCKeyValue *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  MCKeyValue *v50;
  void *v51;
  MCKeyValue *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  uint64_t v57;
  MCKeyValue *v58;
  void *v59;
  MCKeyValue *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  MCKeyValue *v64;
  void *v65;
  MCKeyValue *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  MCKeyValue *v70;
  void *v71;
  MCKeyValue *v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[2];

  v80[1] = *MEMORY[0x1E0C80C00];
  -[MCPasswordPolicyPayload restrictions](self, "restrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultRestrictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCRestrictionManager filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:](MCRestrictionManager, "filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("forcePIN"), v6) == 1)
  {
    v8 = [MCKeyValue alloc];
    MCLocalizedStringForBool(1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("PASSCODE_REQUIRED"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MCKeyValue initWithLocalizedString:localizedKey:](v8, "initWithLocalizedString:localizedKey:", v9, v10);

    objc_msgSend(v7, "addObject:", v11);
  }
  v12 = +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("allowSimple"), v6) != 2;
  v13 = [MCKeyValue alloc];
  MCLocalizedStringForBool(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedString(CFSTR("SIMPLE_PASSCODES_ALLOWED"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MCKeyValue initWithLocalizedString:localizedKey:](v13, "initWithLocalizedString:localizedKey:", v14, v15);

  v79 = (void *)v16;
  objc_msgSend(v7, "addObject:", v16);
  if (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", CFSTR("requireAlphanumeric"), v6) == 1)
  {
    v17 = [MCKeyValue alloc];
    MCLocalizedStringForBool(1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("ALPHANUMERIC_PASSCODE_REQUIRED"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MCKeyValue initWithLocalizedString:localizedKey:](v17, "initWithLocalizedString:localizedKey:", v18, v19);

    objc_msgSend(v7, "addObject:", v20);
  }
  -[MCPasswordPolicyPayload isManualFetchingWhenRoaming](self, "isManualFetchingWhenRoaming");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = [MCKeyValue alloc];
    -[MCPasswordPolicyPayload isManualFetchingWhenRoaming](self, "isManualFetchingWhenRoaming");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedStringForBool(objc_msgSend(v23, "BOOLValue"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("MANUAL_FETCHING_WHEN_ROAMING"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[MCKeyValue initWithLocalizedString:localizedKey:](v22, "initWithLocalizedString:localizedKey:", v24, v25);

    objc_msgSend(v7, "addObject:", v26);
  }
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("minLength"), v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27 && (int)objc_msgSend(v27, "intValue") >= 1)
  {
    v29 = [MCKeyValue alloc];
    MCFormattedStringForNumber(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("MINIMUM_PASSCODE_LENGTH_REQUIRED"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[MCKeyValue initWithLocalizedString:localizedKey:](v29, "initWithLocalizedString:localizedKey:", v30, v31);

    objc_msgSend(v7, "addObject:", v32);
  }
  v78 = v28;
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("minComplexChars"), v6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33 && (int)objc_msgSend(v33, "intValue") >= 1)
  {
    v35 = [MCKeyValue alloc];
    MCFormattedStringForNumber(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("MINIMUM_PASSCODE_COMPLEX_CHARACTERS"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[MCKeyValue initWithLocalizedString:localizedKey:](v35, "initWithLocalizedString:localizedKey:", v36, v37);

    objc_msgSend(v7, "addObject:", v38);
  }
  v77 = v34;
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("maxFailedAttempts"), v6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39 && (int)objc_msgSend(v39, "intValue") >= 1)
  {
    v41 = [MCKeyValue alloc];
    MCFormattedStringForNumber(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("MAXIMUM_PASSCODE_FAILED_ATTEMPTS"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[MCKeyValue initWithLocalizedString:localizedKey:](v41, "initWithLocalizedString:localizedKey:", v42, v43);

    objc_msgSend(v7, "addObject:", v44);
  }
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("maxGracePeriod"), v6, v40);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    +[MCHacks sharedHacks](MCHacks, "sharedHacks");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "quantizedGracePeriodInSeconds:", v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = objc_msgSend(v47, "unsignedIntegerValue");
    if (v48)
      MCFormattedStringForTimeInterval((double)v48);
    else
      MCLocalizedString(CFSTR("IMMEDIATELY"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("MAXIMUM_PASSCODE_GRACE_PERIOD"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[MCKeyValue initWithLocalizedString:localizedKey:](v50, "initWithLocalizedString:localizedKey:", v49, v51);

    objc_msgSend(v7, "addObject:", v52);
  }
  else
  {
    v49 = 0;
  }
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("maxInactivity"), v6);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    +[MCHacks sharedHacks](MCHacks, "sharedHacks");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "quantizedAutoLockInSeconds:", v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = (double)(unint64_t)objc_msgSend(v55, "unsignedIntegerValue");
    if (v56 < 60.0)
      v56 = 60.0;
    MCFormattedStringForTimeInterval(v56);
    v57 = objc_claimAutoreleasedReturnValue();

    v58 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("MAXIMUM_PASSCODE_INACTIVITY"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[MCKeyValue initWithLocalizedString:localizedKey:](v58, "initWithLocalizedString:localizedKey:", v57, v59);

    objc_msgSend(v7, "addObject:", v60);
    v49 = (void *)v57;
  }
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("maxPINAgeInDays"), v6);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61 && (int)objc_msgSend(v61, "intValue") >= 1)
  {
    MCFormattedStringForTimeInterval((double)(unint64_t)(86400 * objc_msgSend(v62, "unsignedIntegerValue")));
    v63 = objc_claimAutoreleasedReturnValue();

    v64 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("MAXIMUM_PASSCODE_AGE"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[MCKeyValue initWithLocalizedString:localizedKey:](v64, "initWithLocalizedString:localizedKey:", v63, v65);

    objc_msgSend(v7, "addObject:", v66);
    v49 = (void *)v63;
  }
  +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", CFSTR("pinHistory"), v6);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (v67 && (objc_msgSend(v67, "intValue") & 0x80000000) == 0)
  {
    MCFormattedStringForNumber(v68);
    v69 = objc_claimAutoreleasedReturnValue();

    v70 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PASSCODE_HISTORY"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = -[MCKeyValue initWithLocalizedString:localizedKey:](v70, "initWithLocalizedString:localizedKey:", v69, v71);

    objc_msgSend(v7, "addObject:", v72);
    v49 = (void *)v69;
  }
  +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v7);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v73;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  return v74;
}

- (id)restrictions
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCPasswordPolicyPayload isSimplePasscodeAllowed](self, "isSimplePasscodeAllowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCPasswordPolicyPayload isSimplePasscodeAllowed](self, "isSimplePasscodeAllowed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "MCSetBoolRestriction:value:", CFSTR("allowSimple"), objc_msgSend(v5, "BOOLValue"));

  }
  -[MCPasswordPolicyPayload isPasscodeRequired](self, "isPasscodeRequired");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCPasswordPolicyPayload isPasscodeRequired](self, "isPasscodeRequired");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "MCSetBoolRestriction:value:", CFSTR("forcePIN"), objc_msgSend(v7, "BOOLValue"));

  }
  -[MCPasswordPolicyPayload isAlphanumericPasscodeRequired](self, "isAlphanumericPasscodeRequired");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCPasswordPolicyPayload isAlphanumericPasscodeRequired](self, "isAlphanumericPasscodeRequired");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "MCSetBoolRestriction:value:", CFSTR("requireAlphanumeric"), objc_msgSend(v9, "BOOLValue"));

  }
  -[MCPasswordPolicyPayload minLength](self, "minLength");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCSetValueRestriction:value:", CFSTR("minLength"), v10);

  -[MCPasswordPolicyPayload maxFailedAttempts](self, "maxFailedAttempts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCSetValueRestriction:value:", CFSTR("maxFailedAttempts"), v11);

  -[MCPasswordPolicyPayload maxGracePeriodMinutes](self, "maxGracePeriodMinutes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[MCPasswordPolicyPayload maxGracePeriodMinutes](self, "maxGracePeriodMinutes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithInt:", 60 * objc_msgSend(v14, "intValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "MCSetValueRestriction:value:", CFSTR("maxGracePeriod"), v15);

  }
  -[MCPasswordPolicyPayload maxInactivityMinutes](self, "maxInactivityMinutes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[MCPasswordPolicyPayload maxInactivityMinutes](self, "maxInactivityMinutes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithInt:", 60 * objc_msgSend(v18, "intValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "MCSetValueRestriction:value:", CFSTR("maxInactivity"), v19);

  }
  -[MCPasswordPolicyPayload maxPasscodeAgeDays](self, "maxPasscodeAgeDays");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCSetValueRestriction:value:", CFSTR("maxPINAgeInDays"), v20);

  -[MCPasswordPolicyPayload passcodeHistoryCount](self, "passcodeHistoryCount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCSetValueRestriction:value:", CFSTR("pinHistory"), v21);

  -[MCPasswordPolicyPayload minComplexCharacters](self, "minComplexCharacters");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCSetValueRestriction:value:", CFSTR("minComplexChars"), v22);

  v23 = (void *)objc_msgSend(v3, "copy");
  return v23;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  MCPasswordPolicyPayload *v13;
  void *v14;
  MCPasswordPolicyPayload *v15;
  id v16;
  MCPasswordPolicyPayload *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[MCPasswordPolicyPayload stubDictionary](self, "stubDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasPrefix:", CFSTR("Payload")) & 1) == 0
          && (objc_msgSend(v10, "isEqualToString:", CFSTR("PersistentResourceID")) & 1) == 0
          && (objc_msgSend(v10, "isEqualToString:", CFSTR("maxInactivity")) & 1) == 0)
        {
          objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "removeObjectsForKeys:", v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("allowSimple"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E4212808, CFSTR("minLength"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxInactivity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E4212820, CFSTR("maxInactivity"));
  v13 = [MCPasswordPolicyPayload alloc];
  -[MCPayload profile](self, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v15 = -[MCPasswordPolicyPayload initWithDictionary:profile:outError:](v13, "initWithDictionary:profile:outError:", v3, v14, &v24);
  v16 = v24;

  if (v16)
  {
    v17 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v16);
  }
  else
  {
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_13);
      v18 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v19 = v18;
        -[MCPayload friendlyName](self, "friendlyName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v20;
        v31 = 2114;
        v32 = v4;
        _os_log_impl(&dword_19ECC4000, v19, OS_LOG_TYPE_INFO, "Payload “%{public}@” has keys that we are ignoring. They are: %{public}@", buf, 0x16u);

      }
    }
    v17 = v15;
  }

  return v17;
}

uint64_t __59__MCPasswordPolicyPayload_filterForUserEnrollmentOutError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 1);
}

- (NSNumber)isSimplePasscodeAllowed
{
  return self->_isSimplePasscodeAllowed;
}

- (NSNumber)isPasscodeRequired
{
  return self->_isPasscodeRequired;
}

- (NSNumber)isAlphanumericPasscodeRequired
{
  return self->_isAlphanumericPasscodeRequired;
}

- (NSNumber)isManualFetchingWhenRoaming
{
  return self->_isManualFetchingWhenRoaming;
}

- (NSNumber)minLength
{
  return self->_minLength;
}

- (NSNumber)maxFailedAttempts
{
  return self->_maxFailedAttempts;
}

- (NSNumber)maxGracePeriodMinutes
{
  return self->_maxGracePeriodMinutes;
}

- (NSNumber)maxInactivityMinutes
{
  return self->_maxInactivityMinutes;
}

- (NSNumber)passcodeHistoryCount
{
  return self->_passcodeHistoryCount;
}

- (NSNumber)maxPasscodeAgeDays
{
  return self->_maxPasscodeAgeDays;
}

- (NSNumber)minComplexCharacters
{
  return self->_minComplexCharacters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minComplexCharacters, 0);
  objc_storeStrong((id *)&self->_passcodeHistoryCount, 0);
  objc_storeStrong((id *)&self->_maxPasscodeAgeDays, 0);
  objc_storeStrong((id *)&self->_maxInactivityMinutes, 0);
  objc_storeStrong((id *)&self->_maxGracePeriodMinutes, 0);
  objc_storeStrong((id *)&self->_maxFailedAttempts, 0);
  objc_storeStrong((id *)&self->_minLength, 0);
  objc_storeStrong((id *)&self->_isManualFetchingWhenRoaming, 0);
  objc_storeStrong((id *)&self->_isAlphanumericPasscodeRequired, 0);
  objc_storeStrong((id *)&self->_isPasscodeRequired, 0);
  objc_storeStrong((id *)&self->_isSimplePasscodeAllowed, 0);
}

@end
