@implementation HMMRTCSessionManager

- (void)setSessionFactory:(id)a3
{
  HMMRTCSessionFactory *v4;
  HMMRTCSessionFactory *sessionFactory;

  v4 = (HMMRTCSessionFactory *)a3;
  os_unfair_lock_lock_with_options();
  sessionFactory = self->_sessionFactory;
  self->_sessionFactory = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)sessionWithUUID:(id)a3 serviceName:(id)a4 uploadImmediately:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  HMMRTCSessionFactory *sessionFactory;
  HMMRTCSessionFactory *v12;
  HMMRTCSessionFactory *v13;
  NSDictionary *v14;
  HMMRTCSessionFactory *v15;
  void *v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  sessionFactory = self->_sessionFactory;
  if (!sessionFactory)
  {
    v12 = objc_alloc_init(HMMRTCSessionFactory);
    v13 = self->_sessionFactory;
    self->_sessionFactory = v12;

    sessionFactory = self->_sessionFactory;
  }
  v14 = self->_commonFields;
  v15 = sessionFactory;
  os_unfair_lock_unlock(p_lock);
  -[HMMRTCSessionFactory sessionWithUUID:serviceName:uploadImmediately:commonFields:](v15, "sessionWithUUID:serviceName:uploadImmediately:commonFields:", v8, v9, v5, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)addCommonField:(id)a3 withValue:(id)a4
{
  id v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *commonFields;
  id v10;

  v10 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  if (self->_commonFields)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v10);
  v8 = (NSDictionary *)objc_msgSend(v7, "copy");
  commonFields = self->_commonFields;
  self->_commonFields = v8;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeCommonField:(id)a3
{
  void *v4;
  NSDictionary *v5;
  NSDictionary *commonFields;
  id v7;

  v7 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_commonFields);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v7);
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");
  commonFields = self->_commonFields;
  self->_commonFields = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)submitEventWithName:(id)a3 serviceName:(id)a4 uploadImmediately:(BOOL)a5 payload:(id)a6
{
  _BOOL8 v6;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v6 = a5;
  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMRTCSessionManager sessionWithUUID:serviceName:uploadImmediately:](self, "sessionWithUUID:serviceName:uploadImmediately:", v14, v12, v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "submitEventWithName:payload:", v13, v11);
}

- (void)submitEventWithName:(id)a3 serviceName:(id)a4 payload:(id)a5
{
  -[HMMRTCSessionManager submitEventWithName:serviceName:uploadImmediately:payload:](self, "submitEventWithName:serviceName:uploadImmediately:payload:", a3, a4, 0, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonFields, 0);
  objc_storeStrong((id *)&self->_sessionFactory, 0);
}

+ (id)sharedManager
{
  if (sharedManager__hmf_once_t0 != -1)
    dispatch_once(&sharedManager__hmf_once_t0, &__block_literal_global_715);
  return (id)sharedManager__hmf_once_v1;
}

void __37__HMMRTCSessionManager_sharedManager__block_invoke()
{
  HMMRTCSessionManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMMRTCSessionManager);
  v1 = (void *)sharedManager__hmf_once_v1;
  sharedManager__hmf_once_v1 = (uint64_t)v0;

}

@end
