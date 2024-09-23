@implementation ZN6WebKit16WebsiteDataStore30defaultGeneralStorageDirectoryERKN3WTF6StringE

WTF::StringImpl *___ZN6WebKit16WebsiteDataStore30defaultGeneralStorageDirectoryERKN3WTF6StringE_block_invoke(uint64_t a1)
{
  WTF::StringImpl *v2;
  uint64_t v3;
  WTF::StringImpl *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v2 = v26;
  v24 = v26;
  WebKit::WebsiteDataStore::cacheDirectoryFileSystemRepresentation(&v24, v3, 0);
  if (v2)
  {
    if (*(_DWORD *)v2 == 2)
      WTF::StringImpl::destroy(v2, v4);
    else
      *(_DWORD *)v2 -= 2;
  }
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if (v25)
    v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v6 = &stru_1E351F1B8;
  v7 = (void *)objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v6, 0);
  v8 = v7;
  if (v7)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
          if (objc_msgSend(v12, "length"))
          {
            if (*(_QWORD *)(a1 + 32))
              v13 = (__CFString *)WTF::StringImpl::operator NSString *();
            else
              v13 = &stru_1E351F1B8;
            v14 = -[__CFString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", v12);
            if (v25)
              v15 = (__CFString *)WTF::StringImpl::operator NSString *();
            else
              v15 = &stru_1E351F1B8;
            objc_msgSend(v5, "moveItemAtPath:toPath:error:", -[__CFString stringByAppendingPathComponent:](v15, "stringByAppendingPathComponent:", v12), v14, 0);
          }
          ++v11;
        }
        while (v9 != v11);
        v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
        v9 = v16;
      }
      while (v16);
    }
  }
  if (v25)
    v17 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v17 = &stru_1E351F1B8;
  objc_msgSend(v5, "removeItemAtPath:error:", v17, 0);
  result = v25;
  v25 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v18);
    else
      *(_DWORD *)result -= 2;
  }
  return result;
}

@end
