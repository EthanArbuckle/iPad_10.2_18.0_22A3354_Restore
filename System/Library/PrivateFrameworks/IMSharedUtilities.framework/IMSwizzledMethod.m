@implementation IMSwizzledMethod

- (IMSwizzledMethod)initWithClass:(Class)a3 selector:(SEL)a4
{
  IMSwizzledMethod *v6;
  objc_method *InstanceMethod;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMSwizzledMethod;
  v6 = -[IMSwizzledMethod init](&v9, sel_init);
  if (v6)
  {
    InstanceMethod = class_getInstanceMethod(a3, a4);
    v6->_method = InstanceMethod;
    v6->_implementation = method_getImplementation(InstanceMethod);
    v6->_typeEncoding = method_getTypeEncoding(v6->_method);
    objc_storeStrong((id *)&v6->_swizzledClass, a3);
    v6->_swizzledSelector = a4;
  }
  return v6;
}

- (BOOL)isSwizzled
{
  void *v2;
  BOOL v3;

  -[IMSwizzledMethod swizzledWithMethod](self, "swizzledWithMethod");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)swizzleWithMethod:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;

  v4 = a3;
  if (-[IMSwizzledMethod isSwizzled](self, "isSwizzled"))
  {
    IMLogHandleForCategory("IMSwizzledMethod");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_19E36D878(self);

  }
  else
  {
    if (objc_msgSend(v4, "isSwizzled"))
    {
      IMLogHandleForCategory("IMSwizzledMethod");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_19E36D8F4(v4);
    }
    else
    {
      if (!strcmp(-[IMSwizzledMethod typeEncoding](self, "typeEncoding"), (const char *)objc_msgSend(v4, "typeEncoding")))
      {
        method_setImplementation(-[IMSwizzledMethod method](self, "method"), (IMP)objc_msgSend(v4, "implementation"));
        -[IMSwizzledMethod setSwizzledWithMethod:](self, "setSwizzledWithMethod:", v4);
        objc_msgSend(v4, "setSwizzledWithMethod:", self);
        v7 = 1;
        goto LABEL_13;
      }
      IMLogHandleForCategory("IMSwizzledMethod");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_19E36D970(v6);
    }

  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (BOOL)unswizzle
{
  BOOL v3;
  void *v4;
  NSObject *v5;

  v3 = -[IMSwizzledMethod isSwizzled](self, "isSwizzled");
  if (v3)
  {
    method_setImplementation(-[IMSwizzledMethod method](self, "method"), (IMP)-[IMSwizzledMethod implementation](self, "implementation"));
    -[IMSwizzledMethod swizzledWithMethod](self, "swizzledWithMethod");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSwizzledWithMethod:", 0);

    -[IMSwizzledMethod setSwizzledWithMethod:](self, "setSwizzledWithMethod:", 0);
  }
  else
  {
    IMLogHandleForCategory("IMSwizzledMethod");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_19E36D9B0(self);

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(-[IMSwizzledMethod swizzledClass](self, "swizzledClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(-[IMSwizzledMethod swizzledSelector](self, "swizzledSelector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMSwizzledMethod isSwizzled](self, "isSwizzled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[IMSwizzledMethod swizzledWithMethod](self, "swizzledWithMethod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[IMSwizzledMethod swizzledWithMethod](self, "swizzledWithMethod");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector((SEL)objc_msgSend(v8, "swizzledSelector"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMSwizzledMethod: swizzled class: %@, selector: %@, isSwizzled: %@, swizzled with method: %@>"), v4, v5, v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMSwizzledMethod: swizzled class: %@, selector: %@, isSwizzled: %@, swizzled with method: %@>"), v4, v5, v6, CFSTR("NONE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (IMSwizzledMethod)swizzledWithMethod
{
  return self->_swizzledWithMethod;
}

- (void)setSwizzledWithMethod:(id)a3
{
  objc_storeStrong((id *)&self->_swizzledWithMethod, a3);
}

- (objc_method)method
{
  return self->_method;
}

- (void)implementation
{
  return self->_implementation;
}

- (const)typeEncoding
{
  return self->_typeEncoding;
}

- (Class)swizzledClass
{
  return self->_swizzledClass;
}

- (SEL)swizzledSelector
{
  return self->_swizzledSelector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swizzledClass, 0);
  objc_storeStrong((id *)&self->_swizzledWithMethod, 0);
}

@end
