@implementation GEOAddressObject(RTExtensions)

- (uint64_t)initWithFullThoroughfare:()RTExtensions subLocality:locality:subAdministrativeArea:administrativeArea:postalCode:country:countryCode:language:countryLocale:phoneticLocale:
{
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v31;
  id v32;
  id v33;

  v18 = (void *)MEMORY[0x1E0C99E08];
  v33 = a13;
  v32 = a12;
  v31 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  objc_msgSend(v18, "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("Street"));

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v25, CFSTR("SubLocality"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, CFSTR("City"));

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v23, CFSTR("SubAdministrativeArea"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, CFSTR("State"));

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v21, CFSTR("ZIP"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v20, CFSTR("Country"));

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, CFSTR("CountryCode"));
  v28 = objc_msgSend(a1, "initWithContactAddressDictionary:language:country:phoneticLocale:", v27, v31, v32, v33);

  return v28;
}

- (uint64_t)initWithCurrentLocaleFullThoroughfare:()RTExtensions subLocality:locality:subAdministrativeArea:administrativeArea:postalCode:country:countryCode:
{
  __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_class *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v29 = a8;
  v17 = a9;
  v18 = a10;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v26;
      v37 = 2112;
      v38 = v27;
      _os_log_error_impl(&dword_1A5E26000, v23, OS_LOG_TYPE_ERROR, "%@, %@, [NSLocale currentLocale] failed for NSLocaleCountryCode", buf, 0x16u);

    }
    v17 = &stru_1E4FB1A18;
  }
  v28 = objc_msgSend(a1, "initWithFullThoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:postalCode:country:countryCode:language:countryLocale:phoneticLocale:", v34, v33, v32, v31, v30, v29, v17, v18, v20, v22, v20);

  return v28;
}

@end
