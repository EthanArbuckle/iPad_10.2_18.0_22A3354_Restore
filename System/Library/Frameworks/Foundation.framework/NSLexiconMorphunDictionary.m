@implementation NSLexiconMorphunDictionary

void __64___NSLexiconMorphunDictionary_allPossibleWordAttributesForWord___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  __objc2_meth_list **p_opt_inst_meths;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  unsigned __int8 v13;
  uint64_t v14;
  NSObject *v15;
  const __CFArray *v16;
  char v17;
  id v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  CFIndex Count;
  CFIndex v23;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSMorphology *v30;
  _BYTE *v31;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  cf = 0;
  v6 = off_1ECD09E48(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), a2, &cf);
  p_opt_inst_meths = &OBJC_PROTOCOL___NSXPCListenerDelegate.opt_inst_meths;
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v8 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = cf;
      _os_log_error_impl(&dword_1817D9000, v8, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Obtaining the token chain from a word): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
  if (!v6)
  {
    v16 = 0;
    v9 = 0;
LABEL_34:
    v18 = 0;
    v19 = 1;
    v17 = 1;
    goto LABEL_35;
  }
  cf = 0;
  v9 = off_1ECD09E50(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v6, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v10 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = cf;
      _os_log_error_impl(&dword_1817D9000, v10, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Annotating the token chain): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
  if (!v9)
  {
    v16 = 0;
    goto LABEL_34;
  }
  cf = 0;
  v11 = off_1ECD09E58(v9, 0, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v12 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = cf;
      _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Obtaining the first token): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
  cf = 0;
  v13 = off_1ECD09E60(v11, 6, &cf);
  if ((v13 & (cf == 0)) != 0)
    v14 = v11;
  else
    v14 = 0;
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v15 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = cf;
      _os_log_error_impl(&dword_1817D9000, v15, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Checking that the token is the correct type): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
    goto LABEL_30;
  }
  if (!v14)
  {
LABEL_30:
    v16 = 0;
LABEL_31:
    v17 = 0;
    v18 = 0;
    v19 = 1;
    goto LABEL_35;
  }
  cf = 0;
  v16 = (const __CFArray *)off_1ECD09E68(v14, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v20 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = cf;
      _os_log_error_impl(&dword_1817D9000, v20, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Casting a token to obtain a morphological word token): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
  if (!v16)
    goto LABEL_31;
  cf = 0;
  v16 = (const __CFArray *)off_1ECD09E70(v16, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1)
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    v21 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = cf;
      _os_log_error_impl(&dword_1817D9000, v21, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Obtaining the lemma mappings for a morphological word token): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
  if (!v16)
    goto LABEL_31;
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  Count = CFArrayGetCount(v16);
  if (Count < 1)
  {
    v19 = 0;
    v17 = 0;
  }
  else
  {
    v23 = Count;
    v31 = a4;
    for (i = 0; i != v23; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v16, i);
      cf = 0;
      v26 = off_1ECD09E78(ValueAtIndex, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v27 = p_opt_inst_meths[414];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v34 = cf;
          _os_log_error_impl(&dword_1817D9000, v27, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Obtaining surface form grammemes): %{public}@", buf, 0xCu);
        }
        CFRelease(cf);
      }
      else
      {
        v28 = (void *)off_1ECD09E80(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v26, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v29 = p_opt_inst_meths[414];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v34 = cf;
            _os_log_error_impl(&dword_1817D9000, v29, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Obtaining dictionary names for grammemes): %{public}@", buf, 0xCu);
          }
          CFRelease(cf);
        }
        else
        {
          v30 = -[NSMorphology initWithMorphunAttributeValues:]([NSMorphology alloc], "initWithMorphunAttributeValues:", v28);
          if (-[NSMorphology partOfSpeech](v30, "partOfSpeech") != (NSGrammaticalPartOfSpeechAbbreviation|NSGrammaticalPartOfSpeechDeterminer))
            objc_msgSend(v18, "addObject:", v30);

        }
        p_opt_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSXPCListenerDelegate + 40);
      }
    }
    v19 = 0;
    v17 = 0;
    a4 = v31;
  }
LABEL_35:
  if (objc_msgSend(v18, "count"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v18;
    *a4 = 1;
    if ((v19 & 1) != 0)
      goto LABEL_38;
    goto LABEL_37;
  }

  if ((v19 & 1) == 0)
LABEL_37:
    CFRelease(v16);
LABEL_38:
  if ((v17 & 1) == 0)
    off_1ECD09E88(v9);
  if (v6)
    off_1ECD09E88(v6);
}

@end
