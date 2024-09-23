@implementation _NSFileAccessAsynchronousProcessAssertion

- (void)invalidate
{
  -[BKSProcessAssertion invalidate](self->_assertion, "invalidate");

  self->_assertion = 0;
}

- (_NSFileAccessAsynchronousProcessAssertion)initWithPID:(int)a3 name:(id)a4
{
  _NSFileAccessAsynchronousProcessAssertion *v6;
  _NSFileAccessAsynchronousProcessAssertion *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_NSFileAccessAsynchronousProcessAssertion;
  v6 = -[_NSFileAccessAsynchronousProcessAssertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_pid = a3;
    v6->_name = (NSString *)objc_msgSend(a4, "copy");
  }
  return v7;
}

- (void)beginAssertion
{
  NSObject *v3;
  int pid;
  NSString *name;
  _DWORD v6[2];
  __int16 v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[BKSProcessAssertion invalidate](self->_assertion, "invalidate");

  self->_assertion = 0;
  v3 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    pid = self->_pid;
    name = self->_name;
    v6[0] = 67109378;
    v6[1] = pid;
    v7 = 2114;
    v8 = name;
    _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "Preventing suspension of pid %d for activity: %{public}@", (uint8_t *)v6, 0x12u);
  }
  self->_assertion = (BKSProcessAssertion *)objc_msgSend(objc_alloc(objc_lookUpClass("BKSProcessAssertion")), "initWithPID:flags:reason:name:withHandler:", self->_pid, 3, 4, self->_name, &__block_literal_global_77);
}

- (int)PID
{
  return self->_pid;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[BKSProcessAssertion invalidate](self->_assertion, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)_NSFileAccessAsynchronousProcessAssertion;
  -[_NSFileAccessAsynchronousProcessAssertion dealloc](&v3, sel_dealloc);
}

@end
