@implementation ProcessPhoto

void __captureDeferredPhotoProcessor_ProcessPhoto_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  qos_class_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _DWORD *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  unint64_t i;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  const void *v37;
  NSObject *v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  int v42;
  int *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  unint64_t v50;
  int v51;
  id obj;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  __int128 v59;
  _QWORD v60[6];
  os_log_type_t type;
  unsigned int v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE v67[128];
  int v68;
  const char *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  int v73;
  __int16 v74;
  _BYTE v75[14];
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  const __CFString *v79;
  __int16 v80;
  unint64_t v81;
  uint64_t v82;

  v1 = a1;
  v82 = *MEMORY[0x1E0C80C00];
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0x7FFFFFFFFFFFFFFFLL;
  v2 = *(void **)(*(_QWORD *)(a1 + 48) + 48);
  v49 = v1;
  if (v2 && (v3 = objc_msgSend(v2, "qosClass"), v3 < qos_class_self()))
  {
    if (dword_1ECFE9390)
    {
      v62 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = -16823;
    v37 = *(const void **)(v1 + 56);
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __captureDeferredPhotoProcessor_ProcessPhoto_block_invoke_126;
    v60[3] = &unk_1E49222A0;
    v60[4] = *(_QWORD *)(v1 + 40);
    v60[5] = v37;
    captureDeferredPhotoProcessor_performBlockOnWorkerQueueAsync(v37, (uint64_t)v60);
  }
  else
  {
    v5 = &unk_1ECFE9000;
    if (dword_1ECFE9390)
    {
      v62 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWDeferredTransactionBroker openTransaction:pid:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance", v43, v45), "openTransaction:pid:", 2, *(unsigned int *)(*(_QWORD *)(v1 + 48) + 32));
    v7 = *(_QWORD *)(v1 + 48);
    v8 = *(NSObject **)(v7 + 64);
    if (v8)
    {
      if (dword_1ECFE9390)
      {
        v62 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v8 = *(NSObject **)(*(_QWORD *)(v1 + 48) + 64);
      }
      dispatch_source_cancel(v8);

      v7 = *(_QWORD *)(v1 + 48);
      *(_QWORD *)(v7 + 64) = 0;
    }
    if (objc_msgSend(*(id *)(v7 + 48), "isEqual:", *(_QWORD *)(v1 + 32), v44, v46))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = -16829;
    }
    else
    {
      v10 = *(void **)(*(_QWORD *)(v1 + 48) + 40);
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __captureDeferredPhotoProcessor_ProcessPhoto_block_invoke_128;
      v58[3] = &unk_1E4925930;
      v59 = *(_OWORD *)(v1 + 64);
      v58[4] = &v63;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v58);
      if (v64[3] != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(*(id *)(*(_QWORD *)(v1 + 48) + 40), "removeObjectAtIndex:");
      if (FigCFEqual())
      {
        for (i = 0; i < objc_msgSend(*(id *)(*(_QWORD *)(v1 + 48) + 40), "count"); ++i)
        {
          v12 = objc_msgSend(*(id *)(v1 + 32), "qosClass");
          if (v12 >= objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 48) + 40), "objectAtIndexedSubscript:", i), "qosClass"))break;
        }
      }
      else
      {
        v13 = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 48) + 40), "count") + 1;
        do
        {
          i = v13 - 1;
          if (v13 == 1)
            break;
          v14 = objc_msgSend(*(id *)(v1 + 32), "qosClass");
          v15 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 48) + 40), "objectAtIndexedSubscript:", v13 - 2), "qosClass");
          --v13;
        }
        while (v14 > v15);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 48) + 40), "insertObject:atIndex:", *(_QWORD *)(v1 + 32), i);
      v47 = i;
      if (dword_1ECFE9390)
      {
        v62 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v17 = v62;
        if (os_log_type_enabled(v16, type))
          v18 = v17;
        else
          v18 = v17 & 0xFFFFFFFE;
        if (v18)
        {
          v19 = *(_QWORD *)(v49 + 48);
          v20 = *(_QWORD *)(v49 + 56);
          v21 = *(_DWORD *)(v19 + 32);
          v22 = *(_QWORD *)(v19 + 24);
          v23 = objc_msgSend(*(id *)(v19 + 40), "count");
          if (v64[3] == 0x7FFFFFFFFFFFFFFFLL)
            v24 = &stru_1E4928818;
          else
            v24 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("removed from position: %lu and re-"), v64[3]);
          v68 = 136316931;
          v69 = "captureDeferredPhotoProcessor_ProcessPhoto_block_invoke_2";
          v70 = 2048;
          v71 = v20;
          v72 = 1024;
          v73 = v21;
          v74 = 2113;
          *(_QWORD *)v75 = v22;
          *(_WORD *)&v75[8] = 1024;
          *(_DWORD *)&v75[10] = v21;
          v76 = 2048;
          v77 = v23;
          v78 = 2114;
          v79 = v24;
          v80 = 2048;
          v81 = i;
          LODWORD(v45) = 74;
          v43 = &v68;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v1 = v49;
        v5 = &unk_1ECFE9000;
      }
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      obj = *(id *)(*(_QWORD *)(v1 + 48) + 40);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16, v43, v45);
      if (v25)
      {
        v26 = 0;
        v53 = *(_QWORD *)v55;
        do
        {
          v27 = 0;
          v48 = v26;
          v50 = v47 - v26;
          v51 = v26;
          do
          {
            if (*(_QWORD *)v55 != v53)
              objc_enumerationMutation(obj);
            if (v5[228])
            {
              v28 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v27);
              v62 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v30 = v62;
              if (os_log_type_enabled(v29, type))
                v31 = v30;
              else
                v31 = v30 & 0xFFFFFFFE;
              if (v31)
              {
                v32 = *(_QWORD *)(v1 + 56);
                v33 = *(_DWORD *)(*(_QWORD *)(v1 + 48) + 32);
                v34 = objc_msgSend(v28, "captureRequestIdentifier");
                v35 = objc_msgSend(v28, "photoIdentifier");
                v68 = 136316674;
                v36 = &stru_1E4928818;
                if (v50 == v27)
                  v36 = CFSTR(" <-- Just inserted");
                v69 = "captureDeferredPhotoProcessor_ProcessPhoto_block_invoke";
                v70 = 2048;
                v71 = v32;
                v72 = 1024;
                v73 = v33;
                v74 = 1024;
                *(_DWORD *)v75 = v51 + v27;
                *(_WORD *)&v75[4] = 2114;
                *(_QWORD *)&v75[6] = v34;
                v76 = 2114;
                v77 = v35;
                v78 = 2112;
                v79 = v36;
                LODWORD(v45) = 64;
                v43 = &v68;
                _os_log_send_and_compose_impl();
                v1 = v49;
                v5 = (_DWORD *)&unk_1ECFE9000;
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            ++v27;
          }
          while (v25 != v27);
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
          v26 = v48 + v27;
        }
        while (v25);
      }
      captureDeferredPhotoProcessor_workloop(*(const void **)(v1 + 56));
    }
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) == -16829)
  {
    if (dword_1ECFE9390)
    {
      v62 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v39 = v62;
      if (os_log_type_enabled(v38, type))
        v40 = v39;
      else
        v40 = v39 & 0xFFFFFFFE;
      if (v40)
      {
        v41 = *(_QWORD *)(v1 + 56);
        v42 = *(_DWORD *)(*(_QWORD *)(v1 + 48) + 32);
        v68 = 136315906;
        v69 = "captureDeferredPhotoProcessor_ProcessPhoto_block_invoke";
        v70 = 2048;
        v71 = v41;
        v72 = 1024;
        v73 = v42;
        v74 = 1024;
        *(_DWORD *)v75 = v42;
        LODWORD(v45) = 34;
        v43 = &v68;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWDeferredTransactionBroker closeTransaction:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance", v43, v45), "closeTransaction:", 2);
  }
  _Block_object_dispose(&v63, 8);
}

void __captureDeferredPhotoProcessor_ProcessPhoto_block_invoke_126(uint64_t a1)
{
  captureDeferredPhotoProcessor_terminateImmediatelyDueToError(*(_QWORD *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __captureDeferredPhotoProcessor_ProcessPhoto_block_invoke_128(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "captureRequestIdentifier"), "isEqualToString:", a1[5]);
  if ((_DWORD)result)
  {
    result = objc_msgSend((id)objc_msgSend(a2, "photoIdentifier"), "isEqualToString:", a1[6]);
    if ((_DWORD)result)
    {
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a3;
      *a4 = 1;
    }
  }
  return result;
}

@end
