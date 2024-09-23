@implementation SCNetworkReachabilityCopyResolvedAddress

uint64_t __SCNetworkReachabilityCopyResolvedAddress_block_invoke(uint64_t a1, int a2, nw_endpoint_t endpoint)
{
  nw_endpoint_type_t type;
  nw_endpoint_type_t v6;
  const sockaddr *address;
  const __CFString *v8;
  const char *hostname;
  const __CFAllocator *v10;
  const __CFString *v11;
  __CFString *MutableCopy;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  _DWORD *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  type = nw_endpoint_get_type(endpoint);
  if (type == nw_endpoint_type_host)
  {
    hostname = nw_endpoint_get_hostname(endpoint);
    if (hostname)
    {
      v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v11 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], hostname, 0x600u);
      if (v11)
      {
        v8 = v11;
        if (CFStringHasPrefix(v11, CFSTR(".")) || CFStringHasSuffix(v8, CFSTR(".")))
        {
          MutableCopy = CFStringCreateMutableCopy(v10, 0, v8);
          CFRelease(v8);
          CFStringTrim(MutableCopy, CFSTR("."));
          v8 = MutableCopy;
        }
        goto LABEL_10;
      }
      v25 = __log_SCNetworkReachability_log;
      if (!__log_SCNetworkReachability_log)
      {
        v25 = os_log_create("com.apple.SystemConfiguration", "SCNetworkReachability");
        __log_SCNetworkReachability_log = (uint64_t)v25;
      }
      v26 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v25, (os_log_type_t)v26))
      {
LABEL_26:
        v27 = _os_log_pack_size();
        v35 = (char *)v37 - ((MEMORY[0x1E0C80A78](v27, v28, v29, v30, v31, v32, v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
        __error();
        *(_WORD *)_os_log_pack_fill() = 0;
        __SC_log_send(3, (uint64_t)v25, v26, v35);
      }
    }
    else
    {
      v25 = __log_SCNetworkReachability_log;
      if (!__log_SCNetworkReachability_log)
      {
        v25 = os_log_create("com.apple.SystemConfiguration", "SCNetworkReachability");
        __log_SCNetworkReachability_log = (uint64_t)v25;
      }
      v26 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v25, (os_log_type_t)v26))
        goto LABEL_26;
    }
  }
  else
  {
    v6 = type;
    if (type == nw_endpoint_type_address)
    {
      address = nw_endpoint_get_address(endpoint);
      if (address)
      {
        v8 = (const __CFString *)CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &address->sa_len, address->sa_len);
LABEL_10:
        CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v8);
        CFRelease(v8);
        return 1;
      }
      v25 = __log_SCNetworkReachability_log;
      if (!__log_SCNetworkReachability_log)
      {
        v25 = os_log_create("com.apple.SystemConfiguration", "SCNetworkReachability");
        __log_SCNetworkReachability_log = (uint64_t)v25;
      }
      v26 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v25, (os_log_type_t)v26))
        goto LABEL_26;
    }
    else
    {
      v13 = __log_SCNetworkReachability_log;
      if (!__log_SCNetworkReachability_log)
      {
        v13 = os_log_create("com.apple.SystemConfiguration", "SCNetworkReachability");
        __log_SCNetworkReachability_log = (uint64_t)v13;
      }
      v14 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v13, (os_log_type_t)v14))
      {
        v15 = _os_log_pack_size();
        v23 = (char *)v37 - ((MEMORY[0x1E0C80A78](v15, v16, v17, v18, v19, v20, v21, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
        __error();
        v24 = (_DWORD *)_os_log_pack_fill();
        *v24 = 67109120;
        v24[1] = v6;
        __SC_log_send(3, (uint64_t)v13, v14, v23);
      }
    }
  }
  return 1;
}

@end
