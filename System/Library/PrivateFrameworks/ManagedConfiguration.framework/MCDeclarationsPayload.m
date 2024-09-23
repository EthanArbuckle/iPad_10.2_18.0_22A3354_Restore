@implementation MCDeclarationsPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.declarations"));
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

  return MCLocalizedFormat(CFSTR("DECLARATIONS_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("DECLARATIONS_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCDeclarationsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCDeclarationsPayload *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  NSArray *declarations;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MCDeclarationsPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v28, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (v9)
  {
    v27 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Declarations"), 1, &v27);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = (NSArray *)v27;
    if (v11)
    {
      v12 = v11;
      -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (a5)
        *a5 = objc_retainAutorelease(v13);
      v15 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = (void *)objc_opt_class();
        v18 = v17;
        objc_msgSend(v14, "MCVerboseDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v17;
        v31 = 2114;
        v32 = v19;
        _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v9 = 0;
      declarations = v10;
      v10 = v12;
    }
    else
    {
      if (objc_msgSend(v8, "count"))
      {
        v21 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
        {
          v22 = v21;
          -[MCPayload friendlyName](v9, "friendlyName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "allKeys");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v23;
          v31 = 2114;
          v32 = v24;
          _os_log_impl(&dword_19ECC4000, v22, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

        }
      }
      v25 = -[NSArray copy](v10, "copy");
      declarations = v9->_declarations;
      v9->_declarations = (NSArray *)v25;
    }

  }
  return v9;
}

- (id)declarationsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDeclarationsPayload declarations](self, "declarations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Declarations"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCDeclarationsPayload;
  -[MCPayload stubDictionary](&v6, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDeclarationsPayload declarationsDictionary](self, "declarationsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MCDeclarationsPayload;
  -[MCPayload verboseDescription](&v8, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCDeclarationsPayload declarations](self, "declarations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: Declarations:%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  MCKeyValue *v8;
  __CFString *v9;
  void *v10;
  MCKeyValue *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[MCDeclarationsPayload declarations](self, "declarations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [MCKeyValue alloc];
  if (v6 <= 1)
    v9 = CFSTR("DECLARATIONS_SINGULAR_FORMAT");
  else
    v9 = CFSTR("DECLARATIONS_PLURAL_FORMAT");
  MCLocalizedString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MCKeyValue initWithLocalizedString:localizedKey:](v8, "initWithLocalizedString:localizedKey:", v7, v10);

  objc_msgSend(v4, "addObject:", v11);
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (NSArray)declarations
{
  return self->_declarations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarations, 0);
}

@end
