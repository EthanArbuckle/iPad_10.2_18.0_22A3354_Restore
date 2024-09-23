@implementation _WKSmartCardSlotObserver

- (_WKSmartCardSlotObserver)initWithService:(void *)a3
{
  _WKSmartCardSlotObserver *v4;
  void *v5;
  _WKSmartCardSlotObserver *v6;
  DefaultWeakPtrImpl *v7;
  unsigned int *m_ptr;
  unsigned int v9;
  unsigned int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_WKSmartCardSlotObserver;
  v4 = -[_WKSmartCardSlotObserver init](&v12, sel_init);
  v6 = v4;
  if (v4)
  {
    v7 = *(DefaultWeakPtrImpl **)a3;
    *(_QWORD *)a3 = 0;
    m_ptr = (unsigned int *)v4->m_service.m_impl.m_ptr;
    v6->m_service.m_impl.m_ptr = v7;
    if (m_ptr)
    {
      do
      {
        v9 = __ldaxr(m_ptr);
        v10 = v9 - 1;
      }
      while (__stlxr(v10, m_ptr));
      if (!v10)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v5);
      }
    }
  }
  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  unsigned int *m_ptr;
  unsigned int v8;
  _QWORD *v9;
  _QWORD *v10;

  m_ptr = (unsigned int *)self->m_service.m_impl.m_ptr;
  if (m_ptr)
  {
    do
      v8 = __ldaxr(m_ptr);
    while (__stlxr(v8 + 1, m_ptr));
  }
  if (a5)
    CFRetain(a5);
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v9 = &off_1E34CC5F8;
  v9[1] = m_ptr;
  v9[2] = a5;
  v10 = v9;
  WTF::callOnMainRunLoop();
  if (v10)
    (*(void (**)(_QWORD *))(*v10 + 8))(v10);
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->m_service.m_impl.m_ptr;
  self->m_service.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (_QWORD)observeValueForKeyPath:(_QWORD *)a1 ofObject:(void *)a2 change:context:
{
  const void *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  *a1 = &off_1E34CC5F8;
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (unsigned int *)a1[1];
  a1[1] = 0;
  if (v4)
  {
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      atomic_store(1u, v4);
      WTF::fastFree((WTF *)v4, a2);
    }
  }
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  const void *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  *(_QWORD *)this = &off_1E34CC5F8;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (unsigned int *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
  {
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      atomic_store(1u, v4);
      WTF::fastFree((WTF *)v4, a2);
    }
  }
  return WTF::fastFree(this, a2);
}

- (WTF::StringImpl)observeValueForKeyPath:(WTF::StringImpl *)result ofObject:change:context:
{
  WTF::StringImpl *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t i;
  uint64_t v7;
  const WTF::StringImpl *v8;
  const WTF::StringImpl *v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  uint64_t v12;
  void *v13;
  WTF::StringImpl *v14;
  _QWORD *v15;
  WTF::StringImpl *v16;
  _QWORD *v17;
  WTF::StringImpl **v18;
  const WTF::StringImpl *v19;
  WTF::StringImpl **v20;
  WTF::StringImpl **v21;
  WTF::StringImpl **v22;
  WTF::StringImpl **v23;
  WTF::StringImpl **v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  int j;
  int v29;
  WTF *v30;
  WTF::StringImpl *v31;
  const WTF::StringImpl *v32;
  WTF::StringImpl **v33;
  WTF::StringImpl **v34;
  WTF::StringImpl **v35;
  WTF::StringImpl **v36;
  WTF::StringImpl **v37;
  WTF::StringImpl **v38;
  uint64_t v39;
  WTF::StringImpl *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v47;
  uint64_t *v48;
  _BYTE v49[24];
  WTF::StringImpl *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  WTF::StringImpl **v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v1 = result[1];
  if (v1)
  {
    v47 = *((_QWORD *)v1 + 1);
    if (v47)
    {
      v2 = (void *)-[WTF::StringImpl objectForKeyedSubscript:](result[2], "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
      v55 = 0;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v3)
      {
        v4 = *(_QWORD *)v52;
        v5 = (uint64_t *)(v47 + 80);
        do
        {
          for (i = 0; i != v3; ++i)
          {
            if (*(_QWORD *)v52 != v4)
              objc_enumerationMutation(v2);
            v7 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
            MEMORY[0x19AEABCC8](&v50, v7);
            WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v55, &v50, v8, (uint64_t)v49);
            v10 = WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::find<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(v5, &v50, v9);
            v12 = *v5;
            if (*v5)
              v12 += 16 * *(unsigned int *)(v12 - 4);
            if (v12 == v10)
            {
              v13 = (void *)objc_msgSend(MEMORY[0x1E0CA9B08], "defaultManager");
              v14 = v50;
              if (v50)
                *(_DWORD *)v50 += 2;
              v15 = malloc_type_malloc(0x30uLL, 0x10E004002B5D1D8uLL);
              *v15 = MEMORY[0x1E0C809A0];
              v15[1] = 50331650;
              v15[2] = WTF::BlockPtr<void ()(TKSmartCardSlot *)>::fromCallable<WebKit::CcidService::updateSlots(NSArray *)::$_0>(WebKit::CcidService::updateSlots(NSArray *)::$_0)::{lambda(void *,TKSmartCardSlot *)#1}::__invoke;
              v15[3] = &WTF::BlockPtr<void ()(TKSmartCardSlot *)>::fromCallable<WebKit::CcidService::updateSlots(NSArray *)::$_0>(WebKit::CcidService::updateSlots(NSArray *)::$_0)::descriptor;
              v15[4] = v47;
              v15[5] = v14;
              objc_msgSend(v13, "getSlotWithName:reply:", v7, v15);
              _Block_release(v15);
            }
            v16 = v50;
            v50 = 0;
            if (v16)
            {
              if (*(_DWORD *)v16 == 2)
                WTF::StringImpl::destroy(v16, v11);
              else
                *(_DWORD *)v16 -= 2;
            }
          }
          v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        }
        while (v3);
      }
      v50 = 0;
      v17 = *(_QWORD **)(v47 + 80);
      v48 = (uint64_t *)(v47 + 80);
      v18 = (WTF::StringImpl **)WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::begin(v17);
      v20 = v18;
      v22 = v21;
      if (v17)
        v23 = (WTF::StringImpl **)&v17[2 * *((unsigned int *)v17 - 1)];
      else
        v23 = 0;
      if (v23 != v18)
      {
        do
        {
          v24 = v55;
          if (!v55)
          {
LABEL_25:
            WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v50, v20, v19, (uint64_t)v49);
            -[WTF::StringImpl removeObserver](v20[1], "removeObserver");
            goto LABEL_26;
          }
          v25 = *((_DWORD *)v55 - 2);
          v26 = *((_DWORD *)*v20 + 4);
          if (v26 >= 0x100)
            v27 = v26 >> 8;
          else
            v27 = WTF::StringImpl::hashSlowCase(*v20);
          for (j = 0; ; v27 = j + v29)
          {
            v29 = v27 & v25;
            v30 = v24[v27 & v25];
            if (v30 != (WTF *)-1)
            {
              if (!v30)
                goto LABEL_25;
              if ((WTF::equal(v30, *v20, v19) & 1) != 0)
                break;
            }
            ++j;
          }
LABEL_26:
          while (1)
          {
            v20 += 2;
            if (v20 == v22)
              break;
            if ((unint64_t)*v20 + 1 > 1)
              goto LABEL_30;
          }
          v20 = v22;
LABEL_30:
          ;
        }
        while (v20 != v23);
      }
      v33 = (WTF::StringImpl **)WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::begin((_QWORD **)&v50);
      v34 = (WTF::StringImpl **)v31;
      v35 = (WTF::StringImpl **)v50;
      if (v50)
        v36 = (WTF::StringImpl **)((char *)v50 + 8 * *((unsigned int *)v50 - 1));
      else
        v36 = 0;
      if (v36 != v33)
      {
        do
        {
          v37 = (WTF::StringImpl **)WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::find<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(v48, v33, v32);
          v38 = v37;
          if (*v48)
          {
            v39 = *v48 + 16 * *(unsigned int *)(*v48 - 4);
            if ((WTF::StringImpl **)v39 == v37)
              goto LABEL_61;
          }
          else
          {
            if (!v37)
              goto LABEL_61;
            v39 = 0;
          }
          if ((WTF::StringImpl **)v39 != v37)
          {
            WTF::HashTraits<WTF::String>::customDeleteBucket(v37, v31);
            v40 = v38[1];
            v38[1] = 0;
            if (v40)
              CFRelease(v40);
            ++*(_DWORD *)(*v48 - 16);
            v41 = *v48;
            if (*v48)
              v42 = *(_DWORD *)(v41 - 12) - 1;
            else
              v42 = -1;
            *(_DWORD *)(v41 - 12) = v42;
            v43 = *v48;
            if (*v48)
            {
              v44 = 6 * *(_DWORD *)(v43 - 12);
              v45 = *(_DWORD *)(v43 - 4);
              if (v44 < v45 && v45 >= 9)
                WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::rehash(v48, v45 >> 1);
            }
          }
LABEL_61:
          while (++v33 != v34)
          {
            if ((unint64_t)*v33 + 1 > 1)
              goto LABEL_65;
          }
          v33 = v34;
LABEL_65:
          ;
        }
        while (v33 != v36);
        v35 = (WTF::StringImpl **)v50;
      }
      if (v35)
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v35, v31);
      result = v55;
      if (v55)
        return (WTF::StringImpl **)WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v55, v31);
    }
  }
  return result;
}

@end
