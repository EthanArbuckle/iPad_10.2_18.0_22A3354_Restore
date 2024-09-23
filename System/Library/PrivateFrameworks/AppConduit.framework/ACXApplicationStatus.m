@implementation ACXApplicationStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t installStatus;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  installStatus = self->_installStatus;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", installStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("installStatus"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_lastInstallationError, CFSTR("lastInstallationError"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_uniqueInstallID, CFSTR("uniqueInstallID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_watchKitCompatibility, CFSTR("watchKitCompatibility"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_architectureCompatibility);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("architectureCompatibility"));

}

- (ACXApplicationStatus)initWithCoder:(id)a3
{
  id v4;
  ACXApplicationStatus *v5;
  void *v6;
  uint64_t v7;
  NSError *lastInstallationError;
  uint64_t v9;
  NSString *uniqueInstallID;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACXApplicationStatus;
  v5 = -[ACXApplicationStatus init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installStatus = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastInstallationError"));
    v7 = objc_claimAutoreleasedReturnValue();
    lastInstallationError = v5->_lastInstallationError;
    v5->_lastInstallationError = (NSError *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueInstallID"));
    v9 = objc_claimAutoreleasedReturnValue();
    uniqueInstallID = v5->_uniqueInstallID;
    v5->_uniqueInstallID = (NSString *)v9;

    v5->_watchKitCompatibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("watchKitCompatibility"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("architectureCompatibility"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_architectureCompatibility = objc_msgSend(v11, "unsignedIntegerValue");

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[1] = -[ACXApplicationStatus installStatus](self, "installStatus");
  -[ACXApplicationStatus lastInstallationError](self, "lastInstallationError");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[2];
  v4[2] = v5;

  -[ACXApplicationStatus uniqueInstallID](self, "uniqueInstallID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[3];
  v4[3] = v7;

  v4[4] = -[ACXApplicationStatus watchKitCompatibility](self, "watchKitCompatibility");
  v4[5] = -[ACXApplicationStatus architectureCompatibility](self, "architectureCompatibility");
  return v4;
}

- (void)setInstallStatusWithGizmoStatus:(unint64_t)a3
{
  uint64_t v3;

  if (a3 - 1 > 4)
    v3 = 0;
  else
    v3 = qword_1D4D3F730[a3 - 1];
  -[ACXApplicationStatus setInstallStatus:](self, "setInstallStatus:", v3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ACXApplicationStatus installStatus](self, "installStatus");
  -[ACXApplicationStatus lastInstallationError](self, "lastInstallationError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACXApplicationStatus uniqueInstallID](self, "uniqueInstallID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@<%p> installStatus=%lu lastError=%@ uniqueID=%@ wkCompatibility=%ld archCompatibility=%lu>"), v5, self, v6, v7, v8, -[ACXApplicationStatus watchKitCompatibility](self, "watchKitCompatibility"), -[ACXApplicationStatus architectureCompatibility](self, "architectureCompatibility"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)installStatus
{
  return self->_installStatus;
}

- (void)setInstallStatus:(unint64_t)a3
{
  self->_installStatus = a3;
}

- (NSError)lastInstallationError
{
  return self->_lastInstallationError;
}

- (void)setLastInstallationError:(id)a3
{
  objc_storeStrong((id *)&self->_lastInstallationError, a3);
}

- (NSString)uniqueInstallID
{
  return self->_uniqueInstallID;
}

- (void)setUniqueInstallID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)watchKitCompatibility
{
  return self->_watchKitCompatibility;
}

- (void)setWatchKitCompatibility:(int64_t)a3
{
  self->_watchKitCompatibility = a3;
}

- (unint64_t)architectureCompatibility
{
  return self->_architectureCompatibility;
}

- (void)setArchitectureCompatibility:(unint64_t)a3
{
  self->_architectureCompatibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueInstallID, 0);
  objc_storeStrong((id *)&self->_lastInstallationError, 0);
}

@end
