@implementation RIPGetCacheState

const void *__RIPGetCacheState_block_invoke()
{
  _OWORD *v0;
  _QWORD *v1;
  const void *result;
  BOOL v3;

  v3 = 0;
  v0 = malloc_type_calloc(1uLL, 0x28uLL, 0x10200400855E00DuLL);
  *(_DWORD *)v0 = 0;
  v0[1] = xmmword_185004E60;
  v1 = malloc_type_calloc(1uLL, 0x18uLL, 0x102004062D53EE8uLL);
  *v1 = v1;
  v1[1] = v1;
  *((_QWORD *)v0 + 1) = v1;
  *((_BYTE *)v0 + 32) = 1;
  if (get_BOOLean_property("RIP_ENABLE_FUNCTION_CACHE", (const void *(*)(const char *))copy_local_domain_value, &v3))*((_BYTE *)v0 + 32) = v3;
  *((_BYTE *)v0 + 33) = 1;
  if (get_BOOLean_property("RIP_ENABLE_PATTERN_CACHE", (const void *(*)(const char *))copy_local_domain_value, &v3))*((_BYTE *)v0 + 33) = v3;
  *((_BYTE *)v0 + 34) = 1;
  result = get_BOOLean_property("RIP_ENABLE_IMAGE_CACHE", (const void *(*)(const char *))copy_local_domain_value, &v3);
  if ((_DWORD)result)
    *((_BYTE *)v0 + 34) = v3;
  RIPGetCacheState_cache_state = (uint64_t)v0;
  return result;
}

@end
