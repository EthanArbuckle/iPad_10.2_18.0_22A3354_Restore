@implementation ISBundleIdentifierIcon

- (ISBundleIdentifierIcon)initWithBundleIdentifier:(id)a3
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  ISBundleIdentifierIcon *v46;
  ISBundleIdentifierIcon *v47;
  objc_super v49;
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, 0);
  if (v9)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[NSObject bundleIdentifier](v9, "bundleIdentifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToString:", v5),
        v10,
        (v11 & 1) != 0))
  {
    if (v9)
      goto LABEL_8;
  }
  else
  {

  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifierOfSystemPlaceholder:error:", v5, 0);
  if (v9)
  {
LABEL_8:
    if (-[NSObject isPlaceholder](v9, "isPlaceholder"))
    {
      -[NSObject URL](v9, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "__is__contentModifiedDate");
      v13 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0CB3940];
      -[NSObject timeIntervalSinceReferenceDate](v13, "timeIntervalSinceReferenceDate");
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%f"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingPathComponent:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      _ISDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[ISBundleIdentifierIcon initWithBundleIdentifier:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);

    }
    else
    {
      -[NSObject persistentIdentifier](v9, "persistentIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
LABEL_16:
        -[NSObject alternateIconName](v9, "alternateIconName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          objc_msgSend(v5, "stringByAppendingPathComponent:", v36);
          v37 = objc_claimAutoreleasedReturnValue();

          _ISDefaultLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            -[ISBundleIdentifierIcon initWithBundleIdentifier:].cold.1(v37, v38, v39, v40, v41, v42, v43, v44);

          v8 = (void *)v37;
        }

        goto LABEL_21;
      }
      v26 = (void *)MEMORY[0x1E0CB3A28];
      -[NSObject persistentIdentifier](v9, "persistentIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_IF_UUIDWithData:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingPathComponent:", v29);
      v17 = objc_claimAutoreleasedReturnValue();

      _ISDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[ISBundleIdentifierIcon initWithBundleIdentifier:].cold.3(v17, v13, v30, v31, v32, v33, v34, v35);
    }

    v8 = (void *)v17;
    goto LABEL_16;
  }
  _ISDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v5;
    _os_log_impl(&dword_1AA928000, v9, OS_LOG_TYPE_DEFAULT, "No record for %@", buf, 0xCu);
  }
LABEL_21:

  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", v8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49.receiver = self;
  v49.super_class = (Class)ISBundleIdentifierIcon;
  v46 = -[ISConcreteIcon initWithDigest:](&v49, sel_initWithDigest_, v45);
  v47 = v46;
  if (v46)
    objc_storeStrong((id *)&v46->_bundleIdentifier, a3);

  return v47;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *bundleIdentifier;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ISBundleIdentifierIcon;
  -[ISBundleIdentifierIcon description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  -[ISConcreteIcon digest](self, "digest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ BundleID: %@ digest: %@"), v4, bundleIdentifier, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISBundleIdentifierIcon)initWithCoder:(id)a3
{
  id v4;
  ISBundleIdentifierIcon *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISBundleIdentifierIcon;
  v5 = -[ISConcreteIcon initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISBundleIdentifierIcon;
  v4 = a3;
  -[ISConcreteIcon encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"), v5.receiver, v5.super_class);

}

- (id)_makeResourceProviderAllowIconResourceFallback:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  ISRecordResourceProvider *v9;
  uint64_t *p_bundleIdentifier;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  ISRecordResourceProvider *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  ISRecordResourceProvider *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;

  v3 = a3;
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableAppIconOverides");

  if (v6)
  {
    +[ISCustomIconManager sharedInstance](ISCustomIconManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "overrideResourceForBundleIdentifier:", self->_bundleIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[ISResourceProvider initWithResource:templateResource:]([ISResourceProvider alloc], "initWithResource:templateResource:", v8, 0);

      return v9;
    }
  }
  p_bundleIdentifier = (uint64_t *)&self->_bundleIdentifier;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", self->_bundleIdentifier, 1, 0);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, "appClipMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v13 = (void *)objc_opt_new();
    goto LABEL_14;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", *p_bundleIdentifier, 0);
  v13 = 0;
  if (objc_msgSend(v12, "_IS_isMessagesExtension"))
    v13 = (void *)objc_opt_new();
  if ((objc_msgSend(v12, "_is_canProvideIconResources") & 1) == 0)
  {
    objc_msgSend(v12, "containingBundleRecord");
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  if (v12)
    goto LABEL_14;
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifierOfSystemPlaceholder:error:", *p_bundleIdentifier, 0);
  if (v15)
  {
    v12 = (void *)v15;
LABEL_14:
    v16 = v12;
    v17 = v16;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", *MEMORY[0x1E0CA5AB8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v26;
  if (v26)
    v27 = v26;

  v16 = 0;
LABEL_15:
  v18 = -[ISRecordResourceProvider initWithRecord:options:]([ISRecordResourceProvider alloc], "initWithRecord:options:", v17, 0);
  if (v18)
  {
    v9 = v18;
    if (!v3)
      goto LABEL_26;
LABEL_22:
    -[ISRecordResourceProvider iconResource](v9, "iconResource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      _ISDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[ISBundleIdentifierIcon _makeResourceProviderAllowIconResourceFallback:].cold.1(p_bundleIdentifier, (uint64_t)v9, v21);

      +[ISResourceProvider defaultAppIconResourceProvider](ISResourceProvider, "defaultAppIconResourceProvider");
      v22 = (ISRecordResourceProvider *)objc_claimAutoreleasedReturnValue();

      -[ISResourceProvider setPlaceholder:](v22, "setPlaceholder:", 1);
      v9 = v22;
    }
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v17, "containingBundleRecord");
    v19 = objc_claimAutoreleasedReturnValue();

    v9 = -[ISRecordResourceProvider initWithRecord:options:]([ISRecordResourceProvider alloc], "initWithRecord:options:", v19, 0);
    v17 = (void *)v19;
    if (!v3)
      goto LABEL_26;
    goto LABEL_22;
  }
  v9 = 0;
  if (v3)
    goto LABEL_22;
LABEL_26:
  -[ISResourceProvider suggestedRecipe](v9, "suggestedRecipe");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ISResourceProvider suggestedRecipe](v9, "suggestedRecipe");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISResourceProvider setSuggestedRecipe:](v9, "setSuggestedRecipe:", v24);

  }
  else
  {
    -[ISResourceProvider setSuggestedRecipe:](v9, "setSuggestedRecipe:", v13);
  }

  -[ISResourceProvider setResourceType:](v9, "setResourceType:", 1);
  return v9;
}

- (id)makeResourceProvider
{
  return -[ISBundleIdentifierIcon _makeResourceProviderAllowIconResourceFallback:](self, "_makeResourceProviderAllowIconResourceFallback:", 1);
}

- (id)makeSymbolResourceProvider
{
  return -[ISBundleIdentifierIcon _makeResourceProviderAllowIconResourceFallback:](self, "_makeResourceProviderAllowIconResourceFallback:", 0);
}

- (double)_aspectRatio
{
  return 1.0;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)initWithBundleIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, a2, a3, "Custom icon suffixed bundle ID: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithBundleIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, a2, a3, "Placeholder bundle suffixed bundle ID: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithBundleIdentifier:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, a2, a3, "Suffixed bundle ID: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_makeResourceProviderAllowIconResourceFallback:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1AA928000, log, OS_LOG_TYPE_ERROR, "Failed to find icon resources for bundle identifier %@ - %@. Creating placeholder provider", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
