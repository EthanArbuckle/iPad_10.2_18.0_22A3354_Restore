@implementation UARPTLVPayloadCompressionAlgorithm

- (UARPTLVPayloadCompressionAlgorithm)init
{
  UARPTLVPayloadCompressionAlgorithm *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPayloadCompressionAlgorithm;
  result = -[UARPMetaDataTLV init](&v3, sel_init);
  if (result)
  {
    *(&result->super._tlvLength + 1) = -858619636;
    result->_tlvType = 4;
  }
  return result;
}

- (unsigned)tlvType
{
  return *(&self->super._tlvLength + 1);
}

- (unsigned)tlvLength
{
  return self->_tlvType;
}

- (int)compressionAlgorithm
{
  return self->_tlvLength;
}

- (void)setCompressionAlgorithm:(int)a3
{
  UARPTLVPayloadCompressionAlgorithm *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_tlvLength = a3;
  objc_sync_exit(obj);

}

- (id)generateTLV
{
  id v3;
  void *v4;
  void *v5;
  int v7;
  int v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v8 = uarpHtonl(*(&self->super._tlvLength + 1));
  objc_msgSend(v3, "appendBytes:length:", &v8, 4);
  v7 = uarpHtonl(self->_tlvType);
  objc_msgSend(v3, "appendBytes:length:", &v7, 4);
  -[UARPTLVPayloadCompressionAlgorithm tlvValue](self, "tlvValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v4);

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tlvValue
{
  int v3;

  v3 = uarpHtonl(self->_tlvLength);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v3, 4);
}

+ (id)metaDataTableEntry
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Payload Compression Algorithm"), CFSTR("Name"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24CEC0F98, CFSTR("Value"));
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = (void *)objc_opt_new();
    if (objc_msgSend(v4, "compare:", CFSTR("LZBitmapFast2")))
      v6 = 1;
    else
      v6 = 2 * (objc_msgSend(v4, "compare:", CFSTR("LZBitmap2")) != 0);
    objc_msgSend(v5, "setCompressionAlgorithm:", v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  void *v5;

  if (a3 == 4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setCompressionAlgorithm:", uarpHtonl(*(_DWORD *)a4));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
