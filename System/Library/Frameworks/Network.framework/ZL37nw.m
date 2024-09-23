@implementation ZL37nw

_QWORD *___ZL37nw_masque_read_inner_request_on_queueP31NWConcrete_nw_masque_connection_block_invoke_5(_QWORD *result, char *__s)
{
  void *v3;
  size_t v4;

  if (__s)
  {
    v3 = (void *)result[4];
    v4 = strlen(__s);
    return memcpy(v3, __s, v4);
  }
  return result;
}

@end
