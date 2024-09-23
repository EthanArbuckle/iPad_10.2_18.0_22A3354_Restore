@implementation IOHIDEventSystemConnectionScheduleAsync

void ___IOHIDEventSystemConnectionScheduleAsync_block_invoke_3(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 120));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___IOHIDEventSystemConnectionScheduleAsync_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  int v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v1 + 448))
  {
    v2 = iohideventsystem_client_refresh(*(_DWORD *)(v1 + 40), 144);
    v3 = _IOHIDLogCategory(9u);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(v1 + 168);
      v5 = 136315394;
      v6 = v4;
      v7 = 1024;
      v8 = v2;
      _os_log_impl(&dword_18AAAF000, v3, OS_LOG_TYPE_DEFAULT, "%s: Sent client refresh msg, status:%#x", (uint8_t *)&v5, 0x12u);
    }
    __IOHIDEventSystemConnectionCheckServerStatus(v2, v1);
  }
}

@end
