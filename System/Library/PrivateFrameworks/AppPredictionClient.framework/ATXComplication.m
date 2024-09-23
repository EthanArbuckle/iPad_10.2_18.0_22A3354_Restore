@implementation ATXComplication

- (ATXComplication)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 intent:(id)a7
{
  return -[ATXComplication initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:](self, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", a3, a4, a5, a6, a7, 0);
}

- (ATXComplication)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 intent:(id)a7 source:(int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  ATXComplication *v18;
  uint64_t v19;
  NSString *extensionBundleIdentifier;
  uint64_t v21;
  NSString *kind;
  uint64_t v23;
  NSString *containerBundleIdentifier;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)ATXComplication;
  v18 = -[ATXComplication init](&v26, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    extensionBundleIdentifier = v18->_extensionBundleIdentifier;
    v18->_extensionBundleIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    kind = v18->_kind;
    v18->_kind = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    containerBundleIdentifier = v18->_containerBundleIdentifier;
    v18->_containerBundleIdentifier = (NSString *)v23;

    v18->_widgetFamily = a6;
    objc_storeStrong((id *)&v18->_intent, a7);
    v18->_source = a8;
  }

  return v18;
}

- (ATXComplication)initWithWidgetDescriptor:(id)a3 widgetFamily:(int64_t)a4 intent:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXComplication *v14;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "extensionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "kind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "containerBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXComplication initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:](self, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v10, v11, v13, a4, v8, 0);

  return v14;
}

- (ATXComplication)initWithWidgetDescriptor:(id)a3 widgetFamily:(int64_t)a4 intent:(id)a5 source:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ATXComplication *v16;

  v6 = *(_QWORD *)&a6;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v11, "extensionBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "kind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extensionIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "containerBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ATXComplication initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:](self, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v12, v13, v15, a4, v10, v6);

  return v16;
}

+ (id)complicationFromDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  ATXComplication *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("extensionBundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("extensionBundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kind"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = objc_opt_isKindOfClass();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kind"));
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("containerBundleIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) != 0)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("containerBundleIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("widgetFamily"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v19 = objc_opt_isKindOfClass();

      if ((v19 & 1) != 0)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("widgetFamily"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CHSWidgetFamilyFromString();

        if ((CHSWidgetFamilyIsAccessory() & 1) != 0 || v21 == 1)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("intent"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("typeName"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("parameters"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81140]), "initWithTypeName:parameters:", CFSTR("typeName"), v29);
              objc_msgSend(v30, "createIntent");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v31 = 0;
            }

          }
          else
          {
            v31 = 0;
          }
          v17 = -[ATXComplication initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:]([ATXComplication alloc], "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v8, v11, v14, v21, v31, 0);

          goto LABEL_34;
        }
        if (a4)
        {
          v22 = objc_alloc(MEMORY[0x1E0CB3940]);
          NSStringFromWidgetFamily();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("missing key: provided widget family is not a complication family: %@"), v23);
          errorWithDescription(v24);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          __atxlog_handle_lock_screen();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          goto LABEL_24;
        }
      }
      else if (a4)
      {
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("missing key: %@"), CFSTR("widgetFamily"));
        errorWithDescription(v26);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        __atxlog_handle_lock_screen();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
LABEL_23:
          +[ATXComplication complicationFromDictionaryRepresentation:error:].cold.1();
LABEL_24:

      }
      v17 = 0;
LABEL_34:

LABEL_35:
      goto LABEL_36;
    }
    if (a4)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("missing key: %@"), CFSTR("kind"));
      errorWithDescription(v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      __atxlog_handle_lock_screen();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[ATXComplication complicationFromDictionaryRepresentation:error:].cold.1();
      v17 = 0;
      goto LABEL_35;
    }
LABEL_12:
    v17 = 0;
LABEL_36:

    goto LABEL_37;
  }
  if (a4)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("missing key: %@"), CFSTR("extensionBundleIdentifier"));
    errorWithDescription(v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_lock_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ATXComplication complicationFromDictionaryRepresentation:error:].cold.1();
    goto LABEL_12;
  }
  v17 = 0;
LABEL_37:

  return v17;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("extensionBundleIdentifier");
  -[ATXComplication extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("kind");
  -[ATXComplication kind](self, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("containerBundleIdentifier");
  -[ATXComplication containerBundleIdentifier](self, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2] = v6;
  v10[3] = CFSTR("widgetFamily");
  -[ATXComplication widgetFamily](self, "widgetFamily");
  NSStringFromWidgetFamily();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  return v8;
}

- (CHSWidgetDescriptor)widgetDescriptor
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0D10168]);
  v4 = objc_alloc(MEMORY[0x1E0D10038]);
  -[ATXComplication extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplication containerBundleIdentifier](self, "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v5, v6, 0);
  -[ATXComplication kind](self, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplication widgetFamily](self, "widgetFamily");
  v9 = CHSWidgetFamilyMaskFromWidgetFamily();
  -[ATXComplication intent](self, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_className");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithExtensionIdentity:kind:supportedFamilies:intentType:", v7, v8, v9, v11);

  return (CHSWidgetDescriptor *)v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXComplication extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplication kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplication containerBundleIdentifier](self, "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplication widgetFamily](self, "widgetFamily");
  NSStringFromWidgetFamily();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplication intent](self, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringForComplicationSource:", -[ATXComplication source](self, "source"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("ATXComplication: extensionBundleIdentifier: %@, kind: %@, containerBundleIdentifier: %@, widgetFamily: %@, intent: %@, source:%@"), v4, v5, v6, v7, v9, v10);

  return (NSString *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXComplication)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXComplication *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerBundleIdentifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("widgetFamily"));
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[ATXComplication initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:](self, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v7, v8, v9, v10, v11, objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("source")));

        v6 = self;
LABEL_12:

        goto LABEL_13;
      }
      __atxlog_handle_lock_screen();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ATXComplication initWithCoder:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);

    }
    else
    {
      __atxlog_handle_lock_screen();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXComplication initWithCoder:].cold.1(v8, v12, v13, v14, v15, v16, v17, v18);
    }
    v6 = 0;
    goto LABEL_12;
  }
  self = -[ATXComplication initWithWidgetDescriptor:widgetFamily:intent:source:](self, "initWithWidgetDescriptor:widgetFamily:intent:source:", v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("widgetFamily")), 0, 0);
  v6 = self;
LABEL_13:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ATXComplication extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("extensionBundleIdentifier"));

  -[ATXComplication kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("kind"));

  -[ATXComplication containerBundleIdentifier](self, "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("containerBundleIdentifier"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXComplication widgetFamily](self, "widgetFamily"), CFSTR("widgetFamily"));
  -[ATXComplication intent](self, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("intent"));

  objc_msgSend(v8, "encodeInt32:forKey:", -[ATXComplication source](self, "source"), CFSTR("source"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXComplication *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  ATXComplication *v11;

  v4 = +[ATXComplication allocWithZone:](ATXComplication, "allocWithZone:", a3);
  -[ATXComplication extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplication kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXComplication containerBundleIdentifier](self, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXComplication widgetFamily](self, "widgetFamily");
  -[ATXComplication intent](self, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = -[ATXComplication initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:](v4, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v5, v6, v7, v8, v10, -[ATXComplication source](self, "source"));

  -[ATXComplication setScore:](v11, "setScore:", self->_score);
  -[ATXComplication setPredictionSource:](v11, "setPredictionSource:", self->_predictionSource);
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[ATXComplication extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ATXComplication kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[ATXComplication containerBundleIdentifier](self, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  return self->_widgetFamily - v8 + 32 * v8;
}

- (BOOL)isEqual:(id)a3
{
  ATXComplication *v4;
  ATXComplication *v5;
  BOOL v6;

  v4 = (ATXComplication *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXComplication isEqualToATXComplication:](self, "isEqualToATXComplication:", v5);

  return v6;
}

- (BOOL)isEqualToATXComplication:(id)a3
{
  id *v4;
  NSString *extensionBundleIdentifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *kind;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSString *containerBundleIdentifier;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  BOOL v20;
  int64_t widgetFamily;

  v4 = (id *)a3;
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v6 = (NSString *)v4[2];
  if (extensionBundleIdentifier == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = extensionBundleIdentifier;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_11;
  }
  kind = self->_kind;
  v11 = (NSString *)v4[3];
  if (kind == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = kind;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  containerBundleIdentifier = self->_containerBundleIdentifier;
  v16 = (NSString *)v4[4];
  if (containerBundleIdentifier == v16)
  {

    goto LABEL_13;
  }
  v17 = v16;
  v18 = containerBundleIdentifier;
  v19 = -[NSString isEqual:](v18, "isEqual:", v17);

  if ((v19 & 1) != 0)
  {
LABEL_13:
    widgetFamily = self->_widgetFamily;
    v20 = widgetFamily == objc_msgSend(v4, "widgetFamily");
    goto LABEL_14;
  }
LABEL_11:
  v20 = 0;
LABEL_14:

  return v20;
}

+ (id)stringForComplicationSource:(int)a3
{
  if ((a3 - 1) > 5)
    return CFSTR("unknown");
  else
    return off_1E4D5BF68[a3 - 1];
}

- (BOOL)matchesPersonality:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  NSString *extensionBundleIdentifier;
  NSString *v8;
  void *v9;
  NSString *kind;
  NSString *v11;
  void *v12;
  char v13;

  v5 = a3;
  v6 = v5;
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v8 = extensionBundleIdentifier;
  if (extensionBundleIdentifier)
  {
LABEL_2:
    objc_msgSend(v6, "extensionBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

    if (extensionBundleIdentifier)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v5, "extensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = self->_extensionBundleIdentifier;
    if (v8)
      goto LABEL_2;
  }
  else
  {
    LOBYTE(v8) = 1;
  }
LABEL_8:

LABEL_9:
  kind = self->_kind;
  v11 = kind;
  if (kind)
    goto LABEL_10;
  objc_msgSend(v6, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v13 = 1;
    goto LABEL_16;
  }
  v11 = self->_kind;
  if (!v11)
  {
    v13 = 0;
LABEL_16:

    goto LABEL_17;
  }
LABEL_10:
  objc_msgSend(v6, "kind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

  if (!kind)
    goto LABEL_16;
LABEL_17:

  return v8 & v13;
}

- (BOOL)matches:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  NSString *extensionBundleIdentifier;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *kind;
  NSString *v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = v6;
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v9 = extensionBundleIdentifier;
  if (extensionBundleIdentifier)
  {
LABEL_2:
    objc_msgSend(v7, "extensionIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extensionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = -[NSString isEqualToString:](v9, "isEqualToString:", v11);

    if (extensionBundleIdentifier)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v6, "extensionIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = self->_extensionBundleIdentifier;
    if (v9)
      goto LABEL_2;
  }
  else
  {
    LOBYTE(v9) = 1;
  }
LABEL_8:

LABEL_9:
  kind = self->_kind;
  v13 = kind;
  if (kind)
    goto LABEL_10;
  objc_msgSend(v7, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v15 = 1;
    goto LABEL_16;
  }
  v13 = self->_kind;
  if (!v13)
  {
    v15 = 0;
LABEL_16:

    goto LABEL_17;
  }
LABEL_10:
  objc_msgSend(v7, "kind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

  if (!kind)
    goto LABEL_16;
LABEL_17:

  return v9 & v15;
}

- (CHSExtensionIdentity)extensionIdentity
{
  return (CHSExtensionIdentity *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", self->_extensionBundleIdentifier, self->_containerBundleIdentifier, 0);
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (INIntent)intent
{
  return self->_intent;
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)predictionSource
{
  return self->_predictionSource;
}

- (void)setPredictionSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionSource, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

+ (void)complicationFromDictionaryRepresentation:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_3(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: error decoding extensionBundleIdentifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: error decoding kind", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
