@implementation ZL30nw

const char *___ZL30nw_http_redirect_copy_metadataP25nw_protocol_http_redirectP11nw_endpointP20nw_protocol_metadatab_block_invoke_3(uint64_t a1, const char *a2)
{
  const char *result;
  BOOL v4;
  char v5;

  result = *(const char **)(a1 + 40);
  if (a2 && result)
  {
    result = (const char *)strcmp(result, a2);
    v4 = (_DWORD)result == 0;
  }
  else
  {
    v4 = result == a2;
  }
  v5 = v4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

@end
