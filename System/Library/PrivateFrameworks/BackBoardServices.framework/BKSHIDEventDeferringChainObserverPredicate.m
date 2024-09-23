@implementation BKSHIDEventDeferringChainObserverPredicate

- (id)_initWithCopyOf:(id *)a1
{
  id *v3;
  id *v4;

  v3 = a2;
  if (a1)
  {
    v4 = (id *)-[BKSHIDEventDeferringChainObserverPredicate _init](a1);
    a1 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 1, v3[1]);
      objc_storeStrong(a1 + 2, v3[2]);
    }
  }

  return a1;
}

- (_QWORD)_init
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__init, v1, CFSTR("BKSHIDEventDeferringChainObserverPredicate.m"), 50, CFSTR("BKSHIDEventDeferringChainObserverPredicate cannot be subclassed"));

      }
    }
    +[BKSHIDEventDisplay nullDisplay](BKSHIDEventDisplay, "nullDisplay");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v1[1];
    v1[1] = v4;

    +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](BKSHIDEventDeferringEnvironment, "keyboardFocusEnvironment");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v1[2];
    v1[2] = v6;

    v9.receiver = v1;
    v9.super_class = (Class)BKSHIDEventDeferringChainObserverPredicate;
    return objc_msgSendSuper2(&v9, sel_init);
  }
  return result;
}

- (BKSHIDEventDeferringChainObserverPredicate)init
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BKSHIDEventDeferringChainObserverPredicate init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BKSHIDEventDeferringChainObserverPredicate.m"), 39, CFSTR("cannot directly allocate BKSHIDEventDeferringChainObserverPredicate"));

  return 0;
}

- (BKSHIDEventDeferringChainObserverPredicate)initWithCoder:(id)a3
{
  id v3;
  BKSHIDEventDeferringChainObserverPredicate *v4;
  uint64_t v5;
  BKSHIDEventDisplay *display;
  uint64_t v7;
  BKSHIDEventDeferringEnvironment *environment;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventDeferringChainObserverPredicate;
  v3 = a3;
  v4 = -[BKSHIDEventDeferringChainObserverPredicate init](&v10, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display"), v10.receiver, v10.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  display = v4->_display;
  v4->_display = (BKSHIDEventDisplay *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
  v7 = objc_claimAutoreleasedReturnValue();

  environment = v4->_environment;
  v4->_environment = (BKSHIDEventDeferringEnvironment *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  BKSHIDEventDisplay *display;
  BKSHIDEventDeferringEnvironment *environment;
  id v7;

  v4 = a3;
  display = self->_display;
  v7 = v4;
  if (display)
  {
    objc_msgSend(v4, "encodeObject:forKey:", display, CFSTR("display"));
    v4 = v7;
  }
  environment = self->_environment;
  if (environment)
  {
    objc_msgSend(v7, "encodeObject:forKey:", environment, CFSTR("environment"));
    v4 = v7;
  }

}

- (unint64_t)hash
{
  -[BKSHIDEventDisplay hash](self->_display, "hash");
  -[BKSHIDEventDeferringEnvironment hash](self->_environment, "hash");
  return BSHashPurifyNS();
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  id v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (BSEqualObjects())
      v5 = BSEqualObjects();
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventDeferringChainObserverPredicate _initWithCopyOf:]((id *)[BKSMutableHIDEventDeferringChainObserverPredicate alloc], self);
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

+ (id)build:(id)a3
{
  void (**v3)(id, _QWORD *);
  _QWORD *v4;
  void *v5;

  v3 = (void (**)(id, _QWORD *))a3;
  v4 = -[BKSHIDEventDeferringChainObserverPredicate _init]([BKSMutableHIDEventDeferringChainObserverPredicate alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

+ (id)new
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BKSHIDEventDeferringChainObserverPredicate new]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BKSHIDEventDeferringChainObserverPredicate.m"), 44, CFSTR("cannot directly allocate BKSHIDEventDeferringChainObserverPredicate"));

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
