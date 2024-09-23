@implementation GEOEntitlements

+ (id)currentProcessEntitlement:(id)a3
{
  __CFString *v3;
  void *v4;
  __SecTask *v6;
  __SecTask *v7;
  const void *v8;
  audit_token_t cf;
  mach_msg_type_number_t task_info_outCnt;
  audit_token_t task_info_out;

  v3 = (__CFString *)a3;
  memset(&task_info_out, 0, sizeof(task_info_out));
  task_info_outCnt = 8;
  if (!task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)&task_info_out, &task_info_outCnt))
  {
    cf = task_info_out;
    v6 = SecTaskCreateWithAuditToken(0, &cf);
    if (v6)
    {
      v7 = v6;
      *(_QWORD *)cf.val = 0;
      v4 = (void *)SecTaskCopyValueForEntitlement(v6, v3, (CFErrorRef *)&cf);
      CFRelease(v7);
      v8 = *(const void **)cf.val;
      if (*(_QWORD *)cf.val)
      {
        if (v4)
        {
          CFRelease(v4);
          v8 = *(const void **)cf.val;
        }
        CFRelease(v8);
      }
      else if (v4)
      {
        goto LABEL_3;
      }
    }
  }
  v4 = 0;
LABEL_3:

  return v4;
}

+ (BOOL)currentProcessIsEntitled:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "currentProcessEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

@end
