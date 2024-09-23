@implementation MKFResidentSyncMetadata

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MKFResidentSyncMetadata;
  v5 = -[HMDManagedObject validateForInsertOrUpdate:](&v15, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    -[MKFResidentSyncMetadata home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[MKFResidentSyncMetadata lastSyncToken](self, "lastSyncToken");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
LABEL_6:
        LOBYTE(v5) = 1;
        return v5;
      }
      v8 = (void *)v7;
      -[MKFResidentSyncMetadata lastSeenToken](self, "lastSeenToken");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        -[MKFResidentSyncMetadata lastSyncTimestamp](self, "lastSyncTimestamp");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          goto LABEL_6;
      }
      else
      {

      }
      if (a3)
      {
        v12 = CFSTR("lastSeenToken and lastSyncTimestamp are required if lastSyncToken is set");
        goto LABEL_12;
      }
    }
    else if (a3)
    {
      v12 = CFSTR("home is required");
LABEL_12:
      objc_msgSend(MEMORY[0x24BDD1540], "hmd_validationErrorWithDescription:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v13;
      return v5;
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("ResidentSyncMetadata"));
}

@end
