@implementation ZN13IIOReadPlugin19saveDataToXPCObjectEPv

const char *___ZN13IIOReadPlugin19saveDataToXPCObjectEPv_block_invoke()
{
  const char *result;
  char *v1;

  result = (const char *)task_create_identity_token(*MEMORY[0x1E0C83DA0], (task_id_token_t *)&IIOReadPlugin::saveDataToXPCObject(void *)::tok);
  if ((_DWORD)result)
  {
    v1 = mach_error_string((mach_error_t)result);
    return LogError("saveDataToXPCObject_block_invoke", 1812, "*** ERROR: task_create_identity_token: %s", v1);
  }
  return result;
}

@end
