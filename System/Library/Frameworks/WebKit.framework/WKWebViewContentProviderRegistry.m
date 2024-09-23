@implementation WKWebViewContentProviderRegistry

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (Vector<WTF::String,)_mimeTypesWithCustomContentProviders
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *m_tableForLLDB;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  uint64_t v8;
  unsigned int *v9;
  uint64_t v10;
  unsigned int v11;
  _DWORD *v12;
  unsigned int *v13;
  Vector<WTF::String, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> result;

  v3 = v2;
  m_tableForLLDB = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v5 = *(m_tableForLLDB - 1);
    v6 = &m_tableForLLDB[4 * v5];
    if (*(m_tableForLLDB - 3))
    {
      v7 = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
      if ((_DWORD)v5)
      {
        v8 = 16 * v5;
        v7 = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
        while ((unint64_t)(*(_QWORD *)v7 + 1) <= 1)
        {
          v7 += 4;
          v8 -= 16;
          if (!v8)
          {
            v7 = v6;
            goto LABEL_8;
          }
        }
      }
      goto LABEL_8;
    }
    v7 = &m_tableForLLDB[4 * v5];
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  v6 = &m_tableForLLDB[4 * v5];
  if (!m_tableForLLDB)
  {
    v9 = 0;
    self = 0;
    *(_QWORD *)v3 = 0;
    *(_QWORD *)(v3 + 8) = 0;
    goto LABEL_15;
  }
LABEL_8:
  v9 = &m_tableForLLDB[4 * *(m_tableForLLDB - 1)];
  *(_QWORD *)v3 = 0;
  *(_QWORD *)(v3 + 8) = 0;
  v10 = *(m_tableForLLDB - 3);
  if ((_DWORD)v10)
  {
    if (v10 >> 29)
    {
      __break(0xC471u);
      goto LABEL_29;
    }
    self = (WKWebViewContentProviderRegistry *)WTF::fastMalloc((WTF *)(8 * v10));
    *(_DWORD *)(v3 + 8) = v10;
    *(_QWORD *)v3 = self;
  }
  else
  {
    self = 0;
  }
LABEL_15:
  if (v9 != v7)
  {
    v11 = 0;
    do
    {
      v12 = *(_DWORD **)v7;
      if (*(_QWORD *)v7)
        *v12 += 2;
      *((_QWORD *)&self->super.isa + v11) = v12;
      v13 = v7 + 4;
      v7 = v6;
      if (v13 != v6)
      {
        v7 = v13;
        while ((unint64_t)(*(_QWORD *)v7 + 1) <= 1)
        {
          v7 += 4;
          if (v7 == v6)
          {
            v7 = v6;
            break;
          }
        }
      }
      ++v11;
    }
    while (v7 != v9);
    *(_DWORD *)(v3 + 12) = v11;
  }
LABEL_29:
  result.m_capacity = a2;
  result.m_size = HIDWORD(a2);
  result.m_buffer = (String *)self;
  return result;
}

- (WKWebViewContentProviderRegistry)initWithConfiguration:(id)a3
{
  WKWebViewContentProviderRegistry *v4;
  uint64_t BoolValueForKey;
  uint64_t v6;
  const WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  WebCore::MIMETypeRegistry *v14;
  WTF::StringImpl *v15;
  WTF *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v22;
  WTF *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)WKWebViewContentProviderRegistry;
  v4 = -[WKWebViewContentProviderRegistry init](&v24, sel_init);
  if (v4)
  {
    BoolValueForKey = objc_msgSend(a3, "preferences");
    if (!BoolValueForKey)
      goto LABEL_6;
    v6 = objc_msgSend(a3, "preferences");
    {
      WebKit::WebPreferencesKey::unifiedPDFEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::unifiedPDFEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::unifiedPDFEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    BoolValueForKey = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v6 + 48), (WTF::StringImpl **)&WebKit::WebPreferencesKey::unifiedPDFEnabledKey(void)::key, v7);
    if ((BoolValueForKey & 1) == 0)
    {
LABEL_6:
      WebCore::MIMETypeRegistry::pdfMIMETypes((WebCore::MIMETypeRegistry *)BoolValueForKey);
      v9 = v23;
      if (v23)
        v10 = (char *)v23 + 8;
      else
        v10 = 0;
      if (v23)
        v11 = (char *)v23 + 16 * *(unsigned int *)v23 + 8;
      else
        v11 = 0;
      if (v10 != v11)
      {
        do
        {
          v12 = objc_opt_class();
          MEMORY[0x19AEABCC8](&v22, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)v10));
          -[WKWebViewContentProviderRegistry registerProvider:forMIMEType:](v4, "registerProvider:forMIMEType:", v12, &v22);
          v13 = v22;
          v22 = 0;
          if (v13)
          {
            if (*(_DWORD *)v13 == 2)
              WTF::StringImpl::destroy(v13, v8);
            else
              *(_DWORD *)v13 -= 2;
          }
          v10 += 16;
        }
        while (v10 != v11);
        v9 = v23;
      }
      v23 = 0;
      if (v9)
        WTF::fastFree(v9, v8);
    }
    if (objc_msgSend(a3, "_systemPreviewEnabled", v22))
    {
      v14 = (WebCore::MIMETypeRegistry *)objc_msgSend((id)objc_msgSend(a3, "preferences"), "_modelDocumentEnabled");
      if ((v14 & 1) == 0)
      {
        WebCore::MIMETypeRegistry::usdMIMETypes(v14);
        v16 = v23;
        if (v23)
          v17 = (char *)v23 + 8;
        else
          v17 = 0;
        if (v23)
          v18 = (char *)v23 + 16 * *(unsigned int *)v23 + 8;
        else
          v18 = 0;
        if (v17 != v18)
        {
          do
          {
            v19 = objc_opt_class();
            MEMORY[0x19AEABCC8](&v22, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)v17));
            -[WKWebViewContentProviderRegistry registerProvider:forMIMEType:](v4, "registerProvider:forMIMEType:", v19, &v22);
            v20 = v22;
            v22 = 0;
            if (v20)
            {
              if (*(_DWORD *)v20 == 2)
                WTF::StringImpl::destroy(v20, v15);
              else
                *(_DWORD *)v20 -= 2;
            }
            v17 += 16;
          }
          while (v17 != v18);
          v16 = v23;
        }
        v23 = 0;
        if (v16)
          WTF::fastFree(v16, v15);
      }
    }
  }
  return v4;
}

- (void)registerProvider:(Class)a3 forMIMEType:(const void *)a4
{
  uint64_t *p_contentProviderForMIMEType;
  _DWORD *m_tableForLLDB;
  unsigned int v8;
  int v9;
  WTF::StringImpl **v10;
  int i;
  uint64_t v12;
  WTF::StringImpl **v13;
  WTF::StringImpl *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;

  p_contentProviderForMIMEType = (uint64_t *)&self->_contentProviderForMIMEType;
  m_tableForLLDB = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB
    || (WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::KeyValuePairKeyExtractor<objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::ASCIICaseInsensitiveHash,WTF::HashMap<WTF::String,objc_class  {objcproto24WKWebViewContentProvider},WTF::KeyValuePairKeyExtractor<objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::HashTraits<WTF::String>,WTF::HashMap<objc_class  {objcproto24WKWebViewContentProvider}>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits>::expand((uint64_t *)&self->_contentProviderForMIMEType),
        (m_tableForLLDB = (_DWORD *)*p_contentProviderForMIMEType) != 0))
  {
    v8 = *(m_tableForLLDB - 2);
  }
  else
  {
    v8 = 0;
  }
  v9 = WTF::ASCIICaseInsensitiveHash::hash(*(WTF::ASCIICaseInsensitiveHash **)a4, (const WTF::StringImpl *)a2);
  v10 = 0;
  for (i = 1; ; ++i)
  {
    v12 = v9 & v8;
    v13 = (WTF::StringImpl **)&m_tableForLLDB[4 * v12];
    v14 = *v13;
    if (*v13 == (WTF::StringImpl *)-1)
    {
      v10 = (WTF::StringImpl **)&m_tableForLLDB[4 * v12];
      goto LABEL_10;
    }
    if (!v14)
      break;
    if (WTF::equalIgnoringASCIICaseCommon<WTF::StringImpl,WTF::StringImpl>((uint64_t)v14, *(_QWORD *)a4))
    {
      *(_QWORD *)&m_tableForLLDB[4 * v12 + 2] = a3;
      return;
    }
LABEL_10:
    v9 = i + v12;
  }
  if (v10)
  {
    *v10 = 0;
    v10[1] = 0;
    --*(_DWORD *)(*p_contentProviderForMIMEType - 16);
    v13 = v10;
  }
  WTF::String::operator=(v13, (WTF::StringImpl *)a4);
  v13[1] = a3;
  v15 = *p_contentProviderForMIMEType;
  if (*p_contentProviderForMIMEType)
    v16 = *(_DWORD *)(v15 - 12) + 1;
  else
    v16 = 1;
  *(_DWORD *)(v15 - 12) = v16;
  v17 = *p_contentProviderForMIMEType;
  if (*p_contentProviderForMIMEType)
    v18 = *(_DWORD *)(v17 - 12);
  else
    v18 = 0;
  v19 = (*(_DWORD *)(v17 - 16) + v18);
  v20 = *(unsigned int *)(v17 - 4);
  if (v20 <= 0x400)
  {
    if (3 * v20 > 4 * v19)
      return;
LABEL_24:
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::KeyValuePairKeyExtractor<objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::ASCIICaseInsensitiveHash,WTF::HashMap<WTF::String,objc_class  {objcproto24WKWebViewContentProvider},WTF::KeyValuePairKeyExtractor<objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::HashTraits<WTF::String>,WTF::HashMap<objc_class  {objcproto24WKWebViewContentProvider}>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits>::expand(p_contentProviderForMIMEType);
    return;
  }
  if (v20 <= 2 * v19)
    goto LABEL_24;
}

- (void).cxx_destruct
{
  unsigned int *m_tableForLLDB;
  uint64_t v3;
  WTF::StringImpl **m_table;
  WTF::StringImpl *v5;

  m_tableForLLDB = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v3 = *(m_tableForLLDB - 1);
    if ((_DWORD)v3)
    {
      m_table = (WTF::StringImpl **)self->_contentProviderForMIMEType.m_impl.var0.m_table;
      do
      {
        v5 = *m_table;
        if (*m_table != (WTF::StringImpl *)-1)
        {
          *m_table = 0;
          if (v5)
          {
            if (*(_DWORD *)v5 == 2)
              WTF::StringImpl::destroy(v5, (WTF::StringImpl *)a2);
            else
              *(_DWORD *)v5 -= 2;
          }
        }
        m_table += 2;
        --v3;
      }
      while (v3);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
}

- (Class)providerForMIMEType:(const void *)a3
{
  Class result;
  unsigned int *m_tableForLLDB;
  unsigned int v7;
  int v8;
  int i;
  uint64_t v10;
  uint64_t v11;
  Class *m_table;
  Class *v13;

  result = *(Class *)a3;
  if (*(_QWORD *)a3)
  {
    if (!*((_DWORD *)result + 1))
      return 0;
    m_tableForLLDB = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
    if (!m_tableForLLDB)
      return 0;
    v7 = *(m_tableForLLDB - 2);
    v8 = WTF::ASCIICaseInsensitiveHash::hash(result, (const WTF::StringImpl *)a2);
    for (i = 0; ; v8 = ++i + v10)
    {
      v10 = v8 & v7;
      v11 = *(_QWORD *)&m_tableForLLDB[4 * v10];
      if (v11 != -1)
      {
        if (!v11)
        {
          m_table = (Class *)self->_contentProviderForMIMEType.m_impl.var0.m_table;
          if (!m_table)
            return 0;
          v13 = &m_table[2 * *((unsigned int *)m_table - 1)];
          goto LABEL_12;
        }
        if (WTF::equalIgnoringASCIICaseCommon<WTF::StringImpl,WTF::StringImpl>(v11, *(_QWORD *)a3))
          break;
      }
    }
    v13 = (Class *)&m_tableForLLDB[4 * v10];
    m_table = (Class *)self->_contentProviderForMIMEType.m_impl.var0.m_table;
    if (!m_table)
      goto LABEL_13;
LABEL_12:
    m_table += 2 * *((unsigned int *)m_table - 1);
LABEL_13:
    if (m_table != v13)
      return v13[1];
    else
      return 0;
  }
  return result;
}

@end
