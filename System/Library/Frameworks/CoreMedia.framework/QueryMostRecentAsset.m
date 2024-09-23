@implementation QueryMostRecentAsset

void __figMobileAsset_QueryMostRecentAsset_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  int v6;
  const void *v7;
  const void *v8;
  const __CFArray *v9;
  const void *v10;
  unint64_t v11;
  const void *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v14;
  uint64_t v15;
  unsigned int v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  NSObject *v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  _QWORD *v31;
  int *v32;
  uint64_t v33;
  const void *v34;
  os_log_type_t v35;
  os_log_type_t type[4];
  int v37;
  const char *v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[24];
  void *v42;
  int v43;
  _QWORD v44[19];

  v44[16] = *MEMORY[0x1E0C80C00];
  if (!a2 || a2 == 2 && *(_BYTE *)(a1 + 80))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "results");
    if (v3)
    {
      v4 = (void *)v3;
      v5 = *(_DWORD *)(a1 + 72);
      v6 = *(unsigned __int8 *)(a1 + 80);
      v8 = *(const void **)(a1 + 40);
      v7 = *(const void **)(a1 + 48);
      v10 = *(const void **)(a1 + 56);
      v9 = *(const __CFArray **)(a1 + 64);
      v11 = 0x1E0CB3000;
      if (v5 >= 1)
      {
        if (dword_1EE141E68)
        {
          v12 = *(const void **)(a1 + 40);
          v34 = *(const void **)(a1 + 48);
          v37 = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E60, 1, &v37, type);
          v14 = v37;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type[0]))
            v16 = v14;
          else
            v16 = v14 & 0xFFFFFFFE;
          if (v16)
          {
            *(_DWORD *)v41 = 136315650;
            *(_QWORD *)&v41[4] = "figMobileAsset_HandleSuccessfulQueryResult";
            *(_WORD *)&v41[12] = 2114;
            *(_QWORD *)&v41[14] = v12;
            *(_WORD *)&v41[22] = 1024;
            LODWORD(v42) = v5;
            LODWORD(v33) = 28;
            v32 = (int *)v41;
            v17 = (_QWORD *)_os_log_send_and_compose_impl();
            LOBYTE(v14) = v37;
          }
          else
          {
            v17 = 0;
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E60, 1u, 1, v17, v17 != v44, v14, 0, v15);
          v7 = v34;
          v8 = v12;
          v11 = 0x1E0CB3000uLL;
        }
        v18 = *(void **)(v11 + 2176);
        *(_QWORD *)v41 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v41[8] = 3221225472;
        *(_QWORD *)&v41[16] = __figMobileAsset_HandleSuccessfulQueryResult_block_invoke;
        v42 = &__block_descriptor_36_e34_B24__0__MAAsset_8__NSDictionary_16l;
        v43 = v5;
        v4 = (void *)objc_msgSend(v4, "filteredArrayUsingPredicate:", objc_msgSend(v18, "predicateWithBlock:", v41, v32, v33));
      }
      if (v6)
        v4 = (void *)objc_msgSend(v4, "filteredArrayUsingPredicate:", objc_msgSend(*(id *)(v11 + 2176), "predicateWithBlock:", &__block_literal_global_25));
      if (v4)
      {
        v19 = (void *)objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_28);
        if (v19)
        {
          v20 = (void *)objc_msgSend(v19, "lastObject");
          if (v20)
          {
            v21 = v20;
            if (objc_msgSend(v20, "state") == 2 || objc_msgSend(v21, "state") == 5)
            {
              figMobileAsset_UpdateLastUpdatedTime(v8);
              figMobileAsset_ExtractPlistFromAssetForCallback(v21, (uint64_t)v10, v9);
            }
            else if (!v6)
            {
              if (v8)
                CFRetain(v8);
              if (v7)
                CFRetain(v7);
              if (v10)
                CFRetain(v10);
              if (v9)
                CFRetain(v9);
              if (dword_1EE141E68)
              {
                *(_DWORD *)type = 0;
                v35 = OS_LOG_TYPE_DEFAULT;
                v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E60, 1, (int *)type, &v35);
                v27 = *(_DWORD *)type;
                if (os_log_type_enabled(v26, v35))
                  v29 = v27;
                else
                  v29 = v27 & 0xFFFFFFFE;
                if (v29)
                {
                  v30 = objc_msgSend(v21, "assetId");
                  v37 = 136315395;
                  v38 = "figMobileAsset_HandleSuccessfulQueryResult";
                  v39 = 2113;
                  v40 = v30;
                  LODWORD(v33) = 22;
                  v32 = &v37;
                  v31 = (_QWORD *)_os_log_send_and_compose_impl();
                  LOBYTE(v27) = type[0];
                }
                else
                {
                  v31 = 0;
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E60, 1u, 1, v31, v31 != v44, v27, 0, v28);
              }
              v44[0] = MEMORY[0x1E0C809B0];
              v44[1] = 3221225472;
              v44[2] = __figMobileAsset_HandleSuccessfulQueryResult_block_invoke_26;
              v44[3] = &unk_1E28D8BF8;
              v44[4] = v21;
              v44[5] = v8;
              v44[6] = v10;
              v44[7] = v9;
              v44[8] = v7;
              objc_msgSend(v21, "startDownload:", v44, v32, v33);
            }
          }
        }
      }
    }
  }
  else if (a2 == 2 && !*(_BYTE *)(a1 + 80))
  {
    figMobileAsset_DownloadCatalogAndRequery(*(CFTypeRef *)(a1 + 40), *(_DWORD *)(a1 + 76));
  }

  v22 = *(const void **)(a1 + 40);
  if (v22)
    CFRelease(v22);
  v23 = *(const void **)(a1 + 48);
  if (v23)
    CFRelease(v23);
  v24 = *(const void **)(a1 + 56);
  if (v24)
    CFRelease(v24);
  v25 = *(const void **)(a1 + 64);
  if (v25)
    CFRelease(v25);
}

@end
