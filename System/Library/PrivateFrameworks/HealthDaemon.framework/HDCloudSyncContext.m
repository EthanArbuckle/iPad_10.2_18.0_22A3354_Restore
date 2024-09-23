@implementation HDCloudSyncContext

- (HDCloudSyncContext)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)initForPurpose:(int64_t)a3 options:(unint64_t)a4 reason:(int64_t)a5 xpcActivity:(id)a6
{
  id v11;
  HDCloudSyncContext *v12;
  uint64_t v13;
  NSUUID *identifier;
  void *v15;
  uint64_t v16;
  NSString *shortIdentifier;
  objc_super v19;

  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HDCloudSyncContext;
  v12 = -[HDCloudSyncContext init](&v19, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    -[NSUUID UUIDString](v12->_identifier, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "substringToIndex:", 4);
    v16 = objc_claimAutoreleasedReturnValue();
    shortIdentifier = v12->_shortIdentifier;
    v12->_shortIdentifier = (NSString *)v16;

    v12->_purpose = a3;
    v12->_options = a4;
    v12->_reason = a5;
    objc_storeStrong((id *)&v12->_xpcActivity, a6);
  }

  return v12;
}

+ (id)contextForFastPush
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0CB6430]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 1, 0, 1);
  v4 = (void *)objc_msgSend(v2, "initWithChangesSyncRequest:", v3);

  v5 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, 128, 32, 0);
  objc_msgSend(v5, "setSyncRequest:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HDXPCActivity *xpcActivity;
  void *v8;
  NSString *shortIdentifier;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  HKCloudSyncOptionsToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncContext syncRequest](self, "syncRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Options: %@,\n Request: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  xpcActivity = self->_xpcActivity;
  v8 = (void *)MEMORY[0x1E0CB3940];
  shortIdentifier = self->_shortIdentifier;
  HKCloudSyncReasonToString();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (xpcActivity)
  {
    -[HDXPCActivity name](self->_xpcActivity, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@ %@ (%@) %@>"), shortIdentifier, v11, v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@ %@ (%@)>"), shortIdentifier, v10, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)subContextByAddingOptions:(unint64_t)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForPurpose:options:reason:xpcActivity:", self->_purpose, self->_options | a3, self->_reason, self->_xpcActivity);
  v5 = -[NSUUID copy](self->_identifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_shortIdentifier, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSDate copy](self->_unitTest_syncDateOverride, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[HKCloudSyncRequest copy](self->_syncRequest, "copy");
  v12 = (void *)v4[6];
  v4[6] = v11;

  return v4;
}

- (id)subContextByRemovingOptions:(unint64_t)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForPurpose:options:reason:xpcActivity:", self->_purpose, self->_options & ~a3, self->_reason, self->_xpcActivity);
  v5 = -[NSUUID copy](self->_identifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_shortIdentifier, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSDate copy](self->_unitTest_syncDateOverride, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[HKCloudSyncRequest copy](self->_syncRequest, "copy");
  v12 = (void *)v4[6];
  v4[6] = v11;

  return v4;
}

- (BOOL)isEquivalent:(id)a3
{
  char *v4;
  _QWORD *v5;
  char v6;
  HKCloudSyncRequest *syncRequest;

  v4 = (char *)a3;
  v5 = v4;
  if (*(_OWORD *)&self->_purpose == *(_OWORD *)(v4 + 24)
    && self->_reason == *((_QWORD *)v4 + 5)
    && self->_xpcActivity == (HDXPCActivity *)*((_QWORD *)v4 + 7))
  {
    syncRequest = self->_syncRequest;
    if (syncRequest)
      v6 = -[HKCloudSyncRequest isEquivalent:](syncRequest, "isEquivalent:", v5[6]);
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isFastPushOrPull
{
  return (self->_options & 0x1080) != 0;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)shortIdentifier
{
  return self->_shortIdentifier;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)reason
{
  return self->_reason;
}

- (HKCloudSyncRequest)syncRequest
{
  return self->_syncRequest;
}

- (void)setSyncRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HDXPCActivity)xpcActivity
{
  return self->_xpcActivity;
}

- (NSDate)unitTest_syncDateOverride
{
  return self->_unitTest_syncDateOverride;
}

- (void)setUnitTest_syncDateOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_syncDateOverride, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_syncRequest, 0);
  objc_storeStrong((id *)&self->_shortIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
