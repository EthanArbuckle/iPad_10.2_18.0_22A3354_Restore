@implementation _DKCompatibility

+ (id)currentCompatibility
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___DKCompatibility_currentCompatibility__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentCompatibility_onceToken != -1)
    dispatch_once(&currentCompatibility_onceToken, block);
  return (id)currentCompatibility_compatibility;
}

+ (id)compatibilityWithMinVersion:(int64_t)a3 maxVersion:(int64_t)a4
{
  _DKCompatibility *v6;

  v6 = objc_alloc_init(_DKCompatibility);
  -[_DKCompatibility setMin:](v6, "setMin:", a3 & ~(a3 >> 63));
  -[_DKCompatibility setMax:](v6, "setMax:", a4);
  return v6;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("min");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_DKCompatibility min](self, "min"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("max");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_DKCompatibility max](self, "max"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)compatibilityFromSerializedCompatibility:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("min"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("max"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "compatibilityWithMinVersion:maxVersion:", objc_msgSend(v5, "unsignedLongLongValue"), objc_msgSend(v6, "unsignedLongLongValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)eventPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_DKCompatibility min](self, "min"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_DKCompatibility max](self, "max"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(compatibilityVersion >= %@ AND compatibilityVersion <= %@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)filterIncompatibleEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  _DKCompatibility *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_DKCompatibility eventPredicate](self, "eventPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_variant_has_internal_diagnostics() && (objc_msgSend(v6, "isEqual:", v4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minusSet:", v7);
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "%@ Filtered incompatible events: %@", (uint8_t *)&v11, 0x16u);
    }

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _DKCompatibility *v4;
  _DKCompatibility *v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;

  v4 = (_DKCompatibility *)a3;
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
      v6 = -[_DKCompatibility min](self, "min");
      if (v6 == -[_DKCompatibility min](v5, "min"))
      {
        v7 = -[_DKCompatibility max](self, "max");
        v8 = v7 == -[_DKCompatibility max](v5, "max");
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

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[_DKCompatibility min](self, "min");
  return -[_DKCompatibility max](self, "max") ^ v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_DKCompatibility min](self, "min"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_DKCompatibility max](self, "max"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("CompatibilityVersion {min: %@, max: %@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)min
{
  return self->_min;
}

- (void)setMin:(int64_t)a3
{
  self->_min = a3;
}

- (int64_t)max
{
  return self->_max;
}

- (void)setMax:(int64_t)a3
{
  self->_max = a3;
}

@end
