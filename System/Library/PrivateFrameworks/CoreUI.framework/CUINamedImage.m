@implementation CUINamedImage

- (int)exifOrientation
{
  return (*(_DWORD *)&self->_imageProperties >> 8) & 0xF;
}

- (BOOL)hasSliceInformation
{
  return (*(_BYTE *)&self->_imageProperties >> 1) & 1;
}

- (int64_t)templateRenderingMode
{
  return (uint64_t)(int)(*(_DWORD *)&self->_imageProperties << 24) >> 29;
}

- (CUINamedImage)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  CUINamedImage *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CUINamedImage;
  v6 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v14, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4, a5);
  if ((id)-[CUIThemeRendition type](-[CUINamedLookup _rendition](v6, "_rendition"), "type") == (id)1000)
  {
    _CUILog(4, (uint64_t)"CoreUI: attempting to lookup a named image '%@' with a type that is not a data type in the AssetCatalog", v7, v8, v9, v10, v11, v12, (uint64_t)a3);

    return 0;
  }
  return v6;
}

- (BOOL)_cacheRenditionProperties
{
  _BOOL4 v3;
  CUIThemeRendition *v4;
  CUIThemeRendition *v5;
  unsigned int v6;
  double v7;
  int v8;
  double v9;
  double v10;
  int v12;
  int v13;
  unsigned int v14;
  _cuiniproperties v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CUINamedImage;
  v3 = -[CUINamedLookup _cacheRenditionProperties](&v28, sel__cacheRenditionProperties);
  if (v3)
  {
    v4 = -[CUINamedLookup _rendition](self, "_rendition");
    if (v4)
    {
      v5 = v4;
      v6 = -[CUINamedLookup _distilledInVersion](self, "_distilledInVersion");
      -[CUIThemeRendition scale](v5, "scale");
      self->_scale = v7;
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFFFFE | -[CUIThemeRendition isVectorBased](v5, "isVectorBased"));
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFFFFD | (2 * (-[CUIThemeRendition type](v5, "type") != 0)));
      if (objc_msgSend(-[CUIThemeRendition metrics](v5, "metrics"), "hasAlignmentEdgeMargins"))
        v8 = 4;
      else
        v8 = 0;
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFFFFB | v8);
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFFFE7 | (8 * (-[CUINamedImage resizingModeWithSubtype:](self, "resizingModeWithSubtype:", -[CUIThemeRendition subtype](v5, "subtype")) & 3)));
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFF0FF | ((-[CUIThemeRendition exifOrientation](v5, "exifOrientation") & 0xF) << 8));
      self->_imageProperties = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFFFF1F | (32 * (-[CUIThemeRendition templateRenderingMode](v5, "templateRenderingMode") & 7)));
      -[CUIThemeRendition originalUncroppedSize](v5, "originalUncroppedSize");
      if (v10 == CGSizeZero.height && v9 == CGSizeZero.width)
        v12 = 0;
      else
        v12 = 4096;
      self->_imageProperties = (_cuiniproperties)(v12 | *(_DWORD *)&self->_imageProperties & 0xFFFFEFFF);
      if (-[CUIThemeRendition isFlippable](v5, "isFlippable"))
        v13 = 0x2000;
      else
        v13 = 0;
      v14 = *(_DWORD *)&self->_imageProperties & 0xFFFFDFFF | v13;
      self->_imageProperties = (_cuiniproperties)v14;
      if (v6 - 461 > 0x17)
      {
        if (-[CUIThemeRendition preservedVectorRepresentation](v5, "preservedVectorRepresentation"))
          v26 = 0x8000;
        else
          v26 = 0;
        v15 = (_cuiniproperties)(*(_DWORD *)&self->_imageProperties & 0xFFFF7FFF | v26);
      }
      else
      {
        v15 = (_cuiniproperties)(v14 | 0x8000);
      }
      self->_imageProperties = v15;
      LOBYTE(v3) = 1;
    }
    else
    {
      v16 = -[CUINamedLookup storageRef](self, "storageRef");
      v18 = (void *)_LookupStructuredThemeProvider(v16, v17);
      v19 = -[CUINamedLookup name](self, "name");
      -[CUINamedLookup storageRef](self, "storageRef");
      objc_msgSend(objc_msgSend(v18, "themeStore"), "path");
      _CUILog(4, (uint64_t)"CoreUI: could not find rendition for '%@' in %d:'%@'", v20, v21, v22, v23, v24, v25, (uint64_t)v19);
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (int64_t)resizingModeWithSubtype:(int64_t)a3
{
  return (unint64_t)a3 > 0x1E || ((1 << a3) & 0x40900800) == 0;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)alignmentEdgeInsets
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  if (-[CUINamedImage hasAlignmentInformation](self, "hasAlignmentInformation"))
  {
    v3 = -[CUIThemeRendition metrics](-[CUINamedLookup _rendition](self, "_rendition"), "metrics");
    if (v3)
    {
      v4 = v3;
      -[CUINamedImage scale](self, "scale");
      v6 = v5;
      objc_msgSend(v4, "edgeBottomLeftMargin");
      v8 = v7;
      objc_msgSend(v4, "edgeBottomLeftMargin");
      v10 = v9;
      objc_msgSend(v4, "edgeTopRightMargin");
      v12 = v11;
      objc_msgSend(v4, "edgeTopRightMargin");
      v14 = v13;
      if (v6 <= 1.0)
        v15 = 1.0;
      else
        v15 = 1.0 / v6;
      v16 = v15 * v12;
      v17 = v15 * v10;
      v18 = v8 * v15;
      v19 = v15 * v14;
    }
    else
    {
      v19 = 0.0;
      v17 = 0.0;
      v18 = 0.0;
      v16 = 0.0;
    }
  }
  else
  {
    v16 = 0.0;
    v18 = 0.0;
    v17 = 0.0;
    v19 = 0.0;
  }
  result.var3 = v19;
  result.var2 = v17;
  result.var1 = v18;
  result.var0 = v16;
  return result;
}

- (BOOL)hasAlignmentInformation
{
  return (*(_BYTE *)&self->_imageProperties >> 2) & 1;
}

- (double)scale
{
  return self->_scale;
}

- (CGImage)image
{
  return -[CUIThemeRendition uncroppedImage](-[CUINamedLookup _rendition](self, "_rendition"), "uncroppedImage");
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  objc_msgSend(-[CUIThemeRendition sliceInformation](-[CUINamedLookup _rendition](self, "_rendition"), "sliceInformation"), "edgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CUINamedImage scale](self, "scale");
  if (v11 >= 1.0)
    v12 = v11;
  else
    v12 = 1.0;
  v13 = v4 / v12;
  v14 = v6 / v12;
  v15 = v8 / v12;
  v16 = v10 / v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (id)baseKey
{
  return -[CUIRenditionKey copy](-[CUINamedLookup renditionKey](self, "renditionKey"), "copy");
}

- (BOOL)preservedVectorRepresentation
{
  return *((unsigned __int8 *)&self->_imageProperties + 1) >> 7;
}

- (BOOL)isFlippable
{
  return (*((unsigned __int8 *)&self->_imageProperties + 1) >> 5) & 1;
}

- (int64_t)resizingMode
{
  return (uint64_t)(int)(*(_DWORD *)&self->_imageProperties << 27) >> 30;
}

- (CGImage)croppedImage
{
  return -[CUIThemeRendition unslicedImage](-[CUINamedLookup _rendition](self, "_rendition"), "unslicedImage");
}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  double width;
  double height;
  CGSize result;

  -[CUINamedImage scale](self, "scale");
  v4 = v3;
  -[CUIThemeRendition unslicedSize](-[CUINamedLookup _rendition](self, "_rendition"), "unslicedSize");
  if (v4 == 0.0)
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  else
  {
    width = v5 / v4;
    height = v6 / v4;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)imageType
{
  int64_t result;

  result = -[CUIThemeRendition type](-[CUINamedLookup _rendition](self, "_rendition"), "type");
  if ((unint64_t)(result - 1) >= 5)
    return 0;
  return result;
}

- (double)positionOfSliceBoundary:(unsigned int)a3
{
  double result;

  objc_msgSend(-[CUIThemeRendition sliceInformation](-[CUINamedLookup _rendition](self, "_rendition"), "sliceInformation"), "positionOfSliceBoundary:", a3);
  return result;
}

- (double)opacity
{
  double result;

  -[CUIThemeRendition opacity](-[CUINamedLookup _rendition](self, "_rendition"), "opacity");
  return result;
}

- (int)blendMode
{
  return -[CUIThemeRendition blendMode](-[CUINamedLookup _rendition](self, "_rendition"), "blendMode");
}

- (BOOL)isVectorBased
{
  return *(_DWORD *)&self->_imageProperties & 1;
}

- (BOOL)isTemplate
{
  return (-[CUIThemeRendition templateRenderingMode](-[CUINamedLookup _rendition](self, "_rendition"), "templateRenderingMode") & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (BOOL)isStructured
{
  return (id)-[CUIRenditionKey themeElement](-[CUINamedLookup key](self, "key"), "themeElement") == (id)101;
}

- (BOOL)isAlphaCropped
{
  return (*((unsigned __int8 *)&self->_imageProperties + 1) >> 4) & 1;
}

- (id)description
{
  CUIRenditionKey *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  NSString *v14;
  uint64_t v15;
  NSString *v16;
  NSString *v17;
  id v18;
  objc_super v19;

  v3 = -[CUINamedLookup key](self, "key");
  v19.receiver = self;
  v19.super_class = (Class)CUINamedImage;
  v18 = -[CUINamedImage description](&v19, sel_description);
  -[CUINamedImage size](self, "size");
  v5 = v4;
  -[CUINamedImage size](self, "size");
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("width: %f height: %f"), v5, v6);
  -[CUINamedImage edgeInsets](self, "edgeInsets");
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nEdge insets top: %f left: %f bottom: %f right: %f"), v7, v8, v9, v10);
  v16 = -[CUINamedLookup name](self, "name");
  -[CUINamedImage scale](self, "scale");
  v15 = (int)v11;
  -[CUINamedImage opacity](self, "opacity");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v18, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nDevice Idiom: %d\nDevice Subtype: %d\nHorizontal Size Class: %d\nVertical Size Class: %d\nImage Identifier: %d"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Name: %@\nScale: %d\nOpacity: %f\nSize: %@\nBlend Mode: %d\nResizing Mode: %d\nVector Based: %d\nTemplateRenderingMode: %ld\nEdgeInset: %@\nexifOrientation: %d,\nCropped: %d\nDisplay Gamut: %d\nLayout Direction: %d\nisFlippable: %d"), v16, v15, v12, v17, -[CUINamedImage blendMode](self, "blendMode"), -[CUINamedImage resizingMode](self, "resizingMode"), -[CUINamedImage isVectorBased](self, "isVectorBased"),
               -[CUINamedImage templateRenderingMode](self, "templateRenderingMode"),
               v14,
               -[CUINamedImage exifOrientation](self, "exifOrientation"),
               -[CUINamedImage isAlphaCropped](self, "isAlphaCropped"),
               -[CUIRenditionKey themeDisplayGamut](v3, "themeDisplayGamut"),
               -[CUIRenditionKey themeDirection](v3, "themeDirection"),
               -[CUINamedImage isFlippable](self, "isFlippable")),
             -[CUIRenditionKey themeIdiom](v3, "themeIdiom"),
             -[CUIRenditionKey themeSubtype](v3, "themeSubtype"),
             -[CUIRenditionKey themeSizeClassHorizontal](v3, "themeSizeClassHorizontal"),
             -[CUIRenditionKey themeSizeClassVertical](v3, "themeSizeClassVertical"),
             -[CUIRenditionKey themeIdentifier](v3, "themeIdentifier")));
}

- (CGImage)createImageFromPDFRenditionWithScale:(double)a3
{
  if ((id)-[CUIThemeRendition type](-[CUINamedLookup _rendition](self, "_rendition"), "type") == (id)9)
    return -[CUIThemeRendition createImageFromPDFRenditionWithScale:](-[CUINamedLookup _rendition](self, "_rendition"), "createImageFromPDFRenditionWithScale:", a3);
  else
    return 0;
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

- (CGRect)alphaCroppedRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CUIThemeRendition alphaCroppedRect](-[CUINamedLookup _rendition](self, "_rendition"), "alphaCroppedRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end
