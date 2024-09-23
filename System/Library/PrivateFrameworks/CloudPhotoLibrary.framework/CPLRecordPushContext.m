@implementation CPLRecordPushContext

- (void)encodeWithCoder:(id)a3
{
  NSString *uploadIdentifier;
  id v5;

  uploadIdentifier = self->_uploadIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uploadIdentifier, CFSTR("u"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_flags, CFSTR("f"));

}

- (CPLRecordPushContext)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  CPLRecordPushContext *v9;

  v4 = initWithCoder__onceToken_4593;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&initWithCoder__onceToken_4593, &__block_literal_global_4594);
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", initWithCoder___NSStringClass, CFSTR("u"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("f"));
  v8 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("p"));

  v9 = -[CPLRecordPushContext initWithUploadIdentifier:flags:priority:](self, "initWithUploadIdentifier:flags:priority:", v6, v7, v8);
  return v9;
}

- (CPLRecordPushContext)initWithUploadIdentifier:(id)a3 flags:(int64_t)a4 priority:(unint64_t)a5
{
  id v8;
  CPLRecordPushContext *v9;
  uint64_t v10;
  NSString *uploadIdentifier;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLRecordPushContext;
  v9 = -[CPLRecordPushContext init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    uploadIdentifier = v9->_uploadIdentifier;
    v9->_uploadIdentifier = (NSString *)v10;

    v9->_flags = a4;
    v9->_priority = a5;
  }

  return v9;
}

- (id)copyContextWithUploadIdentifier:(id)a3
{
  id v4;
  CPLRecordPushContext *v5;

  v4 = a3;
  v5 = -[CPLRecordPushContext initWithUploadIdentifier:flags:priority:]([CPLRecordPushContext alloc], "initWithUploadIdentifier:flags:priority:", v4, self->_flags, self->_priority);

  return v5;
}

- (id)copyContextWithPriority:(unint64_t)a3
{
  return -[CPLRecordPushContext initWithUploadIdentifier:flags:priority:]([CPLRecordPushContext alloc], "initWithUploadIdentifier:flags:priority:", self->_uploadIdentifier, self->_flags, a3);
}

- (id)pushContextAddingUploadIdentifier
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CPLRecordPushContext copyContextWithUploadIdentifier:](self, "copyContextWithUploadIdentifier:", v4);

  return v5;
}

- (id)pushContextMergingFlags:(int64_t)a3 changeType:(unint64_t)a4 uploadIdentifier:(id)a5 priority:(unint64_t)a6
{
  unint64_t v10;
  int64_t v11;
  NSString *uploadIdentifier;
  CPLRecordPushContext *v13;
  CPLRecordPushContext *v14;

  v10 = (unint64_t)a5;
  v11 = +[CPLRecordPushContext mergingFlags:previousFlags:changeType:](CPLRecordPushContext, "mergingFlags:previousFlags:changeType:", self->_flags, a3, a4);
  if (v11 != self->_flags)
    goto LABEL_5;
  uploadIdentifier = self->_uploadIdentifier;
  if (!v10 || !uploadIdentifier)
  {
    if (v10 | (unint64_t)uploadIdentifier)
      goto LABEL_5;
LABEL_7:
    v13 = self;
    goto LABEL_8;
  }
  if ((objc_msgSend((id)v10, "isEqual:") & 1) != 0)
    goto LABEL_7;
LABEL_5:
  v13 = -[CPLRecordPushContext initWithUploadIdentifier:flags:priority:]([CPLRecordPushContext alloc], "initWithUploadIdentifier:flags:priority:", v10, v11, a6);
LABEL_8:
  v14 = v13;

  return v14;
}

- (NSString)uploadIdentifier
{
  return self->_uploadIdentifier;
}

- (int64_t)flags
{
  return self->_flags;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadIdentifier, 0);
}

uint64_t __38__CPLRecordPushContext_initWithCoder___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  initWithCoder___NSStringClass = result;
  return result;
}

+ (id)newEmptyPushContext
{
  return -[CPLRecordPushContext initWithUploadIdentifier:flags:priority:]([CPLRecordPushContext alloc], "initWithUploadIdentifier:flags:priority:", 0, 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)pushContextsFromStoredUploadIdentifiers:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  +[CPLScopedIdentifier scopedIdentifiersFromDictionaryOfUnknownIdentifiers:](CPLScopedIdentifier, "scopedIdentifiersFromDictionaryOfUnknownIdentifiers:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__CPLRecordPushContext_pushContextsFromStoredUploadIdentifiers___block_invoke;
    v8[3] = &unk_1E60D8248;
    v9 = v4;
    v5 = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v6;
}

+ (id)pushContextsFromStoredUploadIdentifiersInCoder:(id)a3 key:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = pushContextsFromStoredUploadIdentifiersInCoder_key__onceToken;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&pushContextsFromStoredUploadIdentifiersInCoder_key__onceToken, &__block_literal_global_11);
  objc_msgSend(v7, "decodeObjectOfClasses:forKey:", pushContextsFromStoredUploadIdentifiersInCoder_key__uploadIdentifiersClasses, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CPLRecordPushContext pushContextsFromStoredUploadIdentifiers:](CPLRecordPushContext, "pushContextsFromStoredUploadIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)newPushContextForChange:(id)a3 overStoredRecord:(id)a4 initialUpload:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  CPLRecordPushContext *v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isAssetChange") && objc_msgSend(v6, "hasChangeType:", 64))
  {
    objc_msgSend(v6, "sharingScopeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v7, "sharingScopeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8)
      {
        if (v9 && (objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
        {

          v11 = 0;
        }
        else
        {

          v11 = 1;
        }
      }
      else
      {
        v14 = v9 != 0;

        v11 = 2 * v14;
      }
    }
    else
    {
      objc_msgSend(v6, "sharingScopeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v13 != 0;
    }
    objc_msgSend(v6, "updateSharingContributorUserIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
      v12 = v11 | 4;
    else
      v12 = v11;

  }
  else
  {
    v12 = 0;
  }
  v17 = -[CPLRecordPushContext initWithUploadIdentifier:flags:priority:]([CPLRecordPushContext alloc], "initWithUploadIdentifier:flags:priority:", 0, v12, 0);

  return v17;
}

+ (int64_t)mergingFlags:(int64_t)a3 previousFlags:(int64_t)a4 changeType:(unint64_t)a5
{
  int64_t result;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;

  result = a3;
  if (a5 != 1024 && (!a5 || (a5 & 0x40) != 0))
  {
    v6 = a4 & 3 | a3;
    v7 = a3 & 0xFFFFFFFFFFFFFFFDLL;
    if ((a4 & 1) == 0)
      v7 = a3;
    if ((a3 & 2) != 0)
      v6 = v7;
    v8 = a3 & 0xFFFFFFFFFFFFFFFELL;
    if ((a4 & 2) == 0)
      v8 = a3;
    if ((a3 & 1) != 0)
      v6 = v8;
    return v6 | a4 & 4;
  }
  return result;
}

+ (unint64_t)minimumPriorityForLocalConflictResolution
{
  unint64_t v2;
  void *v3;
  void *v4;

  v2 = overriddenMinimumPriorityForLocalConflictResolution;
  if (overriddenMinimumPriorityForLocalConflictResolution == -1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("CPLMinimumPriorityForLocalConflictResolution"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v2 = objc_msgSend(v4, "unsignedIntegerValue");
    else
      v2 = 1000;

  }
  return v2;
}

+ (void)setMinimumPriorityForLocalConflictResolution:(unint64_t)a3
{
  overriddenMinimumPriorityForLocalConflictResolution = a3;
}

void __75__CPLRecordPushContext_pushContextsFromStoredUploadIdentifiersInCoder_key___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)pushContextsFromStoredUploadIdentifiersInCoder_key__uploadIdentifiersClasses;
  pushContextsFromStoredUploadIdentifiersInCoder_key__uploadIdentifiersClasses = v3;

}

void __64__CPLRecordPushContext_pushContextsFromStoredUploadIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CPLRecordPushContext *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[CPLRecordPushContext initWithUploadIdentifier:flags:priority:]([CPLRecordPushContext alloc], "initWithUploadIdentifier:flags:priority:", v5, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

@end
