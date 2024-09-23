@implementation MKSnappedRouteFillWithElements

uint64_t __MKSnappedRouteFillWithElements_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  _DWORD *v5;
  _DWORD *v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  _BOOL8 v10;

  v4 = a3;
  v5 = (_DWORD *)objc_msgSend(a2, "pointerValue");
  v6 = (_DWORD *)objc_msgSend(v4, "pointerValue");

  LODWORD(v7) = *v5 % 360;
  if ((v7 & 0x80000000) == 0)
    v7 = (int)v7;
  else
    v7 = (int)v7 + 360;
  LODWORD(v8) = *v6 % 360;
  if ((v8 & 0x80000000) == 0)
    v8 = (int)v8;
  else
    v8 = (int)v8 + 360;
  v9 = v7 >= v8;
  v10 = v7 > v8;
  if (v9)
    return v10;
  else
    return -1;
}

@end
