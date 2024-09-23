@implementation _CDCloudFamilyDataCollectionSession

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
    v24.super_class = (Class)_CDCloudFamilyDataCollectionSession;
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
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  const __SecRandom *v5;
  id v6;
  void *v7;
  _QWORD *v8;

  v0 = objc_alloc((Class)objc_opt_self());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v6 = objc_retainAutorelease(v4);
  if (SecRandomCopyBytes(v5, 0x20uLL, (void *)objc_msgSend(v6, "mutableBytes")))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v8 = -[_CDCloudFamilyDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](v0, v3, v7, 0, 0, 1);
  return v8;
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
    a1 = -[_CDCloudFamilyDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](v10, v14, v12, v5, v6, v13);

  }
  return a1;
}

- (uint64_t)isValidForCollectionDate:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 24);
      v6 = v4;
      v7 = objc_msgSend(v3, "compare:", v5) != -1;

    }
    else
    {
      v7 = 1;
    }
    v8 = *(id *)(a1 + 32);
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32));

      if (v10 == -1)
        v7 = 0;
    }
    if (*(_QWORD *)(a1 + 8) && *(_QWORD *)(a1 + 16))
    {
      if (*(_QWORD *)(a1 + 40))
        a1 = v7;
      else
        a1 = 0;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _CDCloudFamilyDataCollectionSession *v4;
  NSString *v5;
  NSData *v6;
  NSDate *v7;
  NSDate *v8;
  unint64_t batchNumber;
  _QWORD *v10;

  v4 = +[_CDCloudFamilyDataCollectionSession allocWithZone:](_CDCloudFamilyDataCollectionSession, "allocWithZone:", a3);
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
  v10 = -[_CDCloudFamilyDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](v4, v5, v6, v7, v8, batchNumber);

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

- (_CDCloudFamilyDataCollectionSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _CDCloudFamilyDataCollectionSession *v10;

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

  v10 = (_CDCloudFamilyDataCollectionSession *)-[_CDCloudFamilyDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](self, v5, v6, v7, v8, v9);
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
