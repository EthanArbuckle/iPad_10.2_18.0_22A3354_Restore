@implementation NSBundleODRDataCommon

NSError *__58___NSBundleODRDataCommon_assetPacksBecameAvailable_error___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSNotificationCenter *v10;
  NSError *result;
  void *v12;
  NSString **v13;
  const __CFString **v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("_NSODRURLKey"));
  if (v7)
  {
    v8 = v7;
    if (qword_1ECD056F0 != -1)
      dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
    v9 = qword_1ECD056E8;
    if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(_QWORD *)(a1[4] + 24);
      *(_DWORD *)buf = 134218499;
      v19 = v15;
      v20 = 2114;
      v21 = a2;
      v22 = 2113;
      v23 = v8;
      _os_log_debug_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEBUG, "Pin: Bundle 0x%p / Asset Pack ID: %{public}@ / URL: %{private}@", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", v8, a2);
    objc_msgSend(*(id *)(a1[4] + 24), "_cfBundle");
    if (_CFBundleAddResourceURL())
    {
      v10 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
      return (NSError *)-[NSNotificationCenter postNotificationName:object:userInfo:](v10, "postNotificationName:object:userInfo:", CFSTR("_NSBundleResourceRequestAssetPackPinnedNotification"), *(_QWORD *)(a1[4] + 24), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a2, CFSTR("_NSBundleResourceRequestAssetPackNotificationAssetPackIDKey")));
    }
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    *a4 = 1;
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to add the URL %@ to the bundle %@"), v8, *(_QWORD *)(a1[4] + 24), CFSTR("NSDebugDescription"));
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = &v17;
    v14 = (const __CFString **)&v16;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    *a4 = 1;
    v24 = CFSTR("NSDebugDescription");
    v25[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Response to begin was missing a URL (%@)"), *(_QWORD *)(a1[4] + 24));
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = (NSString **)v25;
    v14 = &v24;
  }
  result = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 256, objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1));
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

NSError *__60___NSBundleODRDataCommon_assetPacksBecameUnavailable_error___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSNotificationCenter *v10;
  NSError *result;
  void *v12;
  NSString **v13;
  const __CFString **v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  const __CFString *v20;
  NSString *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("_NSODRURLKey"));
  if (!v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    *a4 = 1;
    v22 = CFSTR("NSDebugDescription");
    v23[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Response to begin was missing a URL (%@)"), *(_QWORD *)(a1[4] + 24));
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = (NSString **)v23;
    v14 = &v22;
LABEL_10:
    result = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 256, objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1));
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
    return result;
  }
  v8 = v7;
  objc_msgSend(*(id *)(a1[4] + 24), "_cfBundle");
  if (!_CFBundleRemoveResourceURL())
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    *a4 = 1;
    v20 = CFSTR("NSDebugDescription");
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to remove the URL %@ to the bundle %@"), v8, *(_QWORD *)(a1[4] + 24));
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = &v21;
    v14 = &v20;
    goto LABEL_10;
  }
  if (qword_1ECD056F0 != -1)
    dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
  v9 = qword_1ECD056E8;
  if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(_QWORD *)(a1[4] + 24);
    *(_DWORD *)buf = 134218242;
    v17 = v15;
    v18 = 2114;
    v19 = a2;
    _os_log_debug_impl(&dword_1817D9000, v9, OS_LOG_TYPE_DEBUG, "Unpin: Bundle 0x%p / Asset Pack ID: %{public}@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a2);
  v10 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  return (NSError *)-[NSNotificationCenter postNotificationName:object:userInfo:](v10, "postNotificationName:object:userInfo:", CFSTR("_NSBundleResourceRequestAssetPackUnpinnedNotification"), *(_QWORD *)(a1[4] + 24), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a2, CFSTR("_NSBundleResourceRequestAssetPackNotificationAssetPackIDKey")));
}

@end
