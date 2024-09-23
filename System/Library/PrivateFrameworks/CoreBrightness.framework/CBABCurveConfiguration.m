@implementation CBABCurveConfiguration

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uuid=%@ vendor=%@ productID=%@ maxB=%@ minB=%@ builtin=%d energySaving=%d"), self->_uuid, self->_vendorID, self->_productID, self->_maxBrightness, self->_minBrightness, self->_isBuiltin, self->_isEnergySaving);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBABCurveConfiguration *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBABCurveConfiguration;
  -[CBABCurveConfiguration dealloc](&v2, sel_dealloc);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSNumber)maxBrightness
{
  return self->_maxBrightness;
}

- (void)setMaxBrightness:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSNumber)minBrightness
{
  return self->_minBrightness;
}

- (void)setMinBrightness:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)isBuiltin
{
  return self->_isBuiltin;
}

- (void)setIsBuiltin:(BOOL)a3
{
  self->_isBuiltin = a3;
}

- (BOOL)isEnergySaving
{
  return self->_isEnergySaving;
}

- (void)setIsEnergySaving:(BOOL)a3
{
  self->_isEnergySaving = a3;
}

@end
