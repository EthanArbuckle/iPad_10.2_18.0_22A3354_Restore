@implementation INObject

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[INObject displayString](self, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizeForLanguage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_intents_readableSubtitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[INObject subtitleString](self, "subtitleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizeForLanguage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_intents_localizedCopyWithLocalizer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[INObject identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INObject displayString](self, "displayString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizeForLanguage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INObject pronunciationHint](self, "pronunciationHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "localizeForLanguage:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithIdentifier:displayString:pronunciationHint:", v6, v9, v12);

  return v13;
}

- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString pronunciationHint:(NSString *)pronunciationHint
{
  NSString *v8;
  NSString *v9;
  NSString *v10;
  INObject *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  NSString *v17;
  objc_super v19;

  v8 = identifier;
  v9 = displayString;
  v10 = pronunciationHint;
  v19.receiver = self;
  v19.super_class = (Class)INObject;
  v11 = -[INObject init](&v19, sel_init);
  if (v11)
  {
    v12 = -[NSString copy](v8, "copy");
    v13 = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = -[NSString copy](v9, "copy");
    v15 = v11->_displayString;
    v11->_displayString = (NSString *)v14;

    v16 = -[NSString copy](v10, "copy");
    v17 = v11->_pronunciationHint;
    v11->_pronunciationHint = (NSString *)v16;

  }
  return v11;
}

- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString
{
  return -[INObject initWithIdentifier:displayString:pronunciationHint:](self, "initWithIdentifier:displayString:pronunciationHint:", identifier, displayString, 0);
}

- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString subtitleString:(NSString *)subtitleString displayImage:(INImage *)displayImage
{
  NSString *v10;
  INImage *v11;
  INObject *v12;
  INObject *v13;
  uint64_t v14;
  NSString *v15;

  v10 = subtitleString;
  v11 = displayImage;
  v12 = -[INObject initWithIdentifier:displayString:pronunciationHint:](self, "initWithIdentifier:displayString:pronunciationHint:", identifier, displayString, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayImage, displayImage);
    v14 = -[NSString copy](v10, "copy");
    v15 = v13->_subtitleString;
    v13->_subtitleString = (NSString *)v14;

  }
  return v13;
}

- (INObject)initWithIdentifier:(NSString *)identifier displayString:(NSString *)displayString pronunciationHint:(NSString *)pronunciationHint subtitleString:(NSString *)subtitleString displayImage:(INImage *)displayImage
{
  NSString *v12;
  INImage *v13;
  INObject *v14;
  INObject *v15;
  uint64_t v16;
  NSString *v17;

  v12 = subtitleString;
  v13 = displayImage;
  v14 = -[INObject initWithIdentifier:displayString:pronunciationHint:](self, "initWithIdentifier:displayString:pronunciationHint:", identifier, displayString, pronunciationHint);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_displayImage, displayImage);
    v16 = -[NSString copy](v12, "copy");
    v17 = v15->_subtitleString;
    v15->_subtitleString = (NSString *)v16;

  }
  return v15;
}

- (void)setAlternativeSpeakableMatches:(NSArray *)alternativeSpeakableMatches
{
  NSArray *v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  INSpeakableString *v13;
  void *v14;
  void *v15;
  void *v16;
  INSpeakableString *v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  NSArray *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = alternativeSpeakableMatches;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v4;
    v6 = v4;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "spokenPhrase");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v13 = [INSpeakableString alloc];
            -[INObject identifier](self, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "spokenPhrase");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "pronunciationHint");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[INSpeakableString initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:](v13, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v14, v15, v16);

            objc_msgSend(v5, "addObject:", v17);
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    v18 = (NSArray *)objc_msgSend(v5, "copy");
    v19 = self->_alternativeSpeakableMatches;
    self->_alternativeSpeakableMatches = v18;

    v4 = v21;
  }
  else
  {
    v20 = self->_alternativeSpeakableMatches;
    self->_alternativeSpeakableMatches = 0;

  }
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_displayString, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_pronunciationHint, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INObject *v4;
  INObject *v5;
  NSString *identifier;
  NSString *displayString;
  NSString *pronunciationHint;
  NSString *subtitleString;
  INImage *displayImage;
  BOOL v11;

  v4 = (INObject *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v11 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        displayString = self->_displayString;
        if (displayString == v5->_displayString || -[NSString isEqual:](displayString, "isEqual:"))
        {
          pronunciationHint = self->_pronunciationHint;
          if (pronunciationHint == v5->_pronunciationHint
            || -[NSString isEqual:](pronunciationHint, "isEqual:"))
          {
            subtitleString = self->_subtitleString;
            if (subtitleString == v5->_subtitleString || -[NSString isEqual:](subtitleString, "isEqual:"))
            {
              displayImage = self->_displayImage;
              if (displayImage == v5->_displayImage || -[INImage isEqual:](displayImage, "isEqual:"))
                v11 = 1;
            }
          }
        }
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (INObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  INObject *v18;
  INObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSString *subtitleString;
  uint64_t v25;
  INImage *displayImage;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("displayString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("pronunciationHint"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("alternativeSpeakableMatches"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[INObject initWithIdentifier:displayString:pronunciationHint:](self, "initWithIdentifier:displayString:pronunciationHint:", v5, v9, v13);
  v19 = v18;
  if (v18)
  {
    v42 = v13;
    v43 = v9;
    v44 = v5;
    objc_storeStrong((id *)&v18->_alternativeSpeakableMatches, v17);
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("subtitleString"));
    v23 = objc_claimAutoreleasedReturnValue();
    subtitleString = v19->_subtitleString;
    v19->_subtitleString = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayImage"));
    v25 = objc_claimAutoreleasedReturnValue();
    displayImage = v19->_displayImage;
    v19->_displayImage = (INImage *)v25;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSchema _defaultSchemaForBundle:](INSchema, "_defaultSchemaForBundle:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v28;
    objc_msgSend(v28, "_objectDescriptionForTypeOfClass:", objc_opt_class());
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "attributes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v46 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v35, "propertyName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), objc_msgSend(v35, "_unsafeObjectClass"), 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          -[INObject setValue:forProperty:](v19, "setValue:forProperty:", v38, v36);
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v32);
    }

    v9 = v43;
    v5 = v44;
    v13 = v42;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayString, CFSTR("displayString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pronunciationHint, CFSTR("pronunciationHint"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_alternativeSpeakableMatches, CFSTR("alternativeSpeakableMatches"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subtitleString, CFSTR("subtitleString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayImage, CFSTR("displayImage"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[INSchema _defaultSchemaForBundle:](INSchema, "_defaultSchemaForBundle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_objectDescriptionForTypeOfClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v7, "attributes", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

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
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "propertyName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[INObject valueForProperty:](self, "valueForProperty:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v4, "encodeObject:forKey:", v15, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (NSMutableDictionary)_valueForKeyDictionary
{
  NSMutableDictionary *valueForKeyDictionary;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  valueForKeyDictionary = self->_valueForKeyDictionary;
  if (!valueForKeyDictionary)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_valueForKeyDictionary;
    self->_valueForKeyDictionary = v4;

    valueForKeyDictionary = self->_valueForKeyDictionary;
  }
  return valueForKeyDictionary;
}

- (id)valueForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[INObject _valueForKeyDictionary](self, "_valueForKeyDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "if_stringByLowercasingFirstCharacter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "if_stringByLowercasingFirstCharacter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[INObject _valueForKeyDictionary](self, "_valueForKeyDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v9);
    else
      objc_msgSend(v10, "removeObjectForKey:", v9);

  }
  return v8 != 0;
}

- (void)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  NSString *identifier;
  uint64_t v13;
  void *v14;
  NSString *v15;
  NSString *displayString;
  uint64_t v17;
  void *v18;
  NSString *v19;
  NSString *pronunciationHint;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  NSArray *v31;
  NSArray *alternativeSpeakableMatches;
  uint64_t v33;
  void *v34;
  void *v35;
  NSString *v36;
  NSString *subtitleString;
  uint64_t v38;
  void *v39;
  INImage *v40;
  INImage *displayImage;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v11;

    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("displayString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    displayString = self->_displayString;
    self->_displayString = v15;

    v17 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pronunciationHint"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v17, v18);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    pronunciationHint = self->_pronunciationHint;
    self->_pronunciationHint = v19;

    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("alternativeSpeakableMatches"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
    }
    else
    {
      v23 = 0;
    }
    v24 = v23;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v43 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(v7, "decodeObjectOfClass:from:", objc_opt_class(), *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i), (_QWORD)v42);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "if_addObjectIfNonNil:", v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v27);
    }

    v31 = (NSArray *)objc_msgSend(v21, "copy");
    alternativeSpeakableMatches = self->_alternativeSpeakableMatches;
    self->_alternativeSpeakableMatches = v31;

    v33 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subtitleString"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (!v34)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("descriptionString"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "decodeObjectOfClass:from:", v33, v35, (_QWORD)v42);
    v36 = (NSString *)objc_claimAutoreleasedReturnValue();
    subtitleString = self->_subtitleString;
    self->_subtitleString = v36;

    if (!v34)
    v38 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("displayImage"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v38, v39);
    v40 = (INImage *)objc_claimAutoreleasedReturnValue();
    displayImage = self->_displayImage;
    self->_displayImage = v40;

  }
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  INObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v9, CFSTR("identifier"));

  objc_msgSend(v6, "encodeObject:", self->_displayString);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v10, CFSTR("displayString"));

  objc_msgSend(v6, "encodeObject:", self->_pronunciationHint);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v11, CFSTR("pronunciationHint"));

  objc_msgSend(v6, "encodeObject:", self->_alternativeSpeakableMatches);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v12, CFSTR("alternativeSpeakableMatches"));

  objc_msgSend(v6, "encodeObject:", self->_subtitleString);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v13, CFSTR("subtitleString"));

  objc_msgSend(v6, "encodeObject:", self->_subtitleString);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v14, CFSTR("descriptionString"));

  v15 = self;
  v16 = v6;
  objc_msgSend(v6, "encodeObject:", self->_displayImage);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  objc_msgSend(v8, "if_setObjectIfNonNil:forKey:", v17, CFSTR("displayImage"));

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = v7;
  objc_msgSend(v7, "attributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v20;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v25, "propertyName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[INObject valueForUndefinedKey:](v15, "valueForUndefinedKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "encodeObject:withCodableAttribute:", v27, v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "propertyName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "if_setObjectIfNonNil:forKey:", v28, v29);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v22);
  }

  objc_msgSend(v32, "semanticRoot");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "if_setObjectIfNonNil:forKey:", v30, CFSTR("_type"));

  return v18;
}

- (NSString)description
{
  return (NSString *)-[INObject descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INObject;
  -[INObject description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INObject _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  objc_property_t *v6;
  unint64_t i;
  const char *Name;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *identifier;
  uint64_t v14;
  NSString *displayString;
  uint64_t v16;
  void *v17;
  NSString *pronunciationHint;
  void *v19;
  NSArray *alternativeSpeakableMatches;
  void *v21;
  NSString *subtitleString;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int outCount;
  _QWORD v30[5];
  _QWORD v31[6];

  v31[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    outCount = 0;
    v5 = (objc_class *)objc_opt_class();
    v6 = class_copyPropertyList(v5, &outCount);
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        Name = property_getName(v6[i]);
        if (Name)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", Name, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9
            && (objc_msgSend(v9, "hasPrefix:", CFSTR("_")) & 1) == 0
            && (objc_msgSend(v10, "isEqualToString:", CFSTR("codableDescription")) & 1) == 0)
          {
            -[INObject valueForProperty:](self, "valueForProperty:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);

            }
          }

        }
      }
    }
    free(v6);
  }
  v30[0] = CFSTR("identifier");
  identifier = self->_identifier;
  v14 = (uint64_t)identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v14;
  v31[0] = v14;
  v30[1] = CFSTR("displayString");
  displayString = self->_displayString;
  v16 = (uint64_t)displayString;
  if (!displayString)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v3;
  v26 = v16;
  v31[1] = v16;
  v30[2] = CFSTR("pronunciationHint");
  pronunciationHint = self->_pronunciationHint;
  v19 = pronunciationHint;
  if (!pronunciationHint)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v16, v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[2] = v19;
  v30[3] = CFSTR("alternativeSpeakableMatches");
  alternativeSpeakableMatches = self->_alternativeSpeakableMatches;
  v21 = alternativeSpeakableMatches;
  if (!alternativeSpeakableMatches)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[3] = v21;
  v30[4] = CFSTR("subtitleString");
  subtitleString = self->_subtitleString;
  v23 = subtitleString;
  if (!subtitleString)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[4] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v24);

  if (subtitleString)
  {
    if (alternativeSpeakableMatches)
      goto LABEL_27;
  }
  else
  {

    if (alternativeSpeakableMatches)
    {
LABEL_27:
      if (pronunciationHint)
        goto LABEL_28;
      goto LABEL_33;
    }
  }

  if (pronunciationHint)
  {
LABEL_28:
    if (displayString)
      goto LABEL_29;
LABEL_34:

    if (identifier)
      return v17;
LABEL_35:

    return v17;
  }
LABEL_33:

  if (!displayString)
    goto LABEL_34;
LABEL_29:
  if (!identifier)
    goto LABEL_35;
  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)pronunciationHint
{
  return self->_pronunciationHint;
}

- (NSString)subtitleString
{
  return self->_subtitleString;
}

- (void)setSubtitleString:(NSString *)subtitleString
{
  objc_setProperty_nonatomic_copy(self, a2, subtitleString, 40);
}

- (INImage)displayImage
{
  return self->_displayImage;
}

- (void)setDisplayImage:(INImage *)displayImage
{
  objc_storeStrong((id *)&self->_displayImage, displayImage);
}

- (NSArray)alternativeSpeakableMatches
{
  return self->_alternativeSpeakableMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeSpeakableMatches, 0);
  objc_storeStrong((id *)&self->_displayImage, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_valueForKeyDictionary, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return INResolveInstanceMethod(a3, (objc_class *)a1);
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:displayString:", 0, &stru_1E2295770);
    objc_msgSend(v11, "_intents_decodeWithJSONDecoder:codableDescription:from:", v8, v9, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
