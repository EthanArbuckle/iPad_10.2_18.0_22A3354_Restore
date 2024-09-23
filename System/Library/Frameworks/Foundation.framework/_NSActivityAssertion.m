@implementation _NSActivityAssertion

- (id)_initWithActivityOptions:(unint64_t)a3 reason:(id)a4 expirationHandler:(id)a5
{
  uint64_t v9;
  _NSActivityAssertion *v10;
  __CFString *v11;
  const __CFString *v12;
  unint64_t options;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSString *v21;
  const char *v22;
  NSString *reason;
  NSString *v24;
  NSString *v26;
  void *v27;
  _QWORD *v28;
  _QWORD block[6];
  objc_super v30;
  objc_super v31;
  uint8_t buf[4];
  NSString *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)_NSActivityAssertion;
  v30.receiver = -[_NSActivityAssertion init](&v31, sel_init);
  v30.super_class = (Class)_NSActivityAssertion;
  v10 = -[_NSActivityAssertion init](&v30, sel_init);
  if (!v10)
    return v10;
  v10->_options = a3;
  atomic_store(0, (unsigned __int8 *)&v10->_ended);
  if (a4)
    v11 = (__CFString *)a4;
  else
    v11 = CFSTR("No Reason Specified (via NSActivityOptions)");
  v12 = (const __CFString *)-[__CFString copy](v11, "copy", v9);
  v10->_reason = (NSString *)v12;
  atomic_store(0, &v10->_signpostID);
  options = v10->_options;
  if ((options & 0x100000) != 0)
  {
    v14 = IOPMAssertionCreateWithName(CFSTR("PreventUserIdleSystemSleep"), 0xFFu, v12, &v10->_systemSleepAssertionID);
    if ((_DWORD)v14)
    {
      v15 = v14;
      v16 = _NSMethodExceptionProem((objc_class *)v10, a2);
      NSLog((NSString *)CFSTR("%@: Warning: Could not create system idle sleep assertion (%d)"), v16, v15);
      options = v10->_options & 0xFFFFFFFFFFEFFFFFLL;
      v10->_options = options;
      if ((options & 0x20000000000) != 0)
        goto LABEL_15;
    }
    else
    {
      options = v10->_options;
      if ((options & 0x20000000000) != 0)
        goto LABEL_15;
    }
LABEL_7:
    if ((options & 0x40000000000) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
  if ((options & 0x20000000000) == 0)
    goto LABEL_7;
LABEL_15:
  -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSActivityAssertion: %@"), a4), "UTF8String");
  v10->_transaction = (OS_os_transaction *)os_transaction_create();
  options = v10->_options;
  if ((options & 0x40000000000) == 0)
  {
LABEL_8:
    if ((options & 0x80000000000) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  v10->_voucher = (OS_voucher *)voucher_copy();
  options = v10->_options;
  if ((options & 0x80000000000) == 0)
  {
LABEL_9:
    if ((options & 0x100000000000) == 0)
      goto LABEL_22;
LABEL_18:
    if (!a5)
    {
      v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: called with a nil expiration block"), _NSMethodExceptionProem((objc_class *)v10, a2));
      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = (_QWORD *)MEMORY[0x1E0C99778];
      goto LABEL_54;
    }
    if (qword_1ECD09D20 != -1)
      dispatch_once(&qword_1ECD09D20, &__block_literal_global_37);
    v10->_expirationHandler = (id)objc_msgSend(a5, "copy");
    v10->_lock._os_unfair_lock_opaque = 0;
    v17 = +[_NSActivityAssertion _expiringAssertionManagementQueue](_NSActivityAssertion, "_expiringAssertionManagementQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_3;
    block[3] = &unk_1E0F4C650;
    block[4] = v10;
    block[5] = a4;
    dispatch_async(v17, block);
    options = v10->_options;
    goto LABEL_22;
  }
LABEL_17:
  v10->_xpcBoost = +[NSXPCConnection _currentBoost]();
  options = v10->_options;
  if ((options & 0x100000000000) != 0)
    goto LABEL_18;
LABEL_22:
  if ((options & 0x600000000000) != 0)
  {
    if (qword_1ECD09D28 != -1)
      dispatch_once(&qword_1ECD09D28, &__block_literal_global_96);
    v18 = os_signpost_id_make_with_pointer((os_log_t)qword_1ECD09D30, v10);
    if (v18)
    {
      v19 = v18;
      if (v18 != -1)
      {
        if ((v10->_options & 0x200000000000) != 0)
        {
          if (qword_1ECD09D28 != -1)
            dispatch_once(&qword_1ECD09D28, &__block_literal_global_96);
          v20 = qword_1ECD09D30;
          if (!os_signpost_enabled((os_log_t)qword_1ECD09D30))
            goto LABEL_50;
          reason = v10->_reason;
          if (qword_1ECD09D18 != -1)
            dispatch_once(&qword_1ECD09D18, &__block_literal_global_11);
          *(_DWORD *)buf = 138543618;
          v33 = reason;
          v34 = 2114;
          v35 = qword_1ECD09D10;
          v22 = " reason=%{signpost.telemetry:string1,public}@ version=%{signpost.telemetry:string2,public}@  enableTelem"
                "etry=YES  isAnimation=YES";
        }
        else
        {
          if (qword_1ECD09D38 != -1)
            dispatch_once(&qword_1ECD09D38, &__block_literal_global_99);
          if (_MergedGlobals_104)
          {
            if (qword_1ECD09D28 != -1)
              dispatch_once(&qword_1ECD09D28, &__block_literal_global_96);
            v20 = qword_1ECD09D30;
            if (!os_signpost_enabled((os_log_t)qword_1ECD09D30))
              goto LABEL_50;
            v21 = v10->_reason;
            if (qword_1ECD09D18 != -1)
              dispatch_once(&qword_1ECD09D18, &__block_literal_global_11);
            *(_DWORD *)buf = 138543618;
            v33 = v21;
            v34 = 2114;
            v35 = qword_1ECD09D10;
            v22 = " reason=%{signpost.telemetry:string1,public}@ version=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ";
          }
          else
          {
            if (qword_1ECD09D28 != -1)
              dispatch_once(&qword_1ECD09D28, &__block_literal_global_96);
            v20 = qword_1ECD09D30;
            if (!os_signpost_enabled((os_log_t)qword_1ECD09D30))
              goto LABEL_50;
            v24 = v10->_reason;
            if (qword_1ECD09D18 != -1)
              dispatch_once(&qword_1ECD09D18, &__block_literal_global_11);
            *(_DWORD *)buf = 138543618;
            v33 = v24;
            v34 = 2114;
            v35 = qword_1ECD09D10;
            v22 = " reason=%{signpost.telemetry:string1,public}@ version=%{signpost.telemetry:string2,public}@ ";
          }
        }
        _os_signpost_emit_with_name_impl(&dword_1817D9000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v19, "interaction_tracking", v22, buf, 0x16u);
LABEL_50:
        atomic_store(v19, &v10->_signpostID);
        return v10;
      }
      v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unable to create a valid signpost ID"), _NSMethodExceptionProem((objc_class *)v10, sel__emitSignpostBegin));
      v27 = (void *)MEMORY[0x1E0C99DA0];
      v28 = (_QWORD *)MEMORY[0x1E0C99768];
LABEL_54:
      objc_exception_throw((id)objc_msgSend(v27, "exceptionWithName:reason:userInfo:", *v28, v26, 0));
    }
  }
  return v10;
}

- (void)_endFromDealloc:(BOOL)a3
{
  _BOOL4 v3;
  BOOL *p_ended;
  unint64_t options;
  os_signpost_id_t v8;
  NSObject *v9;
  OS_voucher *voucher;
  unint64_t v11;
  NSObject *v12;
  id expirationHandler;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_ended = &self->_ended;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_ended))
    {
      __clrex();
      NSLog((NSString *)CFSTR("Warning: NSActivity %@ was ended multiple times"), a2, self);
      return;
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_ended));
  options = self->_options;
  if ((options & 0x100000) != 0)
  {
    IOPMAssertionRelease(self->_systemSleepAssertionID);
    options = self->_options;
  }
  if ((options & 0x600000000000) != 0)
  {
    v8 = atomic_load(&self->_signpostID);
    if (v8)
    {
      if (qword_1ECD09D28 != -1)
        dispatch_once(&qword_1ECD09D28, &__block_literal_global_96);
      if (v8 != -1)
      {
        v9 = qword_1ECD09D30;
        if (os_signpost_enabled((os_log_t)qword_1ECD09D30))
        {
          *(_DWORD *)buf = 67240192;
          v16 = v3;
          _os_signpost_emit_with_name_impl(&dword_1817D9000, v9, OS_SIGNPOST_INTERVAL_END, v8, "interaction_tracking", " abandoned=%{signpost.telemetry:number1,public}d ", buf, 8u);
        }
      }
      atomic_store(0, &self->_signpostID);
    }
    options = self->_options;
  }
  if ((options & 0x20000000000) != 0)
  {

    self->_transaction = 0;
    options = self->_options;
  }
  if ((options & 0x40000000000) != 0)
  {
    if (self->_adoptPreviousVoucher)
    {

      self->_previousVoucher = 0;
    }
    voucher = self->_voucher;
    if (voucher)
    {

      self->_voucher = 0;
    }
  }
  v11 = self->_options;
  if ((v11 & 0x80000000000) != 0)
  {

    self->_xpcBoost = 0;
    v11 = self->_options;
  }
  if ((v11 & 0x100000000000) != 0)
  {
    v12 = +[_NSActivityAssertion _expiringAssertionManagementQueue](_NSActivityAssertion, "_expiringAssertionManagementQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40___NSActivityAssertion__endFromDealloc___block_invoke;
    block[3] = &unk_1E0F4D2D8;
    block[4] = self;
    dispatch_async(v12, block);
  }
  os_unfair_lock_lock(&self->_lock);
  expirationHandler = self->_expirationHandler;
  self->_expirationHandler = 0;
  os_unfair_lock_unlock(&self->_lock);
  if (expirationHandler)
    _Block_release(expirationHandler);
}

- (void)_reactivate
{
  OS_voucher *v3;

  if ((self->_options & 0x40000000000) != 0)
  {
    if (self->_voucher)
    {
      v3 = (OS_voucher *)voucher_adopt();
      self->_adoptPreviousVoucher = 1;
      self->_voucher = 0;
      self->_previousVoucher = v3;
    }
  }
}

+ (id)_expiringAssertionManagementQueue
{
  if (qword_1ECD09CD0 != -1)
    dispatch_once(&qword_1ECD09CD0, &__block_literal_global_20);
  return (id)qword_1ECD09CD8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (!self->_ended)
    -[_NSActivityAssertion _endFromDealloc:](self, "_endFromDealloc:", 1);

  v3.receiver = self;
  v3.super_class = (Class)_NSActivityAssertion;
  -[_NSActivityAssertion dealloc](&v3, sel_dealloc);
}

+ (id)_expiringActivities
{
  if (qword_1ECD09D00 != -1)
    dispatch_once(&qword_1ECD09D00, &__block_literal_global_6);
  return (id)qword_1ECD09D08;
}

+ (void)_performExpiringActivityWithReason:(id)a3 usingBlock:(id)a4
{
  _NSActivityAssertion *v6;
  _QWORD v7[6];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  if (!a3 || !_NSIsNSString() || !objc_msgSend(a3, "length"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot begin activity without reason string or empty reason string"), 0));
  v6 = [_NSActivityAssertion alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke;
  v8[3] = &unk_1E0F4E870;
  v8[4] = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke_2;
  v7[3] = &unk_1E0F4E060;
  v7[4] = -[_NSActivityAssertion _initWithActivityOptions:reason:expirationHandler:](v6, "_initWithActivityOptions:reason:expirationHandler:", 0x1000000000FFLL, a3, v8);
  v7[5] = a4;
  dispatch_async((dispatch_queue_t)+[_NSActivityAssertion _expiringTaskExecutionQueue](_NSActivityAssertion, "_expiringTaskExecutionQueue"), v7);
}

+ (id)_expiringTaskExecutionQueue
{
  if (qword_1ECD09CE0 != -1)
    dispatch_once(&qword_1ECD09CE0, &__block_literal_global_2_0);
  return (id)qword_1ECD09CE8;
}

+ (id)_expirationHandlerExecutionQueue
{
  if (qword_1ECD09CF0 != -1)
    dispatch_once(&qword_1ECD09CF0, &__block_literal_global_4_0);
  return (id)qword_1ECD09CF8;
}

+ (void)_dumpExpiringActivitives
{
  dispatch_async((dispatch_queue_t)+[_NSActivityAssertion _expiringAssertionManagementQueue](_NSActivityAssertion, "_expiringAssertionManagementQueue"), &__block_literal_global_8);
}

+ (void)_expireAllActivies
{
  dispatch_async((dispatch_queue_t)+[_NSActivityAssertion _expiringAssertionManagementQueue](_NSActivityAssertion, "_expiringAssertionManagementQueue"), &__block_literal_global_10_0);
}

- (id)debugDescription
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSActivityAssertion;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ 0x%16llx %@ %@"), -[_NSActivityAssertion debugDescription](&v3, sel_debugDescription), self->_options, self->_reason, self->_processAssertion);
}

- (void)_fireExpirationHandler
{
  NSObject *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3 = +[_NSActivityAssertion _expiringAssertionManagementQueue](_NSActivityAssertion, "_expiringAssertionManagementQueue");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46___NSActivityAssertion__fireExpirationHandler__block_invoke;
  v4[3] = &unk_1E0F4D2D8;
  v4[4] = self;
  dispatch_async(v3, v4);
}

+ (void)_performActivityWithOptions:(unint64_t)a3 reason:(id)a4 usingBlock:(id)a5
{
  id v8;

  if (!a4 || !_NSIsNSString() || !objc_msgSend(a4, "length"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot begin activity without reason string or empty reason string"), 0));
  v8 = -[_NSActivityAssertion _initWithActivityOptions:reason:expirationHandler:]([_NSActivityAssertion alloc], "_initWithActivityOptions:reason:expirationHandler:", a3, a4, 0);
  _CFSetTSD();
  (*((void (**)(id))a5 + 2))(a5);
  _CFSetTSD();
  objc_msgSend(v8, "_endFromDealloc:", 0);

}

- (BOOL)_isEnded
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_ended);
  return v2 & 1;
}

@end
