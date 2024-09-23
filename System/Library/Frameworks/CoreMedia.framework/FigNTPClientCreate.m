@implementation FigNTPClientCreate

void __FigNTPClientCreate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  const __CFString *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _OWORD *v10;
  dispatch_semaphore_t *v11;
  dispatch_time_t v12;
  uint64_t AddrInfo;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  char *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t *v37;
  NSObject *v38;
  unsigned int v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t *v42;
  const void *v43;
  NSObject *v44;
  _QWORD *v45;
  const __CFString *v46;
  __int128 v47;
  int v48;
  unint64_t v49;
  int64_t v50;
  char *CStringPtrAndBufferToFree;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  char *v57;
  DNSServiceRef v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE block[24];
  void *v68;
  uint64_t *v69;
  dispatch_semaphore_t *v70;
  unint64_t v71;
  int v72;
  int v73;
  unint64_t (*v74)();
  DNSServiceRef v75;
  int v76;
  int v77;
  char v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  MEMORY[0x1E0C80A78]();
  v4 = &(&v45)[-2 * v3];
  v57 = 0;
  v5 = (const __CFString *)FigCopyCFPreferenceAppValueOrOptionCFTypeWithDefault(0, CFSTR("ntp_hostname"), CFSTR("com.apple.coremedia"), CFSTR("time.apple.com"));
  CStringPtrAndBufferToFree = FigCFStringGetCStringPtrAndBufferToFree(v5, 0x8000100u, &v57);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = dispatch_semaphore_create(0);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  LODWORD(v7) = *(_DWORD *)(a1 + 48);
  if ((int)v7 >= 1)
  {
    v46 = v5;
    v8 = 0;
    v9 = (unint64_t)(1000000 * v2) >> 1;
    v49 = 1000000 * v2 / 0x1E8480uLL;
    v50 = 1000 * v9;
    v48 = v9 - 1000000 * v49;
    v10 = v4;
    *(_QWORD *)&v6 = 136315394;
    v47 = v6;
    v45 = v4;
    do
    {
      v11 = *(dispatch_semaphore_t **)(a1 + 40);
      v58 = 0;
      v12 = dispatch_time(0, v50);
      v59 = 0;
      v60 = &v59;
      v61 = 0x6800000000;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      AddrInfo = DNSServiceGetAddrInfo(&v58, 0x10000u, 0, 1u, CStringPtrAndBufferToFree, (DNSServiceGetAddrInfoReply)figNTPClient_addressInfoCallBack, v11);
      if ((_DWORD)AddrInfo || (AddrInfo = DNSServiceSetDispatchQueue(v58, v11[7]), (_DWORD)AddrInfo))
      {
        *((_DWORD *)v60 + 6) = 1;
        FigSignalErrorAt(AddrInfo, 0, 0, 0, 0, 0, 0);
      }
      else
      {
        dispatch_semaphore_wait(v11[6], v12);
        v14 = v11[7];
        *(_QWORD *)block = MEMORY[0x1E0C809B0];
        *(_QWORD *)&block[8] = 0x40000000;
        *(_QWORD *)&block[16] = __figNTPClient_sntp_unicast_block_invoke;
        v68 = &unk_1E28DB280;
        v76 = v8;
        v77 = 123;
        v78 = 0;
        v69 = &v59;
        v70 = v11;
        v71 = v49;
        v72 = v48;
        v73 = 0;
        v74 = figntp_gettime;
        v75 = v58;
        dispatch_sync(v14, block);
      }
      v15 = *(_OWORD *)(v60 + 7);
      v53 = *(_OWORD *)(v60 + 5);
      v54 = v15;
      v16 = *(_OWORD *)(v60 + 11);
      v55 = *(_OWORD *)(v60 + 9);
      v56 = v16;
      v52 = *(_OWORD *)(v60 + 3);
      _Block_object_dispose(&v59, 8);
      v17 = v55;
      v10[2] = v54;
      v10[3] = v17;
      v10[4] = v56;
      v18 = v53;
      *v10 = v52;
      v10[1] = v18;
      v19 = *(unsigned int *)v10;
      if ((_DWORD)v19)
      {
        LODWORD(v52) = 0;
        LOBYTE(v58) = 0;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141F20, 0, (int *)&v52, &v58);
        v21 = v52;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, (os_log_type_t)v58))
          v23 = v21;
        else
          v23 = v21 & 0xFFFFFFFE;
        if (v23)
        {
          v24 = sntp_result_strings[v19];
          *(_DWORD *)block = v47;
          *(_QWORD *)&block[4] = "FigNTPClientCreate_block_invoke";
          *(_WORD *)&block[12] = 2082;
          *(_QWORD *)&block[14] = v24;
          v25 = (uint64_t *)_os_log_send_and_compose_impl();
          LOBYTE(v21) = v52;
        }
        else
        {
          v25 = 0;
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141F20, 0, 1, v25, v25 != &v59, v21, 0, v22);
      }
      ++v8;
      v7 = *(int *)(a1 + 48);
      v10 += 5;
    }
    while (v8 < v7);
    v4 = v45;
    v5 = v46;
  }
  v26 = sntp_clock_select((unint64_t)v4, v7);
  if (v26)
  {
    v27 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(v27 + 16) = sntp_calc_offset(v26);
    *(_QWORD *)(v27 + 24) = v28;
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(_QWORD *)(v29 + 24);
    *(_QWORD *)(v29 + 16) -= 2208988800;
    v31 = sntp_datestamp_subsecs_to_nsec(v30);
    v32 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)(v32 + 32) = v31;
    *(_DWORD *)(v32 + 80) = 1;
    if (dword_1EE141F28)
    {
      LODWORD(v52) = 0;
      LOBYTE(v58) = 0;
      v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141F20, 1, (int *)&v52, &v58);
      v34 = v52;
      if (os_log_type_enabled(v33, (os_log_type_t)v58))
        v36 = v34;
      else
        v36 = v34 & 0xFFFFFFFE;
      if (v36)
      {
        *(_DWORD *)block = 136315138;
        *(_QWORD *)&block[4] = "FigNTPClientCreate_block_invoke";
        v37 = (uint64_t *)_os_log_send_and_compose_impl();
        LOBYTE(v34) = v52;
      }
      else
      {
        v37 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141F20, 1u, 1, v37, v37 != &v59, v34, 0, v35);
      v32 = *(_QWORD *)(a1 + 40);
    }
  }
  else
  {
    LODWORD(v52) = 0;
    LOBYTE(v58) = 0;
    v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141F20, 0, (int *)&v52, &v58);
    v39 = v52;
    if (os_log_type_enabled(v38, (os_log_type_t)v58))
      v41 = v39;
    else
      v41 = v39 & 0xFFFFFFFE;
    if (v41)
    {
      *(_DWORD *)block = 136315138;
      *(_QWORD *)&block[4] = "FigNTPClientCreate_block_invoke";
      v42 = (uint64_t *)_os_log_send_and_compose_impl();
      LOBYTE(v39) = v52;
    }
    else
    {
      v42 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141F20, 0, 1, v42, v42 != &v59, v39, 0, v40);
    v32 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)(v32 + 80) = 2;
  }
  v43 = *(const void **)(v32 + 72);
  if (v43)
  {
    CFRelease(v43);
    v32 = *(_QWORD *)(a1 + 40);
  }
  v44 = *(NSObject **)(v32 + 48);
  if (v44)
    dispatch_release(v44);
  if (v5)
    CFRelease(v5);
  free(v57);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
