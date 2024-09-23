@implementation SGLexiconML

+ (BOOL)profanityInTokens:(id)a3 forLocaleIdentifier:(id)a4
{
  id v6;
  id v7;
  __CFDictionary *Mutable;
  const void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  const void *v16;
  int MetaFlags;
  int v18;
  CFStringRef v19;
  BOOL v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CFErrorRef err;
  uint8_t v28[128];
  uint8_t buf[4];
  const void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE5F198], v7);
  err = 0;
  v9 = (const void *)LXLexiconCreate();
  CFRelease(Mutable);
  if (v9)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v6;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(__CFString **)(*((_QWORD *)&v23 + 1) + 8 * v14);
        if (!CFStringGetCStringPtr(v15, 4u)
          && !-[__CFString lengthOfBytesUsingEncoding:](v15, "lengthOfBytesUsingEncoding:", 4, (_QWORD)v23))
        {
          break;
        }
        if (objc_msgSend(a1, "_lexiconTokenForToken:inLexicon:", v15, v9, (_QWORD)v23))
        {
          v16 = (const void *)LXLexiconCopyEntryForTokenID();
          MetaFlags = LXEntryGetMetaFlags();
          if ((MetaFlags & 0x1800000) != 0)
          {
            CFRelease(v16);
LABEL_24:
            v20 = 1;
            goto LABEL_25;
          }
          v18 = MetaFlags;
          CFRelease(v16);
          if ((v18 & 0x2000000) != 0)
            goto LABEL_24;
        }
        if (v12 == ++v14)
        {
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v12)
            goto LABEL_4;
          goto LABEL_18;
        }
      }
      sgLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21ABF4000, v21, OS_LOG_TYPE_ERROR, "SGLexicon: non utf-8 token passed", buf, 2u);
      }

      goto LABEL_24;
    }
  }
  else
  {
    v19 = CFErrorCopyDescription(err);
    if (!v19)
    {
      v20 = 0;
      goto LABEL_26;
    }
    v9 = v19;
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v9;
      _os_log_error_impl(&dword_21ABF4000, v10, OS_LOG_TYPE_ERROR, "SGLexicon: Unable to load lexicon, %@", buf, 0xCu);
    }
  }
LABEL_18:
  v20 = 0;
LABEL_25:

  CFRelease(v9);
LABEL_26:

  return v20;
}

+ (unsigned)_lexiconTokenForToken:(id)a3 inLexicon:(_LXLexicon *)a4
{
  id v4;
  unsigned int v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  LXLexiconEnumerateEntriesForString();
  v5 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);

  return v5;
}

void __47__SGLexiconML__lexiconTokenForToken_inLexicon___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  const __CFString *v5;

  v5 = (const __CFString *)LXEntryCopyString();
  if (CFStringCompare(v5, *(CFStringRef *)(a1 + 40), 0) == kCFCompareEqualTo)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = LXEntryGetTokenID();
    *a3 = 1;
  }
  CFRelease(v5);
}

@end
