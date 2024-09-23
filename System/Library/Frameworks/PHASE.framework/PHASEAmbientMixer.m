@implementation PHASEAmbientMixer

- (PHASEAmbientMixer)init
{
  -[PHASEAmbientMixer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEAmbientMixer)initWithIdentifier:(uint64_t)a3 listener:(void *)a4 inputChannelLayout:(void *)a5 orientation:(void *)a6 engine:(void *)a7 actionTreeObjectId:(unint64_t)a8
{
  Phase *v15;
  id v16;
  id v17;
  id v18;
  PHASEAmbientMixer *v19;
  PHASEAmbientMixer *v20;
  NSString *v21;
  PHASEAmbientMixer *v22;
  objc_super v25;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v25.receiver = a1;
  v25.super_class = (Class)PHASEAmbientMixer;
  v19 = -[PHASEMixer initWithIdentifier:](&v25, sel_initWithIdentifier_, v15);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_listener, a5);
    objc_storeStrong((id *)&v20->_inputChannelLayout, a6);
    *(__n128 *)&v20[1].super.super.isa = a2;
    v20->_actionTreeManager = (void *)Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(v18, "implementation") + 48), 7);
    v20->_submixHashName = Phase::GetStringHashId(v15, v21);
    v20->_actionTreeObjectId.mStorage[0] = a8;
    v20->_actionTreeObjectId.mStorage[1] = a9;
    v22 = v20;
  }

  return v20;
}

- (void)setOrientation:(uint64_t)a1
{
  float v2;
  float v3;
  float v4;
  float v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  NSObject *v11;
  Phase::Logger *InstancePtr;
  NSObject *v13;
  std::runtime_error *exception;
  BOOL v16;
  unint64_t v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = a2.f32[1];
  v3 = a2.f32[2];
  v4 = a2.f32[3];
  v5 = 1.0
     - sqrtf(vmuls_lane_f32(a2.f32[3], a2, 3)+ (float)(vmuls_lane_f32(a2.f32[2], a2, 2)+ (float)(vmulq_f32(a2, a2).f32[0] + vmuls_lane_f32(a2.f32[1], *(float32x2_t *)a2.f32, 1))));
  if (v5 < 0.0)
    v5 = -v5;
  if (v5 <= 0.1)
  {
    *(float32x4_t *)(a1 + 96) = a2;
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 72);
    v18 = *(_OWORD *)(a1 + 56);
    v9 = **(_QWORD **)(v7 + 8);
    v17 = 0;
    v16 = 1;
    v10 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v9, 64, &v17, &v16);
    if (!v10)
    {
      InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v13 = objc_retainAutorelease(**(id **)(v9 + 48));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "CommandQueue.hpp";
        v21 = 1024;
        v22 = 100;
        _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v16)
    {
      v11 = objc_retainAutorelease(**(id **)(v9 + 48));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v20 = "CommandQueue.hpp";
        v21 = 1024;
        v22 = 89;
        v23 = 2048;
        v24 = *(double *)&v17;
        v25 = 2048;
        v26 = 64;
        _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(_QWORD *)v10 = &off_24D57F7B0;
    *((_QWORD *)v10 + 2) = v7;
    *(_OWORD *)(v10 + 6) = v18;
    *((_QWORD *)v10 + 5) = v8;
    *((float32x4_t *)v10 + 3) = a2;
    Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v9, 64);
    atomic_store(0, (unsigned __int8 *)(v9 + 40));
  }
  else
  {
    v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)a1) + 432));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v20 = "PHASEMixer.mm";
      v21 = 1024;
      v22 = 576;
      v23 = 2048;
      v24 = a2.f32[0];
      v25 = 2048;
      *(double *)&v26 = v2;
      v27 = 2048;
      v28 = v3;
      v29 = 2048;
      v30 = v4;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to initialize Ambient Mixer: orientation [%f, %f, %f, %f] must be normalized", buf, 0x3Au);
    }
  }
}

- (PHASEListener)listener
{
  return self->_listener;
}

- (__n128)orientation
{
  return a1[6];
}

- (AVAudioChannelLayout)inputChannelLayout
{
  return self->_inputChannelLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputChannelLayout, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)setOrientation:
{
  JUMPOUT(0x2199F9D70);
}

- (_QWORD)setOrientation:
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 16);
  v1 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 48);
  return Phase::ActionTreeManager::SetAmbientOrientation(v2, v1, v3, v4, &v6);
}

@end
