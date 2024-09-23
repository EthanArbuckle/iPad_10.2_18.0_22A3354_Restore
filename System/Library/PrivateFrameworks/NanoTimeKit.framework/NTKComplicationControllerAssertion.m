@implementation NTKComplicationControllerAssertion

- (NTKComplicationControllerAssertion)initWithController:(id)a3 dataMode:(int64_t)a4
{
  id v7;
  NTKComplicationControllerAssertion *v8;
  NTKComplicationControllerAssertion *v9;
  _QWORD v11[4];
  id v12;
  NTKComplicationControllerAssertion *v13;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKComplicationControllerAssertion;
  v8 = -[NTKComplicationControllerAssertion init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controller, a3);
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_lock_dataMode = a4;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__NTKComplicationControllerAssertion_initWithController_dataMode___block_invoke;
    v11[3] = &unk_1E6BCD778;
    v12 = v7;
    v13 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  return v9;
}

uint64_t __66__NTKComplicationControllerAssertion_initWithController_dataMode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Taking out controller assertion %@ for controller %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "addDataModeAssertion:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)NTKComplicationControllerAssertion;
  -[NTKComplicationControllerAssertion dealloc](&v4, sel_dealloc);
}

- (void)setDataMode:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  int64_t lock_dataMode;
  _QWORD v7[6];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_dataMode = self->_lock_dataMode;
  self->_lock_dataMode = a3;
  os_unfair_lock_unlock(p_lock);
  if (lock_dataMode != a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__NTKComplicationControllerAssertion_setDataMode___block_invoke;
    v7[3] = &unk_1E6BD09B0;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v7);
  }
}

uint64_t __50__NTKComplicationControllerAssertion_setDataMode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    NTKFaceDataModeDescription(*(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Updating data mode for assertion %@ to %@", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updateDataModeAssertion:");
}

- (int64_t)dataMode
{
  os_unfair_lock_s *p_lock;
  int64_t lock_dataMode;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_dataMode = self->_lock_dataMode;
  os_unfair_lock_unlock(p_lock);
  return lock_dataMode;
}

- (BOOL)invalidated
{
  NTKComplicationControllerAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  _QWORD block[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NTKComplicationControllerAssertion_invalidate__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __48__NTKComplicationControllerAssertion_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 32);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Invalding controller assertion %@ for controller %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeDataModeAssertion:");
}

- (NTKComplicationController)controller
{
  return self->_controller;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
