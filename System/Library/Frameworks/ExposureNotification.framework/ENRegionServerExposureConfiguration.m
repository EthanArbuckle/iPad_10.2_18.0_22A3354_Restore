@implementation ENRegionServerExposureConfiguration

- (ENRegionServerExposureConfiguration)initWithServerResponseDictionary:(id)a3
{
  id v4;
  void *v5;
  ENRegionServerExposureConfiguration *v6;
  id v7;
  uint64_t i;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  id v12;
  uint64_t Int64;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  id v19;
  uint64_t k;
  __CFString *v21;
  uint64_t v22;
  unsigned __int8 Int64Ranged;
  void *v24;
  void *v25;
  id v26;
  unsigned __int8 v27;
  void *v28;
  _BOOL4 v29;
  id v30;
  unsigned int v31;
  void *v32;
  uint64_t v33;
  NSString *appBundleIdentifier;
  uint64_t v35;
  NSArray *classificationCriteria;
  uint64_t v37;
  NSDictionary *exposureConfigurationValues;
  int v39;
  int v40;
  ENRegionServerExposureConfiguration *v41;
  void *v43;
  void *v44;
  ENRegionServerExposureConfiguration *v45;
  id v46;
  id v47;
  _QWORD v48[6];
  int v49;
  objc_super v50;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50.receiver = self;
    v50.super_class = (Class)ENRegionServerExposureConfiguration;
    v6 = -[ENRegionServerExposureConfiguration init](&v50, sel_init);
    if (v6)
    {
      v45 = v6;
      v49 = 0;
      CFStringGetTypeID();
      v46 = v4;
      CFDictionaryGetTypedValue();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      for (i = 0; i != 36; i += 3)
      {
        v9 = initWithServerResponseDictionary__exposureConfigurationDefinitions[i];
        v10 = initWithServerResponseDictionary__exposureConfigurationDefinitions[i + 1];
        NSDictionaryGetNSNumber();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v10);

      }
      v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      Int64 = CFDictionaryGetInt64();
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __72__ENRegionServerExposureConfiguration_initWithServerResponseDictionary___block_invoke;
      v48[3] = &unk_24C38B378;
      v48[4] = v12;
      v48[5] = Int64;
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD2F464](v48);
      v15 = 0;
      for (j = -14; j != 15; ++j)
      {
        v14[2](v14, j, v15);
        v15 += 2;
      }
      v14[2](v14, 0x7FFFFFFFFFFFFFFFLL, 58);
      v43 = v12;
      v17 = (void *)objc_msgSend(v12, "copy");
      v18 = v7;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("infectiousnessForDaysSinceOnsetOfSymptoms"));

      v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      for (k = 0; k != 48; k += 16)
      {
        v21 = *(__CFString **)((char *)&initWithServerResponseDictionary__attenuationDurationDefinitions + k);
        v22 = *((unsigned __int8 *)&initWithServerResponseDictionary__attenuationDurationDefinitions + k + 8);
        Int64Ranged = CFDictionaryGetInt64Ranged();
        if (v49)
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v22);
        else
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", Int64Ranged);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v24);

      }
      v25 = (void *)objc_msgSend(v19, "copy");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("attenuationDurationThresholds"));

      v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v27 = 1;
      do
      {
        v28 = (void *)MEMORY[0x20BD2F320]();
        v47 = 0;
        v29 = +[ENRegionServerExposureClassificationCriteria getCriteria:fromDictionary:index:](ENRegionServerExposureClassificationCriteria, "getCriteria:fromDictionary:index:", &v47, v5, v27);
        v30 = v47;
        objc_autoreleasePoolPop(v28);
        if (!v29)
        {

          v41 = 0;
          v32 = v44;
          self = v45;
          goto LABEL_23;
        }
        if (v30)
          objc_msgSend(v26, "addObject:", v30);

        v31 = v27++;
      }
      while (v31 <= 3);
      v32 = v44;
      v33 = objc_msgSend(v44, "copy");
      self = v45;
      appBundleIdentifier = v45->_appBundleIdentifier;
      v45->_appBundleIdentifier = (NSString *)v33;

      v35 = objc_msgSend(v26, "copy");
      classificationCriteria = v45->_classificationCriteria;
      v45->_classificationCriteria = (NSArray *)v35;

      v37 = objc_msgSend(v18, "copy");
      exposureConfigurationValues = v45->_exposureConfigurationValues;
      v45->_exposureConfigurationValues = (NSDictionary *)v37;

      v45->_enableRecursiveReportType = CFDictionaryGetInt64() != 0;
      v39 = 86400 * (unsigned __int16)CFDictionaryGetInt64Ranged();
      if (v49)
        v40 = 604800;
      else
        v40 = v39;
      v45->_privacyParameterInputCandenceInterval = (double)v40;
      v45->_matchingRestrictedToRegion = CFDictionaryGetInt64() != 0;
      v41 = v45;
LABEL_23:

      v4 = v46;
      goto LABEL_24;
    }
    self = 0;
  }
  v41 = 0;
LABEL_24:

LABEL_25:
  return v41;
}

void __72__ENRegionServerExposureConfiguration_initWithServerResponseDictionary___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  void *v5;
  void *v6;
  id v7;

  if (((*(_QWORD *)(a1 + 40) >> a3) & 3) - 1 <= 1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  }
}

- (id)classificationCriteriaForName:(id)a3
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
  -[ENRegionServerExposureConfiguration classificationCriteria](self, "classificationCriteria", 0);
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

- (ENRegionServerExposureConfiguration)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ENRegionServerExposureConfiguration *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  NSString *appBundleIdentifier;
  double v17;
  objc_super v19;

  v4 = a3;
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("cfgv")))
  {
    v10 = (void *)MEMORY[0x24BDBD1B8];
LABEL_5:
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("clsf")))
    {
      v12 = objc_alloc(MEMORY[0x24BDBCF20]);
      v13 = objc_opt_class();
      v11 = (ENRegionServerExposureConfiguration *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("clsf"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x24BDBD1A8];
    }
    v19.receiver = self;
    v19.super_class = (Class)ENRegionServerExposureConfiguration;
    self = -[ENRegionServerExposureConfiguration init](&v19, sel_init);
    if (self)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleId"));
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      appBundleIdentifier = self->_appBundleIdentifier;
      self->_appBundleIdentifier = v15;

      objc_storeStrong((id *)&self->_classificationCriteria, v14);
      objc_storeStrong((id *)&self->_exposureConfigurationValues, v10);
      self->_enableRecursiveReportType = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableRecursiveType"));
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("privacyParameterInputCandence"));
      self->_privacyParameterInputCandenceInterval = v17;
      self->_matchingRestrictedToRegion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMatchingRestrictedRegion"));
      self = self;
      v11 = self;
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_12;
  }
  v5 = objc_alloc(MEMORY[0x24BDBCF20]);
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("cfgv"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_5;
  v11 = 0;
LABEL_13:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appBundleIdentifier;
  id v5;

  appBundleIdentifier = self->_appBundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appBundleIdentifier, CFSTR("appBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_classificationCriteria, CFSTR("clsf"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_exposureConfigurationValues, CFSTR("cfgv"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableRecursiveReportType, CFSTR("enableRecursiveType"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("privacyParameterInputCandence"), self->_privacyParameterInputCandenceInterval);
  objc_msgSend(v5, "encodeBool:forKey:", self->_matchingRestrictedToRegion, CFSTR("isMatchingRestrictedRegion"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSArray)classificationCriteria
{
  return self->_classificationCriteria;
}

- (NSDictionary)exposureConfigurationValues
{
  return self->_exposureConfigurationValues;
}

- (BOOL)enableRecursiveReportType
{
  return self->_enableRecursiveReportType;
}

- (BOOL)matchingRestrictedToRegion
{
  return self->_matchingRestrictedToRegion;
}

- (double)privacyParameterInputCandenceInterval
{
  return self->_privacyParameterInputCandenceInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureConfigurationValues, 0);
  objc_storeStrong((id *)&self->_classificationCriteria, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
