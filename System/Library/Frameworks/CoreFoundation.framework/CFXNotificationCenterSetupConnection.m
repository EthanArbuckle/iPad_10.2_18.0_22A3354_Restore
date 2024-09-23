@implementation CFXNotificationCenterSetupConnection

void ____CFXNotificationCenterSetupConnection_block_invoke(uint64_t a1, id a2)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *string;
  uint64_t uint64;
  const char *v17;
  size_t v18;
  __CFString *v19;
  const char *v20;
  const char *v21;
  size_t v22;
  xpc_object_t value;
  void *v24;
  const UInt8 *bytes_ptr;
  size_t length;
  const __CFData *v27;
  CFPropertyListRef v28;

  if (object_getClass(a2) == (Class)MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(a2, "method");
    if (string && !strcmp("post_token", string) && xpc_dictionary_get_uint64(a2, "version") == 1)
    {
      uint64 = xpc_dictionary_get_uint64(a2, "token");
      v17 = xpc_dictionary_get_string(a2, "name");
      v18 = strlen(v17);
      v19 = (__CFString *)CFStringCreateWithBytes((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)v17, v18, 0x8000100u, 0);
      v20 = xpc_dictionary_get_string(a2, "object");
      v21 = v20;
      if (v20)
      {
        if (!strcmp(v20, "kCFNotificationAnyObject"))
        {
          v21 = 0;
        }
        else
        {
          v22 = strlen(v21);
          v21 = (const char *)CFStringCreateWithBytes((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)v21, v22, 0x8000100u, 0);
        }
      }
      value = xpc_dictionary_get_value(a2, "userinfo");
      if (value)
      {
        v24 = value;
        bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(value);
        length = xpc_data_get_length(v24);
        v27 = CFDataCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, bytes_ptr, length);
        v28 = CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v27, 0, 0, 0);
        CFRelease(v27);
        __CFXNotificationPostToken(*(uint64_t **)(a1 + 32), uint64, v19, (uint64_t)v21, (uint64_t)v28);
        if (v28)
          CFRelease(v28);
      }
      else
      {
        __CFXNotificationPostToken(*(uint64_t **)(a1 + 32), uint64, v19, (uint64_t)v21, 0);
      }
      if (v21)
        CFRelease(v21);
      CFRelease(v19);
    }
  }
  else if (object_getClass(a2) == (Class)MEMORY[0x1E0C81310])
  {
    if (a2 != (id)MEMORY[0x1E0C81288] && a2 != (id)MEMORY[0x1E0C81260] && a2 != (id)MEMORY[0x1E0C81258])
    {
      v6 = MEMORY[0x186DB1518](a2);
      v13 = (void *)v6;
      v14 = "(null)";
      if (v6)
        LOWORD(v14) = v6;
      CFLog(3, (uint64_t)CFSTR("Unknown or mysterious error received: %s"), v7, v8, v9, v10, v11, v12, (__int16)v14);
      if (v13)
        free(v13);
    }
  }
  else
  {
    __break(1u);
  }
}

@end
