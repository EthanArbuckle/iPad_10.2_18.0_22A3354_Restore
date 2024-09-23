@implementation ASDJob

- (ASDJob)init
{
  return -[ASDJob initWithPersistentID:](self, "initWithPersistentID:", 0x7FFFFFFFFFFFFFFFLL);
}

- (ASDJob)initWithPersistentID:(int64_t)a3
{
  ASDJob *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASDJob;
  result = -[ASDJob init](&v5, sel_init);
  if (result)
    result->_persistentID = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ASDJob;
  -[ASDJob description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %lld"), v4, self->_persistentID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  return self->_persistentID;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  int64_t v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = -[ASDJob persistentID](self, "persistentID");
    v6 = v7 == objc_msgSend(v4, "persistentID");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDJob *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSNumber *externalOrderKey;
  uint64_t v10;
  NSError *failureError;
  uint64_t v12;
  NSNumber *orderKey;

  v5 = -[ASDJob init](+[ASDJob allocWithZone:](ASDJob, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  v8 = -[NSNumber copyWithZone:](self->_externalOrderKey, "copyWithZone:", a3);
  externalOrderKey = v5->_externalOrderKey;
  v5->_externalOrderKey = (NSNumber *)v8;

  v10 = -[NSError copyWithZone:](self->_failureError, "copyWithZone:", a3);
  failureError = v5->_failureError;
  v5->_failureError = (NSError *)v10;

  v12 = -[NSNumber copyWithZone:](self->_orderKey, "copyWithZone:", a3);
  orderKey = v5->_orderKey;
  v5->_orderKey = (NSNumber *)v12;

  v5->_percentComplete = self->_percentComplete;
  v5->_persistentID = self->_persistentID;
  v5->_phase = self->_phase;
  v5->_purchaseID = self->_purchaseID;
  v5->_storeItemID = self->_storeItemID;
  v5->_type = self->_type;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJob)initWithCoder:(id)a3
{
  id v4;
  ASDJob *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSNumber *externalOrderKey;
  uint64_t v10;
  NSError *failureError;
  uint64_t v12;
  NSNumber *orderKey;
  double v14;

  v4 = a3;
  v5 = -[ASDJob init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalOrderKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    externalOrderKey = v5->_externalOrderKey;
    v5->_externalOrderKey = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("failureError"));
    v10 = objc_claimAutoreleasedReturnValue();
    failureError = v5->_failureError;
    v5->_failureError = (NSError *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orderKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    orderKey = v5->_orderKey;
    v5->_orderKey = (NSNumber *)v12;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentComplete"));
    v5->_percentComplete = v14;
    v5->_persistentID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("persistentID"));
    v5->_phase = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("phase"));
    v5->_purchaseID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("purchaseID"));
    v5->_storeItemID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("storeItemID"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *failureError;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_externalOrderKey, CFSTR("externalOrderKey"));
  failureError = self->_failureError;
  if (failureError)
  {
    ASDErrorWithSafeUserInfo(failureError);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("failureError"));

  }
  objc_msgSend(v6, "encodeObject:forKey:", self->_orderKey, CFSTR("orderKey"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("percentComplete"), self->_percentComplete);
  objc_msgSend(v6, "encodeInt64:forKey:", self->_persistentID, CFSTR("persistentID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_phase, CFSTR("phase"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_purchaseID, CFSTR("purchaseID"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_storeItemID, CFSTR("storeItemID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)externalOrderKey
{
  return self->_externalOrderKey;
}

- (void)setExternalOrderKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSError)failureError
{
  return self->_failureError;
}

- (void)setFailureError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)orderKey
{
  return self->_orderKey;
}

- (void)setOrderKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(int64_t)a3
{
  self->_persistentID = a3;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (int64_t)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(int64_t)a3
{
  self->_purchaseID = a3;
}

- (int64_t)storeItemID
{
  return self->_storeItemID;
}

- (void)setStoreItemID:(int64_t)a3
{
  self->_storeItemID = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderKey, 0);
  objc_storeStrong((id *)&self->_failureError, 0);
  objc_storeStrong((id *)&self->_externalOrderKey, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
