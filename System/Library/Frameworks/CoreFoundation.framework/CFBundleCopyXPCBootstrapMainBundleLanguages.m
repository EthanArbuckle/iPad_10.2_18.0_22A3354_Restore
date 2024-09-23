@implementation CFBundleCopyXPCBootstrapMainBundleLanguages

void ___CFBundleCopyXPCBootstrapMainBundleLanguages_block_invoke()
{
  void *v0;
  void *v1;
  xpc_object_t value;
  xpc_object_t v3;
  void *v4;
  size_t count;

  v0 = (void *)xpc_copy_bootstrap();
  if (v0)
  {
    v1 = v0;
    value = xpc_dictionary_get_value(v0, "_NSBundleEntry");
    if (value)
    {
      v3 = xpc_dictionary_get_value(value, "MainBundleLanguages");
      if (v3)
      {
        v4 = v3;
        if (object_getClass(v3) == (Class)MEMORY[0x1E0C812C8])
        {
          count = xpc_array_get_count(v4);
          _CFBundleCopyXPCBootstrapMainBundleLanguages_result = (uint64_t)CFArrayCreateMutable(0, count, &kCFTypeArrayCallBacks);
          xpc_array_apply(v4, &__block_literal_global_144);
        }
      }
    }
    xpc_release(v1);
  }
}

uint64_t ___CFBundleCopyXPCBootstrapMainBundleLanguages_block_invoke_2(int a1, int a2, id a3)
{
  const char *string_ptr;
  size_t length;
  CFStringRef v6;
  CFStringRef v7;

  if (object_getClass(a3) == (Class)MEMORY[0x1E0C81390])
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    length = xpc_string_get_length(a3);
    v6 = CFStringCreateWithBytes(0, (const UInt8 *)string_ptr, length, 0x8000100u, 0);
    if (v6)
    {
      v7 = v6;
      CFArrayAppendValue((CFMutableArrayRef)_CFBundleCopyXPCBootstrapMainBundleLanguages_result, v6);
      CFRelease(v7);
    }
  }
  return 1;
}

@end
