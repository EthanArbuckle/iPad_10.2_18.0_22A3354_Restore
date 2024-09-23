@implementation HMIdentifierSaltStore

- (NSData)identifierSalt
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_identifierSalt;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIdentifierSalt:(id)a3
{
  id v5;
  void *v6;
  HMIdentifierSaltStore *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock_with_options();
  if (-[NSData isEqualToData:](self->_identifierSalt, "isEqualToData:", v5))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_identifierSalt, a3);
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated identifier salt to %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (NSData)assistantIdentifierSalt
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_assistantIdentifierSalt;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAssistantIdentifierSalt:(id)a3
{
  NSData *v4;
  NSData *assistantIdentifierSalt;

  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  assistantIdentifierSalt = self->_assistantIdentifierSalt;
  self->_assistantIdentifierSalt = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantIdentifierSalt, 0);
  objc_storeStrong((id *)&self->_identifierSalt, 0);
}

@end
