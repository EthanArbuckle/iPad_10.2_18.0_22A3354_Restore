@implementation SCNetworkCategoryManagerCreateWithInterface

void __SCNetworkCategoryManagerCreateWithInterface_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 48) == a2)
  {
    switch(a3)
    {
      case 3:
        SCNetworkCategoryManagerDeliverNotification(v5);
        break;
      case 2:
        v31 = _SC_LOG_DEFAULT();
        v32 = _SC_syslog_os_log_mapping(5);
        if (__SC_log_enabled(5, v31, (os_log_type_t)v32))
        {
          v33 = _os_log_pack_size();
          v41 = (char *)v43
              - ((MEMORY[0x1E0C80A78](v33, v34, v35, v36, v37, v38, v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
          __error();
          v42 = _os_log_pack_fill();
          *(_DWORD *)v42 = 136315394;
          *(_QWORD *)(v42 + 4) = "SCNetworkCategoryManagerCreateWithInterface_block_invoke";
          *(_WORD *)(v42 + 12) = 2048;
          *(_QWORD *)(v42 + 14) = a2;
          __SC_log_send(5, (uint64_t)v31, v32, v41);
        }
        CategoryManagerConnectionSynchronize(*(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 48), *(const __CFString **)(*(_QWORD *)(a1 + 32) + 16), *(const __CFString **)(*(_QWORD *)(a1 + 32) + 24), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32), *(const __CFString **)(*(_QWORD *)(a1 + 32) + 40));
        break;
      case 1:
        v19 = _SC_LOG_DEFAULT();
        v20 = _SC_syslog_os_log_mapping(5);
        if (__SC_log_enabled(5, v19, (os_log_type_t)v20))
        {
          v21 = _os_log_pack_size();
          v29 = (char *)v43
              - ((MEMORY[0x1E0C80A78](v21, v22, v23, v24, v25, v26, v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
          __error();
          v30 = _os_log_pack_fill();
          *(_DWORD *)v30 = 136315394;
          *(_QWORD *)(v30 + 4) = "SCNetworkCategoryManagerCreateWithInterface_block_invoke";
          *(_WORD *)(v30 + 12) = 2048;
          *(_QWORD *)(v30 + 14) = a2;
          __SC_log_send(5, (uint64_t)v19, v20, v29);
        }
        break;
    }
  }
  else
  {
    v6 = _SC_LOG_DEFAULT();
    v7 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v6, (os_log_type_t)v7))
    {
      v8 = _os_log_pack_size();
      v16 = (char *)v43 - ((MEMORY[0x1E0C80A78](v8, v9, v10, v11, v12, v13, v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
      __error();
      v17 = _os_log_pack_fill();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      *(_DWORD *)v17 = 136315650;
      *(_QWORD *)(v17 + 4) = "SCNetworkCategoryManagerCreateWithInterface_block_invoke";
      *(_WORD *)(v17 + 12) = 2048;
      *(_QWORD *)(v17 + 14) = v18;
      *(_WORD *)(v17 + 22) = 2048;
      *(_QWORD *)(v17 + 24) = a2;
      __SC_log_send(5, (uint64_t)v6, v7, v16);
    }
  }
}

@end
