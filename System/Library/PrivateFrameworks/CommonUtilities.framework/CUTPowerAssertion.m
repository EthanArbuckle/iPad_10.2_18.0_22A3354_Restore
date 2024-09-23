@implementation CUTPowerAssertion

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  IOPMAssertionID v8;
  IOReturn v9;
  int v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[CUTLog power](CUTLog, "power");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *((_QWORD *)self->_internal + 2);
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl(&dword_1A0BC3000, v3, OS_LOG_TYPE_DEFAULT, "Releasing power assertion {identifier: %{public}@}", buf, 0xCu);
  }

  +[CUTLog power](CUTLog, "power");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    +[CUTLog power](CUTLog, "power");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_1A0BD1F18();

  }
  v8 = *((_DWORD *)self->_internal + 2);
  if (v8)
  {
    v9 = IOPMAssertionRelease(v8);
    if (v9)
    {
      v10 = v9;
      +[CUTLog power](CUTLog, "power");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        sub_1A0BD2018((uint64_t)&self->_internal, v10, v11);

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CUTPowerAssertion;
  -[CUTPowerAssertion dealloc](&v12, sel_dealloc);
}

- (CUTPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4
{
  __CFString *v6;
  CUTPowerAssertion *v7;
  _CUTPowerAssertion *v8;
  id internal;
  IOPMAssertionID *v10;
  IOReturn v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  objc_super v26;
  uint8_t buf[4];
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v26.receiver = self;
  v26.super_class = (Class)CUTPowerAssertion;
  v7 = -[CUTPowerAssertion init](&v26, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(_CUTPowerAssertion);
    internal = v7->_internal;
    v7->_internal = v8;

    v10 = (IOPMAssertionID *)v7->_internal;
    if (a4 == 0.0)
      v11 = IOPMAssertionCreateWithName(CFSTR("NoIdleSleepAssertion"), 0xFFu, v6, v10 + 2);
    else
      v11 = IOPMAssertionCreateWithDescription(CFSTR("NoIdleSleepAssertion"), v6, v6, 0, 0, a4, CFSTR("TimeoutActionTurnOff"), v10 + 2);
    v12 = v11;
    if (v11)
    {
      *((_DWORD *)v7->_internal + 2) = 0;
      +[CUTLog power](CUTLog, "power");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        sub_1A0BD1F94((uint64_t)v6, v12, v13);

      v7 = 0;
    }
    else
    {
      v14 = -[__CFString copy](v6, "copy");
      v15 = v7->_internal;
      v16 = (void *)v15[2];
      v15[2] = v14;

      v17 = (void *)MEMORY[0x1A1B01454]();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v7->_internal;
      v20 = (void *)v19[3];
      v19[3] = v18;

      +[CUTLog power](CUTLog, "power");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v6;
        _os_log_impl(&dword_1A0BC3000, v21, OS_LOG_TYPE_DEFAULT, "Created power assertion {identifier: %{public}@}", buf, 0xCu);
      }

      +[CUTLog power](CUTLog, "power");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

      if (v23)
      {
        +[CUTLog power](CUTLog, "power");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          sub_1A0BD1F18();

      }
      objc_autoreleasePoolPop(v17);
    }
  }

  return v7;
}

- (CUTPowerAssertion)initWithIdentifier:(id)a3
{
  return (CUTPowerAssertion *)MEMORY[0x1E0DE7D20](self, sel_initWithIdentifier_timeout_);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<IMPowerAssertion: %p> Identifier: %@   Stack: %@"), self, *((_QWORD *)self->_internal + 2), *((_QWORD *)self->_internal + 3));
}

@end
