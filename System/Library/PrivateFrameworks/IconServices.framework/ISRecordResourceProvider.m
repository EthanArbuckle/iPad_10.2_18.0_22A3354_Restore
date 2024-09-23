@implementation ISRecordResourceProvider

- (ISRecordResourceProvider)initWithRecord:(id)a3 options:(unint64_t)a4
{
  return -[ISRecordResourceProvider initWithRecord:fileExtension:options:](self, "initWithRecord:fileExtension:options:", a3, 0, a4);
}

- (ISRecordResourceProvider)initWithRecord:(id)a3 fileExtension:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  ISRecordResourceProvider *v11;
  ISRecordResourceProvider *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;
  uint64_t v26;
  objc_super v27;
  void *v28;
  id v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "_is_canProvideIconResources"))
  {
    v27.receiver = self;
    v27.super_class = (Class)ISRecordResourceProvider;
    v11 = -[ISResourceProvider init](&v27, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_record, a3);
      objc_msgSend(v9, "iconDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = CFSTR("UTTypeIconBadgeName");
      v30[1] = CFSTR("UTTypeIconText");
      v30[2] = CFSTR("UTTypeIconBackgroundName");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_IF_stringForKeys:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v16 = a5 | 2;
      else
        v16 = a5;
      v17 = (void *)MEMORY[0x1E0CA5900];
      v29 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_is_resourceTokenForRecords:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0;
      v26 = 0;
      objc_msgSend(MEMORY[0x1E0CA5900], "_is_getSequenceNumber:andUUID:", &v26, &v25);
      v20 = v25;
      -[ISResourceProvider setLsDatabaseSequenceNumber:](v12, "setLsDatabaseSequenceNumber:", v26);
      -[ISResourceProvider setLsDatabaseUUID:](v12, "setLsDatabaseUUID:", v20);
      -[ISResourceProvider setResourceToken:](v12, "setResourceToken:", v19);
      objc_msgSend(v9, "persistentIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISResourceProvider setSourceRecordIdentifiers:](v12, "setSourceRecordIdentifiers:", v22);

      -[ISResourceProvider setOptions:](v12, "setOptions:", v16);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = objc_msgSend(v9, "_IS_platformToIFPlatform");
        if (v23)
          -[ISResourceProvider setPlatform:](v12, "setPlatform:", v23);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && objc_msgSend(v9, "_IS_allowsArbitraryExtensionAsText"))
      {
        objc_storeStrong((id *)&v12->_fileExtension, a4);
      }

    }
  }
  else
  {

    v12 = 0;
  }

  return v12;
}

- (void)resolveResources
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  LSRecord *v7;
  char isKindOfClass;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  BOOL v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString **v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  if (!-[ISResourceProvider resolved](self, "resolved"))
  {
    -[ISResourceProvider setResolved:](self, "setResolved:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[LSRecord iconResourceBundleURL](self->_record, "iconResourceBundleURL");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v4 = 0;
        goto LABEL_8;
      }
      -[LSRecord URL](self->_record, "URL");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v3;
LABEL_8:
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A798]), "initWithURL:", v4);
    -[LSRecord iconDictionary](self->_record, "iconDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISResourceProvider resourceWithBundleURL:iconDictionary:options:](ISResourceProvider, "resourceWithBundleURL:iconDictionary:options:", v4, v6, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
    v7 = (LSRecord *)objc_claimAutoreleasedReturnValue();
    if (-[LSRecord isDebugGraphicIconColourEnabled](v7, "isDebugGraphicIconColourEnabled"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_14;
        v7 = self->_record;
        if (-[LSRecord isDeclared](v7, "isDeclared"))
        {
          v9 = v45;
          +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "debugPreDefinedGraphicIconColor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = v43;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "descriptor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setEnclosureColors:", v10);

          objc_msgSend(v9, "descriptor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "setDebugColourSet:", 1);
        }
      }
    }

LABEL_14:
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();
    -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v45);

    v46[0] = CFSTR("UTTypeIconText");
    v46[1] = CFSTR("CFBundleIconText");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_IF_stringForKeys:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uppercaseString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && !objc_msgSend(v17, "isEqual:", CFSTR("*"))
      || (-[ISRecordResourceProvider fileExtension](self, "fileExtension"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v18, "uppercaseString"),
          v19 = objc_claimAutoreleasedReturnValue(),
          v17,
          v18,
          (v17 = (void *)v19) != 0))
    {
      -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, CFSTR("kISTextResourceKey"));

    }
    -[ISRecordResourceProvider setPlatformWithBundle:](self, "setPlatformWithBundle:", v5);
    -[ISRecordResourceProvider record](self, "record");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[ISResourceProvider _findBadgeResourceWithIconDictionary:bundle:record:](self, "_findBadgeResourceWithIconDictionary:bundle:record:", v6, v5, v21);

    v23 = -[ISResourceProvider _findBackgroundResourceWithIconDictionary:bundle:](self, "_findBackgroundResourceWithIconDictionary:bundle:", v6, v5);
    if (!v22 && !v23)
    {
      -[ISResourceProvider badgeResource](self, "badgeResource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        if ((v13 & 1) == 0 || (v25 = v45) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[LSRecord declaringBundleRecord](self->_record, "declaringBundleRecord");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              +[ISResourceProvider resourceWithRecord:options:](ISResourceProvider, "resourceWithRecord:options:", v26, 0);
              v25 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = 0;
            }

          }
          else
          {
            v25 = 0;
          }
        }
        -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v25, CFSTR("kISBadgeResourceKey"));

      }
    }
    v28 = -[ISResourceProvider _findCustomRecipeWithIconDictionary:bundle:](self, "_findCustomRecipeWithIconDictionary:bundle:", v6, v5);
    -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v29, "count") && !v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[LSRecord containingBundleRecord](self->_record, "containingBundleRecord");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v31 = objc_opt_isKindOfClass();

        if ((v31 & 1) == 0)
          goto LABEL_38;
        -[LSRecord containingBundleRecord](self->_record, "containingBundleRecord");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "URL");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "iconDictionary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[ISResourceProvider resourceWithBundleURL:iconDictionary:options:](ISResourceProvider, "resourceWithBundleURL:iconDictionary:options:", v32, v33, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("kISPrimaryResourceKey"));

        }
      }
    }

LABEL_38:
    if (-[ISRecordResourceProvider _shouldTreatLikeApp](self, "_shouldTreatLikeApp"))
      -[ISResourceProvider setResourceType:](self, "setResourceType:", 1);
    -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "count"))
      v28 = 1;

    if (v28)
      goto LABEL_54;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = (const __CFString **)MEMORY[0x1E0CA5AB8];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = CFSTR("com.apple.application-and-system-extension");
LABEL_52:
        +[ISResourceProvider resourceWithTypeIdentifier:options:](ISResourceProvider, "resourceWithTypeIdentifier:options:", v38, 0);
        v40 = objc_claimAutoreleasedReturnValue();
        goto LABEL_53;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "_IF_dictionaryForKey:", 0x1E58028D8);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          +[ISGraphicSymbolResource defaultResource](ISGraphicSymbolResource, "defaultResource");
          v40 = objc_claimAutoreleasedReturnValue();
LABEL_53:
          v41 = (void *)v40;
          -[ISResourceProvider resourcesByResourceKey](self, "resourcesByResourceKey");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("kISPrimaryResourceKey"));

LABEL_54:
          return;
        }
      }
      v37 = (const __CFString **)MEMORY[0x1E0CA5B20];
    }
    v38 = *v37;
    goto LABEL_52;
  }
}

- (BOOL)_shouldTreatLikeApp
{
  void *v3;
  void *v4;
  char v5;

  -[ISRecordResourceProvider record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ISRecordResourceProvider record](self, "record");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conformsToTypeIdentifier:", CFSTR("com.apple.application-icon"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)configureProviderFromDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  -[ISRecordResourceProvider record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && !-[ISRecordResourceProvider _shouldTreatLikeApp](self, "_shouldTreatLikeApp"))
  {
    -[ISResourceProvider suggestedRecipe](self, "suggestedRecipe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_7;
    }
    if (objc_msgSend(v4, "appearance") != 1)
    {
      v8 = objc_msgSend(v4, "appearance");

      if (v8 != 2)
        goto LABEL_7;
      goto LABEL_6;
    }

    goto LABEL_4;
  }
  if (objc_msgSend(v4, "appearance") == 1)
  {
LABEL_4:

LABEL_6:
    -[ISResourceProvider setAllowNonDefaultAppearances:](self, "setAllowNonDefaultAppearances:", 1);
    -[ISResourceProvider setAllowAlterationsToResourceArt:](self, "setAllowAlterationsToResourceArt:", 1);
    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "appearance");

  if (v6 == 2)
    goto LABEL_6;
LABEL_7:
  v9.receiver = self;
  v9.super_class = (Class)ISRecordResourceProvider;
  -[ISResourceProvider configureProviderFromDescriptor:](&v9, sel_configureProviderFromDescriptor_, v4);

}

- (id)iconResource
{
  void *v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISRecordResourceProvider;
  -[ISResourceProvider iconResource](&v6, sel_iconResource);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ISRecordResourceProvider resolveResources](self, "resolveResources");
    v5.receiver = self;
    v5.super_class = (Class)ISRecordResourceProvider;
    -[ISResourceProvider iconResource](&v5, sel_iconResource);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)resourceNamed:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ISRecordResourceProvider;
  -[ISResourceProvider resourceNamed:](&v8, sel_resourceNamed_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[ISRecordResourceProvider resolveResources](self, "resolveResources");
    v7.receiver = self;
    v7.super_class = (Class)ISRecordResourceProvider;
    -[ISResourceProvider resourceNamed:](&v7, sel_resourceNamed_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)templateIconResource
{
  return 0;
}

- (id)symbol
{
  return __34__ISRecordResourceProvider_symbol__block_invoke((uint64_t)self, self->_record);
}

id __34__ISRecordResourceProvider_symbol__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v2, "isCoreType") & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v2, "iconResourceBundleURL");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v4 = (void *)v3;
      goto LABEL_9;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v2, "URL");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v4 = 0;
LABEL_9:
  objc_msgSend(v2, "iconDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("CFBundleSymbolName");
  v10[1] = CFSTR("UTTypeSymbolName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_IF_stringForKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7E8]), "initWithSymbolName:bundleURL:", v7, v4);
  else
    v8 = 0;

  return v8;
}

- (BOOL)_isAppleResource
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[LSRecord developerType](self->_record, "developerType") == 1;
}

- (void)setPlatformWithBundle:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISRecordResourceProvider;
  -[ISResourceProvider setPlatformWithBundle:](&v3, sel_setPlatformWithBundle_, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)ISRecordResourceProvider;
  -[ISRecordResourceProvider description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISRecordResourceProvider record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISRecordResourceProvider record](self, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)templateType
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTemplateType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (LSRecord)record
{
  return (LSRecord *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)fileExtension
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_templateType, 0);
}

@end
