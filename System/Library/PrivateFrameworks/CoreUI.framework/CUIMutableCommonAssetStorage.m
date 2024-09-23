@implementation CUIMutableCommonAssetStorage

- (CUIMutableCommonAssetStorage)initWithPath:(id)a3
{
  CUIMutableCommonAssetStorage *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _carheader *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;
  objc_super v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CUIMutableCommonAssetStorage;
  v4 = -[CUIMutableCommonAssetStorage init](&v31, sel_init);
  if (v4)
  {
    v5 = BOMStorageNewWithOptionsAndSys((uint64_t)objc_msgSend(a3, "fileSystemRepresentation"), 0, 0);
    if (v5)
    {
      v6 = (_BYTE *)v5;
      *((_BYTE *)v4 + 544) |= 1u;
      -[CUICommonAssetStorage _initDefaultHeaderVersion:versionString:](v4, "_initDefaultHeaderVersion:versionString:", "@(#)PROGRAM:CoreUI  PROJECT:CoreUI-916\n", 916.0);
      v7 = BOMStorageNewNamedBlock((uint64_t)v6, "CARHEADER");
      if ((_DWORD)v7)
      {
        v8 = v7;
        v9 = -[CUICommonAssetStorage header](v4, "header");
        BOMStorageCopyToBlock((uint64_t)v6, v8, v9, 0x1B4uLL, v10, v11, v12, v13);
      }
      v14 = BOMTreeNewWithName((uint64_t)v6, "RENDITIONS");
      if (v14)
      {
        -[CUICommonAssetStorage setImagedb:](v4, "setImagedb:", v14);
        -[CUICommonAssetStorage setFacetKeysdb:](v4, "setFacetKeysdb:", BOMTreeNewWithName((uint64_t)v6, "FACETKEYS"));
        return v4;
      }
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to create image store in %@", v15, v16, v17, v18, v19, v20, (uint64_t)a3);
      BOMStorageFree(v6);
      v30.receiver = v4;
      v30.super_class = (Class)CUIMutableCommonAssetStorage;
      -[CUIMutableCommonAssetStorage release](&v30, sel_release);
    }
    else
    {
      v21 = __error();
      strerror(*v21);
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to create storage file %@ error '%s'", v22, v23, v24, v25, v26, v27, (uint64_t)a3);
      v29.receiver = v4;
      v29.super_class = (Class)CUIMutableCommonAssetStorage;
      -[CUIMutableCommonAssetStorage release](&v29, sel_release);
    }
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIMutableCommonAssetStorage;
  -[CUICommonAssetStorage dealloc](&v3, sel_dealloc);
}

- (void)setUseBitmapIndex:(BOOL)a3
{
  *((_BYTE *)self + 544) = *((_BYTE *)self + 544) & 0xFE | a3;
}

- (BOOL)useBitmapIndex
{
  return *((_BYTE *)self + 544) & 1;
}

- (void)setKeyFormatData:(id)a3
{
  _renditionkeyfmt *v5;
  uint64_t v6;
  uint64_t v7;
  _renditionkeyfmt *v8;
  _renditionkeyfmt *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v5 = -[CUICommonAssetStorage keyfmt](self, "keyfmt");
  if (v5)
    free(v5);
  -[CUICommonAssetStorage setKeyfmt:](self, "setKeyfmt:", malloc_type_malloc((size_t)objc_msgSend(a3, "length"), 0xA8887B82uLL));
  objc_msgSend(a3, "getBytes:length:", -[CUICommonAssetStorage keyfmt](self, "keyfmt"), objc_msgSend(a3, "length"));
  v6 = BOMTreeStorage((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"));
  if (!BOMStorageGetNamedBlock(v6, "KEYFORMAT"))
  {
    v7 = BOMStorageNewNamedBlock(v6, "KEYFORMAT");
    v8 = -[CUICommonAssetStorage keyfmt](self, "keyfmt");
    v9 = -[CUICommonAssetStorage keyfmt](self, "keyfmt");
    BOMStorageCopyToBlock(v6, v7, v8, 4 * (v9->var2 + 3), v10, v11, v12, v13);
  }
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
}

- (void)setKeySemantics:(int)a3
{
  if (-[CUICommonAssetStorage header](self, "header"))
    *((_DWORD *)-[CUICommonAssetStorage header](self, "header") + 108) = a3;
}

- (void)setStorageVersion:(unsigned int)a3
{
  if (-[CUICommonAssetStorage header](self, "header"))
    *((_DWORD *)-[CUICommonAssetStorage header](self, "header") + 2) = a3;
}

- (void)setVersionString:(const char *)a3
{
  _carheader *v5;

  v5 = -[CUICommonAssetStorage header](self, "header");
  if (a3)
  {
    if (v5)
      strncpy((char *)-[CUICommonAssetStorage header](self, "header") + 148, a3, 0xFFuLL);
  }
}

- (void)setSchemaVersion:(unsigned int)a3
{
  if (-[CUICommonAssetStorage header](self, "header"))
    *((_DWORD *)-[CUICommonAssetStorage header](self, "header") + 106) = a3;
}

- (void)setRenditionCount:(unsigned int)a3
{
  if (-[CUICommonAssetStorage header](self, "header"))
    *((_DWORD *)-[CUICommonAssetStorage header](self, "header") + 4) = a3;
}

- (void)setUuid:(id)a3
{
  if (-[CUICommonAssetStorage header](self, "header"))
    objc_msgSend(a3, "getUUIDBytes:", (char *)-[CUICommonAssetStorage header](self, "header") + 404);
}

- (void)setAssociatedChecksum:(unsigned int)a3
{
  if (-[CUICommonAssetStorage header](self, "header"))
    *((_DWORD *)-[CUICommonAssetStorage header](self, "header") + 105) = a3;
}

- (void)setColorSpaceID:(unsigned int)a3
{
  if (-[CUICommonAssetStorage header](self, "header"))
    *((_DWORD *)-[CUICommonAssetStorage header](self, "header") + 107) = a3;
}

- (void)setEnableLargeCarKeyWorkaround:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 544) = *((_BYTE *)self + 544) & 0xFD | v3;
}

- (void)_allocateExtendedMetadata
{
  -[CUICommonAssetStorage _loadExtendedMetadata](self, "_loadExtendedMetadata");
  if (!-[CUICommonAssetStorage extendedMetadata](self, "extendedMetadata"))
  {
    -[CUICommonAssetStorage setExtendedMetadata:](self, "setExtendedMetadata:", malloc_type_calloc(1uLL, 0x404uLL, 0x100004084B5CCE0uLL));
    *(_DWORD *)-[CUICommonAssetStorage extendedMetadata](self, "extendedMetadata") = 1096041805;
  }
}

- (void)setThinningArguments:(id)a3
{
  -[CUIMutableCommonAssetStorage _allocateExtendedMetadata](self, "_allocateExtendedMetadata");
  if (objc_msgSend(a3, "length"))
    strncpy((char *)-[CUICommonAssetStorage extendedMetadata](self, "extendedMetadata") + 4, (const char *)objc_msgSend(a3, "UTF8String"), 0xFFuLL);
}

- (void)setDeploymentPlatform:(id)a3
{
  -[CUIMutableCommonAssetStorage _allocateExtendedMetadata](self, "_allocateExtendedMetadata");
  if (objc_msgSend(a3, "length"))
    strncpy((char *)-[CUICommonAssetStorage extendedMetadata](self, "extendedMetadata") + 516, (const char *)objc_msgSend(a3, "UTF8String"), 0xFFuLL);
}

- (void)setDeploymentPlatformVersion:(id)a3
{
  -[CUIMutableCommonAssetStorage _allocateExtendedMetadata](self, "_allocateExtendedMetadata");
  if (objc_msgSend(a3, "length"))
    strncpy((char *)-[CUICommonAssetStorage extendedMetadata](self, "extendedMetadata") + 260, (const char *)objc_msgSend(a3, "UTF8String"), 0xFFuLL);
}

- (void)setAuthoringTool:(id)a3
{
  -[CUIMutableCommonAssetStorage _allocateExtendedMetadata](self, "_allocateExtendedMetadata");
  if (objc_msgSend(a3, "length"))
    strncpy((char *)-[CUICommonAssetStorage extendedMetadata](self, "extendedMetadata") + 772, (const char *)objc_msgSend(a3, "UTF8String"), 0xFFuLL);
}

- (BOOL)setAsset:(id)a3 forKey:(id)a4
{
  return -[CUIMutableCommonAssetStorage setAsset:forKey:withLength:](self, "setAsset:forKey:withLength:", a3, objc_msgSend(a4, "bytes"), objc_msgSend(a4, "length"));
}

- (BOOL)setAsset:(id)a3 forKey:(const void *)a4 withLength:(unint64_t)a5
{
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const _renditionkeyfmt *v23;
  uint64_t var2;
  const _renditionkeyfmt *v25;
  unsigned int *var3;
  _WORD *v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v32;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v9 = -[CUICommonAssetStorage imagedb](self, "imagedb");
  v10 = objc_msgSend(a3, "bytes");
  v11 = objc_msgSend(a3, "length");
  v15 = BOMTreeSetValue((uint64_t)v9, (void *)a4, a5, v10, (size_t)v11, v12, v13, v14);
  v22 = v15;
  if (self->_bitmapInfo)
  {
    if (v15)
    {
LABEL_3:
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to add asset to store", v16, v17, v18, v19, v20, v21, v32);
      return v22 == 0;
    }
  }
  else
  {
    self->_bitmapInfo = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (v22)
      goto LABEL_3;
  }
  v23 = -[CUICommonAssetStorage keyFormat](self, "keyFormat");
  var2 = v23->var2;
  if ((_DWORD)var2)
  {
    v25 = v23;
    var3 = v23->var3;
    v27 = a4;
    while (1)
    {
      v28 = *var3++;
      if (v28 == 17)
        break;
      ++v27;
      if (!--var2)
        goto LABEL_13;
    }
    v29 = (unsigned __int16)*v27;
    if (*v27)
    {
      v30 = 0;
      do
      {
        -[CUICommonAssetStorage _addBitmapIndexForNameIdentifier:attribute:withValue:toDictionary:](self, "_addBitmapIndexForNameIdentifier:attribute:withValue:toDictionary:", v29, v25->var3[v30], *((unsigned __int16 *)a4 + v30), self->_bitmapInfo);
        ++v30;
      }
      while (v30 < v25->var2);
    }
  }
LABEL_13:
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v22 == 0;
}

- (void)setCatalogGlobalData:(id)a3
{
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  -[CUICommonAssetStorage setGlobals:](self, "setGlobals:", a3);
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
}

- (void)setAppearanceIdentifier:(unsigned __int16)a3 forName:(id)a4
{
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v7;
  uint64_t v8;
  void *v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 v20;

  v20 = a3;
  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a4);
  v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xC2566FC6uLL);
  CFStringGetFileSystemRepresentation((CFStringRef)a4, v7, MaximumSizeOfFileSystemRepresentation);
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  if (!-[CUICommonAssetStorage appearancedb](self, "appearancedb"))
  {
    v8 = BOMTreeStorage((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUICommonAssetStorage setAppearancedb:](self, "setAppearancedb:", BOMTreeNewWithName(v8, "APPEARANCEKEYS"));
  }
  v9 = -[CUICommonAssetStorage appearancedb](self, "appearancedb");
  v10 = strlen(v7);
  if (BOMTreeSetValue((uint64_t)v9, v7, v10, &v20, 2uLL, v11, v12, v13))
    _CUILog(4, (uint64_t)"CoreUI: Error: unable to add look identifier '%@' with value '%d' to store", v14, v15, v16, v17, v18, v19, (uint64_t)a4);
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  free(v7);
}

- (void)setLocalizationIdentifier:(unsigned __int16)a3 forName:(id)a4
{
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v7;
  uint64_t v8;
  void *v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 v20;

  v20 = a3;
  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a4);
  v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x4CFFDAA2uLL);
  CFStringGetFileSystemRepresentation((CFStringRef)a4, v7, MaximumSizeOfFileSystemRepresentation);
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  if (!-[CUICommonAssetStorage localizationdb](self, "localizationdb"))
  {
    v8 = BOMTreeStorage((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUICommonAssetStorage setLocalizationdb:](self, "setLocalizationdb:", BOMTreeNewWithName(v8, "LOCALIZATIONKEYS"));
  }
  v9 = -[CUICommonAssetStorage localizationdb](self, "localizationdb");
  v10 = strlen(v7);
  if (BOMTreeSetValue((uint64_t)v9, v7, v10, &v20, 2uLL, v11, v12, v13))
    _CUILog(4, (uint64_t)"CoreUI: Error: unable to add localization identifier '%@' with value '%d' to store", v14, v15, v16, v17, v18, v19, (uint64_t)a4);
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  free(v7);
}

- (void)updateBitmapInfo
{
  NSMutableDictionary *v3;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));

  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_bitmapInfo = v3;
  -[CUICommonAssetStorage _buildBitmapInfoIntoDictionary:](self, "_buildBitmapInfoIntoDictionary:", v3);
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
}

- (void)setColor:(_rgbquad)a3 forName:(const char *)a4 excludeFromFilter:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  _rgbquad v22;
  _OWORD v23[8];
  int v24;

  v5 = a5;
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  if (!-[CUICommonAssetStorage colordb](self, "colordb"))
  {
    v9 = BOMTreeStorage((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUICommonAssetStorage setColordb:](self, "setColordb:", BOMTreeNewWithName(v9, "COLORS"));
  }
  if (a4 && -[CUICommonAssetStorage colordb](self, "colordb"))
  {
    v24 = 0;
    memset(v23, 0, sizeof(v23));
    __strlcpy_chk((char *)v23 + 4, a4, 128, 128);
    HIDWORD(v20) = 1;
    v21 = v5;
    v22 = a3;
    v10 = -[CUICommonAssetStorage colordb](self, "colordb");
    if (BOMTreeSetValue((uint64_t)v10, v23, 0x84uLL, (char *)&v20 + 4, 0xCuLL, v11, v12, v13))
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to add color to store", v14, v15, v16, v17, v18, v19, v20);
    os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  }
}

- (void)setFontName:(id)a3 baselineOffset:(float)a4 forFontSelector:(id)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD v20[8];
  float v21;
  _OWORD v22[8];

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  if (-[CUICommonAssetStorage fontdb](self, "fontdb"))
  {
    if (!a5)
      goto LABEL_11;
  }
  else
  {
    v9 = BOMTreeStorage((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUICommonAssetStorage setFontdb:](self, "setFontdb:", BOMTreeNewWithName(v9, "FONTS"));
    if (!a5)
    {
LABEL_11:
      os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
      return;
    }
  }
  if (!-[CUICommonAssetStorage fontdb](self, "fontdb"))
    goto LABEL_11;
  memset(v22, 0, sizeof(v22));
  if ((objc_msgSend(a5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v22, 128, 0, 1, 0, 0, objc_msgSend(a5, "length"), 0) & 1) != 0)
  {
    v21 = 0.0;
    memset(v20, 0, sizeof(v20));
    objc_msgSend(a3, "length");
    if (objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v20, 128, 0, 1, 0))
    {
      v21 = a4;
      v10 = -[CUICommonAssetStorage fontdb](self, "fontdb");
      if (BOMTreeSetValue((uint64_t)v10, v22, 0x80uLL, v20, 0x84uLL, v11, v12, v13))
        _CUILog(4, (uint64_t)"CoreUI: Error: unable to add font to store", v14, v15, v16, v17, v18, v19, 0);
    }
  }
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
}

- (void)setFontSize:(float)a3 forFontSizeSelector:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  _OWORD v19[8];

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  if (-[CUICommonAssetStorage fontsizedb](self, "fontsizedb"))
  {
    if (!a4)
      goto LABEL_10;
  }
  else
  {
    v7 = BOMTreeStorage((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUICommonAssetStorage setFontsizedb:](self, "setFontsizedb:", BOMTreeNewWithName(v7, "FONTSIZES"));
    if (!a4)
    {
LABEL_10:
      os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
      return;
    }
  }
  if (!-[CUICommonAssetStorage fontsizedb](self, "fontsizedb"))
    goto LABEL_10;
  memset(v19, 0, sizeof(v19));
  objc_msgSend(a4, "length");
  if (objc_msgSend(a4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v19, 128, 0, 1, 0))
  {
    v18 = a3;
    v8 = -[CUICommonAssetStorage fontsizedb](self, "fontsizedb");
    if (BOMTreeSetValue((uint64_t)v8, v19, 0x80uLL, &v18, 4uLL, v9, v10, v11))
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to add font size to store", v12, v13, v14, v15, v16, v17, 0);
  }
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
}

- (void)setExternalTags:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  const __CFString *v10;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v12;
  uint64_t v13;
  uint64_t NamedBlock;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  _BYTE v29[128];

  v25.receiver = self;
  v25.super_class = (Class)CUIMutableCommonAssetStorage;
  v26 = 0;
  -[CUICommonAssetStorage setExternalTags:](&v25, sel_setExternalTags_, a3);
  v4 = objc_alloc_init((Class)NSMutableData);
  v27 = 1163414603;
  v28 = objc_msgSend(-[CUICommonAssetStorage externalTags](self, "externalTags"), "count");
  objc_msgSend(v4, "appendBytes:length:", &v27, 12);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = -[CUICommonAssetStorage externalTags](self, "externalTags", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(const __CFString **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v10);
        v12 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xE58E7624uLL);
        CFStringGetFileSystemRepresentation(v10, v12, MaximumSizeOfFileSystemRepresentation);
        LODWORD(v26) = 1008;
        HIDWORD(v26) = strnlen(v12, MaximumSizeOfFileSystemRepresentation) + 1;
        objc_msgSend(v4, "appendBytes:length:", &v26, 8);
        objc_msgSend(v4, "appendBytes:length:", v12, HIDWORD(v26));
        free(v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v7);
  }
  v13 = BOMTreeStorage((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"));
  NamedBlock = BOMStorageGetNamedBlock(v13, "EXTERNAL_KEYS");
  if ((_DWORD)NamedBlock || (NamedBlock = BOMStorageNewNamedBlock(v13, "EXTERNAL_KEYS"), (_DWORD)NamedBlock))
  {
    v15 = objc_msgSend(v4, "bytes");
    v16 = objc_msgSend(v4, "length");
    BOMStorageCopyToBlock(v13, NamedBlock, v15, (size_t)v16, v17, v18, v19, v20);
  }

}

- (void)removeAssetForKey:(id)a3
{
  -[CUIMutableCommonAssetStorage removeAssetForKey:withLength:](self, "removeAssetForKey:withLength:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
}

- (void)removeAssetForKey:(const void *)a3 withLength:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v7 = -[CUICommonAssetStorage imagedb](self, "imagedb");
  if (BOMTreeGetValue((uint64_t)v7, (void *)a3, a4, v8, v9, v10, v11, v12))
  {
    v13 = -[CUICommonAssetStorage imagedb](self, "imagedb");
    if (BOMTreeRemoveValue((uint64_t)v13, (void *)a3, a4, v14, v15, v16))
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to remove asset from store", v17, v18, v19, v20, v21, v22, v23);
  }
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
}

- (BOOL)removeAssetName:(id)a3
{
  return -[CUIMutableCommonAssetStorage removeAssetNameKey:withLength:](self, "removeAssetNameKey:withLength:", objc_msgSend(a3, "UTF8String"), objc_msgSend(a3, "length"));
}

- (BOOL)removeAssetNameKey:(const void *)a3 withLength:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v25;

  if (a3)
  {
    os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
    v7 = -[CUICommonAssetStorage facetKeysdb](self, "facetKeysdb");
    if (BOMTreeGetValue((uint64_t)v7, (void *)a3, a4, v8, v9, v10, v11, v12))
    {
      v13 = -[CUICommonAssetStorage facetKeysdb](self, "facetKeysdb");
      if (!BOMTreeRemoveValue((uint64_t)v13, (void *)a3, a4, v14, v15, v16))
      {
        v23 = 1;
        goto LABEL_8;
      }
      _CUILog(4, (uint64_t)"CoreUI: Error: unable to remove rendition key from store", v17, v18, v19, v20, v21, v22, v25);
    }
    v23 = 0;
LABEL_8:
    os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
    return v23;
  }
  return 0;
}

- (void)setRenditionKey:(const _renditionkeytoken *)a3 hotSpot:(CGPoint)a4 forName:(const char *)a5
{
  double y;
  double x;
  unsigned int v11;
  id v12;
  void *v13;
  size_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v27;
  __int16 v28;
  unsigned __int16 v29;

  y = a4.y;
  x = a4.x;
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  if (!a5)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUICommonAssetStorage.m"), 2759, CFSTR("Can't use NULL facetName"));
  v11 = CUIRenditionKeyTokenCount((uint64_t)a3);
  if (!v11)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUICommonAssetStorage.m"), 2763, CFSTR("Bad Rendition Key List"));
  v29 = v11;
  v28 = (int)x;
  v27 = (int)y;
  v12 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 4 * v11 + 6);
  objc_msgSend(v12, "appendBytes:length:", &v28, 2);
  objc_msgSend(v12, "appendBytes:length:", &v27, 2);
  objc_msgSend(v12, "appendBytes:length:", &v29, 2);
  objc_msgSend(v12, "appendBytes:length:", a3, 4 * v29);
  v13 = -[CUICommonAssetStorage facetKeysdb](self, "facetKeysdb");
  v14 = strlen(a5);
  v15 = objc_msgSend(v12, "bytes");
  v16 = objc_msgSend(v12, "length");
  if (BOMTreeSetValue((uint64_t)v13, (void *)a5, v14, v15, (size_t)v16, v17, v18, v19))
    _CUILog(4, (uint64_t)"CoreUI: Error: unable to add renditionkey to store", v20, v21, v22, v23, v24, v25, v26);

  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
}

- (BOOL)_saveBitmapInfo
{
  uint64_t v4;
  NSMutableDictionary *bitmapInfo;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned __int16 v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (!self->_bitmapInfo || (*((_BYTE *)self + 544) & 1) == 0)
    return 1;
  if (-[CUICommonAssetStorage bitmapKeydb](self, "bitmapKeydb"))
  {
    BOMTreeRemoveAndFree((uint64_t)-[CUICommonAssetStorage bitmapKeydb](self, "bitmapKeydb"));
    -[CUICommonAssetStorage setBitmapKeydb:](self, "setBitmapKeydb:", 0);
  }
  if (!-[CUICommonAssetStorage bitmapKeydb](self, "bitmapKeydb"))
  {
    v4 = BOMTreeStorage((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUICommonAssetStorage setBitmapKeydb:](self, "setBitmapKeydb:", BOMTreeNewWithOptions(v4, 0, "BITMAPKEYS", 1024, 1));
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  bitmapInfo = self->_bitmapInfo;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](bitmapInfo, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
LABEL_10:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(bitmapInfo);
      v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
      v11 = (unsigned __int16)objc_msgSend(v10, "integerValue");
      v12 = -[NSMutableDictionary objectForKey:](self->_bitmapInfo, "objectForKey:", v10);
      if (objc_msgSend(v12, "numberOfBitsSet"))
      {
        v13 = objc_msgSend(v12, "archivedData");
        v14 = -[CUICommonAssetStorage bitmapKeydb](self, "bitmapKeydb");
        v15 = objc_msgSend(v13, "bytes");
        v16 = objc_msgSend(v13, "length");
        if (BOMTreeSetValue((uint64_t)v14, (void *)v11, 2uLL, v15, (size_t)v16, v17, v18, v19))
          break;
      }
      if (v7 == (id)++v9)
      {
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](bitmapInfo, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          goto LABEL_10;
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    if (!BOMTreeCommit((uint64_t)-[CUICommonAssetStorage bitmapKeydb](self, "bitmapKeydb")))
      return 1;
  }
  return 0;
}

- (BOOL)_writeOutKeyFormatWithWorkaround
{
  uint64_t v3;
  unint64_t v4;
  _DWORD *v5;
  uint64_t NamedBlock;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = BOMTreeStorage((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"));
  if (!*((_DWORD *)-[CUICommonAssetStorage keyfmt](self, "keyfmt") + 2))
    return 0;
  v4 = 0;
  v5 = 0;
  do
  {
    if (*((_DWORD *)-[CUICommonAssetStorage keyfmt](self, "keyfmt") + v4 + 3) >= 0x18u)
    {
      if (!v5)
        v5 = malloc_type_calloc(*((unsigned int *)-[CUICommonAssetStorage keyfmt](self, "keyfmt") + 2), 4uLL, 0x100004052888210uLL);
      v5[v4] = *((_DWORD *)-[CUICommonAssetStorage keyfmt](self, "keyfmt") + v4 + 3);
    }
    ++v4;
  }
  while (v4 < *((unsigned int *)-[CUICommonAssetStorage keyfmt](self, "keyfmt") + 2));
  if (!v5)
    return 0;
  NamedBlock = BOMStorageGetNamedBlock(v3, "KEYFORMAT");
  v7 = BOMStorageGetNamedBlock(v3, "KEYFORMATWORKAROUND");
  if (!(_DWORD)v7)
    v7 = BOMStorageNewNamedBlock(v3, "KEYFORMATWORKAROUND");
  v8 = malloc_type_malloc(4 * *((unsigned int *)-[CUICommonAssetStorage keyfmt](self, "keyfmt") + 2) + 12, 0x7E995F42uLL);
  memcpy(v8, -[CUICommonAssetStorage keyfmt](self, "keyfmt"), 4 * (*((_DWORD *)-[CUICommonAssetStorage keyfmt](self, "keyfmt") + 2) + 3));
  if (*((_DWORD *)-[CUICommonAssetStorage keyfmt](self, "keyfmt") + 2))
  {
    v13 = 0;
    do
    {
      if (v5[v13])
        v8[v13 + 3] = 5;
      ++v13;
    }
    while (v13 < *((unsigned int *)-[CUICommonAssetStorage keyfmt](self, "keyfmt") + 2));
  }
  BOMStorageCopyToBlock(v3, NamedBlock, v8, 4 * (v8[2] + 3), v9, v10, v11, v12);
  BOMStorageCopyToBlock(v3, v7, v5, 4 * v8[2], v14, v15, v16, v17);
  free(v8);
  free(v5);
  return 1;
}

- (BOOL)writeToDiskAndCompact:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t NamedBlock;
  _carheader *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _carextendedMetadata *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;

  v3 = a3;
  os_unfair_lock_lock(-[CUICommonAssetStorage lock](self, "lock"));
  v5 = BOMTreeStorage((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"));
  NamedBlock = BOMStorageGetNamedBlock(v5, "CARHEADER");
  v7 = -[CUICommonAssetStorage header](self, "header");
  BOMStorageCopyToBlock(v5, NamedBlock, v7, 0x1B4uLL, v8, v9, v10, v11);
  if (-[CUICommonAssetStorage extendedMetadata](self, "extendedMetadata"))
  {
    v12 = BOMStorageGetNamedBlock(v5, "EXTENDED_METADATA");
    if (!(_DWORD)v12)
      v12 = BOMStorageNewNamedBlock(v5, "EXTENDED_METADATA");
    v13 = -[CUICommonAssetStorage extendedMetadata](self, "extendedMetadata");
    BOMStorageCopyToBlock(v5, v12, v13, 0x404uLL, v14, v15, v16, v17);
  }
  if (-[NSData length](-[CUICommonAssetStorage globals](self, "globals"), "length"))
  {
    v18 = BOMStorageGetNamedBlock(v5, "CARGLOBALS");
    if (!(_DWORD)v18)
      v18 = BOMStorageNewNamedBlock(v5, "CARGLOBALS");
    v19 = -[NSData bytes](-[CUICommonAssetStorage globals](self, "globals"), "bytes");
    v20 = -[NSData length](-[CUICommonAssetStorage globals](self, "globals"), "length");
    BOMStorageCopyToBlock(v5, v18, v19, v20, v21, v22, v23, v24);
  }
  if ((*((_BYTE *)self + 544) & 2) != 0)
    -[CUIMutableCommonAssetStorage _writeOutKeyFormatWithWorkaround](self, "_writeOutKeyFormatWithWorkaround");
  v25 = !BOMTreeCommit((uint64_t)-[CUICommonAssetStorage imagedb](self, "imagedb"))
     && (!-[CUICommonAssetStorage colordb](self, "colordb")
      || !BOMTreeCommit((uint64_t)-[CUICommonAssetStorage colordb](self, "colordb")))
     && (!-[CUICommonAssetStorage fontdb](self, "fontdb")
      || !BOMTreeCommit((uint64_t)-[CUICommonAssetStorage fontdb](self, "fontdb")))
     && (!-[CUICommonAssetStorage fontsizedb](self, "fontsizedb")
      || !BOMTreeCommit((uint64_t)-[CUICommonAssetStorage fontsizedb](self, "fontsizedb")))
     && (!-[CUICommonAssetStorage facetKeysdb](self, "facetKeysdb")
      || !BOMTreeCommit((uint64_t)-[CUICommonAssetStorage facetKeysdb](self, "facetKeysdb")))
     && (!self->_bitmapInfo || -[CUIMutableCommonAssetStorage _saveBitmapInfo](self, "_saveBitmapInfo"))
     && (!v3 || !BOMStorageCompact(v5))
     && BOMStorageCommit(v5) == 0;
  os_unfair_lock_unlock(-[CUICommonAssetStorage lock](self, "lock"));
  return v25;
}

- (BOOL)writeToDisk
{
  return -[CUIMutableCommonAssetStorage writeToDiskAndCompact:](self, "writeToDiskAndCompact:", 0);
}

@end
