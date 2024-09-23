@implementation HMDAccessoryBulletinRegistrationInfo

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBulletinRegistrationInfo accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDAccessoryBulletinRegistrationInfo serviceInstanceID](self, "serviceInstanceID");
  if (-[HMDAccessoryBulletinRegistrationInfo enabled](self, "enabled"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[HMDAccessoryBulletinRegistrationInfo predicate](self, "predicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: accessory=%@, service=%lld, enabled=%@, predicate=%@>"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setAccessoryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUUID, a3);
}

- (int64_t)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (void)setServiceInstanceID:(int64_t)a3
{
  self->_serviceInstanceID = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

@end
