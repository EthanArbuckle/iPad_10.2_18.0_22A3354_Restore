@implementation _INPBPrivateAddMediaIntentData

- (void)setAudioSearchResults:(id)a3
{
  NSArray *v4;
  NSArray *audioSearchResults;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  audioSearchResults = self->_audioSearchResults;
  self->_audioSearchResults = v4;

}

- (void)clearAudioSearchResults
{
  -[NSArray removeAllObjects](self->_audioSearchResults, "removeAllObjects");
}

- (void)addAudioSearchResults:(id)a3
{
  id v4;
  NSArray *audioSearchResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  audioSearchResults = self->_audioSearchResults;
  v8 = v4;
  if (!audioSearchResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_audioSearchResults;
    self->_audioSearchResults = v6;

    v4 = v8;
    audioSearchResults = self->_audioSearchResults;
  }
  -[NSArray addObject:](audioSearchResults, "addObject:", v4);

}

- (unint64_t)audioSearchResultsCount
{
  return -[NSArray count](self->_audioSearchResults, "count");
}

- (id)audioSearchResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_audioSearchResults, "objectAtIndexedSubscript:", a3);
}

- (void)setInternalSignals:(id)a3
{
  NSArray *v4;
  NSArray *internalSignals;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  internalSignals = self->_internalSignals;
  self->_internalSignals = v4;

}

- (void)clearInternalSignals
{
  -[NSArray removeAllObjects](self->_internalSignals, "removeAllObjects");
}

- (void)addInternalSignal:(id)a3
{
  id v4;
  NSArray *internalSignals;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  internalSignals = self->_internalSignals;
  v8 = v4;
  if (!internalSignals)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_internalSignals;
    self->_internalSignals = v6;

    v4 = v8;
    internalSignals = self->_internalSignals;
  }
  -[NSArray addObject:](internalSignals, "addObject:", v4);

}

- (unint64_t)internalSignalsCount
{
  return -[NSArray count](self->_internalSignals, "count");
}

- (id)internalSignalAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_internalSignals, "objectAtIndexedSubscript:", a3);
}

- (void)setPegasusMetaData:(id)a3
{
  NSData *v4;
  NSData *pegasusMetaData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  pegasusMetaData = self->_pegasusMetaData;
  self->_pegasusMetaData = v4;

}

- (BOOL)hasPegasusMetaData
{
  return self->_pegasusMetaData != 0;
}

- (void)setPrivateMediaIntentData:(id)a3
{
  objc_storeStrong((id *)&self->_privateMediaIntentData, a3);
}

- (BOOL)hasPrivateMediaIntentData
{
  return self->_privateMediaIntentData != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPrivateAddMediaIntentDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_audioSearchResults;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_internalSignals;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

  -[_INPBPrivateAddMediaIntentData pegasusMetaData](self, "pegasusMetaData", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteDataField();
  -[_INPBPrivateAddMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBPrivateAddMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBPrivateAddMediaIntentData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPrivateAddMediaIntentData *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPrivateAddMediaIntentData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPrivateAddMediaIntentData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPrivateAddMediaIntentData initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBPrivateAddMediaIntentData data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPrivateAddMediaIntentData *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = -[_INPBPrivateAddMediaIntentData init](+[_INPBPrivateAddMediaIntentData allocWithZone:](_INPBPrivateAddMediaIntentData, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_audioSearchResults, "copyWithZone:", a3);
  -[_INPBPrivateAddMediaIntentData setAudioSearchResults:](v5, "setAudioSearchResults:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_internalSignals, "copyWithZone:", a3);
  -[_INPBPrivateAddMediaIntentData setInternalSignals:](v5, "setInternalSignals:", v7);

  v8 = (void *)-[NSData copyWithZone:](self->_pegasusMetaData, "copyWithZone:", a3);
  -[_INPBPrivateAddMediaIntentData setPegasusMetaData:](v5, "setPegasusMetaData:", v8);

  v9 = -[_INPBPrivateMediaIntentData copyWithZone:](self->_privateMediaIntentData, "copyWithZone:", a3);
  -[_INPBPrivateAddMediaIntentData setPrivateMediaIntentData:](v5, "setPrivateMediaIntentData:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBPrivateAddMediaIntentData audioSearchResults](self, "audioSearchResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioSearchResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBPrivateAddMediaIntentData audioSearchResults](self, "audioSearchResults");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBPrivateAddMediaIntentData audioSearchResults](self, "audioSearchResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioSearchResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBPrivateAddMediaIntentData internalSignals](self, "internalSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBPrivateAddMediaIntentData internalSignals](self, "internalSignals");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBPrivateAddMediaIntentData internalSignals](self, "internalSignals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internalSignals");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBPrivateAddMediaIntentData pegasusMetaData](self, "pegasusMetaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusMetaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBPrivateAddMediaIntentData pegasusMetaData](self, "pegasusMetaData");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBPrivateAddMediaIntentData pegasusMetaData](self, "pegasusMetaData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusMetaData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBPrivateAddMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateMediaIntentData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBPrivateAddMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBPrivateAddMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateMediaIntentData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSArray hash](self->_audioSearchResults, "hash");
  v4 = -[NSArray hash](self->_internalSignals, "hash") ^ v3;
  v5 = -[NSData hash](self->_pegasusMetaData, "hash");
  return v4 ^ v5 ^ -[_INPBPrivateMediaIntentData hash](self->_privateMediaIntentData, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_audioSearchResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = self->_audioSearchResults;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v18);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("audioSearchResults"));
  }
  if (self->_internalSignals)
  {
    -[_INPBPrivateAddMediaIntentData internalSignals](self, "internalSignals");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("internalSignal"));

  }
  if (self->_pegasusMetaData)
  {
    -[_INPBPrivateAddMediaIntentData pegasusMetaData](self, "pegasusMetaData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("pegasusMetaData"));

  }
  -[_INPBPrivateAddMediaIntentData privateMediaIntentData](self, "privateMediaIntentData", (_QWORD)v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("privateMediaIntentData"));

  return v3;
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

- (_INPBPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMediaIntentData, 0);
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_audioSearchResults, 0);
}

+ (Class)audioSearchResultsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
