@implementation NTKFaceSupportUnlockAttemptEvent

- (NTKFaceSupportUnlockAttemptEvent)initWithLength:(double)a3 status:(unint64_t)a4 method:(unint64_t)a5 bundleIdentifier:(id)a6 unlockErrorCode:(int64_t)a7
{
  id v12;
  void *v13;
  NTKFaceSupportUnlockAttemptEvent *v14;
  uint64_t v15;
  NTKFaceSupportUnlockAttemptEvent *v16;
  NTKFaceSupportUnlockAttemptEvent *v17;
  uint64_t v18;
  NSString *bundleIdentifier;
  objc_super v21;

  v12 = a6;
  v13 = v12;
  if (a3 > 0.0)
  {
    v15 = objc_msgSend(v12, "length");
    v14 = 0;
    if (a5 - 5 >= 0xFFFFFFFFFFFFFFFCLL && a4 - 5 >= 0xFFFFFFFFFFFFFFFCLL && v15)
    {
      v21.receiver = self;
      v21.super_class = (Class)NTKFaceSupportUnlockAttemptEvent;
      v16 = -[NTKFaceSupportUnlockAttemptEvent init](&v21, sel_init);
      v17 = v16;
      if (v16)
      {
        v16->_length = a3;
        v16->_status = a4;
        v16->_method = a5;
        v18 = objc_msgSend(v13, "copy");
        bundleIdentifier = v17->_bundleIdentifier;
        v17->_bundleIdentifier = (NSString *)v18;

        v17->_unlockErrorCode = a7;
      }
      self = v17;
      v14 = self;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)ntkfs_analyticsEventName
{
  return (NSString *)CFSTR("com.apple.nanotimekit.facesupport.unlock_attempt");
}

- (NSDictionary)ntkfs_analyticsJSONRepresentation
{
  double v3;
  double v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  -[NTKFaceSupportUnlockAttemptEvent length](self, "length");
  v4 = v3;
  v5 = -[NTKFaceSupportUnlockAttemptEvent status](self, "status");
  v6 = -[NTKFaceSupportUnlockAttemptEvent unlockErrorCode](self, "unlockErrorCode");
  v7 = -[NTKFaceSupportUnlockAttemptEvent method](self, "method");
  -[NTKFaceSupportUnlockAttemptEvent bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("length");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v15[1] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  v15[2] = CFSTR("unlock_error_code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  v15[3] = CFSTR("method");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = CFSTR("bundle_identifier");
  v16[3] = v12;
  v16[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v13;
}

- (double)length
{
  return self->_length;
}

- (unint64_t)status
{
  return self->_status;
}

- (unint64_t)method
{
  return self->_method;
}

- (int64_t)unlockErrorCode
{
  return self->_unlockErrorCode;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
