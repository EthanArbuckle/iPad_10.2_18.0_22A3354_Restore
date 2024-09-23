@implementation CUIPlaceholderCUICarUtilAssetStorage

- (CUIPlaceholderCUICarUtilAssetStorage)initWithPath:(id)a3 forWriting:(BOOL)a4
{
  _BOOL8 v4;
  CUIPlaceholderCUICarUtilAssetStorage *v6;
  uint64_t v7;
  _BYTE *v8;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CUIPlaceholderCUICarUtilAssetStorage;
  v6 = -[CUIPlaceholderCUICarUtilAssetStorage init](&v10, sel_init);
  if (v6)
  {
    BOMExceptionHandlerSet(__commonAssetStoragetHandler);
    v7 = BOMStorageOpenWithSys(objc_msgSend(a3, "fileSystemRepresentation"), v4, 0);
    if (!v7)
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "CUIPlaceholder Error: Unable to read file at '%s'\n", (const char *)objc_msgSend(a3, "UTF8String"));
      goto LABEL_6;
    }
    v8 = (_BYTE *)v7;
    if (!-[CUIPlaceholderCUICommonAssetStorage _commonInitWithStorage:forWritting:](v6, "_commonInitWithStorage:forWritting:", v7, v4))
    {
      BOMStorageFree(v8);
LABEL_6:

      return 0;
    }
  }
  return v6;
}

- (void)_initDefaultHeaderVersion:(double)a3 versionString:(const char *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUIPlaceholderCUICarUtilAssetStorage;
  -[CUIPlaceholderCUICommonAssetStorage _initDefaultHeaderVersion:versionString:](&v4, sel__initDefaultHeaderVersion_versionString_, "@(#)PROGRAM:CUIPlaceholder  PROJECT:CoreUI-916\n", 916.0);
}

- (BOOL)_formatStorageKeyArrayBytes:(void *)a3 length:(unint64_t)a4 fromKey:(_renditionkeytoken *)a5
{
  const _renditionkeyfmt *v9;
  _renditionkeyattributeindex *v10;

  v9 = -[CUIPlaceholderCUICommonAssetStorage keyFormat](self, "keyFormat");
  v10 = -[CUIPlaceholderCUICommonAssetStorage keyAttributeIndex](self, "keyAttributeIndex");
  if (!a3 || a4 < 2 * (unint64_t)v9->var2)
    return 0;
  CUIFillCARKeyArrayForRenditionKey2((uint64_t)a3, (int *)a5, (uint64_t)v9, (uint64_t *)v10);
  return 1;
}

- (id)_newRenditionKeyDataFromKey:(_renditionkeytoken *)a3
{
  const _renditionkeyfmt *v5;
  size_t var2;
  __int128 *v7;
  uint64_t v8;
  BOOL v9;
  unsigned int v10;
  id v11;
  uint64_t v12;
  __int128 v14;
  _BYTE v15[22];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v15 = 0u;
  v5 = -[CUIPlaceholderCUICommonAssetStorage keyFormat](self, "keyFormat", 0, 0, 0, 0, 0, *(_QWORD *)&v15[14]);
  var2 = v5->var2;
  if (var2 < 0x16)
  {
    v7 = &v14;
    v8 = 42;
  }
  else
  {
    v7 = (__int128 *)malloc_type_calloc(var2, 2uLL, 0x1000040BDFB0063uLL);
    v8 = 2 * v5->var2;
  }
  v9 = -[CUIPlaceholderCUICarUtilAssetStorage _formatStorageKeyArrayBytes:length:fromKey:](self, "_formatStorageKeyArrayBytes:length:fromKey:", v7, v8, a3);
  v10 = v5->var2;
  if (v9)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D50]);
    v12 = 2 * v5->var2;
    if (v10 < 0x16)
      return (id)objc_msgSend(v11, "initWithBytes:length:", v7, v12);
    else
      return (id)objc_msgSend(v11, "initWithBytesNoCopy:length:freeWhenDone:", v7, v12, 1);
  }
  else
  {
    if (v10 >= 0x16)
      free(v7);
    return 0;
  }
}

- (id)lookupAssetForKey:(_renditionkeytoken *)a3
{
  id v4;
  id v5;

  v4 = -[CUIPlaceholderCUICarUtilAssetStorage _newRenditionKeyDataFromKey:](self, "_newRenditionKeyDataFromKey:", a3);
  v5 = -[CUIPlaceholderCUICommonAssetStorage assetForKey:](self, "assetForKey:", v4);

  return v5;
}

- (id)renditionWithKey:(const _renditionkeytoken *)a3
{
  id result;

  result = -[CUIPlaceholderCUICarUtilAssetStorage lookupAssetForKey:](self, "lookupAssetForKey:");
  if (result)
    return -[CUIPlaceholderCUIThemeRendition initWithCSIData:forKey:version:]([CUIPlaceholderCUIThemeRendition alloc], "initWithCSIData:forKey:version:", result, a3, -[CUIPlaceholderCUICommonAssetStorage distilledInCoreUIVersion](self, "distilledInCoreUIVersion"));
  return result;
}

- (BOOL)caAllowSubimageOfImage:(CGImage *)a3
{
  return 0;
}

@end
