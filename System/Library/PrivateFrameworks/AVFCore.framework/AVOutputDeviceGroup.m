@implementation AVOutputDeviceGroup

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVOutputDeviceGroup)initWithOutputDeviceGroupImpl:(id)a3
{
  AVOutputDeviceGroup *v4;
  id v5;
  AVOutputDeviceGroup *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceGroup;
  v4 = -[AVOutputDeviceGroup init](&v8, sel_init);
  if (v4 && (v5 = a3, (v4->_impl = (AVOutputDeviceGroupImpl *)v5) != 0))
  {
    objc_msgSend(v5, "setParentOutputDeviceGroup:", v4);
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceGroup;
  -[AVOutputDeviceGroup dealloc](&v3, sel_dealloc);
}

- (id)impl
{
  return self->_impl;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(-[AVOutputDeviceGroup impl](self, "impl"), "isEqual:", objc_msgSend(a3, "impl"));
  else
    return 0;
}

- (unint64_t)hash
{
  return -[AVOutputDeviceGroupImpl hash](self->_impl, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v4), self);
}

- (BOOL)receivesLongFormAudioFromLocalDevice
{
  return -[AVOutputDeviceGroupImpl receivesLongFormAudioFromLocalDevice](self->_impl, "receivesLongFormAudioFromLocalDevice");
}

- (AVOutputDevice)groupLeader
{
  return (AVOutputDevice *)-[AVOutputDeviceGroupImpl groupLeader](self->_impl, "groupLeader");
}

- (NSArray)outputDevices
{
  return (NSArray *)-[AVOutputDeviceGroupImpl outputDevices](self->_impl, "outputDevices");
}

- (void)outputDeviceGroupImpl:(id)a3 didChangeOutputDevicesWithInitiator:(id)a4
{
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v9 = CFSTR("AVOutputDeviceGroupMembershipChangeInitiator");
    v10[0] = a4;
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  }
  else
  {
    v5 = 0;
  }
  if (dword_1EE2B02D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v7, v8), "postNotificationName:object:userInfo:", CFSTR("AVOutputDeviceGroupOutputDevicesDidChangeNotification"), self, v5);
}

- (void)addOutputDevice:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVOutputDeviceGroupImpl *impl;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  os_log_type_t type;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceGroupAddOutputDeviceOptionAuthorizationToken"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequiredKey"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputDeviceGroupAddOutputDeviceOptionInitiator"));
  if (dword_1EE2B02D0)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  impl = self->_impl;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__AVOutputDeviceGroup_addOutputDevice_withOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E3032AF8;
  v13[4] = a5;
  -[AVOutputDeviceGroupImpl addOutputDevice:withOptions:completionHandler:](impl, "addOutputDevice:withOptions:completionHandler:", a3, a4, v13, v11, v12);
}

uint64_t __69__AVOutputDeviceGroup_addOutputDevice_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;

  if (dword_1EE2B02D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)removeOutputDevice:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVOutputDeviceGroupImpl *impl;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  os_log_type_t type;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B02D0)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  impl = self->_impl;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__AVOutputDeviceGroup_removeOutputDevice_withOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E3032AF8;
  v13[4] = a5;
  -[AVOutputDeviceGroupImpl removeOutputDevice:withOptions:completionhandler:](impl, "removeOutputDevice:withOptions:completionhandler:", a3, a4, v13, v11, v12);
}

uint64_t __72__AVOutputDeviceGroup_removeOutputDevice_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;

  if (dword_1EE2B02D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (float)volume
{
  float result;

  -[AVOutputDeviceGroupImpl volume](self->_impl, "volume");
  return result;
}

- (void)outputDeviceGroupImplDidChangeVolume:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B02D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputDeviceGroupVolumeDidChangeNotification"), self);
}

- (void)setVolume:(float)a3
{
  -[AVOutputDeviceGroupImpl setVolume:](self->_impl, "setVolume:");
}

- (int64_t)volumeControlType
{
  return -[AVOutputDeviceGroupImpl volumeControlType](self->_impl, "volumeControlType");
}

- (void)outputDeviceGroupImplDidChangeVolumeControlType:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B02D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputDeviceGroupVolumeControlTypeDidChangeNotification"), self);
}

@end
