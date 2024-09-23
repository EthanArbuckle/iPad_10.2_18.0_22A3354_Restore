@implementation _CUIThemeModelAssetRendition

- (id)initForArchiving:(id)a3 withMeshRenditionKeys:(id)a4
{
  _CUIThemeModelAssetRendition *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CUIThemeModelAssetRendition;
  v6 = -[_CUIThemeModelAssetRendition init](&v8, sel_init);
  if (v6)
  {
    v6->_asset = (MDLAsset *)a3;
    v6->_meshKeys = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", a4);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeModelAssetRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  id v6;
  char *v7;
  char *v8;
  int v9;
  unint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  CUIRenditionKey *v13;
  objc_super v15;
  _OWORD v16[6];

  v15.receiver = self;
  v15.super_class = (Class)_CUIThemeModelAssetRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v15, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  if (v6)
  {
    memset(v16, 0, 92);
    v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
    v9 = *((_DWORD *)v7 + 45);
    v8 = v7 + 180;
    if (v9 != 1297040449)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIThemeModelAssetRendition.m"), 70, CFSTR("CoreUI: Expecting a kCSIModelAssetSignature but didn't find it"));
    *((_QWORD *)v6 + 28) = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", *((unsigned int *)v8 + 2));
    if (*((_QWORD *)v8 + 1))
    {
      v10 = 0;
      v11 = v8 + 16;
      do
      {
        if (*v11 >= 0x58u)
          v12 = 88;
        else
          v12 = *v11;
        __memcpy_chk(v16, v11 + 1, v12, 92);
        v13 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", v16);
        objc_msgSend(*((id *)v6 + 28), "addObject:", v13);

        v11 = (_DWORD *)((char *)v11 + *v11 + 4);
        ++v10;
      }
      while (v10 < *((_QWORD *)v8 + 1));
    }
    *((_QWORD *)v6 + 27) = objc_alloc_init((Class)getMDLAssetClass[0]());
  }
  return v6;
}

- (id)modelAsset
{
  return self->_asset;
}

- (NSArray)meshKeys
{
  return (NSArray *)-[NSMutableArray copy](self->_meshKeys, "copy");
}

- (unint64_t)writeToData:(id)a3
{
  _BYTE *v5;
  NSMutableArray *meshKeys;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unsigned int v17;
  _QWORD v18[2];
  _BYTE v19[128];

  v17 = 0;
  v5 = objc_msgSend(a3, "length");
  v18[0] = 0x14D4F4441;
  v18[1] = -[NSMutableArray count](self->_meshKeys, "count");
  objc_msgSend(a3, "appendBytes:length:", v18, 16);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  meshKeys = self->_meshKeys;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](meshKeys, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(meshKeys);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "keyList");
        v17 = 4 * CUIRenditionKeyTokenCount((uint64_t)v11) + 4;
        objc_msgSend(a3, "appendBytes:length:", &v17, 4);
        objc_msgSend(a3, "appendBytes:length:", v11, v17);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](meshKeys, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v8);
  }
  return (_BYTE *)objc_msgSend(a3, "length") - v5;
}

@end
