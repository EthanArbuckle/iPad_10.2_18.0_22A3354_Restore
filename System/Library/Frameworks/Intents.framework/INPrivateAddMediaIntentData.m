@implementation INPrivateAddMediaIntentData

- (INPrivateAddMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5 pegasusMetaData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  INPrivateAddMediaIntentData *v14;
  uint64_t v15;
  INPrivateMediaIntentData *privateMediaIntentData;
  uint64_t v17;
  NSArray *audioSearchResults;
  uint64_t v19;
  NSArray *internalSignals;
  uint64_t v21;
  NSData *pegasusMetaData;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)INPrivateAddMediaIntentData;
  v14 = -[INPrivateAddMediaIntentData init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    privateMediaIntentData = v14->_privateMediaIntentData;
    v14->_privateMediaIntentData = (INPrivateMediaIntentData *)v15;

    v17 = objc_msgSend(v11, "copy");
    audioSearchResults = v14->_audioSearchResults;
    v14->_audioSearchResults = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    internalSignals = v14->_internalSignals;
    v14->_internalSignals = (NSArray *)v19;

    v21 = objc_msgSend(v13, "copy");
    pegasusMetaData = v14->_pegasusMetaData;
    v14->_pegasusMetaData = (NSData *)v21;

  }
  return v14;
}

- (INPrivateAddMediaIntentData)initWithAudioSearchResults:(id)a3
{
  return -[INPrivateAddMediaIntentData initWithPrivateMediaIntentData:audioSearchResults:internalSignals:pegasusMetaData:](self, "initWithPrivateMediaIntentData:audioSearchResults:internalSignals:pegasusMetaData:", 0, a3, 0, 0);
}

- (INPrivateAddMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4
{
  return -[INPrivateAddMediaIntentData initWithPrivateMediaIntentData:audioSearchResults:internalSignals:pegasusMetaData:](self, "initWithPrivateMediaIntentData:audioSearchResults:internalSignals:pegasusMetaData:", a3, a4, 0, 0);
}

- (INPrivateAddMediaIntentData)initWithPrivateMediaIntentData:(id)a3 audioSearchResults:(id)a4 internalSignals:(id)a5
{
  return -[INPrivateAddMediaIntentData initWithPrivateMediaIntentData:audioSearchResults:internalSignals:pegasusMetaData:](self, "initWithPrivateMediaIntentData:audioSearchResults:internalSignals:pegasusMetaData:", a3, a4, a5, 0);
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[INPrivateMediaIntentData hash](self->_privateMediaIntentData, "hash");
  v4 = -[NSArray hash](self->_audioSearchResults, "hash") ^ v3;
  v5 = -[NSArray hash](self->_internalSignals, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_pegasusMetaData, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INPrivateAddMediaIntentData *v4;
  INPrivateAddMediaIntentData *v5;
  INPrivateMediaIntentData *privateMediaIntentData;
  NSArray *audioSearchResults;
  NSArray *internalSignals;
  NSData *pegasusMetaData;
  BOOL v10;

  v4 = (INPrivateAddMediaIntentData *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      privateMediaIntentData = self->_privateMediaIntentData;
      v10 = 0;
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
            pegasusMetaData = self->_pegasusMetaData;
            if (pegasusMetaData == v5->_pegasusMetaData
              || -[NSData isEqual:](pegasusMetaData, "isEqual:"))
            {
              v10 = 1;
            }
          }
        }
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (INPrivateAddMediaIntentData)initWithCoder:(id)a3
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
  INPrivateAddMediaIntentData *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateMediaIntentData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("audioSearchResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("internalSignals"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pegasusMetaData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[INPrivateAddMediaIntentData initWithPrivateMediaIntentData:audioSearchResults:internalSignals:pegasusMetaData:](self, "initWithPrivateMediaIntentData:audioSearchResults:internalSignals:pegasusMetaData:", v5, v9, v13, v14);
  return v15;
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

  objc_msgSend(v6, "encodeObject:", self->_pegasusMetaData);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("pegasusMetaData"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INPrivateAddMediaIntentData descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INPrivateAddMediaIntentData;
  -[INPrivateAddMediaIntentData description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPrivateAddMediaIntentData _dictionaryRepresentation](self, "_dictionaryRepresentation");
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
  void *v4;
  NSArray *audioSearchResults;
  void *v6;
  NSArray *internalSignals;
  void *v8;
  NSData *pegasusMetaData;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("privateMediaIntentData");
  privateMediaIntentData = self->_privateMediaIntentData;
  v4 = privateMediaIntentData;
  if (!privateMediaIntentData)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("audioSearchResults");
  audioSearchResults = self->_audioSearchResults;
  v6 = audioSearchResults;
  if (!audioSearchResults)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("internalSignals");
  internalSignals = self->_internalSignals;
  v8 = internalSignals;
  if (!internalSignals)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v8;
  v13[3] = CFSTR("pegasusMetaData");
  pegasusMetaData = self->_pegasusMetaData;
  v10 = pegasusMetaData;
  if (!pegasusMetaData)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (pegasusMetaData)
  {
    if (internalSignals)
      goto LABEL_11;
  }
  else
  {

    if (internalSignals)
    {
LABEL_11:
      if (audioSearchResults)
        goto LABEL_12;
LABEL_16:

      if (privateMediaIntentData)
        return v11;
LABEL_17:

      return v11;
    }
  }

  if (!audioSearchResults)
    goto LABEL_16;
LABEL_12:
  if (!privateMediaIntentData)
    goto LABEL_17;
  return v11;
}

- (INPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (void)setPrivateMediaIntentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)audioSearchResults
{
  return self->_audioSearchResults;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

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
    v16 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pegasusMetaData"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrivateMediaIntentData:audioSearchResults:internalSignals:pegasusMetaData:", v11, v14, v15, v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

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
  -[INPrivateAddMediaIntentData audioSearchResults](self, "audioSearchResults", 0);
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
  -[INPrivateAddMediaIntentData audioSearchResults](self, "audioSearchResults", 0);
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

@end
