@implementation SecItemBackupWithChanges

void __SecItemBackupWithChanges_block_invoke(uint64_t a1, FILE *a2)
{
  unsigned __int8 *v3;
  size_t v4;
  char v5;
  unint64_t v6;
  size_t v7;
  size_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  BOOL v11;
  unsigned __int8 *v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  size_t v16;
  char *v17;
  size_t v18;
  char *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  size_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  char v35;
  __CFString **v37;

  v37 = (__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v3 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0xB6ACB77DuLL);
  v4 = 0;
  v5 = 1;
  v6 = 16;
  while (1)
  {
    v7 = fread(&v3[v4], 1uLL, 16 - v4, a2);
    if (!v7)
      break;
    v8 = v7 + v4;
    v9 = &v3[v7 + v4];
    v10 = (unsigned __int8 *)ccder_decode_tag();
    if (v10)
      v11 = v10 >= v9;
    else
      v11 = 1;
    if (v11)
    {
LABEL_29:
      v34 = SecError(-26275, v37, CFSTR("failed to decode backup event header"));
      goto LABEL_30;
    }
    v12 = v10 + 1;
    v13 = *v10;
    if ((char)*v10 < 0)
    {
      if ((_DWORD)v13 == 131)
      {
        if (v9 - v12 < 3)
          goto LABEL_29;
        v12 = v10 + 4;
        v13 = ((unint64_t)v10[1] << 16) | ((unint64_t)v10[2] << 8) | v10[3];
      }
      else if ((_DWORD)v13 == 130)
      {
        if (v9 - v12 < 2)
          goto LABEL_29;
        v12 = v10 + 3;
        v13 = __rev16(*(unsigned __int16 *)(v10 + 1));
      }
      else
      {
        if ((_DWORD)v13 != 129 || v9 - v12 < 1)
          goto LABEL_29;
        v12 = v10 + 2;
        v13 = v10[1];
      }
    }
    v14 = v12 - v3;
    v15 = v14 + v13;
    v16 = v14 + v13 - v8;
    if (v14 + v13 > v8)
    {
      if (v6 >= v15)
      {
        v17 = (char *)v3;
      }
      else
      {
        v17 = (char *)malloc_type_realloc(v3, v14 + v13, 0x35468961uLL);
        v6 = v15;
        if (!v17)
        {
          v34 = SecError(-108, v37, CFSTR("realloc buf failed"));
LABEL_30:
          v5 = v34;
          goto LABEL_37;
        }
      }
      v18 = fread(&v17[v8], 1uLL, v16, a2);
      if (v18 < v16)
      {
        v27 = v18;
        v28 = feof(a2);
        if ((_DWORD)v28)
        {
          v5 = SecError(-26275, v37, CFSTR("unexpected end of event file %zu of %zu bytes read"), v27, v16);
        }
        else
        {
          SecCheckErrno(v28, (CFTypeRef *)v37, CFSTR("failed to read event body"), v29, v30, v31, v32, v33, v35);
          v5 = 0;
        }
        v3 = (unsigned __int8 *)v17;
        goto LABEL_37;
      }
      v3 = (unsigned __int8 *)v17;
    }
    v19 = (char *)&v3[v15];
    ccder_decode_tag();
    v20 = SecError(-26275, v37, CFSTR("unsupported event tag: %lu"), 0xAAAAAAAAAAAAAAAALL);
    if (v15 >= v8)
    {
      v4 = 0;
    }
    else
    {
      v4 = v8 - v15;
      memmove(v3, v19, v4);
    }
    v5 &= v20;
  }
  v21 = feof(a2);
  if (!(_DWORD)v21)
  {
    SecCheckErrno(v21, (CFTypeRef *)v37, CFSTR("read backup event header"), v22, v23, v24, v25, v26, v35);
    v5 = 0;
  }
LABEL_37:
  free(v3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5 & (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24) != 0);
}

@end
