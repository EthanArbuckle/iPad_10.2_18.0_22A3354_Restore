@implementation PHASEGroupPreset

- (PHASEGroupPreset)init
{
  -[PHASEGroupPreset doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEGroupPreset)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEGroupPreset)initWithEngine:(PHASEEngine *)engine settings:(NSDictionary *)settings timeToTarget:(double)timeToTarget timeToReset:(double)timeToReset
{
  PHASEEngine *v10;
  NSDictionary *v11;
  PHASEGroupPreset *v12;
  uint64_t v13;
  NSDictionary *v14;
  objc_super v16;

  v10 = engine;
  v11 = settings;
  v16.receiver = self;
  v16.super_class = (Class)PHASEGroupPreset;
  v12 = -[PHASEGroupPreset init](&v16, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v12->_settings;
    v12->_settings = (NSDictionary *)v13;

    v12->_timeToTarget = timeToReset;
    v12->_timeToReset = timeToTarget;
    objc_storeWeak((id *)&v12->_engine, v10);
  }

  return v12;
}

- (void)activate
{

  JUMPOUT(0x2199F9D70);
}

- (void)activateWithTimeToTargetOverride:(double)timeToTargetOverride
{
  PHASEEngine **p_engine;
  id WeakRetained;
  id v7;
  uint64_t v8;
  PHASEGroupPreset *v9;
  uint64_t v10;
  _DWORD *v11;
  NSObject *v12;
  id v13;
  Phase::Logger *InstancePtr;
  NSObject *v15;
  std::runtime_error *exception;
  BOOL v17;
  unint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_engine);
    v8 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)(objc_msgSend(v7, "implementation") + 48), 10);

    v9 = self;
    v10 = **(_QWORD **)(v8 + 8);
    v18 = 0;
    v17 = 1;
    v11 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v10, 32, &v18, &v17);
    if (!v11)
    {
      InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v15 = objc_retainAutorelease(**(id **)(v10 + 48));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "CommandQueue.hpp";
        v21 = 1024;
        v22 = 100;
        _os_log_impl(&dword_2164CC000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v17)
    {
      v12 = objc_retainAutorelease(**(id **)(v10 + 48));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v20 = "CommandQueue.hpp";
        v21 = 1024;
        v22 = 89;
        v23 = 2048;
        v24 = v18;
        v25 = 2048;
        v26 = 32;
        _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(_QWORD *)v11 = &off_24D57F718;
    *((_QWORD *)v11 + 1) = v8;
    *((_QWORD *)v11 + 2) = v9;
    *((double *)v11 + 3) = timeToTargetOverride;
    Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v10, 32);
    atomic_store(0, (unsigned __int8 *)(v10 + 40));

    v13 = objc_loadWeakRetained((id *)p_engine);
    objc_msgSend(v13, "setInternalActiveGroupMixerPreset:", v9);

  }
}

- (void)deactivate
{
  JUMPOUT(0x2199F9D70);
}

- (void)deactivateWithTimeToResetOverride:(double)timeToResetOverride
{
  PHASEEngine **p_engine;
  id WeakRetained;
  id v7;
  PHASEGroupPreset *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  NSObject *v13;
  id v14;
  Phase::Logger *InstancePtr;
  NSObject *v16;
  std::runtime_error *exception;
  BOOL v18;
  unint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_engine);
    objc_msgSend(v7, "activeGroupPreset");
    v8 = (PHASEGroupPreset *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
    {
      v9 = objc_loadWeakRetained((id *)p_engine);
      v10 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)(objc_msgSend(v9, "implementation") + 48), 10);

      v11 = **(_QWORD **)(v10 + 8);
      v19 = 0;
      v18 = 1;
      v12 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v11, 24, &v19, &v18);
      if (!v12)
      {
        InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
        Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
        v16 = objc_retainAutorelease(**(id **)(v11 + 48));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v21 = "CommandQueue.hpp";
          v22 = 1024;
          v23 = 100;
          _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buf"
            "fer is full, unable to grow.\",
            buf,
            0x12u);
        }
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      }
      if (v18)
      {
        v13 = objc_retainAutorelease(**(id **)(v11 + 48));
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v21 = "CommandQueue.hpp";
          v22 = 1024;
          v23 = 89;
          v24 = 2048;
          v25 = v19;
          v26 = 2048;
          v27 = 24;
          _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
        }
      }
      *(_QWORD *)v12 = &off_24D57F768;
      *((_QWORD *)v12 + 1) = v10;
      *((double *)v12 + 2) = timeToResetOverride;
      Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v11, 24);
      atomic_store(0, (unsigned __int8 *)(v11 + 40));
      v14 = objc_loadWeakRetained((id *)p_engine);
      objc_msgSend(v14, "setInternalActiveGroupMixerPreset:", 0);

    }
  }
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (double)timeToTarget
{
  return self->_timeToTarget;
}

- (double)timeToReset
{
  return self->_timeToReset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_engine);
}

- (uint64_t)activate
{
  return Phase::Controller::GroupManager::SetPreset(*(_QWORD *)(a1 + 8), *(void **)(a1 + 16), 0, 0);
}

- (uint64_t)activateWithTimeToTargetOverride:(uint64_t)a1
{

  return a1;
}

- (void)activateWithTimeToTargetOverride:(uint64_t)a1
{

  JUMPOUT(0x2199F9D70);
}

- (uint64_t)activateWithTimeToTargetOverride:
{
  return Phase::Controller::GroupManager::SetPreset(*(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), 1);
}

- (uint64_t)deactivate
{
  return Phase::Controller::GroupManager::SetPreset(*(_QWORD *)(a1 + 8), 0, 0, 0);
}

- (void)deactivateWithTimeToResetOverride:
{
  JUMPOUT(0x2199F9D70);
}

- (uint64_t)deactivateWithTimeToResetOverride:
{
  return Phase::Controller::GroupManager::SetPreset(*(_QWORD *)(a1 + 8), 0, *(_QWORD *)(a1 + 16), 1);
}

@end
