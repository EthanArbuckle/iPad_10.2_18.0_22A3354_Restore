@implementation INSyncTransaction

void __70___INSyncTransaction_beginTransactionForBundleID_bundlePath_syncSlot___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("can NOT");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    if (a2)
      v5 = CFSTR("can");
    v8 = 136315906;
    v9 = "+[_INSyncTransaction beginTransactionForBundleID:bundlePath:syncSlot:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_INFO, "%s %@ %@ sync %@", (uint8_t *)&v8, 0x2Au);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

@end
