@implementation CUIMutableStructuredThemeStore

- (const)keyFormat
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v4 = -[CUIMutableStructuredThemeStore deploymentPlatform](self, "deploymentPlatform");
  if ((unint64_t)(v4 - 1) >= 4)
  {
    if (v4 == 5)
    {
      v11 = 4;
      return (const _renditionkeyfmt *)CUIDefaultThemeRenditionKeyFormat(v11, 0xFFFFFFFF, v5, v6, v7, v8, v9, v10);
    }
    if (v4 != -1)
    {
      v11 = 1;
      return (const _renditionkeyfmt *)CUIDefaultThemeRenditionKeyFormat(v11, 0xFFFFFFFF, v5, v6, v7, v8, v9, v10);
    }
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIMutableStructuredThemeStore.m"), 64, CFSTR("Unknown platform kCUIThemeSchemaPlatformUnknown."));
  }
  v11 = 2;
  return (const _renditionkeyfmt *)CUIDefaultThemeRenditionKeyFormat(v11, 0xFFFFFFFF, v5, v6, v7, v8, v9, v10);
}

- (id)renditionWithKey:(const _renditionkeytoken *)a3 usingKeySignature:(id)a4
{
  id v7;

  objc_sync_enter(self);
  v7 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->_memoryStore, "objectForKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", CUIRenditionKeyValueForAttribute(&a3->identifier, 17))), "objectForKey:", a4);
  objc_sync_exit(self);
  return v7;
}

- (BOOL)canGetRenditionWithKey:(const _renditionkeytoken *)a3
{
  return -[CUIMutableStructuredThemeStore renditionWithKey:](self, "renditionWithKey:", a3) != 0;
}

- (id)renditionWithKey:(const _renditionkeytoken *)a3
{
  id v5;
  id v6;
  _BYTE v8[256];

  v5 = -[CUIStructuredThemeStore copyKeySignatureForKey:withBytesNoCopy:length:](self, "copyKeySignatureForKey:withBytesNoCopy:length:", a3, v8, 256);
  v6 = -[CUIMutableStructuredThemeStore renditionWithKey:usingKeySignature:](self, "renditionWithKey:usingKeySignature:", a3, v5);

  return v6;
}

- (unsigned)appearanceIdentifierForName:(id)a3
{
  objc_sync_enter(self);
  LOWORD(a3) = (unsigned __int16)objc_msgSend(-[NSMutableDictionary objectForKey:](self->_apperanceNameIdentifierStore, "objectForKey:", a3), "unsignedShortValue");
  objc_sync_exit(self);
  return (unsigned __int16)a3;
}

- (id)renditionInfoForIdentifier:(unsigned __int16)a3
{
  uint64_t v3;
  id v5;

  v3 = a3;
  objc_sync_enter(self);
  v5 = -[NSMutableDictionary objectForKey:](self->_renditionInfoStore, "objectForKey:", +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", v3));
  objc_sync_exit(self);
  return v5;
}

- (const)renditionKeyForName:(id)a3
{
  id v5;
  size_t v6;
  unsigned __int16 *v7;
  const _renditionkeytoken *v8;

  objc_sync_enter(self);
  v5 = -[NSMutableDictionary objectForKey:](self->_nameIdentifierStore, "objectForKey:", a3);
  if (v5)
  {
    v6 = (*((_DWORD *)-[CUIMutableStructuredThemeStore keyFormat](self, "keyFormat") + 2) + 1);
    v7 = (unsigned __int16 *)malloc_type_calloc(v6, 4uLL, 0x100004052888210uLL);
    CUIRenditionKeySetValueForAttribute(v7, 17, (unsigned __int16)objc_msgSend(v5, "integerValue"), (unsigned __int16)v6);
    v8 = -[NSData bytes](+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v7, 2 * v6, 1), "bytes");
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(self);
  return v8;
}

- (id)appearances
{
  NSMutableDictionary *apperanceNameIdentifierStore;

  objc_sync_enter(self);
  apperanceNameIdentifierStore = self->_apperanceNameIdentifierStore;
  objc_sync_exit(self);
  return apperanceNameIdentifierStore;
}

- (id)path
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.coreui.mutablestorage %@"), self->_identifier);
}

- (CUIMutableStructuredThemeStore)initWithIdentifier:(id)a3
{
  CUIMutableStructuredThemeStore *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIMutableStructuredThemeStore;
  v4 = -[CUIMutableStructuredThemeStore init](&v6, sel_init);
  v4->_identifier = (NSString *)a3;
  v4->_memoryStore = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v4->_nameIdentifierStore = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v4->_renditionInfoStore = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v4->_apperanceNameIdentifierStore = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  return v4;
}

- (_renditionkeytoken)renditionKeyForAssetWithName:(id)a3 withDescription:(id)a4
{
  NSNumber *v7;
  unsigned int v8;
  _renditionkeytoken *v9;
  uint64_t v10;
  unint64_t i;
  id v12;
  NSNumber *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  id v23;

  objc_sync_enter(self);
  v7 = (NSNumber *)-[NSMutableDictionary objectForKey:](self->_nameIdentifierStore, "objectForKey:", a3);
  v8 = *((_DWORD *)-[CUIMutableStructuredThemeStore keyFormat](self, "keyFormat") + 2) + 1;
  v9 = (_renditionkeytoken *)malloc_type_calloc(v8, 4uLL, 0x100004052888210uLL);
  v10 = 0;
  for (i = 0; i < *((unsigned int *)-[CUIMutableStructuredThemeStore keyFormat](self, "keyFormat") + 2); ++i)
  {
    v9[v10].identifier = *(_DWORD *)((char *)-[CUIMutableStructuredThemeStore keyFormat](self, "keyFormat")
                                   + v10 * 4
                                   + 12);
    ++v10;
  }
  if (!v7)
  {
    ++self->_maxNameIdentifier;
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    -[NSMutableDictionary setObject:forKey:](self->_nameIdentifierStore, "setObject:forKey:", v7, a3);
  }
  v12 = objc_msgSend(a4, "appearanceName");
  if (!v12)
    v12 = -[CUIMutableStructuredThemeStore defaultAppearanceName](self, "defaultAppearanceName");
  v13 = (NSNumber *)-[NSMutableDictionary objectForKey:](self->_apperanceNameIdentifierStore, "objectForKey:", v12);
  if (!v13)
  {
    if ((objc_msgSend(v12, "isEqualToString:", -[CUIMutableStructuredThemeStore defaultAppearanceName](self, "defaultAppearanceName")) & 1) != 0)
    {
      v13 = (NSNumber *)&unk_1E41DCEF0;
    }
    else
    {
      ++self->_maxApperanceNameIdentifier;
      v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    }
    -[NSMutableDictionary setObject:forKey:](self->_apperanceNameIdentifierStore, "setObject:forKey:", v13, v12);
  }
  v23 = objc_msgSend(a4, "subtype");
  v14 = objc_msgSend(a4, "idiom");
  CUIValidateIdiomSubtypes((uint64_t)v14, (uint64_t *)&v23, v15, v16, v17, v18, v19, v20);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 17, (unsigned __int16)-[NSNumber integerValue](v7, "integerValue"), (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 15, (unsigned __int16)objc_msgSend(a4, "idiom"), (unsigned __int16)v8);
  objc_msgSend(a4, "scale");
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 12, (int)v21, (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 16, (unsigned __int16)v23, (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 24, (unsigned __int16)objc_msgSend(a4, "displayGamut"), (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 4, (unsigned __int16)objc_msgSend(a4, "layoutDirection"), (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 20, (unsigned __int16)objc_msgSend(a4, "sizeClassHorizontal"), (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 21, (unsigned __int16)objc_msgSend(a4, "sizeClassVertical"), (unsigned __int16)v8);
  CUIRenditionKeySetValueForAttribute(&v9->identifier, 7, (unsigned __int16)-[NSNumber integerValue](v13, "integerValue"), (unsigned __int16)v8);
  objc_sync_exit(self);
  return v9;
}

- (void)insertCGImage:(CGImage *)a3 withName:(id)a4 andDescription:(id)a5
{
  _renditionkeytoken *v9;
  id v10;
  id v11;
  CUIMutableThemeRendition *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _BYTE v17[256];

  objc_sync_enter(self);
  v9 = -[CUIMutableStructuredThemeStore renditionKeyForAssetWithName:withDescription:](self, "renditionKeyForAssetWithName:withDescription:", a4, a5);
  v10 = -[NSMutableDictionary objectForKey:](self->_nameIdentifierStore, "objectForKey:", a4);
  v11 = -[CUIStructuredThemeStore copyKeySignatureForKey:withBytesNoCopy:length:](self, "copyKeySignatureForKey:withBytesNoCopy:length:", v9, v17, 256);
  if (!self->_memoryStore)
    self->_memoryStore = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v12 = -[CUIMutableThemeRendition initWithCGImage:withDescription:forKey:]([CUIMutableThemeRendition alloc], "initWithCGImage:withDescription:forKey:", a3, a5, v9);
  -[CUIMutableThemeRendition setName:](v12, "setName:", a4);
  v13 = objc_msgSend(v11, "copy");
  v14 = -[NSMutableDictionary objectForKey:](self->_memoryStore, "objectForKey:", v10);
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setObject:forKey:", v12, v13);
    -[NSMutableDictionary setObject:forKey:](self->_memoryStore, "setObject:forKey:", v15, v10);
  }
  else
  {
    v16 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v16, "setObject:forKey:", v12, v13);
    -[NSMutableDictionary setObject:forKey:](self->_memoryStore, "setObject:forKey:", v16, v10);

  }
  -[CUIMutableStructuredThemeStore _addRenditionInfoForImageWithName:andKey:](self, "_addRenditionInfoForImageWithName:andKey:", a4, v9);
  free(v9);
  objc_sync_exit(self);
}

- (void)_addRenditionInfoForImageWithName:(id)a3 andKey:(_renditionkeytoken *)a4
{
  id v6;
  id v7;
  id v8;
  CUINamedRenditionInfo *v9;
  CUINamedRenditionInfo *v10;
  int v11;
  _renditionkeytoken *v12;
  BOOL v13;
  CUINamedRenditionInfo *v14;

  v6 = -[NSMutableDictionary objectForKey:](self->_nameIdentifierStore, "objectForKey:", a3);
  if (v6)
  {
    v7 = v6;
    v8 = -[NSMutableDictionary objectForKey:](self->_renditionInfoStore, "objectForKey:", v6);
    if (v8)
      v9 = (CUINamedRenditionInfo *)objc_msgSend(v8, "copy");
    else
      v9 = -[CUINamedRenditionInfo initWithKeyFormat:andPlatform:]([CUINamedRenditionInfo alloc], "initWithKeyFormat:andPlatform:", -[CUIMutableStructuredThemeStore keyFormat](self, "keyFormat"), -[CUIMutableStructuredThemeStore deploymentPlatform](self, "deploymentPlatform"));
    v10 = v9;
    v14 = v9;
    if (__PAIR64__(a4->value, a4->identifier))
    {
      v11 = 1;
      do
      {
        -[CUINamedRenditionInfo setAttributePresent:withValue:](v10, "setAttributePresent:withValue:");
        v10 = v14;
        v12 = &a4[v11++];
        if (v12->value)
          v13 = 0;
        else
          v13 = v12->identifier == 0;
      }
      while (!v13);
    }
    -[NSMutableDictionary setObject:forKey:](self->_renditionInfoStore, "setObject:forKey:", v10, v7);

  }
}

- (id)defaultAppearanceName
{
  if (-[CUIMutableStructuredThemeStore deploymentPlatform](self, "deploymentPlatform"))
    return CFSTR("UIAppearanceAny");
  else
    return CFSTR("NSAppearanceNameSystem");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIMutableStructuredThemeStore;
  -[CUIStructuredThemeStore dealloc](&v3, sel_dealloc);
}

- (int64_t)maximumRenditionKeyTokenCount
{
  return 21;
}

- (BOOL)usesCUISystemThemeRenditionKey
{
  return 1;
}

- (id)allImageNames
{
  id v3;

  objc_sync_enter(self);
  v3 = -[NSMutableDictionary allKeys](self->_nameIdentifierStore, "allKeys");
  objc_sync_exit(self);
  return v3;
}

- (id)imagesWithName:(id)a3
{
  id v5;
  id v6;
  _QWORD v8[7];

  objc_sync_enter(self);
  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v6 = -[NSMutableDictionary objectForKey:](self->_memoryStore, "objectForKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", CUIRenditionKeyValueForAttribute((unsigned __int16 *)-[CUIMutableStructuredThemeStore renditionKeyForName:](self, "renditionKeyForName:", a3), 17)));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49__CUIMutableStructuredThemeStore_imagesWithName___block_invoke;
  v8[3] = &unk_1E41AB588;
  v8[4] = a3;
  v8[5] = self;
  v8[6] = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_sync_exit(self);
  return v5;
}

void __49__CUIMutableStructuredThemeStore_imagesWithName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CUINamedImage *v4;
  CUIRenditionKey *v5;

  v5 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a3, "key"));
  v4 = -[CUINamedImage initWithName:usingRenditionKey:fromTheme:]([CUINamedImage alloc], "initWithName:usingRenditionKey:fromTheme:", *(_QWORD *)(a1 + 32), v5, objc_msgSend(*(id *)(a1 + 40), "themeIndex"));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);

}

- (void)_removeRenditionInfoForImageWithName:(id)a3
{
  id v4;

  v4 = -[NSMutableDictionary objectForKey:](self->_nameIdentifierStore, "objectForKey:", a3);
  if (v4)
    -[NSMutableDictionary removeObjectForKey:](self->_renditionInfoStore, "removeObjectForKey:", v4);
}

- (void)removeImageNamed:(id)a3 withDescription:(id)a4
{
  id v7;
  _renditionkeytoken *v8;
  id v9;
  id v10;
  _BYTE v11[256];

  objc_sync_enter(self);
  v7 = -[NSMutableDictionary objectForKey:](self->_nameIdentifierStore, "objectForKey:", a3);
  if (v7)
  {
    v8 = -[CUIMutableStructuredThemeStore renditionKeyForAssetWithName:withDescription:](self, "renditionKeyForAssetWithName:withDescription:", a3, a4);
    v9 = -[CUIStructuredThemeStore copyKeySignatureForKey:withBytesNoCopy:length:](self, "copyKeySignatureForKey:withBytesNoCopy:length:", v8, v11, 256);
    v10 = -[NSMutableDictionary objectForKey:](self->_memoryStore, "objectForKey:", v7);
    objc_msgSend(v10, "removeObjectForKey:", v9);
    free(v8);

    if (!objc_msgSend(v10, "count"))
    {
      -[CUIMutableStructuredThemeStore _removeRenditionInfoForImageWithName:](self, "_removeRenditionInfoForImageWithName:", a3);
      -[NSMutableDictionary removeObjectForKey:](self->_memoryStore, "removeObjectForKey:", v7);
      -[NSMutableDictionary removeObjectForKey:](self->_nameIdentifierStore, "removeObjectForKey:", a3);
    }
  }
  objc_sync_exit(self);
}

- (void)removeImagesNamed:(id)a3
{
  id v5;

  objc_sync_enter(self);
  v5 = -[NSMutableDictionary objectForKey:](self->_nameIdentifierStore, "objectForKey:", a3);
  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_memoryStore, "removeObjectForKey:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_nameIdentifierStore, "removeObjectForKey:", a3);
    -[CUIMutableStructuredThemeStore _removeRenditionInfoForImageWithName:](self, "_removeRenditionInfoForImageWithName:", a3);
  }
  objc_sync_exit(self);
}

- (void)clearRenditionCache
{
  NSMutableDictionary *v3;
  objc_super v4;

  objc_sync_enter(self);
  v4.receiver = self;
  v4.super_class = (Class)CUIMutableStructuredThemeStore;
  -[CUIStructuredThemeStore clearRenditionCache](&v4, sel_clearRenditionCache);
  v3 = self->_memoryStore;
  self->_memoryStore = 0;
  -[NSMutableDictionary removeAllObjects](self->_nameIdentifierStore, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_renditionInfoStore, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_apperanceNameIdentifierStore, "removeAllObjects");
  self->_maxNameIdentifier = 0;
  self->_maxApperanceNameIdentifier = 0;
  objc_sync_exit(self);
}

- (id)deploymentPlatformString
{
  uint64_t v2;

  v2 = CUICurrentPlatform();
  return (id)CUIPlatformNameForPlatform(v2);
}

- (id)nameForAppearanceIdentifier:(unsigned __int16)a3
{
  int v3;
  NSMutableDictionary *apperanceNameIdentifierStore;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  objc_sync_enter(self);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  apperanceNameIdentifierStore = self->_apperanceNameIdentifierStore;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](apperanceNameIdentifierStore, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(apperanceNameIdentifierStore);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if (objc_msgSend(-[NSMutableDictionary objectForKey:](self->_apperanceNameIdentifierStore, "objectForKey:", v9), "unsignedShortValue") == v3)break;
      if (v6 == (id)++v8)
      {
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](apperanceNameIdentifierStore, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  objc_sync_exit(self);
  return v9;
}

@end
