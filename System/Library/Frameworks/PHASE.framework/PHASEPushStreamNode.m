@implementation PHASEPushStreamNode

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer
{
  AVAudioPCMBuffer *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  AVAudioPCMBuffer *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
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
  v4 = buffer;
  -[PHASEStreamNode engine](self, "engine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(v5, "implementation") + 48), 7);

  v7 = -[PHASEStreamNode actionTreeUniqueId](self, "actionTreeUniqueId");
  v9 = v8;
  v10 = -[PHASEStreamNode nodeUID](self, "nodeUID");
  v11 = v4;
  v12 = **(_QWORD **)(v6 + 8);
  v19 = 0;
  v18 = 1;
  v13 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v12, 48, &v19, &v18);
  if (!v13)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v16 = objc_retainAutorelease(**(id **)(v12 + 48));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "CommandQueue.hpp";
      v22 = 1024;
      v23 = 100;
      _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v18)
  {
    v14 = objc_retainAutorelease(**(id **)(v12 + 48));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "CommandQueue.hpp";
      v22 = 1024;
      v23 = 89;
      v24 = 2048;
      v25 = v19;
      v26 = 2048;
      v27 = 48;
      _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *v13 = &off_24D57FBE8;
  v13[1] = v6;
  v13[2] = v7;
  v13[3] = v9;
  v13[4] = v10;
  v13[5] = v11;
  Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v12, 48);
  atomic_store(0, (unsigned __int8 *)(v12 + 40));

}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer completionCallbackType:(PHASEPushStreamCompletionCallbackCondition)completionCallbackType completionHandler:(void *)completionHandler
{
  AVAudioPCMBuffer *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  AVAudioPCMBuffer *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  Phase::Logger *InstancePtr;
  NSObject *v21;
  std::runtime_error *exception;
  void *v23;
  BOOL v24;
  unint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = buffer;
  v23 = completionHandler;
  -[PHASEStreamNode engine](self, "engine", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(v9, "implementation") + 48), 7);

  v11 = -[PHASEStreamNode actionTreeUniqueId](self, "actionTreeUniqueId");
  v13 = v12;
  v14 = -[PHASEStreamNode nodeUID](self, "nodeUID");
  v15 = v8;
  v16 = _Block_copy(v23);
  v17 = **(_QWORD **)(v10 + 8);
  v25 = 0;
  v24 = 1;
  v18 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v17, 64, &v25, &v24);
  if (!v18)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v21 = objc_retainAutorelease(**(id **)(v17 + 48));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "CommandQueue.hpp";
      v28 = 1024;
      v29 = 100;
      _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v24)
  {
    v19 = objc_retainAutorelease(**(id **)(v17 + 48));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "CommandQueue.hpp";
      v28 = 1024;
      v29 = 89;
      v30 = 2048;
      v31 = v25;
      v32 = 2048;
      v33 = 64;
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *v18 = &off_24D57FC10;
  v18[1] = v10;
  v18[2] = v11;
  v18[3] = v13;
  v18[4] = v14;
  v18[5] = v15;
  v18[6] = completionCallbackType;
  v18[7] = v16;
  Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v17, 64);
  atomic_store(0, (unsigned __int8 *)(v17 + 40));

}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(PHASEPushStreamBufferOptions)options
{
  AVAudioPCMBuffer *v8;
  AVAudioTime *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  AVAudioPCMBuffer *v16;
  AVAudioTime *v17;
  uint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  Phase::Logger *InstancePtr;
  NSObject *v22;
  std::runtime_error *exception;
  BOOL v24;
  unint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = buffer;
  v9 = when;
  -[PHASEStreamNode engine](self, "engine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(v10, "implementation") + 48), 7);

  v12 = -[PHASEStreamNode actionTreeUniqueId](self, "actionTreeUniqueId");
  v14 = v13;
  v15 = -[PHASEStreamNode nodeUID](self, "nodeUID");
  v16 = v8;
  v17 = v9;
  v18 = **(_QWORD **)(v11 + 8);
  v25 = 0;
  v24 = 1;
  v19 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v18, 64, &v25, &v24);
  if (!v19)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v22 = objc_retainAutorelease(**(id **)(v18 + 48));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "CommandQueue.hpp";
      v28 = 1024;
      v29 = 100;
      _os_log_impl(&dword_2164CC000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v24)
  {
    v20 = objc_retainAutorelease(**(id **)(v18 + 48));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "CommandQueue.hpp";
      v28 = 1024;
      v29 = 89;
      v30 = 2048;
      v31 = v25;
      v32 = 2048;
      v33 = 64;
      _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *v19 = &off_24D57FC38;
  v19[1] = v11;
  v19[2] = v12;
  v19[3] = v14;
  v19[4] = v15;
  v19[5] = v16;
  v19[6] = v17;
  v19[7] = options;
  Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v18, 64);
  atomic_store(0, (unsigned __int8 *)(v18 + 40));

}

- (void)scheduleBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)when options:(PHASEPushStreamBufferOptions)options completionCallbackType:(PHASEPushStreamCompletionCallbackCondition)completionCallbackType completionHandler:(void *)completionHandler
{
  AVAudioPCMBuffer *v12;
  AVAudioTime *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  AVAudioPCMBuffer *v18;
  AVAudioTime *v19;
  void *v20;
  uint64_t v21;
  _DWORD *v22;
  NSObject *v23;
  Phase::Logger *InstancePtr;
  NSObject *v25;
  std::runtime_error *exception;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  BOOL v30;
  unint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v12 = buffer;
  v13 = when;
  v14 = completionHandler;
  -[PHASEStreamNode engine](self, "engine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(v15, "implementation") + 48), 7);

  *(_QWORD *)&v27 = v16;
  *((_QWORD *)&v27 + 1) = -[PHASEStreamNode actionTreeUniqueId](self, "actionTreeUniqueId");
  *(_QWORD *)&v28 = v17;
  *((_QWORD *)&v28 + 1) = -[PHASEStreamNode nodeUID](self, "nodeUID");
  v18 = v12;
  v19 = v13;
  *(_QWORD *)&v29 = options;
  *((_QWORD *)&v29 + 1) = completionCallbackType;
  v20 = _Block_copy(v14);
  v21 = **(_QWORD **)(v16 + 8);
  v31 = 0;
  v30 = 1;
  v22 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v21, 80, &v31, &v30);
  if (!v22)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v25 = objc_retainAutorelease(**(id **)(v21 + 48));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "CommandQueue.hpp";
      v34 = 1024;
      v35 = 100;
      _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v30)
  {
    v23 = objc_retainAutorelease(**(id **)(v21 + 48));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "CommandQueue.hpp";
      v34 = 1024;
      v35 = 89;
      v36 = 2048;
      v37 = v31;
      v38 = 2048;
      v39 = 80;
      _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *(_QWORD *)v22 = &off_24D57FC60;
  *(_OWORD *)(v22 + 6) = v28;
  *(_OWORD *)(v22 + 2) = v27;
  *((_QWORD *)v22 + 5) = v18;
  *((_QWORD *)v22 + 6) = v19;
  *(_OWORD *)(v22 + 14) = v29;
  *((_QWORD *)v22 + 9) = v20;
  Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v21, 80);
  atomic_store(0, (unsigned __int8 *)(v21 + 40));

}

- (id)scheduleBuffer:(id *)a1 atTime:options:completionCallbackType:completionHandler:
{

  return a1;
}

- (uint64_t)scheduleBuffer:(uint64_t)a1
{

  return a1;
}

- (void)scheduleBuffer:(uint64_t)a1
{

  JUMPOUT(0x2199F9D70);
}

- (uint64_t)scheduleBuffer:
{
  return Phase::ActionTreeManager::ScheduleBuffer(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0, 1uLL, 0, 0);
}

- (uint64_t)scheduleBuffer:(uint64_t)a1 completionCallbackType:completionHandler:
{

  return a1;
}

- (void)scheduleBuffer:(uint64_t)a1 completionCallbackType:completionHandler:
{

  JUMPOUT(0x2199F9D70);
}

- (uint64_t)scheduleBuffer:completionCallbackType:completionHandler:
{
  return Phase::ActionTreeManager::ScheduleBuffer(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0, 1uLL, *(_QWORD *)(a1 + 48), *(void **)(a1 + 56));
}

- (uint64_t)scheduleBuffer:(uint64_t)a1 atTime:options:
{

  return a1;
}

- (void)scheduleBuffer:(uint64_t)a1 atTime:options:
{

  JUMPOUT(0x2199F9D70);
}

- (uint64_t)scheduleBuffer:atTime:options:
{
  return Phase::ActionTreeManager::ScheduleBuffer(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56), 0, 0);
}

- (void)scheduleBuffer:(id *)a1 atTime:options:completionCallbackType:completionHandler:
{

  JUMPOUT(0x2199F9D70);
}

- (uint64_t)scheduleBuffer:atTime:options:completionCallbackType:completionHandler:
{
  return Phase::ActionTreeManager::ScheduleBuffer(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(void **)(a1 + 72));
}

@end
