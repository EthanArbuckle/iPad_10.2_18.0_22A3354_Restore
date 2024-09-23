@implementation _INPBPrivateUpdateMediaAffinityIntentData

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
  return _INPBPrivateUpdateMediaAffinityIntentDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_internalSignals;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[_INPBPrivateUpdateMediaAffinityIntentData pegasusMetaData](self, "pegasusMetaData", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteDataField();
  -[_INPBPrivateUpdateMediaAffinityIntentData privateMediaIntentData](self, "privateMediaIntentData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBPrivateUpdateMediaAffinityIntentData privateMediaIntentData](self, "privateMediaIntentData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBPrivateUpdateMediaAffinityIntentData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPrivateUpdateMediaAffinityIntentData *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPrivateUpdateMediaAffinityIntentData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPrivateUpdateMediaAffinityIntentData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPrivateUpdateMediaAffinityIntentData initWithData:](self, "initWithData:", v6);

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
  -[_INPBPrivateUpdateMediaAffinityIntentData data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPrivateUpdateMediaAffinityIntentData *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = -[_INPBPrivateUpdateMediaAffinityIntentData init](+[_INPBPrivateUpdateMediaAffinityIntentData allocWithZone:](_INPBPrivateUpdateMediaAffinityIntentData, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_internalSignals, "copyWithZone:", a3);
  -[_INPBPrivateUpdateMediaAffinityIntentData setInternalSignals:](v5, "setInternalSignals:", v6);

  v7 = (void *)-[NSData copyWithZone:](self->_pegasusMetaData, "copyWithZone:", a3);
  -[_INPBPrivateUpdateMediaAffinityIntentData setPegasusMetaData:](v5, "setPegasusMetaData:", v7);

  v8 = -[_INPBPrivateMediaIntentData copyWithZone:](self->_privateMediaIntentData, "copyWithZone:", a3);
  -[_INPBPrivateUpdateMediaAffinityIntentData setPrivateMediaIntentData:](v5, "setPrivateMediaIntentData:", v8);

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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBPrivateUpdateMediaAffinityIntentData internalSignals](self, "internalSignals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalSignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBPrivateUpdateMediaAffinityIntentData internalSignals](self, "internalSignals");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBPrivateUpdateMediaAffinityIntentData internalSignals](self, "internalSignals");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internalSignals");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBPrivateUpdateMediaAffinityIntentData pegasusMetaData](self, "pegasusMetaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pegasusMetaData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBPrivateUpdateMediaAffinityIntentData pegasusMetaData](self, "pegasusMetaData");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBPrivateUpdateMediaAffinityIntentData pegasusMetaData](self, "pegasusMetaData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusMetaData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBPrivateUpdateMediaAffinityIntentData privateMediaIntentData](self, "privateMediaIntentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateMediaIntentData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBPrivateUpdateMediaAffinityIntentData privateMediaIntentData](self, "privateMediaIntentData");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBPrivateUpdateMediaAffinityIntentData privateMediaIntentData](self, "privateMediaIntentData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateMediaIntentData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_internalSignals, "hash");
  v4 = -[NSData hash](self->_pegasusMetaData, "hash") ^ v3;
  return v4 ^ -[_INPBPrivateMediaIntentData hash](self->_privateMediaIntentData, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_internalSignals)
  {
    -[_INPBPrivateUpdateMediaAffinityIntentData internalSignals](self, "internalSignals");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("internalSignal"));

  }
  if (self->_pegasusMetaData)
  {
    -[_INPBPrivateUpdateMediaAffinityIntentData pegasusMetaData](self, "pegasusMetaData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("pegasusMetaData"));

  }
  -[_INPBPrivateUpdateMediaAffinityIntentData privateMediaIntentData](self, "privateMediaIntentData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("privateMediaIntentData"));

  return v3;
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
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
