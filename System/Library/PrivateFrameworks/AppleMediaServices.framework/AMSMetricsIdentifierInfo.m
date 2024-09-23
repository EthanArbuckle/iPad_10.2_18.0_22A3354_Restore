@implementation AMSMetricsIdentifierInfo

- (id)syncStateFieldName
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;

  -[AMSMetricsIdentifierInfo name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(v2, "substringToIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uppercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByReplacingCharactersInRange:withString:", 0, 1, v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("xp%@SyncState"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  else
  {
    v6 = CFSTR("xpSyncState");
  }

  return v6;
}

- (void)populateDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;

  v9 = a3;
  -[AMSMetricsIdentifierInfo value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsIdentifierInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v5);

  if (-[AMSMetricsIdentifierInfo crossDeviceSync](self, "crossDeviceSync"))
  {
    -[AMSMetricsIdentifierInfo syncStateFieldName](self, "syncStateFieldName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsIdentifierInfo lastSync](self, "lastSync");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = CFSTR("synchronized");
    else
      v8 = CFSTR("unsynchronized");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  }
}

- (NSString)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setCrossDeviceSync:(BOOL)a3
{
  self->_crossDeviceSync = a3;
}

- (BOOL)crossDeviceSync
{
  return self->_crossDeviceSync;
}

- (NSDate)expires
{
  return self->_expires;
}

- (void)setStoreUUID:(id)a3
{
  objc_storeStrong((id *)&self->_storeUUID, a3);
}

- (void)setModified:(id)a3
{
  objc_storeStrong((id *)&self->_modified, a3);
}

- (void)setLastSync:(id)a3
{
  objc_storeStrong((id *)&self->_lastSync, a3);
}

- (void)setIdKey:(id)a3
{
  objc_storeStrong((id *)&self->_idKey, a3);
}

- (void)setExpires:(id)a3
{
  objc_storeStrong((id *)&self->_expires, a3);
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSDate)lastSync
{
  return self->_lastSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverProvidedAt, 0);
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_lastSync, 0);
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_storeUUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_idKey, 0);
}

- (id)description
{
  void *v3;
  NSString *value;
  NSString *storeUUID;
  NSDate *modified;
  NSDate *lastSync;
  NSDate *expires;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMSMetricsIdentifierInfo;
  -[AMSMetricsIdentifierInfo description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&self->_idKey;
  storeUUID = self->_storeUUID;
  value = self->_value;
  lastSync = self->_lastSync;
  modified = self->_modified;
  expires = self->_expires;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_crossDeviceSync);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (idKey: %@, name: %@, value: %@, storeUUID: %@, expires: %@, modified: %@, lastSync: %@, crossDeviceSync: %@, deleted: %@, serverProvidedAt: %@)"), v13, value, storeUUID, expires, modified, lastSync, v9, v10, self->_serverProvidedAt);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqualIgnoringLastSync:(id)a3
{
  AMSMetricsIdentifierInfo *v4;
  AMSMetricsIdentifierInfo *v5;
  _BOOL4 v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = (AMSMetricsIdentifierInfo *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  if (v4 == self)
  {
    v7 = 1;
    goto LABEL_26;
  }
  v6 = -[AMSMetricsIdentifierInfo crossDeviceSync](v4, "crossDeviceSync");
  if (v6 == -[AMSMetricsIdentifierInfo crossDeviceSync](self, "crossDeviceSync"))
  {
    v8 = (void *)objc_opt_class();
    -[AMSMetricsIdentifierInfo idKey](v5, "idKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsIdentifierInfo idKey](self, "idKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "bothStringsAreNilOr:equals:", v9, v10))
    {
      v11 = (void *)objc_opt_class();
      -[AMSMetricsIdentifierInfo name](v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMetricsIdentifierInfo name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "bothStringsAreNilOr:equals:", v12, v13))
      {
        v14 = (void *)objc_opt_class();
        -[AMSMetricsIdentifierInfo storeUUID](v5, "storeUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSMetricsIdentifierInfo storeUUID](self, "storeUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "bothStringsAreNilOr:equals:", v15, v16))
        {
          v17 = objc_opt_class();
          -[AMSMetricsIdentifierInfo value](v5, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSMetricsIdentifierInfo value](self, "value");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v17;
          v21 = (void *)v19;
          if (objc_msgSend(v20, "bothStringsAreNilOr:equals:", v18, v19))
          {
            v34 = v21;
            v35 = v18;
            v22 = (void *)objc_opt_class();
            -[AMSMetricsIdentifierInfo expires](v5, "expires");
            v23 = objc_claimAutoreleasedReturnValue();
            -[AMSMetricsIdentifierInfo expires](self, "expires");
            v36 = (void *)v23;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "bothDatesAreNilOr:equals:", v23)
              && (v24 = -[AMSMetricsIdentifierInfo deleted](v5, "deleted"),
                  v24 == -[AMSMetricsIdentifierInfo deleted](self, "deleted")))
            {
              v25 = (void *)objc_opt_class();
              -[AMSMetricsIdentifierInfo modified](v5, "modified");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[AMSMetricsIdentifierInfo modified](self, "modified");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v25, "bothDatesAreNilOr:equals:", v26))
              {
                v30 = (void *)objc_opt_class();
                -[AMSMetricsIdentifierInfo serverProvidedAt](v5, "serverProvidedAt");
                v31 = v26;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[AMSMetricsIdentifierInfo serverProvidedAt](self, "serverProvidedAt");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v7 = objc_msgSend(v30, "bothDatesAreNilOr:equals:", v27, v28);

                v26 = v31;
              }
              else
              {
                v7 = 0;
              }
              v18 = v35;

            }
            else
            {
              v7 = 0;
              v18 = v35;
            }
            v21 = v34;

          }
          else
          {
            v7 = 0;
          }

        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
LABEL_4:
    v7 = 0;
  }
LABEL_26:

  return v7;
}

+ (BOOL)bothStringsAreNilOr:(id)a3 equals:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4)
    return objc_msgSend(a3, "isEqualToString:", a4);
  else
    return 1;
}

+ (BOOL)bothDatesAreNilOr:(id)a3 equals:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4)
    return objc_msgSend(a3, "isEqualToDate:", a4);
  else
    return 1;
}

- (NSString)idKey
{
  return self->_idKey;
}

- (NSString)storeUUID
{
  return self->_storeUUID;
}

- (NSDate)modified
{
  return self->_modified;
}

- (NSDate)serverProvidedAt
{
  return self->_serverProvidedAt;
}

- (void)setServerProvidedAt:(id)a3
{
  objc_storeStrong((id *)&self->_serverProvidedAt, a3);
}

@end
