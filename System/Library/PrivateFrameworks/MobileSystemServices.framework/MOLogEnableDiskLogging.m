@implementation MOLogEnableDiskLogging

char *__MOLogEnableDiskLogging_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  char *result;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (v3)
  {
    free(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(_DWORD *)(v2 + 36);
  if ((v4 & 0x80000000) == 0)
  {
    close(v4);
    v2 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)(v2 + 36) = -1;
  }
  result = *(char **)(a1 + 40);
  if (result)
    result = strdup(result);
  *(_QWORD *)(v2 + 8) = result;
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v6 + 24) = *(_QWORD *)(a1 + 48);
  *(_DWORD *)(v6 + 32) = *(_DWORD *)(a1 + 56);
  return result;
}

@end
