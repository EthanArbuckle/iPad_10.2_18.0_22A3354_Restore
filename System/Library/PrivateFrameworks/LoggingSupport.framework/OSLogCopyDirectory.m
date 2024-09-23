@implementation OSLogCopyDirectory

BOOL ___OSLogCopyDirectory_block_invoke(uint64_t a1, int a2, char *a3)
{
  int v5;
  _BOOL8 result;
  const char *v7;
  char *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  stat v18;
  char v19[1024];
  char __str[1024];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(&v18, 0, sizeof(v18));
  v5 = fstat(a2, &v18);
  result = 1;
  if (!v5 && v18.st_size)
  {
    if (!*(_BYTE *)(a1 + 84) || strcmp(a3, "version.plist"))
    {
      v7 = *(const char **)(a1 + 64);
      v8 = strrchr(a3, 47);
      if (v8)
        v9 = v8 + 1;
      else
        v9 = a3;
      snprintf(__str, 0x400uLL, "%s/%s", v7, v9);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        if (fcntl(*(_DWORD *)(a1 + 80), 50, v19) == -1)
        {
          __error();
          _os_assumes_log();
        }
        v10 = *(void **)(a1 + 40);
        strerror(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        _OSLogWarningMessage(v10, "copy handler failed: '%s' to '%s': %s (%d)", v11, v12, v13, v14, v15, v16, (char)v19);
      }
      else
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += v18.st_size;
        v17 = *(_QWORD *)(a1 + 72);
        if (v17)
          return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) < v17;
      }
    }
    return 1;
  }
  return result;
}

@end
