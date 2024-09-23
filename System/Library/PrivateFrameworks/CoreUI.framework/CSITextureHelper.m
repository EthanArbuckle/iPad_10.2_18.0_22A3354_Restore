@implementation CSITextureHelper

- (BOOL)expandIntoBuffer:(uint64_t)a1 error:(void *)a2
{
  uint64_t v4;
  _CSIRenditionBlockData *v5;
  id v6;
  int v7;
  uint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (!a1)
    return a1 != 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = [_CSIRenditionBlockData alloc];
  v6 = objc_msgSend(objc_msgSend(a2, "map"), "bytes");
  v7 = *(_DWORD *)(a1 + 44);
  if (v7 <= 1195456543)
  {
    if (v7 == 1095911234)
    {
      v8 = 1;
      goto LABEL_14;
    }
    if (v7 == 1195454774)
    {
      v8 = 5;
      goto LABEL_14;
    }
LABEL_13:
    v8 = 0xFFFFFFFFLL;
    goto LABEL_14;
  }
  if (v7 == 1195456544)
  {
    v8 = 2;
    goto LABEL_14;
  }
  if (v7 == 1380401717)
  {
    v8 = 6;
    goto LABEL_14;
  }
  if (v7 != 1380401751)
    goto LABEL_13;
  v8 = 4;
LABEL_14:
  v9 = (unint64_t *)-[_CSIRenditionBlockData initWithBytes:pixelWidth:pixelHeight:sourceRowbytes:pixelFormat:](v5, (uint64_t)v6, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36), *(_QWORD *)(a1 + 24), v8);
  -[_CSIRenditionBlockData setRowBytes:](v9, *(_QWORD *)(a1 + 24));
  -[_CSIRenditionBlockData expandCSIBitmapData:fromSlice:makeReadOnly:]((uint64_t)v9, *(const UInt8 **)(a1 + 8), 0, v4, 0, v10, v11, v12);
  if (v9)
    v13 = atomic_load(v9 + 5);
  else
    v13 = 0;
  *(_DWORD *)(a1 + 40) = v13;

  return a1 != 0;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->colorspaceHint);
  v3.receiver = self;
  v3.super_class = (Class)CSITextureHelper;
  -[CSITextureHelper dealloc](&v3, sel_dealloc);
}

@end
