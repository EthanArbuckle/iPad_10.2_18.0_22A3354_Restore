@implementation NTKFaceSupportPartialUnlockAttemptEvent

- (NTKFaceSupportPartialUnlockAttemptEvent)initWithIdentifier:(id)a3 method:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NTKFaceSupportPartialUnlockAttemptEvent *v8;
  NTKFaceSupportPartialUnlockAttemptEvent *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSDate *creationDate;
  objc_super v15;

  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  v8 = 0;
  if (a4 != 999999 && v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKFaceSupportPartialUnlockAttemptEvent;
    v9 = -[NTKFaceSupportPartialUnlockAttemptEvent init](&v15, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(v6, "copy");
      identifier = v9->_identifier;
      v9->_identifier = (NSString *)v10;

      v9->_method = a4;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = objc_claimAutoreleasedReturnValue();
      creationDate = v9->_creationDate;
      v9->_creationDate = (NSDate *)v12;

    }
    self = v9;
    v8 = self;
  }

  return v8;
}

- (id)unlockAttemptWithStatus:(unint64_t)a3 errorCode:(int64_t)a4
{
  NTKFaceSupportUnlockAttemptEvent *v4;
  void *v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;

  if (a3 == 888888)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSupportPartialUnlockAttemptEvent creationDate](self, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;

    v12 = -[NTKFaceSupportPartialUnlockAttemptEvent method](self, "method");
    -[NTKFaceSupportPartialUnlockAttemptEvent identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[NTKFaceSupportUnlockAttemptEvent initWithLength:status:method:bundleIdentifier:unlockErrorCode:]([NTKFaceSupportUnlockAttemptEvent alloc], "initWithLength:status:method:bundleIdentifier:unlockErrorCode:", a3, v12, v13, a4, v11);

  }
  return v4;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)method
{
  return self->_method;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
