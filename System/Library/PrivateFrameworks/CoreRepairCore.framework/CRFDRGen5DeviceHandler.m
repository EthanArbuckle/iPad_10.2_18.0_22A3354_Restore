@implementation CRFDRGen5DeviceHandler

+ (BOOL)isGen5ProductType:(int)a3
{
  BOOL result;
  uint64_t v4;

  result = 1;
  if (*(uint64_t *)&a3 > 2688879998)
  {
    if (*(_QWORD *)&a3 == 2688879999)
      return result;
    v4 = 2940697645;
  }
  else
  {
    if (*(_QWORD *)&a3 == 1434404433)
      return result;
    v4 = 2021146989;
  }
  if (*(_QWORD *)&a3 != v4)
    return 0;
  return result;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRFDRGen5DeviceHandler *v4;

  if (objc_msgSend_isGen5ProductType_(CRFDRGen5DeviceHandler, a2, *(uint64_t *)&a3, v3))
    v4 = objc_alloc_init(CRFDRGen5DeviceHandler);
  else
    v4 = 0;
  return v4;
}

@end
