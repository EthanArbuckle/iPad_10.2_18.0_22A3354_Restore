@implementation ATXExecutableIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

- (BOOL)isEqual:(id)a3
{
  ATXExecutableIdentifier *v4;
  ATXExecutableIdentifier *v5;
  ATXSuggestionExecutableProtocol *v6;
  ATXSuggestionExecutableProtocol *v7;
  char v8;

  v4 = (ATXExecutableIdentifier *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (v5->_type == self->_type)
      {
        v6 = self->_object;
        v7 = v6;
        if (v6 == v5->_object)
          v8 = 1;
        else
          v8 = -[ATXSuggestionExecutableProtocol isEqual:](v6, "isEqual:");

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (ATXExecutableIdentifier)initWithString:(id)a3
{
  id v4;
  ATXExecutableIdentifier *v5;
  ATXExecutableIdentifier *v6;
  uint64_t v7;
  ATXSuggestionExecutableProtocol *object;
  ATXExecutableIdentifier *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXExecutableIdentifier;
  v5 = -[ATXExecutableIdentifier init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 0;
    v7 = objc_msgSend(v4, "copy");
    object = v6->_object;
    v6->_object = (ATXSuggestionExecutableProtocol *)v7;

    v9 = v6;
  }

  return v6;
}

- (ATXExecutableIdentifier)initWithAction:(id)a3
{
  id v5;
  ATXExecutableIdentifier *v6;
  ATXExecutableIdentifier *v7;
  ATXExecutableIdentifier *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXExecutableIdentifier;
  v6 = -[ATXExecutableIdentifier init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXExecutableIdentifier)initWithInfoSuggestion:(id)a3
{
  id v5;
  ATXExecutableIdentifier *v6;
  ATXExecutableIdentifier *v7;
  ATXExecutableIdentifier *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXExecutableIdentifier;
  v6 = -[ATXExecutableIdentifier init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = v7;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[ATXSuggestionExecutableProtocol hash](self->_object, "hash");
  return self->_type - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXExecutableIdentifier)initWithHeroAppPrediction:(id)a3
{
  id v5;
  ATXExecutableIdentifier *v6;
  ATXExecutableIdentifier *v7;
  ATXExecutableIdentifier *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXExecutableIdentifier;
  v6 = -[ATXExecutableIdentifier init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXExecutableIdentifier)initWithLinkAction:(id)a3
{
  id v5;
  ATXExecutableIdentifier *v6;
  ATXExecutableIdentifier *v7;
  ATXExecutableIdentifier *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXExecutableIdentifier;
  v6 = -[ATXExecutableIdentifier init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 4;
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = v7;
  }

  return v7;
}

- (ATXExecutableIdentifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ATXExecutableIdentifier *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ATXExecutableIdentifier *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  switch(v5)
  {
    case 0:
      v6 = (void *)MEMORY[0x1E0D81610];
      v7 = objc_opt_class();
      __atxlog_handle_default();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v7, CFSTR("object"), v4, 1, CFSTR("ATXEngagementRecordManagerUtilitiesErrorDomain"), 2, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_14;
      v10 = -[ATXExecutableIdentifier initWithString:](self, "initWithString:", v9);
      goto LABEL_13;
    case 1:
      v19 = (void *)MEMORY[0x1E0D81610];
      v20 = objc_opt_class();
      __atxlog_handle_default();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v20, CFSTR("object"), v4, 1, CFSTR("ATXEngagementRecordManagerUtilitiesErrorDomain"), 1, v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_14;
      v10 = -[ATXExecutableIdentifier initWithAction:](self, "initWithAction:", v9);
      goto LABEL_13;
    case 2:
      v22 = (void *)MEMORY[0x1E0D81610];
      v23 = objc_opt_class();
      __atxlog_handle_default();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v23, CFSTR("object"), v4, 1, CFSTR("ATXEngagementRecordManagerUtilitiesErrorDomain"), 3, v24);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_14;
      v10 = -[ATXExecutableIdentifier initWithHeroAppPrediction:](self, "initWithHeroAppPrediction:", v9);
      goto LABEL_13;
    case 3:
      v25 = (void *)MEMORY[0x1E0D81610];
      v26 = objc_opt_class();
      __atxlog_handle_default();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v26, CFSTR("object"), v4, 1, CFSTR("ATXEngagementRecordManagerUtilitiesErrorDomain"), 3, v27);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = -[ATXExecutableIdentifier initWithInfoSuggestion:](self, "initWithInfoSuggestion:", v9);
LABEL_13:
        self = v10;
        v18 = self;
      }
      else
      {
LABEL_14:
        v18 = 0;
      }

LABEL_16:
      return v18;
    default:
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[ATXExecutableIdentifier initWithCoder:].cold.1(v5, v11, v12, v13, v14, v15, v16, v17);

      v18 = 0;
      goto LABEL_16;
  }
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_object, CFSTR("object"));

}

- (id)description
{
  return (id)-[ATXSuggestionExecutableProtocol description](self->_object, "description");
}

- (NSString)debugTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXSuggestionExecutableProtocol *v8;
  void *v9;
  void *v10;
  void *v11;

  switch(self->_type)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("App: %@"), self->_object);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v2;
    case 1uLL:
      v3 = (void *)MEMORY[0x1E0CB3940];
      -[ATXSuggestionExecutableProtocol actionTitle](self->_object, "actionTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("Action: %@"), v4);
      goto LABEL_6;
    case 2uLL:
      v5 = (void *)MEMORY[0x1E0CB3940];
      -[ATXSuggestionExecutableProtocol bundleId](self->_object, "bundleId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Hero App: %@"), v4);
      goto LABEL_6;
    case 3uLL:
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[ATXSuggestionExecutableProtocol widgetBundleIdentifier](self->_object, "widgetBundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Information: %@"), v4);
LABEL_6:
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 4uLL:
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = self->_object;
      -[ATXSuggestionExecutableProtocol bundleId](v8, "bundleId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXSuggestionExecutableProtocol action](v8, "action");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Link Action: %@:%@"), v9, v11);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return (NSString *)v2;
  }
  return (NSString *)v2;
}

- (unint64_t)type
{
  return self->_type;
}

- (ATXSuggestionExecutableProtocol)object
{
  return self->_object;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, a2, a3, "Unknown type: %ld", a5, a6, a7, a8, 0);
}

@end
