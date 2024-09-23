@implementation CUIPlaceholder_CUIInternalLinkRendition

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPlaceholder_CUIInternalLinkRendition;
  -[CUIPlaceholderCUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (void)_setStructuredThemeStore:(id)a3
{
  objc_storeWeak((id *)&self->_sourceProvider, a3);
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  char *v5;
  uint64_t var0;
  uint64_t var10;
  int v8;
  char *v9;
  char *v10;
  char *v11;
  int v12;
  uint64_t v13;
  uint64x2_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64x2_t v18;
  uint64_t v19;
  const _csiheader *v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _DWORD v27[7];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CUIPlaceholder_CUIInternalLinkRendition;
  v5 = -[CUIPlaceholderCUIThemeRendition _initWithCSIHeader:version:](&v22, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  var0 = a3->var11.var0;
  if ((_DWORD)var0)
  {
    var10 = a3->var10;
    v26 = 0u;
    memset(v27, 0, sizeof(v27));
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    if (var10)
    {
      v8 = 0;
      v9 = (char *)&a3->var11.var1[var0 + 1] + var10;
      v21 = a3;
      do
      {
        v10 = 0;
        v11 = &v9[-var10];
        do
        {
          v12 = *(_DWORD *)v11;
          if (*(int *)v11 > 1009)
          {
            if (v12 == 1010)
            {
              v17 = *((_QWORD *)v11 + 2);
              v18.i64[0] = v17;
              v18.i64[1] = HIDWORD(v17);
              *(float64x2_t *)(v5 + 888) = vcvtq_f64_u64(v18);
              v19 = *((_QWORD *)v11 + 3);
              v18.i64[0] = v19;
              v18.i64[1] = HIDWORD(v19);
              *(float64x2_t *)(v5 + 904) = vcvtq_f64_u64(v18);
              __memcpy_chk();
              *((_QWORD *)v5 + 116) = -[CUIPlaceholderCUIRenditionKey initWithKeyList:]([CUIPlaceholderCUIRenditionKey alloc], "initWithKeyList:", &v23);
              objc_msgSend(v5, "_initializeTypeIdentifiersWithLayout:", *((unsigned __int16 *)v11 + 16));
            }
            else if (v12 == 1011)
            {
              v13 = *((_QWORD *)v11 + 2);
              v14.i64[0] = v13;
              v14.i64[1] = HIDWORD(v13);
              *(float64x2_t *)(v5 + 936) = vcvtq_f64_u64(v14);
              v15 = *((_QWORD *)v11 + 3);
              v14.i64[0] = v15;
              v14.i64[1] = HIDWORD(v15);
              *(float64x2_t *)(v5 + 952) = vcvtq_f64_u64(v14);
              v16 = *((_QWORD *)v11 + 4);
              v14.i64[0] = v16;
              v14.i64[1] = HIDWORD(v16);
              *(float64x2_t *)(v5 + 968) = vcvtq_f64_u64(v14);
            }
          }
          else if (v12 == 1001)
          {
            v10 = v11 + 8;
            *((_DWORD *)v5 + 54) = *((_DWORD *)v11 + 2);
          }
          else if (v12 == 1006)
          {
            objc_msgSend(v5, "setExifOrientation:", *((unsigned int *)v11 + 2));
          }
          v11 += *((unsigned int *)v11 + 1) + 8;
        }
        while (v11 < v9);
        if (!v10)
          break;
        if (++v8 >= v21->var11.var0)
          return v5;
        var10 = v21->var10;
        v26 = 0u;
        memset(v27, 0, sizeof(v27));
        v24 = 0u;
        v25 = 0u;
        v23 = 0u;
      }
      while ((_DWORD)var10);
    }

    return 0;
  }
  return v5;
}

- (int)bitmapEncoding
{
  return objc_msgSend(-[CUIPlaceholderCUIThemeRendition _sourceRendition](self, "_sourceRendition"), "bitmapEncoding");
}

- (BOOL)isOpaque
{
  return objc_msgSend(-[CUIPlaceholderCUIThemeRendition _sourceRendition](self, "_sourceRendition"), "isOpaque");
}

- (int)pixelFormat
{
  return objc_msgSend(-[CUIPlaceholderCUIThemeRendition _sourceRendition](self, "_sourceRendition"), "pixelFormat");
}

- (BOOL)isInternalLink
{
  return 1;
}

- (id)linkingToRendition
{
  return self->_referenceKey;
}

- (id)sliceInformation
{
  return self->_sliceInformation;
}

- (id)metrics
{
  return self->_renditionMetrics;
}

- (BOOL)isScaled
{
  return -[CUIPlaceholderCUIThemeRendition subtype](self, "subtype") == 31
      || -[CUIPlaceholderCUIThemeRendition subtype](self, "subtype") == 12
      || -[CUIPlaceholderCUIThemeRendition type](self, "type") == 2
      || -[CUIPlaceholderCUIThemeRendition type](self, "type") == 1;
}

- (id)data
{
  return (id)objc_msgSend(-[CUIPlaceholderCUIThemeRendition _sourceRendition](self, "_sourceRendition"), "data");
}

- (id)properties
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIPlaceholder_CUIInternalLinkRendition;
  v3 = -[CUIPlaceholderCUIThemeRendition properties](&v8, sel_properties);
  v4 = (void *)objc_msgSend(-[CUIPlaceholderCUIThemeRendition _sourceRendition](self, "_sourceRendition"), "properties");
  v5 = v4;
  if (v3)
  {
    if (objc_msgSend(v4, "count"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v3);
      objc_msgSend(v6, "addEntriesFromDictionary:", v5);
    }
    else
    {
      v6 = (void *)objc_msgSend(v3, "copy");
    }
    return v6;
  }
  return v5;
}

- (BOOL)isTiled
{
  if (-[CUIPlaceholderCUIThemeRendition type](self, "type") == 3
    || !-[CUIPlaceholderCUIThemeRendition type](self, "type")
    || -[CUIPlaceholderCUIThemeRendition type](self, "type") == 5
    || -[CUIPlaceholderCUIThemeRendition type](self, "type") == 8)
  {
    return -[CUIPlaceholderCUIThemeRendition subtype](self, "subtype") == 30
        || -[CUIPlaceholderCUIThemeRendition subtype](self, "subtype") == 11;
  }
  -[CUIPlaceholderCUIThemeRendition name](self, "name");
  _CUILog();
  return 0;
}

- (BOOL)edgesOnly
{
  return -[CUIPlaceholderCUIThemeRendition subtype](self, "subtype") == 34
      && CUIRenditionKeyValueForAttribute((unsigned __int16 *)-[CUIPlaceholderCUIThemeRendition key](self, "key"), 11) != 2;
}

- (double)originalUncroppedSize
{
  if (a1)
    return *(double *)(a1 + 936);
  else
    return 0.0;
}

- (double)alphaCroppedRect
{
  if (a1)
    return *(double *)(a1 + 952);
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceProvider);
}

@end
