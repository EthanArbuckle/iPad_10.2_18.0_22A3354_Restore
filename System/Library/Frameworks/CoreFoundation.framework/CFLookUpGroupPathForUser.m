@implementation CFLookUpGroupPathForUser

uint64_t ___CFLookUpGroupPathForUser_block_invoke(uint64_t a1)
{
  void *v1;
  const char *identifier;
  const char *path;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  identifier = (const char *)container_get_identifier();
  path = (const char *)container_get_path();
  xpc_dictionary_set_string(v1, identifier, path);
  return 1;
}

@end
