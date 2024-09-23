@implementation MCFontPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.font");
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

  return MCLocalizedFormat(CFSTR("FONT_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("FONT_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCFontPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCFontPayload *v10;
  uint64_t v11;
  id v12;
  NSString *name;
  uint64_t v14;
  NSData *fontData;
  void *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v31;
  uint64_t v32;
  NSURL *persistentURL;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)MCFontPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v39, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_18;
  if (objc_msgSend(v9, "isStub"))
  {
    v38 = 0;
    +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Name"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v38);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v38;
    name = v10->_name;
    v10->_name = (NSString *)v11;

    if (v12
      || (v37 = 0,
          +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Font"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v37), v14 = objc_claimAutoreleasedReturnValue(), v12 = v37, fontData = v10->_fontData, v10->_fontData = (NSData *)v14, fontData, v12))
    {
      v16 = 0;
    }
    else
    {
      v36 = 0;
      +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PersistentURL"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v36);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v36;
      if (v31)
      {
        v12 = v31;
      }
      else
      {
        if (objc_msgSend(v16, "length"))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
          v32 = objc_claimAutoreleasedReturnValue();
          persistentURL = v10->_persistentURL;
          v10->_persistentURL = (NSURL *)v32;

        }
        v12 = 0;
      }
    }
  }
  else
  {
    v35 = 0;
    +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Name"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v35);
    v17 = objc_claimAutoreleasedReturnValue();
    v12 = v35;
    v18 = v10->_name;
    v10->_name = (NSString *)v17;

    if (v12)
    {
LABEL_9:
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (a5)
        *a5 = objc_retainAutorelease(v20);
      v22 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v23 = v22;
        v24 = (void *)objc_opt_class();
        v25 = v24;
        objc_msgSend(v21, "MCVerboseDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v24;
        v42 = 2114;
        v43 = v26;
        _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v10 = 0;
      goto LABEL_14;
    }
    v34 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Font"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v34);
    v19 = objc_claimAutoreleasedReturnValue();
    v12 = v34;
    v16 = v10->_fontData;
    v10->_fontData = (NSData *)v19;
  }

  if (v12)
    goto LABEL_9;
LABEL_14:
  if (objc_msgSend(v8, "count"))
  {
    v27 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v28 = v27;
      -[MCPayload friendlyName](v10, "friendlyName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v29;
      v42 = 2114;
      v43 = v8;
      _os_log_impl(&dword_19ECC4000, v28, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_18:
  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCFontPayload;
  -[MCPayload stubDictionary](&v10, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCFontPayload name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCFontPayload name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Name"));

  }
  -[MCFontPayload persistentURL](self, "persistentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCFontPayload persistentURL](self, "persistentURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("PersistentURL"));

  }
  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCFontPayload;
  -[MCPayload verboseDescription](&v10, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCFontPayload name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCFontPayload name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Name        : %@\n"), v6);

  }
  -[MCFontPayload persistentURL](self, "persistentURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MCFontPayload persistentURL](self, "persistentURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Path on disk: %@\n"), v8);

  }
  return v4;
}

- (id)title
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("FONT_TITLE"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)subtitle1Label
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  -[MCFontPayload name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    MCLocalizedFormat(CFSTR("FONT_NAME_TITLE_COLON"), v3, v4, v5, v6, v7, v8, v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)subtitle1Description
{
  void *v3;
  void *v4;

  -[MCFontPayload name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCFontPayload name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSData)fontData
{
  return self->_fontData;
}

- (void)setFontData:(id)a3
{
  objc_storeStrong((id *)&self->_fontData, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSURL)persistentURL
{
  return self->_persistentURL;
}

- (void)setPersistentURL:(id)a3
{
  objc_storeStrong((id *)&self->_persistentURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fontData, 0);
}

@end
