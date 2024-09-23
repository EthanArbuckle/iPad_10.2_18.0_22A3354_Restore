@implementation HDReadAuthorizationStatus

- (NSSet)restrictedSourceEntities
{
  return self->_restrictedSourceEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectLimitAnchor, 0);
  objc_storeStrong((id *)&self->_deletedObjectBaselineAnchor, 0);
  objc_storeStrong((id *)&self->_restrictedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_restrictedSourceEntities, 0);
  objc_storeStrong((id *)&self->_authorizationRecord, 0);
}

- (HDReadAuthorizationStatus)initWithReadAuthorizationStatus:(int64_t)a3 authorizationRequest:(int64_t)a4 authorizationMode:(int64_t)a5 restrictedBundleIdentifier:(id)a6 restrictedSourceEntities:(id)a7 deletedObjectBaselineAnchor:(id)a8 objectLimitAnchor:(id)a9 objectLimitModifiedDate:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HDReadAuthorizationStatus *v22;
  uint64_t v23;
  _HKAuthorizationRecord *authorizationRecord;
  uint64_t v25;
  NSString *restrictedBundleIdentifier;
  uint64_t v27;
  NSSet *restrictedSourceEntities;
  uint64_t v29;
  NSNumber *deletedObjectBaselineAnchor;
  uint64_t v31;
  NSNumber *objectLimitAnchor;
  void *v34;
  objc_super v35;

  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (a5 == 1 && !v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDReadAuthorizationStatus.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectLimitAnchor != nil"));

  }
  v35.receiver = self;
  v35.super_class = (Class)HDReadAuthorizationStatus;
  v22 = -[HDReadAuthorizationStatus init](&v35, sel_init);
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB6F10], "recordWithStatus:request:mode:anchorLimitModifiedDate:", a3, a4, a5, v21);
    v23 = objc_claimAutoreleasedReturnValue();
    authorizationRecord = v22->_authorizationRecord;
    v22->_authorizationRecord = (_HKAuthorizationRecord *)v23;

    v25 = objc_msgSend(v17, "copy");
    restrictedBundleIdentifier = v22->_restrictedBundleIdentifier;
    v22->_restrictedBundleIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    restrictedSourceEntities = v22->_restrictedSourceEntities;
    v22->_restrictedSourceEntities = (NSSet *)v27;

    v29 = objc_msgSend(v19, "copy");
    deletedObjectBaselineAnchor = v22->_deletedObjectBaselineAnchor;
    v22->_deletedObjectBaselineAnchor = (NSNumber *)v29;

    v31 = objc_msgSend(v20, "copy");
    objectLimitAnchor = v22->_objectLimitAnchor;
    v22->_objectLimitAnchor = (NSNumber *)v31;

  }
  return v22;
}

+ (id)unrestrictedReadAuthorizationStatus
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithReadAuthorizationStatus:authorizationRequest:authorizationMode:restrictedBundleIdentifier:restrictedSourceEntities:deletedObjectBaselineAnchor:objectLimitAnchor:objectLimitModifiedDate:", 101, 203, 0, 0, 0, &unk_1E6DFE378, 0, 0);
}

+ (id)notDerminedReadAuthorizationStatus
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithReadAuthorizationStatus:authorizationRequest:authorizationMode:restrictedBundleIdentifier:restrictedSourceEntities:deletedObjectBaselineAnchor:objectLimitAnchor:objectLimitModifiedDate:", 100, 200, 0, &stru_1E6D11BB8, v3, &unk_1E6DFE378, 0, 0);

  return v4;
}

- (int64_t)authorizationStatus
{
  return -[_HKAuthorizationRecord status](self->_authorizationRecord, "status");
}

- (int64_t)authorizationRequest
{
  return -[_HKAuthorizationRecord request](self->_authorizationRecord, "request");
}

- (int64_t)authorizationMode
{
  return -[_HKAuthorizationRecord mode](self->_authorizationRecord, "mode");
}

- (NSDate)objectLimitModifiedDate
{
  return (NSDate *)-[_HKAuthorizationRecord anchorLimitModifiedDate](self->_authorizationRecord, "anchorLimitModifiedDate");
}

- (BOOL)canRead
{
  int64_t v2;

  v2 = -[HDReadAuthorizationStatus authorizationStatus](self, "authorizationStatus");
  return ((unint64_t)(v2 - 100) < 5) & (0xEu >> (v2 - 100));
}

- (BOOL)canWrite
{
  int64_t v2;

  v2 = -[HDReadAuthorizationStatus authorizationStatus](self, "authorizationStatus");
  return ((unint64_t)(v2 - 100) < 5) & (6u >> (v2 - 100));
}

- (void)disableReading
{
  _HKAuthorizationRecord *v3;
  _HKAuthorizationRecord *authorizationRecord;

  -[_HKAuthorizationRecord recordWithReadingDisabled](self->_authorizationRecord, "recordWithReadingDisabled");
  v3 = (_HKAuthorizationRecord *)objc_claimAutoreleasedReturnValue();
  authorizationRecord = self->_authorizationRecord;
  self->_authorizationRecord = v3;

}

- (void)disableSharing
{
  _HKAuthorizationRecord *v3;
  _HKAuthorizationRecord *authorizationRecord;

  -[_HKAuthorizationRecord recordWithSharingDisabled](self->_authorizationRecord, "recordWithSharingDisabled");
  v3 = (_HKAuthorizationRecord *)objc_claimAutoreleasedReturnValue();
  authorizationRecord = self->_authorizationRecord;
  self->_authorizationRecord = v3;

}

- (BOOL)isAuthorizationDetermined
{
  return -[HDReadAuthorizationStatus authorizationStatus](self, "authorizationStatus") != 100;
}

- (HDSQLitePredicate)authorizationPredicate
{
  void *v3;

  if (-[HDReadAuthorizationStatus canRead](self, "canRead"))
  {
    if (-[HDReadAuthorizationStatus authorizationMode](self, "authorizationMode") == 1)
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanOrEqualToValue:", CFSTR("data_id"), self->_objectLimitAnchor);
    else
      objc_msgSend(MEMORY[0x1E0D29890], "truePredicate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HDSQLitePredicate *)v3;
}

- (BOOL)isEqual:(id)a3
{
  HDReadAuthorizationStatus *v4;
  HDReadAuthorizationStatus *v5;
  NSString *restrictedBundleIdentifier;
  NSString *v7;
  NSSet *restrictedSourceEntities;
  NSSet *v9;
  NSNumber *deletedObjectBaselineAnchor;
  NSNumber *v11;
  NSNumber *objectLimitAnchor;
  NSNumber *v13;
  char v14;

  v4 = (HDReadAuthorizationStatus *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (!-[_HKAuthorizationRecord isEqual:](self->_authorizationRecord, "isEqual:", v5->_authorizationRecord))goto LABEL_18;
      restrictedBundleIdentifier = self->_restrictedBundleIdentifier;
      v7 = v5->_restrictedBundleIdentifier;
      if (restrictedBundleIdentifier != v7
        && (!v7 || !-[NSString isEqualToString:](restrictedBundleIdentifier, "isEqualToString:")))
      {
        goto LABEL_18;
      }
      restrictedSourceEntities = self->_restrictedSourceEntities;
      v9 = v5->_restrictedSourceEntities;
      if (restrictedSourceEntities != v9 && (!v9 || !-[NSSet isEqualToSet:](restrictedSourceEntities, "isEqualToSet:")))
        goto LABEL_18;
      deletedObjectBaselineAnchor = self->_deletedObjectBaselineAnchor;
      v11 = v5->_deletedObjectBaselineAnchor;
      if (deletedObjectBaselineAnchor != v11
        && (!v11 || !-[NSNumber isEqual:](deletedObjectBaselineAnchor, "isEqual:")))
      {
        goto LABEL_18;
      }
      objectLimitAnchor = self->_objectLimitAnchor;
      v13 = v5->_objectLimitAnchor;
      if (objectLimitAnchor == v13)
      {
        v14 = 1;
        goto LABEL_19;
      }
      if (v13)
        v14 = -[NSNumber isEqual:](objectLimitAnchor, "isEqual:");
      else
LABEL_18:
        v14 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v14 = 0;
  }
LABEL_20:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[_HKAuthorizationRecord hash](self->_authorizationRecord, "hash");
  return -[NSString hash](self->_restrictedBundleIdentifier, "hash") ^ v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSNumber *objectLimitAnchor;
  NSNumber *deletedObjectBaselineAnchor;
  __CFString *v8;
  NSSet *restrictedSourceEntities;
  void *v10;
  NSString *restrictedBundleIdentifier;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSNumber *v18;
  NSNumber *v19;
  uint64_t v20;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HDReadAuthorizationStatus authorizationStatus](self, "authorizationStatus");
  HKAuthorizationStatusToString();
  v20 = objc_claimAutoreleasedReturnValue();
  -[HDReadAuthorizationStatus authorizationMode](self, "authorizationMode");
  HKSelectedAuthorizationModeToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  deletedObjectBaselineAnchor = self->_deletedObjectBaselineAnchor;
  objectLimitAnchor = self->_objectLimitAnchor;
  if (objectLimitAnchor)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" object-limit:%@"), self->_objectLimitAnchor);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E6D11BB8;
  }
  restrictedSourceEntities = self->_restrictedSourceEntities;
  if (!restrictedSourceEntities)
  {
    v19 = deletedObjectBaselineAnchor;
    v15 = (void *)v20;
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ %@ deleted-object-baseline:%@%@%@>"), v4, v20, v5, v19, v8, &stru_1E6D11BB8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objectLimitAnchor)
      goto LABEL_7;
    goto LABEL_6;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  restrictedBundleIdentifier = self->_restrictedBundleIdentifier;
  -[NSSet allObjects](restrictedSourceEntities, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR(" RESTRICTED to %@ (%@)"), restrictedBundleIdentifier, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = deletedObjectBaselineAnchor;
  v15 = (void *)v20;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ %@ deleted-object-baseline:%@%@%@>"), v4, v20, v5, v18, v8, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objectLimitAnchor)
LABEL_6:

LABEL_7:
  return v16;
}

- (_HKAuthorizationRecord)authorizationRecord
{
  return self->_authorizationRecord;
}

- (NSString)restrictedBundleIdentifier
{
  return self->_restrictedBundleIdentifier;
}

- (NSNumber)deletedObjectBaselineAnchor
{
  return self->_deletedObjectBaselineAnchor;
}

- (NSNumber)objectLimitAnchor
{
  return self->_objectLimitAnchor;
}

@end
