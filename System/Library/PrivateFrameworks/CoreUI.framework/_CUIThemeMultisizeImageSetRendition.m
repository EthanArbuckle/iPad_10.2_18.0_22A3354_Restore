@implementation _CUIThemeMultisizeImageSetRendition

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  _QWORD *v6;
  uint64_t var0;
  uint64_t var10;
  char *v9;
  char *v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unsigned int *v18;
  unsigned int v19;
  unint64_t v20;
  int *v21;
  double v22;
  int v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_CUIThemeMultisizeImageSetRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v25, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  var10 = a3->var10;
  var0 = a3->var11.var0;
  v9 = (char *)&a3->var0 + 4 * var0 + var10;
  v11 = *((_DWORD *)v9 + 45);
  v10 = v9 + 180;
  if (v11 != 1297303891)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIThemeMultisizeImageSetRendition.m"), 21, CFSTR("CoreUI: Expecting a kCSIMultisizeImageSetSignature but didn't find it"));
  v12 = +[NSMutableArray array](NSMutableArray, "array");
  v13 = objc_msgSend(v6, "valueForTokenIdentifier:", 15);
  v14 = objc_msgSend(v6, "valueForTokenIdentifier:", 16);
  if (*((_DWORD *)v10 + 1))
  {
    if (*((_DWORD *)v10 + 2))
    {
      v17 = 0;
      v18 = (unsigned int *)((char *)&a3->var11.var1[var0 + 6] + var10);
      do
      {
        LODWORD(v15) = *(v18 - 2);
        LODWORD(v16) = *(v18 - 1);
        v19 = *v18;
        v18 += 3;
        objc_msgSend(v12, "addObject:", -[_CUIMultisizeImageSetSizeAndIndex initWithSize:index:idiom:subtype:]([_CUIMultisizeImageSetSizeAndIndex alloc], "initWithSize:index:idiom:subtype:", v19, v13, v14, (double)v15, (double)v16));
        ++v17;
      }
      while (v17 < *((unsigned int *)v10 + 2));
    }
  }
  else if (*((_DWORD *)v10 + 2))
  {
    v20 = 0;
    v21 = (int *)((char *)&a3->var11.var1[var0 + 5] + var10);
    do
    {
      LODWORD(v15) = *(v21 - 1);
      v22 = (double)v15;
      v23 = *v21;
      v21 += 2;
      LODWORD(v15) = v23;
      objc_msgSend(v12, "addObject:", -[_CUIMultisizeImageSetSizeAndIndex initWithSize:index:idiom:subtype:]([_CUIMultisizeImageSetSizeAndIndex alloc], "initWithSize:index:idiom:subtype:", v20++, v13, v14, v22, (double)v15));
    }
    while (v20 < *((unsigned int *)v10 + 2));
  }
  v6[27] = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v12);
  return v6;
}

- (id)sizeIndexes
{
  return self->_sizeIndexes;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeMultisizeImageSetRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

@end
