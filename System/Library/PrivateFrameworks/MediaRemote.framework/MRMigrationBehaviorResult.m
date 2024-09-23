@implementation MRMigrationBehaviorResult

- (id)dictionaryRepresentation
{
  MRMigrationBehaviorResult *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MRMigrationBehaviorResult sourceUID](v2, "sourceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sourceUID"));

  -[MRMigrationBehaviorResult destinationUID](v2, "destinationUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("destinationUID"));

  v6 = -[MRMigrationBehaviorResult action](v2, "action") - 1;
  if (v6 > 2)
    v7 = CFSTR("None");
  else
    v7 = off_1E30CFD28[v6];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("action"));
  -[MRMigrationBehaviorResult reason](v2, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("reason"));

  -[MRMigrationBehaviorResult error](v2, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("error"));

  objc_sync_exit(v2);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MRMigrationBehaviorResult *v4;
  MRMigrationBehaviorResult *v5;
  NSString *sourceUID;
  NSString *v7;
  int v8;
  BOOL v9;
  NSString *destinationUID;
  NSString *v11;
  int v12;
  NSString *reason;
  NSString *v14;
  int v15;
  int64_t action;
  uint64_t v17;
  NSError *error;
  NSError *v19;
  char v20;

  v4 = (MRMigrationBehaviorResult *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      sourceUID = self->_sourceUID;
      -[MRMigrationBehaviorResult sourceUID](v5, "sourceUID");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (sourceUID == v7)
        v8 = 0;
      else
        v8 = -[NSString isEqual:](sourceUID, "isEqual:", v7) ^ 1;

      destinationUID = self->_destinationUID;
      -[MRMigrationBehaviorResult destinationUID](v5, "destinationUID");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (destinationUID == v11)
        v12 = 0;
      else
        v12 = -[NSString isEqual:](destinationUID, "isEqual:", v11) ^ 1;

      reason = self->_reason;
      -[MRMigrationBehaviorResult reason](v5, "reason");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (reason == v14)
        v15 = 0;
      else
        v15 = -[NSString isEqual:](reason, "isEqual:", v14) ^ 1;

      action = self->_action;
      v17 = -[MRMigrationBehaviorResult action](v5, "action");
      error = self->_error;
      -[MRMigrationBehaviorResult error](v5, "error");
      v19 = (NSError *)objc_claimAutoreleasedReturnValue();
      if (error == v19)
        v20 = 1;
      else
        v20 = -[NSError isEqual:](error, "isEqual:", v19);

      if (((v8 | v12 | v15) & 1) != 0)
      {
        v9 = 0;
      }
      else if (action == v17)
      {
        v9 = v20;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_sourceUID, "hash");
  v4 = -[NSString hash](self->_destinationUID, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_reason, "hash");
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRMigrationBehaviorResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return v6;
}

- (NSString)sourceUID
{
  return self->_sourceUID;
}

- (void)setSourceUID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceUID, a3);
}

- (NSString)destinationUID
{
  return self->_destinationUID;
}

- (void)setDestinationUID:(id)a3
{
  objc_storeStrong((id *)&self->_destinationUID, a3);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_destinationUID, 0);
  objc_storeStrong((id *)&self->_sourceUID, 0);
}

@end
