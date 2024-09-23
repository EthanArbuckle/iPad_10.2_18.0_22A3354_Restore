@implementation CUIThemeFacet

+ (unint64_t)themeNamed:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  const __CFString *v7;
  unint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  NSError *v12;
  _QWORD v14[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  if (a3)
    v7 = (const __CFString *)a3;
  else
    v7 = CFSTR("AppThemeBits");
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __RunTimeThemeRefForBundleIdentifierAndName_block_invoke;
  v14[3] = &unk_1E41AB738;
  v14[4] = objc_msgSend(a4, "stringByAppendingFormat:", CFSTR(" %@"), v7);
  v14[5] = a4;
  v14[6] = v7;
  v14[7] = &v21;
  v14[8] = &v15;
  PerformBlockWithThemeRefCache((uint64_t)v14);
  v8 = v22[3];
  v9 = (void *)v16[5];
  if (v9)
  {
    if (!v8)
    {
      v10 = v9;
      goto LABEL_9;
    }

  }
  v10 = &stru_1E41B97C0;
LABEL_9:
  v11 = v22[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  if (!v11)
  {
    v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, NSLocalizedDescriptionKey, 0));
    v8 = 0;
    if (a5)
      *a5 = v12;
  }
  return v8;
}

+ (unint64_t)themeWithContentsOfURL:(id)a3 error:(id *)a4
{
  unint64_t v6;
  NSString *v7;
  unint64_t v8;
  void *v9;
  const __CFString *v10;
  NSString *v11;
  NSError *v12;
  uint64_t v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  if (a3)
  {
    do
      v6 = __ldxr(&RunTimeThemeRefForFileURL___counter);
    while (__stxr(v6 + 1, &RunTimeThemeRefForFileURL___counter));
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%lld"), objc_msgSend(a3, "path"), v6 + 1);
    if (v7)
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v16 = 0;
      v17 = &v16;
      v18 = 0x3052000000;
      v19 = __Block_byref_object_copy__1;
      v20 = __Block_byref_object_dispose__1;
      v21 = 0;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __RunTimeThemeRefForFileURL_block_invoke;
      v15[3] = &unk_1E41AB760;
      v15[4] = v7;
      v15[5] = a3;
      v15[6] = &v22;
      v15[7] = &v16;
      PerformBlockWithThemeRefCache((uint64_t)v15);
      v8 = v23[3];
      v9 = (void *)v17[5];
      if (v9)
      {
        if (v8)
        {
          v10 = v9;
          goto LABEL_14;
        }

      }
      v10 = &stru_1E41B97C0;
LABEL_14:
      v13 = v23[3];
      _Block_object_dispose(&v16, 8);
      _Block_object_dispose(&v22, 8);
      if (v13)
        return v8;
      goto LABEL_10;
    }
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RunTimeThemeRefForFileURL() unable to resolve location of catalog file from %@"), a3);
  }
  else
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RunTimeThemeRefForFileURL() unable to resolve location of catalog file from empty url %@"), 0);
  }
  v10 = (const __CFString *)v11;
LABEL_10:
  v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, NSLocalizedDescriptionKey, 0));
  v8 = 0;
  if (a4)
    *a4 = v12;
  return v8;
}

+ (void)initialize
{
  if ((id)objc_opt_class(CUIThemeFacet, a2) == a1)
    objc_msgSend(a1, "setVersion:", 2);
}

+ (void)_invalidateArtworkCaches
{
  os_unfair_lock_lock((os_unfair_lock_t)&artworkCacheMutex);
  os_unfair_lock_unlock((os_unfair_lock_t)&artworkCacheMutex);
}

+ (id)_themeStoreForThemeIndex:(unint64_t)a3
{
  return (id)_LookupStructuredThemeProvider(a3, a2);
}

- (id)_themeStore
{
  return objc_msgSend((id)objc_opt_class(self, a2), "_themeStoreForThemeIndex:", self->_themeIndex);
}

- (CGPoint)_hotSpot
{
  double x;
  double y;
  CGPoint result;

  x = self->_hotSpot.x;
  y = self->_hotSpot.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_updateSpecificRenditionKey:(id)a3 isFocused:(BOOL *)a4 owner:(id)a5 userInfo:(id)a6
{
  objc_msgSend(a3, "copyValuesFromKeyList:", self->_renditionKeyList);
  objc_msgSend(a5, "updateRenditionKey:getFocus:userInfo:", a3, a4, a6);
  objc_msgSend(a3, "setValuesFromKeyList:", self->_renditionKeyList);
}

- (id)_approximateRenditionForRenditionKey:(void *)a1
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v15;

  if (!a1)
    return 0;
  v4 = (uint64_t)objc_msgSend(a2, "themeScale");
  v5 = objc_msgSend(a1, "_themeStore");
  if (!v5)
  {
    _CUILog(4, (uint64_t)"Warning: -[CUIThemeFacet imageForState:value:variant:] unable to find theme store.", v6, v7, v8, v9, v10, v11, v15);
    return 0;
  }
  v12 = v5;
  v13 = objc_msgSend(v5, "canGetRenditionWithKey:", objc_msgSend(a2, "keyList"));
  if (v4 >= 2 && (v13 & 1) == 0)
  {
    objc_msgSend(a2, "setThemeScale:", 1);
    if ((objc_msgSend(v12, "canGetRenditionWithKey:", objc_msgSend(a2, "keyList")) & 1) == 0)
      objc_msgSend(a2, "setThemeScale:", v4);
  }
  return objc_msgSend(v12, "renditionWithKey:", objc_msgSend(a2, "keyList"));
}

- (id)_renditionForSpecificKey:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = objc_msgSend(a3, "copy");
  v5 = -[CUIThemeFacet _themeStore](self, "_themeStore");
  if ((uint64_t)objc_msgSend(v4, "themeScale") >= 2
    && (objc_msgSend(v5, "canGetRenditionWithKey:", objc_msgSend(v4, "keyList")) & 1) == 0)
  {
    objc_msgSend(v4, "setThemeScale:", 1);
  }
  v6 = objc_msgSend(v5, "renditionWithKey:", objc_msgSend(v4, "keyList"));

  return v6;
}

- (id)_rendition
{
  CUIRenditionKey *v3;
  id v4;

  v3 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
  v4 = -[CUIThemeFacet _renditionForSpecificKey:](self, "_renditionForSpecificKey:", v3);

  return v4;
}

- (CGSize)_thumbnailSizeForRendition:(id)a3
{
  char *v4;
  char *v5;
  double v6;
  double width;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  double v16;
  CGSize result;

  v4 = (char *)objc_msgSend(a3, "type");
  if ((unint64_t)(v4 - 1) > 2)
  {
    width = NSZeroSize.width;
    height = NSZeroSize.height;
  }
  else
  {
    v5 = v4;
    objc_msgSend(objc_msgSend(a3, "imageForSliceIndex:", 0), "size");
    width = v6;
    v9 = v8;
    if (v5 == (char *)3)
      v10 = 8;
    else
      v10 = 2;
    objc_msgSend(objc_msgSend(a3, "imageForSliceIndex:", v10), "size");
    v13 = v9 + v12;
    if (v5 == (char *)2)
    {
      height = v13 + 30.0;
    }
    else
    {
      v14 = width + v11 + 30.0;
      height = v13 + 30.0;
      if (v5 == (char *)1)
        height = v9;
      width = v14;
    }
  }
  v16 = width;
  result.height = height;
  result.width = v16;
  return result;
}

- (void)_setHasCheckedButtonGlyph:(BOOL)a3
{
  *(_WORD *)&self->_fFlags = *(_WORD *)&self->_fFlags & 0xFFFE | a3;
}

- (void)_setIsButtonGlyph:(BOOL)a3
{
  *(_WORD *)&self->_fFlags |= 3u;
}

- (BOOL)_isButtonGlyph
{
  $E9F57C97F2D6EAA6A8442301CBF94B81 fFlags;

  fFlags = self->_fFlags;
  if ((*(_BYTE *)&fFlags & 1) == 0)
  {
    fFlags = ($E9F57C97F2D6EAA6A8442301CBF94B81)(*(_DWORD *)&fFlags | 1);
    *(_WORD *)&self->_fFlags = fFlags;
  }
  return (*(unsigned int *)&fFlags >> 1) & 1;
}

- (CUIImage)_imageForRenditionFromKey:(int)a3 withSize:(CGFloat)a4 isMask:(CGFloat)a5
{
  CUIImage *v5;
  id v10;
  unint64_t v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  double v25;
  double v26;
  double v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  _BOOL4 v37;
  double v38;
  double v39;
  CGFloat v40;
  _BOOL4 v41;
  _BOOL4 v42;
  double v43;
  double v44;
  CGFloat v45;
  NSMutableData *v46;
  CGColorSpace *SRGB;
  uint32_t v48;
  CGContext *v49;
  CGImage *Image;
  size_t Width;
  size_t Height;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  BOOL ShouldInterpolate;
  CGImage *v58;
  CGFloat decode[3];
  NSSize v61;
  NSSize v62;

  v5 = a1;
  if (a1)
  {
    v10 = -[CUIImage _renditionForSpecificKey:](a1, "_renditionForSpecificKey:", a2);
    v11 = (unint64_t)objc_msgSend(v10, "type");
    v12 = objc_msgSend(v10, "metrics");
    v13 = v12;
    v14 = 25.0;
    v15 = 25.0;
    v16 = 25.0;
    if (v11 != 6)
      objc_msgSend(v12, "imageSize", 25.0, 25.0);
    if (v10)
      v17 = v16;
    else
      v17 = 25.0;
    if (v10)
      v14 = v15;
    v18 = (double)(uint64_t)objc_msgSend(a2, "themeScale");
    objc_msgSend(v13, "scale");
    v20 = v14 * (v18 / v19);
    v21 = (double)(uint64_t)objc_msgSend(a2, "themeScale");
    objc_msgSend(v13, "scale");
    v23 = v17 * (v21 / v22);
    v62.width = NSZeroSize.width;
    v62.height = NSZeroSize.height;
    v61.width = a4;
    v61.height = a5;
    v24 = NSEqualSizes(v61, v62);
    if (v24)
      v25 = v23;
    else
      v25 = a5;
    if (v24)
      v26 = v20;
    else
      v26 = a4;
    v27 = floor(v25);
    if (v26 != floor(v26) || v25 != v27)
    {
      v29 = objc_msgSend(-[CUIImage _themeStore](v5, "_themeStore"), "debugDescriptionForKeyList:", objc_msgSend(a2, "keyList"));
      _CUILog(4, (uint64_t)"WARNING: Image size requires rounding, might be off by a pixel. Pass integral sizes and rects to CUIThemeFacet methods. %@", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
      v26 = round(v26);
      v25 = round(v25);
    }
    v36 = (v11 & 0xFFFFFFFFFFFFFFFDLL) == 0;
    v37 = v20 != v26;
    v38 = round((v26 - v20) * 0.5);
    if (!v36 || !v37)
      v38 = -0.0;
    v39 = NSZeroPoint.x + v38;
    if (v36 && v37)
      v40 = v20;
    else
      v40 = v26;
    v41 = v11 < 2;
    v42 = v23 != v25;
    v43 = round((v25 - v23) * 0.5);
    if (!v41 || !v42)
      v43 = -0.0;
    v44 = NSZeroPoint.y + v43;
    if (v41 && v42)
      v45 = v23;
    else
      v45 = v25;
    v46 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", (unint64_t)(v25 * v26 * 32.0 + 32.0));
    SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
    if (a3)
      v48 = 2;
    else
      v48 = 8194;
    v49 = CGBitmapContextCreate(-[NSMutableData bytes](v46, "bytes"), (unint64_t)v26, (unint64_t)v25, 8uLL, vcvtd_n_u64_f64(v26, 2uLL), SRGB, v48);
    if ((a3 & 1) != 0)
    {
      -[CUIThemeFacet _drawAsMaskSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:]((uint64_t *)v5, a2, v49, kCGBlendModeNormal, 0, 0, v39, v44, v40, v45, 1.0);
      Image = CGBitmapContextCreateImage(v49);
      *(_OWORD *)decode = xmmword_19EC72B00;
      Width = CGImageGetWidth(Image);
      Height = CGImageGetHeight(Image);
      BitsPerComponent = CGImageGetBitsPerComponent(Image);
      BitsPerPixel = CGImageGetBitsPerPixel(Image);
      BytesPerRow = CGImageGetBytesPerRow(Image);
      DataProvider = CGImageGetDataProvider(Image);
      ShouldInterpolate = CGImageGetShouldInterpolate(Image);
      v58 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, decode, ShouldInterpolate);
      CGImageRelease(Image);
    }
    else
    {
      -[CUIImage _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:](v5, "_drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:", a2, v49, 0, 0, 0, 0, v39, v44, v40, v45, 1.0);
      v58 = CGBitmapContextCreateImage(v49);
    }
    v5 = +[CUIImage imageWithCGImage:](CUIImage, "imageWithCGImage:", v58);
    CGContextRelease(v49);
    CGImageRelease(v58);
  }
  return v5;
}

- (void)_drawAsMaskSpecificRenditionKey:(CGContext *)a3 inFrame:(CGBlendMode)a4 context:(int)a5 alpha:(uint64_t)a6 operation:(CGFloat)a7 isFocused:(CGFloat)a8 focusRingColor:(CGFloat)a9
{
  id v22;
  void *v23;
  char *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (a1)
  {
    v22 = objc_msgSend(a1, "renditionForSpecificKeyWrapper:", a2);
    if (a11 >= 0.00000011920929)
    {
      v23 = v22;
      v24 = (char *)objc_msgSend(v22, "type");
      if ((unint64_t)(v24 - 1) > 1)
      {
        if (v24)
        {
          if (v24 == (char *)3)
          {
            DrawNinePartMaskFromRenditionWithOperation(a7, a8, a9, a10, a11, (double)(uint64_t)objc_msgSend(a2, "themeScale"), a1[2], v23, a3, a5, a6, a4);
          }
          else
          {
            v25 = +[CUIThemeRendition displayNameForRenditionType:](CUIThemeRendition, "displayNameForRenditionType:", objc_msgSend(v23, "type"));
            objc_msgSend(objc_msgSend(a1, "_themeStore"), "debugDescriptionForKeyList:", objc_msgSend(a2, "keyList"));
            _CUILog(4, (uint64_t)"ERROR: CUIThemeFacet needs code to draw a mask from %@ rendition %@", v26, v27, v28, v29, v30, v31, (uint64_t)v25);
          }
        }
        else
        {
          DrawOnePartMaskFromRenditionWithOperation(a7, a8, a9, a10, a11, a1[2], v23, a3, a5, a6, a4, 0);
        }
      }
      else
      {
        DrawThreePartMaskFromRenditionWithOperation(a7, a8, a9, a10, a11, (double)(uint64_t)objc_msgSend(a2, "themeScale"), a1[2], v23, a3, a5, a6, a4);
      }
    }
  }
}

+ (unint64_t)themeForBundleIdentifier:(id)a3 error:(id *)a4
{
  return (unint64_t)objc_msgSend(a1, "themeNamed:forBundleIdentifier:error:", 0, a3, a4);
}

+ (unint64_t)themeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  NSError *v14;
  _QWORD v16[9];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  do
  {
    v8 = __ldxr(&RunTimeThemeRefForBytes___counter);
    v9 = v8 + 1;
  }
  while (__stxr(v9, &RunTimeThemeRefForBytes___counter));
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __RunTimeThemeRefForBytes_block_invoke;
  v16[3] = &unk_1E41AB788;
  v16[4] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p:%lu:%lld"), a3, a4, v9);
  v16[5] = &v23;
  v16[7] = a3;
  v16[8] = a4;
  v16[6] = &v17;
  PerformBlockWithThemeRefCache((uint64_t)v16);
  v10 = v24[3];
  v11 = (void *)v18[5];
  if (!v11)
    goto LABEL_6;
  if (!v10)
  {

LABEL_6:
    v12 = &stru_1E41B97C0;
    goto LABEL_7;
  }
  v12 = v11;
LABEL_7:
  v13 = v24[3];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  if (!v13)
  {
    v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v12, NSLocalizedDescriptionKey, 0));
    v10 = 0;
    if (a5)
      *a5 = v14;
  }
  return v10;
}

+ (void)themeUnregisterThemeRef:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __41__CUIThemeFacet_themeUnregisterThemeRef___block_invoke;
  v3[3] = &__block_descriptor_40_e29_v16__0__NSMutableDictionary_8l;
  v3[4] = a3;
  PerformBlockWithThemeRefCache((uint64_t)v3);
}

void __41__CUIThemeFacet_themeUnregisterThemeRef___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(a2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(a2, "objectForKey:", v8), "unsignedIntegerValue") == *(id *)(a1 + 32))
        {
          v9 = v8;
          if (v9)
          {
            v10 = v9;
            objc_msgSend(a2, "removeObjectForKey:", v9);

          }
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:
  _UnRegisterThemeRef(*(_QWORD *)(a1 + 32));
}

+ (id)_bundleIdentifierForThemeRef:(unint64_t)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __46__CUIThemeFacet__bundleIdentifierForThemeRef___block_invoke;
  v5[3] = &unk_1E41AB710;
  v5[4] = &v6;
  v5[5] = a3;
  PerformBlockWithThemeRefCache((uint64_t)v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __46__CUIThemeFacet__bundleIdentifierForThemeRef___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __46__CUIThemeFacet__bundleIdentifierForThemeRef___block_invoke_2;
  v4[3] = &unk_1E41AB6E8;
  v2 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v2;
  return objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

id __46__CUIThemeFacet__bundleIdentifierForThemeRef___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id result;

  result = objc_msgSend(a3, "unsignedIntegerValue");
  if (result == *(id *)(a1 + 40))
  {
    result = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

+ (id)facetWithElement:(int64_t)a3 part:(int64_t)a4 fromTheme:(unint64_t)a5
{
  return objc_msgSend(a1, "facetWithElement:part:dimension1:dimension2:fromTheme:", a3, a4, 0, 0, a5);
}

+ (id)facetWithElement:(int64_t)a3 part:(int64_t)a4 dimension1:(int64_t)a5 dimension2:(int64_t)a6 fromTheme:(unint64_t)a7
{
  unsigned __int16 v8;
  unsigned __int16 v9;
  unsigned __int16 v10;
  _QWORD v13[2];
  int v14;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v13[0] = 0;
  v13[1] = 0;
  v14 = 0;
  CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v13, 1, (unsigned __int16)a3, 5u);
  CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v13, 2, v10, 5u);
  CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v13, 8, v9, 5u);
  CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v13, 9, v8, 5u);
  return objc_msgSend(a1, "_facetWithKeyList:andRenditionKeyClass:orRenditionKey:fromTheme:", v13, 0, 0, a7);
}

+ (id)facetWithRenditionKey:(id)a3 fromTheme:(unint64_t)a4
{
  return objc_msgSend(a1, "_facetWithKeyList:andRenditionKeyClass:orRenditionKey:fromTheme:", 0, 0, a3, a4);
}

+ (id)_facetWithKeyList:(const _renditionkeytoken *)a3 andRenditionKeyClass:(Class)a4 orRenditionKey:(id)a5 fromTheme:(unint64_t)a6
{
  id v7;
  _CUIThemeFacetCacheKey *v11;
  const _renditionkeytoken *v12;
  _CUIThemeFacetCacheKey *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  objc_class *v19;
  id v20;

  v7 = a5;
  if ((unint64_t)a3 | (unint64_t)a5)
  {
    v11 = [_CUIThemeFacetCacheKey alloc];
    v12 = a3;
    if (a3)
      goto LABEL_4;
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CUIThemeFacet.m"), 794, CFSTR("improper arguments"));
    v11 = [_CUIThemeFacetCacheKey alloc];
  }
  v12 = (const _renditionkeytoken *)objc_msgSend(v7, "keyList", v12);
LABEL_4:
  v13 = -[_CUIThemeFacetCacheKey initWithKeyList:themeIndex:](v11, "initWithKeyList:themeIndex:", v12, a6);
  os_unfair_lock_lock((os_unfair_lock_t)&facetCacheMutex);
  if (FacetCache_pred != -1)
    dispatch_once(&FacetCache_pred, &__block_literal_global_309);
  v14 = (void *)FacetCache_facetCache;
  if (RecentlyUsedFacetCacheKeys_pred != -1)
    dispatch_once(&RecentlyUsedFacetCacheKeys_pred, &__block_literal_global_310);
  v15 = (void *)RecentlyUsedFacetCacheKeys_facetCacheKeys;
  v16 = objc_msgSend((id)RecentlyUsedFacetCacheKeys_facetCacheKeys, "indexOfObject:", v13);
  if (v16 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v7)
    {
      v17 = 0;
    }
    else
    {
      if (a4)
        v19 = a4;
      else
        v19 = (objc_class *)CUIRenditionKey;
      v7 = objc_msgSend([v19 alloc], "initWithKeyList:", a3);
      v17 = v7;
    }
    v18 = objc_msgSend(objc_alloc((Class)a1), "initWithRenditionKey:fromTheme:", v7, a6);

    if (_facetWithKeyList_andRenditionKeyClass_orRenditionKey_fromTheme__isFacetCacheAtLimit == 1)
    {
      objc_msgSend(v14, "removeObjectForKey:", objc_msgSend(v15, "objectAtIndex:", 0));
      objc_msgSend(v15, "removeObjectAtIndex:", 0);
    }
    else if (++_facetWithKeyList_andRenditionKeyClass_orRenditionKey_fromTheme__facetCacheCount == 20)
    {
      _facetWithKeyList_andRenditionKeyClass_orRenditionKey_fromTheme__isFacetCacheAtLimit = 1;
    }
    objc_msgSend(v15, "addObject:", v13);
    objc_msgSend(v14, "setObject:forKey:", v18, v13);
    v20 = v18;
  }
  else
  {
    objc_msgSend(v15, "removeObjectAtIndex:", v16);
    objc_msgSend(v15, "addObject:", v13);
    v18 = objc_msgSend(v14, "objectForKey:", v13);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&facetCacheMutex);

  return v18;
}

+ (id)cursorFacetWithName:(id)a3 fromTheme:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id result;
  __int128 v15;

  v15 = 0uLL;
  v7 = objc_msgSend(objc_msgSend(a1, "_themeStoreForThemeIndex:", a4), "renditionKeyForName:cursorHotSpot:", a3, &v15);
  if (*(double *)&v15 < 0.0 || *((double *)&v15 + 1) < 0.0)
  {
    _CUILog(4, (uint64_t)"+[CUIThemeFacet cursorFacetWithName:fromTheme:] - Facet named %@ is not a cursor facet.", v8, v9, v10, v11, v12, v13, (uint64_t)a3);
    return 0;
  }
  else
  {
    result = objc_msgSend(a1, "_facetWithKeyList:andRenditionKeyClass:orRenditionKey:fromTheme:", v7, 0, 0, a4, *((double *)&v15 + 1));
    *((_OWORD *)result + 3) = v15;
  }
  return result;
}

- (__n128)_initWithRenditionKey:(uint64_t)a1
{
  _WORD *v3;
  unsigned int v4;
  unsigned __int16 v5;
  void *v6;
  __n128 result;

  if (a1)
  {
    v3 = objc_msgSend(a2, "keyList");
    v4 = CUIRenditionKeyTokenCount((uint64_t)v3);
    v5 = v4 + 1;
    v6 = malloc_type_calloc(v4 + 1, 4uLL, 0x100004052888210uLL);
    *(_QWORD *)(a1 + 8) = v6;
    CUIRenditionKeyCopy(v6, v3, v5);
    *(_QWORD *)(a1 + 24) = -1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(__n128 *)(a1 + 40) = result;
    *(_QWORD *)(a1 + 56) = 0xBFF0000000000000;
    *(_DWORD *)(a1 + 64) = -1;
  }
  return result;
}

- (CUIThemeFacet)initWithRenditionKey:(id)a3 fromTheme:(unint64_t)a4
{
  CUIThemeFacet *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUIThemeFacet;
  v7 = -[CUIThemeFacet init](&v9, sel_init);
  if (v7)
  {
    if (!a3)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("CUIThemeFacet.m"), 891, CFSTR("Facet must be initialized with non-nil rendition key"));
    v7->_themeIndex = a4;
    -[CUIThemeFacet _initWithRenditionKey:]((uint64_t)v7, a3);
  }
  return v7;
}

- (CUIThemeFacet)init
{
  CUIRenditionKey *v3;
  uint64_t v4;
  CUIRenditionKey *v5;
  CUIThemeFacet *v6;

  v3 = [CUIRenditionKey alloc];
  v5 = -[CUIRenditionKey initWithKeyList:](v3, "initWithKeyList:", objc_msgSend(CUIPlaceHolderRendition((uint64_t)v3, v4), "key"));
  v6 = -[CUIThemeFacet initWithRenditionKey:fromTheme:](self, "initWithRenditionKey:fromTheme:", v5, 0);

  return v6;
}

- (CUIThemeFacet)initWithCoder:(id)a3
{
  CUIThemeFacet *v4;
  id v5;
  unint64_t v6;
  unsigned int v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUIThemeFacet;
  v4 = -[CUIThemeFacet init](&v9, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "allowsKeyedCoding"))
    {
      v5 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("CUIThemeFacetRenditionKey"));
      v6 = (unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("CUIThemeFacetThemeIndex"));
    }
    else
    {
      v5 = objc_msgSend(a3, "decodeObject");
      v8 = 0;
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v8, 4);
      v6 = v8;
    }
    v4->_themeIndex = v6;
    -[CUIThemeFacet _initWithRenditionKey:]((uint64_t)v4, v5);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  CUIRenditionKey *v5;
  int themeIndex;

  v5 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIThemeFacet version](CUIThemeFacet, "version"), CFSTR("CUIThemeFacetVersion"));
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("CUIThemeFacetRenditionKey"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_themeIndex, CFSTR("CUIThemeFacetThemeIndex"));
  }
  else
  {
    objc_msgSend(a3, "encodeObject:", v5);
    themeIndex = self->_themeIndex;
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &themeIndex);
  }

}

- (void)dealloc
{
  objc_super v3;

  free(self->_renditionKeyList);
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeFacet;
  -[CUIThemeFacet dealloc](&v3, sel_dealloc);
}

+ (BOOL)assetExistsForRenditionKey:(id)a3 fromTheme:(unint64_t)a4
{
  CUIRenditionKey *v6;
  id v7;
  unsigned __int8 v8;

  v6 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a3, "keyList"));
  v7 = objc_msgSend(a1, "_themeStoreForThemeIndex:", a4);
  if ((objc_msgSend(v7, "canGetRenditionWithKey:", -[CUIRenditionKey keyList](v6, "keyList")) & 1) != 0)
  {
    v8 = 1;
  }
  else if (-[CUIRenditionKey themeScale](v6, "themeScale") < 1)
  {
    v8 = 0;
  }
  else
  {
    -[CUIRenditionKey setThemeScale:](v6, "setThemeScale:", 1);
    v8 = objc_msgSend(v7, "canGetRenditionWithKey:", -[CUIRenditionKey keyList](v6, "keyList"));
  }

  return v8;
}

- (CGImage)copyLayerImageContentsAndCenter:(CGRect *)a3 renditionKey:(id)a4
{
  CUIRenditionKey *v6;
  CUIRenditionKey *v7;
  id v8;
  CGImage *v9;
  CGImage *v10;
  id v11;
  double Width;
  double Height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  if (a4)
    v6 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a4, "keyList"));
  else
    v6 = objc_alloc_init(CUIRenditionKey);
  v7 = v6;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v6);
  v8 = -[CUIThemeFacet _renditionForSpecificKey:](self, "_renditionForSpecificKey:", v7);
  if ((unint64_t)objc_msgSend(v8, "type") > 3)
  {
    v10 = 0;
  }
  else
  {
    v9 = (CGImage *)objc_msgSend(v8, "unslicedImage");
    v10 = v9;
    if (v9)
    {
      CGImageRetain(v9);
      v11 = objc_msgSend(v8, "sliceInformation");
      Width = (double)CGImageGetWidth(v10);
      Height = (double)CGImageGetHeight(v10);
      objc_msgSend(v11, "destinationRect");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v11, "positionOfSliceBoundary:", 0);
      v23 = v22 + v15;
      v24 = v15 + v19;
      objc_msgSend(v11, "positionOfSliceBoundary:", 2);
      v26 = v25;
      objc_msgSend(v11, "positionOfSliceBoundary:", 1);
      v28 = v17 + v27;
      objc_msgSend(v11, "positionOfSliceBoundary:", 3);
      a3->origin.x = v23 / Width;
      a3->origin.y = v28 / Height;
      a3->size.width = (Width - v23 + v26 - v24) / Width;
      a3->size.height = (Height - v28 + v29 - (v17 + v21)) / Height;
    }
  }

  return v10;
}

- (CGImage)copyLayerImageContentsAndCenter:(CGRect *)a3
{
  return -[CUIThemeFacet copyLayerImageContentsAndCenter:renditionKey:](self, "copyLayerImageContentsAndCenter:renditionKey:", a3, 0);
}

- (id)_makeLayerFromCAPackageData
{
  id v1;
  id v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  if (result)
  {
    v1 = objc_msgSend(result, "_rendition");
    if (objc_msgSend(v1, "type") == (id)1000
      && (v2 = objc_msgSend(v1, "utiType"),
          v3 = kCAPackageTypeArchive,
          objc_msgSend(v2, "isEqualToString:", kCAPackageTypeArchive)))
    {
      v5 = 0;
      result = -[CAPackage rootLayer](+[CAPackage packageWithData:type:options:error:](CAPackage, "packageWithData:type:options:error:", objc_msgSend(v1, "data"), v3, 0, &v5), "rootLayer");
      if (v5)
        v4 = 1;
      else
        v4 = result == 0;
      if (v4)
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)makeLayer
{
  id v2;
  id *v3;

  v2 = objc_msgSend(-[CUIThemeFacet _rendition](self, "_rendition"), "type");
  v3 = (id *)CAGradientLayer_ptr;
  if (v2 != (id)6)
    v3 = (id *)CALayer_ptr;
  return objc_msgSend(*v3, "layer");
}

- (void)updateLayer:(id)a3
{
  -[CUIThemeFacet updateLayer:effects:](self, "updateLayer:effects:", a3, 0);
}

- (void)updateLayer:(id)a3 effects:(id)a4
{
  id v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  const CAGradientLayerType *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGImage *v28;
  CUIImage *v29;
  const __CFString *v30;
  id LayerFromCAPackage;
  void *v32;
  CGImage *v33;
  unsigned int v34;
  CGImage *v35;
  _QWORD *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double Width;
  double v45;
  double v46;
  double Height;
  double v48;
  CGImage *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  unint64_t v59;
  double v60;
  CAKeyframeAnimation *v61;
  NSMutableArray *v62;
  NSMutableArray *v63;
  unint64_t i;
  CGContext *ARGBBitmapContext;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  CGContext *v72;
  CGImageRef Image;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  long double v77;
  double v78;
  double v79;

  v7 = -[CUIThemeFacet _rendition](self, "_rendition");
  objc_msgSend(v7, "opacity");
  *(float *)&v8 = v8;
  objc_msgSend(a3, "setOpacity:", v8);
  if (objc_msgSend(v7, "type") == (id)6)
  {
    v10 = objc_opt_class(CAGradientLayer, v9);
    if ((objc_opt_isKindOfClass(a3, v10) & 1) != 0)
    {
      v76 = 0;
      v77 = 0.0;
      v11 = -[CUIThemeFacet gradientWithKeyAdjustment:angle:style:](self, "gradientWithKeyAdjustment:angle:style:", 0, &v77, &v76);
      if (!v11)
        return;
      v12 = v11;
      objc_msgSend(a3, "bounds");
      v14 = v13;
      v16 = v15;
      v74 = 0uLL;
      v78 = 0.0;
      v79 = 0.0;
      FrameIntersectionWithAxis((double *)&v74, &v78, v17, v18, v13, v15, v77);
      v19 = *(double *)&v74 / v14;
      v20 = 1.0 - *((double *)&v74 + 1) / v16;
      v21 = 1.0 - v79 / v16;
      v22 = v78 / v14;
      objc_msgSend(a3, "setStartPoint:", v19, v20);
      objc_msgSend(a3, "setEndPoint:", v22, v21);
      if (v76 == 1282306592)
      {
        v23 = &kCAGradientLayerAxial;
      }
      else
      {
        if (v76 != 1382312992)
        {
LABEL_32:
          ARGBBitmapContext = CreateARGBBitmapContext(256.0, 1.0, 1.0);
          if (!ARGBBitmapContext)
          {
            _CUILog(4, (uint64_t)"CoreUI: Couldn't create CreateARGBBitmapContext() in -[CUIThemeFacet updateLayer:effects:]", v66, v67, v68, v69, v70, v71, v74);
            objc_msgSend(a3, "setColorMap:", 0);
            return;
          }
          v72 = ARGBBitmapContext;
          if (a4)
            v12 = objc_msgSend(v12, "gradientByApplyingEffects:", a4);
          objc_msgSend(v12, "drawInRect:angle:withContext:", v72, 0.0, 0.0, 256.0, 1.0, 0.0);
          Image = CGBitmapContextCreateImage(v72);
          CFRelease(v72);
          objc_msgSend(a3, "setColorMap:", Image);
          v49 = Image;
          goto LABEL_36;
        }
        v23 = &kCAGradientLayerRadial;
      }
      objc_msgSend(a3, "setType:", *v23);
      goto LABEL_32;
    }
  }
  if (objc_msgSend(v7, "type") == (id)8 && objc_msgSend(v7, "subtype") == 50)
  {
    objc_msgSend(v7, "scale");
    objc_msgSend(a3, "setContentsScale:");
    objc_msgSend(objc_msgSend(v7, "imageForSliceIndex:", 0), "size");
    v25 = v24;
    v27 = v26;
    v28 = (CGImage *)objc_msgSend(v7, "unslicedImage");
    if (a4)
    {
      objc_msgSend(v7, "scale");
      v28 = (CGImage *)objc_msgSend(a4, "newFlattenedImageFromShapeCGImage:withScale:", v28);
      v29 = +[CUIImage imageWithCGImage:](CUIImage, "imageWithCGImage:", v28);
      CGImageRelease(v28);
    }
    else
    {
      v29 = +[CUIImage imageWithCGImage:](CUIImage, "imageWithCGImage:", v28);
    }
    -[CUIImage size](v29, "size");
    v51 = v50;
    v53 = v52;
    objc_msgSend(v7, "scale");
    v55 = v25 / v54;
    objc_msgSend(v7, "scale");
    objc_msgSend(a3, "setFrame:", 0.0, 0.0, v55, v27 / v56);
    objc_msgSend(a3, "setContents:", v28);
    v57 = v25 / v51;
    v58 = v27 / v53;
    objc_msgSend(a3, "setContentsRect:", 0.0, 0.0, v25 / v51, v58);
    v59 = vcvtad_u64_f64(v51 / v25);
    v60 = (double)(unint64_t)round(v51 / v25);
    v61 = +[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("contentsRect"));
    -[CAKeyframeAnimation setCalculationMode:](v61, "setCalculationMode:", kCAAnimationDiscrete);
    -[CAKeyframeAnimation setDuration:](v61, "setDuration:", v60 * 0.0333333333);
    -[CAKeyframeAnimation setRemovedOnCompletion:](v61, "setRemovedOnCompletion:", 0);
    -[CAKeyframeAnimation setFillMode:](v61, "setFillMode:", kCAFillModeBoth);
    v62 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v59);
    v63 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v59);
    if (v59)
    {
      for (i = 0; i != v59; ++i)
      {
        -[NSMutableArray addObject:](v62, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)i / v60));
        -[NSMutableArray addObject:](v63, "addObject:", +[NSValue valueWithRect:](NSValue, "valueWithRect:", v57 * (double)i, 0.0, v57, v58));
      }
    }
    -[CAKeyframeAnimation setValues:](v61, "setValues:", v63);
    -[CAKeyframeAnimation setKeyTimes:](v61, "setKeyTimes:", v62);
    objc_msgSend(a3, "addAnimation:forKey:", v61, CFSTR("filmstrip animation"));
  }
  else
  {
    if (objc_msgSend(v7, "type") != (id)1000
      || (v30 = (const __CFString *)objc_msgSend(v7, "utiType"), !UTTypeConformsTo(v30, kCAPackageTypeArchive)))
    {
      v74 = xmmword_19EC72C98;
      v75 = unk_19EC72CA8;
      v33 = -[CUIThemeFacet copyLayerImageContentsAndCenter:](self, "copyLayerImageContentsAndCenter:", &v74);
      v34 = objc_msgSend(v7, "subtype");
      if (a4)
      {
        objc_msgSend(v7, "scale");
        v35 = (CGImage *)objc_msgSend(a4, "newFlattenedImageFromShapeCGImage:withScale:", v33);
        CGImageRelease(v33);
        v33 = v35;
      }
      objc_msgSend(a3, "setContents:", v33);
      objc_msgSend(a3, "setContentsCenter:", v74, v75);
      objc_msgSend(v7, "scale");
      objc_msgSend(a3, "setContentsScale:");
      if (v34 <= 0x1E && ((1 << v34) & 0x40900800) != 0)
        v36 = &kCAContentsScalingRepeat;
      else
        v36 = &kCAContentsScalingStretch;
      objc_msgSend(a3, "setContentsScaling:", *v36);
      -[CUIThemeFacet alpha](self, "alpha");
      *(float *)&v37 = v37;
      objc_msgSend(a3, "setOpacity:", v37);
      objc_msgSend(a3, "setCompositingFilter:", -[CUIThemeFacet blendModeAsCAFilterString](self, "blendModeAsCAFilterString"));
      objc_msgSend(a3, "frame");
      if (v39 == CGSizeZero.width && v38 == CGSizeZero.height)
      {
        objc_msgSend(a3, "frame");
        v41 = v40;
        v43 = v42;
        Width = (double)CGImageGetWidth(v33);
        objc_msgSend(v7, "scale");
        v46 = Width / v45;
        Height = (double)CGImageGetHeight(v33);
        objc_msgSend(v7, "scale");
        objc_msgSend(a3, "setFrame:", v41, v43, v46, Height / v48);
      }
      v49 = v33;
LABEL_36:
      CGImageRelease(v49);
      return;
    }
    LayerFromCAPackage = -[CUIThemeFacet _makeLayerFromCAPackageData](self);
    if (LayerFromCAPackage)
    {
      v32 = LayerFromCAPackage;
      objc_msgSend(objc_msgSend(a3, "sublayers"), "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
      objc_msgSend(a3, "bounds");
      objc_msgSend(v32, "setFrame:");
      objc_msgSend(a3, "addSublayer:", v32);
    }
  }
}

- (void)drawInFrame:(CGRect)a3 isFocused:(int)a4 context:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CUIRenditionKey *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
  -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:isFocused:focusRingColor:isFlipped:effects:](self, v11, a5, 0, 0, 0, 0, x, y, width, height);

}

- (void)_drawSpecificRenditionKey:(CGContext *)a3 inFrame:(uint64_t)a4 context:(uint64_t)a5 isFocused:(unsigned __int8)a6 focusRingColor:(void *)a7 isFlipped:(CGFloat)a8 effects:(CGFloat)a9
{
  id v22;
  double v23;

  if (a1)
  {
    v22 = objc_msgSend(a1, "renditionForSpecificKeyWrapper:", a2);
    objc_msgSend(v22, "opacity");
    -[CUIThemeFacet _drawSpecificRenditionKey:rendition:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:]((uint64_t *)a1, a2, v22, a3, (uint64_t)objc_msgSend(v22, "blendMode"), a4, a5, a6, a8, a9, a10, a11, v23, a7);
  }
}

- (void)drawInFrame:(CGRect)a3 isFocused:(int)a4 focusRingColor:(CGColor *)a5 context:(CGContext *)a6
{
  uint64_t v8;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CUIRenditionKey *v14;

  v8 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
  -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:isFocused:focusRingColor:isFlipped:effects:](self, v14, a6, v8, (uint64_t)a5, 0, 0, x, y, width, height);

}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7 effects:(id)a8
{
  uint64_t v11;
  uint64_t v12;

  v11 = *(_QWORD *)&a5;
  if (a4 >= 0.0)
    v12 = 0;
  else
    v12 = 20;
  -[CUIThemeFacet drawInFrame:alpha:operation:isFocused:focusRingColor:context:effects:](self, "drawInFrame:alpha:operation:isFocused:focusRingColor:context:effects:", v12, v11, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7
{
  uint64_t v9;
  uint64_t v10;

  v9 = *(_QWORD *)&a5;
  if (a4 >= 0.0)
    v10 = 0;
  else
    v10 = 20;
  -[CUIThemeFacet drawInFrame:alpha:operation:isFocused:focusRingColor:context:effects:](self, "drawInFrame:alpha:operation:isFocused:focusRingColor:context:effects:", v10, v9, a6, a7, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawInFrame:(CGRect)a3 isFocused:(int)a4 focusRingColor:(CGColor *)a5 context:(CGContext *)a6 effects:(id)a7
{
  uint64_t v10;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CUIRenditionKey *v16;

  v10 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
  -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:isFocused:focusRingColor:isFlipped:effects:](self, v16, a6, v10, (uint64_t)a5, 0, a7, x, y, width, height);

}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 isFocused:(int)a6 focusRingColor:(CGColor *)a7 context:(CGContext *)a8 effects:(id)a9
{
  uint64_t v12;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CUIRenditionKey *v20;

  v12 = *(_QWORD *)&a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
  -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:](self, v20, a8, a5, v12, (uint64_t)a7, 0, a9, x, y, width, height, a4);

}

- (void)_drawSpecificRenditionKey:(CGContext *)a3 inFrame:(unsigned int)a4 context:(uint64_t)a5 alpha:(uint64_t)a6 operation:(unsigned __int8)a7 isFocused:(void *)a8 focusRingColor:(CGFloat)a9 isFlipped:(CGFloat)a10 effects:(CGFloat)a11
{
  id v26;
  double v27;
  double v28;
  unsigned int v29;
  double v30;
  uint64_t v31;

  if (a1)
  {
    v26 = objc_msgSend(a1, "renditionForSpecificKeyWrapper:", a2);
    objc_msgSend(v26, "opacity");
    v28 = v27;
    v29 = objc_msgSend(v26, "blendMode");
    if (a13 == 1.0)
      v30 = v28;
    else
      v30 = a13;
    if (a4)
      v31 = a4;
    else
      v31 = v29;
    -[CUIThemeFacet _drawSpecificRenditionKey:rendition:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:]((uint64_t *)a1, a2, v26, a3, v31, a5, a6, a7, a9, a10, a11, a12, v30, a8);
  }
}

- (void)drawAsOnePartWithSlice:(int)a3 inFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7 effects:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  double v19;
  double v20;
  unsigned int v21;
  CGBlendMode v22;
  unint64_t themeIndex;
  double v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = -[CUIThemeFacet themeRendition](self, "themeRendition");
  objc_msgSend(v18, "opacity");
  v20 = v19;
  v21 = objc_msgSend(v18, "blendMode");
  if (v20 >= 0.00000011920929)
  {
    v22 = v21;
    themeIndex = self->_themeIndex;
    objc_msgSend(v18, "scale");
    DrawOnePartElementFromRenditionWithOperation(x, y, width, height, v20, v24, themeIndex, v18, a7, a5, (uint64_t)a6, v22, a3, a8);
  }
}

- (void)drawAbsoluteAnimationFrame:(double)a3 destinationFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  id v15;
  double v16;
  double v17;
  CGBlendMode v18;
  uint64_t v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = -[CUIThemeFacet themeRendition](self, "themeRendition");
  objc_msgSend(v15, "opacity");
  v17 = v16;
  v18 = objc_msgSend(v15, "blendMode");
  DrawAbsoluteAnimationFrameWithOperation(v15, a7, v18, a5, a3, x, y, width, height, v17, (uint64_t)a6, v19);
}

- (void)drawAnimationFrameMappedFrom0_1RangedValue:(double)a3 destinationFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7
{
  -[CUIThemeFacet drawAnimationFrameMappedFrom0_1RangedValue:destinationFrame:isFocused:focusRingColor:context:effects:](self, "drawAnimationFrameMappedFrom0_1RangedValue:destinationFrame:isFocused:focusRingColor:context:effects:", *(_QWORD *)&a5, a6, a7, 0, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)drawAnimationFrameMappedFrom0_1RangedValue:(double)a3 destinationFrame:(CGRect)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 context:(CGContext *)a7 effects:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  id v17;
  double v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = -[CUIThemeFacet themeRendition](self, "themeRendition");
  objc_msgSend(v17, "opacity");
  DrawAnimationFrameMappedFrom0_1RangedValue(v17, a7, (CGBlendMode)objc_msgSend(v17, "blendMode"), a5, a3, x, y, width, height, v18, (uint64_t)a6, a8);
}

- (void)drawSegmentInFrame:(CGRect)a3 isFocused:(int)a4 focusRingColor:(CGColor *)a5 segmentType:(int)a6 context:(CGContext *)a7 effects:(id)a8
{
  double height;
  double width;
  double y;
  CGFloat x;
  int v17;
  int v18;
  int v19;
  id v20;
  double v21;
  double v22;
  unsigned int v23;
  CGBlendMode v24;
  unint64_t themeIndex;
  double v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a6 - 1;
  if ((a6 - 1) > 2)
  {
    v18 = 0;
    v19 = 2;
  }
  else
  {
    v18 = dword_19EC72CB8[v17];
    v19 = dword_19EC72CC4[v17];
  }
  v20 = -[CUIThemeFacet themeRendition](self, "themeRendition");
  objc_msgSend(v20, "opacity");
  v22 = v21;
  v23 = objc_msgSend(v20, "blendMode");
  if (v22 >= 0.00000011920929)
  {
    v24 = v23;
    themeIndex = self->_themeIndex;
    objc_msgSend(v20, "scale");
    DrawThreePartElementFromRenditionWithOperation(x, y, width, height, v22, v26, themeIndex, v20, a7, a4, (uint64_t)a5, v24, v18, 1, v19, a8);
  }
}

- (void)updateSegmentBezelLeadingCapLayer:(id)a3 bezelFillLayer:(id)a4 trailingBezelCapLayer:(id)a5 forSegmentType:(int)a6 segmentBounds:(CGRect)a7 leadingSeparatorWidth:(double)a8 trailingSeparatorWidth:(double)a9 renditionKey:(id)a10 effects:(id)a11
{
  double height;
  double width;
  double y;
  double x;
  CUIRenditionKey *v23;
  id v24;
  double v25;
  double v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  id v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CUIRenditionKey *v45;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  if (a10)
    v23 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a10, "keyList"));
  else
    v23 = objc_alloc_init(CUIRenditionKey);
  v45 = v23;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v23);
  v24 = -[CUIThemeFacet _renditionForSpecificKey:](self, "_renditionForSpecificKey:", v45);
  objc_msgSend(v24, "scale");
  v26 = v25;
  v27 = a6 - 1;
  if ((a6 - 1) > 2)
  {
    v29 = 0;
    v28 = 2;
  }
  else
  {
    v28 = qword_19EC72CD0[v27];
    v29 = qword_19EC72CE8[v27];
  }
  v30 = objc_msgSend(v24, "imageForSliceIndex:", v29, *(_QWORD *)&a9);
  v31 = objc_msgSend(v24, "imageForSliceIndex:", 1);
  v32 = objc_msgSend(v24, "imageForSliceIndex:", v28);
  objc_msgSend(v30, "size");
  v34 = v33;
  objc_msgSend(v32, "size");
  v36 = v35;
  v37 = objc_msgSend(v30, "image");
  v38 = objc_msgSend(v31, "image");
  v39 = objc_msgSend(v32, "image");
  if (a11)
  {
    v37 = objc_msgSend(a11, "newFlattenedImageFromShapeCGImage:withScale:", v37, v26);
    v38 = objc_msgSend(a11, "newFlattenedImageFromShapeCGImage:withScale:", v38, v26);
    v39 = objc_msgSend(a11, "newFlattenedImageFromShapeCGImage:withScale:", v39, v26);
    CFAutorelease(v37);
    CFAutorelease(v38);
    CFAutorelease(v39);
  }
  v40 = v36 / v26;
  objc_msgSend(a3, "setContents:", v37);
  objc_msgSend(a4, "setContents:", v38);
  objc_msgSend(a5, "setContents:", v39);
  objc_msgSend(a3, "setContentsScale:", v26);
  objc_msgSend(a4, "setContentsScale:", v26);
  objc_msgSend(a5, "setContentsScale:", v26);
  v41 = x + a8;
  v42 = x + width - v40 - v44;
  v43 = v41 + v34 / v26;
  objc_msgSend(a3, "setFrame:");
  objc_msgSend(a5, "setFrame:", v42, y, v40, height);
  objc_msgSend(a4, "setFrame:", v43, y, v42 - v43, height);

}

- (void)drawInFrame:(CGRect)a3 owner:(id)a4 userInfo:(id)a5 context:(CGContext *)a6
{
  -[CUIThemeFacet drawInFrame:alpha:owner:userInfo:context:](self, "drawInFrame:alpha:owner:userInfo:context:", a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 1.0);
}

- (void)drawHighlightInFrame:(CGRect)a3 owner:(id)a4 userInfo:(id)a5 context:(CGContext *)a6
{
  -[CUIThemeFacet drawHighlightInFrame:alpha:owner:userInfo:context:](self, "drawHighlightInFrame:alpha:owner:userInfo:context:", a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 1.0);
}

- (void)drawMaskInFrame:(CGRect)a3 owner:(id)a4 userInfo:(id)a5 context:(CGContext *)a6
{
  -[CUIThemeFacet drawMaskInFrame:alpha:owner:userInfo:context:](self, "drawMaskInFrame:alpha:owner:userInfo:context:", a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 1.0);
}

- (BOOL)_canGetRenditionForKey:(id)a3 withDrawingLayer:(int64_t)a4
{
  objc_msgSend(a3, "setThemeLayer:", a4);
  objc_msgSend(a3, "setThemeState:", 0);
  return objc_msgSend(-[CUIThemeFacet _themeStore](self, "_themeStore"), "canGetRenditionWithKey:", objc_msgSend(a3, "keyList"));
}

- (BOOL)hitTestAtPoint:(CGPoint)a3 inFrame:(CGRect)a4 owner:(id)a5 userInfo:(id)a6
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v12;
  double v13;
  CUIRenditionKey *v15;
  BOOL v16;
  CUIImage *v17;
  CGImage *v18;
  size_t BytesPerRow;
  size_t v20;
  size_t v21;
  size_t v22;
  CGDataProvider *DataProvider;
  const __CFData *v24;
  const __CFData *v25;
  double v26;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3.y;
  v13 = a3.x;
  if (!NSPointInRect(a3, a4))
    return 0;
  v15 = objc_alloc_init(CUIRenditionKey);
  -[CUIThemeFacet _updateSpecificRenditionKey:isFocused:owner:userInfo:](self, "_updateSpecificRenditionKey:isFocused:owner:userInfo:", v15, 0, a5, a6);
  if (!-[CUIThemeFacet _canGetRenditionForKey:withDrawingLayer:](self, "_canGetRenditionForKey:withDrawingLayer:", v15, 4))-[CUIRenditionKey setThemeLayer:](v15, "setThemeLayer:", 0);
  v16 = 1;
  v17 = -[CUIThemeFacet _imageForRenditionFromKey:withSize:isMask:]((CUIImage *)self, v15, 1, width, height);
  if (v17)
  {
    v18 = -[CUIImage image](v17, "image");
    BytesPerRow = CGImageGetBytesPerRow(v18);
    v20 = CGImageGetHeight(v18);
    v21 = CGImageGetWidth(v18);
    if (v21)
    {
      v22 = v21;
      if (BytesPerRow / v21 == 4
        && (DataProvider = CGImageGetDataProvider(v18), (v24 = CGDataProviderCopyData(DataProvider)) != 0))
      {
        v25 = v24;
        v26 = v12 - y;
        v16 = *(_DWORD *)&CFDataGetBytePtr(v24)[4 * (uint64_t)rint(v13 - x) + 4 * (v20 + ~(uint64_t)rint(v26)) * v22] != 0;
        CFRelease(v25);
      }
      else
      {
        v16 = 1;
      }
    }
  }

  return v16;
}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7
{
  uint64_t v10;

  if (a4 >= 0.0)
    v10 = 0;
  else
    v10 = 20;
  -[CUIThemeFacet drawInFrame:alpha:operation:owner:userInfo:context:](self, "drawInFrame:alpha:operation:owner:userInfo:context:", v10, a5, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7
{
  uint64_t v10;

  if (a4 >= 0.0)
    v10 = 0;
  else
    v10 = 20;
  -[CUIThemeFacet drawHighlightInFrame:alpha:operation:owner:userInfo:context:](self, "drawHighlightInFrame:alpha:operation:owner:userInfo:context:", v10, a5, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawMaskInFrame:(CGRect)a3 alpha:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7
{
  CGFloat width;
  CGFloat height;
  CGFloat y;
  CGFloat x;
  CGBlendMode v16;
  CUIRenditionKey *v17;

  if (a3.size.height != 0.0)
  {
    width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      height = a3.size.height;
      y = a3.origin.y;
      x = a3.origin.x;
      v17 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
      -[CUIThemeFacet _updateSpecificRenditionKey:isFocused:owner:userInfo:](self, "_updateSpecificRenditionKey:isFocused:owner:userInfo:", v17, 0, a5, a6);
      if (a4 >= 0.0)
        v16 = kCGBlendModeNormal;
      else
        v16 = kCGBlendModeSourceAtop;
      -[CUIThemeFacet _drawMaskFromSpecificRenditionKey:inFrame:alpha:operation:isFocused:focusRingColor:context:](self, v17, v16, 0, 0, a7, x, y, width, height, a4);

    }
  }
}

- (void)_drawMaskFromSpecificRenditionKey:(CGBlendMode)a3 inFrame:(int)a4 alpha:(uint64_t)a5 operation:(CGContext *)a6 isFocused:(CGFloat)a7 focusRingColor:(CGFloat)a8 context:(CGFloat)a9
{
  if (a1)
  {
    if ((objc_msgSend(a1, "_canGetRenditionForKey:withDrawingLayer:", a2, 2) & 1) == 0)
      objc_msgSend(a2, "setThemeLayer:", 0);
    -[CUIThemeFacet _drawAsMaskSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:]((uint64_t *)a1, a2, a6, a3, a4, a5, a7, a8, a9, a10, a11);
  }
}

- (void)drawPulseInFrame:(CGRect)a3 pulseValue:(double)a4 owner:(id)a5 userInfo:(id)a6 context:(CGContext *)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double width;
  double height;
  double y;
  CGFloat x;
  CUIRenditionKey *v24;
  unint64_t themeIndex;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  if (a3.size.height != 0.0)
  {
    v32 = v14;
    v33 = v13;
    v34 = v12;
    v35 = v11;
    v36 = v10;
    v37 = v9;
    v38 = v7;
    v39 = v8;
    width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      height = a3.size.height;
      y = a3.origin.y;
      x = a3.origin.x;
      v31 = 0;
      v24 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
      -[CUIThemeFacet _updateSpecificRenditionKey:isFocused:owner:userInfo:](self, "_updateSpecificRenditionKey:isFocused:owner:userInfo:", v24, &v31, a5, a6);
      themeIndex = self->_themeIndex;
      LODWORD(a5) = v31;
      v26 = -[CUIRenditionKey themeScale](v24, "themeScale");
      DrawPulsedElementFromRenditionKey(themeIndex, v24, a7, (int)a5, x, y, width, height, a4, (double)v26, 0, v27, v28, v29, v30);

    }
  }
}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 owner:(id)a6 userInfo:(id)a7 context:(CGContext *)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGFloat width;
  CGFloat height;
  CGFloat y;
  CGFloat x;
  CUIRenditionKey *v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if (a3.size.height != 0.0)
  {
    v28 = v15;
    v29 = v14;
    v30 = v13;
    v31 = v12;
    v32 = v11;
    v33 = v10;
    v34 = v8;
    v35 = v9;
    width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      height = a3.size.height;
      y = a3.origin.y;
      x = a3.origin.x;
      v27 = 0;
      v26 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
      -[CUIThemeFacet _updateSpecificRenditionKey:isFocused:owner:userInfo:](self, "_updateSpecificRenditionKey:isFocused:owner:userInfo:", v26, &v27, a6, a7);
      -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:](self, v26, a8, a5, v27, 0, 0, 0, x, y, width, height, a4);

    }
  }
}

- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 owner:(id)a6 userInfo:(id)a7 context:(CGContext *)a8
{
  double width;
  uint64_t v12;
  double height;
  double y;
  double x;
  CUIRenditionKey *v18;

  if (a3.size.height != 0.0)
  {
    width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      v12 = *(_QWORD *)&a5;
      height = a3.size.height;
      y = a3.origin.y;
      x = a3.origin.x;
      v18 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
      -[CUIThemeFacet _updateSpecificRenditionKey:isFocused:owner:userInfo:](self, "_updateSpecificRenditionKey:isFocused:owner:userInfo:", v18, 0, a6, a7);
      -[CUIRenditionKey setThemeLayer:](v18, "setThemeLayer:", 1);
      -[CUIRenditionKey setThemeState:](v18, "setThemeState:", 0);
      -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:](self, "_drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:", v18, a8, v12, 0, 0, 0, x, y, width, height, a4);

    }
  }
}

- (void)drawGradientInFrame:(CGRect)a3 angle:(double)a4 alpha:(double)a5 operation:(int)a6 isFocused:(int)a7 focusRingColor:(CGColor *)a8 keyAdjustment:(id)a9 context:(CGContext *)a10 effects:(id)a11
{
  uint64_t v14;
  double height;
  double width;
  double y;
  double x;
  CUIRenditionKey *v24;
  id v25;
  int AllowsDithering;
  id v27;
  id v28;
  unsigned int v29;
  id v30;
  NSString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CUIRenditionKey *v38;
  CGRect v39;

  v14 = *(_QWORD *)&a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a9)
    v24 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a9, "keyList"));
  else
    v24 = objc_alloc_init(CUIRenditionKey);
  v38 = v24;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v24);
  v25 = -[CUIThemeFacet _renditionForSpecificKey:](self, "_renditionForSpecificKey:", v38);
  if (objc_msgSend(v25, "type") == (id)6)
  {
    CGContextSaveGState(a10);
    AllowsDithering = CGContextGetAllowsDithering(a10);
    if (a5 != 1.0)
      CGContextSetAlpha(a10, a5);
    if (a6)
      CGContextSetBlendMode(a10, (CGBlendMode)a6);
    v27 = objc_msgSend(v25, "gradient");
    v28 = v27;
    if (a11)
      v28 = objc_msgSend(v27, "gradientByApplyingEffects:", a11);
    v29 = objc_msgSend(v25, "gradientStyle");
    v30 = objc_msgSend(v28, "isDithered");
    if (AllowsDithering != (_DWORD)v30)
      CGContextSetAllowsDithering(a10, v30);
    switch(v29)
    {
      case 0x416E676Cu:
        objc_msgSend(v28, "drawAngleGradientInRect:relativeCenterPosition:withContext:", a10, x, y, width, height, x + width * 0.5, y + height * 0.5);
        break;
      case 0x52646C20u:
        objc_msgSend(v28, "drawRadialGradientInRect:relativeCenterPosition:withContext:", a10, x, y, width, height, x + width * 0.5, y + height * 0.5);
        if (!AllowsDithering)
        {
LABEL_23:
          CGContextRestoreGState(a10);
          if ((_DWORD)v14)
          {
            CUIStartFocusRingInternal();
            v39.origin.x = x;
            v39.origin.y = y;
            v39.size.width = width;
            v39.size.height = height;
            CGContextFillRect(a10, v39);
            CUIStartFocusRingInternal();
          }
          goto LABEL_25;
        }
LABEL_22:
        CGContextSetAllowsDithering(a10, 1);
        goto LABEL_23;
      case 0x4C6E7220u:
        objc_msgSend(v28, "drawInRect:angle:withContext:", a10, x, y, width, height, a4);
        if (!AllowsDithering)
          goto LABEL_23;
        goto LABEL_22;
    }
    if (!AllowsDithering)
      goto LABEL_23;
    goto LABEL_22;
  }
  if (v25)
  {
    v31 = NSStringFromSelector(a2);
    objc_msgSend(-[CUIThemeFacet _themeStore](self, "_themeStore"), "debugDescriptionForKeyList:", -[CUIRenditionKey keyList](v38, "keyList"));
    _CUILog(4, (uint64_t)"ERROR: %@ called on pixel-type rendition of %@ with key: %@\nIgnoring gradient angle information and applying regular rendition drawing", v32, v33, v34, v35, v36, v37, (uint64_t)v31);
    -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:](self, v38, a10, a6, v14, (uint64_t)a8, 0, a11, x, y, width, height, a5);
  }
LABEL_25:

}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 keyAdjustment:(id)a7 context:(CGContext *)a8
{
  uint64_t v11;
  uint64_t v12;

  v11 = *(_QWORD *)&a5;
  if (a4 >= 0.0)
    v12 = 0;
  else
    v12 = 20;
  -[CUIThemeFacet drawInFrame:alpha:operation:isFocused:focusRingColor:keyAdjustment:context:](self, "drawInFrame:alpha:operation:isFocused:focusRingColor:keyAdjustment:context:", v12, v11, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 isFocused:(int)a6 focusRingColor:(CGColor *)a7 keyAdjustment:(id)a8 context:(CGContext *)a9
{
  CGFloat width;
  uint64_t v12;
  CGFloat height;
  CGFloat y;
  CGFloat x;
  CUIRenditionKey *v19;
  CUIRenditionKey *v20;

  if (a3.size.height != 0.0)
  {
    width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      v12 = *(_QWORD *)&a6;
      height = a3.size.height;
      y = a3.origin.y;
      x = a3.origin.x;
      if (a8)
        v19 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a8, "keyList"));
      else
        v19 = objc_alloc_init(CUIRenditionKey);
      v20 = v19;
      -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v19);
      -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:focusRingColor:isFlipped:effects:](self, v20, a9, a5, v12, (uint64_t)a7, 0, 0, x, y, width, height, a4);

    }
  }
}

- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 keyAdjustment:(id)a5 context:(CGContext *)a6
{
  uint64_t v8;

  if (a4 >= 0.0)
    v8 = 0;
  else
    v8 = 20;
  -[CUIThemeFacet drawHighlightInFrame:alpha:operation:keyAdjustment:context:](self, "drawHighlightInFrame:alpha:operation:keyAdjustment:context:", v8, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawHighlightInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 keyAdjustment:(id)a6 context:(CGContext *)a7
{
  double width;
  uint64_t v9;
  double height;
  double y;
  double x;
  CUIRenditionKey *v15;
  CUIRenditionKey *v16;

  if (a3.size.height != 0.0)
  {
    width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      v9 = *(_QWORD *)&a5;
      height = a3.size.height;
      y = a3.origin.y;
      x = a3.origin.x;
      if (a6)
        v15 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a6, "keyList"));
      else
        v15 = objc_alloc_init(CUIRenditionKey);
      v16 = v15;
      -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v15);
      -[CUIRenditionKey setThemeLayer:](v16, "setThemeLayer:", 1);
      -[CUIRenditionKey setThemeState:](v16, "setThemeState:", 0);
      -[CUIThemeFacet _drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:](self, "_drawSpecificRenditionKey:inFrame:context:alpha:operation:isFocused:isFlipped:effects:", v16, a7, v9, 0, 0, 0, x, y, width, height, a4);

    }
  }
}

- (void)drawMaskInFrame:(CGRect)a3 alpha:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 keyAdjustment:(id)a7 context:(CGContext *)a8
{
  uint64_t v11;
  uint64_t v12;

  v11 = *(_QWORD *)&a5;
  if (a4 >= 0.0)
    v12 = 0;
  else
    v12 = 20;
  -[CUIThemeFacet drawMaskInFrame:alpha:operation:isFocused:focusRingColor:keyAdjustment:context:](self, "drawMaskInFrame:alpha:operation:isFocused:focusRingColor:keyAdjustment:context:", v12, v11, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawMaskInFrame:(CGRect)a3 alpha:(double)a4 operation:(int)a5 isFocused:(int)a6 focusRingColor:(CGColor *)a7 keyAdjustment:(id)a8 context:(CGContext *)a9
{
  CGFloat width;
  CGFloat height;
  CGFloat y;
  CGFloat x;
  CUIRenditionKey *v19;
  CUIRenditionKey *v20;

  if (a3.size.height != 0.0)
  {
    width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      height = a3.size.height;
      y = a3.origin.y;
      x = a3.origin.x;
      if (a8)
        v19 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a8, "keyList"));
      else
        v19 = objc_alloc_init(CUIRenditionKey);
      v20 = v19;
      -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v19);
      -[CUIThemeFacet _drawMaskFromSpecificRenditionKey:inFrame:alpha:operation:isFocused:focusRingColor:context:](self, v20, (CGBlendMode)a5, a6, (uint64_t)a7, a9, x, y, width, height, a4);

    }
  }
}

- (void)drawPulseInFrame:(CGRect)a3 pulseValue:(double)a4 isFocused:(int)a5 focusRingColor:(CGColor *)a6 keyAdjustment:(id)a7 context:(CGContext *)a8
{
  double width;
  double height;
  double y;
  CGFloat x;
  CUIRenditionKey *v17;
  unint64_t themeIndex;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CUIRenditionKey *v24;

  if (a3.size.height != 0.0)
  {
    width = a3.size.width;
    if (a3.size.width != 0.0)
    {
      height = a3.size.height;
      y = a3.origin.y;
      x = a3.origin.x;
      if (a7)
        v17 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a7, "keyList"));
      else
        v17 = objc_alloc_init(CUIRenditionKey);
      v24 = v17;
      -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v17);
      themeIndex = self->_themeIndex;
      v19 = -[CUIRenditionKey themeScale](v24, "themeScale");
      DrawPulsedElementFromRenditionKey(themeIndex, v24, a8, a5, x, y, width, height, a4, (double)v19, (uint64_t)a6, v20, v21, v22, v23);

    }
  }
}

- (void)_drawSpecificRenditionKey:(void *)a3 rendition:(CGContext *)a4 inFrame:(uint64_t)a5 context:(uint64_t)a6 alpha:(uint64_t)a7 operation:(unsigned __int8)a8 isFocused:(CGFloat)a9 focusRingColor:(CGFloat)a10 isFlipped:(CGFloat)a11 effects:(CGFloat)a12
{
  char *v28;
  long double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  if (a1 && a12 != 0.0 && a11 != 0.0 && a13 >= 0.00000011920929)
  {
    v28 = (char *)objc_msgSend(a3, "type");
    if ((unint64_t)(v28 - 1) > 1)
    {
      if (v28)
      {
        if (v28 == (char *)6)
        {
          objc_msgSend(a3, "gradientDrawingAngle");
          v30 = v29;
          v31 = fmod(v29, 360.0);
          if (v30 < 0.0)
            v31 = v31 + 360.0;
          if (((v31 > 0.0) & a8) != 0)
            v32 = 360.0 - v31;
          else
            v32 = v31;
          objc_msgSend(a1, "drawGradientInFrame:angle:alpha:operation:isFocused:focusRingColor:keyAdjustment:context:effects:", a5, a6, a7, a2, a4, a14, a9, a10, a11, a12, v32, a13);
        }
        else if (v28 == (char *)3)
        {
          DrawNinePartElementFromRenditionWithOperation(a9, a10, a11, a12, a13, (double)(uint64_t)objc_msgSend(a2, "themeScale"), a1[2], a3, a4, a6, a7, (CGBlendMode)a5, a14);
        }
        else
        {
          v33 = +[CUIThemeRendition displayNameForRenditionType:](CUIThemeRendition, "displayNameForRenditionType:", objc_msgSend(a3, "type"));
          objc_msgSend(objc_msgSend(a1, "_themeStore"), "debugDescriptionForKeyList:", objc_msgSend(a2, "keyList"));
          _CUILog(4, (uint64_t)"CUIThemeFacet needs code to draw %@ rendition %@", v34, v35, v36, v37, v38, v39, (uint64_t)v33);
        }
      }
      else
      {
        DrawOnePartElementFromRenditionWithOperation(a9, a10, a11, a12, a13, (double)(uint64_t)objc_msgSend(a2, "themeScale"), a1[2], a3, a4, a6, a7, (CGBlendMode)a5, 0, a14);
      }
    }
    else
    {
      DrawThreePartElementFromRenditionWithOperation(a9, a10, a11, a12, a13, (double)(uint64_t)objc_msgSend(a2, "themeScale"), a1[2], a3, a4, a6, a7, (CGBlendMode)a5, 0, 1, 2, a14);
    }
  }
}

- (void)_drawSlice:(int64_t)a3 inFrame:(CGRect)a4 withKeyAdjustment:(id)a5 context:(CGContext *)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CUIRenditionKey *v13;
  id v14;
  CUIRenditionKey *v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a5)
    v13 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a5, "keyList"));
  else
    v13 = objc_alloc_init(CUIRenditionKey);
  v15 = v13;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v13);
  v14 = -[CUIThemeFacet _renditionForSpecificKey:](self, "_renditionForSpecificKey:", v15);
  DrawThemeImageWithOperation(objc_msgSend(v14, "imageForSliceIndex:", -[CUIThemeFacet _sliceIndexForSlice:ofRendition:](self, "_sliceIndexForSlice:ofRendition:", a3, v14)), a6, kCGBlendModeNormal, 0, x, y, width, height, 1.0);

}

- (id)renditionMetricsWithKeyAdjustment:(id)a3
{
  CUIRenditionKey *v4;
  CUIRenditionKey *v5;
  id v6;

  if (a3)
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a3, "keyList"));
  else
    v4 = objc_alloc_init(CUIRenditionKey);
  v5 = v4;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v4);
  v6 = objc_msgSend(-[CUIThemeFacet _approximateRenditionForRenditionKey:](self, v5), "metrics");

  return v6;
}

- (id)renditionSliceInformationForRect:(CGRect)a3 keyAdjustment:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  CUIRenditionKey *v9;
  CUIRenditionKey *v10;
  id v11;
  CUIRenditionSliceInformation *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
    v9 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a4, "keyList"));
  else
    v9 = objc_alloc_init(CUIRenditionKey);
  v10 = v9;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v9);
  v11 = -[CUIThemeFacet _approximateRenditionForRenditionKey:](self, v10);
  if (objc_msgSend(v11, "type") == (id)6)
  {
    v12 = 0;
  }
  else
  {
    v12 = (CUIRenditionSliceInformation *)objc_msgSend(v11, "sliceInformation");
    if (v12)
      v12 = -[CUIRenditionSliceInformation initWithSliceInformation:destinationRect:]([CUIRenditionSliceInformation alloc], "initWithSliceInformation:destinationRect:", v12, x, y, width, height);
  }

  return v12;
}

- (id)imageForState:(int64_t)a3
{
  return -[CUIThemeFacet imageForState:value:](self, "imageForState:value:", a3, CUIRenditionKeyValueForAttribute(&self->_renditionKeyList->identifier, 6));
}

- (BOOL)hasValueSlices
{
  _OWORD v4[5];
  uint64_t v5;

  v5 = 0;
  memset(v4, 0, sizeof(v4));
  CUIRenditionKeyCopy(v4, &self->_renditionKeyList->identifier, 0x16u);
  CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 6, 1, 0x16u);
  return objc_msgSend(-[CUIThemeFacet _themeStore](self, "_themeStore"), "canGetRenditionWithKey:", v4);
}

- (_WORD)isValidButtonImageSourceForSize:(_WORD *)result
{
  _WORD **v3;
  id v4;
  _OWORD v5[5];
  uint64_t v6;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, "_themeStore");
    v6 = 0;
    memset(v5, 0, sizeof(v5));
    CUIRenditionKeyCopy(v5, v3[1], 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v5, 3, (unsigned __int16)a2, 0x16u);
    if ((objc_msgSend(v4, "canGetRenditionWithKey:", v5) & 1) == 0)
    {
      if (!a2
        || (CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v5, 3, 0, 0x16u),
            (objc_msgSend(v4, "canGetRenditionWithKey:", v5) & 1) == 0))
      {
        CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v5, 3, (unsigned __int16)a2, 0x16u);
      }
    }
    return (_WORD **)(objc_msgSend(objc_msgSend(v4, "renditionWithKey:", v5), "type") == 0);
  }
  return result;
}

- (BOOL)isValidButtonImageSource
{
  uint64_t v3;

  v3 = CUIRenditionKeyValueForAttribute(&self->_renditionKeyList->identifier, 3);
  return -[CUIThemeFacet isValidButtonImageSourceForSize:](self, v3);
}

- (id)imageForState:(int64_t)a3 value:(int64_t)a4
{
  return -[CUIThemeFacet imageForState:value:size:](self, "imageForState:value:size:", a3, a4, CUIRenditionKeyValueForAttribute(&self->_renditionKeyList->identifier, 3));
}

- (id)imageForState:(int64_t)a3 value:(int64_t)a4 size:(unint64_t)a5
{
  CUIRenditionKey *v9;
  id v10;

  if (!-[CUIThemeFacet isValidButtonImageSourceForSize:](self, a5))
    return 0;
  v9 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
  -[CUIRenditionKey setThemeState:](v9, "setThemeState:", a3);
  -[CUIRenditionKey setThemeValue:](v9, "setThemeValue:", a4);
  if (-[CUIRenditionKey themeSize](v9, "themeSize") != a5)
    -[CUIRenditionKey setThemeSize:](v9, "setThemeSize:", a5);
  v10 = objc_msgSend(-[CUIThemeFacet _approximateRenditionForRenditionKey:](self, v9), "imageForSliceIndex:", 0);

  return v10;
}

- (id)imageForSliceIndex:(int64_t)a3
{
  return objc_msgSend(-[CUIThemeFacet renditionForSpecificKeyWrapper:](self, "renditionForSpecificKeyWrapper:", -[CUIThemeFacet renditionKey](self, "renditionKey")), "imageForSliceIndex:", a3);
}

- (id)image
{
  return -[CUIThemeFacet imageForSliceIndex:](self, "imageForSliceIndex:", 0);
}

- (double)alphaWithKeyAdjustment:(id)a3
{
  CUIRenditionKey *v4;
  CUIRenditionKey *v5;
  id v6;
  double result;

  if (a3)
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a3, "keyList"));
  else
    v4 = objc_alloc_init(CUIRenditionKey);
  v5 = v4;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v4);
  v6 = -[CUIThemeFacet renditionForSpecificKeyWrapper:](self, "renditionForSpecificKeyWrapper:", v5);

  objc_msgSend(v6, "opacity");
  return result;
}

- (double)alpha
{
  double result;

  -[CUIThemeFacet alphaWithKeyAdjustment:](self, "alphaWithKeyAdjustment:", 0);
  return result;
}

- (int)blendModeWithKeyAdjustment:(id)a3
{
  CUIRenditionKey *v4;
  CUIRenditionKey *v5;
  id v6;

  if (a3)
    v4 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a3, "keyList"));
  else
    v4 = objc_alloc_init(CUIRenditionKey);
  v5 = v4;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v4);
  v6 = -[CUIThemeFacet renditionForSpecificKeyWrapper:](self, "renditionForSpecificKeyWrapper:", v5);

  return objc_msgSend(v6, "blendMode");
}

- (int)blendMode
{
  return -[CUIThemeFacet blendModeWithKeyAdjustment:](self, "blendModeWithKeyAdjustment:", 0);
}

- (id)blendModeAsCAFilterStringWithKeyAjustment:(id)a3
{
  unsigned int v3;
  id result;
  id *v5;

  v3 = -[CUIThemeFacet blendModeWithKeyAdjustment:](self, "blendModeWithKeyAdjustment:", a3);
  result = 0;
  switch(v3)
  {
    case 1u:
      v5 = (id *)&kCAFilterMultiplyBlendMode;
      goto LABEL_24;
    case 2u:
      v5 = (id *)&kCAFilterScreenBlendMode;
      goto LABEL_24;
    case 3u:
      v5 = (id *)&kCAFilterOverlayBlendMode;
      goto LABEL_24;
    case 4u:
      v5 = (id *)&kCAFilterDarkenBlendMode;
      goto LABEL_24;
    case 5u:
      v5 = (id *)&kCAFilterLightenBlendMode;
      goto LABEL_24;
    case 6u:
      v5 = (id *)&kCAFilterColorDodgeBlendMode;
      goto LABEL_24;
    case 7u:
      v5 = (id *)&kCAFilterColorBurnBlendMode;
      goto LABEL_24;
    case 8u:
      v5 = (id *)&kCAFilterSoftLightBlendMode;
      goto LABEL_24;
    case 9u:
      v5 = (id *)&kCAFilterHardLightBlendMode;
      goto LABEL_24;
    case 0xAu:
      v5 = (id *)&kCAFilterDifferenceBlendMode;
      goto LABEL_24;
    case 0xBu:
      v5 = (id *)&kCAFilterExclusionBlendMode;
      goto LABEL_24;
    case 0x10u:
      v5 = (id *)&kCAFilterClear;
      goto LABEL_24;
    case 0x11u:
      v5 = (id *)&kCAFilterCopy;
      goto LABEL_24;
    case 0x12u:
      v5 = (id *)&kCAFilterSourceIn;
      goto LABEL_24;
    case 0x13u:
      v5 = (id *)&kCAFilterSourceOut;
      goto LABEL_24;
    case 0x14u:
      v5 = (id *)&kCAFilterSourceAtop;
      goto LABEL_24;
    case 0x15u:
      v5 = (id *)&kCAFilterDestOver;
      goto LABEL_24;
    case 0x16u:
      v5 = (id *)&kCAFilterDestIn;
      goto LABEL_24;
    case 0x17u:
      v5 = (id *)&kCAFilterDestOut;
      goto LABEL_24;
    case 0x18u:
      v5 = (id *)&kCAFilterDestAtop;
      goto LABEL_24;
    case 0x19u:
      v5 = (id *)&kCAFilterXor;
      goto LABEL_24;
    case 0x1Bu:
      v5 = (id *)&kCAFilterPlusL;
LABEL_24:
      result = *v5;
      break;
    default:
      return result;
  }
  return result;
}

- (id)blendModeAsCAFilterString
{
  return -[CUIThemeFacet blendModeAsCAFilterStringWithKeyAjustment:](self, "blendModeAsCAFilterStringWithKeyAjustment:", 0);
}

- (CGSize)imageSize
{
  CUIRenditionKey *v3;
  id v4;
  CGFloat width;
  CGFloat height;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
  v4 = -[CUIThemeFacet _approximateRenditionForRenditionKey:](self, v3);
  if (objc_msgSend(v4, "type") == (id)6)
  {
    width = NSZeroSize.width;
    height = NSZeroSize.height;
  }
  else
  {
    v7 = objc_msgSend(v4, "metrics");
    if (v7)
      objc_msgSend(v7, "imageSize");
    else
      objc_msgSend(objc_msgSend(v4, "imageForSliceIndex:", 0), "size");
    width = v8;
    height = v9;
  }

  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeForSegmentOfType:(int)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  if ((id)-[CUIThemeFacet renditionType](self, "renditionType") == (id)5)
  {
    v5 = a3 - 1;
    if ((a3 - 1) > 2)
    {
      v7 = 0;
      v6 = 2;
    }
    else
    {
      v6 = qword_19EC72CD0[v5];
      v7 = qword_19EC72CE8[v5];
    }
    v10 = -[CUIThemeFacet imageForSliceIndex:](self, "imageForSliceIndex:", v7);
    v11 = -[CUIThemeFacet imageForSliceIndex:](self, "imageForSliceIndex:", 1);
    v12 = -[CUIThemeFacet imageForSliceIndex:](self, "imageForSliceIndex:", v6);
    objc_msgSend(v10, "size");
    v14 = v13;
    objc_msgSend(v11, "size");
    v16 = v14 + v15;
    objc_msgSend(v12, "size");
    v18 = v16 + v17;
    objc_msgSend(v10, "size");
    v20 = v19;
    objc_msgSend(v11, "size");
    if (v20 <= v21)
      v22 = v11;
    else
      v22 = v10;
    objc_msgSend(v22, "size");
    v24 = v23;
    objc_msgSend(v12, "size");
    if (v24 > v25)
    {
      objc_msgSend(v10, "size");
      v27 = v26;
      objc_msgSend(v11, "size");
      if (v27 <= v28)
        v12 = v11;
      else
        v12 = v10;
    }
    objc_msgSend(v12, "size");
    v8 = v18;
  }
  else
  {
    -[CUIThemeFacet imageSize](self, "imageSize");
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)gradientWithKeyAdjustment:(id)a3 angle:(double *)a4 style:(unint64_t *)a5
{
  CUIRenditionKey *v8;
  CUIRenditionKey *v9;
  id v10;
  id v11;
  uint64_t v12;

  if (a3)
    v8 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a3, "keyList"));
  else
    v8 = objc_alloc_init(CUIRenditionKey);
  v9 = v8;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v8);
  v10 = -[CUIThemeFacet _renditionForSpecificKey:](self, "_renditionForSpecificKey:", v9);
  if (objc_msgSend(v10, "type") == (id)6)
  {
    v11 = objc_msgSend(v10, "gradient");

    if (v11)
    {
      if (a4)
      {
        objc_msgSend(v10, "gradientDrawingAngle");
        *(_QWORD *)a4 = v12;
      }
      if (a5)
        *a5 = objc_msgSend(v10, "gradientStyle");
    }
  }
  else
  {

    return 0;
  }
  return v11;
}

- (void)_setThemeIndex:(unint64_t)a3
{
  self->_themeIndex = a3;
}

- (unint64_t)themeIndex
{
  return self->_themeIndex;
}

- (id)themeRendition
{
  CUIRenditionKey *v3;
  id v4;

  v3 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
  v4 = -[CUIThemeFacet renditionForSpecificKeyWrapper:](self, "renditionForSpecificKeyWrapper:", v3);

  return v4;
}

- (id)renditionKey
{
  return -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
}

- (int64_t)renditionType
{
  int64_t result;

  result = self->_renditionType;
  if (result < 0)
  {
    result = (int64_t)objc_msgSend(-[CUIThemeFacet _rendition](self, "_rendition"), "type");
    self->_renditionType = result;
  }
  return result;
}

- (BOOL)isTintable
{
  unsigned int isTintable;

  isTintable = self->_isTintable;
  if ((isTintable & 0x80000000) != 0)
  {
    isTintable = objc_msgSend(-[CUIThemeFacet _rendition](self, "_rendition"), "isTintable");
    self->_isTintable = isTintable;
  }
  return isTintable != 0;
}

- (id)properties
{
  return objc_msgSend(-[CUIThemeFacet _rendition](self, "_rendition"), "properties");
}

- (id)displayName
{
  CUIRenditionKey *v3;
  id v4;

  v3 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
  v4 = objc_msgSend(-[CUIThemeFacet _renditionForSpecificKey:](self, "_renditionForSpecificKey:", v3), "name");

  if (v4)
    return v4;
  else
    return CFSTR("Problem in -[CUIThemeFacet displayName]");
}

- (id)thumbnail
{
  uint64_t v3;
  id v4;
  char *v5;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CUIRenditionKey *v11;
  CUIImage *v12;

  v4 = -[CUIThemeFacet _rendition](self, "_rendition");
  if (!v4)
    v4 = CUIPlaceHolderRendition(0, v3);
  v5 = (char *)objc_msgSend(v4, "type");
  if ((unint64_t)(v5 - 1) < 3 || v5 == (char *)6)
  {
    -[CUIThemeFacet _thumbnailSizeForRendition:](self, "_thumbnailSizeForRendition:", v4);
    v8 = v7;
    v10 = v9;
    v11 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", self->_renditionKeyList);
    v12 = -[CUIThemeFacet _imageForRenditionFromKey:withSize:isMask:]((CUIImage *)self, v11, 0, v8, v10);

    return v12;
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(v4, "imageForSliceIndex:", 0);
  }
}

- (CGSize)thumbnailSize
{
  double height;
  double width;
  CGSize result;

  height = self->_thumbnailSize.height;
  if (height >= 0.0)
  {
    width = self->_thumbnailSize.width;
  }
  else
  {
    objc_msgSend(-[CUIThemeFacet thumbnail](self, "thumbnail"), "size");
    self->_thumbnailSize.width = width;
    self->_thumbnailSize.height = height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)topLeftCapSize
{
  id v2;
  double width;
  double height;
  CGSize result;

  v2 = objc_msgSend(-[CUIThemeFacet _rendition](self, "_rendition"), "imageForSliceIndex:", 0);
  if (v2)
  {
    objc_msgSend(v2, "size");
  }
  else
  {
    width = NSZeroSize.width;
    height = NSZeroSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)_applyFixedAttributesToKey:(id)a3
{
  objc_msgSend(a3, "setValuesFromKeyList:", self->_renditionKeyList);
}

- (int64_t)_sliceIndexForSlice:(int64_t)a3 ofRendition:(id)a4
{
  char *v5;
  BOOL v6;
  int64_t v7;

  v5 = (char *)objc_msgSend(a4, "type");
  v6 = (unint64_t)(v5 - 1) < 2 && a3 == 4;
  v7 = 2;
  if (!v6)
    v7 = a3 - 1;
  if (v5 == (char *)6)
    v7 = 0;
  if (a3 >= 1)
    return v7;
  else
    return 0;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeFacet;
  return -[NSString stringByAppendingFormat:](-[CUIThemeFacet description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" %@"), objc_msgSend(-[CUIThemeFacet _themeStore](self, "_themeStore"), "debugDescriptionForKeyList:", self->_renditionKeyList));
}

- (id)maskForSlice:(int64_t)a3 withKeyAdjustment:(id)a4
{
  CUIRenditionKey *v6;
  CUIRenditionKey *v7;
  id v8;
  id v9;

  if (a4)
    v6 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a4, "keyList"));
  else
    v6 = objc_alloc_init(CUIRenditionKey);
  v7 = v6;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v6);
  -[CUIRenditionKey setThemeLayer:](v7, "setThemeLayer:", 2);
  -[CUIRenditionKey setThemeState:](v7, "setThemeState:", 0);
  v8 = -[CUIThemeFacet _renditionForSpecificKey:](self, "_renditionForSpecificKey:", v7);
  v9 = objc_msgSend(v8, "maskForSliceIndex:", -[CUIThemeFacet _sliceIndexForSlice:ofRendition:](self, "_sliceIndexForSlice:ofRendition:", a3, v8));

  return v9;
}

- (id)imageForSlice:(int64_t)a3 withKeyAdjustment:(id)a4
{
  CUIRenditionKey *v6;
  CUIRenditionKey *v7;
  id v8;
  id v9;

  if (a4)
    v6 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a4, "keyList"));
  else
    v6 = objc_alloc_init(CUIRenditionKey);
  v7 = v6;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v6);
  if (-[CUIThemeFacet _isButtonGlyph](self, "_isButtonGlyph"))
    v8 = -[CUIThemeFacet _approximateRenditionForRenditionKey:](self, v7);
  else
    v8 = -[CUIThemeFacet _renditionForSpecificKey:](self, "_renditionForSpecificKey:", v7);
  v9 = objc_msgSend(v8, "imageForSliceIndex:", -[CUIThemeFacet _sliceIndexForSlice:ofRendition:](self, "_sliceIndexForSlice:ofRendition:", a3, v8));

  return v9;
}

- (id)imageWithSize:(CGSize)a3 keyAdjustment:(id)a4
{
  CGFloat height;
  CGFloat width;
  CUIRenditionKey *v7;
  CUIRenditionKey *v8;
  CUIImage *v9;

  height = a3.height;
  width = a3.width;
  if (a4)
    v7 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a4, "keyList"));
  else
    v7 = objc_alloc_init(CUIRenditionKey);
  v8 = v7;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v7);
  v9 = -[CUIThemeFacet _imageForRenditionFromKey:withSize:isMask:]((CUIImage *)self, v8, 0, width, height);

  return v9;
}

- (id)highlightWithSize:(CGSize)a3 keyAdjustment:(id)a4
{
  CGFloat height;
  CGFloat width;
  CUIRenditionKey *v7;
  CUIRenditionKey *v8;
  CUIImage *v9;

  height = a3.height;
  width = a3.width;
  if (a4)
    v7 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a4, "keyList"));
  else
    v7 = objc_alloc_init(CUIRenditionKey);
  v8 = v7;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v7);
  -[CUIRenditionKey setThemeLayer:](v8, "setThemeLayer:", 1);
  -[CUIRenditionKey setThemeState:](v8, "setThemeState:", 0);
  v9 = -[CUIThemeFacet _imageForRenditionFromKey:withSize:isMask:]((CUIImage *)self, v8, 0, width, height);

  return v9;
}

- (id)maskWithSize:(CGSize)a3 keyAdjustment:(id)a4
{
  CGFloat height;
  CGFloat width;
  CUIRenditionKey *v7;
  CUIRenditionKey *v8;
  CUIImage *v9;

  height = a3.height;
  width = a3.width;
  if (a4)
    v7 = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", objc_msgSend(a4, "keyList"));
  else
    v7 = objc_alloc_init(CUIRenditionKey);
  v8 = v7;
  -[CUIThemeFacet _applyFixedAttributesToKey:](self, "_applyFixedAttributesToKey:", v7);
  -[CUIRenditionKey setThemeLayer:](v8, "setThemeLayer:", 2);
  -[CUIRenditionKey setThemeState:](v8, "setThemeState:", 0);
  v9 = -[CUIThemeFacet _imageForRenditionFromKey:withSize:isMask:]((CUIImage *)self, v8, 1, width, height);

  return v9;
}

@end
