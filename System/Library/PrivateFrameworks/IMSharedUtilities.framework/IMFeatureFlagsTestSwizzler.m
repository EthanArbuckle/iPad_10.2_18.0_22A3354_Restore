@implementation IMFeatureFlagsTestSwizzler

- (IMFeatureFlagsTestSwizzler)initWithFeature:(SEL)a3 enabled:(BOOL)a4
{
  IMFeatureFlagsTestSwizzler *v6;
  IMSwizzledMethod *v7;
  IMSwizzledMethod *originalMethod;
  _BOOL4 enabled;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t (*v16)();
  objc_class *v17;
  IMSwizzledMethod *v18;
  IMSwizzledMethod *replacementMethod;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  id v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)IMFeatureFlagsTestSwizzler;
  v6 = -[IMFeatureFlagsTestSwizzler init](&v25, sel_init);
  if (v6)
  {
    if ((IMIsRunningInUnitTesting() & 1) != 0)
    {
      v6->_enabled = a4;
      v6->_feature = a3;
      v7 = -[IMSwizzledMethod initWithClass:selector:]([IMSwizzledMethod alloc], "initWithClass:selector:", objc_opt_class(), a3);
      originalMethod = v6->_originalMethod;
      v6->_originalMethod = v7;

      enabled = v6->_enabled;
      v10 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a3);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (enabled)
        v13 = CFSTR("%@_SwizzledOnForTests");
      else
        v13 = CFSTR("%@_SwizzledOffForTests");
      objc_msgSend(v10, "stringWithFormat:", v13, v11);
      v14 = objc_claimAutoreleasedReturnValue();
      v6->_testMethod = NSSelectorFromString((NSString *)v14);

      +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0
        || (enabled ? (v16 = sub_19E264914) : (v16 = sub_19E26491C),
            v17 = (objc_class *)objc_opt_class(),
            class_addMethod(v17, v6->_testMethod, (IMP)v16, -[IMSwizzledMethod typeEncoding](v6->_originalMethod, "typeEncoding"))))
      {
        v18 = -[IMSwizzledMethod initWithClass:selector:]([IMSwizzledMethod alloc], "initWithClass:selector:", objc_opt_class(), v6->_testMethod);
        replacementMethod = v6->_replacementMethod;
        v6->_replacementMethod = v18;

        return v6;
      }
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = CFSTR("IMFeatureFlagsCreatingTestMethodFailed");
      v23 = CFSTR("Creating test method failed");
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = CFSTR("IMFeatureFlagsNotRunningUnitTests");
      v23 = CFSTR("Swizzling for testing is not permitted outside of testing.");
    }
    objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  return v6;
}

- (BOOL)isSwizzled
{
  return -[IMSwizzledMethod isSwizzled](self->_originalMethod, "isSwizzled");
}

- (void)swizzle
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  id v6;
  id v7;

  if (-[IMFeatureFlagsTestSwizzler isSwizzled](self, "isSwizzled"))
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = CFSTR("IMFeatureFlagTestSwizzerSwizzlingFailedAlreadySwizzling");
    v5 = CFSTR("Already swizzing a test");
    goto LABEL_6;
  }
  if (!-[IMSwizzledMethod swizzleWithMethod:](self->_originalMethod, "swizzleWithMethod:", self->_replacementMethod))
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = CFSTR("IMFeatureFlagTestSwizzerFailed");
    v5 = CFSTR("Failed to swizzle test method");
LABEL_6:
    objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  -[IMSwizzledMethod description](self->_originalMethod, "description");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("IMFeatureFlagsTestSwizzler swizzled %@"), v7);

}

- (void)unswizzle
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  id v6;
  id v7;

  if (!-[IMFeatureFlagsTestSwizzler isSwizzled](self, "isSwizzled"))
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = CFSTR("IMFeatureFlagTestSwizzerUnswizzlingFailedNotSwizzling");
    v5 = CFSTR("Not swizzling a test");
    goto LABEL_6;
  }
  if (!-[IMSwizzledMethod unswizzle](self->_originalMethod, "unswizzle"))
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = CFSTR("IMFeatureFlagTestSwizzerFailed");
    v5 = CFSTR("Failed to unswizzle test method");
LABEL_6:
    objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  -[IMSwizzledMethod description](self->_originalMethod, "description");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("IMFeatureFlagsTestSwizzler unswizzled %@"), v7);

}

- (void)dealloc
{
  objc_super v3;

  if (-[IMFeatureFlagsTestSwizzler isSwizzled](self, "isSwizzled"))
    -[IMFeatureFlagsTestSwizzler unswizzle](self, "unswizzle");
  v3.receiver = self;
  v3.super_class = (Class)IMFeatureFlagsTestSwizzler;
  -[IMFeatureFlagsTestSwizzler dealloc](&v3, sel_dealloc);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SEL)feature
{
  return self->_feature;
}

- (IMSwizzledMethod)originalMethod
{
  return self->_originalMethod;
}

- (IMSwizzledMethod)replacementMethod
{
  return self->_replacementMethod;
}

- (SEL)testMethod
{
  return self->_testMethod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementMethod, 0);
  objc_storeStrong((id *)&self->_originalMethod, 0);
}

@end
