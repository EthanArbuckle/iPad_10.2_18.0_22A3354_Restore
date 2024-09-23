@implementation CEMCreateStringByTranslatingEmojiCharactersToNameInString

void __CEMCreateStringByTranslatingEmojiCharactersToNameInString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, CFIndex a4)
{
  uint64_t v4;
  __CFString *v8;
  const __CFString *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;
  CFRange v21;

  v4 = a2;
  v20 = *MEMORY[0x1E0C80C00];
  if (a2 && (v8 = CEM::EmojiToken::copyNameWithCount(*(_QWORD *)(a2 + 24), *(_DWORD *)(a1 + 64), 1)) != 0)
  {
    v9 = v8;
    v21.location = a3
                 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
                 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v21.length = a4;
    CFStringReplace(*(CFMutableStringRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v21, v8);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += a4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += CFStringGetLength(v9);
    CFRelease(v9);
  }
  else
  {
    if (cem_logging_get_default_log_onceToken != -1)
      dispatch_once(&cem_logging_get_default_log_onceToken, &__block_literal_global_257);
    v10 = cem_logging_get_default_log_log;
    if (os_log_type_enabled((os_log_t)cem_logging_get_default_log_log, OS_LOG_TYPE_DEBUG))
    {
      if (v4)
        v4 = *(_QWORD *)(*(_QWORD *)(v4 + 24) + 8);
      v11 = *(unsigned int *)(a1 + 64);
      v12 = *(_QWORD *)(a1 + 56);
      if (v12)
        v13 = MEMORY[0x18D791E5C](*(_QWORD *)(*(_QWORD *)(v12 + 24) + 32));
      else
        v13 = 0;
      *(_DWORD *)buf = 138543874;
      v15 = v4;
      v16 = 2048;
      v17 = v11;
      v18 = 2114;
      v19 = v13;
      _os_log_debug_impl(&dword_18D71E000, v10, OS_LOG_TYPE_DEBUG, "Could not load name for emoji '%{public}@' for name type '%lu' for locale identifier '%{public}@'", buf, 0x20u);
    }
  }
}

@end
