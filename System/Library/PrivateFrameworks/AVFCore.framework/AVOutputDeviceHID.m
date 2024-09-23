@implementation AVOutputDeviceHID

- (AVOutputDeviceHID)initWithUUID:(id)a3 screenUUID:(id)a4 endpoint:(OpaqueFigEndpoint *)a5
{
  id v8;
  CFTypeRef v9;
  CFTypeRef v10;
  uint64_t v11;
  void (*v12)(CFTypeRef, uint64_t, _QWORD, CFTypeRef *);
  AVOutputDeviceHID *v13;
  CFTypeRef cf;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVOutputDeviceHID;
  v8 = -[AVOutputDeviceHID init](&v16, sel_init);
  if (v8)
  {
    *((_QWORD *)v8 + 1) = objc_msgSend(a3, "copy");
    *((_QWORD *)v8 + 2) = objc_msgSend(a4, "copy");
    if (a5)
    {
      v9 = CFRetain(a5);
      *((_QWORD *)v8 + 4) = v9;
      cf = 0;
      if (v9)
      {
        v10 = v9;
        FigEndpointExtendedGetClassID();
        if (CMBaseObjectIsMemberOfClass())
        {
          v11 = *((_QWORD *)v8 + 1);
          v12 = *(void (**)(CFTypeRef, uint64_t, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24)
                                                                               + 64);
          if (v12)
            v12(v10, v11, *MEMORY[0x1E0C9AE00], &cf);
        }
      }
    }
    else
    {
      *((_QWORD *)v8 + 4) = 0;
      cf = 0;
    }
    *((_QWORD *)v8 + 3) = objc_msgSend(*((id *)v8 + 3), "integerValue");
    if (cf)
      CFRelease(cf);
    v13 = (AVOutputDeviceHID *)v8;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  OpaqueFigEndpoint *endpoint;
  objc_super v4;

  endpoint = self->_endpoint;
  if (endpoint)
    CFRelease(endpoint);
  v4.receiver = self;
  v4.super_class = (Class)AVOutputDeviceHID;
  -[AVOutputDeviceHID dealloc](&v4, sel_dealloc);
}

- (int64_t)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(int64_t)a3
{
  OpaqueFigEndpoint *endpoint;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSString *UUID;
  unsigned int (*v9)(OpaqueFigEndpoint *, NSString *, uint64_t);

  endpoint = self->_endpoint;
  if (endpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
      if (dword_1ECDECED8)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      UUID = self->_UUID;
      v9 = *(unsigned int (**)(OpaqueFigEndpoint *, NSString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 24)
                                                                                   + 56);
      if (v9)
      {
        if (!v9(endpoint, UUID, v6))
          self->_inputMode = a3;
      }
    }
  }
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)screenID
{
  return self->_screenID;
}

@end
