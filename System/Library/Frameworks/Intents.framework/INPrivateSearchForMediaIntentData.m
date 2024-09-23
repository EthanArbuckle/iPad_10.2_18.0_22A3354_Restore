@implementation INPrivateSearchForMediaIntentData

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[INPrivateSearchForMediaIntentData audioSearchResults](self, "audioSearchResults", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "_intents_cacheableObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v10 = v3;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[INPrivateSearchForMediaIntentData audioSearchResults](self, "audioSearchResults", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_intents_updateContainerWithCache:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5 appInferred:(id)a6 pegasusMetaData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  INPrivateSearchForMediaIntentData *v17;
  uint64_t v18;
  INPrivateMediaIntentData *privateMediaIntentData;
  uint64_t v20;
  NSArray *audioSearchResults;
  uint64_t v22;
  NSArray *internalSignals;
  uint64_t v24;
  NSNumber *appInferred;
  uint64_t v26;
  NSData *pegasusMetaData;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)INPrivateSearchForMediaIntentData;
  v17 = -[INPrivateSearchForMediaIntentData init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    privateMediaIntentData = v17->_privateMediaIntentData;
    v17->_privateMediaIntentData = (INPrivateMediaIntentData *)v18;

    v20 = objc_msgSend(v13, "copy");
    audioSearchResults = v17->_audioSearchResults;
    v17->_audioSearchResults = (NSArray *)v20;

    v22 = objc_msgSend(v14, "copy");
    internalSignals = v17->_internalSignals;
    v17->_internalSignals = (NSArray *)v22;

    v24 = objc_msgSend(v15, "copy");
    appInferred = v17->_appInferred;
    v17->_appInferred = (NSNumber *)v24;

    v26 = objc_msgSend(v16, "copy");
    pegasusMetaData = v17->_pegasusMetaData;
    v17->_pegasusMetaData = (NSData *)v26;

  }
  return v17;
}

- (INPrivateSearchForMediaIntentData)initWithAudioSearchResults:(id)a3
{
  return -[INPrivateSearchForMediaIntentData initWithPrivateMediaIntentData:audioSearchResults:internalSignals:appInferred:pegasusMetaData:](self, "initWithPrivateMediaIntentData:audioSearchResults:internalSignals:appInferred:pegasusMetaData:", 0, a3, 0, 0, 0);
}

- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4
{
  return -[INPrivateSearchForMediaIntentData initWithPrivateMediaIntentData:audioSearchResults:internalSignals:appInferred:pegasusMetaData:](self, "initWithPrivateMediaIntentData:audioSearchResults:internalSignals:appInferred:pegasusMetaData:", a3, a4, 0, 0, 0);
}

- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5
{
  return -[INPrivateSearchForMediaIntentData initWithPrivateMediaIntentData:audioSearchResults:internalSignals:appInferred:pegasusMetaData:](self, "initWithPrivateMediaIntentData:audioSearchResults:internalSignals:appInferred:pegasusMetaData:", a3, a4, a5, 0, 0);
}

- (INPrivateSearchForMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5 appInferred:(id)a6
{
  return -[INPrivateSearchForMediaIntentData initWithPrivateMediaIntentData:audioSearchResults:internalSignals:appInferred:pegasusMetaData:](self, "initWithPrivateMediaIntentData:audioSearchResults:internalSignals:appInferred:pegasusMetaData:", a3, a4, a5, a6, 0);
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[INPrivateMediaIntentData hash](self->_privateMediaIntentData, "hash");
  v4 = -[NSArray hash](self->_audioSearchResults, "hash") ^ v3;
  v5 = -[NSArray hash](self->_internalSignals, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_appInferred, "hash");
  return v6 ^ -[NSData hash](self->_pegasusMetaData, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INPrivateSearchForMediaIntentData *v4;
  INPrivateSearchForMediaIntentData *v5;
  INPrivateMediaIntentData *privateMediaIntentData;
  NSArray *audioSearchResults;
  NSArray *internalSignals;
  NSNumber *appInferred;
  NSData *pegasusMetaData;
  BOOL v11;

  v4 = (INPrivateSearchForMediaIntentData *)a3;
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
      privateMediaIntentData = self->_privateMediaIntentData;
      v11 = 0;
      if (privateMediaIntentData == v5->_privateMediaIntentData
        || -[INPrivateMediaIntentData isEqual:](privateMediaIntentData, "isEqual:"))
      {
        audioSearchResults = self->_audioSearchResults;
        if (audioSearchResults == v5->_audioSearchResults
          || -[NSArray isEqual:](audioSearchResults, "isEqual:"))
        {
          internalSignals = self->_internalSignals;
          if (internalSignals == v5->_internalSignals || -[NSArray isEqual:](internalSignals, "isEqual:"))
          {
            appInferred = self->_appInferred;
            if (appInferred == v5->_appInferred || -[NSNumber isEqual:](appInferred, "isEqual:"))
            {
              pegasusMetaData = self->_pegasusMetaData;
              if (pegasusMetaData == v5->_pegasusMetaData
                || -[NSData isEqual:](pegasusMetaData, "isEqual:"))
              {
                v11 = 1;
              }
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

- (INPrivateSearchForMediaIntentData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  INPrivateSearchForMediaIntentData *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateMediaIntentData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("audioSearchResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("internalSignals"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appInferred"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pegasusMetaData"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[INPrivateSearchForMediaIntentData initWithPrivateMediaIntentData:audioSearchResults:internalSignals:appInferred:pegasusMetaData:](self, "initWithPrivateMediaIntentData:audioSearchResults:internalSignals:appInferred:pegasusMetaData:", v5, v9, v13, v14, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  INPrivateMediaIntentData *privateMediaIntentData;
  id v5;

  privateMediaIntentData = self->_privateMediaIntentData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", privateMediaIntentData, CFSTR("privateMediaIntentData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioSearchResults, CFSTR("audioSearchResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_internalSignals, CFSTR("internalSignals"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appInferred, CFSTR("appInferred"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pegasusMetaData, CFSTR("pegasusMetaData"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_privateMediaIntentData);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("privateMediaIntentData"));

  objc_msgSend(v6, "encodeObject:", self->_audioSearchResults);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("audioSearchResults"));

  objc_msgSend(v6, "encodeObject:", self->_internalSignals);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("internalSignals"));

  objc_msgSend(v6, "encodeObject:", self->_appInferred);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("appInferred"));

  objc_msgSend(v6, "encodeObject:", self->_pegasusMetaData);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("pegasusMetaData"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INPrivateSearchForMediaIntentData descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INPrivateSearchForMediaIntentData;
  -[INPrivateSearchForMediaIntentData description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPrivateSearchForMediaIntentData _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INPrivateMediaIntentData *privateMediaIntentData;
  uint64_t v4;
  NSArray *audioSearchResults;
  void *v6;
  NSArray *internalSignals;
  void *v8;
  NSNumber *appInferred;
  void *v10;
  NSData *pegasusMetaData;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v17 = CFSTR("privateMediaIntentData");
  privateMediaIntentData = self->_privateMediaIntentData;
  v4 = (uint64_t)privateMediaIntentData;
  if (!privateMediaIntentData)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v4;
  v22[0] = v4;
  v18 = CFSTR("audioSearchResults");
  audioSearchResults = self->_audioSearchResults;
  v6 = audioSearchResults;
  if (!audioSearchResults)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v4, v17, v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v6;
  v19 = CFSTR("internalSignals");
  internalSignals = self->_internalSignals;
  v8 = internalSignals;
  if (!internalSignals)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v8;
  v20 = CFSTR("appInferred");
  appInferred = self->_appInferred;
  v10 = appInferred;
  if (!appInferred)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v10;
  v21 = CFSTR("pegasusMetaData");
  pegasusMetaData = self->_pegasusMetaData;
  v12 = pegasusMetaData;
  if (!pegasusMetaData)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (pegasusMetaData)
  {
    if (appInferred)
      goto LABEL_13;
  }
  else
  {

    if (appInferred)
    {
LABEL_13:
      if (internalSignals)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (internalSignals)
  {
LABEL_14:
    if (audioSearchResults)
      goto LABEL_15;
LABEL_20:

    if (privateMediaIntentData)
      return v13;
LABEL_21:

    return v13;
  }
LABEL_19:

  if (!audioSearchResults)
    goto LABEL_20;
LABEL_15:
  if (!privateMediaIntentData)
    goto LABEL_21;
  return v13;
}

- (INPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (NSArray)audioSearchResults
{
  return self->_audioSearchResults;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (NSNumber)appInferred
{
  return self->_appInferred;
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_appInferred, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_audioSearchResults, 0);
  objc_storeStrong((id *)&self->_privateMediaIntentData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("privateMediaIntentData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("audioSearchResults"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("internalSignals"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appInferred"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pegasusMetaData"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrivateMediaIntentData:audioSearchResults:internalSignals:appInferred:pegasusMetaData:", v11, v14, v15, v16, v19);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
