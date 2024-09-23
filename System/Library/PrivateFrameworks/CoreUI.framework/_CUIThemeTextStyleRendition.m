@implementation _CUIThemeTextStyleRendition

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  _QWORD *v6;
  char *v7;
  int v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_CUIThemeTextStyleRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v10, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  v8 = *((_DWORD *)v7 + 45);
  v6[27] = v7 + 180;
  if (v8 != 1398036812)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIThemeTextStyleRendition.m"), 21, CFSTR("CoreUI: Expecting a kCSITextStyleSignature but didn't find it"));
  return v6;
}

- (const)csiTextStyle
{
  return self->_csiTextStyle;
}

@end
