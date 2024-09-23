@implementation DCCredentialAuthACL

- (DCCredentialAuthACL)initWithData:(id)a3 type:(unint64_t)a4
{
  id v6;
  DCCredentialAuthACL *v7;
  DCCredentialAuthACL *v8;
  uint64_t v9;
  NSData *aclData;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DCCredentialAuthACL;
  v7 = -[DCCredentialAuthACL init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    v9 = objc_msgSend(v6, "copy");
    aclData = v8->_aclData;
    v8->_aclData = (NSData *)v9;

    v8->_aclType = a4;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeObject:forKey:", self->_aclData, 0x24C3077A8);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_aclType, 0x24C3077C8);

  os_unfair_lock_unlock(p_lock);
}

- (DCCredentialAuthACL)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  DCCredentialAuthACL *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3077A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", 0x24C3077C8);

  v7 = -[DCCredentialAuthACL initWithData:type:](self, "initWithData:type:", v5, v6);
  return v7;
}

- (NSData)aclData
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_aclData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAclData:(id)a3
{
  NSData *v4;
  NSData *aclData;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_aclData != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    aclData = self->_aclData;
    self->_aclData = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (unint64_t)aclType
{
  os_unfair_lock_s *p_lock;
  unint64_t aclType;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  aclType = self->_aclType;
  os_unfair_lock_unlock(p_lock);
  return aclType;
}

- (void)setAclType:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_aclType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aclData, 0);
}

@end
