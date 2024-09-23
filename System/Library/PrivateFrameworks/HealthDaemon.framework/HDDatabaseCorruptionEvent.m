@implementation HDDatabaseCorruptionEvent

- (HDDatabaseCorruptionEvent)initWithError:(id)a3 date:(id)a4 profileIdentifier:(id)a5 component:(int64_t)a6 build:(id)a7 failedObliterationReason:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HDDatabaseCorruptionEvent *v19;
  uint64_t v20;
  NSError *error;
  uint64_t v22;
  NSDate *date;
  uint64_t v24;
  HKProfileIdentifier *profileIdentifier;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HDDatabaseCorruptionEvent;
  v19 = -[HDDatabaseCorruptionEvent init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    error = v19->_error;
    v19->_error = (NSError *)v20;

    v22 = objc_msgSend(v15, "copy");
    date = v19->_date;
    v19->_date = (NSDate *)v22;

    v24 = objc_msgSend(v16, "copy");
    profileIdentifier = v19->_profileIdentifier;
    v19->_profileIdentifier = (HKProfileIdentifier *)v24;

    v19->_component = a6;
    objc_storeStrong((id *)&v19->_buildDescription, a7);
    objc_storeStrong((id *)&v19->_failedObliterationReason, a8);
  }

  return v19;
}

+ (id)createForProfile:(id)a3 component:(int64_t)a4 error:(id)a5 failedObliterationReason:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "profileIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "daemon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "behavior");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentOSBuild");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v13, "initWithError:date:profileIdentifier:component:build:failedObliterationReason:", v11, v14, v15, a4, v18, v10);

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *failedObliterationReason;
  id v9;

  v9 = a3;
  -[HDDatabaseCorruptionEvent profileIdentifier](self, "profileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("profile"));

  objc_msgSend(v9, "encodeInt:forKey:", -[HDDatabaseCorruptionEvent component](self, "component"), CFSTR("component"));
  -[HDDatabaseCorruptionEvent buildDescription](self, "buildDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("build"));

  -[HDDatabaseCorruptionEvent date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("date"));

  -[HDDatabaseCorruptionEvent error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("error"));

  failedObliterationReason = self->_failedObliterationReason;
  if (failedObliterationReason)
    objc_msgSend(v9, "encodeObject:forKey:", failedObliterationReason, CFSTR("obliteration_reason"));

}

- (HDDatabaseCorruptionEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HDDatabaseCorruptionEvent *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("component"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("obliteration_reason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HDDatabaseCorruptionEvent initWithError:date:profileIdentifier:component:build:failedObliterationReason:](self, "initWithError:date:profileIdentifier:component:build:failedObliterationReason:", v9, v8, v5, v6, v7, v10);
  return v11;
}

- (NSDate)date
{
  return self->_date;
}

- (NSError)error
{
  return self->_error;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (int64_t)component
{
  return self->_component;
}

- (NSString)buildDescription
{
  return self->_buildDescription;
}

- (NSString)failedObliterationReason
{
  return self->_failedObliterationReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedObliterationReason, 0);
  objc_storeStrong((id *)&self->_buildDescription, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
