@implementation MRVirtualTouchDeviceDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id result;

  v5 = (void *)objc_opt_class();
  if (!self)
    return 0;
  result = (id)objc_msgSend((id)objc_msgSend(v5, "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_absolute;
  *((_BYTE *)result + 9) = self->_integratedDisplay;
  *(_MRHIDSize *)((char *)result + 12) = self->_screenSize;
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v5;
  id result;

  v5 = (void *)objc_opt_class();
  if (!self)
    return 0;
  result = (id)objc_msgSend((id)objc_msgSend(v5, "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_absolute;
  *((_BYTE *)result + 9) = self->_integratedDisplay;
  *(_MRHIDSize *)((char *)result + 12) = self->_screenSize;
  return result;
}

- (BOOL)isAbsolute
{
  return self->_absolute;
}

- (BOOL)isIntegratedDisplay
{
  return self->_integratedDisplay;
}

- (_MRHIDSize)screenSize
{
  float width;
  float height;
  _MRHIDSize result;

  width = self->_screenSize.var0.width;
  height = self->_screenSize.var0.height;
  result.var0.height = height;
  result.var0.width = width;
  return result;
}

@end
