@implementation OSLogCopyTraceFile

uint64_t ___OSLogCopyTraceFile_impl_block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v29[1024];
  uint64_t v30;
  uint64_t v31;
  _DWORD *v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*a2 != 24587)
    return 1;
  v4 = _catalog_create_with_chunk((uint64_t)a2, 0);
  if (!v4)
    return 1;
  v5 = v4;
  v6 = (_QWORD *)(v4 + 64);
  do
  {
    v6 = (_QWORD *)*v6;
    if (!v6)
    {
      _catalog_destroy(v4);
      return 1;
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  while (v6[2] < v7 && v6[3] < v7);
  v8 = *(_QWORD *)(a1 + 64) - (_QWORD)a2 + *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 80);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 16;
  v30 = *(_QWORD *)(a1 + 72);
  v31 = v10;
  v32 = a2;
  v33 = v8;
  v11 = _OSLogUUIDMapAddFromFile((uint64_t)a2, v8, v9, *(void **)(a1 + 32));
  if (v11)
  {
    v12 = v11;
    if (fcntl(*(_DWORD *)(a1 + 96), 50, v29) == -1)
    {
      __error();
      _os_assumes_log();
    }
    v13 = *(void **)(a1 + 32);
    strerror(v12);
    _OSLogWarningMessage(v13, "failed to index uuids: '%s' to '%s': %s (%d)", v14, v15, v16, v17, v18, v19, (char)v29);
  }
  if (_os_trace_writev() == -1)
  {
    v20 = *__error();
    if (fcntl(*(_DWORD *)(a1 + 100), 50, v29) == -1)
    {
      __error();
      _os_assumes_log();
    }
    v21 = *(void **)(a1 + 32);
    strerror(v20);
    _OSLogWarningMessage(v21, "failed to write file data to temp file: '%s': %s (%d)", v22, v23, v24, v25, v26, v27, (char)v29);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8 + *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 16;
  _catalog_destroy(v5);
  return 0;
}

uint64_t ___OSLogCopyTraceFile_implWithRepack_block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("nil");
  if ((-[__CFString containsString:](v4, "containsString:", CFSTR("nonsparse")) & 1) != 0
    || (-[__CFString containsString:](v4, "containsString:", CFSTR("timesync")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (id)objc_msgSend(**(id **)(*(_QWORD *)(a1 + 40) + 192), "composedMessage");
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "evaluateWithObject:", **(_QWORD **)(*(_QWORD *)(a1 + 40) + 192));
  }

  return v5;
}

uint64_t ___OSLogCopyTraceFile_implWithRepack_block_invoke_2(uint64_t a1, char *a2)
{
  _QWORD *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int v8;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v5 = *(char **)(a1 + 72);
  v4 = *(_QWORD **)(a1 + 80);
  v6 = (char *)(a2 - v5);
  v4[21] = a2 - v5;
  if (a2 == v5)
  {
    *v4 = a2 + 144;
    _repack_compact_add_iov(*(_QWORD *)(a1 + 80), (uint64_t)a2);
    return 1;
  }
  if (*(_DWORD *)a2 == 24589)
  {
    if (!v4[3])
      return 1;
    v10 = (_QWORD *)v4[5];
    if (!v10)
      return 1;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v11 = (void *)MEMORY[0x1A1AEC1C8]();
      objc_msgSend(*(id *)(a1 + 40), "stringByAppendingFormat:", CFSTR("-%llu"), v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 80);
      v14 = *(_QWORD **)(v13 + 40);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      if (v14[2] < v15 && v14[3] < v15)
      {
        *(_QWORD *)(v13 + 40) = *v14;

        objc_autoreleasePoolPop(v11);
        return 1;
      }
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = ___OSLogCopyTraceFile_implWithRepack_block_invoke_3;
      v39[3] = &unk_1E4158008;
      v42 = v13;
      v26 = v12;
      v27 = *(_QWORD *)(a1 + 56);
      v40 = v26;
      v41 = v27;
      _tracev3_chunk_decompress_and_enumerate_chunks_helper((uint64_t)a2, (uint64_t)v14, v39);
      v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (v28)
      {
        v29 = *(void **)(a1 + 48);
        objc_msgSend(v28, "userInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "description");
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v32 = objc_msgSend(v31, "UTF8String");
        _OSLogWarningMessage(v29, "failed to compact chunkset: %s", v33, v34, v35, v36, v37, v38, v32);

        objc_autoreleasePoolPop(v11);
        return 0;
      }

      objc_autoreleasePoolPop(v11);
      v4 = *(_QWORD **)(a1 + 80);
      v10 = (_QWORD *)v4[5];
    }
    v4[5] = *v10;
    return 1;
  }
  if (*(_DWORD *)a2 == 24587)
  {
    if (!v4[3])
    {
LABEL_7:
      _repack_ttl_compact_open_catalog((uint64_t)v4, (uint64_t)a2);
      _OSLogUUIDMapAddFromCatalog(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 192) + 16));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isKeptCatalog:", *(_QWORD *)(*(_QWORD *)(a1 + 80) + 24));
      return 1;
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v43 = *(id *)(v7 + 40);
    v8 = _repack_ttl_compact_close_catalog((uint64_t)v4, &v43);
    objc_storeStrong((id *)(v7 + 40), v43);
    if (v8)
    {
      v4 = *(_QWORD **)(a1 + 80);
      goto LABEL_7;
    }
    v16 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "description");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "UTF8String");
    _OSLogWarningMessage(v16, "failed to close catalog: %s", v20, v21, v22, v23, v24, v25, v19);

    return 0;
  }
  return 1;
}

uint64_t ___OSLogCopyTraceFile_implWithRepack_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id obj;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v1 + 40);
  v2 = _compact_chunkset();
  objc_storeStrong((id *)(v1 + 40), obj);
  return v2;
}

@end
