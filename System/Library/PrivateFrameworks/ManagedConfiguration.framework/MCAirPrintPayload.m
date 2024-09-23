@implementation MCAirPrintPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.airprint");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
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

  return MCLocalizedFormat(CFSTR("AIRPRINT_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("AIRPRINT_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCAirPrintPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCAirPrintPayload *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSMutableArray *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  MCAirPrintPayload *v25;
  id *v26;
  id v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSMutableArray *ippAddresses;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id *v50;
  id v51;
  id obj;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  objc_super v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v64.receiver = self;
  v64.super_class = (Class)MCAirPrintPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v64, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_55;
  v53 = v9;
  if ((objc_msgSend(v9, "isStub") & 1) != 0)
  {
    v58 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("AirPrintCount"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v58);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v58;
    if (v12)
    {
      v13 = v12;
    }
    else
    {
      v10->_airPrintCount = objc_msgSend(v11, "unsignedIntegerValue");
      v57 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("IPPAddresses"), 0, &v57);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v57;
      v34 = objc_msgSend(v33, "mutableCopy");
      ippAddresses = v10->_ippAddresses;
      v10->_ippAddresses = (NSMutableArray *)v34;

    }
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v10->_ippAddresses;
  v10->_ippAddresses = (NSMutableArray *)v14;

  v63 = 0;
  +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("AirPrint"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v63);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v63;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v11 = v16;
  v54 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (!v54)
    goto LABEL_37;
  v55 = *(_QWORD *)v60;
  v50 = a5;
  v51 = v8;
  obj = v11;
  while (2)
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v60 != v55)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("AirPrint"));
        v19 = v13;
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("IPAddress"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("IPAddress"));
        v36 = objc_claimAutoreleasedReturnValue();

LABEL_41:
        v13 = (id)v36;
LABEL_43:

LABEL_44:
        v11 = obj;

        goto LABEL_45;
      }
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ResourcePath"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("ResourcePath"));
        v36 = objc_claimAutoreleasedReturnValue();

        goto LABEL_41;
      }
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Port"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v25 = v10;
        v26 = a5;
        v27 = v8;
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("Port"));
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v13;
        v30 = 6;
      }
      else
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ForceTLS"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v56 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v25 = v10;
          v26 = a5;
          v27 = v8;
          +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("ForceTLS"));
          v28 = objc_claimAutoreleasedReturnValue();
          v22 = v13;
          v30 = 6;
        }
        else
        {
          v22 = objc_alloc_init(MEMORY[0x1E0CB3998]);
          objc_msgSend(v22, "setHost:", v19);
          if (objc_msgSend(v21, "integerValue") >= 1)
            objc_msgSend(v22, "setPort:", v21);
          if (objc_msgSend(v56, "BOOLValue"))
            v23 = CFSTR("ipps");
          else
            v23 = CFSTR("ipp");
          objc_msgSend(v22, "setScheme:", v23);
          if (objc_msgSend(v20, "rangeOfString:options:", CFSTR("/"), 8) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setPath:", v24);

          }
          else
          {
            objc_msgSend(v22, "setPath:", v20);
          }
          objc_msgSend(v22, "URL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "absoluteString");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            v28 = (uint64_t)v13;
            -[NSMutableArray addObject:](v10->_ippAddresses, "addObject:", v32);
            v30 = 0;
          }
          else
          {
            +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("AirPrint"));
            v28 = objc_claimAutoreleasedReturnValue();

            v30 = 6;
          }

          v25 = v10;
          v26 = v50;
          v27 = v51;
        }

        v29 = v56;
      }

      if (v30)
      {
        v13 = (id)v28;
        v8 = v27;
        a5 = v26;
        v10 = v25;
        goto LABEL_44;
      }
      ++v17;
      v13 = (id)v28;
      v8 = v27;
      a5 = v26;
      v10 = v25;
    }
    while (v54 != v17);
    v11 = obj;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (v54)
      continue;
    break;
  }
LABEL_37:

  v10->_airPrintCount = -[NSMutableArray count](v10->_ippAddresses, "count");
LABEL_45:

  if (v13)
  {
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v13);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (a5)
      *a5 = objc_retainAutorelease(v37);
    v39 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v40 = v39;
      v41 = v13;
      v42 = v8;
      v43 = (void *)objc_opt_class();
      v44 = v43;
      objc_msgSend(v38, "MCVerboseDescription");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v43;
      v8 = v42;
      v13 = v41;
      v67 = 2114;
      v68 = v45;
      _os_log_impl(&dword_19ECC4000, v40, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v46 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v47 = v46;
      -[MCPayload friendlyName](v10, "friendlyName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v48;
      v67 = 2114;
      v68 = v8;
      _os_log_impl(&dword_19ECC4000, v47, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

  v9 = v53;
LABEL_55:

  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCAirPrintPayload;
  -[MCPayload stubDictionary](&v8, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MCAirPrintPayload airPrintCount](self, "airPrintCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("AirPrintCount"));

  -[MCAirPrintPayload ippAddresses](self, "ippAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCAirPrintPayload ippAddresses](self, "ippAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("IPPAddresses"));

  }
  return v3;
}

- (id)subtitle1Label
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t vars0;

  if (-[MCAirPrintPayload airPrintCount](self, "airPrintCount"))
    MCLocalizedFormat(CFSTR("AIRPRINT_TITLE_COLON"), v2, v3, v4, v5, v6, v7, v8, vars0);
  else
    MCLocalizedString(CFSTR("AIRPRINT_COUNT_NONE"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)subtitle1Description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = -[MCAirPrintPayload airPrintCount](self, "airPrintCount");
  return MCLocalizedFormat(CFSTR("AIRPRINT_COUNT"), v3, v4, v5, v6, v7, v8, v9, v2);
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)MCAirPrintPayload;
  -[MCPayload verboseDescription](&v16, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCAirPrintPayload ippAddresses](self, "ippAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "appendString:", CFSTR("AirPrint paths:\n"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[MCAirPrintPayload ippAddresses](self, "ippAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "appendFormat:", CFSTR("  %@\n"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MCAirPrintPayload airPrintCount](self, "airPrintCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("AirPrint devices: %@\n"), v6);
  }

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MCKeyValue *v24;
  void *v25;
  MCKeyValue *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  MCKeyValue *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[MCAirPrintPayload ippAddresses](self, "ippAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v31 = v3;
    v6 = (void *)MEMORY[0x1E0C99DE8];
    -[MCAirPrintPayload ippAddresses](self, "ippAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v8;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[MCAirPrintPayload ippAddresses](self, "ippAddresses");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    v33 = (void *)v8;
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(obj);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "scheme");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "port");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "host");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "path");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          v20 = (void *)MEMORY[0x1E0CB3940];
          if (v16)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":%@"), v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringWithFormat:", CFSTR("%@://%@%@%@"), v15, v17, v21, v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v33;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@%@%@"), v15, v17, &stru_1E41E70C8, v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v9, "addObject:", v22);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v11);
    }

    MCLocalizedString(CFSTR("AIRPRINT_PATHS"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v9, v23, 0);
    v24 = (MCKeyValue *)objc_claimAutoreleasedReturnValue();

    v3 = v31;
    if (v24)
      objc_msgSend(v31, "addObject:", v24);
    v25 = v33;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[MCAirPrintPayload airPrintCount](self, "airPrintCount"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("AIRPRINT_DEVICES"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCKeyValue initWithLocalizedString:localizedKey:](v26, "initWithLocalizedString:localizedKey:", v25, v27);

    v38 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }
  return v3;
}

- (id)restrictions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("union"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("knownAirPrintTargets"));
  -[MCAirPrintPayload ippAddresses](self, "ippAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCAirPrintPayload ippAddresses](self, "ippAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("values"));

  }
  return v3;
}

- (unint64_t)airPrintCount
{
  return self->_airPrintCount;
}

- (void)setAirPrintCount:(unint64_t)a3
{
  self->_airPrintCount = a3;
}

- (NSMutableArray)ippAddresses
{
  return self->_ippAddresses;
}

- (void)setIppAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_ippAddresses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ippAddresses, 0);
}

@end
