@implementation MXExclaves

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_24);
  return (id)sharedInstance_sSharedInstance_3;
}

MXExclaves *__28__MXExclaves_sharedInstance__block_invoke()
{
  MXExclaves *result;

  result = objc_alloc_init(MXExclaves);
  sharedInstance_sSharedInstance_3 = (uint64_t)result;
  return result;
}

+ (id)sensorStatusToString:(unsigned int)a3
{
  if (a3 - 1 >= 3)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%d)"), *(_QWORD *)&a3);
  else
    return off_1E309CDA8[a3 - 1];
}

- (MXExclaves)init
{
  MXExclaves *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)MXExclaves;
  v2 = -[MXExclaves init](&v5, sel_init);
  if (v2)
  {
    if (!CMSMDeviceState_DeviceHasExclaveCapability())
      goto LABEL_5;
    if (exclaves_sensor_create())
    {
      if (!dword_1EE2B3F38)
      {
LABEL_8:

        return 0;
      }
LABEL_5:
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_8;
    }
    v2->mSensorAccessCount = 0;
    v2->mSensorPortLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  mach_port_deallocate(*MEMORY[0x1E0C83DA0], self->mSensorPort);

  self->mSensorPortLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXExclaves;
  -[MXExclaves dealloc](&v3, sel_dealloc);
}

- (int)updateSensorStatus:(id)a3 reason:(id)a4
{
  NSLock **p_mSensorPortLock;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (objc_msgSend(a3, "isTheAssistant")
      && objc_msgSend(a3, "isUsingBuiltInMicForRecording"))
    {
      p_mSensorPortLock = &self->mSensorPortLock;
      -[NSLock lock](self->mSensorPortLock, "lock");
LABEL_13:
      if ((objc_msgSend(a3, "isUsingExclaveSensor") & 1) == 0)
      {
        if (exclaves_sensor_start())
          goto LABEL_10;
        ++self->mSensorAccessCount;
        objc_msgSend(a3, "setIsUsingExclaveSensor:", 1);
        if (dword_1EE2B3F38)
        {
LABEL_19:
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
LABEL_20:
      v10 = 0;
      goto LABEL_21;
    }
    if (objc_msgSend(a3, "isRecording") && !objc_msgSend(a3, "isRecordingMuted"))
    {
      v9 = -[MXSessionManager isSessionUsingBuiltInMic:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isSessionUsingBuiltInMic:", a3);
      p_mSensorPortLock = &self->mSensorPortLock;
      -[NSLock lock](self->mSensorPortLock, "lock");
      if (v9)
        goto LABEL_13;
    }
    else
    {
      p_mSensorPortLock = &self->mSensorPortLock;
      -[NSLock lock](self->mSensorPortLock, "lock");
    }
    if (objc_msgSend(a3, "isUsingExclaveSensor"))
    {
      if (exclaves_sensor_stop())
      {
LABEL_10:
        v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v10 = -15685;
LABEL_21:
        -[NSLock unlock](*p_mSensorPortLock, "unlock", v13, v14);
        return v10;
      }
      --self->mSensorAccessCount;
      objc_msgSend(a3, "setIsUsingExclaveSensor:", 0);
      if (dword_1EE2B3F38)
        goto LABEL_19;
    }
    goto LABEL_20;
  }
  v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return -12981;
}

- (void)logDebugInfo
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->mSensorPortLock, "lock");
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (exclaves_sensor_status() || dword_1EE2B3F38)
  {
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EE2B3F38)
    {
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1EE2B3F38)
      {
        v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  -[NSLock unlock](self->mSensorPortLock, "unlock", v7, v8);
}

- (unsigned)getSensorAccessCount
{
  return self->mSensorAccessCount;
}

@end
