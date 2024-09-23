@implementation ZN14PartitionStoreI30vi

int *___ZN14PartitionStoreI30vi_onefixedsize_disk_allocatorLi512EE18openPartitionStoreIS0_EENSt3__110shared_ptrI17AnyPartitionStoreEENS3_9enable_ifIXsr13is_persistentIT_EE5valueES8_E4type11meta_info_sE_block_invoke(int *result, int a2, int *a3, _BYTE *a4)
{
  int *v5;
  uint64_t v6;
  unsigned int v7;
  int v10;
  NSObject *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v5 = result;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(*((_QWORD *)result + 4) + 8);
  if (*a3 != *(_DWORD *)(v6 + 24))
  {
    v10 = *__error();
    v11 = _SILogForLogForCategory(16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *a3;
      v13 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v5 + 4) + 8) + 24);
      v14 = v5[10];
      v15 = 136316418;
      v16 = "openPartitionStore_block_invoke";
      v17 = 1024;
      v18 = 1198;
      v19 = 1024;
      v20 = v12;
      v21 = 1024;
      v22 = v13;
      v23 = 1024;
      v24 = v14;
      v25 = 1024;
      v26 = a2;
      _os_log_error_impl(&dword_1B8270000, v11, OS_LOG_TYPE_ERROR, "%s:%d: Partitions corrupted: offset out of order %u != %u. nVectors=%u p#%u", (uint8_t *)&v15, 0x2Au);
    }
    result = __error();
    *result = v10;
    goto LABEL_7;
  }
  v7 = *a3 + 1;
  *(_DWORD *)(v6 + 24) = v7;
  if (v7 > result[10])
LABEL_7:
    *a4 = 1;
  return result;
}

@end
