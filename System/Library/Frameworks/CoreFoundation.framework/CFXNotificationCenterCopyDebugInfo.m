@implementation CFXNotificationCenterCopyDebugInfo

void ___CFXNotificationCenterCopyDebugInfo_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  __CFString *v10;
  __CFString *v11;
  const char *Name;
  Dl_info v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  CFStringAppend(*(CFMutableStringRef *)(a1 + 32), CFSTR("{\n"));
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR("    token = %llx\n"), *(_QWORD *)(a2 + 48));
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR("    name = %@\n"), *(_QWORD *)a2);
  v4 = CFSTR("    object = %@\n");
  if ((*(_BYTE *)(a2 + 25) & 4) == 0
    && (CFXNotificationRegistrarGetOptions(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16)) & 2) == 0)
  {
    v4 = CFSTR("    object = %p\n");
  }
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, v4, *(_QWORD *)(a2 + 8));
  if ((*(_QWORD *)(a2 + 24) & 0x400) != 0)
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR("    observer = %@\n"), *(_QWORD *)(a2 + 16));
  else
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR("    observer = %p\n"), *(_QWORD *)(a2 + 16));
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR("    options = 0x%lx\n"), *(_QWORD *)(a2 + 24));
  v5 = *(_QWORD *)(a2 + 24);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *(_QWORD *)(a2 + 32);
    v9 = *(const void **)(v8 + 16);
    memset(&v13, 0, sizeof(v13));
    dladdr(v9, &v13);
    v10 = *(__CFString **)(a1 + 32);
    if (v13.dli_sname)
      CFStringAppendFormat(v10, 0, CFSTR("    block = %s (%p)\n"), v13.dli_sname, v8);
    else
      CFStringAppendFormat(v10, 0, CFSTR("    block = %p\n"), v8);
  }
  else if ((v5 & 0x40000) != 0)
  {
    v11 = *(__CFString **)(a1 + 32);
    Name = sel_getName(*(SEL *)(a2 + 32));
    CFStringAppendFormat(v11, 0, CFSTR("    selector = %s\n"), Name);
  }
  else if ((v5 & 0x80000) != 0)
  {
    memset(&v13, 0, sizeof(v13));
    dladdr(*(const void **)(a2 + 32), &v13);
    v6 = *(__CFString **)(a1 + 32);
    v7 = *(_QWORD *)(a2 + 32);
    if (v13.dli_sname)
      CFStringAppendFormat(v6, 0, CFSTR("    callback = %s (%p)\n"), v13.dli_sname, v7);
    else
      CFStringAppendFormat(v6, 0, CFSTR("    callback = %p\n"), v7);
  }
  CFStringAppend(*(CFMutableStringRef *)(a1 + 32), CFSTR("}\n"));
}

@end
