@implementation ATXWidgetModeEntity

- (ATXWidgetModeEntity)initWithWidget:(id)a3
{
  id v4;
  ATXWidgetModeEntity *v5;
  uint64_t v6;
  CHSWidget *widget;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWidgetModeEntity;
  v5 = -[ATXWidgetModeEntity init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    widget = v5->_widget;
    v5->_widget = (CHSWidget *)v6;

  }
  return v5;
}

- (id)identifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CHSWidget extensionIdentity](self->_widget, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidget extensionIdentity](self->_widget, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidget kind](self->_widget, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidget family](self->_widget, "family");
  NSStringFromWidgetFamily();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:%@:%@:%@"), v5, v7, v8, v9);

  return v10;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("entityIdentifier");
  -[ATXWidgetModeEntity identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("scoreMetadata");
  v11[0] = v4;
  -[ATXWidgetModeEntity scoreMetadata](self, "scoreMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  if (!v3)
  return v8;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[ATXWidgetModeEntity jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXWidgetModeEntity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWidgetModeEntity scoreMetadata](self, "scoreMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "score");
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("entityIdentifier: %@, score: %.3f"), v4, v6);

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  ATXWidgetModeEntity *v4;
  ATXWidgetModeEntity *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (ATXWidgetModeEntity *)a3;
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
      -[ATXWidgetModeEntity identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXWidgetModeEntity identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ATXWidgetModeEntity identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ATXWidgetModeEntity widget](self, "widget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForWidget"));

  -[ATXWidgetModeEntity scoreMetadata](self, "scoreMetadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForScoreMetadata"));

}

- (ATXWidgetModeEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXWidgetModeEntity *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_modes();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForWidget"), v4, 0, CFSTR("com.apple.proactive.widgetModeEntity"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_modes();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForScoreMetadata"), v4, 0, CFSTR("com.apple.proactive.widgetModeEntity"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      self = -[ATXWidgetModeEntity initWithWidget:](self, "initWithWidget:", v8);
      -[ATXWidgetModeEntity setScoreMetadata:](self, "setScoreMetadata:", v14);
      v10 = self;
    }

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXWidgetModeEntity *v4;
  void *v5;
  ATXWidgetModeEntity *v6;

  v4 = +[ATXWidgetModeEntity allocWithZone:](ATXWidgetModeEntity, "allocWithZone:", a3);
  -[ATXWidgetModeEntity widget](self, "widget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXWidgetModeEntity initWithWidget:](v4, "initWithWidget:", v5);

  return v6;
}

- (ATXModeEntityScore)scoreMetadata
{
  return self->_scoreMetadata;
}

- (void)setScoreMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_scoreMetadata, a3);
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (void)setWidget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widget, 0);
  objc_storeStrong((id *)&self->_scoreMetadata, 0);
}

@end
