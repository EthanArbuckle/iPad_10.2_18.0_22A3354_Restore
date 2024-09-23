@implementation PHASEGroup

- (NSString)uid
{
  return self->_identifier;
}

- (PHASEGroup)init
{
  -[PHASEGroup doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEGroup)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEGroup)initWithIdentifier:(NSString *)identifier
{
  NSString *v5;
  PHASEGroup *v6;
  PHASEGroup *v7;
  NSString *v8;
  objc_super v15;

  v5 = identifier;
  v15.receiver = self;
  v15.super_class = (Class)PHASEGroup;
  v6 = -[PHASEGroup init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, identifier);
    v7->_hashId = Phase::GetStringHashId((Phase *)v5, v8);
    *(_WORD *)&v7->_muted = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v7->_gain = _Q0;
    *(_OWORD *)&v7->_gainLowFrequency = _Q0;
    objc_storeWeak((id *)&v7->_engine, 0);
  }

  return v7;
}

- (PHASEGroup)initWithEngine:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  PHASEGroup *v8;
  PHASEGroup *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[PHASEGroup initWithIdentifier:](self, "initWithIdentifier:", v7);
  v9 = v8;
  if (v8)
    -[PHASEGroup registerWithEngine:](v8, "registerWithEngine:", v6);

  return v9;
}

- (void)registerWithEngine:(PHASEEngine *)engine
{
  PHASEEngine *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  PHASEGroup *v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
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
  v4 = engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Trying to register a group with an invalid engine"));
  }
  else
  {
    -[PHASEEngine groups](v4, "groups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", self->_identifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Group %@ already exists"), self->_identifier);
    }
    else
    {
      v8 = objc_loadWeakRetained((id *)&self->_engine);

      if (!v8)
      {
        objc_storeWeak((id *)&self->_engine, v4);
        v9 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)(-[PHASEEngine implementation](v4, "implementation") + 48), 10);
        v10 = self;
        v11 = **(_QWORD **)(v9 + 8);
        v18 = 0;
        v17 = 1;
        v12 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v11, 24, &v18, &v17);
        if (!v12)
        {
          InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
          Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
          v15 = objc_retainAutorelease(**(id **)(v11 + 48));
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "CommandQueue.hpp";
            v21 = 1024;
            v22 = 100;
            _os_log_impl(&dword_2164CC000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; b"
              "uffer is full, unable to grow.\",
              buf,
              0x12u);
          }
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
        }
        if (v17)
        {
          v13 = objc_retainAutorelease(**(id **)(v11 + 48));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v20 = "CommandQueue.hpp";
            v21 = 1024;
            v22 = 89;
            v23 = 2048;
            v24 = v18;
            v25 = 2048;
            v26 = 24;
            _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
          }
        }
        *v12 = &off_24D57F560;
        v12[1] = v9;
        v12[2] = v10;
        Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v11, 24);
        atomic_store(0, (unsigned __int8 *)(v11 + 40));

      }
      -[PHASEEngine addGroup:](v4, "addGroup:", self);
    }
  }

}

- (void)unregisterFromEngine
{
  JUMPOUT(0x2199F9D70);
}

- (void)fadeGain:(double)gain duration:(double)duration curveType:(PHASECurveType)curveType
{
  id WeakRetained;
  objc_class *v11;
  void *v12;
  void *v13;
  double v14;
  objc_class *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  unint64_t hashId;
  uint64_t v21;
  double *v22;
  NSObject *v23;
  Phase::Logger *InstancePtr;
  NSObject *v25;
  std::runtime_error *exception;
  BOOL v27;
  unint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PHASEGetPropertyBounded<double>(v12, v13, gain, 0.0, 1.0);

    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = PHASEGetPropertyBounded<double>(v16, v17, duration, 0.0, 1.79769313e308);

    v19 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)(objc_msgSend(WeakRetained, "implementation") + 48), 10);
    hashId = self->_hashId;
    v21 = **(_QWORD **)(v19 + 8);
    v28 = 0;
    v27 = 1;
    v22 = (double *)Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v21, 48, &v28, &v27);
    if (!v22)
    {
      InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v25 = objc_retainAutorelease(**(id **)(v21 + 48));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "CommandQueue.hpp";
        v31 = 1024;
        v32 = 100;
        _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v27)
    {
      v23 = objc_retainAutorelease(**(id **)(v21 + 48));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v30 = "CommandQueue.hpp";
        v31 = 1024;
        v32 = 89;
        v33 = 2048;
        v34 = v28;
        v35 = 2048;
        v36 = 48;
        _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(_QWORD *)v22 = &off_24D57F5B0;
    *((_QWORD *)v22 + 1) = v19;
    *((_QWORD *)v22 + 2) = hashId;
    v22[3] = v14;
    v22[4] = v18;
    *((_QWORD *)v22 + 5) = curveType;
    Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v21, 48);
    atomic_store(0, (unsigned __int8 *)(v21 + 40));
    self->_gain = v14;
  }

}

- (void)fadeGainHighFrequency:(double)a3 duration:(double)a4 curveType:(int64_t)a5
{
  id WeakRetained;
  objc_class *v11;
  void *v12;
  void *v13;
  double v14;
  objc_class *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  unint64_t hashId;
  uint64_t v21;
  double *v22;
  NSObject *v23;
  Phase::Logger *InstancePtr;
  NSObject *v25;
  std::runtime_error *exception;
  BOOL v27;
  unint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PHASEGetPropertyBounded<double>(v12, v13, a3, 0.0, 1.0);

    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = PHASEGetPropertyBounded<double>(v16, v17, a4, 0.0, 1.79769313e308);

    v19 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)(objc_msgSend(WeakRetained, "implementation") + 48), 10);
    hashId = self->_hashId;
    v21 = **(_QWORD **)(v19 + 8);
    v28 = 0;
    v27 = 1;
    v22 = (double *)Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v21, 48, &v28, &v27);
    if (!v22)
    {
      InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v25 = objc_retainAutorelease(**(id **)(v21 + 48));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "CommandQueue.hpp";
        v31 = 1024;
        v32 = 100;
        _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v27)
    {
      v23 = objc_retainAutorelease(**(id **)(v21 + 48));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v30 = "CommandQueue.hpp";
        v31 = 1024;
        v32 = 89;
        v33 = 2048;
        v34 = v28;
        v35 = 2048;
        v36 = 48;
        _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(_QWORD *)v22 = &off_24D57F5D8;
    *((_QWORD *)v22 + 1) = v19;
    *((_QWORD *)v22 + 2) = hashId;
    v22[3] = v14;
    v22[4] = v18;
    *((_QWORD *)v22 + 5) = a5;
    Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v21, 48);
    atomic_store(0, (unsigned __int8 *)(v21 + 40));
    self->_gainHighFrequency = v14;
  }

}

- (void)fadeGainLowFrequency:(double)a3 duration:(double)a4 curveType:(int64_t)a5
{
  id WeakRetained;
  objc_class *v11;
  void *v12;
  void *v13;
  double v14;
  objc_class *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  unint64_t hashId;
  uint64_t v21;
  double *v22;
  NSObject *v23;
  Phase::Logger *InstancePtr;
  NSObject *v25;
  std::runtime_error *exception;
  BOOL v27;
  unint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PHASEGetPropertyBounded<double>(v12, v13, a3, 0.0, 1.0);

    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = PHASEGetPropertyBounded<double>(v16, v17, a4, 0.0, 1.79769313e308);

    v19 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)(objc_msgSend(WeakRetained, "implementation") + 48), 10);
    hashId = self->_hashId;
    v21 = **(_QWORD **)(v19 + 8);
    v28 = 0;
    v27 = 1;
    v22 = (double *)Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v21, 48, &v28, &v27);
    if (!v22)
    {
      InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v25 = objc_retainAutorelease(**(id **)(v21 + 48));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "CommandQueue.hpp";
        v31 = 1024;
        v32 = 100;
        _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v27)
    {
      v23 = objc_retainAutorelease(**(id **)(v21 + 48));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v30 = "CommandQueue.hpp";
        v31 = 1024;
        v32 = 89;
        v33 = 2048;
        v34 = v28;
        v35 = 2048;
        v36 = 48;
        _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(_QWORD *)v22 = &off_24D57F600;
    *((_QWORD *)v22 + 1) = v19;
    *((_QWORD *)v22 + 2) = hashId;
    v22[3] = v14;
    v22[4] = v18;
    *((_QWORD *)v22 + 5) = a5;
    Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v21, 48);
    atomic_store(0, (unsigned __int8 *)(v21 + 40));
    self->_gainLowFrequency = v14;
  }

}

- (void)fadeRate:(double)rate duration:(double)duration curveType:(PHASECurveType)curveType
{
  id WeakRetained;
  objc_class *v11;
  void *v12;
  void *v13;
  double v14;
  objc_class *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  unint64_t hashId;
  uint64_t v21;
  double *v22;
  NSObject *v23;
  Phase::Logger *InstancePtr;
  NSObject *v25;
  std::runtime_error *exception;
  BOOL v27;
  unint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PHASEGetPropertyBounded<double>(v12, v13, rate, 0.25, 4.0);

    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = PHASEGetPropertyBounded<double>(v16, v17, duration, 0.0, 1.79769313e308);

    v19 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)(objc_msgSend(WeakRetained, "implementation") + 48), 10);
    hashId = self->_hashId;
    v21 = **(_QWORD **)(v19 + 8);
    v28 = 0;
    v27 = 1;
    v22 = (double *)Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v21, 48, &v28, &v27);
    if (!v22)
    {
      InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v25 = objc_retainAutorelease(**(id **)(v21 + 48));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "CommandQueue.hpp";
        v31 = 1024;
        v32 = 100;
        _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v27)
    {
      v23 = objc_retainAutorelease(**(id **)(v21 + 48));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v30 = "CommandQueue.hpp";
        v31 = 1024;
        v32 = 89;
        v33 = 2048;
        v34 = v28;
        v35 = 2048;
        v36 = 48;
        _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(_QWORD *)v22 = &off_24D57F628;
    *((_QWORD *)v22 + 1) = v19;
    *((_QWORD *)v22 + 2) = hashId;
    v22[3] = v14;
    v22[4] = v18;
    *((_QWORD *)v22 + 5) = curveType;
    Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v21, 48);
    atomic_store(0, (unsigned __int8 *)(v21 + 40));
    self->_rate = v14;
  }

}

- (void)mute
{
  JUMPOUT(0x2199F9D70);
}

- (void)unmute
{
  JUMPOUT(0x2199F9D70);
}

- (void)solo
{
  JUMPOUT(0x2199F9D70);
}

- (void)unsolo
{
  JUMPOUT(0x2199F9D70);
}

- (double)gain
{
  return self->_gain;
}

- (double)gainHF
{
  return self->_gainHighFrequency;
}

- (double)gainLF
{
  return self->_gainLowFrequency;
}

- (double)rate
{
  return self->_rate;
}

- (void)setGain:(double)gain
{
  -[PHASEGroup fadeGain:duration:curveType:](self, "fadeGain:duration:curveType:", 1668435054, gain, 0.0);
}

- (void)setGainHighFrequency:(double)a3
{
  -[PHASEGroup fadeGainHighFrequency:duration:curveType:](self, "fadeGainHighFrequency:duration:curveType:", 1668435054, a3, 0.0);
}

- (void)setGainLowFrequency:(double)a3
{
  -[PHASEGroup fadeGainLowFrequency:duration:curveType:](self, "fadeGainLowFrequency:duration:curveType:", 1668435054, a3, 0.0);
}

- (void)setRate:(double)rate
{
  -[PHASEGroup fadeRate:duration:curveType:](self, "fadeRate:duration:curveType:", 1668435054, rate, 0.0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (BOOL)isSoloed
{
  return self->_isSoloed;
}

- (double)gainHighFrequency
{
  return self->_gainHighFrequency;
}

- (double)gainLowFrequency
{
  return self->_gainLowFrequency;
}

- (PHASEEngine)engine
{
  return (PHASEEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (void)setEngine:(id)a3
{
  objc_storeWeak((id *)&self->_engine, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (uint64_t)registerWithEngine:(uint64_t)a1
{

  return a1;
}

- (void)registerWithEngine:(uint64_t)a1
{

  JUMPOUT(0x2199F9D70);
}

- (uint64_t)registerWithEngine:
{
  return Phase::Controller::GroupManager::AddGroup(*(Phase::Controller::GroupManager **)(a1 + 8), *(PHASEGroup **)(a1 + 16));
}

- (uint64_t)unregisterFromEngine
{
  uint64_t v1;
  unint64_t v3;

  v1 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  return std::__hash_table<std::__hash_value_type<unsigned long long,Phase::Controller::Group>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Phase::Controller::Group>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Phase::Controller::Group>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,Phase::Controller::Group>>>::__erase_unique<unsigned long long>((_QWORD *)(v1 + 40), &v3);
}

- (void)fadeGain:duration:curveType:
{
  JUMPOUT(0x2199F9D70);
}

- (_QWORD)fadeGain:duration:curveType:
{
  return Phase::Controller::GroupManager::SetGain(*(Phase::Controller::GroupManager **)(a1 + 8), *(_QWORD *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), *(Phase::Logger **)(a1 + 40));
}

- (void)fadeGainHighFrequency:duration:curveType:
{
  JUMPOUT(0x2199F9D70);
}

- (_QWORD)fadeGainHighFrequency:duration:curveType:
{
  return Phase::Controller::GroupManager::SetGainHighFreq(*(Phase::Controller::GroupManager **)(a1 + 8), *(_QWORD *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), *(Phase::Logger **)(a1 + 40));
}

- (void)fadeGainLowFrequency:duration:curveType:
{
  JUMPOUT(0x2199F9D70);
}

- (_QWORD)fadeGainLowFrequency:duration:curveType:
{
  return Phase::Controller::GroupManager::SetGainLowFreq(*(Phase::Controller::GroupManager **)(a1 + 8), *(_QWORD *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), *(Phase::Logger **)(a1 + 40));
}

- (void)fadeRate:duration:curveType:
{
  JUMPOUT(0x2199F9D70);
}

- (_QWORD)fadeRate:duration:curveType:
{
  return Phase::Controller::GroupManager::SetRate(*(Phase::Controller::GroupManager **)(a1 + 8), *(_QWORD *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), *(Phase::Logger **)(a1 + 40));
}

- (_QWORD)mute
{
  uint64_t v1;
  _QWORD *result;
  unint64_t v3;

  v1 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  result = std::__hash_table<std::__hash_value_type<unsigned long long,int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,int>>>::find<unsigned long long>((_QWORD *)(v1 + 40), &v3);
  if (result)
    *((_BYTE *)result + 448) = 1;
  return result;
}

- (_QWORD)unmute
{
  uint64_t v1;
  _QWORD *result;
  unint64_t v3;

  v1 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  result = std::__hash_table<std::__hash_value_type<unsigned long long,int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,int>>>::find<unsigned long long>((_QWORD *)(v1 + 40), &v3);
  if (result)
    *((_BYTE *)result + 448) = 0;
  return result;
}

- (_QWORD)solo
{
  uint64_t v1;
  _QWORD *result;
  unint64_t v3;

  v1 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  result = std::__hash_table<std::__hash_value_type<unsigned long long,int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,int>>>::find<unsigned long long>((_QWORD *)(v1 + 40), &v3);
  if (result)
    *((_BYTE *)result + 449) = 1;
  return result;
}

- (_QWORD)unsolo
{
  uint64_t v1;
  _QWORD *result;
  unint64_t v3;

  v1 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  result = std::__hash_table<std::__hash_value_type<unsigned long long,int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,int>>>::find<unsigned long long>((_QWORD *)(v1 + 40), &v3);
  if (result)
    *((_BYTE *)result + 449) = 0;
  return result;
}

@end
