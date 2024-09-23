@implementation HFStoreLocaleAvailability

+ (id)getAvailabilityDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!getAvailabilityDictionary_availablityDictionary)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("HFStoreGeoAvailability"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, &v23, &v22);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v22;
    v8 = (void *)getAvailabilityDictionary_availablityDictionary;
    getAvailabilityDictionary_availablityDictionary = v6;

    if (v7)
    {
      objc_msgSend(v7, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Availability dictionary serializaiton failed with error %@"), v9);

    }
  }
  objc_msgSend(v2, "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)getAvailabilityDictionary_availablityDictionary, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend((id)getAvailabilityDictionary_availablityDictionary, "objectForKeyedSubscript:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)getAvailabilityDictionary_availablityDictionary, "objectForKeyedSubscript:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("default_language"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v20);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

@end
