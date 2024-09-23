@implementation HKSourceAliasMappings

+ (id)aliasNameForSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.siri")))
  {
    HKHealthKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SIRI_TITLE_WATCH"), &stru_1E37FD4C0, CFSTR("Localizable-Scribe"));
  }
  else
  {
    objc_msgSend(a1, "_builtInMappings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "aliasName");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)bundleIdentifierForIconForSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_builtInMappings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bundleIdentifierForIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)bundleIdentifierForInstallationStatusForSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_builtInMappings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bundleIdentifierForInstallationStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_builtInMappings
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("com.apple.Health.Medications");
  objc_msgSend(a1, "_createMedicationsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_createMedicationsMapping
{
  _HKSourceAliasMapping *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(_HKSourceAliasMapping);
  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MEDICATION_TRACKING"), &stru_1E37FD4C0, CFSTR("Localizable-Meds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKSourceAliasMapping setAliasName:](v2, "setAliasName:", v4);

  -[_HKSourceAliasMapping setBundleIdentifierForIcon:](v2, "setBundleIdentifierForIcon:", CFSTR("com.apple.NanoMedications"));
  -[_HKSourceAliasMapping setBundleIdentifierForInstallationStatus:](v2, "setBundleIdentifierForInstallationStatus:", CFSTR("com.apple.Health"));
  return v2;
}

@end
