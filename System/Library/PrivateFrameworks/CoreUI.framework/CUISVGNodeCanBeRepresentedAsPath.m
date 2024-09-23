@implementation CUISVGNodeCanBeRepresentedAsPath

uint64_t __CUISVGNodeCanBeRepresentedAsPath_block_invoke(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t AttributeMap;
  _QWORD v10[7];

  if (!a3)
  {
    v10[5] = v4;
    v10[6] = v5;
    v8 = result;
    result = CGSVGNodeGetType(*(_QWORD *)(result + 40));
    if ((_DWORD)result != 2)
    {
      if ((_DWORD)result != 3)
        return result;
      goto LABEL_4;
    }
    AttributeMap = CGSVGNodeGetAttributeMap(a2);
    result = CGSVGAttributeMapGetAttribute(AttributeMap, 18);
    v10[0] = 0;
    if (result)
    {
      result = CGSVGAttributeGetPaint(result, v10);
      if ((_DWORD)result)
      {
        result = CGSVGPaintGetType(v10[0]);
        if ((int)result >= 1)
        {
LABEL_4:
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 32) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
  }
  return result;
}

@end
