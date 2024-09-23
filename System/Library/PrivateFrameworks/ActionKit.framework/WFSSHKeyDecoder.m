@implementation WFSSHKeyDecoder

- (WFSSHKeyDecoder)initWithData:(id)a3
{
  id v4;
  WFSSHKeyDecoder *v5;
  uint64_t v6;
  NSData *data;
  WFSSHKeyDecoder *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSSHKeyDecoder;
  v5 = -[WFSSHKeyDecoder init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_offset = 0;
    v5->_length = objc_msgSend(v4, "length");
    v8 = v5;
  }

  return v5;
}

- (const)currentPointer
{
  id v3;
  const char *v4;

  -[WFSSHKeyDecoder data](self, "data");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)(objc_msgSend(v3, "bytes") + self->_offset);

  return v4;
}

- (void)advanceBy:(unint64_t)a3
{
  unint64_t length;

  length = self->_offset + a3;
  if (length >= self->_length)
    length = self->_length;
  self->_offset = length;
}

- (unsigned)decodeInteger
{
  unsigned int v2;

  if (self->_offset + 4 > self->_length)
    return 0;
  v2 = bswap32(*(_DWORD *)-[WFSSHKeyDecoder currentPointer](self, "currentPointer"));
  -[WFSSHKeyDecoder advanceBy:](self, "advanceBy:", 4);
  return v2;
}

- (id)decodeStringWithLength:(unint64_t)a3
{
  void *v3;

  if (self->_offset + a3 <= self->_length)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", -[WFSSHKeyDecoder currentPointer](self, "currentPointer"), a3, 4);
    -[WFSSHKeyDecoder advanceBy:](self, "advanceBy:", a3);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)decodeStringWithPrecedingLength
{
  return -[WFSSHKeyDecoder decodeStringWithLength:](self, "decodeStringWithLength:", -[WFSSHKeyDecoder decodeInteger](self, "decodeInteger"));
}

- (id)decodeDataWithLength:(unint64_t)a3
{
  void *v3;
  void *v6;

  if (self->_offset + a3 <= self->_length)
  {
    -[WFSSHKeyDecoder data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subdataWithRange:", -[WFSSHKeyDecoder offset](self, "offset"), a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFSSHKeyDecoder advanceBy:](self, "advanceBy:", a3);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)decodeDataWithPrecedingLength
{
  return -[WFSSHKeyDecoder decodeDataWithLength:](self, "decodeDataWithLength:", -[WFSSHKeyDecoder decodeInteger](self, "decodeInteger"));
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
