@implementation _MKFUserActivityStatus

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFUserActivityStatus"));
}

- (MKFUserActivityStatusDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFUserActivityStatusDatabaseID alloc], "initWithMKFObject:", self);
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_MKFUserActivityStatus;
  v5 = -[_MKFModel validateForInsertOrUpdate:](&v14, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    -[_MKFUserActivityStatus user](self, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      -[_MKFUserActivityStatus guest](self, "guest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        if (a3)
        {
          v11 = CFSTR("user or guest is required");
          goto LABEL_12;
        }
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    -[_MKFUserActivityStatus user](self, "user");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_MKFUserActivityStatus guest](self, "guest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (a3)
        {
          v11 = CFSTR("Both user and guest must not be set");
LABEL_12:
          objc_msgSend(MEMORY[0x24BDD1540], "hmd_validationErrorWithDescription:", v11);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          LOBYTE(v5) = 0;
          *a3 = v12;
          return v5;
        }
        goto LABEL_13;
      }
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_255825278;
}

@end
