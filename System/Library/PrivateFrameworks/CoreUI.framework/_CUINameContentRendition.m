@implementation _CUINameContentRendition

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUINameContentRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  id *v5;
  uint64_t var10;
  unsigned int *v7;
  unsigned int *v8;
  id v9;
  unsigned int v10;
  unsigned int *v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_CUINameContentRendition;
  v5 = -[CUIThemeRendition _initWithCSIHeader:version:](&v14, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  var10 = a3->var10;
  if ((_DWORD)var10)
  {
    v7 = &a3->var11.var1[a3->var11.var0 + 1];
    v8 = (unsigned int *)((char *)v7 + var10);
    do
    {
      if (*v7 == 1013)
      {
        v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v7[2]);
        if (v7[2])
        {
          v10 = 0;
          v11 = v7 + 4;
          do
          {
            v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v11 + 1, *v11, 4);
            objc_msgSend(v9, "addObject:", v12);

            v11 = (unsigned int *)((char *)v11 + *v11 + 4);
            ++v10;
          }
          while (v10 < v7[2]);
        }

        v5[27] = v9;
      }
      v7 = (unsigned int *)((char *)v7 + v7[1] + 8);
    }
    while (v7 < v8);
  }
  return v5;
}

- (id)contentNames
{
  return self->_contentNames;
}

@end
