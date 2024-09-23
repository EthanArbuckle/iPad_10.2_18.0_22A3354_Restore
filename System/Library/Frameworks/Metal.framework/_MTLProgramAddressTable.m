@implementation _MTLProgramAddressTable

- (_MTLProgramAddressTable)initWithEncoderMappings:(id)a3 perInvocationMappings:(id)a4 internalMappings:(id)a5
{
  _MTLProgramAddressTable *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MTLProgramAddressTable;
  v8 = -[_MTLProgramAddressTable init](&v10, sel_init);
  if (v8)
  {
    v8->_binaryMappingsEncoderInternal = (NSArray *)objc_msgSend(a3, "copy");
    v8->_binaryMappingsPerInvocation = (NSArray *)objc_msgSend(a4, "copy");
    v8->_encoderInternalBinaries = (NSDictionary *)objc_msgSend(a5, "copy");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLProgramAddressTable;
  -[_MTLProgramAddressTable dealloc](&v3, sel_dealloc);
}

- (NSArray)binaryMappingsEncoderInternal
{
  return self->_binaryMappingsEncoderInternal;
}

- (NSArray)binaryMappingsPerInvocation
{
  return self->_binaryMappingsPerInvocation;
}

- (NSDictionary)encoderInternalBinaries
{
  return self->_encoderInternalBinaries;
}

@end
