@implementation CUINamedTexture

- (BOOL)_cacheRenditionProperties
{
  CUIThemeRendition *v3;
  CUIThemeRendition *v4;
  double v5;
  double v6;
  double v7;
  int v9;
  int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CUINamedTexture;
  LODWORD(v3) = -[CUINamedLookup _cacheRenditionProperties](&v12, sel__cacheRenditionProperties);
  if ((_DWORD)v3)
  {
    v3 = -[CUINamedLookup _rendition](self, "_rendition");
    if (v3)
    {
      v4 = v3;
      -[CUIThemeRendition scale](v3, "scale");
      self->_scale = v5;
      self->_textureProperties = (_cuintproperties)(*(_DWORD *)&self->_textureProperties & 0xFFFFFFF0 | -[CUIThemeRendition exifOrientation](v4, "exifOrientation") & 0xF);
      -[CUIThemeRendition originalUncroppedSize](v4, "originalUncroppedSize");
      if (v7 == CGSizeZero.height && v6 == CGSizeZero.width)
        v9 = 0;
      else
        v9 = 16;
      self->_textureProperties = (_cuintproperties)(v9 | *(_DWORD *)&self->_textureProperties & 0xFFFFFFEF);
      if (-[CUIThemeRendition isOpaque](v4, "isOpaque"))
        v10 = 32;
      else
        v10 = 0;
      self->_textureProperties = (_cuintproperties)(*(_DWORD *)&self->_textureProperties & 0xFFFFFFDF | v10);
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

- (CGSize)size
{
  unsigned int v2;
  unsigned int v3;
  uint64x2_t v4;
  float64x2_t v5;
  double v6;
  CGSize result;

  objc_msgSend(-[CUIThemeRendition provideTextureInfo](-[CUINamedLookup _rendition](self, "_rendition"), "provideTextureInfo"), "dimensions");
  v4.i64[0] = v2;
  v4.i64[1] = v3;
  v5 = vcvtq_f64_u64(v4);
  v6 = v5.f64[1];
  result.width = v5.f64[0];
  result.height = v6;
  return result;
}

- (CUINamedTexture)textureWithBufferAllocator:(id)a3
{
  CUIThemeRendition *v5;
  _CUTextureLink *v6;
  id v7;
  _CUTextureLink *v8;

  v5 = -[CUINamedLookup _rendition](self, "_rendition");
  if (!v5 || (id)-[CUIThemeRendition type](v5, "type") != (id)1007)
    return 0;
  v6 = objc_alloc_init(_CUTextureLink);
  -[_CUTextureLink setNamedTexture:](v6, "setNamedTexture:", self);
  -[_CUTextureLink setBufferAllocator:](v6, "setBufferAllocator:", a3);
  v7 = objc_msgSend(objc_alloc((Class)TXRTexture), "initWithDataSourceProvider:", v6);
  v8 = v6;
  return (CUINamedTexture *)v7;
}

- (int)exifOrientation
{
  return (int)(*(_DWORD *)&self->_textureProperties << 28) >> 28;
}

- (BOOL)isOpaque
{
  return (*(_BYTE *)&self->_textureProperties >> 5) & 1;
}

- (BOOL)isAlphaCropped
{
  return (*(_BYTE *)&self->_textureProperties >> 4) & 1;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  NSString *v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CUINamedTexture;
  v3 = -[CUINamedTexture description](&v11, sel_description);
  -[CUINamedTexture size](self, "size");
  v5 = v4;
  -[CUINamedTexture size](self, "size");
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("width: %f height: %f"), v5, v6);
  v8 = -[CUINamedLookup name](self, "name");
  -[CUINamedTexture scale](self, "scale");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v3, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Name: %@\nScale: %d\nSize: %@\nexifOrientation: %d,\nCropped: %d\nDisplay Gamut: %d"), v8, (int)v9, v7, -[CUINamedTexture exifOrientation](self, "exifOrientation"), -[CUINamedTexture isAlphaCropped](self, "isAlphaCropped"), -[CUIRenditionKey themeDisplayGamut](-[CUINamedLookup key](self, "key"), "themeDisplayGamut")));
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

- (double)scale
{
  return self->_scale;
}

@end
