@implementation CBATTRequest

- (CBATTRequest)initWithCentral:(id)a3 characteristic:(id)a4 offset:(unint64_t)a5 transactionID:(id)a6
{
  id v11;
  id v12;
  id v13;
  CBATTRequest *v14;
  CBATTRequest *v15;
  NSMutableData *value;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CBATTRequest;
  v14 = -[CBATTRequest init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_central, a3);
    objc_storeStrong((id *)&v15->_characteristic, a4);
    v15->_offset = a5;
    objc_storeStrong((id *)&v15->_transactionID, a6);
    value = v15->_value;
    v15->_value = 0;

    v15->_ignoreResponse = 0;
  }

  return v15;
}

- (unint64_t)endOffset
{
  unint64_t offset;

  offset = self->_offset;
  return -[NSMutableData length](self->_value, "length") + offset;
}

- (void)appendValueData:(id)a3
{
  NSMutableData *value;
  objc_class *v5;
  id v6;
  NSMutableData *v7;
  NSMutableData *v8;
  id v9;

  value = self->_value;
  if (value)
  {
    v9 = a3;
    -[NSMutableData appendData:](value, "appendData:", v9);

  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0C99DF0];
    v6 = a3;
    v7 = (NSMutableData *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v8 = self->_value;
    self->_value = v7;

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p Central = %@, Characteristic = %@, Offset = %lu, Value = %@>"), objc_opt_class(), self, self->_central, self->_characteristic, self->_offset, self->_value);
}

- (NSData)value
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setValue:(NSData *)value
{
  objc_setProperty_atomic_copy(self, a2, value, 8);
}

- (CBCentral)central
{
  return self->_central;
}

- (CBCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void)setCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_characteristic, a3);
}

- (NSUInteger)offset
{
  return self->_offset;
}

- (NSNumber)transactionID
{
  return self->_transactionID;
}

- (BOOL)ignoreResponse
{
  return self->_ignoreResponse;
}

- (void)setIgnoreResponse:(BOOL)a3
{
  self->_ignoreResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
  objc_storeStrong((id *)&self->_central, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
