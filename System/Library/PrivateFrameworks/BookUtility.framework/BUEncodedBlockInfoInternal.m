@implementation BUEncodedBlockInfoInternal

- (BUEncodedBlockInfoInternal)initWithEncodedLength:(unint64_t)a3
{
  BUEncodedBlockInfoInternal *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BUEncodedBlockInfoInternal;
  result = -[BUEncodedBlockInfoInternal init](&v5, sel_init);
  if (result)
    result->_encodedLength = a3;
  return result;
}

- (unint64_t)decodedLength
{
  return self->_encodedLength;
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  BOOL v5;

  BUProtocolCast(&unk_254B6FE28, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = BUEncodedBlockInfoAreEqual(self, v4);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_encodedLength(self, a2, v2);
  return objc_msgSend_decodedLength(self, v5, v6) ^ v4;
}

- (NSString)description
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend_encodedLength(self, a2, v2);
  v8 = objc_msgSend_decodedLength(self, v6, v7);
  return (NSString *)objc_msgSend_stringWithFormat_(v4, v9, (uint64_t)CFSTR("[EncodedLength=%zu; DecodedLength=%zu]"),
                       v5,
                       v8);
}

- (unint64_t)encodedLength
{
  return self->_encodedLength;
}

@end
