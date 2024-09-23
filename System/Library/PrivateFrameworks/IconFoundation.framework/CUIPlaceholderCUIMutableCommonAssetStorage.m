@implementation CUIPlaceholderCUIMutableCommonAssetStorage

- (CUIPlaceholderCUIMutableCommonAssetStorage)initWithPath:(id)a3
{
  CUIPlaceholderCUIMutableCommonAssetStorage *v4;
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
  int *v15;
  uint64_t v17;
  char *v18;
  objc_super v19;
  objc_super v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CUIPlaceholderCUIMutableCommonAssetStorage;
  v4 = -[CUIPlaceholderCUIMutableCommonAssetStorage init](&v21, sel_init);
  if (v4)
  {
    v5 = BOMStorageNewWithOptionsAndSys(objc_msgSend(a3, "fileSystemRepresentation"), 0, 0);
    if (v5)
    {
      v6 = (_BYTE *)v5;
      *((_BYTE *)v4 + 544) |= 1u;
      -[CUIPlaceholderCUICommonAssetStorage _initDefaultHeaderVersion:versionString:](v4, "_initDefaultHeaderVersion:versionString:", "EMPTY\n", 0.0);
      v7 = BOMStorageNewNamedBlock((uint64_t)v6, "CARHEADER");
      if ((_DWORD)v7)
      {
        v8 = v7;
        v9 = -[CUIPlaceholderCUICommonAssetStorage header](v4, "header");
        BOMStorageCopyToBlock((uint64_t)v6, v8, v9, 0x1B4uLL, v10, v11, v12, v13);
      }
      v14 = BOMTreeNewWithName((uint64_t)v6, "RENDITIONS");
      if (v14)
      {
        -[CUIPlaceholderCUICommonAssetStorage setImagedb:](v4, "setImagedb:", v14);
        -[CUIPlaceholderCUICommonAssetStorage setFacetKeysdb:](v4, "setFacetKeysdb:", BOMTreeNewWithName((uint64_t)v6, "FACETKEYS"));
        return v4;
      }
      _CUILog();
      BOMStorageFree(v6);
      -[CUIPlaceholderCUIMutableCommonAssetStorage release](&v20, sel_release, a3, v17, v19.receiver, v19.super_class, v4, CUIPlaceholderCUIMutableCommonAssetStorage);
    }
    else
    {
      v15 = __error();
      v18 = strerror(*v15);
      _CUILog();
      -[CUIPlaceholderCUIMutableCommonAssetStorage release](&v19, sel_release, a3, v18, v4, CUIPlaceholderCUIMutableCommonAssetStorage, v20.receiver, v20.super_class);
    }
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPlaceholderCUIMutableCommonAssetStorage;
  -[CUIPlaceholderCUICommonAssetStorage dealloc](&v3, sel_dealloc);
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

  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  v5 = -[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt");
  if (v5)
    free(v5);
  -[CUIPlaceholderCUICommonAssetStorage setKeyfmt:](self, "setKeyfmt:", malloc_type_malloc(objc_msgSend(a3, "length"), 0xA8887B82uLL));
  objc_msgSend(a3, "getBytes:length:", -[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt"), objc_msgSend(a3, "length"));
  v6 = BOMTreeStorage((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"));
  if (!BOMStorageGetNamedBlock(v6, "KEYFORMAT"))
  {
    v7 = BOMStorageNewNamedBlock(v6, "KEYFORMAT");
    v8 = -[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt");
    v9 = -[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt");
    BOMStorageCopyToBlock(v6, v7, v8, 4 * (v9->var2 + 3), v10, v11, v12, v13);
  }
  os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
}

- (void)setKeySemantics:(int)a3
{
  if (-[CUIPlaceholderCUICommonAssetStorage header](self, "header"))
    *(_DWORD *)(-[CUIPlaceholderCUICommonAssetStorage header](self, "header") + 432) = a3;
}

- (void)setStorageVersion:(unsigned int)a3
{
  if (-[CUIPlaceholderCUICommonAssetStorage header](self, "header"))
    *(_DWORD *)(-[CUIPlaceholderCUICommonAssetStorage header](self, "header") + 8) = a3;
}

- (void)setVersionString:(const char *)a3
{
  _carheader *v5;

  v5 = -[CUIPlaceholderCUICommonAssetStorage header](self, "header");
  if (a3)
  {
    if (v5)
      strncpy((char *)(-[CUIPlaceholderCUICommonAssetStorage header](self, "header") + 148), a3, 0xFFuLL);
  }
}

- (void)setSchemaVersion:(unsigned int)a3
{
  if (-[CUIPlaceholderCUICommonAssetStorage header](self, "header"))
    *(_DWORD *)(-[CUIPlaceholderCUICommonAssetStorage header](self, "header") + 424) = a3;
}

- (void)setRenditionCount:(unsigned int)a3
{
  if (-[CUIPlaceholderCUICommonAssetStorage header](self, "header"))
    *(_DWORD *)(-[CUIPlaceholderCUICommonAssetStorage header](self, "header") + 16) = a3;
}

- (void)setUuid:(id)a3
{
  if (-[CUIPlaceholderCUICommonAssetStorage header](self, "header"))
    objc_msgSend(a3, "getUUIDBytes:", -[CUIPlaceholderCUICommonAssetStorage header](self, "header") + 404);
}

- (void)setAssociatedChecksum:(unsigned int)a3
{
  if (-[CUIPlaceholderCUICommonAssetStorage header](self, "header"))
    *(_DWORD *)(-[CUIPlaceholderCUICommonAssetStorage header](self, "header") + 420) = a3;
}

- (void)setColorSpaceID:(unsigned int)a3
{
  if (-[CUIPlaceholderCUICommonAssetStorage header](self, "header"))
    *(_DWORD *)(-[CUIPlaceholderCUICommonAssetStorage header](self, "header") + 428) = a3;
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
  -[CUIPlaceholderCUICommonAssetStorage _loadExtendedMetadata](self, "_loadExtendedMetadata");
  if (!-[CUIPlaceholderCUICommonAssetStorage extendedMetadata](self, "extendedMetadata"))
  {
    -[CUIPlaceholderCUICommonAssetStorage setExtendedMetadata:](self, "setExtendedMetadata:", malloc_type_calloc(1uLL, 0x404uLL, 0x100004084B5CCE0uLL));
    *(_DWORD *)-[CUIPlaceholderCUICommonAssetStorage extendedMetadata](self, "extendedMetadata") = 1096041805;
  }
}

- (void)setThinningArguments:(id)a3
{
  -[CUIPlaceholderCUIMutableCommonAssetStorage _allocateExtendedMetadata](self, "_allocateExtendedMetadata");
  if (objc_msgSend(a3, "length"))
    strncpy((char *)(-[CUIPlaceholderCUICommonAssetStorage extendedMetadata](self, "extendedMetadata") + 4), (const char *)objc_msgSend(a3, "UTF8String"), 0xFFuLL);
}

- (void)setDeploymentPlatform:(id)a3
{
  -[CUIPlaceholderCUIMutableCommonAssetStorage _allocateExtendedMetadata](self, "_allocateExtendedMetadata");
  if (objc_msgSend(a3, "length"))
    strncpy((char *)(-[CUIPlaceholderCUICommonAssetStorage extendedMetadata](self, "extendedMetadata") + 516), (const char *)objc_msgSend(a3, "UTF8String"), 0xFFuLL);
}

- (void)setDeploymentPlatformVersion:(id)a3
{
  -[CUIPlaceholderCUIMutableCommonAssetStorage _allocateExtendedMetadata](self, "_allocateExtendedMetadata");
  if (objc_msgSend(a3, "length"))
    strncpy((char *)(-[CUIPlaceholderCUICommonAssetStorage extendedMetadata](self, "extendedMetadata") + 260), (const char *)objc_msgSend(a3, "UTF8String"), 0xFFuLL);
}

- (void)setAuthoringTool:(id)a3
{
  -[CUIPlaceholderCUIMutableCommonAssetStorage _allocateExtendedMetadata](self, "_allocateExtendedMetadata");
  if (objc_msgSend(a3, "length"))
    strncpy((char *)(-[CUIPlaceholderCUICommonAssetStorage extendedMetadata](self, "extendedMetadata") + 772), (const char *)objc_msgSend(a3, "UTF8String"), 0xFFuLL);
}

- (BOOL)setAsset:(id)a3 forKey:(id)a4
{
  return -[CUIPlaceholderCUIMutableCommonAssetStorage setAsset:forKey:withLength:](self, "setAsset:forKey:withLength:", a3, objc_msgSend(a4, "bytes"), objc_msgSend(a4, "length"));
}

- (BOOL)setAsset:(id)a3 forKey:(const void *)a4 withLength:(unint64_t)a5
{
  int v9;
  int v10;
  const _renditionkeyfmt *v11;
  uint64_t var2;
  const _renditionkeyfmt *v13;
  unsigned int *var3;
  _WORD *v15;
  int v16;
  uint64_t v17;
  unint64_t v18;

  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  v9 = BOMTreeSetValue((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"), (void *)a4, a5, (const void *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
  v10 = v9;
  if (self->_bitmapInfo)
  {
    if (v9)
    {
LABEL_3:
      _CUILog();
      return v10 == 0;
    }
  }
  else
  {
    self->_bitmapInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v10)
      goto LABEL_3;
  }
  v11 = -[CUIPlaceholderCUICommonAssetStorage keyFormat](self, "keyFormat");
  var2 = v11->var2;
  if ((_DWORD)var2)
  {
    v13 = v11;
    var3 = v11->var3;
    v15 = a4;
    while (1)
    {
      v16 = *var3++;
      if (v16 == 17)
        break;
      ++v15;
      if (!--var2)
        goto LABEL_13;
    }
    v17 = (unsigned __int16)*v15;
    if (*v15)
    {
      v18 = 0;
      do
      {
        -[CUIPlaceholderCUICommonAssetStorage _addBitmapIndexForNameIdentifier:attribute:withValue:toDictionary:](self, "_addBitmapIndexForNameIdentifier:attribute:withValue:toDictionary:", v17, v13->var3[v18], *((unsigned __int16 *)a4 + v18), self->_bitmapInfo);
        ++v18;
      }
      while (v18 < v13->var2);
    }
  }
LABEL_13:
  os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  return v10 == 0;
}

- (void)setCatalogGlobalData:(id)a3
{
  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  -[CUIPlaceholderCUICommonAssetStorage setGlobals:](self, "setGlobals:", a3);
  os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
}

- (void)setAppearanceIdentifier:(unsigned __int16)a3 forName:(id)a4
{
  unsigned int v5;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  id v12;
  uint64_t v13;
  unsigned __int16 v14;

  v5 = a3;
  v14 = a3;
  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a4);
  v8 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xC2566FC6uLL);
  CFStringGetFileSystemRepresentation((CFStringRef)a4, v8, MaximumSizeOfFileSystemRepresentation);
  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  if (!-[CUIPlaceholderCUICommonAssetStorage appearancedb](self, "appearancedb"))
  {
    v9 = BOMTreeStorage((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUIPlaceholderCUICommonAssetStorage setAppearancedb:](self, "setAppearancedb:", BOMTreeNewWithName(v9, "APPEARANCEKEYS"));
  }
  v10 = -[CUIPlaceholderCUICommonAssetStorage appearancedb](self, "appearancedb");
  v11 = strlen(v8);
  if (BOMTreeSetValue((uint64_t)v10, v8, v11, &v14, 2uLL))
  {
    v12 = a4;
    v13 = v5;
    _CUILog();
  }
  os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock", v12, v13));
  free(v8);
}

- (void)setLocalizationIdentifier:(unsigned __int16)a3 forName:(id)a4
{
  unsigned int v5;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  id v12;
  uint64_t v13;
  unsigned __int16 v14;

  v5 = a3;
  v14 = a3;
  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)a4);
  v8 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x4CFFDAA2uLL);
  CFStringGetFileSystemRepresentation((CFStringRef)a4, v8, MaximumSizeOfFileSystemRepresentation);
  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  if (!-[CUIPlaceholderCUICommonAssetStorage localizationdb](self, "localizationdb"))
  {
    v9 = BOMTreeStorage((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUIPlaceholderCUICommonAssetStorage setLocalizationdb:](self, "setLocalizationdb:", BOMTreeNewWithName(v9, "LOCALIZATIONKEYS"));
  }
  v10 = -[CUIPlaceholderCUICommonAssetStorage localizationdb](self, "localizationdb");
  v11 = strlen(v8);
  if (BOMTreeSetValue((uint64_t)v10, v8, v11, &v14, 2uLL))
  {
    v12 = a4;
    v13 = v5;
    _CUILog();
  }
  os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock", v12, v13));
  free(v8);
}

- (void)updateBitmapInfo
{
  NSMutableDictionary *v3;

  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_bitmapInfo = v3;
  -[CUIPlaceholderCUICommonAssetStorage _buildBitmapInfoIntoDictionary:](self, "_buildBitmapInfoIntoDictionary:", v3);
  os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
}

- (void)setColor:(_rgbquad)a3 forName:(const char *)a4 excludeFromFilter:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v9;
  _DWORD v10[3];
  _OWORD v11[8];
  int v12;
  uint64_t v13;

  v5 = a5;
  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  if (!-[CUIPlaceholderCUICommonAssetStorage colordb](self, "colordb"))
  {
    v9 = BOMTreeStorage((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUIPlaceholderCUICommonAssetStorage setColordb:](self, "setColordb:", BOMTreeNewWithName(v9, "COLORS"));
  }
  if (a4 && -[CUIPlaceholderCUICommonAssetStorage colordb](self, "colordb"))
  {
    v12 = 0;
    memset(v11, 0, sizeof(v11));
    __strlcpy_chk();
    v10[0] = 1;
    v10[1] = v5;
    v10[2] = a3;
    if (BOMTreeSetValue((uint64_t)-[CUIPlaceholderCUICommonAssetStorage colordb](self, "colordb"), v11, 0x84uLL, v10, 0xCuLL))_CUILog();
    os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  }
}

- (void)setFontName:(id)a3 baselineOffset:(float)a4 forFontSelector:(id)a5
{
  uint64_t v9;
  _OWORD v10[8];
  float v11;
  _OWORD v12[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  if (-[CUIPlaceholderCUICommonAssetStorage fontdb](self, "fontdb"))
  {
    if (!a5)
      goto LABEL_11;
  }
  else
  {
    v9 = BOMTreeStorage((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUIPlaceholderCUICommonAssetStorage setFontdb:](self, "setFontdb:", BOMTreeNewWithName(v9, "FONTS"));
    if (!a5)
    {
LABEL_11:
      os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
      return;
    }
  }
  if (!-[CUIPlaceholderCUICommonAssetStorage fontdb](self, "fontdb"))
    goto LABEL_11;
  memset(v12, 0, sizeof(v12));
  if ((objc_msgSend(a5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v12, 128, 0, 1, 0, 0, objc_msgSend(a5, "length"), 0) & 1) != 0)
  {
    v11 = 0.0;
    memset(v10, 0, sizeof(v10));
    if (objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v10, 128, 0, 1, 0, 0, objc_msgSend(a3, "length"), 0))
    {
      v11 = a4;
      if (BOMTreeSetValue((uint64_t)-[CUIPlaceholderCUICommonAssetStorage fontdb](self, "fontdb"), v12, 0x80uLL, v10, 0x84uLL))_CUILog();
    }
  }
  os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
}

- (void)setFontSize:(float)a3 forFontSizeSelector:(id)a4
{
  uint64_t v7;
  float v8;
  _OWORD v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  if (-[CUIPlaceholderCUICommonAssetStorage fontsizedb](self, "fontsizedb"))
  {
    if (!a4)
      goto LABEL_10;
  }
  else
  {
    v7 = BOMTreeStorage((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUIPlaceholderCUICommonAssetStorage setFontsizedb:](self, "setFontsizedb:", BOMTreeNewWithName(v7, "FONTSIZES"));
    if (!a4)
    {
LABEL_10:
      os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
      return;
    }
  }
  if (!-[CUIPlaceholderCUICommonAssetStorage fontsizedb](self, "fontsizedb"))
    goto LABEL_10;
  memset(v9, 0, sizeof(v9));
  if (objc_msgSend(a4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v9, 128, 0, 1, 0, 0, objc_msgSend(a4, "length"), 0))
  {
    v8 = a3;
    if (BOMTreeSetValue((uint64_t)-[CUIPlaceholderCUICommonAssetStorage fontsizedb](self, "fontsizedb"), v9, 0x80uLL, &v8, 4uLL))_CUILog();
  }
  os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
}

- (void)setExternalTags:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFString *v10;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v12;
  uint64_t v13;
  uint64_t NamedBlock;
  const void *v15;
  size_t v16;
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
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)CUIPlaceholderCUIMutableCommonAssetStorage;
  v26 = 0;
  -[CUIPlaceholderCUICommonAssetStorage setExternalTags:](&v25, sel_setExternalTags_, a3);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v27 = 1163414603;
  v28 = objc_msgSend(-[CUIPlaceholderCUICommonAssetStorage externalTags](self, "externalTags"), "count");
  objc_msgSend(v4, "appendBytes:length:", &v27, 12);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = -[CUIPlaceholderCUICommonAssetStorage externalTags](self, "externalTags", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(const __CFString **)(*((_QWORD *)&v21 + 1) + 8 * i);
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
  v13 = BOMTreeStorage((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"));
  NamedBlock = BOMStorageGetNamedBlock(v13, "EXTERNAL_KEYS");
  if ((_DWORD)NamedBlock || (NamedBlock = BOMStorageNewNamedBlock(v13, "EXTERNAL_KEYS"), (_DWORD)NamedBlock))
  {
    v15 = (const void *)objc_msgSend(v4, "bytes");
    v16 = objc_msgSend(v4, "length");
    BOMStorageCopyToBlock(v13, NamedBlock, v15, v16, v17, v18, v19, v20);
  }

}

- (void)removeAssetForKey:(id)a3
{
  -[CUIPlaceholderCUIMutableCommonAssetStorage removeAssetForKey:withLength:](self, "removeAssetForKey:withLength:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
}

- (void)removeAssetForKey:(const void *)a3 withLength:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  v7 = -[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb");
  if (BOMTreeGetValue((uint64_t)v7, (void *)a3, a4, v8, v9, v10, v11, v12)
    && BOMTreeRemoveValue((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"), (void *)a3, a4))
  {
    _CUILog();
  }
  os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
}

- (BOOL)removeAssetName:(id)a3
{
  return -[CUIPlaceholderCUIMutableCommonAssetStorage removeAssetNameKey:withLength:](self, "removeAssetNameKey:withLength:", objc_msgSend(a3, "UTF8String"), objc_msgSend(a3, "length"));
}

- (BOOL)removeAssetNameKey:(const void *)a3 withLength:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  if (a3)
  {
    os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
    v7 = -[CUIPlaceholderCUICommonAssetStorage facetKeysdb](self, "facetKeysdb");
    if (BOMTreeGetValue((uint64_t)v7, (void *)a3, a4, v8, v9, v10, v11, v12))
    {
      if (!BOMTreeRemoveValue((uint64_t)-[CUIPlaceholderCUICommonAssetStorage facetKeysdb](self, "facetKeysdb"), (void *)a3, a4))
      {
        v13 = 1;
        goto LABEL_8;
      }
      _CUILog();
    }
    v13 = 0;
LABEL_8:
    os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
    return v13;
  }
  return 0;
}

- (void)setRenditionKey:(const _renditionkeytoken *)a3 hotSpot:(CGPoint)a4 forName:(const char *)a5
{
  double y;
  double x;
  unsigned int v10;
  void *v11;
  void *v12;
  size_t v13;
  __int16 v14;
  __int16 v15;
  unsigned __int16 v16;

  y = a4.y;
  x = a4.x;
  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  v10 = CUIRenditionKeyTokenCount((uint64_t)a3);
  v16 = v10;
  v15 = (int)x;
  v14 = (int)y;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 4 * v10 + 6);
  objc_msgSend(v11, "appendBytes:length:", &v15, 2);
  objc_msgSend(v11, "appendBytes:length:", &v14, 2);
  objc_msgSend(v11, "appendBytes:length:", &v16, 2);
  objc_msgSend(v11, "appendBytes:length:", a3, 4 * v16);
  v12 = -[CUIPlaceholderCUICommonAssetStorage facetKeysdb](self, "facetKeysdb");
  v13 = strlen(a5);
  if (BOMTreeSetValue((uint64_t)v12, (void *)a5, v13, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length")))_CUILog();

  os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
}

- (BOOL)_saveBitmapInfo
{
  uint64_t v4;
  NSMutableDictionary *bitmapInfo;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned __int16 v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_bitmapInfo || (*((_BYTE *)self + 544) & 1) == 0)
    return 1;
  if (-[CUIPlaceholderCUICommonAssetStorage bitmapKeydb](self, "bitmapKeydb"))
  {
    BOMTreeRemoveAndFree((uint64_t)-[CUIPlaceholderCUICommonAssetStorage bitmapKeydb](self, "bitmapKeydb"));
    -[CUIPlaceholderCUICommonAssetStorage setBitmapKeydb:](self, "setBitmapKeydb:", 0);
  }
  if (!-[CUIPlaceholderCUICommonAssetStorage bitmapKeydb](self, "bitmapKeydb"))
  {
    v4 = BOMTreeStorage((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"));
    -[CUIPlaceholderCUICommonAssetStorage setBitmapKeydb:](self, "setBitmapKeydb:", BOMTreeNewWithOptions(v4, 0, "BITMAPKEYS", 1024, 1));
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  bitmapInfo = self->_bitmapInfo;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](bitmapInfo, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_10:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(bitmapInfo);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      v11 = objc_msgSend(v10, "integerValue");
      v12 = (void *)-[NSMutableDictionary objectForKey:](self->_bitmapInfo, "objectForKey:", v10);
      if (objc_msgSend(v12, "numberOfBitsSet"))
      {
        v13 = (void *)objc_msgSend(v12, "archivedData");
        if (BOMTreeSetValue((uint64_t)-[CUIPlaceholderCUICommonAssetStorage bitmapKeydb](self, "bitmapKeydb"), (void *)v11, 2uLL, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length")))break;
      }
      if (v7 == ++v9)
      {
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](bitmapInfo, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_10;
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    if (!BOMTreeCommit((uint64_t)-[CUIPlaceholderCUICommonAssetStorage bitmapKeydb](self, "bitmapKeydb")))
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

  v3 = BOMTreeStorage((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"));
  if (!(_DWORD)-[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt")[8])
    return 0;
  v4 = 0;
  v5 = 0;
  do
  {
    if ((_DWORD)(-[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt") + 4 * v4)[12] >= 0x18u)
    {
      if (!v5)
        v5 = malloc_type_calloc(-[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt")[8], 4uLL, 0x100004052888210uLL);
      v5[v4] = (_DWORD)(-[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt") + 4 * v4)[12];
    }
    ++v4;
  }
  while (v4 < -[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt")[8]);
  if (!v5)
    return 0;
  NamedBlock = BOMStorageGetNamedBlock(v3, "KEYFORMAT");
  v7 = BOMStorageGetNamedBlock(v3, "KEYFORMATWORKAROUND");
  if (!(_DWORD)v7)
    v7 = BOMStorageNewNamedBlock(v3, "KEYFORMATWORKAROUND");
  v8 = malloc_type_malloc(4 * -[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt")[8] + 12, 0x7E995F42uLL);
  memcpy(v8, -[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt"), 4 * ((_DWORD)-[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt")[8] + 3));
  if ((_DWORD)-[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt")[8])
  {
    v13 = 0;
    do
    {
      if (v5[v13])
        v8[v13 + 3] = 5;
      ++v13;
    }
    while (v13 < -[CUIPlaceholderCUICommonAssetStorage keyfmt](self, "keyfmt")[8]);
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
  os_unfair_lock_lock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  v5 = BOMTreeStorage((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"));
  NamedBlock = BOMStorageGetNamedBlock(v5, "CARHEADER");
  v7 = -[CUIPlaceholderCUICommonAssetStorage header](self, "header");
  BOMStorageCopyToBlock(v5, NamedBlock, v7, 0x1B4uLL, v8, v9, v10, v11);
  if (-[CUIPlaceholderCUICommonAssetStorage extendedMetadata](self, "extendedMetadata"))
  {
    v12 = BOMStorageGetNamedBlock(v5, "EXTENDED_METADATA");
    if (!(_DWORD)v12)
      v12 = BOMStorageNewNamedBlock(v5, "EXTENDED_METADATA");
    v13 = -[CUIPlaceholderCUICommonAssetStorage extendedMetadata](self, "extendedMetadata");
    BOMStorageCopyToBlock(v5, v12, v13, 0x404uLL, v14, v15, v16, v17);
  }
  if (-[NSData length](-[CUIPlaceholderCUICommonAssetStorage globals](self, "globals"), "length"))
  {
    v18 = BOMStorageGetNamedBlock(v5, "CARGLOBALS");
    if (!(_DWORD)v18)
      v18 = BOMStorageNewNamedBlock(v5, "CARGLOBALS");
    v19 = -[NSData bytes](-[CUIPlaceholderCUICommonAssetStorage globals](self, "globals"), "bytes");
    v20 = -[NSData length](-[CUIPlaceholderCUICommonAssetStorage globals](self, "globals"), "length");
    BOMStorageCopyToBlock(v5, v18, v19, v20, v21, v22, v23, v24);
  }
  if ((*((_BYTE *)self + 544) & 2) != 0)
    -[CUIPlaceholderCUIMutableCommonAssetStorage _writeOutKeyFormatWithWorkaround](self, "_writeOutKeyFormatWithWorkaround");
  v25 = !BOMTreeCommit((uint64_t)-[CUIPlaceholderCUICommonAssetStorage imagedb](self, "imagedb"))
     && (!-[CUIPlaceholderCUICommonAssetStorage colordb](self, "colordb")
      || !BOMTreeCommit((uint64_t)-[CUIPlaceholderCUICommonAssetStorage colordb](self, "colordb")))
     && (!-[CUIPlaceholderCUICommonAssetStorage fontdb](self, "fontdb")
      || !BOMTreeCommit((uint64_t)-[CUIPlaceholderCUICommonAssetStorage fontdb](self, "fontdb")))
     && (!-[CUIPlaceholderCUICommonAssetStorage fontsizedb](self, "fontsizedb")
      || !BOMTreeCommit((uint64_t)-[CUIPlaceholderCUICommonAssetStorage fontsizedb](self, "fontsizedb")))
     && (!-[CUIPlaceholderCUICommonAssetStorage facetKeysdb](self, "facetKeysdb")
      || !BOMTreeCommit((uint64_t)-[CUIPlaceholderCUICommonAssetStorage facetKeysdb](self, "facetKeysdb")))
     && (!self->_bitmapInfo || -[CUIPlaceholderCUIMutableCommonAssetStorage _saveBitmapInfo](self, "_saveBitmapInfo"))
     && (!v3 || !BOMStorageCompact(v5))
     && BOMStorageCommit(v5) == 0;
  os_unfair_lock_unlock(-[CUIPlaceholderCUICommonAssetStorage lock](self, "lock"));
  return v25;
}

- (BOOL)writeToDisk
{
  return -[CUIPlaceholderCUIMutableCommonAssetStorage writeToDiskAndCompact:](self, "writeToDiskAndCompact:", 0);
}

@end
