@implementation ZN6WebKit43StorageAccessUserAgentStringQuirkController12updateQuirksEON3WTF17CompletionHandlerIFvvEEE

WTF::StringImpl **___ZN6WebKit43StorageAccessUserAgentStringQuirkController12updateQuirksEON3WTF17CompletionHandlerIFvvEEE_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  WTF::StringImpl *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  WTF::ASCIICaseInsensitiveHash *v10;
  const WTF::StringImpl *v11;
  uint64_t v12;
  WTF::StringImpl **v13;
  int v14;
  unsigned int v15;
  WTF::StringImpl **v16;
  const WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  const WTF::StringImpl *v19;
  WTF::StringImpl **v20;
  int v21;
  WTF::StringImpl **v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  WTF::ASCIICaseInsensitiveHash *v26;
  WTF::StringImpl *v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  WTF::StringImpl *v33;
  uint64_t v34;
  WTF::StringImpl **v35;
  WTF::StringImpl **v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  WTF::ASCIICaseInsensitiveHash *v42;
  uint64_t v43;
  uint64_t v44;
  WTF::StringImpl *v45;
  WTF::StringImpl **result;
  uint64_t v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  WTF::StringImpl *v51[2];
  uint64_t v52;
  uint8_t buf[12];
  unsigned int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  WTF::StringImpl **v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v59 = 0;
  if (a3)
  {
    v4 = qword_1ECE71758;
    if (os_log_type_enabled((os_log_t)qword_1ECE71758, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_196BCC000, v4, OS_LOG_TYPE_ERROR, "Failed to request storage access user agent string quirks from WebPrivacy.", buf, 2u);
    }
    goto LABEL_58;
  }
  v5 = (void *)objc_msgSend(a2, "quirks");
  v47 = v3;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v7)
  {
    obj = v5;
    v49 = *(_QWORD *)v56;
    do
    {
      v8 = 0;
      v50 = v7;
      do
      {
        if (*(_QWORD *)v56 != v49)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v8);
        MEMORY[0x19AEABCC8](v51, objc_msgSend(v9, "domain"));
        v10 = v51[0];
        if (v51[0] && *((_DWORD *)v51[0] + 1))
        {
          v51[0] = 0;
        }
        else
        {
          WTF::StringImpl::createWithoutCopyingNonEmpty();
          v10 = *(WTF::ASCIICaseInsensitiveHash **)buf;
        }
        v12 = objc_msgSend(v9, "userAgentString");
        v13 = v59;
        if (v59
          || (WTF::HashTable<WebCore::RegistrableDomain,WTF::KeyValuePair<WebCore::RegistrableDomain,WTF::String>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::RegistrableDomain,WTF::String>>,WTF::DefaultHash<WebCore::RegistrableDomain>,WTF::HashMap<WebCore::RegistrableDomain,WTF::String,WTF::DefaultHash<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::RegistrableDomain>>::expand((uint64_t *)&v59, 0), (v13 = v59) != 0))
        {
          v14 = *((_DWORD *)v13 - 2);
        }
        else
        {
          v14 = 0;
        }
        v15 = WTF::ASCIICaseInsensitiveHash::hash(v10, v11) & v14;
        v16 = &v13[2 * v15];
        if ((WTF::equal(*v16, 0, v17) & 1) == 0)
        {
          v20 = 0;
          v21 = 1;
          do
          {
            v22 = v16;
            if (*v16 != (WTF::StringImpl *)-1)
            {
              v22 = v20;
              if (WTF::equalIgnoringASCIICase(*v16, v10, v19))
              {
                if (*(_DWORD *)v10 == 2)
                  WTF::StringImpl::destroy(v10, v23);
                else
                  *(_DWORD *)v10 -= 2;
                v25 = v50;
                goto LABEL_47;
              }
            }
            v15 = (v15 + v21) & v14;
            v16 = &v13[2 * v15];
            ++v21;
            v20 = v22;
          }
          while (!WTF::equal(*v16, 0, v19));
          if (v22)
          {
            *v22 = 0;
            v22[1] = 0;
            --*((_DWORD *)v59 - 4);
            v16 = v22;
          }
        }
        v24 = *v16;
        *v16 = v10;
        v25 = v50;
        if (v24)
        {
          if (*(_DWORD *)v24 == 2)
            WTF::StringImpl::destroy(v24, v18);
          else
            *(_DWORD *)v24 -= 2;
        }
        MEMORY[0x19AEABCC8](buf, v12);
        v26 = *(WTF::ASCIICaseInsensitiveHash **)buf;
        *(_QWORD *)buf = 0;
        v27 = v16[1];
        v16[1] = v26;
        if (v27)
        {
          v28 = *(_DWORD *)v27 - 2;
          if (*(_DWORD *)v27 != 2)
            goto LABEL_31;
          WTF::StringImpl::destroy(v27, v23);
          v27 = *(WTF::StringImpl **)buf;
          *(_QWORD *)buf = 0;
          if (!v27)
            goto LABEL_32;
          v28 = *(_DWORD *)v27 - 2;
          if (*(_DWORD *)v27 == 2)
            WTF::StringImpl::destroy(v27, v23);
          else
LABEL_31:
            *(_DWORD *)v27 = v28;
        }
LABEL_32:
        if (v59)
          v29 = *((_DWORD *)v59 - 3) + 1;
        else
          v29 = 1;
        *((_DWORD *)v59 - 3) = v29;
        if (v59)
          v30 = *((_DWORD *)v59 - 3);
        else
          v30 = 0;
        v31 = (*((_DWORD *)v59 - 4) + v30);
        v32 = *((unsigned int *)v59 - 1);
        if (v32 <= 0x400)
        {
          if (3 * v32 > 4 * v31)
            goto LABEL_47;
LABEL_40:
          WTF::HashTable<WebCore::RegistrableDomain,WTF::KeyValuePair<WebCore::RegistrableDomain,WTF::String>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::RegistrableDomain,WTF::String>>,WTF::DefaultHash<WebCore::RegistrableDomain>,WTF::HashMap<WebCore::RegistrableDomain,WTF::String,WTF::DefaultHash<WebCore::RegistrableDomain>,WTF::HashTraits<WebCore::RegistrableDomain>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::RegistrableDomain>>::expand((uint64_t *)&v59, v16);
          goto LABEL_47;
        }
        if (v32 <= 2 * v31)
          goto LABEL_40;
LABEL_47:
        v33 = v51[0];
        v51[0] = 0;
        if (v33)
        {
          if (*(_DWORD *)v33 == 2)
            WTF::StringImpl::destroy(v33, v23);
          else
            *(_DWORD *)v33 -= 2;
        }
        ++v8;
      }
      while (v8 != v25);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      v7 = v34;
    }
    while (v34);
  }
  v35 = v59;
  v59 = 0;
  v36 = *(WTF::StringImpl ***)(v47 + 8);
  *(_QWORD *)(v47 + 8) = v35;
  if (v36)
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::String>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::String>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v36, v6);
LABEL_58:
  v51[0] = (WTF::StringImpl *)&v52;
  v51[1] = (WTF::StringImpl *)1;
  WTF::VectorBuffer<WTF::CompletionHandler<void ()(void)>,1ul,WTF::FastMalloc>::VectorBuffer((uint64_t)buf, (uint64_t)&qword_1EE3416D0);
  if (dword_1EE3416DC)
  {
    v37 = (uint64_t *)qword_1EE3416D0;
    v38 = 8 * dword_1EE3416DC;
    do
    {
      v39 = *v37;
      *v37 = 0;
      if (v39)
        (*(void (**)(uint64_t))(*(_QWORD *)v39 + 8))(v39);
      ++v37;
      v38 -= 8;
    }
    while (v38);
  }
  WTF::VectorBuffer<WTF::CompletionHandler<void ()(void)>,1ul,WTF::FastMalloc>::adopt((uint64_t)&qword_1EE3416D0, v51);
  WTF::Vector<WTF::CompletionHandler<void ()(void)>,1ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v51, v40);
  if (v54)
  {
    v42 = *(WTF::ASCIICaseInsensitiveHash **)buf;
    v43 = 8 * v54;
    do
    {
      v44 = *(_QWORD *)v42;
      *(_QWORD *)v42 = 0;
      (*(void (**)(uint64_t))(*(_QWORD *)v44 + 16))(v44);
      (*(void (**)(uint64_t))(*(_QWORD *)v44 + 8))(v44);
      v42 = (WTF::ASCIICaseInsensitiveHash *)((char *)v42 + 8);
      v43 -= 8;
    }
    while (v43);
  }
  WTF::Vector<WTF::CompletionHandler<void ()(void)>,1ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)buf, v41);
  result = v59;
  if (v59)
    return (WTF::StringImpl **)WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::String>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::String>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v59, v45);
  return result;
}

@end
