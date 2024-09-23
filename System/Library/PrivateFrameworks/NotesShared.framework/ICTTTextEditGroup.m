@implementation ICTTTextEditGroup

- (ICTTTextEditGroup)initWithEdits:(id)a3 latestTimestamp:(id)a4 userID:(id)a5 range:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  id v14;
  ICTTTextEditGroup *v15;
  ICTTTextEditGroup *v16;
  objc_super v18;

  length = a6.length;
  location = a6.location;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ICTTTextEditGroup;
  v15 = -[ICTTTextEditGroup init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_edits, a3);
    objc_storeStrong((id *)&v16->_latestTimestamp, a4);
    objc_storeStrong((id *)&v16->_userID, a5);
    v16->_range.location = location;
    v16->_range.length = length;
  }

  return v16;
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
  void *v10;
  NSRange v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditGroup edits](self, "edits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditGroup latestTimestamp](self, "latestTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditGroup userID](self, "userID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.location = -[ICTTTextEditGroup range](self, "range");
  NSStringFromRange(v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, edits: %@, latestTimestamp: %@, userID: %@, range: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  BOOL v16;
  int v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v28;
  int v30;

  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "edits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTTextEditGroup edits](self, "edits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", v7))
    {
      v28 = 0;
LABEL_37:

      return v28;
    }
    -[ICTTTextEditGroup latestTimestamp](self, "latestTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "latestTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v8)
      v11 = 0;
    else
      v11 = v8;
    v12 = v11;
    if (v10 == v9)
      v13 = 0;
    else
      v13 = v9;
    v14 = v13;
    if (v12 | v14)
    {
      v15 = (void *)v14;
      if (v12)
        v16 = v14 == 0;
      else
        v16 = 1;
      if (v16)
        goto LABEL_34;
      v17 = objc_msgSend((id)v12, "isEqual:", v14);

      if (!v17)
      {
        v28 = 0;
        goto LABEL_36;
      }
    }
    -[ICTTTextEditGroup userID](self, "userID");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == (void *)v12)
      v18 = 0;
    else
      v18 = (void *)v12;
    v19 = v18;
    if (v10 == v15)
      v20 = 0;
    else
      v20 = v15;
    v21 = v20;
    if (!(v19 | v21))
      goto LABEL_25;
    v22 = (void *)v21;
    if (v19 && v21)
    {
      v30 = objc_msgSend((id)v19, "isEqual:", v21);

      if (v30)
      {
LABEL_25:
        v23 = objc_msgSend(v5, "range");
        v25 = v24;
        v28 = v23 == -[ICTTTextEditGroup range](self, "range") && v25 == v26;
        goto LABEL_35;
      }
    }
    else
    {

    }
LABEL_34:
    v28 = 0;
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  return 1;
}

- (unint64_t)hash
{
  unint64_t result;
  id v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  result = self->_hash;
  if (!result)
  {
    -[ICTTTextEditGroup edits](self, "edits");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hash");

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v7 = ICHashWithObject(*(void **)(*((_QWORD *)&v23 + 1) + 8 * i)) - v7 + 32 * v7;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    -[ICTTTextEditGroup latestTimestamp](self, "latestTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hash");
    -[ICTTTextEditGroup userID](self, "userID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hash");
    -[ICTTTextEditGroup range](self, "range");
    -[ICTTTextEditGroup range](self, "range");
    self->_hash = ICHashWithHashKeys(v7, v16, v17, v18, v19, v20, v21, v22, v14);

    return self->_hash;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICTTTextEditGroup *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  ICTTTextEditGroup *v12;

  v4 = +[ICTTTextEditGroup allocWithZone:](ICTTTextEditGroup, "allocWithZone:", a3);
  v5 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[ICTTTextEditGroup edits](self, "edits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);
  -[ICTTTextEditGroup latestTimestamp](self, "latestTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditGroup userID](self, "userID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICTTTextEditGroup range](self, "range");
  v12 = -[ICTTTextEditGroup initWithEdits:latestTimestamp:userID:range:](v4, "initWithEdits:latestTimestamp:userID:range:", v7, v8, v9, v10, v11);

  return v12;
}

- (NSArray)edits
{
  return self->_edits;
}

- (NSDate)latestTimestamp
{
  return self->_latestTimestamp;
}

- (NSString)userID
{
  return self->_userID;
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
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_latestTimestamp, 0);
  objc_storeStrong((id *)&self->_edits, 0);
}

@end
