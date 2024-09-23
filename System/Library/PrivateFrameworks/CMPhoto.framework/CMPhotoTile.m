@implementation CMPhotoTile

- (void)setDecodedSurface:(__IOSurface *)a3
{
  __IOSurface *decodedSurface;
  __IOSurface *v6;

  decodedSurface = self->_decodedSurface;
  if (decodedSurface != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      decodedSurface = self->_decodedSurface;
    }
    if (decodedSurface)
    {
      IOSurfaceDecrementUseCount(decodedSurface);
      v6 = self->_decodedSurface;
      if (v6)
        CFRelease(v6);
    }
    self->_decodedSurface = a3;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[CMPhotoTile setKey:](self, "setKey:", 0);
  -[CMPhotoTile setDecodedSurface:](self, "setDecodedSurface:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CMPhotoTile;
  -[CMPhotoTile dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t ID;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _BOOL4 v15;
  const __CFString *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  ID = IOSurfaceGetID(-[CMPhotoTile decodedSurface](self, "decodedSurface"));
  -[CMPhotoTile imageRect](self, "imageRect");
  v9 = _NSStringFromCGRect(v5, v6, v7, v8);
  -[CMPhotoTile contentsRect](self, "contentsRect");
  v14 = _NSStringFromCGRect(v10, v11, v12, v13);
  v15 = -[CMPhotoTile visible](self, "visible");
  v16 = CFSTR("NO");
  if (v15)
    v16 = CFSTR("YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<CMPhotoTile: %p; surface %4x; imageRect %@; contentsRect %@, visible: %@"),
               self,
               ID,
               v9,
               v14,
               v16);
}

- (__IOSurface)decodedSurface
{
  return self->_decodedSurface;
}

- (CGRect)imageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageRect.origin.x;
  y = self->_imageRect.origin.y;
  width = self->_imageRect.size.width;
  height = self->_imageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setImageRect:(CGRect)a3
{
  self->_imageRect = a3;
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  self->_contentsRect = a3;
}

- (id)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

@end
