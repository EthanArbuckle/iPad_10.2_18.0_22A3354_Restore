@implementation SGTimeZoneDetector

- (SGTimeZoneDetector)init
{
  SGTimeZoneDetector *v2;
  SGTimeZoneDetector *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  dispatch_source_t v7;
  OS_dispatch_source *memoryPressureSource;
  NSObject *v9;
  _QWORD handler[4];
  SGTimeZoneDetector *v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SGTimeZoneDetector;
  v2 = -[SGTimeZoneDetector init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_keepData = 1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.proactive.SGTimeZone", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 7uLL, (dispatch_queue_t)v3->_queue);
    memoryPressureSource = v3->_memoryPressureSource;
    v3->_memoryPressureSource = (OS_dispatch_source *)v7;

    location = 0;
    objc_initWeak(&location, v3);
    v9 = v3->_memoryPressureSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __26__SGTimeZoneDetector_init__block_invoke;
    handler[3] = &unk_1E4761E30;
    objc_copyWeak(&v13, &location);
    v12 = v3;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)v3->_memoryPressureSource);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)_handleMemoryPressureStatus
{
  unint64_t memoryPressureStatus;
  SGTimeZoneDetector *obj;

  obj = self;
  objc_sync_enter(obj);
  memoryPressureStatus = obj->_memoryPressureStatus;
  if (memoryPressureStatus == 1)
    goto LABEL_8;
  if (memoryPressureStatus == 4 || memoryPressureStatus == 2)
  {
    LOBYTE(memoryPressureStatus) = 0;
LABEL_8:
    obj->_keepData = memoryPressureStatus;
  }
  objc_sync_exit(obj);

}

- (id)_getCountryCodeForCountryName
{
  NSDictionary *countryCodeForCountryName;
  SGTimeZoneDetector *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  SGTimeZoneDetector *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id *location;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  countryCodeForCountryName = self->_countryCodeForCountryName;
  if (countryCodeForCountryName)
    return countryCodeForCountryName;
  v5 = self;
  location = (id *)&self->_countryCodeForCountryName;
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathForResource:ofType:", CFSTR("TimeZoneCountryNames"), CFSTR("plist"));
  v8 = objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("SGTimeZone.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tzCountryNamesDataPath"));

  }
  v38 = (void *)v8;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v8);
  objc_msgSend(v37, "objectForKey:", CFSTR("Country Code Dictionary Supplement"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E4781780);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v53;
    v15 = MEMORY[0x1E0C80978];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v53 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v17, "length") < 3)
        {
          v20 = 2;
        }
        else
        {
          v18 = objc_msgSend(v17, "characterAtIndex:", 2);
          if (v18 > 0x7F)
            v19 = __maskrune(v18, 0x1000uLL);
          else
            v19 = *(_DWORD *)(v15 + 4 * v18 + 60) & 0x1000;
          if (v19)
            v20 = 3;
          else
            v20 = 2;
        }
        objc_msgSend(v17, "substringToIndex:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v21);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v13);
  }

  v36 = v10;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v49;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v49 != v40)
          objc_enumerationMutation(obj);
        v42 = v22;
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v22));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes");
        v43 = (id)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v45 != v26)
                objc_enumerationMutation(v43);
              v28 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
              objc_msgSend(v23, "localizedStringForCountryCode:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_normalizedCountryString:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v30, "length"))
              {
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, v30);
              }
              else
              {
                v31 = v5;
                v32 = v6;
                sgLogHandle();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v57 = v28;
                  _os_log_error_impl(&dword_1A2267000, v33, OS_LOG_TYPE_ERROR, "SGTimeZoneDetector-_getCountryCodeForCountryName: nil or empty normalizedLocalizedCountry for country code %@", buf, 0xCu);
                }

                v6 = v32;
                v5 = v31;
              }

            }
            v25 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
          }
          while (v25);
        }

        v22 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v41);
  }

  if (v5->_keepData)
    objc_storeStrong(location, v6);

  return v6;
}

- (id)_getTimeZoneForCountryCode
{
  NSDictionary *timeZoneForCountryCode;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  id *location;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  timeZoneForCountryCode = self->_timeZoneForCountryCode;
  if (timeZoneForCountryCode)
    return timeZoneForCountryCode;
  location = (id *)&self->_timeZoneForCountryCode;
  obj = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E80], "knownTimeZoneNames");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v5)
    goto LABEL_20;
  v6 = v5;
  v7 = *(_QWORD *)v20;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
      v10 = (void *)MEMORY[0x1A8583A40]();
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedName:locale:", 5, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "length") == 2)
      {
        v14 = objc_msgSend(v13, "characterAtIndex:", 0);
        if (v14 > 0x7F)
        {
          if (!__maskrune(v14, 0x8000uLL))
            goto LABEL_18;
        }
        else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v14 + 60) & 0x8000) == 0)
        {
          goto LABEL_18;
        }
        v15 = objc_msgSend(v13, "characterAtIndex:", 1);
        if (v15 > 0x7F)
        {
          if (!__maskrune(v15, 0x8000uLL))
            goto LABEL_18;
LABEL_17:
          objc_msgSend(obj, "setValue:forKey:", v9, v13);
          goto LABEL_18;
        }
        if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v15 + 60) & 0x8000) != 0)
          goto LABEL_17;
      }
LABEL_18:

      objc_autoreleasePoolPop(v10);
      ++v8;
    }
    while (v6 != v8);
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v6);
LABEL_20:

  if (self->_keepData)
    objc_storeStrong(location, obj);

  return obj;
}

- (void)_readPlistRegionAbbreviationsData
{
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *timeZoneForCountryCodeDictionarySupplement;
  NSDictionary *v8;
  NSDictionary *regionAbbreviations;
  NSDictionary *v10;
  NSDictionary *timeZoneForPostalCode;
  NSDictionary *v12;
  NSDictionary *timeZoneAbbreviations;
  NSDictionary *v14;
  NSDictionary *uniquePostalCodeFormats;
  NSDictionary *v16;
  NSDictionary *postalCodeFormats;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("TimeZoneRegionAbbreviations"), CFSTR("plist"));
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTimeZone.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tzAbbreviationsDataPath"));

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v19);
  objc_msgSend(v5, "objectForKey:", CFSTR("Time Zone Dictionary Supplement"));
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  timeZoneForCountryCodeDictionarySupplement = self->_timeZoneForCountryCodeDictionarySupplement;
  self->_timeZoneForCountryCodeDictionarySupplement = v6;

  objc_msgSend(v5, "objectForKey:", CFSTR("Region Abbreviation Dictionary"));
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  regionAbbreviations = self->_regionAbbreviations;
  self->_regionAbbreviations = v8;

  objc_msgSend(v5, "objectForKey:", CFSTR("Postal Code Time Zone Dictionary"));
  v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  timeZoneForPostalCode = self->_timeZoneForPostalCode;
  self->_timeZoneForPostalCode = v10;

  objc_msgSend(v5, "objectForKey:", CFSTR("Time Zone Abbreviations"));
  v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  timeZoneAbbreviations = self->_timeZoneAbbreviations;
  self->_timeZoneAbbreviations = v12;

  objc_msgSend(v5, "objectForKey:", CFSTR("Unique Postal Code Formats"));
  v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  uniquePostalCodeFormats = self->_uniquePostalCodeFormats;
  self->_uniquePostalCodeFormats = v14;

  objc_msgSend(v5, "objectForKey:", CFSTR("Postal Code Formats"));
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  postalCodeFormats = self->_postalCodeFormats;
  self->_postalCodeFormats = v16;

}

- (void)cleanupCache
{
  NSDictionary *timeZoneForCountryCodeDictionarySupplement;
  NSDictionary *regionAbbreviations;
  NSDictionary *timeZoneForPostalCode;
  NSDictionary *timeZoneAbbreviations;
  NSDictionary *uniquePostalCodeFormats;
  NSDictionary *postalCodeFormats;
  SGTimeZoneDetector *obj;

  obj = self;
  objc_sync_enter(obj);
  timeZoneForCountryCodeDictionarySupplement = obj->_timeZoneForCountryCodeDictionarySupplement;
  obj->_timeZoneForCountryCodeDictionarySupplement = 0;

  regionAbbreviations = obj->_regionAbbreviations;
  obj->_regionAbbreviations = 0;

  timeZoneForPostalCode = obj->_timeZoneForPostalCode;
  obj->_timeZoneForPostalCode = 0;

  timeZoneAbbreviations = obj->_timeZoneAbbreviations;
  obj->_timeZoneAbbreviations = 0;

  uniquePostalCodeFormats = obj->_uniquePostalCodeFormats;
  obj->_uniquePostalCodeFormats = 0;

  postalCodeFormats = obj->_postalCodeFormats;
  obj->_postalCodeFormats = 0;

  objc_sync_exit(obj);
}

- (id)_getTimeZoneForCountryCodeDictionarySupplement
{
  NSDictionary *timeZoneForCountryCodeDictionarySupplement;

  timeZoneForCountryCodeDictionarySupplement = self->_timeZoneForCountryCodeDictionarySupplement;
  if (!timeZoneForCountryCodeDictionarySupplement)
  {
    -[SGTimeZoneDetector _readPlistRegionAbbreviationsData](self, "_readPlistRegionAbbreviationsData");
    timeZoneForCountryCodeDictionarySupplement = self->_timeZoneForCountryCodeDictionarySupplement;
  }
  return timeZoneForCountryCodeDictionarySupplement;
}

- (id)_getRegionAbbreviations
{
  NSDictionary *regionAbbreviations;

  regionAbbreviations = self->_regionAbbreviations;
  if (!regionAbbreviations)
  {
    -[SGTimeZoneDetector _readPlistRegionAbbreviationsData](self, "_readPlistRegionAbbreviationsData");
    regionAbbreviations = self->_regionAbbreviations;
  }
  return regionAbbreviations;
}

- (id)_getTimeZoneForPostalCode
{
  NSDictionary *timeZoneForPostalCode;

  timeZoneForPostalCode = self->_timeZoneForPostalCode;
  if (!timeZoneForPostalCode)
  {
    -[SGTimeZoneDetector _readPlistRegionAbbreviationsData](self, "_readPlistRegionAbbreviationsData");
    timeZoneForPostalCode = self->_timeZoneForPostalCode;
  }
  return timeZoneForPostalCode;
}

- (id)_getTimeZoneAbbreviations
{
  NSDictionary *timeZoneAbbreviations;

  timeZoneAbbreviations = self->_timeZoneAbbreviations;
  if (!timeZoneAbbreviations)
  {
    -[SGTimeZoneDetector _readPlistRegionAbbreviationsData](self, "_readPlistRegionAbbreviationsData");
    timeZoneAbbreviations = self->_timeZoneAbbreviations;
  }
  return timeZoneAbbreviations;
}

- (id)_getUniquePostalCodeFormats
{
  NSDictionary *uniquePostalCodeFormats;

  uniquePostalCodeFormats = self->_uniquePostalCodeFormats;
  if (!uniquePostalCodeFormats)
  {
    -[SGTimeZoneDetector _readPlistRegionAbbreviationsData](self, "_readPlistRegionAbbreviationsData");
    uniquePostalCodeFormats = self->_uniquePostalCodeFormats;
  }
  return uniquePostalCodeFormats;
}

- (id)_getPostalCodeFormats
{
  NSDictionary *postalCodeFormats;

  postalCodeFormats = self->_postalCodeFormats;
  if (!postalCodeFormats)
  {
    -[SGTimeZoneDetector _readPlistRegionAbbreviationsData](self, "_readPlistRegionAbbreviationsData");
    postalCodeFormats = self->_postalCodeFormats;
  }
  return postalCodeFormats;
}

- (id)_getRegionNames
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("TimeZoneRegionNames"), CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTimeZone.m"), 289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tzNamesDataPath"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v5);
  objc_msgSend(v6, "objectForKey:", CFSTR("Region Name Dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_postalCodeForAddress:(id)a3 withCountryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *context;
  void *v29;
  void *v30;

  v6 = a3;
  v7 = a4;
  -[SGTimeZoneDetector _getPostalCodeFormats](self, "_getPostalCodeFormats");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1A8583A40]();
    objc_msgSend((id)objc_opt_class(), "_regularExpressionForPostalCodeFormat:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      context = (void *)MEMORY[0x1A8583A40]();
      objc_msgSend(v12, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "range");
      v16 = v15;

      objc_msgSend(v6, "substringWithRange:", v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "invertedSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsSeparatedByCharactersInSet:", v19);
      v29 = v12;
      v20 = v6;
      v21 = v8;
      v22 = v7;
      v23 = v10;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_pas_componentsJoinedByString:", &stru_1E4762D08);
      v30 = v11;
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v23;
      v7 = v22;
      v8 = v21;
      v6 = v20;
      v12 = v29;

      objc_msgSend(v25, "uppercaseString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v30;
      objc_autoreleasePoolPop(context);
    }
    else
    {
      v26 = 0;
    }

    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (_NSRange)_airportCodeRangeForAddress:(id)a3
{
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  _NSRange result;

  v5 = (objc_class *)MEMORY[0x1E0CB38E8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithPattern:options:error:", CFSTR("\\([A-Z][A-Z][A-Z]\\)"), 0, 0);
  v8 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v10 = v9;

  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10 != 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTimeZone.m"), 361, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rangeOfFirstMatch.length == 5"));

    }
    v11 = v8 + 1;
    v10 -= 2;
  }

  v12 = v11;
  v13 = v10;
  result.length = v13;
  result.location = v12;
  return result;
}

- (id)_acronymForAddress:(id)a3 airportCodeRange:(_NSRange)a4 airportCodeNames:(id)a5
{
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  int v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  uint64_t i;
  void *v26;

  location = a4.location;
  v7 = a5;
  objc_msgSend(a3, "substringToIndex:", location - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  v12 = objc_msgSend(v10, "count");
  if (v12 - 1 < 0)
  {
LABEL_12:
    v21 = 0;
    goto LABEL_13;
  }
  v13 = v12;
  v14 = 0;
  v15 = MEMORY[0x1E0C80978];
  while (1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", --v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      break;

LABEL_11:
    if (v13 <= 0)
      goto LABEL_12;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "characterAtIndex:", 0);
  if (v18 > 0x7F)
    v19 = __maskrune(v18, 0x8000uLL);
  else
    v19 = *(_DWORD *)(v15 + 4 * v18 + 60) & 0x8000;

  if (!v19)
    goto LABEL_11;
  objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertObject:atIndex:", v20, 0);

  if (v14 <= 1)
  {
    ++v14;
    goto LABEL_11;
  }
  objc_msgSend(v11, "_pas_componentsJoinedByString:", CFSTR(" "));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v21 = 0;
  }
  else
  {
    v21 = (void *)objc_opt_new();
    for (i = 0; i != 3; ++i)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "appendFormat:", CFSTR("%c"), objc_msgSend(v26, "characterAtIndex:", 0));

    }
  }

LABEL_13:
  return v21;
}

- (id)_countryCodeByRegionAbbreviationFromNormalizedAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *context;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGTimeZoneDetector _getRegionAbbreviations](self, "_getRegionAbbreviations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v37;
    v29 = v8;
    v30 = v5;
    v26 = *(_QWORD *)v37;
    do
    {
      v12 = 0;
      v27 = v10;
      do
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1A8583A40]();
        objc_msgSend(v5, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          context = v14;
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v28 = v15;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v33;
            while (2)
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v33 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(v16, "objectForKey:", v21, v26);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)objc_opt_class(), "_regularExpressionForPostalCodeFormat:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v23, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v24 = v21;

                  objc_autoreleasePoolPop(context);
                  v8 = v29;
                  v5 = v30;
                  goto LABEL_21;
                }

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              if (v18)
                continue;
              break;
            }
          }

          v8 = v29;
          v5 = v30;
          v11 = v26;
          v10 = v27;
          v14 = context;
          v15 = v28;
        }

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      v24 = 0;
    }
    while (v10);
  }
  else
  {
    v24 = 0;
  }
LABEL_21:

  return v24;
}

- (id)_countryCodeByRegularExpressionFromNormalizedAddress:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[SGTimeZoneDetector _getUniquePostalCodeFormats](self, "_getUniquePostalCodeFormats");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    v7 = (id)v6;
    if (v6)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
          v11 = (void *)MEMORY[0x1A8583A40](v6);
          objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v12, 0, 0);
          if (objc_msgSend(v13, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v7 = v10;

            objc_autoreleasePoolPop(v11);
            goto LABEL_12;
          }

          objc_autoreleasePoolPop(v11);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v7 = (id)v6;
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_countryCodeByRegionNameFromNormalizedAddress:(id)a3 withWords:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v18;
  void *context;

  v6 = a3;
  v7 = a4;
  -[SGTimeZoneDetector _getRegionNames](self, "_getRegionNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v7, "count");
  v9 = v18 - 2;
  v10 = 3;
  while (1)
  {
    context = (void *)MEMORY[0x1A8583A40]();
    if (v18 >= (uint64_t)v10)
      break;
LABEL_10:
    objc_autoreleasePoolPop(context);
    ++v9;
    if (v10-- <= 1)
    {
      v14 = 0;
      goto LABEL_13;
    }
  }
  v11 = 0;
  while (1)
  {
    if (v10 == 1)
    {
      objc_msgSend(v7, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "subarrayWithRange:", v11, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_pas_componentsJoinedByString:", CFSTR(" "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "objectForKey:", v12, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[SGTimeZoneDetector _postalCodeForAddress:withCountryCode:](self, "_postalCodeForAddress:withCountryCode:", v6, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        break;
    }

    if (v9 == ++v11)
      goto LABEL_10;
  }

  objc_autoreleasePoolPop(context);
LABEL_13:

  return v14;
}

- (id)_countryCodeByCountryNameFromNormalizedAddressWords:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SGTimeZoneDetector _getCountryCodeForCountryName](self, "_getCountryCodeForCountryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  v7 = v6 - 1;
  v8 = v6 + 5;
  do
  {
    v9 = v7;
    v10 = v8;
    if (v7 < 0)
      break;
    objc_msgSend(v4, "objectAtIndex:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v12);

    v7 = v9 - 1;
    v8 = v10 - 1;
  }
  while (v13 != 0x7FFFFFFFFFFFFFFFLL);
  v14 = (void *)objc_opt_new();
  v15 = 5;
  if (v9 > 5)
    v15 = v9;
  if (v15 - 5 <= v9)
  {
    v16 = 5;
    if (v9 > 5)
      v16 = v9;
    v17 = v16 - 6;
    v18 = v10 - v16;
    do
    {
      objc_msgSend(v4, "subarrayWithRange:", ++v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_pas_componentsJoinedByString:", CFSTR(" "));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "addObject:", v20);
      --v18;
    }
    while (v17 < v9);
  }
  if (v9 >= 1)
  {
    if (v9 >= 6)
      v9 = 6;
    do
    {
      objc_msgSend(v4, "subarrayWithRange:", 0, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_pas_componentsJoinedByString:", CFSTR(" "));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "addObject:", v22);
    }
    while ((unint64_t)v9-- > 1);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v24 = v14;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), (_QWORD)v32);
        v29 = objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v30 = (void *)v29;
          goto LABEL_25;
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v26)
        continue;
      break;
    }
  }
  v30 = 0;
LABEL_25:

  return v30;
}

- (id)timeZoneFromAiportCodeForAddress:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;

  v5 = a3;
  v6 = -[SGTimeZoneDetector _airportCodeRangeForAddress:](self, "_airportCodeRangeForAddress:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v11 = (void *)MEMORY[0x1A8583A40]();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathForResource:ofType:", CFSTR("TimeZoneAirportCodes"), CFSTR("plist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTimeZone.m"), 504, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tzAirportCodesDataPath"));

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v13);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Airport Codes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Airport Code Names"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGTimeZoneDetector _acronymForAddress:airportCodeRange:airportCodeNames:](self, "_acronymForAddress:airportCodeRange:airportCodeNames:", v5, v9, v10, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringWithRange:", v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 && (objc_msgSend(v18, "isEqualToString:", v17) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_autoreleasePoolPop(v11);
  }

  return v8;
}

- (id)countryCodeForAddress:(id)a3
{
  id v4;
  SGTimeZoneDetector *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend((id)objc_opt_class(), "_normalizedString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGTimeZoneDetector _countryCodeByRegionAbbreviationFromNormalizedAddress:](v5, "_countryCodeByRegionAbbreviationFromNormalizedAddress:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (-[SGTimeZoneDetector _countryCodeByRegularExpressionFromNormalizedAddress:](v5, "_countryCodeByRegularExpressionFromNormalizedAddress:", v7), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v6, "capitalizedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGTimeZoneDetector _countryCodeByRegionNameFromNormalizedAddress:withWords:](v5, "_countryCodeByRegionNameFromNormalizedAddress:withWords:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      -[SGTimeZoneDetector _countryCodeByCountryNameFromNormalizedAddressWords:](v5, "_countryCodeByCountryNameFromNormalizedAddressWords:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v13;

  }
  objc_sync_exit(v5);

  return v9;
}

- (id)_timeZoneNameForPostalCode:(id)a3 withPostalCodeTable:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
LABEL_6:
    v14 = 0;
  }
  else
  {
    v9 = v8;
    while (1)
    {
      v10 = (void *)MEMORY[0x1A8583A40]();
      objc_msgSend(v6, "substringToIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        break;

      objc_autoreleasePoolPop(v10);
      if (v9-- <= 1)
        goto LABEL_6;
    }
    v14 = v12;
    if ((unint64_t)objc_msgSend(v12, "length") <= 2)
    {
      -[SGTimeZoneDetector _getTimeZoneAbbreviations](self, "_getTimeZoneAbbreviations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v14);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }

    objc_autoreleasePoolPop(v10);
  }

  return v14;
}

- (id)timeZoneNameForAddress:(id)a3 withCountryCode:(id)a4
{
  id v6;
  id v7;
  SGTimeZoneDetector *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend((id)objc_opt_class(), "_normalizedString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGTimeZoneDetector _getTimeZoneForPostalCode](v8, "_getTimeZoneForPostalCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SGTimeZoneDetector _postalCodeForAddress:withCountryCode:](v8, "_postalCodeForAddress:withCountryCode:", v9, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGTimeZoneDetector _timeZoneNameForPostalCode:withPostalCodeTable:](v8, "_timeZoneNameForPostalCode:withPostalCodeTable:", v12, v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SGTimeZoneDetector _getTimeZoneForCountryCodeDictionarySupplement](v8, "_getTimeZoneForCountryCodeDictionarySupplement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v13 = v14;
    }
    else
    {
      -[SGTimeZoneDetector _getTimeZoneForCountryCode](v8, "_getTimeZoneForCountryCode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v7);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  objc_sync_exit(v8);
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_postalCodeFormats, 0);
  objc_storeStrong((id *)&self->_uniquePostalCodeFormats, 0);
  objc_storeStrong((id *)&self->_timeZoneAbbreviations, 0);
  objc_storeStrong((id *)&self->_timeZoneForPostalCode, 0);
  objc_storeStrong((id *)&self->_regionAbbreviations, 0);
  objc_storeStrong((id *)&self->_timeZoneForCountryCodeDictionarySupplement, 0);
  objc_storeStrong((id *)&self->_timeZoneForCountryCode, 0);
  objc_storeStrong((id *)&self->_countryCodeForCountryName, 0);
}

void __26__SGTimeZoneDetector_init__block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t *v3;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    WeakRetained[12] = (dispatch_source_t)dispatch_source_get_data(WeakRetained[11]);
    objc_msgSend(*(id *)(a1 + 32), "_handleMemoryPressureStatus");
    WeakRetained = v3;
  }

}

+ (id)_normalizedCountryString:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  trimAfterDelimiter(a3, (uint64_t)CFSTR(" -"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  trimAfterDelimiter(v4, (uint64_t)CFSTR(" ("));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  v7 = objc_msgSend(v6, "rangeOfString:", CFSTR(" & "));
  v8 = v6;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR(" & "), "length") + v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("St. "), CFSTR("Saint "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("So. "), CFSTR("South "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("No. "), CFSTR("North "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_normalizedString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "capitalizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_normalizedString:(id)a3
{
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
  id v22;

  v4 = (void *)MEMORY[0x1A8583A40](a1, a2);
  objc_msgSend(a3, "decomposedStringWithCompatibilityMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_pas_componentsJoinedByString:", &stru_1E4762D08);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "nonBaseCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_pas_componentsJoinedByString:", &stru_1E4762D08);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 688, 64);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_pas_componentsJoinedByString:", &stru_1E4762D08);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != ''"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "filteredArrayUsingPredicate:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_pas_componentsJoinedByString:", CFSTR(" "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v21;
  objc_autoreleasePoolPop(v4);

  return v22;
}

+ (id)_regularExpressionForPostalCodeFormat:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "appendString:", CFSTR("\\b"));
  objc_msgSend(v4, "appendString:", v3);

  objc_msgSend(v4, "appendString:", CFSTR("\\b"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v4, 1, 0);

  return v5;
}

@end
