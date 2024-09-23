@implementation CreateColorSpaceFromObject

uint64_t __CreateColorSpaceFromObject_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&cp_colorspaces_key, (void (__cdecl *)(void *))cp_build_colorspace_destroy);
}

@end
