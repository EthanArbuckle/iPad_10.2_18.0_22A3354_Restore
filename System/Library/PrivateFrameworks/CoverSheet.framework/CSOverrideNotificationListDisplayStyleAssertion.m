@implementation CSOverrideNotificationListDisplayStyleAssertion

- (CSOverrideNotificationListDisplayStyleAssertion)initWithNotificationListDisplayStyle:(int64_t)a3 hideNotificationCount:(BOOL)a4 reason:(id)a5 invalidationHandler:(id)a6
{
  id v11;
  id v12;
  void *v13;
  CSOverrideNotificationListDisplayStyleAssertion *v14;
  CSOverrideNotificationListDisplayStyleAssertion *v15;
  uint64_t v16;
  NSString *reason;
  uint64_t v18;
  id invalidationHandler;
  NSObject *v20;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  CSOverrideNotificationListDisplayStyleAssertion *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSOverrideNotificationListDisplayStyleAssertion.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSOverrideNotificationListDisplayStyleAssertion.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationHandler"));

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)CSOverrideNotificationListDisplayStyleAssertion;
  v14 = -[CSOverrideNotificationListDisplayStyleAssertion init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_displayStyle = a3;
    v14->_hideNotificationCount = a4;
    v16 = objc_msgSend(v11, "copy");
    reason = v15->_reason;
    v15->_reason = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    invalidationHandler = v15->_invalidationHandler;
    v15->_invalidationHandler = (id)v18;

    SBLogDashBoard();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_impl(&dword_1D0337000, v20, OS_LOG_TYPE_DEFAULT, "Acquired notification list display style override assertion: %{public}@", buf, 0xCu);
    }

  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[CSOverrideNotificationListDisplayStyleAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSOverrideNotificationListDisplayStyleAssertion;
  -[CSOverrideNotificationListDisplayStyleAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  id invalidationHandler;
  int v5;
  CSOverrideNotificationListDisplayStyleAssertion *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_invalidationHandler)
  {
    SBLogDashBoard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating notification list display style override assertion: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    (*((void (**)(void))self->_invalidationHandler + 2))();
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

  }
}

- (void)cancel
{
  id invalidationHandler;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", self->_displayStyle);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; displayStyle: %@; hideNotificationCount: %d, reason: %@>"),
    objc_opt_class(),
    self,
    v3,
    self->_hideNotificationCount,
    self->_reason);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(int64_t)a3
{
  self->_displayStyle = a3;
}

- (BOOL)hideNotificationCount
{
  return self->_hideNotificationCount;
}

- (void)setHideNotificationCount:(BOOL)a3
{
  self->_hideNotificationCount = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
