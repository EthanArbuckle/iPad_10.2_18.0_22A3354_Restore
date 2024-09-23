@implementation _CUIRawDataRendition

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  _QWORD *v6;
  char *v7;
  char *v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned int *v15;
  unsigned int v16;
  _CUISubrangeData *v17;
  NSAssertionHandler *v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_CUIRawDataRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v23, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  if (a3->var6 != 1145132097)
  {
    v19 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    v21 = (objc_class *)objc_opt_class(v6, v20);
    v22 = NSStringFromClass(v21);
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("CUIThemeRendition.m"), 2289, CFSTR("CoreUI: -[%@ %@] pixel format must be kCSIPixelFormatRawData"), v22, NSStringFromSelector(a2));
  }
  v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  v9 = *((_DWORD *)v7 + 45);
  v8 = v7 + 180;
  v10 = *((_DWORD *)v8 + 2);
  v11 = bswap32(v10);
  if (v9 == 1146569042)
    v12 = v11;
  else
    v12 = v10;
  v13 = v8 - (_BYTE *)objc_msgSend(objc_msgSend(v6, "srcData"), "bytes") + 12;
  v14 = *((_DWORD *)v8 + 1);
  v15 = (unsigned int *)objc_msgSend(v6, "renditionFlags");
  v16 = *v15 & 0xFFFFFFC3;
  if (v14)
  {
    *v15 = v16 | 0x10;
    v17 = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", objc_msgSend(v6, "srcData"), v13, v12);
    v6[27] = CUIUncompressDataWithLZFSE((const __CFData *)v17);

  }
  else
  {
    *v15 = v16;
    v6[27] = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", objc_msgSend(v6, "srcData"), v13, v12);
  }
  return v6;
}

- (id)data
{
  return self->_dataBytes;
}

- (void)dealloc
{
  NSData *dataBytes;
  objc_super v4;

  dataBytes = self->_dataBytes;
  if (dataBytes)
    CFRelease(dataBytes);
  v4.receiver = self;
  v4.super_class = (Class)_CUIRawDataRendition;
  -[CUIThemeRendition dealloc](&v4, sel_dealloc);
}

- (int)pixelFormat
{
  return 1145132097;
}

@end
