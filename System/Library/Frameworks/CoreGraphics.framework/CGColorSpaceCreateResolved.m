@implementation CGColorSpaceCreateResolved

_QWORD *__CGColorSpaceCreateResolved_block_invoke(_QWORD *a1, _QWORD *a2)
{
  int Type;
  _QWORD *v5;

  Type = CGColorSpaceGetType(a2);
  switch(Type)
  {
    case 2:
      v5 = (_QWORD *)a1[6];
      if (v5 && *(_DWORD *)(v5[3] + 24) == 2)
        goto LABEL_13;
      break;
    case 1:
      v5 = (_QWORD *)a1[5];
      if (v5 && *(_DWORD *)(v5[3] + 24) == 1)
        goto LABEL_13;
      break;
    case 0:
      v5 = (_QWORD *)a1[4];
      if (v5)
      {
        if (!*(_DWORD *)(v5[3] + 24))
          goto LABEL_13;
      }
      break;
  }
  v5 = a2;
  if (a2)
LABEL_13:
    CFRetain(v5);
  return v5;
}

@end
