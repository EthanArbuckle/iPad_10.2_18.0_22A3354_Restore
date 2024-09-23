@implementation _WKWebsiteDataSize

- (_WKWebsiteDataSize)initWithSize:(const void *)a3
{
  _WKWebsiteDataSize *v4;
  _WKWebsiteDataSize *v5;
  void *v6;
  uint64_t isa;
  objc_super v9;
  objc_class *v10;

  v9.receiver = self;
  v9.super_class = (Class)_WKWebsiteDataSize;
  v4 = -[_WKWebsiteDataSize init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_size = *(_QWORD *)a3;
    WTF::HashTable<unsigned int,WTF::KeyValuePair<unsigned int,unsigned long long>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned int,unsigned long long>>,WTF::DefaultHash<unsigned int>,WTF::HashMap<unsigned int,unsigned long long,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<unsigned long long>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned int>>::HashTable((uint64_t *)&v10, (_DWORD **)a3 + 1);
    isa = (uint64_t)v5[1].super.isa;
    v5[1].super.isa = v10;
    v10 = (objc_class *)isa;
    if (isa)
      WTF::fastFree((WTF *)(isa - 16), v6);
  }
  return v5;
}

- (unint64_t)totalSize
{
  return self->_size;
}

- (unint64_t)sizeOfDataTypes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  Class isa;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v24;
  v22 = CFSTR("_WKWebsiteDataTypeAlternativeServices");
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(a3);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeCookies"), v22) & 1) != 0)
      {
        v11 = 1;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeFetchCache")) & 1) != 0)
      {
        v11 = 0x8000;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeDiskCache")) & 1) != 0)
      {
        v11 = 2;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeMemoryCache")) & 1) != 0)
      {
        v11 = 4;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeOfflineWebApplicationCache")) & 1) != 0)
      {
        v11 = 8;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeSessionStorage")) & 1) != 0)
      {
        v11 = 16;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeLocalStorage")) & 1) != 0)
      {
        v11 = 32;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeWebSQLDatabases")) & 1) != 0)
      {
        v11 = 64;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeIndexedDBDatabases")) & 1) != 0)
      {
        v11 = 128;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeServiceWorkerRegistrations")) & 1) != 0)
      {
        v11 = 0x4000;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeFileSystem")) & 1) != 0)
      {
        v11 = 0x80000;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("_WKWebsiteDataTypeHSTSCache")) & 1) != 0)
      {
        v11 = 512;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeMediaKeys")) & 1) != 0)
      {
        v11 = 256;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeHashSalt")) & 1) != 0)
      {
        v11 = 0x10000;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WKWebsiteDataTypeSearchFieldRecentSearches")) & 1) != 0)
      {
        v11 = 1024;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("_WKWebsiteDataTypeResourceLoadStatistics")) & 1) != 0)
      {
        v11 = 4096;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("_WKWebsiteDataTypeCredentials")) & 1) != 0)
      {
        v11 = 0x2000;
        goto LABEL_43;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("_WKWebsiteDataTypeAdClickAttributions")) & 1) != 0
        || (objc_msgSend(v10, "isEqualToString:", CFSTR("_WKWebsiteDataTypePrivateClickMeasurements")) & 1) != 0)
      {
        v11 = 0x20000;
        goto LABEL_43;
      }
      if (objc_msgSend(v10, "isEqualToString:", v22))
      {
        v11 = 0x40000;
LABEL_43:
        isa = self[1].super.isa;
        if (isa)
        {
          v13 = *((_DWORD *)isa - 2);
          v14 = 9 * ((v11 + ~(v11 << 15)) ^ ((v11 + ~(v11 << 15)) >> 10));
          v15 = (v14 ^ (v14 >> 6)) + ~((v14 ^ (v14 >> 6)) << 11);
          v16 = v13 & (v15 ^ HIWORD(v15));
          v17 = *((_DWORD *)isa + 4 * v16);
          if (v17 != v11)
          {
            v18 = 1;
            while (v17)
            {
              v16 = ((_DWORD)v16 + v18) & v13;
              v17 = *((_DWORD *)isa + 4 * v16);
              ++v18;
              if (v17 == v11)
                goto LABEL_48;
            }
            goto LABEL_49;
          }
LABEL_48:
          v19 = *((_QWORD *)isa + 2 * v16 + 1);
        }
        else
        {
LABEL_49:
          v19 = 0;
        }
        v7 += v19;
      }
      ++v9;
    }
    while (v9 != v6);
    v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v6 = v20;
  }
  while (v20);
  return v7;
}

- (void).cxx_destruct
{
  Class isa;

  isa = self[1].super.isa;
  if (isa)
    WTF::fastFree((Class)((char *)isa - 16), (void *)a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
