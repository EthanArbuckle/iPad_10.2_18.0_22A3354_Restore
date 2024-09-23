@implementation GEOSearchAttributionInfo

- (GEOSearchAttributionInfo)initWithSource:(id)a3 localizedAttribution:(id)a4 logoPaths:(id)a5 snippetLogoPaths:(id)a6
{
  _QWORD *v11;
  id *v12;
  id v13;
  id v14;
  GEOSearchAttributionInfo *v15;
  uint64_t v16;
  NSArray *logoPaths;
  uint64_t v18;
  NSArray *snippetLogoPaths;
  void *v20;
  uint64_t v21;
  NSString *displayName;
  void *v23;
  uint64_t v24;
  NSString *captionDisplayName;
  unint64_t v26;
  unint64_t i;
  objc_super v29;

  v11 = a3;
  v12 = (id *)a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)GEOSearchAttributionInfo;
  v15 = -[GEOSearchAttributionInfo init](&v29, sel_init);
  if (v15)
  {
    if (!objc_msgSend(v13, "count"))
    {

      v13 = 0;
    }
    if (!objc_msgSend(v14, "count"))
    {

      v14 = 0;
    }
    objc_storeStrong((id *)&v15->_source, a3);
    v16 = objc_msgSend(v13, "copy");
    logoPaths = v15->_logoPaths;
    v15->_logoPaths = (NSArray *)v16;

    v18 = objc_msgSend(v14, "copy");
    snippetLogoPaths = v15->_snippetLogoPaths;
    v15->_snippetLogoPaths = (NSArray *)v18;

    -[GEOLocalizedAttribution displayName](v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    displayName = v15->_displayName;
    v15->_displayName = (NSString *)v21;

    -[GEOLocalizedAttribution captionDisplayString](v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    captionDisplayName = v15->_captionDisplayName;
    v15->_captionDisplayName = (NSString *)v24;

    v26 = 0;
    if (!v11)
      goto LABEL_10;
LABEL_7:
    -[GEOSearchAttributionSource _readAttributionRequirements]((uint64_t)v11);
    for (i = v11[4]; v26 < i; i = 0)
    {
      v15->_attributionRequirementsMask |= 1 << -[GEOSearchAttributionSource attributionRequirementsAtIndex:]((uint64_t)v11, v26++);
      if (v11)
        goto LABEL_7;
LABEL_10:
      ;
    }
  }

  return v15;
}

- (NSString)identifier
{
  return -[GEOSearchAttributionSource sourceIdentifier]((id *)&self->_source->super.super.isa);
}

- (unsigned)version
{
  GEOSearchAttributionSource *source;

  source = self->_source;
  if (source)
    return source->_sourceVersion;
  else
    return 0;
}

- (NSArray)attributionApps
{
  return (NSArray *)-[GEOSearchAttributionSource attributionApps]((id *)&self->_source->super.super.isa);
}

- (NSString)webBaseActionURL
{
  return -[GEOSearchAttributionSource webBaseActionURL]((id *)&self->_source->super.super.isa);
}

- (BOOL)shouldOpenInAppStore
{
  GEOSearchAttributionSource *source;

  source = self->_source;
  return source && source->_enforceAppStore;
}

- (NSString)appAdamID
{
  return -[GEOSearchAttributionSource appAdamID]((id *)&self->_source->super.super.isa);
}

- (GEOSearchAttributionInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  GEOSearchAttributionInfo *v5;
  void *v6;
  GEOSearchAttributionSource *v7;
  GEOSearchAttributionSource *source;
  void *v9;
  uint64_t v10;
  NSString *displayName;
  void *v12;
  uint64_t v13;
  NSArray *logoPaths;
  void *v15;
  uint64_t v16;
  NSArray *snippetLogoPaths;
  void *v18;
  GEOSearchAttributionInfo *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOSearchAttributionInfo;
  v5 = -[GEOSearchAttributionInfo init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("source"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[GEOSearchAttributionSource initWithData:]([GEOSearchAttributionSource alloc], "initWithData:", v6);
      source = v5->_source;
      v5->_source = v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("displayName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("logoPaths"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "count"))
    {

      v12 = 0;
    }
    v13 = objc_msgSend(v12, "copy");
    logoPaths = v5->_logoPaths;
    v5->_logoPaths = (NSArray *)v13;

    objc_msgSend(v4, "objectForKey:", CFSTR("snippetLogoPaths"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "count"))
    {

      v15 = 0;
    }
    v16 = objc_msgSend(v15, "copy");
    snippetLogoPaths = v5->_snippetLogoPaths;
    v5->_snippetLogoPaths = (NSArray *)v16;

    objc_msgSend(v4, "objectForKey:", CFSTR("attributionRequirementsMask"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_attributionRequirementsMask = objc_msgSend(v18, "unsignedIntValue");

    v19 = v5;
  }

  return v5;
}

- (GEOSearchAttributionInfo)initWithCoder:(id)a3
{
  id v4;
  GEOSearchAttributionInfo *v5;
  uint64_t v6;
  GEOSearchAttributionSource *source;
  uint64_t v8;
  NSArray *snippetLogoPaths;
  uint64_t v10;
  NSArray *logoPaths;
  void *v12;
  uint64_t v13;
  NSString *displayName;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOSearchAttributionInfo;
  v5 = -[GEOSearchAttributionInfo init](&v17, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("source")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
      v6 = objc_claimAutoreleasedReturnValue();
      source = v5->_source;
      v5->_source = (GEOSearchAttributionSource *)v6;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("snippetLogoPaths")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snippetLogoPaths"));
      v8 = objc_claimAutoreleasedReturnValue();
      snippetLogoPaths = v5->_snippetLogoPaths;
      v5->_snippetLogoPaths = (NSArray *)v8;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("logoPaths")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoPaths"));
      v10 = objc_claimAutoreleasedReturnValue();
      logoPaths = v5->_logoPaths;
      v5->_logoPaths = (NSArray *)v10;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("displayName")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v13;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("requirementsMask")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requirementsMask"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_attributionRequirementsMask = objc_msgSend(v15, "unsignedIntValue");

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOSearchAttributionSource *source;
  id v5;
  void *v6;
  id v7;

  source = self->_source;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_logoPaths, CFSTR("logoPaths"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_snippetLogoPaths, CFSTR("snippetLogoPaths"));
  -[GEOSearchAttributionInfo displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("displayName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[GEOSearchAttributionInfo requirementsMask](self, "requirementsMask"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("requirementsMask"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsActionURLs
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[GEOSearchAttributionInfo attributionApps](self, "attributionApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v8, "handledSchemes", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "isEqualToString:", CFSTR("com.apple.maps.action")) & 1) != 0)
              {

                v14 = 1;
                goto LABEL_18;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v11)
              continue;
            break;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  -[GEOSearchAttributionInfo webBaseActionURL](self, "webBaseActionURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "length") != 0;
LABEL_18:

  return v14;
}

- (id)dictionaryRepresentation
{
  GEOSearchAttributionSource *source;
  void *v4;
  NSString *displayName;
  NSArray *logoPaths;
  void *v7;
  NSArray *snippetLogoPaths;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("source");
  source = self->_source;
  if (!source)
    source = (GEOSearchAttributionSource *)MEMORY[0x1E0C99D50];
  -[GEOSearchAttributionSource data](source, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  displayName = self->_displayName;
  v14[0] = v4;
  v14[1] = displayName;
  v13[1] = CFSTR("displayName");
  v13[2] = CFSTR("logoPaths");
  logoPaths = self->_logoPaths;
  v7 = logoPaths;
  if (!logoPaths)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v7;
  v13[3] = CFSTR("snippetLogoPaths");
  snippetLogoPaths = self->_snippetLogoPaths;
  v9 = snippetLogoPaths;
  if (!snippetLogoPaths)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v9;
  v13[4] = CFSTR("attributionRequirementsMask");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_attributionRequirementsMask);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!snippetLogoPaths)
  {

    if (logoPaths)
      goto LABEL_9;
LABEL_11:

    goto LABEL_9;
  }
  if (!logoPaths)
    goto LABEL_11;
LABEL_9:

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOSearchAttributionInfo;
  -[GEOSearchAttributionInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSearchAttributionInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasAttributionRequirement:(int)a3
{
  return (self->_attributionRequirementsMask >> a3) & 1;
}

- (id)logoPathForScale:(double)a3
{
  NSArray *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_logoPaths;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v20)
  {
    v5 = vcvtpd_u64_f64(a3);
    v6 = *(_QWORD *)v22;
    v19 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v4);
        v8 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (a3 <= 1.0)
        {
          v11 = v5;
          v12 = 0;
          v13 = 2;
          while (1)
          {
            v14 = v12;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%lux"), v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v8, "rangeOfString:", v15);

            if (v16 != 0x7FFFFFFFFFFFFFFFLL)
              break;
            v12 = 1;
            v13 = 3;
            if ((v14 & 1) != 0)
            {

              goto LABEL_17;
            }
          }

          v5 = v11;
          v6 = v19;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%lux"), v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "rangeOfString:", v9);

          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_17:
            v17 = v8;
            goto LABEL_19;
          }
        }
      }
      v17 = 0;
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v20)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)snippetLogoPathForScale:(double)a3
{
  NSArray *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_snippetLogoPaths;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v20)
  {
    v5 = vcvtpd_u64_f64(a3);
    v6 = *(_QWORD *)v22;
    v19 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v4);
        v8 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (a3 <= 1.0)
        {
          v11 = v5;
          v12 = 0;
          v13 = 2;
          while (1)
          {
            v14 = v12;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%lux"), v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v8, "rangeOfString:", v15);

            if (v16 != 0x7FFFFFFFFFFFFFFFLL)
              break;
            v12 = 1;
            v13 = 3;
            if ((v14 & 1) != 0)
            {

              goto LABEL_17;
            }
          }

          v5 = v11;
          v6 = v19;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%lux"), v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "rangeOfString:", v9);

          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_17:
            v17 = v8;
            goto LABEL_19;
          }
        }
      }
      v17 = 0;
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v20)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (void)addLogoPath:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *logoPaths;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    if (self->_logoPaths)
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
    else
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v5, "addObject:", v7);
    logoPaths = self->_logoPaths;
    self->_logoPaths = v5;

    v4 = v7;
  }

}

- (NSString)captionDisplayName
{
  return self->_captionDisplayName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unsigned)requirementsMask
{
  return self->_attributionRequirementsMask;
}

- (GEOSearchAttributionSource)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_snippetLogoPaths, 0);
  objc_storeStrong((id *)&self->_logoPaths, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
