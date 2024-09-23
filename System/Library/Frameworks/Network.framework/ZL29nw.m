@implementation ZL29nw

char *___ZL29nw_http_sniffing_should_sniffP25nw_protocol_http_sniffingNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEP20nw_protocol_metadata_block_invoke(char *result, char *__s1)
{
  uint64_t v2;

  if (__s1)
  {
    v2 = (uint64_t)result;
    result = strstr(__s1, "nosniff");
    if (result)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end
