@implementation __HMFLocationManagerOperation

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ready")) & 1) != 0
    || (NSStringFromSelector(sel_isReady),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEqualToString:", v5),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS_____HMFLocationManagerOperation;
    v7 = objc_msgSendSuper2(&v9, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v7;
}

- (__HMFLocationManagerOperation)initWithAuthorization:(id)a3
{
  id v5;
  void *v6;
  __HMFLocationManagerOperation *v7;
  __HMFLocationManagerOperation *v8;
  objc_super v10;

  v5 = a3;
  if (!v5)
    _HMFPreconditionFailure(CFSTR("authorization"));
  v6 = v5;
  v10.receiver = self;
  v10.super_class = (Class)__HMFLocationManagerOperation;
  v7 = -[HMFOperation initWithTimeout:](&v10, sel_initWithTimeout_, 0.0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_authorization, a3);
    __HMFLocationManagerOperationStartMonitoring(v8);
  }

  return v8;
}

+ (void)initialize
{
  void *v2;
  id v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v2 = (void *)qword_1ED013020;
  v8 = qword_1ED013020;
  if (!qword_1ED013020)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getCLLocationManagerClass_block_invoke_0;
    v4[3] = &unk_1E3B382D8;
    v4[4] = &v5;
    __getCLLocationManagerClass_block_invoke_0((uint64_t)v4);
    v2 = (void *)v6[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v5, 8);
}

- (void)unregisterFromKVO
{
  os_unfair_lock_s *p_lock;
  HMFLocationAuthorization *authorization;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_registeredForKVO)
  {
    self->_registeredForKVO = 0;
    os_unfair_lock_unlock(p_lock);
    authorization = self->_authorization;
    NSStringFromSelector(sel_isMonitoring);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HMFLocationAuthorization removeObserver:forKeyPath:context:](authorization, "removeObserver:forKeyPath:context:", self, v5, HMFLocationManagerOperationMonitoringContext);

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[__HMFLocationManagerOperation unregisterFromKVO](self, "unregisterFromKVO");
  v3.receiver = self;
  v3.super_class = (Class)__HMFLocationManagerOperation;
  -[__HMFLocationManagerOperation dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  __HMFLocationManagerOperation *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CLLocationManager *manager;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)HMFLocationManagerOperationMonitoringContext == a6)
  {
    -[__HMFLocationManagerOperation authorization](self, "authorization");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13 == v11)
    {
      if (objc_msgSend(v11, "isMonitoring"))
      {
        v14 = (void *)MEMORY[0x1A1AC355C]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier(v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v24 = v17;
          _os_log_impl(&dword_19B546000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Marking as ready", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        NSStringFromSelector(sel_isReady);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[__HMFLocationManagerOperation willChangeValueForKey:](v15, "willChangeValueForKey:", v18);

        os_unfair_lock_lock_with_options();
        v15->_ready = 1;
        objc_msgSend(v11, "internal");
        v19 = objc_claimAutoreleasedReturnValue();
        manager = v15->_manager;
        v15->_manager = (CLLocationManager *)v19;

        os_unfair_lock_unlock(&v15->_lock);
        NSStringFromSelector(sel_isReady);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[__HMFLocationManagerOperation didChangeValueForKey:](v15, "didChangeValueForKey:", v21);

      }
    }
    else
    {

    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)__HMFLocationManagerOperation;
    -[__HMFLocationManagerOperation observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (HMFLocationAuthorization)authorization
{
  return (HMFLocationAuthorization *)objc_getProperty(self, a2, 328, 1);
}

- (BOOL)isReady
{
  os_unfair_lock_s *p_lock;
  _BOOL4 ready;
  objc_super v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ready = self->_ready;
  os_unfair_lock_unlock(p_lock);
  if (!ready)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)__HMFLocationManagerOperation;
  return -[__HMFLocationManagerOperation isReady](&v6, sel_isReady);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (CLLocationManager)manager
{
  os_unfair_lock_s *p_lock;
  CLLocationManager *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_manager;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (__HMFLocationManagerOperation)initWithTimeout:(double)a3
{
  __HMFLocationManagerOperation *v3;
  uint64_t v4;
  HMFLocationAuthorization *authorization;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)__HMFLocationManagerOperation;
  v3 = -[HMFOperation initWithTimeout:](&v7, sel_initWithTimeout_, a3);
  if (v3)
  {
    +[HMFLocationAuthorization sharedAuthorization](HMFLocationAuthorization, "sharedAuthorization");
    v4 = objc_claimAutoreleasedReturnValue();
    authorization = v3->_authorization;
    v3->_authorization = (HMFLocationAuthorization *)v4;

    __HMFLocationManagerOperationStartMonitoring(v3);
  }
  return v3;
}

+ (id)logCategory
{
  if (_MergedGlobals_3_17 != -1)
    dispatch_once(&_MergedGlobals_3_17, &__block_literal_global_47);
  return (id)qword_1ED013018;
}

@end
