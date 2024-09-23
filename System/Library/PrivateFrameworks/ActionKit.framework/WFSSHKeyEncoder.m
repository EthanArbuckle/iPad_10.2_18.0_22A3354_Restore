@implementation WFSSHKeyEncoder

- (WFSSHKeyEncoder)init
{
  WFSSHKeyEncoder *v2;
  uint64_t v3;
  NSMutableData *data;
  WFSSHKeyEncoder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSSHKeyEncoder;
  v2 = -[WFSSHKeyEncoder init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

    v5 = v2;
  }

  return v2;
}

- (unint64_t)encodedLength
{
  void *v2;
  unint64_t v3;

  -[WFSSHKeyEncoder data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (NSData)encodedData
{
  void *v2;
  void *v3;

  -[WFSSHKeyEncoder data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSData *)v3;
}

- (void)encodeChar:(char)a3
{
  char v3;

  v3 = a3;
  -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", &v3, 1);
}

- (void)encodeInteger:(unsigned int)a3
{
  unsigned int v3;

  v3 = bswap32(a3);
  -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", &v3, 4);
}

- (void)encodeString:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableData *data;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);
  data = self->_data;
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  -[NSMutableData appendBytes:length:](data, "appendBytes:length:", objc_msgSend(v8, "bytes"), v5);

}

- (void)encodeStringWithPreceedingLength:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableData *data;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);
  -[WFSSHKeyEncoder encodeInteger:](self, "encodeInteger:", v5);
  data = self->_data;
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  -[NSMutableData appendBytes:length:](data, "appendBytes:length:", objc_msgSend(v8, "bytes"), v5);

}

- (void)encodeData:(id)a3
{
  -[NSMutableData appendData:](self->_data, "appendData:", a3);
}

- (void)encodeDataWithPreceedingLength:(id)a3
{
  id v4;

  v4 = a3;
  -[WFSSHKeyEncoder encodeInteger:](self, "encodeInteger:", objc_msgSend(v4, "length"));
  -[WFSSHKeyEncoder encodeData:](self, "encodeData:", v4);

}

- (NSMutableData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
