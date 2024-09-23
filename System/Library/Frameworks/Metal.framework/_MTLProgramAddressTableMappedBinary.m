@implementation _MTLProgramAddressTableMappedBinary

- (_MTLProgramAddressTableMappedBinary)initWithMappedAddress:(unint64_t)a3 mappedSize:(unint64_t)a4 binaryUniqueId:(unint64_t)a5
{
  _MTLProgramAddressTableMappedBinary *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MTLProgramAddressTableMappedBinary;
  result = -[_MTLProgramAddressTableMappedBinary init](&v9, sel_init);
  if (result)
  {
    result->_mappedAddress = a3;
    result->_mappedSize = a4;
    result->_binaryUniqueId = a5;
    result->_type = (NSString *)&stru_1E0FE5DC8;
  }
  return result;
}

- (_MTLProgramAddressTableMappedBinary)initWithMappedAddress:(unint64_t)a3 mappedSize:(unint64_t)a4 binaryUniqueId:(unint64_t)a5 type:(id)a6
{
  _MTLProgramAddressTableMappedBinary *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_MTLProgramAddressTableMappedBinary;
  result = -[_MTLProgramAddressTableMappedBinary init](&v11, sel_init);
  if (result)
  {
    result->_mappedAddress = a3;
    result->_mappedSize = a4;
    result->_binaryUniqueId = a5;
    result->_type = (NSString *)a6;
  }
  return result;
}

- (unint64_t)mappedAddress
{
  return self->_mappedAddress;
}

- (unint64_t)mappedSize
{
  return self->_mappedSize;
}

- (unint64_t)binaryUniqueId
{
  return self->_binaryUniqueId;
}

- (NSString)type
{
  return self->_type;
}

@end
