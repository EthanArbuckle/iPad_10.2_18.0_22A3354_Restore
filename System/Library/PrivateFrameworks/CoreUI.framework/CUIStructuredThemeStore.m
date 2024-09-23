@implementation CUIStructuredThemeStore

- (id)copyLookupKeySignatureForKey:(const _renditionkeytoken *)a3
{
  char v6[256];
  _OWORD v7[6];

  memset(v7, 0, 92);
  CUIRenditionKeyCopy(v7, a3, 0x16u);
  return objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v6, CUICopyKeySignature(v6, 0x100uLL, (int *)a3, (uint64_t)-[CUIStructuredThemeStore keyFormat](self, "keyFormat"), (uint64_t *)-[CUIStructuredThemeStore keyAttributeIndex](self, "keyAttributeIndex")), 1);
}

- (BOOL)_formatStorageKeyArrayBytes:(void *)a3 length:(unint64_t)a4 fromKey:(const _renditionkeytoken *)a5
{
  const _renditionkeyfmt *v9;
  const _renditionkeyattributeindex *v10;
  uint64_t *v12;
  uint64_t var2;
  int v14[22];

  v9 = -[CUIStructuredThemeStore keyFormat](self, "keyFormat");
  v10 = -[CUIStructuredThemeStore keyAttributeIndex](self, "keyAttributeIndex");
  if (!a3 || a4 < 2 * (unint64_t)v9->var2)
    return 0;
  v12 = (uint64_t *)v10;
  CUIRenditionKeyCopy(v14, a5, 0x16u);
  -[CUIStructuredThemeStore _updateKeyWithCompatibilityMapping:](self, "_updateKeyWithCompatibilityMapping:", v14);
  CUIFillCARKeyArrayForRenditionKey2((uint64_t)a3, v14, (uint64_t)v9, v12);
  if (-[CUICommonAssetStorage swapped](self->_store, "swapped"))
  {
    var2 = v9->var2;
    if ((_DWORD)var2)
    {
      do
      {
        *(_WORD *)a3 = bswap32(*(unsigned __int16 *)a3) >> 16;
        a3 = (char *)a3 + 2;
        --var2;
      }
      while (var2);
    }
  }
  return 1;
}

- (id)copyKeySignatureForKey:(const _renditionkeytoken *)a3 withBytesNoCopy:(char *)a4 length:(unint64_t)a5
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a4, CUICopyKeySignature(a4, a5, (int *)a3, (uint64_t)-[CUIStructuredThemeStore keyFormat](self, "keyFormat"), (uint64_t *)-[CUIStructuredThemeStore keyAttributeIndex](self, "keyAttributeIndex")), 1, 0);
}

- (const)keyFormat
{
  CUICommonAssetStorage *store;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  store = self->_store;
  if (store)
    return -[CUICommonAssetStorage keyFormat](store, "keyFormat");
  if ((keyFormat_didWarn & 1) == 0)
  {
    keyFormat_didWarn = 1;
    v6 = (objc_class *)objc_opt_class(self, a2);
    v7 = NSStringFromClass(v6);
    _CUILog(1, (uint64_t)"%@ where the _store ivar hasn't been initialized won't behave well.", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    if ((-[CUIStructuredThemeStore isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(CUIStructuredThemeStore, v14)) & 1) == 0)
    {
      v15 = NSStringFromSelector(a2);
      _CUILog(1, (uint64_t)"Subclasses of CUIStructuredThemeStore that don't use _store should override %@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    }
  }
  return (const _renditionkeyfmt *)CUISystemThemeRenditionKeyFormat();
}

- (BOOL)canGetRenditionWithKey:(const _renditionkeytoken *)a3
{
  id v5;
  id v6;
  id v7;
  const _renditionkeyattributeindex *v8;
  unsigned int v9;
  unsigned int nkeys;
  unsigned int v12;
  unint64_t v13;
  unsigned __int16 *p_value;
  unint64_t v15;
  id v16;
  id v17;
  BOOL v18;
  uint64_t v20;

  v5 = +[CUIRuntimeStatistics sharedRuntimeStatistics](CUIRuntimeStatistics, "sharedRuntimeStatistics");
  objc_msgSend(v5, "incrementStatisticLookup");
  v6 = -[CUICommonAssetStorage renditionInfoForIdentifier:](self->_store, "renditionInfoForIdentifier:", CUIRenditionKeyValueForAttribute(&a3->identifier, 17));
  if (v6)
  {
    v7 = v6;
    if (!self->_attributePresent)
      self->_attributePresent = objc_msgSend(v6, "methodForSelector:", sel_attributePresent_withValue_);
    v8 = -[CUIStructuredThemeStore keyAttributeIndex](self, "keyAttributeIndex");
    v9 = CUIRenditionKeyTokenCount((uint64_t)a3);
    nkeys = v8->nkeys;
    if (nkeys >= v9 ? v9 : v8->nkeys)
    {
      v12 = v9;
      v13 = 0;
      p_value = &a3->value;
      do
      {
        if ((v8->keymask & (1 << *(p_value - 1))) != 0)
        {
          if (!((unsigned int (*)(id, char *))self->_attributePresent)(v7, sel_attributePresent_withValue_))
          {
            objc_msgSend(v5, "incrementStatisticDidShortCircuitImageLookup");
            return 0;
          }
          nkeys = v8->nkeys;
        }
        p_value += 2;
        ++v13;
        if (nkeys >= v12)
          v15 = v12;
        else
          v15 = nkeys;
      }
      while (v13 < v15);
    }
  }
  v16 = -[CUIStructuredThemeStore copyKeySignatureForKey:withBytesNoCopy:length:](self, "copyKeySignatureForKey:withBytesNoCopy:length:", a3, &v20, 256);
  os_unfair_lock_lock(&self->_cacheLock);
  v17 = -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v16);
  os_unfair_lock_unlock(&self->_cacheLock);
  if (v17)
  {

    return 1;
  }
  else
  {
    v18 = -[CUIStructuredThemeStore assetExistsForKey:](self, "assetExistsForKey:", a3);

    if (v5 && !v18)
    {
      objc_msgSend(v5, "incrementMissedLookup");
      return 0;
    }
  }
  return v18;
}

- (const)keyAttributeIndex
{
  const _renditionkeyattributeindex *result;

  result = (const _renditionkeyattributeindex *)self->_store;
  if (result)
    return (const _renditionkeyattributeindex *)-[_renditionkeyattributeindex keyAttributeIndex]((id)result, "keyAttributeIndex");
  return result;
}

- (void)_updateKeyWithCompatibilityMapping:(_renditionkeytoken *)a3
{
  int v4;
  _renditionkeytoken *v5;
  __int16 v6;

  if (-[CUICommonAssetStorage storageVersion](self->_store, "storageVersion") <= 4)
  {
    v4 = CUIRenditionKeyIndexForAttribute(&a3->identifier, 14);
    if ((v4 & 0x80000000) == 0)
    {
      v5 = &a3[v4];
      v5->identifier = 7;
      if (v5->value)
        v6 = 3;
      else
        v6 = 0;
      v5->value = v6;
    }
  }
}

- (BOOL)assetExistsForKey:(const _renditionkeytoken *)a3
{
  const _renditionkeyfmt *v5;
  size_t var2;
  __int128 *v7;
  uint64_t v8;
  BOOL v9;
  __int128 v11;
  _BYTE v12[22];

  *(_OWORD *)v12 = 0u;
  v5 = -[CUIStructuredThemeStore keyFormat](self, "keyFormat", 0, 0, 0, 0, 0, *(_QWORD *)&v12[14]);
  var2 = v5->var2;
  if (var2 < 0x16)
  {
    v7 = &v11;
    v8 = 42;
  }
  else
  {
    v7 = (__int128 *)malloc_type_calloc(var2, 2uLL, 0x1000040BDFB0063uLL);
    v8 = 2 * v5->var2;
  }
  if (-[CUIStructuredThemeStore _formatStorageKeyArrayBytes:length:fromKey:](self, "_formatStorageKeyArrayBytes:length:fromKey:", v7, v8, a3))
  {
    v9 = -[CUICommonAssetStorage assetExistsForKeyData:length:](self->_store, "assetExistsForKeyData:length:", v7, 2 * v5->var2);
  }
  else
  {
    v9 = 0;
  }
  if (v5->var2 >= 0x16)
    free(v7);
  return v9;
}

- (id)renditionWithKey:(const _renditionkeytoken *)a3 usingKeySignature:(id)a4
{
  void *v7;
  id v8;
  CUIThemeRendition *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableDictionary *cache;
  CUIThemeRendition *v20;
  CUIThemeRendition *v21;
  CUIThemeRendition *v22;
  id v23;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  char v31[256];

  v7 = (void *)MEMORY[0x1A1AEEF7C](self, a2);
  if (a4)
    v8 = a4;
  else
    a4 = -[CUIStructuredThemeStore copyKeySignatureForKey:withBytesNoCopy:length:](self, "copyKeySignatureForKey:withBytesNoCopy:length:", a3, v31, 256);
  os_unfair_lock_lock(&self->_cacheLock);
  v9 = (CUIThemeRendition *)-[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", a4);
  os_unfair_lock_unlock(&self->_cacheLock);
  if (!v9)
  {
    v9 = -[CUIStructuredThemeStore lookupAssetForKey:](self, "lookupAssetForKey:", a3);
    if (v9)
    {
      if (CUILogRenditionLogEnabled())
      {
        v10 = CUILogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = -[CUICommonAssetStorage path](self->_store, "path");
          *(_DWORD *)buf = 138543874;
          v26 = v11;
          v27 = 2050;
          v28 = -[CUIThemeRendition bytes](v9, "bytes");
          v29 = 2114;
          v30 = a4;
          _os_log_impl(&dword_19EBC9000, v10, OS_LOG_TYPE_INFO, "CoreUI-l %{public}@ %{public}p %{public}@", buf, 0x20u);
        }
      }
      v9 = -[CUIThemeRendition initWithCSIData:forKey:version:]([CUIThemeRendition alloc], "initWithCSIData:forKey:version:", v9, a3, -[CUIStructuredThemeStore distilledInCoreUIVersion](self, "distilledInCoreUIVersion"));
      if (-[CUIStructuredThemeStore distilledInCoreUIVersion](self, "distilledInCoreUIVersion") <= 0x178
        && -[CUIThemeRendition pixelFormat](v9, "pixelFormat") == 1246774599)
      {
        -[CUIThemeRendition setOpacity:](v9, "setOpacity:", 1.0);
      }
      -[CUIThemeRendition _setStructuredThemeStore:](v9, "_setStructuredThemeStore:", self);
      if (!v9)
      {
        v12 = objc_msgSend(-[CUIStructuredThemeStore store](self, "store"), "path");
        _CUILog(4, (uint64_t)"CoreUI: Error calling -[CUIThemeRendition initWithCSIData:forKey: inVersion:] failed catalog '%@'", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
      }
    }
    os_unfair_lock_lock(&self->_cacheLock);
    cache = self->_cache;
    if (cache && v9)
    {
      v20 = (CUIThemeRendition *)-[NSMutableDictionary objectForKey:](cache, "objectForKey:", a4);
      if (v20)
      {
        v21 = v20;
        if (v9 != v20)
        {
          v22 = v9;
          v9 = v21;
        }
      }
      else
      {
        v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", objc_msgSend(a4, "UTF8String"));
        -[NSMutableDictionary setObject:forKey:](self->_cache, "setObject:forKey:", v9, v23);

      }
    }
    os_unfair_lock_unlock(&self->_cacheLock);
  }

  objc_autoreleasePoolPop(v7);
  return v9;
}

- (unsigned)distilledInCoreUIVersion
{
  return -[CUICommonAssetStorage distilledInCoreUIVersion](self->_store, "distilledInCoreUIVersion");
}

- (const)renditionKeyForName:(id)a3 cursorHotSpot:(CGPoint *)a4
{
  id v7;
  const _renditionkeytoken *v8;
  CFNullRef v9;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  void *v11;
  NSData *v12;

  if (a3)
  {
    if (a4)
    {
      v7 = objc_msgSend(a3, "mutableCopy");
      objc_msgSend(v7, "appendString:", NSStringFromPoint(*a4));
    }
    else
    {
      v7 = a3;
    }
    v9 = -[NSCache objectForKey:](self->_namedRenditionKeyCache, "objectForKey:", v7);
    if (v9)
    {
      if (v9 == kCFNull)
        v8 = 0;
      else
        v8 = (const _renditionkeytoken *)-[__CFNull bytes](v9, "bytes");
      goto LABEL_16;
    }
    MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a3);
    v11 = malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xB1B95B1DuLL);
    if (CFStringGetFileSystemRepresentation((CFStringRef)a3, (char *)v11, MaximumSizeOfFileSystemRepresentation))
    {
      v8 = -[CUICommonAssetStorage renditionKeyForName:hotSpot:](self->_store, "renditionKeyForName:hotSpot:", v11, a4);
      free(v11);
      if (v8)
      {
        v12 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v8, 4 * CUIRenditionKeyTokenCount((uint64_t)v8) + 4);
LABEL_15:
        -[NSCache setObject:forKey:](self->_namedRenditionKeyCache, "setObject:forKey:", v12, v7);
LABEL_16:

        return v8;
      }
    }
    else
    {
      free(v11);
    }
    v8 = 0;
    v12 = (NSData *)kCFNull;
    goto LABEL_15;
  }
  return 0;
}

- (id)lookupAssetForKey:(const _renditionkeytoken *)a3
{
  id v4;
  id v5;
  char *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  int8x16_t *v20;
  unsigned int v21;
  uint64_t v22;
  int8x8_t *v23;
  uint64_t v24;
  unsigned int v25;
  char *v26;
  _DWORD *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = -[CUIStructuredThemeStore _newRenditionKeyDataFromKey:](self, "_newRenditionKeyDataFromKey:", a3);
  v5 = -[CUICommonAssetStorage assetForKey:](self->_store, "assetForKey:", v4);

  if (v5 && -[CUICommonAssetStorage swapped](self->_store, "swapped"))
  {
    v5 = objc_msgSend(v5, "mutableCopy");
    v6 = (char *)objc_msgSend(v5, "bytes");
    *(int8x16_t *)(v6 + 4) = vrev32q_s8(*(int8x16_t *)(v6 + 4));
    *(int8x8_t *)(v6 + 20) = vrev32_s8(*(int8x8_t *)(v6 + 20));
    v7 = bswap32(*((_DWORD *)v6 + 8));
    *((_DWORD *)v6 + 7) = *((_DWORD *)v6 + 7) & 0xF | (16 * bswap32(*((_DWORD *)v6 + 7) >> 4));
    *((_DWORD *)v6 + 8) = v7;
    *((_WORD *)v6 + 18) = bswap32(*((unsigned __int16 *)v6 + 18)) >> 16;
    *((_WORD *)v6 + 19) = bswap32(*((unsigned __int16 *)v6 + 19)) >> 16;
    v8 = *((_DWORD *)v6 + 42);
    v9 = bswap32(v8);
    v10 = bswap32(*((_DWORD *)v6 + 43));
    *((_DWORD *)v6 + 42) = v9;
    *((_DWORD *)v6 + 43) = v10;
    v11 = (unsigned int *)(v6 + 176);
    if (v10 + 1 > 1)
      v12 = v10 + 1;
    else
      v12 = 1;
    v13 = (unsigned int *)(v6 + 176);
    do
    {
      *v13 = bswap32(*v13);
      ++v13;
      --v12;
    }
    while (v12);
    v14 = &v11[v10 + 1];
    v15 = (unsigned int *)((char *)v14 + v9);
    if (v8)
    {
      do
      {
        v16 = bswap32(*v14);
        v17 = bswap32(v14[1]);
        *v14 = v16;
        v14[1] = v17;
        if (v16 == 1003)
        {
          v21 = v14[2];
          LODWORD(v22) = bswap32(v21);
          v14[2] = v22;
          if (v21)
          {
            if (v22 <= 1)
              v22 = 1;
            else
              v22 = v22;
            v23 = (int8x8_t *)(v14 + 7);
            do
            {
              *(int8x16_t *)v23[-2].i8 = vrev32q_s8(*(int8x16_t *)v23[-2].i8);
              *v23 = vrev32_s8(*v23);
              v23 += 3;
              --v22;
            }
            while (v22);
          }
        }
        else if (v16 == 1001)
        {
          v18 = v14[2];
          LODWORD(v19) = bswap32(v18);
          v14[2] = v19;
          if (v18)
          {
            v20 = (int8x16_t *)(v14 + 3);
            if (v19 <= 1)
              v19 = 1;
            else
              v19 = v19;
            do
            {
              *v20 = vrev32q_s8(*v20);
              ++v20;
              --v19;
            }
            while (v19);
          }
        }
        v14 = (unsigned int *)((char *)v14 + v17 + 8);
      }
      while (v14 < v15);
      v10 = *((_DWORD *)v6 + 43);
    }
    if (v10)
    {
      v24 = v10;
      do
      {
        v25 = *v11++;
        v26 = (char *)v15 + v25;
        *((_DWORD *)v26 + 3) = bswap32(*((_DWORD *)v26 + 3));
        *(int8x8_t *)(v26 + 4) = vrev32_s8(*(int8x8_t *)(v26 + 4));
        --v24;
      }
      while (v24);
    }
  }
  v27 = objc_msgSend(v5, "bytes");
  if (v27 && *v27 != 1129599817 && v27[1] <= 1u)
  {
    v28 = objc_msgSend(-[CUIStructuredThemeStore store](self, "store"), "path");
    _CUILog(4, (uint64_t)"CoreUI: -[CUIStructuredThemeStore lookupAssetForKey:] got invalid CSIData for AssetCatalog '%@'", v29, v30, v31, v32, v33, v34, (uint64_t)v28);
    return 0;
  }
  return v5;
}

- (id)renditionInfoForIdentifier:(unsigned __int16)a3
{
  return objc_msgSend(-[CUIStructuredThemeStore themeStore](self, "themeStore"), "renditionInfoForIdentifier:", a3);
}

- (id)themeStore
{
  return self->_store;
}

- (BOOL)localizationWorkaroundForKeyList:(const _renditionkeytoken *)a3 withLocale:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSCache *nameCache;

  if (!objc_msgSend(-[CUIStructuredThemeStore bundleID](self, "bundleID"), "isEqualToString:", CFSTR("com.apple.CoreGlyphs")))return 0;
  if (!a4)
    a4 = +[NSLocale currentLocale](NSLocale, "currentLocale");
  v7 = objc_msgSend(a4, "languageCode");
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ar")) & 1) == 0
    && !objc_msgSend(v7, "isEqualToString:", CFSTR("hi")))
  {
    return 0;
  }
  if (!objc_msgSend(objc_msgSend(a4, "numberingSystem"), "isEqualToString:", CFSTR("latn")))
    return 0;
  if (localizationWorkaroundForKeyList_withLocale____onceToken != -1)
    dispatch_once(&localizationWorkaroundForKeyList_withLocale____onceToken, &__block_literal_global_11);
  v8 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedShort:", CUIRenditionKeyValueForAttribute(&a3->identifier, 17));
  os_unfair_lock_lock(&self->_cacheLock);
  v9 = -[NSCache objectForKey:](self->_nameCache, "objectForKey:", v8);
  if (!v9)
  {
    v9 = -[CUICommonAssetStorage renditionNameForKeyBaseList:](self->_store, "renditionNameForKeyBaseList:", a3);
    nameCache = self->_nameCache;
    if (!nameCache)
    {
      nameCache = (NSCache *)objc_alloc_init((Class)NSCache);
      self->_nameCache = nameCache;
    }
    -[NSCache setObject:forKey:](nameCache, "setObject:forKey:", v9, v8);
  }
  os_unfair_lock_unlock(&self->_cacheLock);

  return (objc_msgSend((id)localizationWorkaroundForKeyList_withLocale____symbolsWithDigits, "containsObject:", v9) & 1) != 0;
}

- (id)bundleID
{
  return self->_bundleID;
}

- (const)renditionKeyForName:(id)a3
{
  return -[CUIStructuredThemeStore renditionKeyForName:cursorHotSpot:](self, "renditionKeyForName:cursorHotSpot:", a3, 0);
}

- (unsigned)appearanceIdentifierForName:(id)a3
{
  return -[CUICommonAssetStorage appearanceIdentifierForName:](self->_store, "appearanceIdentifierForName:", a3);
}

- (id)appearances
{
  return -[CUICommonAssetStorage appearances](self->_store, "appearances");
}

- (id)renditionWithKey:(const _renditionkeytoken *)a3
{
  return -[CUIStructuredThemeStore renditionWithKey:usingKeySignature:](self, "renditionWithKey:usingKeySignature:", a3, 0);
}

- (id)aliasForName:(id)a3
{
  id v5;
  id v6;
  NSBundle *v7;

  v5 = -[CUIStructuredThemeStore bundleID](self, "bundleID");
  if (!self->_aliasDictionary)
  {
    v6 = v5;
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.CoreGlyphs")))
    {
      v7 = +[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", v6);
      if (v7)
        self->_aliasDictionary = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", -[NSBundle URLForResource:withExtension:](v7, "URLForResource:withExtension:", CFSTR("name_aliases"), CFSTR("strings")), 0);
    }
  }
  return -[NSDictionary objectForKey:](self->_aliasDictionary, "objectForKey:", a3);
}

- (id)nameForAppearanceIdentifier:(unsigned __int16)a3
{
  return -[CUICommonAssetStorage nameForAppearanceIdentifier:](self->_store, "nameForAppearanceIdentifier:", a3);
}

- (id)_newRenditionKeyDataFromKey:(const _renditionkeytoken *)a3
{
  const _renditionkeyfmt *v5;
  size_t var2;
  __int128 *v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned int v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  __int128 v16;
  _BYTE v17[22];

  *(_OWORD *)v17 = 0u;
  v5 = -[CUIStructuredThemeStore keyFormat](self, "keyFormat", 0, 0, 0, 0, 0, *(_QWORD *)&v17[14]);
  var2 = v5->var2;
  if (var2 < 0x16)
  {
    v7 = &v16;
    v8 = 42;
  }
  else
  {
    v7 = (__int128 *)malloc_type_calloc(var2, 2uLL, 0x1000040BDFB0063uLL);
    v8 = 2 * v5->var2;
  }
  v9 = -[CUIStructuredThemeStore _formatStorageKeyArrayBytes:length:fromKey:](self, "_formatStorageKeyArrayBytes:length:fromKey:", v7, v8, a3);
  v10 = v5->var2;
  if ((v9 & 1) != 0)
  {
    v11 = objc_alloc((Class)NSData);
    v12 = 2 * v5->var2;
    if (v10 < 0x16)
      v13 = objc_msgSend(v11, "initWithBytes:length:", v7, v12);
    else
      v13 = objc_msgSend(v11, "initWithBytesNoCopy:length:freeWhenDone:", v7, v12, 1);
    v14 = v13;
    __CFSetLastAllocationEventName(v13, "CUIRenditionKeyData");
  }
  else
  {
    if (v10 >= 0x16)
      free(v7);
    return 0;
  }
  return v14;
}

- (BOOL)imageNamedShouldFlip:(id)a3
{
  id v6;
  id v7;
  NSBundle *v8;
  id v9;

  if ((dyld_program_sdk_at_least(0x7E40901FFFFFFFFLL, a2) & 1) != 0)
    return 0;
  v6 = -[CUIStructuredThemeStore bundleID](self, "bundleID");
  if (!self->_legacyFlippableSet)
  {
    v7 = v6;
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.CoreGlyphs")))
    {
      v8 = +[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", v7);
      if (v8)
      {
        v9 = objc_msgSend(objc_alloc((Class)NSArray), "initWithContentsOfURL:error:", -[NSBundle URLForResource:withExtension:](v8, "URLForResource:withExtension:", CFSTR("legacy_flippable"), CFSTR("plist")), 0);
        if (v9)
          self->_legacyFlippableSet = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v9);

      }
    }
  }
  return -[NSSet containsObject:](self->_legacyFlippableSet, "containsObject:", a3);
}

- (BOOL)_subImageTexturingShouldBeSupported
{
  unsigned int v3;
  NSSet *v4;

  v3 = objc_msgSend(-[CUIStructuredThemeStore themeStore](self, "themeStore"), "renditionCount");
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("com.facebook.Facebook"), CFSTR("com.toyopagroup.picaboo"), 0);
  return (*((_BYTE *)self + 64) & 1) != 0 && !-[NSSet containsObject:](v4, "containsObject:", self->_bundleID)
      || v3 - 1 < 0x63;
}

- (BOOL)caAllowSubimageOfImage:(CGImage *)a3
{
  size_t Height;

  Height = CGImageGetHeight(a3);
  if (CGImageGetBytesPerRow(a3) * Height >= vm_page_size)
    return -[CUIStructuredThemeStore _subImageTexturingShouldBeSupported](self, "_subImageTexturingShouldBeSupported");
  else
    return 1;
}

- (BOOL)getPhysicalColor:(_colordef *)a3 withName:(id)a4
{
  os_unfair_lock_s *p_storeLock;

  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  LOBYTE(a4) = -[CUICommonAssetStorage getColor:forName:](self->_store, "getColor:forName:", a3, objc_msgSend(a4, "UTF8String"));
  os_unfair_lock_unlock(p_storeLock);
  return (char)a4;
}

- (void)setThemeIndex:(unint64_t)a3
{
  self->_themeIndex = a3;
}

- (CUIStructuredThemeStore)initWithPath:(id)a3
{
  CUIStructuredThemeStore *v4;
  CUICommonAssetStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIStructuredThemeStore;
  v4 = -[CUIStructuredThemeStore init](&v7, sel_init);
  if (v4)
  {
    v5 = -[CUICommonAssetStorage initWithPath:]([CUICommonAssetStorage alloc], "initWithPath:", a3);
    v4->_store = v5;
    if (v5)
    {
      -[CUIStructuredThemeStore _commonInit](v4, "_commonInit");
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)_commonInit
{
  id v3;

  v3 = -[CUICommonAssetStorage path](self->_store, "path");
  *(_QWORD *)&self->_cacheLock._os_unfair_lock_opaque = 0;
  self->_themeIndex = -1;
  self->_cache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_namedRenditionKeyCache = (NSCache *)objc_alloc_init((Class)NSCache);
  -[NSCache setName:](self->_namedRenditionKeyCache, "setName:", objc_msgSend(CFSTR("com.apple.coreui-namecache-"), "stringByAppendingString:", v3));
  -[NSCache setEvictsObjectsWithDiscardedContent:](self->_namedRenditionKeyCache, "setEvictsObjectsWithDiscardedContent:", 0);
  -[NSCache setCountLimit:](self->_namedRenditionKeyCache, "setCountLimit:", 500);
}

- (id)localizations
{
  return -[CUICommonAssetStorage localizations](self->_store, "localizations");
}

- (void)setMainBundle:(BOOL)a3
{
  *((_BYTE *)self + 64) = *((_BYTE *)self + 64) & 0xFE | a3;
}

- (void)setBundleID:(id)a3
{
  if (self->_bundleID != a3)
    self->_bundleID = (NSString *)objc_msgSend(a3, "copy");
}

- (unsigned)localizationIdentifierForName:(id)a3
{
  return -[CUICommonAssetStorage localizationIdentifierForName:](self->_store, "localizationIdentifierForName:", a3);
}

- (CUIStructuredThemeStore)initWithURL:(id)a3
{
  return -[CUIStructuredThemeStore initWithPath:](self, "initWithPath:", objc_msgSend(a3, "path"));
}

- (unint64_t)colorSpaceID
{
  CUICommonAssetStorage *store;

  store = self->_store;
  if (store)
    return -[CUICommonAssetStorage colorSpaceID](store, "colorSpaceID");
  else
    return 1;
}

- (int64_t)maximumRenditionKeyTokenCount
{
  CUICommonAssetStorage *store;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  store = self->_store;
  if (store)
    return -[CUICommonAssetStorage maximumRenditionKeyTokenCount](store, "maximumRenditionKeyTokenCount");
  if ((maximumRenditionKeyTokenCount_didWarn & 1) == 0)
  {
    maximumRenditionKeyTokenCount_didWarn = 1;
    v6 = (objc_class *)objc_opt_class(self, a2);
    v7 = NSStringFromClass(v6);
    _CUILog(1, (uint64_t)"%@ where the _store ivar hasn't been initialized won't behave well.", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    if ((-[CUIStructuredThemeStore isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(CUIStructuredThemeStore, v14)) & 1) == 0)
    {
      v15 = NSStringFromSelector(a2);
      _CUILog(1, (uint64_t)"Subclasses of CUIStructuredThemeStore that don't use _store should override %@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    }
  }
  return 21;
}

- (BOOL)usesCUISystemThemeRenditionKey
{
  CUICommonAssetStorage *store;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  store = self->_store;
  if (store)
    return -[CUICommonAssetStorage usesCUISystemThemeRenditionKey](store, "usesCUISystemThemeRenditionKey");
  if ((usesCUISystemThemeRenditionKey_didWarn & 1) == 0)
  {
    usesCUISystemThemeRenditionKey_didWarn = 1;
    v6 = (objc_class *)objc_opt_class(self, a2);
    v7 = NSStringFromClass(v6);
    _CUILog(1, (uint64_t)"%@ where the _store ivar hasn't been initialized won't behave well.", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    if ((-[CUIStructuredThemeStore isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(CUIStructuredThemeStore, v14)) & 1) == 0)
    {
      v15 = NSStringFromSelector(a2);
      _CUILog(1, (uint64_t)"Subclasses of CUIStructuredThemeStore that don't use _store should override %@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    }
  }
  return 1;
}

- (id)baseGradationKeySignatureForKey:(const _renditionkeytoken *)a3
{
  char v4[256];

  CUICopyKeySignatureWithPrefix(v4, 0x100uLL, (int *)a3, (uint64_t)-[CUIStructuredThemeStore keyFormat](self, "keyFormat"), (uint64_t *)-[CUIStructuredThemeStore keyAttributeIndex](self, "keyAttributeIndex"), 0);
  return +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v4, 1);
}

- (id)keySignatureForKey:(const _renditionkeytoken *)a3
{
  char v4[256];

  CUICopyKeySignature(v4, 0x100uLL, (int *)a3, (uint64_t)-[CUIStructuredThemeStore keyFormat](self, "keyFormat"), (uint64_t *)-[CUIStructuredThemeStore keyAttributeIndex](self, "keyAttributeIndex"));
  return +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v4, 1);
}

- (CUIStructuredThemeStore)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  CUIStructuredThemeStore *v6;
  CUICommonAssetStorage *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUIStructuredThemeStore;
  v6 = -[CUIStructuredThemeStore init](&v9, sel_init);
  if (v6)
  {
    v7 = -[CUICommonAssetStorage initWithBytes:length:]([CUICommonAssetStorage alloc], "initWithBytes:length:", a3, a4);
    v6->_store = v7;
    if (v7)
    {
      -[CUIStructuredThemeStore _commonInit](v6, "_commonInit");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIStructuredThemeStore;
  -[CUIStructuredThemeStore dealloc](&v3, sel_dealloc);
}

- (unsigned)documentFormatVersion
{
  return -[CUICommonAssetStorage storageVersion](self->_store, "storageVersion");
}

- (unsigned)thinnedWithCoreUIVersion
{
  return -[CUICommonAssetStorage thinnedWithCoreUIVersion](self->_store, "thinnedWithCoreUIVersion");
}

- (unsigned)authoredWithSchemaVersion
{
  return -[CUICommonAssetStorage schemaVersion](self->_store, "schemaVersion");
}

- (id)defaultAppearanceName
{
  id v2;

  v2 = -[CUICommonAssetStorage deploymentPlatformString](self->_store, "deploymentPlatformString");
  if (objc_msgSend(v2, "isEqualToString:", kCUIPlatformMac[0]))
    return CFSTR("NSAppearanceNameSystem");
  else
    return CFSTR("UIAppearanceAny");
}

- (BOOL)hasPhysicalColorWithName:(id)a3
{
  os_unfair_lock_s *p_storeLock;

  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  LOBYTE(a3) = -[CUICommonAssetStorage hasColorForName:](self->_store, "hasColorForName:", objc_msgSend(a3, "UTF8String"));
  os_unfair_lock_unlock(p_storeLock);
  return (char)a3;
}

- (BOOL)getFontName:(id *)a3 baselineOffset:(double *)a4 forFontType:(id)a5
{
  os_unfair_lock_s *p_storeLock;
  _BOOL4 v10;
  float v12;

  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  v12 = 0.0;
  v10 = -[CUICommonAssetStorage getFontName:baselineOffset:forFontType:](self->_store, "getFontName:baselineOffset:forFontType:", a3, &v12, a5);
  os_unfair_lock_unlock(p_storeLock);
  if (a4 && v10)
    *a4 = v12;
  return v10;
}

- (double)fontSizeForFontSizeType:(id)a3
{
  os_unfair_lock_s *p_storeLock;
  float v6;
  double v7;

  p_storeLock = &self->_storeLock;
  os_unfair_lock_lock(&self->_storeLock);
  -[CUICommonAssetStorage fontSizeForFontSizeType:](self->_store, "fontSizeForFontSizeType:", a3);
  v7 = v6;
  os_unfair_lock_unlock(p_storeLock);
  return v7;
}

- (id)convertRenditionKeyToKeyData:(const _renditionkeytoken *)a3
{
  return -[CUIStructuredThemeStore _newRenditionKeyDataFromKey:](self, "_newRenditionKeyDataFromKey:", a3);
}

- (const)renditionKeyFormat
{
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[CUICommonAssetStorage keySemantics](self->_store, "keySemantics");
  v4 = -[CUICommonAssetStorage storageVersion](self->_store, "storageVersion");
  return (const _renditionkeyfmt *)CUIDefaultThemeRenditionKeyFormat(v3, v4, v5, v6, v7, v8, v9, v10);
}

- (id)debugDescriptionForKeyList:(const _renditionkeytoken *)a3
{
  const _renditionkeyfmt *v5;
  unsigned int v6;
  unsigned int v7;
  NSString *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  unsigned int v13;
  uint64_t v14;
  NSString *v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  NSString *v21;
  unsigned int v22;
  NSString *v23;
  NSString *v24;
  unsigned int v25;
  NSString *v26;
  id result;
  NSString *v28;
  unsigned int v29;
  NSString *v30;
  unsigned int v31;
  NSString *v32;
  unsigned int v33;
  NSString *v34;
  unsigned int v35;
  NSString *v36;
  unsigned int v37;
  NSString *v38;
  unsigned int v39;
  uint64_t v40;
  CUIStructuredThemeStore *v41;
  NSString *v42;
  unsigned int v43;
  uint64_t v44;
  NSString *v45;
  NSString *v46;
  id v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSString *v59;
  NSString *v60;
  NSString *v61;
  NSString *v62;
  NSString *v63;
  NSString *v64;
  NSString *v65;
  NSString *v66;
  NSString *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v5 = -[CUIStructuredThemeStore renditionKeyFormat](self, "renditionKeyFormat");
  if (v5 == (const _renditionkeyfmt *)CUISystemThemeRenditionKeyFormat())
  {
    v9 = CUIRenditionKeyValueForAttribute(&a3->identifier, 1);
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v9);
    v11 = CUIRenditionKeyValueForAttribute(&a3->identifier, 2);
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v11);
    v13 = CUIRenditionKeyValueForAttribute(&a3->identifier, 3);
    v14 = v13;
    switch(v13)
    {
      case 0u:
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - kCoreThemeSizeRegular"), 0);
        goto LABEL_17;
      case 1u:
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - kCoreThemeSizeSmall"), 1);
        goto LABEL_17;
      case 2u:
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - kCoreThemeSizeMini"), 2);
        goto LABEL_17;
      case 3u:
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - kCoreThemeSizeLarge"), 3);
LABEL_17:
        v28 = v15;
        if (!v15)
          goto LABEL_18;
        goto LABEL_19;
      default:
LABEL_18:
        v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - Unknown size value"), v14);
LABEL_19:
        v29 = CUIRenditionKeyValueForAttribute(&a3->identifier, 4);
        v72 = v29;
        if (v29 > 5)
          v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - Unnamed direction value"), v29);
        else
          v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), gThemeDirections[3 * v29 + 2]);
        v64 = v30;
        v31 = CUIRenditionKeyValueForAttribute(&a3->identifier, 6);
        v71 = v31;
        if (v31 > 2)
          v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - Unnamed on/off/mixed value"), v31);
        else
          v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), gThemeValues[3 * v31 + 2]);
        v63 = v32;
        v33 = CUIRenditionKeyValueForAttribute(&a3->identifier, 10);
        v70 = v33;
        if (v33 > 4)
          v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - Unnamed state value"), v33);
        else
          v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), gThemeStates[3 * v33 + 2]);
        v62 = v34;
        v35 = CUIRenditionKeyValueForAttribute(&a3->identifier, 18);
        v69 = v35;
        if (v35 > 2)
          v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - Unnamed on/off/mixed previousValue"), v35);
        else
          v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), gThemeValues[3 * v35 + 2]);
        v61 = v36;
        v37 = CUIRenditionKeyValueForAttribute(&a3->identifier, 19);
        v66 = v12;
        v68 = v37;
        if (v37 > 4)
          v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - Unnamed previousState value"), v37);
        else
          v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), gThemeStates[3 * v37 + 2]);
        v60 = v38;
        v39 = CUIRenditionKeyValueForAttribute(&a3->identifier, 14);
        v40 = v39;
        v41 = self;
        if (v39 > 2)
          v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - Unnamed presentation state value"), v39);
        else
          v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), gThemePresentationStates[3 * v39 + 2]);
        v59 = v42;
        v43 = CUIRenditionKeyValueForAttribute(&a3->identifier, 11);
        v44 = v43;
        v74 = v11;
        v75 = v9;
        v67 = v10;
        v73 = v14;
        v65 = v28;
        if (v43 > 4)
          v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - Unnamed drawing layer value"), v43);
        else
          v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), gThemeDrawingLayers[3 * v43 + 2]);
        v46 = v45;
        v47 = -[NSDictionary objectForKey:](-[NSProcessInfo environment](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "environment"), "objectForKey:", CFSTR("CUISuppressMissingAssetLogs"));
        v48 = CUIRenditionKeyValueForAttribute(&a3->identifier, 8);
        v49 = CUIRenditionKeyValueForAttribute(&a3->identifier, 9);
        v50 = CUIRenditionKeyValueForAttribute(&a3->identifier, 12);
        v51 = CUIRenditionKeyValueForAttribute(&a3->identifier, 17);
        v52 = -[CUIStructuredThemeStore bundleID](v41, "bundleID");
        if (v47)
          result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld, %ld) in %@"), v75, v74, v73, v72, v71, v48, v49, v70, v68, v69, v40, v44, v50, v51, v52);
        else
          result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\tElement: %@\n\tPart: %@\n\tSize: %@\n\tDirection: %@\n\tValue: %@\n\tDimension 1: %d\n\tDimension 2: %d\n\tState: %@\n\tPrevious State: %@\n\tPrevious Value: %@\n\tPresentation State: %@\n\tDrawing Layer: %@\n\tScale: %d\n\tIdentifier: %d\nin theme store associated with bundle: %@"), v67, v66, v65, v64, v63, v48, v49, v62, v60, v61, v59, v46, v50, v51, v52);
        break;
    }
  }
  else
  {
    v6 = CUIRenditionKeyValueForAttribute(&a3->identifier, 12);
    v7 = CUIRenditionKeyValueForAttribute(&a3->identifier, 15);
    if (v7 > 6)
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - Unnamed idiom"), v7);
    else
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), gThemeIdioms[3 * v7 + 2]);
    v16 = v8;
    v17 = v6;
    v18 = CUIRenditionKeyValueForAttribute(&a3->identifier, 16);
    v19 = CUIRenditionKeyValueForAttribute(&a3->identifier, 17);
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), CUIRenditionKeyValueForAttribute(&a3->identifier, 1));
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), CUIRenditionKeyValueForAttribute(&a3->identifier, 2));
    v22 = CUIRenditionKeyValueForAttribute(&a3->identifier, 10);
    if (v22 > 4)
      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - Unnamed state value"), v22);
    else
      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), gThemeStates[3 * v22 + 2]);
    v24 = v23;
    v25 = CUIRenditionKeyValueForAttribute(&a3->identifier, 6);
    if (v25 > 2)
      v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld - Unnamed on/off/mixed value"), v25);
    else
      v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), gThemeValues[3 * v25 + 2]);
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\tIdiom: %@\n\tSubtype: %ld\n\tName Identifier: %ld\n\tScale: %ld\n\tElement: %@\n\tPart: %@\n\tState: %@\n\tValue: %@\nin theme store associated with bundle: %@"), v16, v18, v19, v17, v20, v21, v24, v26, -[CUIStructuredThemeStore bundleID](self, "bundleID"), v53, v54, v55, v56, v57, v58);
  }
  return result;
}

- (id)renditionNameForKeyList:(_renditionkeytoken *)a3
{
  return -[CUICommonAssetStorage renditionNameForKeyList:](self->_store, "renditionNameForKeyList:", a3);
}

- (id)allImageNames
{
  return -[CUICommonAssetStorage allRenditionNames](self->_store, "allRenditionNames");
}

- (BOOL)containsLookupForName:(id)a3
{
  return -[CUIStructuredThemeStore renditionKeyForName:cursorHotSpot:](self, "renditionKeyForName:cursorHotSpot:", a3, 0) != 0;
}

- (id)imagesWithName:(id)a3
{
  id v5;
  uint64_t v6;
  CUICommonAssetStorage *store;
  _QWORD v9[8];

  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v6 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)-[CUIStructuredThemeStore renditionKeyForName:](self, "renditionKeyForName:", a3), 17);
  store = self->_store;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __42__CUIStructuredThemeStore_imagesWithName___block_invoke;
  v9[3] = &unk_1E41B1E78;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = v5;
  v9[7] = v6;
  -[CUICommonAssetStorage assetKeysMatchingBlock:](store, "assetKeysMatchingBlock:", v9);
  return v5;
}

uint64_t __42__CUIStructuredThemeStore_imagesWithName___block_invoke(uint64_t a1, unsigned __int16 *a2)
{
  CUIRenditionKey *v4;
  id v5;
  id v6;
  id v7;
  __objc2_class **v8;

  if (*(_QWORD *)(a1 + 56) == CUIRenditionKeyValueForAttribute(a2, 17))
  {
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", a2);
    v5 = objc_msgSend(*(id *)(a1 + 32), "copyLookupKeySignatureForKey:", a2);
    v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "renditionWithKey:usingKeySignature:", a2, v5), "type");
    if ((unint64_t)v6 < 6)
    {
LABEL_5:
      v8 = OBJC_CLASS___CUINamedImage_ptr;
    }
    else
    {
      v7 = 0;
      switch((unint64_t)v6)
      {
        case 0x3E8uLL:
          v8 = OBJC_CLASS___CUINamedData_ptr;
          break;
        case 0x3E9uLL:
          v8 = OBJC_CLASS___CUINamedExternalLink_ptr;
          break;
        case 0x3EAuLL:
          v8 = OBJC_CLASS___CUINamedLayerStack_ptr;
          break;
        case 0x3EBuLL:
        case 0x3EDuLL:
        case 0x3EEuLL:
        case 0x3EFuLL:
        case 0x3F0uLL:
        case 0x3F1uLL:
        case 0x3F3uLL:
        case 0x3F4uLL:
          goto LABEL_8;
        case 0x3ECuLL:
          goto LABEL_5;
        case 0x3F2uLL:
          v8 = OBJC_CLASS___CUINamedMultisizeImageSet_ptr;
          break;
        case 0x3F5uLL:
          v8 = OBJC_CLASS___CUINamedRecognitionGroup_ptr;
          break;
        default:
          if (v6 != (id)1018)
            goto LABEL_8;
          v8 = OBJC_CLASS___CUINamedSolidLayerStack_ptr;
          break;
      }
    }
    v7 = objc_msgSend(objc_alloc(*v8), "initWithName:usingRenditionKey:fromTheme:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    if (v7)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
LABEL_8:

  }
  return 0;
}

- (id)catalogGlobals
{
  id result;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = -[CUICommonAssetStorage catalogGlobalData](self->_store, "catalogGlobalData");
  if (result)
  {
    v3 = result;
    result = objc_msgSend(result, "length");
    if (result)
    {
      v9 = 0;
      v5 = objc_opt_class(NSDictionary, v4);
      v7 = objc_opt_class(NSString, v6);
      result = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v7, objc_opt_class(NSNumber, v8), 0), v3, &v9);
      if (v9)
        return 0;
    }
  }
  return result;
}

- (id)nameForLocalizationIdentifier:(unsigned __int16)a3
{
  return -[CUICommonAssetStorage nameForLocalizationIdentifier:](self->_store, "nameForLocalizationIdentifier:", a3);
}

- (BOOL)mainBundle
{
  return *((_BYTE *)self + 64) & 1;
}

- (void)clearRenditionCache
{
  os_unfair_lock_s *p_cacheLock;
  NSMutableDictionary *v4;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  v4 = self->_cache;
  self->_cache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  os_unfair_lock_unlock(p_cacheLock);
}

id __71__CUIStructuredThemeStore_localizationWorkaroundForKeyList_withLocale___block_invoke()
{
  id result;

  result = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", &unk_1E41DDCE0);
  localizationWorkaroundForKeyList_withLocale____symbolsWithDigits = (uint64_t)result;
  return result;
}

- (id)mappedAliases
{
  id result;

  -[CUIStructuredThemeStore aliasForName:](self, "aliasForName:", &stru_1E41B97C0);
  result = self->_aliasDictionary;
  if (result)
    return objc_msgSend(result, "allKeys");
  return result;
}

- (unint64_t)themeIndex
{
  return self->_themeIndex;
}

- (id)deploymentPlatformString
{
  return -[CUICommonAssetStorage deploymentPlatformString](self->_store, "deploymentPlatformString");
}

- (int64_t)deploymentPlatform
{
  return -[CUICommonAssetStorage deploymentPlatform](self->_store, "deploymentPlatform");
}

- (id)store
{
  return self->_store;
}

- (NSString)debugDescription
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, bundleID:'%@' path:'%@'>"), NSStringFromClass(v3), self, -[CUIStructuredThemeStore bundleID](self, "bundleID"), objc_msgSend(-[CUIStructuredThemeStore store](self, "store"), "path"));
}

@end
