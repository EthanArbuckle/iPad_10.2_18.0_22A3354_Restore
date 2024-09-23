@implementation INPrivateUpdateMediaAffinityIntentData

- (INPrivateUpdateMediaAffinityIntentData)initWithPrivateMediaIntentData:(id)a3 internalSignals:(id)a4 pegasusMetaData:(id)a5
{
  id v8;
  id v9;
  id v10;
  INPrivateUpdateMediaAffinityIntentData *v11;
  uint64_t v12;
  INPrivateMediaIntentData *privateMediaIntentData;
  uint64_t v14;
  NSArray *internalSignals;
  uint64_t v16;
  NSData *pegasusMetaData;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)INPrivateUpdateMediaAffinityIntentData;
  v11 = -[INPrivateUpdateMediaAffinityIntentData init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    privateMediaIntentData = v11->_privateMediaIntentData;
    v11->_privateMediaIntentData = (INPrivateMediaIntentData *)v12;

    v14 = objc_msgSend(v9, "copy");
    internalSignals = v11->_internalSignals;
    v11->_internalSignals = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    pegasusMetaData = v11->_pegasusMetaData;
    v11->_pegasusMetaData = (NSData *)v16;

  }
  return v11;
}

- (INPrivateUpdateMediaAffinityIntentData)initWithPrivateMediaIntentData:(id)a3
{
  return -[INPrivateUpdateMediaAffinityIntentData initWithPrivateMediaIntentData:internalSignals:pegasusMetaData:](self, "initWithPrivateMediaIntentData:internalSignals:pegasusMetaData:", a3, 0, 0);
}

- (INPrivateUpdateMediaAffinityIntentData)initWithPrivateMediaIntentData:(id)a3 internalSignals:(id)a4
{
  return -[INPrivateUpdateMediaAffinityIntentData initWithPrivateMediaIntentData:internalSignals:pegasusMetaData:](self, "initWithPrivateMediaIntentData:internalSignals:pegasusMetaData:", a3, a4, 0);
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[INPrivateMediaIntentData hash](self->_privateMediaIntentData, "hash");
  v4 = -[NSArray hash](self->_internalSignals, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_pegasusMetaData, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INPrivateUpdateMediaAffinityIntentData *v4;
  INPrivateUpdateMediaAffinityIntentData *v5;
  INPrivateMediaIntentData *privateMediaIntentData;
  NSArray *internalSignals;
  NSData *pegasusMetaData;
  BOOL v9;

  v4 = (INPrivateUpdateMediaAffinityIntentData *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      privateMediaIntentData = self->_privateMediaIntentData;
      v9 = 0;
      if (privateMediaIntentData == v5->_privateMediaIntentData
        || -[INPrivateMediaIntentData isEqual:](privateMediaIntentData, "isEqual:"))
      {
        internalSignals = self->_internalSignals;
        if (internalSignals == v5->_internalSignals || -[NSArray isEqual:](internalSignals, "isEqual:"))
        {
          pegasusMetaData = self->_pegasusMetaData;
          if (pegasusMetaData == v5->_pegasusMetaData || -[NSData isEqual:](pegasusMetaData, "isEqual:"))
            v9 = 1;
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INPrivateUpdateMediaAffinityIntentData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  INPrivateUpdateMediaAffinityIntentData *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateMediaIntentData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("internalSignals"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pegasusMetaData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[INPrivateUpdateMediaAffinityIntentData initWithPrivateMediaIntentData:internalSignals:pegasusMetaData:](self, "initWithPrivateMediaIntentData:internalSignals:pegasusMetaData:", v5, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  INPrivateMediaIntentData *privateMediaIntentData;
  id v5;

  privateMediaIntentData = self->_privateMediaIntentData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", privateMediaIntentData, CFSTR("privateMediaIntentData"));
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

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_privateMediaIntentData);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("privateMediaIntentData"));

  objc_msgSend(v6, "encodeObject:", self->_internalSignals);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("internalSignals"));

  objc_msgSend(v6, "encodeObject:", self->_pegasusMetaData);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("pegasusMetaData"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INPrivateUpdateMediaAffinityIntentData descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INPrivateUpdateMediaAffinityIntentData;
  -[INPrivateUpdateMediaAffinityIntentData description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPrivateUpdateMediaAffinityIntentData _dictionaryRepresentation](self, "_dictionaryRepresentation");
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
  NSArray *internalSignals;
  void *v6;
  NSData *pegasusMetaData;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("privateMediaIntentData");
  privateMediaIntentData = self->_privateMediaIntentData;
  v4 = privateMediaIntentData;
  if (!privateMediaIntentData)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("internalSignals");
  internalSignals = self->_internalSignals;
  v6 = internalSignals;
  if (!internalSignals)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("pegasusMetaData");
  pegasusMetaData = self->_pegasusMetaData;
  v8 = pegasusMetaData;
  if (!pegasusMetaData)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (pegasusMetaData)
  {
    if (internalSignals)
      goto LABEL_9;
LABEL_12:

    if (privateMediaIntentData)
      return v9;
LABEL_13:

    return v9;
  }

  if (!internalSignals)
    goto LABEL_12;
LABEL_9:
  if (!privateMediaIntentData)
    goto LABEL_13;
  return v9;
}

- (INPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (void)setPrivateMediaIntentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

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

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("internalSignals"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pegasusMetaData"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrivateMediaIntentData:internalSignals:pegasusMetaData:", v11, v12, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
