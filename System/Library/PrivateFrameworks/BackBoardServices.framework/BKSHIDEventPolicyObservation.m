@implementation BKSHIDEventPolicyObservation

- (BKSHIDEventPolicyObservation)init
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BKSHIDEventPolicyObservation init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BKSHIDEventPolicyObservation.m"), 36, CFSTR("cannot directly allocate BKSHIDEventPolicyObservation"));

  return 0;
}

- (BKSHIDEventPolicyObservation)initWithCoder:(id)a3
{
  id v3;
  BKSHIDEventPolicyObservation *v4;
  uint64_t v5;
  BKSHIDEventDisplay *display;
  uint64_t v7;
  BKSHIDEventDeferringEnvironment *environment;
  uint64_t v9;
  BKSHIDEventDeferringToken *token;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BKSHIDEventPolicyObservation;
  v3 = a3;
  v4 = -[BKSHIDEventPolicyObservation init](&v13, sel_init);
  v4->_pid = objc_msgSend(v3, "decodeIntForKey:", CFSTR("pid"), v13.receiver, v13.super_class);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display"));
  v5 = objc_claimAutoreleasedReturnValue();
  display = v4->_display;
  v4->_display = (BKSHIDEventDisplay *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
  v7 = objc_claimAutoreleasedReturnValue();
  environment = v4->_environment;
  v4->_environment = (BKSHIDEventDeferringEnvironment *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
  v9 = objc_claimAutoreleasedReturnValue();
  token = v4->_token;
  v4->_token = (BKSHIDEventDeferringToken *)v9;

  v11 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("policyStatus"));
  v4->_policyStatus = v11;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  BKSHIDEventDisplay *display;
  BKSHIDEventDeferringEnvironment *environment;
  BKSHIDEventDeferringToken *token;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", self->_pid, CFSTR("pid"));
  display = self->_display;
  if (display)
    objc_msgSend(v8, "encodeObject:forKey:", display, CFSTR("display"));
  environment = self->_environment;
  if (environment)
    objc_msgSend(v8, "encodeObject:forKey:", environment, CFSTR("environment"));
  token = self->_token;
  v7 = v8;
  if (token)
  {
    objc_msgSend(v8, "encodeObject:forKey:", token, CFSTR("token"));
    v7 = v8;
  }
  objc_msgSend(v7, "encodeInteger:forKey:", self->_policyStatus, CFSTR("policyStatus"));

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[BKSHIDEventDisplay hash](self->_display, "hash");
  v4 = -[BKSHIDEventDeferringEnvironment hash](self->_environment, "hash") ^ v3;
  v5 = v4 ^ -[BKSHIDEventDeferringToken hash](self->_token, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_policyStatus);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  v10 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) >> 27));
  return v10 ^ (v10 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5[2] == self->_pid
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && *((_QWORD *)v5 + 5) == self->_policyStatus;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventPolicyObservation _initWithCopyOf:]((id *)[BKSHIDEventPolicyObservation alloc], self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventPolicyObservation _initWithCopyOf:]((id *)[BKSMutableHIDEventPolicyObservation alloc], self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v4 = (id)objc_msgSend(v10, "appendInteger:withName:", self->_pid, CFSTR("pid"));
  v5 = (id)objc_msgSend(v10, "appendObject:withName:", self->_display, CFSTR("display"));
  v6 = (id)objc_msgSend(v10, "appendObject:withName:", self->_environment, CFSTR("environment"));
  v7 = (id)objc_msgSend(v10, "appendObject:withName:", self->_token, CFSTR("token"));
  NSStringFromBKSHIDEventDeferringPolicyStatus(self->_policyStatus);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v10, "appendObject:withName:", v8, CFSTR("policyStatus"));

}

- (int)pid
{
  return self->_pid;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (BKSHIDEventDeferringToken)token
{
  return self->_token;
}

- (int64_t)policyStatus
{
  return self->_policyStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

- (id)_initWithCopyOf:(id *)a1
{
  id v3;
  id *v4;

  v3 = a2;
  if (a1)
  {
    v4 = (id *)-[BKSHIDEventPolicyObservation _init](a1);
    a1 = v4;
    if (v4)
    {
      *((_DWORD *)v4 + 2) = *((_DWORD *)v3 + 2);
      objc_storeStrong(v4 + 2, *((id *)v3 + 2));
      objc_storeStrong(a1 + 3, *((id *)v3 + 3));
      objc_storeStrong(a1 + 4, *((id *)v3 + 4));
      a1[5] = (id)*((_QWORD *)v3 + 5);
    }
  }

  return a1;
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

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
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__init, v1, CFSTR("BKSHIDEventPolicyObservation.m"), 47, CFSTR("BKSHIDEventPolicyObservation cannot be subclassed"));

      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)BKSHIDEventPolicyObservation;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

+ (id)build:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;

  v3 = (void (**)(id, id))a3;
  v4 = -[BKSHIDEventPolicyObservation _init]([BKSMutableHIDEventPolicyObservation alloc]);
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BKSHIDEventPolicyObservation new]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BKSHIDEventPolicyObservation.m"), 41, CFSTR("cannot directly allocate BKSHIDEventPolicyObservation"));

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
