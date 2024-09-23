@implementation UARPMetaDataTLVString

- (UARPMetaDataTLVString)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVString;
  return -[UARPMetaDataTLV init](&v3, sel_init);
}

- (id)generateTLV:(unsigned int)a3 tlvValue:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v12;
  int v13;

  v6 = (objc_class *)MEMORY[0x24BDBCEC8];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  v13 = uarpHtonl(a3);
  objc_msgSend(v8, "appendBytes:length:", &v13, 4);
  v12 = uarpHtonl(objc_msgSend(v7, "length"));
  objc_msgSend(v8, "appendBytes:length:", &v12, 4);
  -[UARPMetaDataTLVString tlvValue:](self, "tlvValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendData:", v9);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)tlvValue:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x24BDBCE50];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "UTF8String");
  v8 = objc_msgSend(v6, "length");

  return (id)objc_msgSend(v5, "initWithBytes:length:", v7, v8);
}

@end
