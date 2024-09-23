@implementation CADEventCreatedFromSuggestionPredicate

- (CADEventCreatedFromSuggestionPredicate)initWithExtractionGroupIdentifier:(id)a3
{
  return -[CADEventCreatedFromSuggestionPredicate initWithOpaqueKey:extractionGroupIdentifier:](self, "initWithOpaqueKey:extractionGroupIdentifier:", 0, a3);
}

- (CADEventCreatedFromSuggestionPredicate)initWithOpaqueKey:(id)a3
{
  return -[CADEventCreatedFromSuggestionPredicate initWithOpaqueKey:extractionGroupIdentifier:](self, "initWithOpaqueKey:extractionGroupIdentifier:", a3, 0);
}

- (CADEventCreatedFromSuggestionPredicate)initWithOpaqueKey:(id)a3 extractionGroupIdentifier:(id)a4
{
  id v6;
  id v7;
  CADEventCreatedFromSuggestionPredicate *v8;
  uint64_t v9;
  NSString *opaqueKey;
  uint64_t v11;
  NSString *extractionGroupIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CADEventCreatedFromSuggestionPredicate;
  v8 = -[CADEventCreatedFromSuggestionPredicate init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    opaqueKey = v8->_opaqueKey;
    v8->_opaqueKey = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    extractionGroupIdentifier = v8->_extractionGroupIdentifier;
    v8->_extractionGroupIdentifier = (NSString *)v11;

  }
  return v8;
}

+ (id)predicateForAllSuggestedEvents
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOpaqueKey:extractionGroupIdentifier:", 0, 0);
}

- (id)predicateFormat
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CADEventCreatedFromSuggestionPredicate opaqueKey](self, "opaqueKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CADEventCreatedFromSuggestionPredicate opaqueKey:%@"), self->_opaqueKey);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CADEventCreatedFromSuggestionPredicate extractionGroupIdentifier](self, "extractionGroupIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[CADEventCreatedFromSuggestionPredicate extractionGroupIdentifier](self, "extractionGroupIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("CADEventCreatedFromSuggestionPredicate extractionGroupIdentifier:%@"), v7);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = CFSTR("CADEventCreatedFromSuggestionPredicate allSuggestedEvents");
    }
  }
  return v4;
}

- (id)defaultPropertiesToLoad
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  CADEKPersistentEventDefaultPropertiesToLoad();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D0B408];
  v7[0] = *MEMORY[0x1E0D0B258];
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CADEventCreatedFromSuggestionPredicate)initWithCoder:(id)a3
{
  id v4;
  CADEventCreatedFromSuggestionPredicate *v5;
  uint64_t v6;
  NSString *opaqueKey;
  uint64_t v8;
  NSString *extractionGroupIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADEventCreatedFromSuggestionPredicate;
  v5 = -[EKPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("opaqueKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    opaqueKey = v5->_opaqueKey;
    v5->_opaqueKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extractionGroupIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    extractionGroupIdentifier = v5->_extractionGroupIdentifier;
    v5->_extractionGroupIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CADEventCreatedFromSuggestionPredicate;
  v4 = a3;
  -[EKPredicate encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CADEventCreatedFromSuggestionPredicate opaqueKey](self, "opaqueKey", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("opaqueKey"));

  -[CADEventCreatedFromSuggestionPredicate extractionGroupIdentifier](self, "extractionGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("extractionGroupIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  CADEventCreatedFromSuggestionPredicate *v4;
  CADEventCreatedFromSuggestionPredicate *v5;
  CADEventCreatedFromSuggestionPredicate *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (CADEventCreatedFromSuggestionPredicate *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[CADEventCreatedFromSuggestionPredicate opaqueKey](v6, "opaqueKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CalEqualStrings();

    if (v8)
    {
      -[CADEventCreatedFromSuggestionPredicate extractionGroupIdentifier](self, "extractionGroupIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADEventCreatedFromSuggestionPredicate extractionGroupIdentifier](v6, "extractionGroupIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CalEqualStrings();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CADEventCreatedFromSuggestionPredicate opaqueKey](self, "opaqueKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CADEventCreatedFromSuggestionPredicate opaqueKey](self, "opaqueKey");
LABEL_3:
    v5 = (void *)CalDatabaseCopyOfAllEventsCreatedFromSuggestionsInStore();
    goto LABEL_6;
  }
  -[CADEventCreatedFromSuggestionPredicate extractionGroupIdentifier](self, "extractionGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_3;
  -[CADEventCreatedFromSuggestionPredicate extractionGroupIdentifier](self, "extractionGroupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)CalDatabaseCopyOfAllEventsCreatedFromSuggestionsWithExtractionGroupIdentifierInStore();

LABEL_6:
  if (objc_msgSend(v5, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = (const void *)CalEventOccurrenceCreateForInitialOccurrence();
          objc_msgSend(v8, "addObject:", v14, v16);
          CFRelease(v14);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)opaqueKey
{
  return self->_opaqueKey;
}

- (NSString)extractionGroupIdentifier
{
  return self->_extractionGroupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_opaqueKey, 0);
}

@end
