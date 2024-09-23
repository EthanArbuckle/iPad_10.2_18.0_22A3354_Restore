@implementation ATXHomeScreenWidgetDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  objc_msgSend(v5, "setAppBundleId:", v6);

  v7 = (void *)-[CHSWidgetDescriptor copyWithZone:](self->_avocadoDescriptor, "copyWithZone:", a3);
  objc_msgSend(v5, "setAvocadoDescriptor:", v7);

  objc_msgSend(v5, "setSuggestedSize:", self->_suggestedSize);
  objc_msgSend(v5, "setRankType:", self->_rankType);
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_appBundleId, CFSTR("appBundleId"));
  -[CHSWidgetDescriptor extensionBundleIdentifier](self->_avocadoDescriptor, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("extensionBundleId"));

  -[CHSWidgetDescriptor displayName](self->_avocadoDescriptor, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("widgetDisplayName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_suggestedSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("widgetSuggestedSize"));

  -[CHSWidgetDescriptor kind](self->_avocadoDescriptor, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("widgetKind"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_rankType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("rankType"));

  return v3;
}

- (id)extensionBundleIdForMetrics
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  __CFString *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  -[CHSWidgetDescriptor extensionBundleIdentifier](self->_avocadoDescriptor, "extensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", &stru_1E4D5DB30);

  if (!v4)
    goto LABEL_12;
  -[CHSWidgetDescriptor kind](self->_avocadoDescriptor, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindSiri"));

  if ((v6 & 1) == 0)
  {
    -[CHSWidgetDescriptor kind](self->_avocadoDescriptor, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsFolder")))
    {

LABEL_7:
      v7 = CFSTR("shortcuts");
      return v7;
    }
    -[CHSWidgetDescriptor kind](self->_avocadoDescriptor, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsSingle"));

    if ((v10 & 1) != 0)
      goto LABEL_7;
    -[CHSWidgetDescriptor kind](self->_avocadoDescriptor, "kind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindFiles"));

    if ((v12 & 1) != 0)
    {
      v7 = CFSTR("files");
      return v7;
    }
    -[CHSWidgetDescriptor kind](self->_avocadoDescriptor, "kind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindAppPredictions"));

    if ((v14 & 1) != 0)
    {
      v7 = CFSTR("apppredpanel");
      return v7;
    }
LABEL_12:
    -[CHSWidgetDescriptor extensionBundleIdentifier](self->_avocadoDescriptor, "extensionBundleIdentifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  v7 = CFSTR("suggestions");
  return v7;
}

- (id)widgetKind
{
  return (id)-[CHSWidgetDescriptor kind](self->_avocadoDescriptor, "kind");
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ATXHomeScreenWidgetDescriptor dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)compactDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self, "avocadoDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHomeScreenWidgetDescriptor avocadoDescriptor](self, "avocadoDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenWidgetDescriptor)initWithCoder:(id)a3
{
  id v4;
  ATXHomeScreenWidgetDescriptor *v5;
  uint64_t v6;
  NSString *appBundleId;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  CHSWidgetDescriptor *avocadoDescriptor;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXHomeScreenWidgetDescriptor;
  v5 = -[ATXHomeScreenWidgetDescriptor init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v6;

    v8 = (void *)MEMORY[0x1A85A4F90]();
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("avocadoDescriptor"));
    v12 = objc_claimAutoreleasedReturnValue();
    avocadoDescriptor = v5->_avocadoDescriptor;
    v5->_avocadoDescriptor = (CHSWidgetDescriptor *)v12;

    v5->_suggestedSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("widgetSuggestedSize"));
    v5->_rankType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rankType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appBundleId;
  id v5;

  appBundleId = self->_appBundleId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appBundleId, CFSTR("appBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_avocadoDescriptor, CFSTR("avocadoDescriptor"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_suggestedSize, CFSTR("widgetSuggestedSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rankType, CFSTR("rankType"));

}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_appBundleId, "hash");
  v4 = -[CHSWidgetDescriptor hash](self->_avocadoDescriptor, "hash");
  v5 = self->_suggestedSize - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return self->_rankType - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenWidgetDescriptor *v4;
  id *v5;
  NSString *appBundleId;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  BOOL v11;
  CHSWidgetDescriptor *avocadoDescriptor;
  CHSWidgetDescriptor *v13;
  CHSWidgetDescriptor *v14;
  CHSWidgetDescriptor *v15;
  char v16;
  unint64_t suggestedSize;
  int64_t rankType;

  v4 = (ATXHomeScreenWidgetDescriptor *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      appBundleId = self->_appBundleId;
      v7 = (NSString *)v5[1];
      if (appBundleId == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = appBundleId;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_15;
      }
      avocadoDescriptor = self->_avocadoDescriptor;
      v13 = (CHSWidgetDescriptor *)v5[2];
      if (avocadoDescriptor == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = avocadoDescriptor;
        v16 = -[CHSWidgetDescriptor isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
          goto LABEL_15;
      }
      suggestedSize = self->_suggestedSize;
      if (suggestedSize == objc_msgSend(v5, "suggestedSize"))
      {
        rankType = self->_rankType;
        v11 = rankType == objc_msgSend(v5, "rankType");
LABEL_16:

        goto LABEL_17;
      }
LABEL_15:
      v11 = 0;
      goto LABEL_16;
    }
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CHSWidgetDescriptor)avocadoDescriptor
{
  return self->_avocadoDescriptor;
}

- (void)setAvocadoDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)suggestedSize
{
  return self->_suggestedSize;
}

- (void)setSuggestedSize:(unint64_t)a3
{
  self->_suggestedSize = a3;
}

- (int64_t)rankType
{
  return self->_rankType;
}

- (void)setRankType:(int64_t)a3
{
  self->_rankType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avocadoDescriptor, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
