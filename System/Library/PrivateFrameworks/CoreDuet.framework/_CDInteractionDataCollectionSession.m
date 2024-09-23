@implementation _CDInteractionDataCollectionSession

- (_CDInteractionDataCollectionSession)initWithIdentifier:(id)a3 salt:(id)a4 latestStartDate:(id)a5 lastCollectionDate:(id)a6 batchNumber:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _CDInteractionDataCollectionSession *v16;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSData *salt;
  uint64_t v21;
  NSDate *latestStartDate;
  uint64_t v23;
  NSDate *lastCollectionDate;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_CDInteractionDataCollectionSession;
  v16 = -[_CDInteractionDataCollectionSession init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    salt = v16->_salt;
    v16->_salt = (NSData *)v19;

    v21 = objc_msgSend(v14, "copy");
    latestStartDate = v16->_latestStartDate;
    v16->_latestStartDate = (NSDate *)v21;

    v23 = objc_msgSend(v15, "copy");
    lastCollectionDate = v16->_lastCollectionDate;
    v16->_lastCollectionDate = (NSDate *)v23;

    v16->_batchNumber = a7;
  }

  return v16;
}

+ (id)generateNewSession
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __SecRandom *v7;
  id v8;
  void *v9;
  void *v10;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v8 = objc_retainAutorelease(v6);
  if (SecRandomCopyBytes(v7, 0x20uLL, (void *)objc_msgSend(v8, "mutableBytes")))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v10 = (void *)objc_msgSend(v2, "initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:", v5, v9, 0, 0, 1);
  return v10;
}

- (id)subsequentSessionWithlatestStartDate:(id)a3 lastCollectionDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    -[_CDInteractionDataCollectionSession latestStartDate](self, "latestStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v10;

  }
  v11 = objc_alloc((Class)objc_opt_class());
  -[_CDInteractionDataCollectionSession identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionDataCollectionSession salt](self, "salt");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:", v12, v13, v6, v7, -[_CDInteractionDataCollectionSession batchNumber](self, "batchNumber") + 1);

  return v14;
}

- (BOOL)isValidForCollectionDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;

  v4 = a3;
  -[_CDInteractionDataCollectionSession latestStartDate](self, "latestStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_CDInteractionDataCollectionSession latestStartDate](self, "latestStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "compare:", v6) != -1;

  }
  else
  {
    v7 = 1;
  }

  -[_CDInteractionDataCollectionSession lastCollectionDate](self, "lastCollectionDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_CDInteractionDataCollectionSession lastCollectionDate](self, "lastCollectionDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "compare:", v10);

    if (v11 == -1)
      v7 = 0;
  }
  -[_CDInteractionDataCollectionSession identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[_CDInteractionDataCollectionSession salt](self, "salt");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (-[_CDInteractionDataCollectionSession batchNumber](self, "batchNumber"))
        v14 = v7;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _CDInteractionDataCollectionSession *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _CDInteractionDataCollectionSession *v9;

  v4 = +[_CDInteractionDataCollectionSession allocWithZone:](_CDInteractionDataCollectionSession, "allocWithZone:", a3);
  -[_CDInteractionDataCollectionSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionDataCollectionSession salt](self, "salt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionDataCollectionSession latestStartDate](self, "latestStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionDataCollectionSession lastCollectionDate](self, "lastCollectionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_CDInteractionDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](v4, "initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:", v5, v6, v7, v8, -[_CDInteractionDataCollectionSession batchNumber](self, "batchNumber"));

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
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
  unint64_t v13;
  id v14;

  v4 = a3;
  -[_CDInteractionDataCollectionSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[_CDInteractionDataCollectionSession salt](self, "salt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_salt);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[_CDInteractionDataCollectionSession latestStartDate](self, "latestStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_latestStartDate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[_CDInteractionDataCollectionSession lastCollectionDate](self, "lastCollectionDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_lastCollectionDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[_CDInteractionDataCollectionSession batchNumber](self, "batchNumber");
  NSStringFromSelector(sel_batchNumber);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v13, v14);

}

- (_CDInteractionDataCollectionSession)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _CDInteractionDataCollectionSession *v19;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_salt);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_latestStartDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  NSStringFromSelector(sel_lastCollectionDate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_batchNumber);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "decodeIntegerForKey:", v17);

  v19 = -[_CDInteractionDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](self, "initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:", v7, v10, v13, v16, v18);
  return v19;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)salt
{
  return self->_salt;
}

- (NSDate)latestStartDate
{
  return self->_latestStartDate;
}

- (NSDate)lastCollectionDate
{
  return self->_lastCollectionDate;
}

- (unint64_t)batchNumber
{
  return self->_batchNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCollectionDate, 0);
  objc_storeStrong((id *)&self->_latestStartDate, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
