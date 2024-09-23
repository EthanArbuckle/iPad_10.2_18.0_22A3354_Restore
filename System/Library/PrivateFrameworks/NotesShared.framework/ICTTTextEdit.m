@implementation ICTTTextEdit

- (ICTTTextEdit)initWithTimestamp:(id)a3 replicaID:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  ICTTTextEdit *v12;
  ICTTTextEdit *v13;
  objc_super v15;

  length = a5.length;
  location = a5.location;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICTTTextEdit;
  v12 = -[ICTTTextEdit init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timestamp, a3);
    objc_storeStrong((id *)&v13->_replicaID, a4);
    v13->_range.location = location;
    v13->_range.length = length;
  }

  return v13;
}

- (ICTTTextEdit)initWithAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICTTTextEdit *v13;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", ICTTAttributeNameReplicaID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", ICTTAttributeNameTimestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    self = -[ICTTTextEdit initWithTimestamp:replicaID:range:](self, "initWithTimestamp:replicaID:range:", v12, v8, location, length);

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSRange v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEdit timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEdit replicaID](self, "replicaID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11.location = -[ICTTTextEdit range](self, "range");
  NSStringFromRange(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, timestamp: %@, replicaID: %@, range: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)descriptionWithNote:(id)a3
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
  const __CFString *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C95130];
  -[ICTTTextEdit replicaID](self, "replicaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIDForReplicaID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_participantNameOrFallbackForUserRecordName:note:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTTTextEdit timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3578];
    -[ICTTTextEdit timestamp](self, "timestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringFromDate:dateStyle:timeStyle:", v11, 1, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTTTextEdit replicaID](self, "replicaID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v4, "trustsTimestampsFromReplicaID:", v13);

    if ((_DWORD)v11)
      v14 = CFSTR("%@ edited at %@");
    else
      v14 = CFSTR("%@ edited at %@ (untrusted)");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v14, v8, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ edited"), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v21;

  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTTTextEdit timestamp](self, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v6)
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;
    if (v8 == v7)
      v11 = 0;
    else
      v11 = v7;
    v12 = v11;
    if (v10 | v12)
    {
      v13 = (void *)v12;
      if (v10)
        v14 = v12 == 0;
      else
        v14 = 1;
      if (v14)
        goto LABEL_22;
      v15 = objc_msgSend((id)v10, "isEqual:", v12);

      if (!v15)
      {
        v21 = 0;
        goto LABEL_24;
      }
    }
    objc_msgSend(v5, "replicaID");
    v10 = objc_claimAutoreleasedReturnValue();
    -[ICTTTextEdit replicaID](self, "replicaID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v10, "isEqual:", v13))
    {
      v16 = objc_msgSend(v5, "range");
      v18 = v17;
      v21 = v16 == -[ICTTTextEdit range](self, "range") && v18 == v19;
      goto LABEL_23;
    }
LABEL_22:
    v21 = 0;
LABEL_23:

LABEL_24:
    return v21;
  }
  return 1;
}

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = self->_hash;
  if (!result)
  {
    -[ICTTTextEdit timestamp](self, "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "hash");

    }
    -[ICTTTextEdit replicaID](self, "replicaID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hash");
    -[ICTTTextEdit range](self, "range");
    -[ICTTTextEdit range](self, "range");
    self->_hash = ICHashWithHashKeys(v5, v9, v10, v11, v12, v13, v14, v15, v8);

    return self->_hash;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICTTTextEdit *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  ICTTTextEdit *v9;

  v4 = +[ICTTTextEdit allocWithZone:](ICTTTextEdit, "allocWithZone:", a3);
  -[ICTTTextEdit timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEdit replicaID](self, "replicaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICTTTextEdit range](self, "range");
  v9 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v4, "initWithTimestamp:replicaID:range:", v5, v6, v7, v8);

  return v9;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSUUID)replicaID
{
  return self->_replicaID;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicaID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
