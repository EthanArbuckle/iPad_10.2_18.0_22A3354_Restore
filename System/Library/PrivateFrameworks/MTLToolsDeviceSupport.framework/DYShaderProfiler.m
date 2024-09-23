@implementation DYShaderProfiler

- (DYShaderProfiler)init
{
  DYShaderProfiler *v2;
  DYShaderProfiler *v3;
  DYShaderProfiler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DYShaderProfiler;
  v2 = -[DYShaderProfiler init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)extractShaderBinaryTextSegment:(id)a3
{
  id v3;
  id v4;
  _DWORD *v5;
  _DWORD *v6;
  int i;
  int v8;
  _DWORD *v9;

  v3 = a3;
  objc_msgSend(v3, "binary");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (_DWORD *)objc_msgSend(v4, "bytes");

  if (v5)
  {
    v6 = v5 + 8;
    for (i = v5[4]; i; --i)
    {
      if (*v6 == 25)
        break;
      v6 = (_DWORD *)((char *)v6 + v6[1]);
    }
    v8 = v6[16];
    if (v8)
    {
      v9 = v6 + 22;
      while (*v9 != 1163157343 || *(_DWORD *)((char *)v9 + 3) != 5527621)
      {
        v9 += 20;
        if (!--v8)
          goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", (char *)v5 + v9[8], v9[6]);
      v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_12:
      v5 = 0;
    }
  }

  return v5;
}

@end
