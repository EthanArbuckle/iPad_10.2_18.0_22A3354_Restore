@implementation IDSCKAccountInfo

+ (Class)__class
{
  if (qword_1EE40B1E0 != -1)
    dispatch_once(&qword_1EE40B1E0, &unk_1E3C20838);
  return (Class)(id)qword_1EE40B1D8;
}

+ (id)alloc
{
  uint64_t v2;
  double v3;

  return objc_alloc((Class)objc_msgSend___class(a1, a2, v2, v3));
}

- (BOOL)supportsDeviceToDeviceEncryption
{
  return self->_supportsDeviceToDeviceEncryption;
}

- (void)setSupportsDeviceToDeviceEncryption:(BOOL)a3
{
  self->_supportsDeviceToDeviceEncryption = a3;
}

@end
