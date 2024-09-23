@implementation FPExceptionToErrorProxy

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  objc_msgSend(self->_target, "methodSignatureForSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)FPExceptionToErrorProxy;
    -[FPExceptionToErrorProxy methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v4;

  v4 = a3;
  __FP_EXCEPTION_TO_ERROR_PROXY_CALLING_OUT__(v4, (const char *)self->_target);

}

- (FPExceptionToErrorProxy)initWithTarget:(id)a3
{
  id v5;
  FPExceptionToErrorProxy *v6;
  FPExceptionToErrorProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPExceptionToErrorProxy;
  v6 = -[FPExceptionToErrorProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_target, a3);

  return v7;
}

- (BOOL)conformsToProtocol:(id)a3
{
  return objc_msgSend(self->_target, "conformsToProtocol:", a3);
}

- (BOOL)isKindOfClass:(Class)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)FPExceptionToErrorProxy;
  return -[FPExceptionToErrorProxy respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (id)errorFromException:(id)a3 whileSendingToSelector:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_60);
  if (v10 < 2 || v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "subarrayWithRange:", 0, v10 - 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObject:", CFSTR(")"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Exception caught sending %@ to %@:\n%@"), v16, self->_target, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB35C8];
  v19 = *MEMORY[0x1E0CB28A8];
  v23 = *MEMORY[0x1E0CB2938];
  v24[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 4099, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __69__FPExceptionToErrorProxy_errorFromException_whileSendingToSelector___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", CFSTR("__FP_EXCEPTION_TO_ERROR_PROXY_CALLING_OUT__"));
}

void __45__FPExceptionToErrorProxy_forwardInvocation___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FileProvider", "exceptions");
  v1 = (void *)forwardInvocation__exceptionLog;
  forwardInvocation__exceptionLog = (uint64_t)v0;

}

- (id)unhandledExceptionHandler
{
  return self->_unhandledExceptionHandler;
}

- (void)setUnhandledExceptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unhandledExceptionHandler, 0);
  objc_storeStrong(&self->_target, 0);
}

- (void)forwardInvocation:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1A0A34000, log, OS_LOG_TYPE_FAULT, "[CRIT] %@", buf, 0xCu);

}

@end
