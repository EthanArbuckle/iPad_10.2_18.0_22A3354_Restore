@implementation CAMSubjectGroupResult

- (CAMSubjectGroupResult)initWithMetadataObjects:(id)a3 groupID:(int64_t)a4
{
  id v6;
  CAMSubjectGroupResult *v7;
  uint64_t v8;
  NSArray *metadataObjects;
  uint64_t v10;
  NSString *uniqueIdentifier;
  CAMSubjectGroupResult *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMSubjectGroupResult;
  v7 = -[CAMSubjectGroupResult init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    metadataObjects = v7->_metadataObjects;
    v7->_metadataObjects = (NSArray *)v8;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %ld"), CFSTR("CAMMetadataObjectTypeSubjectGroup"), a4);
    v10 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v10;

    v7->__groupID = a4;
    v12 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p type: %@ groupID: %ld>"), v5, self, CFSTR("CAMMetadataObjectTypeSubjectGroup"), -[CAMSubjectGroupResult _groupID](self, "_groupID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (AVMetadataObject)underlyingMetadataObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CAMSubjectGroupResult metadataObjects](self, "metadataObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingMetadataObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CAMSubjectGroupResult metadataObjects](self, "metadataObjects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "underlyingMetadataObject");
          v12 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v12;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return (AVMetadataObject *)v5;
}

- (NSString)metadataType
{
  return (NSString *)CFSTR("CAMMetadataObjectTypeSubjectGroup");
}

- (unint64_t)syntheticFocusMode
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CAMSubjectGroupResult metadataObjects](self, "metadataObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = objc_msgSend(v7, "syntheticFocusMode");
          if (v8)
          {
            v9 = v8;
            goto LABEL_12;
          }
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSArray)metadataObjects
{
  return self->_metadataObjects;
}

- (int64_t)_groupID
{
  return self->__groupID;
}

- (void)set_groupID:(int64_t)a3
{
  self->__groupID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataObjects, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
