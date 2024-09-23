@implementation CUIThemeRendition

- (CUIThemeRendition)initWithCSIData:(id)a3 forKey:(const _renditionkeytoken *)a4 version:(unsigned int)a5
{
  uint64_t v5;
  unsigned __int16 *v9;
  uint64_t v10;
  objc_class *v11;
  CUIThemeRendition *v12;

  v5 = *(_QWORD *)&a5;
  v9 = (unsigned __int16 *)objc_msgSend(a3, "bytes");
  v11 = (objc_class *)objc_msgSend((id)objc_opt_class(self, v10), "renditionClassForRenditionType:andPixelFormat:", v9[18], *((unsigned int *)v9 + 6));
  if (v11)
    v12 = (CUIThemeRendition *)objc_msgSend([v11 alloc], "_initWithCSIData:forKey:version:", a3, a4, v5);
  else
    v12 = 0;

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_key);
  CGImageRelease(self->_uncroppedImage);

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

+ (Class)renditionClassForRenditionType:(int64_t)a3 andPixelFormat:(unsigned int)a4
{
  __objc2_class **v4;
  __objc2_class **v5;
  BOOL v6;

  if (a3 <= 999)
  {
    if (a3 == 6)
    {
      v4 = OBJC_CLASS____CUIThemeGradientRendition_ptr;
    }
    else if (a3 == 7)
    {
      v4 = OBJC_CLASS____CUIThemeEffectRendition_ptr;
    }
    else
    {
      if (a3 == 9)
      {
        v4 = OBJC_CLASS____CUIThemeSVGRendition_ptr;
        v5 = OBJC_CLASS____CUIThemePDFRendition_ptr;
        v6 = a4 == 1346651680;
      }
      else
      {
LABEL_25:
        v6 = a4 == 1212500294 || a4 == 1246774599;
        v4 = OBJC_CLASS____CUIThemePixelRendition_ptr;
        v5 = OBJC_CLASS____CUIRawPixelRendition_ptr;
      }
      if (v6)
        v4 = v5;
    }
  }
  else
  {
    switch(a3)
    {
      case 1000:
        v4 = OBJC_CLASS____CUIRawDataRendition_ptr;
        break;
      case 1001:
        v4 = OBJC_CLASS____CUIExternalLinkRendition_ptr;
        break;
      case 1002:
      case 1018:
        v4 = OBJC_CLASS____CUILayerStackRendition_ptr;
        break;
      case 1003:
        v4 = OBJC_CLASS____CUIInternalLinkRendition_ptr;
        break;
      case 1005:
        v4 = OBJC_CLASS____CUINameContentRendition_ptr;
        break;
      case 1006:
        v4 = OBJC_CLASS____CUIThinningPlaceholderRendition_ptr;
        break;
      case 1007:
        v4 = OBJC_CLASS____CUIThemeTextureRendition_ptr;
        break;
      case 1008:
        v4 = OBJC_CLASS____CUIThemeTextureImageRendition_ptr;
        break;
      case 1009:
        v4 = OBJC_CLASS____CUIThemeColorRendition_ptr;
        break;
      case 1010:
        v4 = OBJC_CLASS____CUIThemeMultisizeImageSetRendition_ptr;
        break;
      case 1011:
        v4 = OBJC_CLASS____CUIThemeModelAssetRendition_ptr;
        break;
      case 1012:
        v4 = OBJC_CLASS____CUIThemeModelMeshRendition_ptr;
        break;
      case 1014:
        v4 = OBJC_CLASS____CUIRecognitionObjectRendition_ptr;
        break;
      case 1015:
        v4 = OBJC_CLASS____CUIThemeTextStyleRendition_ptr;
        break;
      case 1016:
        v4 = OBJC_CLASS____CUIThemeModelSubmeshRendition_ptr;
        break;
      case 1017:
        v4 = OBJC_CLASS____CUIThemeSVGRendition_ptr;
        break;
      default:
        goto LABEL_25;
    }
  }
  return (Class)objc_opt_class(*v4, a2);
}

- (id)_initWithCSIData:(id)a3 forKey:(const _renditionkeytoken *)a4 version:(unsigned int)a5
{
  uint64_t v5;
  id result;
  _QWORD *v9;
  unsigned int v10;
  __int16 v11;
  void *v12;
  _DWORD *v13;
  CUIRenditionKey *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v5 = *(_QWORD *)&a5;
  v21.receiver = self;
  v21.super_class = (Class)CUIThemeRendition;
  result = -[CUIThemeRendition init](&v21, sel_init);
  if (result)
  {
    v9 = result;
    v10 = CUIRenditionKeyTokenCount((uint64_t)a4);
    v11 = v10;
    if (v10 <= 0x15)
    {
      v12 = (void *)v9[12];
    }
    else
    {
      v12 = malloc_type_calloc(v10 + 1, 4uLL, 0x100004052888210uLL);
      v9[12] = v12;
    }
    if (!v12)
      v12 = v9 + 1;
    CUIRenditionKeyCopy(v12, a4, (unsigned __int16)(v11 + 1));
    v13 = objc_msgSend(a3, "bytes");
    v9[20] = a3;
    if (*v13 == 1129599817)
    {
      return objc_msgSend(v9, "_initWithCSIHeader:version:", v13, v5);
    }
    else
    {
      v14 = +[CUIRenditionKey renditionKeyWithKeyList:](CUIRenditionKey, "renditionKeyWithKeyList:", a4);
      _CUILog(4, (uint64_t)"CoreUI: Error while decoding CSIData for key %@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);

      return 0;
    }
  }
  return result;
}

- (BOOL)isFlippable
{
  return *(_BYTE *)&self->_renditionFlags >> 7;
}

- (double)scale
{
  unint64_t v2;

  LODWORD(v2) = self->_scale;
  return (double)v2;
}

- (BOOL)preservedVectorRepresentation
{
  return (*((unsigned __int8 *)&self->_renditionFlags + 1) >> 1) & 1;
}

- (int64_t)templateRenderingMode
{
  return self->_templateRenderingMode;
}

- (unsigned)subtype
{
  unsigned int result;
  int64_t type;

  result = self->_subtype;
  if (!result)
  {
    type = self->_type;
    result = 10;
    switch(type)
    {
      case 0:
        return result;
      case 1:
        result = 20;
        break;
      case 2:
        result = 23;
        break;
      case 3:
        result = 30;
        break;
      case 4:
      case 6:
      case 7:
        goto LABEL_6;
      case 5:
        result = 40;
        break;
      case 8:
        result = 50;
        break;
      default:
        if (type != 1004)
LABEL_6:
          result = 0;
        break;
    }
  }
  return result;
}

- (BOOL)isVectorBased
{
  return *(_DWORD *)&self->_renditionFlags & 1;
}

- (int)exifOrientation
{
  return self->_exifOrientation;
}

- (CGSize)originalUncroppedSize
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  uint64_t v4;
  CUIThemeRendition *v6;
  unsigned int v7;
  unsigned int var2;
  uint64_t v9;
  unsigned int var5;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v4 = *(_QWORD *)&a4;
  v19.receiver = self;
  v19.super_class = (Class)CUIThemeRendition;
  v6 = -[CUIThemeRendition init](&v19, sel_init);
  v6->_colorSpaceID = *((_DWORD *)a3 + 7) & 0xF;
  -[CUIThemeRendition _initializeTypeIdentifiersWithLayout:](v6, "_initializeTypeIdentifiersWithLayout:", a3->var9.var1);
  v6->_name = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", a3->var9.var3);
  v7 = *(_DWORD *)&v6->_renditionFlags & 0xFFFFFFFE | (a3->var2 >> 2) & 1;
  v6->_renditionFlags = (cuithemerenditionrenditionflags)v7;
  var2 = a3->var2;
  if ((var2 & 8) != 0)
  {
    v9 = 1;
    goto LABEL_7;
  }
  if ((var2 & 0x10) != 0)
  {
    v9 = 2;
LABEL_7:
    v6->_templateRenderingMode = v9;
    if ((var2 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v6->_templateRenderingMode = 0;
  if ((var2 & 0x20) != 0)
  {
LABEL_8:
    v7 |= 0x40u;
    v6->_renditionFlags = (cuithemerenditionrenditionflags)v7;
    var2 = a3->var2;
  }
LABEL_9:
  if ((var2 & 0x200) != 0)
  {
    v7 |= 0x400u;
    v6->_renditionFlags = (cuithemerenditionrenditionflags)v7;
    var2 = a3->var2;
    if ((var2 & 0x40) == 0)
    {
LABEL_11:
      if ((var2 & 0x80) == 0)
        goto LABEL_12;
      goto LABEL_22;
    }
  }
  else if ((var2 & 0x40) == 0)
  {
    goto LABEL_11;
  }
  v7 |= 0x80u;
  v6->_renditionFlags = (cuithemerenditionrenditionflags)v7;
  var2 = a3->var2;
  if ((var2 & 0x80) == 0)
  {
LABEL_12:
    if ((var2 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_22:
  v7 |= 0x100u;
  v6->_renditionFlags = (cuithemerenditionrenditionflags)v7;
  if ((a3->var2 & 0x100) != 0)
LABEL_13:
    v6->_renditionFlags = (cuithemerenditionrenditionflags)(v7 | 0x200);
LABEL_14:
  var5 = a3->var5;
  if (var5)
    v11 = ((double)var5 / 100.0);
  else
    v11 = 1;
  v6->_scale = v11;
  -[CUIThemeRendition _initializeCompositingOptionsFromCSIData:version:](v6, "_initializeCompositingOptionsFromCSIData:version:", a3, v4);
  -[CUIThemeRendition _initalizeMetadataFromCSIData:version:](v6, "_initalizeMetadataFromCSIData:version:", a3, v4);
  -[CUIThemeRendition _initializePropertiesFromCSIData:version:](v6, "_initializePropertiesFromCSIData:version:", a3, v4);
  if (a3->var1 > 1)
    _CUILog(4, (uint64_t)"CoreUI: Error: CAR has a CSIVersion (%d) that is greater than the current version (%d)", v12, v13, v14, v15, v16, v17, a3->var1);
  return v6;
}

- (void)_initializeTypeIdentifiersWithLayout:(unsigned __int16)a3
{
  int64_t v3;
  unsigned int v4;

  if ((a3 - 10) <= 2)
  {
    self->_type = 0;
LABEL_10:
    self->_subtype = a3;
    return;
  }
  if ((a3 - 20) <= 2)
  {
    v3 = 1;
LABEL_9:
    self->_type = v3;
    goto LABEL_10;
  }
  if ((a3 - 23) <= 2)
  {
    v3 = 2;
    goto LABEL_9;
  }
  if ((a3 - 30) < 5)
  {
    v3 = 3;
    goto LABEL_9;
  }
  if (a3 == 40)
  {
    self->_type = 5;
    v4 = 40;
    goto LABEL_15;
  }
  if (a3 == 50)
  {
    self->_type = 8;
    v4 = 50;
LABEL_15:
    self->_subtype = v4;
    return;
  }
  self->_type = a3;
}

- (void)_initializePropertiesFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4
{
  uint64_t var10;
  uint64_t var0;
  NSDictionary *v9;
  unsigned int *v10;
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  double *v20;
  CGColorRef v21;
  __int128 v22;
  CGColorRef v23;
  uint64_t v25;
  CGColorSpace *space;
  CGFloat components[2];
  __int128 v28;

  var10 = a3->var10;
  var0 = a3->var11.var0;
  space = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v9 = 0;
  if ((_DWORD)var10)
  {
    v10 = &a3->var11.var1[var0 + 1];
    v11 = (unsigned int *)((char *)v10 + var10);
    do
    {
      v12 = v10[1];
      if (*v10 == 1016 && !v10[2])
      {
        v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v10 + 7);
        v20 = (double *)((char *)v10 + v10[3] + 28);
        switch(v10[5])
        {
          case 0u:
            v21 = (CGColorRef)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v20);
            goto LABEL_11;
          case 1u:
            v21 = (CGColorRef)objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", *(_QWORD *)v20);
            goto LABEL_11;
          case 2u:
            v21 = (CGColorRef)objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", *v20);
            goto LABEL_11;
          case 3u:
            if ((v10[6] & 0xF) == 1)
            {
              v22 = *((_OWORD *)v20 + 1);
              *(_OWORD *)components = *(_OWORD *)v20;
              v28 = v22;
              v21 = CGColorCreate(space, components);
LABEL_11:
              v23 = v21;
              if (v19 && v21)
              {
                if (!v9)
                  v9 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                -[NSDictionary setObject:forKey:](v9, "setObject:forKey:", v23, v19);
              }
            }
            else
            {
              _CUILog(4, (uint64_t)"Rendition property with an unexpected color space.", v13, v14, v15, v16, v17, v18, v25);
LABEL_17:
              v23 = 0;
            }

            break;
          default:
            goto LABEL_17;
        }
      }
      if (a4 <= 0x34E && v12 != 12 && *v10 == 1019)
        v12 = 12;
      v10 = (unsigned int *)((char *)v10 + v12 + 8);
    }
    while (v10 < v11);
  }

  self->_properties = v9;
}

- (void)_initializeCompositingOptionsFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4
{
  uint64_t var10;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;

  self->_opacity = 1.0;
  self->_blendMode = 0;
  var10 = a3->var10;
  if ((_DWORD)var10)
  {
    v7 = &a3->var11.var1[a3->var11.var0 + 1];
    v8 = (unsigned int *)((char *)v7 + var10);
    do
    {
      v9 = v7[1];
      if (*v7 == 1004)
      {
        -[CUIThemeRendition setBlendMode:](self, "setBlendMode:", v7[2]);
        -[CUIThemeRendition setOpacity:](self, "setOpacity:", *((float *)v7 + 3));
      }
      if (a4 <= 0x34E && v9 != 12 && *v7 == 1019)
        v9 = 12;
      v7 = (unsigned int *)((char *)v7 + v9 + 8);
    }
    while (v7 < v8);
  }
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void)_initalizeMetadataFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4
{
  uint64_t var10;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;

  var10 = a3->var10;
  if ((_DWORD)var10)
  {
    v7 = &a3->var11.var1[a3->var11.var0 + 1];
    v8 = (unsigned int *)((char *)v7 + var10);
    do
    {
      v9 = v7[1];
      if (*v7 == 1015)
      {
        if (!v7[2])
          self->_physicalSizeInMeters = (CGSize)vcvtq_f64_f32(*(float32x2_t *)(v7 + 3));
      }
      else if (*v7 == 1005 && !v7[3])
      {

        self->_utiType = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v7 + 4);
      }
      if (a4 <= 0x34E && v9 != 12 && *v7 == 1019)
        v9 = 12;
      v7 = (unsigned int *)((char *)v7 + v9 + 8);
    }
    while (v7 < v8);
  }
}

- (CGImage)uncroppedImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGImage *v15;
  CGImage *uncroppedImage;
  size_t BitsPerComponent;
  CGColorSpace *ColorSpace;
  uint64_t AlphaInfo;
  uint64_t v21;
  uint64_t v22;
  CGContext *v23;
  CGRect v25;

  -[CUIThemeRendition originalUncroppedSize](self, "originalUncroppedSize");
  v4 = v3;
  v6 = v5;
  -[CUIThemeRendition alphaCroppedRect](self, "alphaCroppedRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[CUIThemeRendition unslicedImage](self, "unslicedImage");
  if (v4 != CGSizeZero.width || v6 != CGSizeZero.height)
  {
    uncroppedImage = self->_uncroppedImage;
    if (uncroppedImage)
      goto LABEL_7;
    BitsPerComponent = CGImageGetBitsPerComponent(v15);
    ColorSpace = CGImageGetColorSpace(v15);
    AlphaInfo = CGImageGetAlphaInfo(v15);
    v23 = CUICGBitmapContextCreate((unint64_t)v4, (unint64_t)v6, BitsPerComponent, 0, ColorSpace, AlphaInfo, v21, v22);
    v25.origin.y = v6 - (v10 + v14);
    v25.origin.x = v8;
    v25.size.width = v12;
    v25.size.height = v14;
    CGContextDrawImage(v23, v25, v15);
    self->_uncroppedImage = CGBitmapContextCreateImage(v23);
    CGContextRelease(v23);
    uncroppedImage = self->_uncroppedImage;
    if (uncroppedImage)
    {
LABEL_7:
      CFRetain(uncroppedImage);
      CFAutorelease(self->_uncroppedImage);
      return self->_uncroppedImage;
    }
    else
    {
      return 0;
    }
  }
  return v15;
}

- (const)key
{
  if (self->_key)
    return self->_key;
  else
    return self->_stackKey;
}

- (void)setExifOrientation:(int)a3
{
  self->_exifOrientation = a3;
}

- (NSData)srcData
{
  return self->_srcData;
}

- (cuithemerenditionrenditionflags)renditionFlags
{
  return &self->_renditionFlags;
}

- (CGRect)alphaCroppedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInternalName:(id)a3
{
  NSString *name;

  name = self->_name;
  if (name != a3)
  {

    self->_name = (NSString *)a3;
  }
}

- (NSString)internalName
{
  return self->_name;
}

- (unsigned)internalScale
{
  return self->_scale;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setSubtype:(unsigned int)a3
{
  self->_subtype = a3;
}

- (void)setInternalTemplateRenderingMode:(int64_t)a3
{
  self->_templateRenderingMode = a3;
}

- (void)setInternalScale:(unsigned int)a3
{
  self->_scale = a3;
}

- (int)bitmapEncoding
{
  return (*(_DWORD *)&self->_renditionFlags >> 2) & 0xF;
}

- (id)utiType
{
  return -[NSString copy](self->_utiType, "copy");
}

- (void)setName:(id)a3
{
  NSString *name;

  name = self->_name;
  if (name != a3)
  {

    self->_name = (NSString *)a3;
  }
}

+ (id)displayNameForRenditionType:(int64_t)a3
{
  return +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", gRenditionTypes[3 * a3 + 2], 4);
}

- (BOOL)isInternalLink
{
  return 0;
}

- (id)linkingToRendition
{
  return 0;
}

- (CGSize)unslicedSize
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)sourceRowbytes
{
  return 0;
}

- (CGRect)_destinationFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int)pixelFormat
{
  return 0;
}

- (void)_initializeRenditionKey:(const _renditionkeytoken *)a3
{
  unsigned int v5;
  __int16 v6;
  _renditionkeytoken *key;

  v5 = CUIRenditionKeyTokenCount((uint64_t)a3);
  v6 = v5;
  if (v5 <= 0x15)
  {
    key = self->_key;
  }
  else
  {
    key = (_renditionkeytoken *)malloc_type_calloc(v5 + 1, 4uLL, 0x100004052888210uLL);
    self->_key = key;
  }
  if (!key)
    key = self->_stackKey;
  CUIRenditionKeyCopy(key, a3, (unsigned __int16)(v6 + 1));
}

- (id)name
{
  return self->_name;
}

- (CGSize)physicalSizeInMeters
{
  double width;
  double height;
  CGSize result;

  width = self->_physicalSizeInMeters.width;
  height = self->_physicalSizeInMeters.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isOpaque
{
  return (*(_BYTE *)&self->_renditionFlags >> 1) & 1;
}

- (BOOL)optOutOfThinning
{
  return (*(_BYTE *)&self->_renditionFlags >> 6) & 1;
}

- (BOOL)preserveForArchiveOnly
{
  return (*((unsigned __int8 *)&self->_renditionFlags + 1) >> 2) & 1;
}

- (BOOL)isInterpolatable
{
  return 0;
}

- (void)_setFlippable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_renditionFlags = (cuithemerenditionrenditionflags)(*(_DWORD *)&self->_renditionFlags & 0xFFFFFF7F | v3);
}

- (BOOL)isTintable
{
  return *((_BYTE *)&self->_renditionFlags + 1) & 1;
}

- (id)properties
{
  return -[NSDictionary copy](self->_properties, "copy");
}

- (unint64_t)colorSpaceID
{
  return self->_colorSpaceID;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeRendition;
  return objc_msgSend(-[CUIThemeRendition description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" -- Rendition name: %@"), -[CUIThemeRendition name](self, "name"));
}

- (id)provideTextureInfo
{
  return 0;
}

- (id)textureImages
{
  return 0;
}

- (int64_t)textureIntepretation
{
  return 0;
}

- (CGImage)unslicedImage
{
  return 0;
}

- (id)imageForSliceIndex:(int64_t)a3
{
  return 0;
}

- (id)maskForSliceIndex:(int64_t)a3
{
  return 0;
}

- (id)metrics
{
  return 0;
}

- (id)sliceInformation
{
  return 0;
}

- (BOOL)isTiled
{
  return 0;
}

- (BOOL)isScaled
{
  return 1;
}

- (BOOL)edgesOnly
{
  return 0;
}

- (CGColor)cgColor
{
  return 0;
}

- (id)systemColorName
{
  return 0;
}

- (BOOL)substituteWithSystemColor
{
  return 0;
}

- (const)csiTextStyle
{
  return 0;
}

- (id)sizeIndexes
{
  return 0;
}

- (double)gradientDrawingAngle
{
  return 0.0;
}

- (id)gradient
{
  return 0;
}

- (unsigned)gradientStyle
{
  return 0;
}

- (id)effectPreset
{
  return 0;
}

- (CGPDFDocument)pdfDocument
{
  return 0;
}

- (CGImage)createImageFromPDFRenditionWithScale:(double)a3
{
  return 0;
}

- (id)data
{
  return 0;
}

- (id)assetPackIdentifier
{
  return 0;
}

- (id)externalTags
{
  return 0;
}

- (id)layerReferences
{
  return 0;
}

- (id)mipLevels
{
  return 0;
}

- (id)contentNames
{
  return 0;
}

- (double)transformation
{
  return 0.0;
}

- (int)objectVersion
{
  return 0;
}

- (id)modelAsset
{
  return 0;
}

- (id)modelMesh
{
  return 0;
}

- (id)modelSubmesh
{
  return 0;
}

- (CGSVGDocument)svgDocument
{
  return 0;
}

- (id)vectorGlyphAvailableSizes
{
  return 0;
}

- (double)vectorGlyphBaseline
{
  return 0.0;
}

- (double)vectorGlyphCapLine
{
  return 0.0;
}

- (double)vectorGlyphReferencePointSize
{
  return 0.0;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)vectorGlyphAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (float)vectorGlyphTemplateVersion
{
  return 0.0;
}

- (id)_sourceRendition
{
  return 0;
}

- (int64_t)vectorGlyphRenderingMode
{
  return 1;
}

- (unsigned)valueForTokenIdentifier:(unsigned __int16)a3
{
  int v3;
  const _renditionkeytoken *v4;
  int identifier;
  const _renditionkeytoken *v6;
  int v7;

  v3 = a3;
  v4 = -[CUIThemeRendition key](self, "key");
  identifier = v4->identifier;
  if (!v4->identifier)
    return 0;
  v6 = v4 + 1;
  while (identifier != v3)
  {
    v7 = v6->identifier;
    ++v6;
    identifier = v7;
    if (!v7)
      return 0;
  }
  return v6[-1].value;
}

- (double)opacity
{
  return self->_opacity;
}

- (int64_t)internalTemplateRenderingMode
{
  return self->_templateRenderingMode;
}

- (int)blendMode
{
  return self->_blendMode;
}

@end
