@implementation _CDDataCollectionSession

- (_QWORD)initWithIdentifier:(void *)a3 salt:(void *)a4 latestStartDate:(void *)a5 lastCollectionDate:(uint64_t)a6 batchNumber:
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)_CDDataCollectionSession;
    a1 = objc_msgSendSuper2(&v24, sel_init);
    if (a1)
    {
      v15 = objc_msgSend(v11, "copy");
      v16 = (void *)a1[1];
      a1[1] = v15;

      v17 = objc_msgSend(v12, "copy");
      v18 = (void *)a1[2];
      a1[2] = v17;

      v19 = objc_msgSend(v13, "copy");
      v20 = (void *)a1[3];
      a1[3] = v19;

      v21 = objc_msgSend(v14, "copy");
      v22 = (void *)a1[4];
      a1[4] = v21;

      a1[5] = a6;
    }
  }

  return a1;
}

+ (_QWORD)generateNewSession
{
  objc_class *v0;
  void *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v0 = (objc_class *)objc_opt_self();
  +[_CDDataCollectionUtilities randomDataWithLength:](_CDDataCollectionUtilities, "randomDataWithLength:", 32);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = [v0 alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CDDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](v2, v5, v1, 0, 0, 1);

  return v6;
}

- (_QWORD)subsequentSessionWithlatestStartDate:(void *)a3 lastCollectionDate:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!v5)
    {
      v7 = (id)a1[3];
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v9;

    }
    v10 = objc_alloc((Class)objc_opt_class());
    v11 = (void *)a1[1];
    v12 = (void *)a1[2];
    v13 = a1[5] + 1;
    v14 = v11;
    a1 = -[_CDDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](v10, v14, v12, v5, v6, v13);

  }
  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _CDDataCollectionSession *v4;
  NSString *v5;
  NSData *v6;
  NSDate *v7;
  NSDate *v8;
  unint64_t batchNumber;
  _QWORD *v10;

  v4 = +[_CDDataCollectionSession allocWithZone:](_CDDataCollectionSession, "allocWithZone:", a3);
  if (self)
  {
    v5 = self->_identifier;
    v6 = self->_salt;
    v7 = self->_latestStartDate;
    v8 = self->_lastCollectionDate;
    batchNumber = self->_batchNumber;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    v5 = 0;
    v7 = 0;
    batchNumber = 0;
  }
  v10 = -[_CDDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](v4, v5, v6, v7, v8, batchNumber);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *salt;
  NSDate *lastCollectionDate;
  unint64_t batchNumber;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self)
  {
    objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
    salt = self->_salt;
  }
  else
  {
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("identifier"));
    salt = 0;
  }
  objc_msgSend(v8, "encodeObject:forKey:", salt, CFSTR("salt"));
  if (self)
  {
    objc_msgSend(v8, "encodeObject:forKey:", self->_latestStartDate, CFSTR("latestStartDate"));
    lastCollectionDate = self->_lastCollectionDate;
  }
  else
  {
    objc_msgSend(v8, "encodeObject:forKey:", 0, CFSTR("latestStartDate"));
    lastCollectionDate = 0;
  }
  objc_msgSend(v8, "encodeObject:forKey:", lastCollectionDate, CFSTR("lastCollectionDate"));
  if (self)
    batchNumber = self->_batchNumber;
  else
    batchNumber = 0;
  objc_msgSend(v8, "encodeInteger:forKey:", batchNumber, CFSTR("batchNumber"));

}

- (_CDDataCollectionSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _CDDataCollectionSession *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("salt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latestStartDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastCollectionDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batchNumber"));

  v10 = (_CDDataCollectionSession *)-[_CDDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](self, v5, v6, v7, v8, v9);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCollectionDate, 0);
  objc_storeStrong((id *)&self->_latestStartDate, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
