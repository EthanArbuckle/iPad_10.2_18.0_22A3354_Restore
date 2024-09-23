@implementation VFXREStencilInfoImpl

- (MTLStencilDescriptor)_frontFaceTest
{
  return self->__frontFaceTest;
}

- (void)set_frontFaceTest:(id)a3
{
  objc_storeStrong((id *)&self->__frontFaceTest, a3);
}

- (MTLStencilDescriptor)_backFaceTest
{
  return self->__backFaceTest;
}

- (void)set_backFaceTest:(id)a3
{
  objc_storeStrong((id *)&self->__backFaceTest, a3);
}

- (unsigned)_frontReferenceValue
{
  return self->__frontReferenceValue;
}

- (void)set_frontReferenceValue:(unsigned __int8)a3
{
  self->__frontReferenceValue = a3;
}

- (unsigned)_backReferenceValue
{
  return self->__backReferenceValue;
}

- (void)set_backReferenceValue:(unsigned __int8)a3
{
  self->__backReferenceValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backFaceTest, 0);
  objc_storeStrong((id *)&self->__frontFaceTest, 0);
}

@end
