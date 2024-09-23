@implementation _CDContextValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("_CDContextMetadataTransitionDateKey"));
}

- (void)setValue:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", a3, CFSTR("_CDContextMetadataDataKey"));
}

- (void)setLastModifiedDate:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", a3, CFSTR("_CDContextMetadataTransitionDateKey"));
}

- (NSCopying)value
{
  return (NSCopying *)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("_CDContextMetadataDataKey"));
}

- (_CDContextValue)initWithCoder:(id)a3
{
  id v4;
  _CDContextValue *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *metadata;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CDContextValue;
  v5 = -[_CDContextValue init](&v12, sel_init);
  if (v5)
  {
    +[_CDContextValue supportedContextValueClasses](_CDContextValue, "supportedContextValueClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModified"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSMutableDictionary *)v9;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_metadata, "setObject:forKeyedSubscript:", v7, CFSTR("_CDContextMetadataDataKey"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_metadata, "setObject:forKeyedSubscript:", v8, CFSTR("_CDContextMetadataTransitionDateKey"));

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", self->_metadata);

  return v4;
}

- (_CDContextValue)init
{
  _CDContextValue *v2;
  uint64_t v3;
  NSMutableDictionary *metadata;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CDContextValue;
  v2 = -[_CDContextValue init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    metadata = v2->_metadata;
    v2->_metadata = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (NSMutableDictionary)metadata
{
  return self->_metadata;
}

+ (NSSet)supportedContextValueClasses
{
  if (supportedContextValueClasses_initialized != -1)
    dispatch_once(&supportedContextValueClasses_initialized, &__block_literal_global_13);
  return (NSSet *)(id)supportedContextValueClasses_supportedContextValueClasses;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *metadata;
  id v5;
  void *v6;
  id v7;

  metadata = self->_metadata;
  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](metadata, "objectForKeyedSubscript:", CFSTR("_CDContextMetadataDataKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("value"));

  -[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("_CDContextMetadataTransitionDateKey"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("lastModified"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _CDContextValue *v4;
  _CDContextValue *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (_CDContextValue *)a3;
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
      -[_CDContextValue value](self, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDContextValue value](v5, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
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

  -[_CDContextValue value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = self->_metadata;
  objc_sync_enter(v3);
  -[_CDContextValue value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDContextValue lastModifiedDate](self, "lastModifiedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptionWithLocale:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Updated at %@"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  return v9;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

@end
