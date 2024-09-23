@implementation __HMFWiFiAssertion

- (__HMFWiFiAssertion)initWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (__HMFWiFiAssertion)initWithOptions:(unint64_t)a3 manager:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  __HMFWiFiAssertion *v15;
  __HMFWiFiAssertion *v16;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  if (!v9)
    _HMFPreconditionFailure(CFSTR("manager"));
  v11 = v10;
  if (!v10)
    _HMFPreconditionFailure(CFSTR("reason"));
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(".%@"), v11);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  v18.receiver = self;
  v18.super_class = (Class)__HMFWiFiAssertion;
  v15 = -[HMFAssertion initWithName:](&v18, sel_initWithName_, v13);
  v16 = v15;
  if (v15)
  {
    v15->_options = a3;
    objc_storeStrong((id *)&v15->_manager, a4);
    v16->super._valid = 0;
  }

  return v16;
}

- (BOOL)acquire:(id *)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__HMFWiFiAssertion;
  v4 = -[HMFAssertion acquire:](&v6, sel_acquire_, a3);
  if (v4)
    -[HMFWiFiManager __updateActiveAssertions]((id *)&self->_manager->super.super.isa);
  return v4;
}

- (void)invalidate
{
  objc_super v3;

  if (-[HMFAssertion isValid](self, "isValid"))
    -[HMFWiFiManager __updateActiveAssertions]((id *)&self->_manager->super.super.isa);
  v3.receiver = self;
  v3.super_class = (Class)__HMFWiFiAssertion;
  -[HMFAssertion invalidate](&v3, sel_invalidate);
}

- (HMFWiFiManager)manager
{
  return (HMFWiFiManager *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
