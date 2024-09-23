@implementation ATAccountInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)ATAccountInfo;
  -[ATAccountInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@, %@, %@]"), v4, self->_appleID, self->_altDSID, self->_DSID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (void *)objc_opt_class();
  __Copy(self, (uint64_t)a3, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v5 = (void *)objc_opt_class();
  __Copy(self, (uint64_t)a3, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
