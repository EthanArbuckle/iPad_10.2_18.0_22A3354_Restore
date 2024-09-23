@implementation _CUIThemeTextureImageRendition

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  id *v6;
  uint64_t var10;
  unsigned int *v8;
  unsigned int *v9;
  unsigned int *v10;
  signed int var6;
  CFStringRef *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CGColorSpace *v19;
  CFStringRef *v20;
  CGColorSpaceRef DeviceRGB;
  CFStringRef *v22;
  NSAssertionHandler *v23;
  uint64_t v24;
  objc_class *v25;
  NSString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _csibitmap *v34;
  unsigned int var0;
  unsigned int *v36;
  CSITextureHelper *v37;
  unint64_t v38;
  uint64_t v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)_CUIThemeTextureImageRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v41, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  v6[27] = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a3->var11.var0);
  var10 = a3->var10;
  v8 = &a3->var11.var1[a3->var11.var0 + 1];
  v9 = (unsigned int *)((char *)v8 + var10);
  v10 = 0;
  if ((_DWORD)var10)
  {
    do
    {
      if (*v8 == 1007)
      {
        v10 = v8 + 2;
      }
      else if (*v8 == 1006)
      {
        objc_msgSend(v6, "setExifOrientation:", v8[2]);
      }
      v8 = (unsigned int *)((char *)v8 + v8[1] + 8);
    }
    while (v8 < v9);
  }
  var6 = a3->var6;
  if (var6 > 1195456543)
  {
    if (var6 == 1195456544)
      goto LABEL_19;
    if (var6 == 1380401751)
    {
      if ((*((_DWORD *)a3 + 7) & 0xFu) - 3 > 2)
        v20 = (CFStringRef *)&kCGColorSpaceSRGB;
      else
        v20 = (CFStringRef *)qword_1E41B2378[(*((_DWORD *)a3 + 7) & 0xF) - 3];
      v19 = CGColorSpaceCreateWithName(*v20);
      if (!v19)
      {
        _CUILog(1, (uint64_t)"Defaulting to sRGB colorspace", v27, v28, v29, v30, v31, v32, v40);
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        goto LABEL_23;
      }
      goto LABEL_27;
    }
LABEL_24:
    v23 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v25 = (objc_class *)objc_opt_class(v6, v24);
    v26 = NSStringFromClass(v25);
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("CUIThemeRendition.m"), 2829, CFSTR("CoreUI: -[%@ %@] unknown pixel format %d"), v26, NSStringFromSelector(a2), a3->var6);
    v19 = 0;
    goto LABEL_27;
  }
  if (var6 == 1095911234)
  {
    v22 = (CFStringRef *)&kCGColorSpaceGenericRGB;
    if ((*((_DWORD *)a3 + 7) & 0xF) != 0)
      v22 = (CFStringRef *)&kCGColorSpaceSRGB;
    DeviceRGB = CGColorSpaceCreateWithName(*v22);
    goto LABEL_23;
  }
  if (var6 != 1195454774)
    goto LABEL_24;
  if ((*((_DWORD *)a3 + 7) & 0xF) == 6)
    v12 = (CFStringRef *)&kCGColorSpaceExtendedGray;
  else
    v12 = (CFStringRef *)&kCGColorSpaceGenericGrayGamma2_2;
  v19 = CGColorSpaceCreateWithName(*v12);
  if (!v19)
  {
    _CUILog(1, (uint64_t)"Defaulting to Device Gray colorspace", v13, v14, v15, v16, v17, v18, v40);
LABEL_19:
    DeviceRGB = CGColorSpaceCreateDeviceGray();
LABEL_23:
    v19 = DeviceRGB;
  }
LABEL_27:
  if (a3->var11.var0)
  {
    v33 = 0;
    do
    {
      v34 = (_csibitmap *)((char *)v9 + a3->var11.var1[v33]);
      if (!v33)
      {
        var0 = v34->var1.var0;
        v36 = (unsigned int *)objc_msgSend(v6, "renditionFlags");
        *v36 = *v36 & 0xFFFFFFFD | (2 * ((var0 >> 1) & 1));
      }
      v37 = objc_alloc_init(CSITextureHelper);
      v37->bmp = v34;
      v37->colorspaceHint = CGColorSpaceRetain(v19);
      if (v10)
        v38 = *v10;
      else
        v38 = 0;
      v37->sourceRowbytes = v38;
      v37->width = a3->var3;
      v37->height = a3->var4;
      v37->pixelFormat = a3->var6;
      objc_msgSend(v6[27], "addObject:", v37);

      ++v33;
    }
    while (v33 < a3->var11.var0);
  }
  CGColorSpaceRelease(v19);
  return v6;
}

- (int)pixelFormat
{
  return *((_DWORD *)-[NSData bytes](-[CUIThemeRendition srcData](self, "srcData"), "bytes") + 6);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeTextureImageRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (id)textureImages
{
  return self->_textureImages;
}

@end
