@implementation _CUIThemeColorRendition

- (CGColor)cgColor
{
  CGColor *result;
  CGColorSpace *v4;
  const _csicolor *csiColor;
  uint64_t var5;
  const CGFloat *v7;
  uint64_t *var6;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  result = self->_cgColor;
  if (!result)
  {
    v4 = (CGColorSpace *)-[_CUIThemeColorRendition _colorSpaceWithID:]((uint64_t)self, *((unsigned __int8 *)self->_csiColor + 8));
    csiColor = self->_csiColor;
    var5 = csiColor->var5;
    v7 = (const CGFloat *)((char *)&v11 - ((8 * var5 + 15) & 0xFFFFFFFF0));
    if ((_DWORD)var5)
    {
      var6 = (uint64_t *)csiColor->var6;
      v9 = (uint64_t *)((char *)&v11 - ((8 * var5 + 15) & 0xFFFFFFFF0));
      do
      {
        v10 = *var6++;
        *v9++ = v10;
        --var5;
      }
      while (var5);
    }
    self->_cgColor = CGColorCreate(v4, v7);
    return self->_cgColor;
  }
  return result;
}

- (uint64_t)_colorSpaceWithID:(uint64_t)result
{
  if (result)
  {
    switch(a2)
    {
      case 2:
        result = _CUIColorSpaceGetGrayGamma2_2();
        break;
      case 3:
        result = _CUIColorSpaceGetDisplayP3();
        break;
      case 4:
        result = _CUIColorSpaceGetExtendedRangeSRGB();
        break;
      case 5:
        result = _CUIColorSpaceGetExtendedLinearSRGB();
        break;
      case 6:
        result = _CUIColorSpaceGetExtendedGray();
        break;
      default:
        result = _CUIColorSpaceGetSRGB();
        break;
    }
  }
  return result;
}

- (BOOL)substituteWithSystemColor
{
  return (*((_BYTE *)self->_csiColor + 9) & 7) != 0;
}

- (id)systemColorName
{
  return self->_colorName;
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  _QWORD *v6;
  char *v7;
  char *v8;
  int v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_CUIThemeColorRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v15, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  v9 = *((_DWORD *)v7 + 45);
  v8 = v7 + 180;
  v6[28] = v8;
  v10 = v8;
  if (v9 != 1129270354)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIThemeColorRendition.m"), 25, CFSTR("CoreUI: Expecting a kCSIColorSignature but didn't find it"));
    v10 = (char *)v6[28];
  }
  if ((*((_DWORD *)v10 + 2) & 0x700) == 0x100)
  {
    v11 = &v8[8 * *((unsigned int *)v10 + 3)];
    v13 = *((_DWORD *)v11 + 4);
    v12 = v11 + 16;
    if (v13 != 1129270354)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIThemeColorRendition.m"), 34, CFSTR("CoreUI: Expecting a kCSIColorSignature but didn't find it in the extension"));
    if (*((_DWORD *)v12 + 1) == 1)
      v6[29] = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v12 + 12, *((unsigned int *)v12 + 2), 4);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_cgColor);
  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeColorRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (const)csiColor
{
  return self->_csiColor;
}

@end
