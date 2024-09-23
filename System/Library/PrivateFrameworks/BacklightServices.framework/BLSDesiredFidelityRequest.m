@implementation BLSDesiredFidelityRequest

- (BLSDesiredFidelityRequest)initWithCompletion:(id)a3
{
  id v4;
  BLSDesiredFidelityRequest *v5;
  BLSDesiredFidelityRequest *v6;
  uint64_t v7;
  id completion;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLSDesiredFidelityRequest;
  v5 = -[BLSDesiredFidelityRequest init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = MEMORY[0x1B5E0F100](v4);
    completion = v6->_completion;
    v6->_completion = (id)v7;

  }
  return v6;
}

- (void)completeWithDesiredFidelity:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_completed;
  void (**v7)(_QWORD, _QWORD);
  id completion;
  NSObject *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_completed = self->_lock_completed;
  self->_lock_completed = 1;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E0F100](self->_completion);
  completion = self->_completion;
  self->_completion = 0;

  os_unfair_lock_unlock(p_lock);
  if (lock_completed)
  {
    bls_scenes_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BLSDesiredFidelityRequest completeWithDesiredFidelity:].cold.1((uint64_t)self, v9);

  }
  else if (v7)
  {
    v7[2](v7, a3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

- (void)completeWithDesiredFidelity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_ERROR, "%p completeWithDesiredFidelity should only be called once", (uint8_t *)&v2, 0xCu);
}

@end
