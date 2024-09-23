@implementation OSLogUUIDMapCopySet

void ___OSLogUUIDMapCopySet_block_invoke(uint64_t a1, const unsigned __int8 *a2, int a3)
{
  int v5;
  uint64_t v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  char *v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  const unsigned __int8 *v30;
  int v31;
  size_t v32;
  char out[40];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v5 = *(_DWORD *)(a1 + 64);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = (uint64_t *)(v6 + 24);
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    if (a3 == 3)
    {
      v10 = v8;
      v11 = v9;
      if (uuid_is_null(a2) || !_OSLogUUIDMapCopyUUID(v5, a2, 3, v7, v10, v11))
      {
        v12 = 0;
      }
      else
      {
        v12 = _OSLogUUIDMapCopyUUID(v5, a2, 1, v7, v10, v11);
        if (!v12)
        {
          v32 = 0;
          v14 = (char *)uuidpath_map_header_fd(v5, (uint64_t)a2, &v32);
          if (v14)
          {
            v15 = (unsigned int *)v14;
            if ((v14[8] & 2) != 0)
            {
              if (*((_DWORD *)v14 + 3))
              {
                v29 = 0;
                v12 = 0;
                v30 = (const unsigned __int8 *)(v14 + 24);
                do
                {
                  v31 = _OSLogUUIDMapCopyUUID(v5, v30, 1, v7, v10, v11);
                  if (!v12)
                    v12 = v31;
                  ++v29;
                  v30 += 32;
                }
                while (v29 < v15[3]);
              }
              else
              {
                v12 = 0;
              }
              if (munmap(v15, v32) == -1)
              {
                __error();
                _os_assumes_log();
              }
            }
            else
            {
              memset(out, 0, 37);
              uuid_unparse_lower(a2, out);
              _OSLogWarningMessage(v11, "dsc header not shared cache: %s", v16, v17, v18, v19, v20, v21, (char)out);
              if (munmap(v15, v32) == -1)
              {
                __error();
                _os_assumes_log();
              }
              v12 = 22;
            }
          }
          else
          {
            memset(out, 0, 37);
            uuid_unparse_lower(a2, out);
            v22 = __error();
            strerror(*v22);
            __error();
            _OSLogWarningMessage(v11, "failed to map dsc: %s: %s (%d)", v23, v24, v25, v26, v27, v28, (char)out);
            v12 = *__error();
          }
        }
      }

    }
    else
    {
      v12 = _OSLogUUIDMapCopyUUID(*(_DWORD *)(a1 + 64), a2, a3, (uint64_t *)(v6 + 24), v8, v9);
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_DWORD *)(v13 + 24) == 2)
      *(_DWORD *)(v13 + 24) = 0;
  }
}

@end
