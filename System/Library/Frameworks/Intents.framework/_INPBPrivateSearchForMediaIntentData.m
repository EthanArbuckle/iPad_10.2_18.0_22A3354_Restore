@implementation _INPBPrivateSearchForMediaIntentData

- (void)setAppInferred:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_appInferred = a3;
}

- (BOOL)hasAppInferred
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAppInferred:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

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
  return _INPBPrivateSearchForMediaIntentDataReadFrom(self, (uint64_t)a3);
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
  if (-[_INPBPrivateSearchForMediaIntentData hasAppInferred](self, "hasAppInferred"))
    PBDataWriterWriteBOOLField();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
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

  -[_INPBPrivateSearchForMediaIntentData pegasusMetaData](self, "pegasusMetaData", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteDataField();
  -[_INPBPrivateSearchForMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBPrivateSearchForMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBPrivateSearchForMediaIntentData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPrivateSearchForMediaIntentData *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPrivateSearchForMediaIntentData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPrivateSearchForMediaIntentData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPrivateSearchForMediaIntentData initWithData:](self, "initWithData:", v6);

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
  -[_INPBPrivateSearchForMediaIntentData data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPrivateSearchForMediaIntentData *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = -[_INPBPrivateSearchForMediaIntentData init](+[_INPBPrivateSearchForMediaIntentData allocWithZone:](_INPBPrivateSearchForMediaIntentData, "allocWithZone:"), "init");
  if (-[_INPBPrivateSearchForMediaIntentData hasAppInferred](self, "hasAppInferred"))
    -[_INPBPrivateSearchForMediaIntentData setAppInferred:](v5, "setAppInferred:", -[_INPBPrivateSearchForMediaIntentData appInferred](self, "appInferred"));
  v6 = (void *)-[NSArray copyWithZone:](self->_audioSearchResults, "copyWithZone:", a3);
  -[_INPBPrivateSearchForMediaIntentData setAudioSearchResults:](v5, "setAudioSearchResults:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_internalSignals, "copyWithZone:", a3);
  -[_INPBPrivateSearchForMediaIntentData setInternalSignals:](v5, "setInternalSignals:", v7);

  v8 = (void *)-[NSData copyWithZone:](self->_pegasusMetaData, "copyWithZone:", a3);
  -[_INPBPrivateSearchForMediaIntentData setPegasusMetaData:](v5, "setPegasusMetaData:", v8);

  v9 = -[_INPBPrivateMediaIntentData copyWithZone:](self->_privateMediaIntentData, "copyWithZone:", a3);
  -[_INPBPrivateSearchForMediaIntentData setPrivateMediaIntentData:](v5, "setPrivateMediaIntentData:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int appInferred;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  v5 = -[_INPBPrivateSearchForMediaIntentData hasAppInferred](self, "hasAppInferred");
  if (v5 != objc_msgSend(v4, "hasAppInferred"))
    goto LABEL_26;
  if (-[_INPBPrivateSearchForMediaIntentData hasAppInferred](self, "hasAppInferred"))
  {
    if (objc_msgSend(v4, "hasAppInferred"))
    {
      appInferred = self->_appInferred;
      if (appInferred != objc_msgSend(v4, "appInferred"))
        goto LABEL_26;
    }
  }
  -[_INPBPrivateSearchForMediaIntentData audioSearchResults](self, "audioSearchResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioSearchResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBPrivateSearchForMediaIntentData audioSearchResults](self, "audioSearchResults");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBPrivateSearchForMediaIntentData audioSearchResults](self, "audioSearchResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioSearchResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBPrivateSearchForMediaIntentData internalSignals](self, "internalSignals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalSignals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBPrivateSearchForMediaIntentData internalSignals](self, "internalSignals");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBPrivateSearchForMediaIntentData internalSignals](self, "internalSignals");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internalSignals");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBPrivateSearchForMediaIntentData pegasusMetaData](self, "pegasusMetaData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusMetaData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBPrivateSearchForMediaIntentData pegasusMetaData](self, "pegasusMetaData");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBPrivateSearchForMediaIntentData pegasusMetaData](self, "pegasusMetaData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusMetaData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBPrivateSearchForMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateMediaIntentData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBPrivateSearchForMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {

LABEL_29:
      v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    -[_INPBPrivateSearchForMediaIntentData privateMediaIntentData](self, "privateMediaIntentData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateMediaIntentData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if ((v28 & 1) != 0)
      goto LABEL_29;
  }
  else
  {
LABEL_25:

  }
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (-[_INPBPrivateSearchForMediaIntentData hasAppInferred](self, "hasAppInferred"))
    v3 = 2654435761 * self->_appInferred;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_audioSearchResults, "hash") ^ v3;
  v5 = -[NSArray hash](self->_internalSignals, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_pegasusMetaData, "hash");
  return v6 ^ -[_INPBPrivateMediaIntentData hash](self->_privateMediaIntentData, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBPrivateSearchForMediaIntentData hasAppInferred](self, "hasAppInferred"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBPrivateSearchForMediaIntentData appInferred](self, "appInferred"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("appInferred"));

  }
  if (-[NSArray count](self->_audioSearchResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_audioSearchResults;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "dictionaryRepresentation", (_QWORD)v19);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioSearchResults"));
  }
  if (self->_internalSignals)
  {
    -[_INPBPrivateSearchForMediaIntentData internalSignals](self, "internalSignals");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("internalSignal"));

  }
  if (self->_pegasusMetaData)
  {
    -[_INPBPrivateSearchForMediaIntentData pegasusMetaData](self, "pegasusMetaData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pegasusMetaData"));

  }
  -[_INPBPrivateSearchForMediaIntentData privateMediaIntentData](self, "privateMediaIntentData", (_QWORD)v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("privateMediaIntentData"));

  return v3;
}

- (BOOL)appInferred
{
  return self->_appInferred;
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
