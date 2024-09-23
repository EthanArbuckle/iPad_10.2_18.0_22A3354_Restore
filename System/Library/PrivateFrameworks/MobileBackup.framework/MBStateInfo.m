@implementation MBStateInfo

- (MBStateInfo)initWithState:(int)a3 progress:(float)a4 estimatedTimeRemaining:(unint64_t)a5 error:(id)a6 errors:(id)a7
{
  return -[MBStateInfo initWithState:progress:estimatedTimeRemaining:isCloud:isBackground:error:errors:backupAttemptCount:](self, "initWithState:progress:estimatedTimeRemaining:isCloud:isBackground:error:errors:backupAttemptCount:", *(_QWORD *)&a3, a5, 1, 0, a6, a7, 0);
}

- (MBStateInfo)initWithState:(int)a3 progress:(float)a4 estimatedTimeRemaining:(unint64_t)a5 isCloud:(BOOL)a6 isBackground:(BOOL)a7 error:(id)a8 errors:(id)a9 backupAttemptCount:(unint64_t)a10
{
  id v18;
  id v19;
  MBStateInfo *v20;
  MBStateInfo *v21;
  uint64_t v22;
  NSDate *date;
  uint64_t v24;
  NSMutableArray *errors;
  uint64_t v26;
  NSMutableArray *v27;
  objc_super v29;

  v18 = a8;
  v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)MBStateInfo;
  v20 = -[MBStateInfo init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_state = a3;
    v20->_progress = a4;
    v20->_estimatedTimeRemaining = a5;
    v20->_isCloud = a6;
    v20->_isBackground = a7;
    objc_storeStrong((id *)&v20->_error, a8);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = objc_claimAutoreleasedReturnValue();
    date = v21->_date;
    v21->_date = (NSDate *)v22;

    if (v19)
    {
      v24 = objc_msgSend(v19, "mutableCopy");
      errors = v21->_errors;
      v21->_errors = (NSMutableArray *)v24;

    }
    else
    {
      v26 = objc_opt_new();
      v27 = v21->_errors;
      v21->_errors = (NSMutableArray *)v26;

      if (v18)
        -[NSMutableArray addObject:](v21->_errors, "addObject:", v18);
    }
    v21->_backupAttemptCount = a10;
  }

  return v21;
}

- (MBStateInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  MBStateInfo *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSError *error;
  uint64_t v15;
  NSMutableArray *errors;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  NSDate *v26;
  NSDate *date;
  uint64_t v28;
  NSNumber *restoredSnapshotBackupPolicy;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MBStateInfo;
  v5 = -[MBStateInfo init](&v36, sel_init);
  if (!v5)
    goto LABEL_26;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_state = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("progress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v5->_progress = v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("estimatedTimeRemaining"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_estimatedTimeRemaining = objc_msgSend(v9, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCloud"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_isCloud = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isBackground"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_isBackground = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[MBError errorWithDictionaryRepresentation:](MBError, "errorWithDictionaryRepresentation:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      error = v5->_error;
      v5->_error = (NSError *)v13;

      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
LABEL_8:
  v15 = objc_opt_new();
  errors = v5->_errors;
  v5->_errors = (NSMutableArray *)v15;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errors"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v18);
            +[MBError errorWithDictionaryRepresentation:](MBError, "errorWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), (_QWORD)v32);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              -[NSMutableArray addObject:](v5->_errors, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v20);
      }

    }
  }
  else if (v5->_error)
  {
    -[NSMutableArray addObject:](v5->_errors, "addObject:");
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"), (_QWORD)v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  date = v5->_date;
  v5->_date = v26;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("restoredSnapshotBackupPolicy"));
  v28 = objc_claimAutoreleasedReturnValue();
  restoredSnapshotBackupPolicy = v5->_restoredSnapshotBackupPolicy;
  v5->_restoredSnapshotBackupPolicy = (NSNumber *)v28;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backupAttemptCount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_backupAttemptCount = objc_msgSend(v30, "integerValue");

LABEL_26:
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBStateInfo)initWithCoder:(id)a3
{
  id v4;
  MBStateInfo *v5;
  float v6;
  uint64_t v7;
  NSError *error;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *errors;
  uint64_t v18;
  NSDate *date;
  uint64_t v20;
  NSNumber *restoredSnapshotBackupPolicy;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MBStateInfo;
  v5 = -[MBStateInfo init](&v23, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("progress"));
    v5->_progress = v6;
    v5->_estimatedTimeRemaining = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("estimatedTimeRemaining"));
    v5->_isCloud = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCloud"));
    v5->_isBackground = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBackground"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v7 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("errors"));
    v16 = objc_claimAutoreleasedReturnValue();
    errors = v5->_errors;
    v5->_errors = (NSMutableArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v18 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restoredSnapshotBackupPolicy"));
    v20 = objc_claimAutoreleasedReturnValue();
    restoredSnapshotBackupPolicy = v5->_restoredSnapshotBackupPolicy;
    v5->_restoredSnapshotBackupPolicy = (NSNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state;
  double v5;
  id v6;

  state = self->_state;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", state, CFSTR("state"));
  *(float *)&v5 = self->_progress;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("progress"), v5);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_estimatedTimeRemaining, CFSTR("estimatedTimeRemaining"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isCloud, CFSTR("isCloud"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isBackground, CFSTR("isBackground"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_errors, CFSTR("errors"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_restoredSnapshotBackupPolicy, CFSTR("restoredSnapshotBackupPolicy"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  MBStateInfo *v4;
  double v5;
  id *v6;

  v4 = [MBStateInfo alloc];
  *(float *)&v5 = self->_progress;
  v6 = -[MBStateInfo initWithState:progress:estimatedTimeRemaining:isCloud:isBackground:error:errors:backupAttemptCount:](v4, "initWithState:progress:estimatedTimeRemaining:isCloud:isBackground:error:errors:backupAttemptCount:", self->_state, self->_estimatedTimeRemaining, self->_isCloud, self->_isBackground, self->_error, self->_errors, v5, self->_backupAttemptCount);
  objc_storeStrong(v6 + 6, self->_date);
  return v6;
}

- (void)setError:(id)a3
{
  NSError *v4;
  BOOL v5;
  NSError *v6;
  NSError *error;
  unint64_t v8;
  NSError *v9;

  v4 = (NSError *)a3;
  if (self->_error != v4)
  {
    v9 = v4;
    v5 = +[MBError isError:withCode:](MBError, "isError:withCode:", v4, 0);
    v6 = 0;
    if (!v5)
      v6 = v9;
    error = self->_error;
    self->_error = v6;

    v4 = v9;
    if (v9)
    {
      -[NSMutableArray addObject:](self->_errors, "addObject:", v9);
      v8 = -[NSMutableArray count](self->_errors, "count");
      v4 = v9;
      if (v8 >= 0xB)
      {
        -[NSMutableArray removeObjectAtIndex:](self->_errors, "removeObjectAtIndex:", 0);
        v4 = v9;
      }
    }
  }

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSNumber *restoredSnapshotBackupPolicy;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("state"));

  *(float *)&v5 = self->_progress;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("progress"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_estimatedTimeRemaining);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("estimatedTimeRemaining"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCloud);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("isCloud"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBackground);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("isBackground"));

  if (self->_error)
  {
    +[MBError dictionaryRepresentationForError:](MBError, "dictionaryRepresentationForError:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("error"));

  }
  if (self->_errors)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = self->_errors;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          +[MBError dictionaryRepresentationForError:](MBError, "dictionaryRepresentationForError:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16), (_QWORD)v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("errors"));
  }
  objc_msgSend(v3, "setValue:forKey:", self->_date, CFSTR("date"), (_QWORD)v21);
  restoredSnapshotBackupPolicy = self->_restoredSnapshotBackupPolicy;
  if (restoredSnapshotBackupPolicy)
    objc_msgSend(v3, "setValue:forKey:", restoredSnapshotBackupPolicy, CFSTR("restoredSnapshotBackupPolicy"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_backupAttemptCount);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("backupAttemptCount"));

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; state=%d, progress=%.3f, timeRemaining=%lu, isCloud=%d, isBackground=%d, date=\"%@\", error=\"%@\">"),
    v5,
    self,
    self->_state,
    self->_progress,
    self->_estimatedTimeRemaining,
    self->_isCloud,
    self->_isBackground,
    self->_date,
    self->_error);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)isCloud
{
  return self->_isCloud;
}

- (void)setIsCloud:(BOOL)a3
{
  self->_isCloud = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (unint64_t)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(unint64_t)a3
{
  self->_estimatedTimeRemaining = a3;
}

- (NSError)error
{
  return self->_error;
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_storeStrong((id *)&self->_errors, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unint64_t)backupAttemptCount
{
  return self->_backupAttemptCount;
}

- (void)setBackupAttemptCount:(unint64_t)a3
{
  self->_backupAttemptCount = a3;
}

- (BOOL)isBackground
{
  return self->_isBackground;
}

- (void)setIsBackground:(BOOL)a3
{
  self->_isBackground = a3;
}

- (NSNumber)restoredSnapshotBackupPolicy
{
  return self->_restoredSnapshotBackupPolicy;
}

- (void)setRestoredSnapshotBackupPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_restoredSnapshotBackupPolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoredSnapshotBackupPolicy, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
