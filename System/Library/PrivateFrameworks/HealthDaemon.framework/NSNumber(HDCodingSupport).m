@implementation NSNumber(HDCodingSupport)

- (_BYTE)hk_hasFloatingPointValue
{
  _BYTE *result;

  result = (_BYTE *)objc_msgSend(objc_retainAutorelease(a1), "objCType");
  if (result)
    return (_BYTE *)((*result & 0xFD) == 100);
  return result;
}

@end
