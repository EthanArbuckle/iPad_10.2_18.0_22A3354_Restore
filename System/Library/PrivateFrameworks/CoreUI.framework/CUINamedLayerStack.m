@implementation CUINamedLayerStack

- (CUINamedLayerStack)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5 resolvingWithBlock:(id)a6
{
  id v8;
  CUINamedLayerStack *v9;
  CUIThemeRendition *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  CUINamedLayerImage *v24;
  double v25;
  double v26;
  CUIRenditionKey *v27;
  CUINamedLayerStack *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CUIRenditionKey *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  CUINamedLayerStack *v61;
  id obj;
  NSArray *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];

  v8 = a3;
  v68.receiver = self;
  v68.super_class = (Class)CUINamedLayerStack;
  v9 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v68, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4);
  v10 = -[CUINamedLookup _rendition](v9, "_rendition");
  if ((id)-[CUIThemeRendition type](v10, "type") == (id)1002)
  {
    if (!v8)
    {
      -[CUINamedLookup setName:](v9, "setName:", -[CUIThemeRendition name](v10, "name"));
      v8 = -[CUIThemeRendition name](v10, "name");
    }
    v61 = v9;
    v63 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = -[CUIThemeRendition layerReferences](v10, "layerReferences");
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v65;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v65 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
          v23 = (*((uint64_t (**)(id, id))a6 + 2))(a6, objc_msgSend(v22, "referenceKey"));
          if (!v23)
          {
            objc_msgSend(v22, "referenceKey");
            _CUILog(4, (uint64_t)"CoreUI: Unable to resolve layer reference for '%@' name '%@' layerRef referenceKey '%@'", v29, v30, v31, v32, v33, v34, (uint64_t)v22);
            goto LABEL_23;
          }
          v24 = -[CUINamedLayerImage initWithName:usingRenditionKey:fromTheme:]([CUINamedLayerImage alloc], "initWithName:usingRenditionKey:fromTheme:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%ld]"), v8, (char *)i + v19 + 1), v23, a5);
          if (-[CUINamedLookup _rendition](v24, "_rendition"))
          {
            objc_msgSend(v22, "frame");
            -[CUINamedLayerImage setFrame:](v24, "setFrame:");
            objc_msgSend(v22, "opacity");
            if (v25 < 1.0)
            {
              -[CUINamedLayerImage opacity](v24, "opacity");
              if (v26 == 1.0)
              {
                objc_msgSend(v22, "opacity");
                -[CUINamedLayerImage setOpacity:](v24, "setOpacity:");
              }
            }
            if ((int)objc_msgSend(v22, "blendMode") >= 1 && !-[CUINamedLayerImage blendMode](v24, "blendMode"))
              -[CUINamedLayerImage setBlendMode:](v24, "setBlendMode:", objc_msgSend(v22, "blendMode"));
            -[CUINamedLayerImage setFixedFrame:](v24, "setFixedFrame:", objc_msgSend(v22, "fixedFrame"));
            -[NSArray addObject:](v63, "addObject:", v24);
          }

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
        v19 += (uint64_t)i;
        if (v18)
          continue;
        break;
      }
    }
LABEL_23:
    v28 = v9;
    v9->_layers = v63;
    v35 = objc_alloc_init(CUIRenditionKey);
    -[CUIRenditionKey setThemeElement:](v35, "setThemeElement:", -[CUIRenditionKey themeElement](-[CUINamedLookup key](v9, "key"), "themeElement"));
    -[CUIRenditionKey setThemePart:](v35, "setThemePart:", 208);
    -[CUIRenditionKey setThemeIdentifier:](v35, "setThemeIdentifier:", -[CUIRenditionKey themeIdentifier](-[CUINamedLookup key](v9, "key"), "themeIdentifier"));
    v36 = (*((uint64_t (**)(id, CUIRenditionKey *))a6 + 2))(a6, v35);
    if (v36)
    {
      v43 = (void *)v36;
      v44 = -[CUINamedLookup storageRef](v9, "storageRef");
      v46 = (void *)_LookupStructuredThemeProvider(v44, v45);
      v47 = objc_msgSend(v46, "copyLookupKeySignatureForKey:", objc_msgSend(v43, "keyList"));
      v61->_flattenedImageRendition = (CUIThemeRendition *)objc_msgSend(v46, "renditionWithKey:usingKeySignature:", objc_msgSend(v43, "keyList"), v47);

    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: Unable to resolve flattened image for layer stack %@", v37, v38, v39, v40, v41, v42, (uint64_t)v9);
    }

    v27 = objc_alloc_init(CUIRenditionKey);
    -[CUIRenditionKey setThemeElement:](v27, "setThemeElement:", -[CUIRenditionKey themeElement](-[CUINamedLookup key](v61, "key"), "themeElement"));
    -[CUIRenditionKey setThemePart:](v27, "setThemePart:", 209);
    -[CUIRenditionKey setThemeIdentifier:](v27, "setThemeIdentifier:", -[CUIRenditionKey themeIdentifier](-[CUINamedLookup key](v61, "key"), "themeIdentifier"));
    v48 = (*((uint64_t (**)(id, CUIRenditionKey *))a6 + 2))(a6, v27);
    if (v48)
    {
      v55 = (void *)v48;
      v56 = -[CUINamedLookup storageRef](v61, "storageRef");
      v58 = (void *)_LookupStructuredThemeProvider(v56, v57);
      v59 = objc_msgSend(v58, "copyLookupKeySignatureForKey:", objc_msgSend(v55, "keyList"));
      v61->_radiosityImageRendition = (CUIThemeRendition *)objc_msgSend(v58, "renditionWithKey:usingKeySignature:", objc_msgSend(v55, "keyList"), v59);

    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: Unable to resolve radiosity image for layer stack %@", v49, v50, v51, v52, v53, v54, (uint64_t)v8);
    }
  }
  else
  {
    _CUILog(4, (uint64_t)"CoreUI: Attempting to create named layer stack '%@' from inappropriate rendition type: %@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    v27 = (CUIRenditionKey *)v9;
    v28 = 0;
  }

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CUINamedLayerStack;
  if (!-[CUINamedLookup isEqual:](&v10, sel_isEqual_))
    goto LABEL_6;
  v6 = objc_opt_class(CUINamedLayerStack, v5);
  if ((objc_opt_isKindOfClass(a3, v6) & 1) == 0)
    goto LABEL_6;
  v7 = -[NSArray isEqual:](-[CUINamedLayerStack layers](self, "layers"), "isEqual:", objc_msgSend(a3, "layers"));
  if (v7)
  {
    v8 = -[CUIThemeRendition type](-[CUINamedLookup _rendition](self, "_rendition"), "type");
    if (v8 == objc_msgSend(objc_msgSend(a3, "_rendition"), "type"))
    {
      LOBYTE(v7) = 1;
      return v7;
    }
LABEL_6:
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v14.receiver = self;
  v14.super_class = (Class)CUINamedLayerStack;
  v3 = -[CUINamedLookup hash](&v14, sel_hash);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[CUINamedLayerStack layers](self, "layers", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 *= 2654435769 * (_QWORD)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "hash");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }
  return v3;
}

+ (vImage_Buffer)_doRadiosityBlurOnPixelBuffer:(SEL)a3 bytesPerRow:(void *)a4 bitsPerPixel:(unint64_t)a5 width:(unint64_t)a6 height:(unint64_t)a7 scaleFactor:(unint64_t)a8 usesGaussianBlur:(unint64_t)a9 adjustedSize:(BOOL *)a10
{
  char *v18;
  _BOOL4 v19;
  vImagePixelCount v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double *v25;
  uint64x2_t v26;
  long double v27;
  float64x2_t v28;
  double v29;
  double *v30;
  unint64_t v31;
  char *v32;
  double v33;
  int v34;
  uint64x2_t v40;
  vImage_Buffer *result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int8x16_t v48;
  unint64_t v49;
  uint64_t v50;
  double v51;
  int16_t *v52;
  int16_t *v53;
  double *v54;
  vImagePixelCount v55;
  double v56;
  int v57;
  vImagePixelCount v58;
  size_t v59;
  char *v60;
  size_t v61;
  char *v62;
  uint32_t v63;
  unint64_t v64;
  size_t v65;
  char *v66;
  uint64x2_t v67;
  unint64_t v68;
  double v69;
  void *v70;
  int32x2_t v71;
  double *v72;
  int16_t *kernel[2];
  int16_t *kernela[2];
  int16_t *kernelb;
  vImage_Buffer dest;
  vImage_Buffer src;

  v18 = getenv("CoreUI_RADIOSITY_BLUR_METHOD");
  if (v18)
    v19 = strncasecmp(v18, "downscale", 9uLL) != 0;
  else
    v19 = 1;
  if (a10)
    *a10 = v19;
  if (v19)
  {
    v65 = a5;
    v66 = (char *)a4;
    if (a11)
    {
      a11->width = (double)a7;
      a11->height = (double)a8;
    }
    v64 = a9;
    v20 = 40 * a9;
    v21 = (double)(40 * a9) * 0.5;
    v22 = 0;
    v23 = 1.0 / (v21 * 2.50662827);
    v24 = v21 * (v21 + v21);
    v25 = (double *)malloc_type_malloc((320 * a9) | 8, 0xABE799DCuLL);
    v26 = (uint64x2_t)xmmword_19EC730D0;
    v67 = (uint64x2_t)vdupq_n_s64(40 * a9);
    do
    {
      *(uint64x2_t *)kernel = v26;
      v71 = vmovn_s64((int64x2_t)vcgeq_u64(v67, v26));
      v69 = exp(-(double)(unint64_t)(v22 * v22) / v24);
      v27 = exp(-(double)(unint64_t)((v22 + 1) * (v22 + 1)) / v24);
      v28.f64[0] = v69;
      v28.f64[1] = v27;
      if ((v71.i8[0] & 1) != 0)
        v25[v22] = v23 * v69;
      if ((v71.i8[4] & 1) != 0)
        v25[v22 + 1] = vmuld_lane_f64(v23, v28, 1);
      v22 += 2;
      v26 = (uint64x2_t)vaddq_s64(*(int64x2_t *)kernel, vdupq_n_s64(2uLL));
    }
    while (((40 * a9) | 2) != v22);
    v29 = *v25;
    if (v20)
    {
      v30 = v25 + 1;
      v31 = 40 * a9;
      v32 = (char *)a4;
      do
      {
        v33 = *v30++;
        v29 = v29 + v33 * 2.0;
        --v31;
      }
      while (v31);
    }
    else
    {
      v32 = (char *)a4;
    }
    v49 = a6 >> 3;
    v50 = 80 * v64;
    v51 = 16384.0 / v29;
    v52 = (int16_t *)malloc_type_malloc((160 * v64) | 2, 0x952EE1DBuLL);
    v52[v20] = (int)(v51 * *v25);
    if (v20)
    {
      v53 = &v52[40 * v64 + 1];
      v54 = v25 + 1;
      v55 = v20;
      do
      {
        v56 = *v54++;
        v57 = (int)(v51 * v56);
        *v53++ = v57;
        v52[--v55] = v57;
      }
      while (v55);
    }
    kernelb = v52;
    v72 = v25;
    v58 = v50 + a7;
    v59 = (v50 + a7) * v49;
    v60 = (char *)malloc_type_malloc(v59, 0x76F7D70uLL);
    v61 = v49 * a7;
    src.data = v60;
    src.height = 1;
    src.width = v58;
    src.rowBytes = v59;
    v70 = malloc_type_malloc(v49 * a7 * a8, 0x730010ADuLL);
    dest.data = v70;
    dest.height = 1;
    dest.width = a7;
    dest.rowBytes = v49 * a7;
    bzero(v60, v20 * v49);
    bzero(&v60[(v20 + a7) * v49], v20 * v49);
    if (a8)
    {
      v62 = &v60[v20 * v49];
      v68 = a8;
      v63 = (2 * v20) | 1;
      do
      {
        memcpy(v62, v32, v61);
        vImageConvolve_ARGB8888(&src, &dest, 0, v20, 0, kernelb, 1u, (2 * v20) | 1, 0x4000, 0, 0x14u);
        dest.data = (char *)dest.data + v61;
        v32 += v65;
        --a8;
      }
      while (a8);
      v32 = v66;
      a8 = v68;
    }
    else
    {
      v63 = (2 * v20) | 1;
    }
    src.data = v70;
    src.height = a8;
    src.width = a7;
    src.rowBytes = v61;
    dest.data = v32;
    dest.height = a8;
    dest.width = a7;
    dest.rowBytes = v65;
    vImageConvolve_ARGB8888(&src, &dest, 0, 0, 0, kernelb, v63, 1u, 0x4000, 0, 0x14u);
    free(v70);
    free(v60);
    free(kernelb);
    free(v72);
    *(_OWORD *)&retstr->data = 0u;
    *(_OWORD *)&retstr->width = 0u;
  }
  else
  {
    retstr->data = 0;
    src.width = a7;
    src.rowBytes = a5;
    v34 = 3;
    __asm { FMOV            V0.2D, #0.5 }
    *(_OWORD *)kernela = _Q0;
    src.data = a4;
    src.height = a8;
    do
    {
      v40 = vcvtq_u64_f64(vcvtq_f64_f32(vrnda_f32(vcvt_f32_f64(vmulq_f64(vcvtq_f64_u64(*(uint64x2_t *)&src.height), *(float64x2_t *)kernela)))));
      *(uint64x2_t *)&retstr->height = v40;
      retstr->rowBytes = 4 * v40.i64[1];
      retstr->data = malloc_type_malloc(4 * v40.i64[1] * v40.i64[0], 0x85203C46uLL);
      result = (vImage_Buffer *)vImageScale_ARGB8888(&src, retstr, 0, 0);
      if (result)
        _CUILog(4, (uint64_t)"CoreUI -- radiosity downscale vImage error: %ld", v42, v43, v44, v45, v46, v47, (uint64_t)result);
      *(_OWORD *)&src.height = *(_OWORD *)&retstr->height;
      src.rowBytes = retstr->rowBytes;
      if (v34 != 3)
        free(src.data);
      src.data = retstr->data;
      --v34;
    }
    while (v34);
    if (a11)
    {
      v48 = (int8x16_t)vcvtq_f64_u64(*(uint64x2_t *)&retstr->height);
      *(int8x16_t *)a11 = vextq_s8(v48, v48, 8uLL);
    }
  }
  return result;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(-[CUIThemeRendition metrics](-[CUINamedLookup _rendition](self, "_rendition"), "metrics"), "imageSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)layerImageAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](-[CUINamedLayerStack layers](self, "layers"), "objectAtIndexedSubscript:", a3);
}

- (CGImage)flattenedImage
{
  return -[CUIThemeRendition unslicedImage](self->_flattenedImageRendition, "unslicedImage");
}

- (CGImage)radiosityImage
{
  return -[CUIThemeRendition unslicedImage](self->_radiosityImageRendition, "unslicedImage");
}

+ (CGImage)createRadiosityImageWithImage:(CGImage *)a3 displayScale:(int64_t)a4
{
  double v7;
  double Width;
  double Height;
  double v10;
  double v11;
  CSIBitmapWrapper *v12;
  CGColorSpace *ColorSpace;
  uint64_t v14;
  CGContext *v15;
  void *Data;
  size_t BytesPerRow;
  size_t BitsPerPixel;
  uint32_t v19;
  CGImageRef Image;
  CGImage *v21;
  vImage_CGImageFormat format;
  vImage_Buffer buf;
  CGSize v25;
  char v26;
  CGRect v27;

  v7 = (double)a4 * 40.0;
  Width = (double)CGImageGetWidth(a3);
  Height = (double)CGImageGetHeight(a3);
  v10 = Width + v7 * 2.0;
  v11 = Height + v7 * 2.0;
  v12 = -[CSIBitmapWrapper initWithPixelWidth:pixelHeight:]([CSIBitmapWrapper alloc], "initWithPixelWidth:pixelHeight:", v10, v11);
  ColorSpace = CGImageGetColorSpace(a3);
  if (CGColorSpaceIsWideGamutRGB(ColorSpace))
    v14 = 3;
  else
    v14 = 1;
  -[CSIBitmapWrapper setColorSpaceID:](v12, "setColorSpaceID:", v14);
  -[CSIBitmapWrapper setPixelFormat:](v12, "setPixelFormat:", 1095911234);
  -[CSIBitmapWrapper setSourceAlphaInfo:](v12, "setSourceAlphaInfo:", 2);
  v15 = -[CSIBitmapWrapper bitmapContext](v12, "bitmapContext");
  v27.origin.x = v7;
  v27.origin.y = v7;
  v27.size.width = Width;
  v27.size.height = Height;
  CGContextDrawImage(v15, v27, a3);
  Data = CGBitmapContextGetData(v15);
  BytesPerRow = CGBitmapContextGetBytesPerRow(v15);
  BitsPerPixel = CGBitmapContextGetBitsPerPixel(v15);
  v26 = 1;
  v25 = CGSizeZero;
  memset(&buf, 0, sizeof(buf));
  if (a1
    && (v19 = BitsPerPixel,
        objc_msgSend(a1, "_doRadiosityBlurOnPixelBuffer:bytesPerRow:bitsPerPixel:width:height:scaleFactor:usesGaussianBlur:adjustedSize:", Data, BytesPerRow, BitsPerPixel, (unint64_t)v10, (unint64_t)v11, a4, &v26, &v25), !v26))
  {
    format.bitsPerComponent = 8;
    format.bitsPerPixel = v19;
    format.colorSpace = CGImageGetColorSpace(a3);
    format.bitmapInfo = 8194;
    memset(&format.version, 0, 20);
    Image = vImageCreateCGImageFromBuffer(&buf, &format, 0, 0, 0x200u, 0);
  }
  else
  {
    Image = CGBitmapContextCreateImage(v15);
  }
  v21 = Image;

  return v21;
}

+ (void)radiosityImageWithImage:(CGImage *)a3 displayScale:(int64_t)a4 completionHandler:(id)a5
{
  _QWORD v9[8];

  if (__onceToken_0 == -1)
  {
    if (!a3)
      return;
  }
  else
  {
    dispatch_once(&__onceToken_0, &__block_literal_global_14);
    if (!a3)
      return;
  }
  CGImageRetain(a3);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __77__CUINamedLayerStack_radiosityImageWithImage_displayScale_completionHandler___block_invoke_2;
  v9[3] = &unk_1E41B2490;
  v9[6] = a3;
  v9[7] = a4;
  v9[4] = a1;
  v9[5] = a5;
  dispatch_async((dispatch_queue_t)__dispatchQueue, v9);
}

dispatch_queue_t __77__CUINamedLayerStack_radiosityImageWithImage_displayScale_completionHandler___block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.CoreUI.NamedLayerStackQueue", 0);
  __dispatchQueue = (uint64_t)result;
  return result;
}

void __77__CUINamedLayerStack_radiosityImageWithImage_displayScale_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD block[7];

  v2 = objc_msgSend(*(id *)(a1 + 32), "createRadiosityImageWithImage:displayScale:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __77__CUINamedLayerStack_radiosityImageWithImage_displayScale_completionHandler___block_invoke_3;
  block[3] = &unk_1E41B2468;
  v3 = *(_QWORD *)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  block[5] = v2;
  block[6] = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __77__CUINamedLayerStack_radiosityImageWithImage_displayScale_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CGImageRelease(*(CGImageRef *)(a1 + 40));
  CGImageRelease(*(CGImageRef *)(a1 + 48));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUINamedLayerStack;
  -[CUINamedLookup dealloc](&v3, sel_dealloc);
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
