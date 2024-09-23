@implementation __HMFLocationAuthorizationRequest

+ (id)logCategory
{
  if (_MergedGlobals_3_5 != -1)
    dispatch_once(&_MergedGlobals_3_5, &__block_literal_global_20);
  return (id)qword_1ED012EE8;
}

- (__HMFLocationAuthorizationRequest)initWithType:(int64_t)a3 authorization:(id)a4
{
  id v6;
  void *v7;
  __HMFLocationAuthorizationRequest *v8;
  __HMFLocationAuthorizationRequest *v9;
  objc_super v11;

  v6 = a4;
  if (!v6)
    _HMFPreconditionFailure(CFSTR("authorization"));
  v7 = v6;
  v11.receiver = self;
  v11.super_class = (Class)__HMFLocationAuthorizationRequest;
  v8 = -[__HMFLocationManagerOperation initWithAuthorization:](&v11, sel_initWithAuthorization_, v6);
  v9 = v8;
  if (v8)
    v8->_type = a3;

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[__HMFLocationAuthorizationRequest unregisterFromKVO](self, "unregisterFromKVO");
  v3.receiver = self;
  v3.super_class = (Class)__HMFLocationAuthorizationRequest;
  -[__HMFLocationManagerOperation dealloc](&v3, sel_dealloc);
}

- (void)unregisterFromKVO
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFLocationAuthorizationRequest;
  -[__HMFLocationManagerOperation unregisterFromKVO](&v5, sel_unregisterFromKVO);
  os_unfair_lock_lock_with_options();
  if (self->_registeredForKVO)
  {
    self->_registeredForKVO = 0;
    os_unfair_lock_unlock(&self->_lock);
    -[__HMFLocationManagerOperation authorization](self, "authorization");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_isAuthorized);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v4, HMFLocationAuthorizationRequestAuthorizedContext);

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  __HMFLocationAuthorizationRequest *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int64_t type;
  void *v14;
  __HMFLocationAuthorizationRequest *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[__HMFLocationManagerOperation authorization](self, "authorization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isAuthorized);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, v4, 0, HMFLocationAuthorizationRequestAuthorizedContext);

  os_unfair_lock_lock_with_options();
  self->_registeredForKVO = 1;
  os_unfair_lock_unlock(&self->_lock);
  -[__HMFLocationManagerOperation authorization](self, "authorization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");

  if ((__HMFLocationAuthorizationHandleAuthorizationStatus(self, v6) & 1) != 0)
  {
    -[__HMFLocationManagerOperation manager](self, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1A1AC355C]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier(v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v12;
        _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_INFO, "%{public}@Requesting authorization", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      type = v9->_type;
      if (type == 2)
      {
        objc_msgSend(v7, "requestWhenInUseAuthorization");
      }
      else if (type == 1)
      {
        objc_msgSend(v7, "requestAlwaysAuthorization");
      }
      v9->_requested = 1;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier(v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing internal location manager", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 11, CFSTR("Unexpected internal state."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFOperation cancelWithError:](v9, "cancelWithError:", v19);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC355C]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v17;
      _os_log_impl(&dword_19B546000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Unable to request authorization", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  objc_super v14;
  _QWORD block[5];
  id v16;

  v10 = a4;
  if ((void *)HMFLocationAuthorizationRequestAuthorizedContext == a6)
  {
    if (-[HMFOperation isExecuting](self, "isExecuting"))
    {
      -[__HMFLocationManagerOperation authorization](self, "authorization");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v10)
      {
        -[HMFOperation underlyingQueue](self, "underlyingQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __84____HMFLocationAuthorizationRequest_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_1E3B37CA8;
        block[4] = self;
        v16 = v10;
        v13 = v10;
        dispatch_async(v12, block);

      }
      else
      {

      }
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)__HMFLocationAuthorizationRequest;
    -[__HMFLocationManagerOperation observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

- (__HMFLocationAuthorizationRequest)initWithTimeout:(double)a3
{
  __HMFLocationAuthorizationRequest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)__HMFLocationAuthorizationRequest;
  result = -[__HMFLocationManagerOperation initWithTimeout:](&v4, sel_initWithTimeout_, a3);
  if (result)
    result->_type = 2;
  return result;
}

- (__HMFLocationAuthorizationRequest)initWithAuthorization:(id)a3
{
  __HMFLocationAuthorizationRequest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)__HMFLocationAuthorizationRequest;
  result = -[__HMFLocationManagerOperation initWithAuthorization:](&v4, sel_initWithAuthorization_, a3);
  if (result)
    result->_type = 2;
  return result;
}

- (__HMFLocationAuthorizationRequest)initWithType:(int64_t)a3
{
  void *v5;
  __HMFLocationAuthorizationRequest *v6;

  +[HMFLocationAuthorization sharedAuthorization](HMFLocationAuthorization, "sharedAuthorization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[__HMFLocationAuthorizationRequest initWithType:authorization:](self, "initWithType:authorization:", a3, v5);

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

@end
