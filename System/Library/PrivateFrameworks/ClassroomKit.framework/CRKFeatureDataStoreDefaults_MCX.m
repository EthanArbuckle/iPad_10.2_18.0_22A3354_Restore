@implementation CRKFeatureDataStoreDefaults_MCX

+ (unint64_t)defaultValueForFeature:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "restrictionDefaultValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(MEMORY[0x24BDD16E0], "crk_featureBoolTypeFromNumber:", v6);
  return v7;
}

+ (BOOL)defaultAskValueForFeature:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "restrictionDefaultValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");
  return (char)v4;
}

+ (id)restrictionDefaultValues
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CRKFeatureDataStoreDefaults_MCX_restrictionDefaultValues__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (restrictionDefaultValues_onceToken != -1)
    dispatch_once(&restrictionDefaultValues_onceToken, block);
  return (id)restrictionDefaultValues_classroomRestrictionDefaultValues;
}

@end
