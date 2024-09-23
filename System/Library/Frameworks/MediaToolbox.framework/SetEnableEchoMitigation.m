@implementation SetEnableEchoMitigation

void __localHelper_SetEnableEchoMitigation_block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  CFIndex Count;
  CFIndex v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSObject *v18;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = CFSetContainsValue(**(CFSetRef **)(a1 + 32), *(const void **)(a1 + 40));
  if (v2)
  {
    if (v3)
      return;
    Count = CFSetGetCount(**(CFSetRef **)(a1 + 32));
    CFSetAddValue(**(CFMutableSetRef **)(a1 + 32), *(const void **)(a1 + 40));
    if (Count)
      return;
  }
  else
  {
    if (!v3)
      return;
    v5 = CFSetGetCount(**(CFSetRef **)(a1 + 32));
    CFSetRemoveValue(**(CFMutableSetRef **)(a1 + 32), *(const void **)(a1 + 40));
    if (v5 != 1)
      return;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activeConversations");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    v22 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v12 = (void *)objc_msgSend(v11, "activitySessions");
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              if (!*(_BYTE *)(a1 + 48))
                goto LABEL_32;
              if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "activity"), "metadata"), "context"), "isMedia") & 1) != 0)goto LABEL_27;
              if (!*(_BYTE *)(a1 + 48))
              {
LABEL_32:
                if (objc_msgSend(v17, "isUsingAirplay"))
                {
LABEL_27:
                  if (dword_1EE2A2E38)
                  {
                    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setUsingAirplay:onActivitySession:onConversation:", *(_BYTE *)(a1 + 48) != 0, v17, v11, v20, v21);
                  return;
                }
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v14)
              continue;
            break;
          }
        }
        v9 = v22;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }
  if (dword_1EE2A2E38)
  {
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

@end
