@implementation DKDAAPWriterContainer

- (DKDAAPWriterContainer)initWithCode:(unsigned int)a3
{
  DKDAAPWriterContainer *v4;
  DKDAAPWriterContainer *v5;
  NSMutableData *v6;
  NSMutableData *childData;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DKDAAPWriterContainer;
  v4 = -[DKDAAPWriterContainer init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_code = a3;
    v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    childData = v5->_childData;
    v5->_childData = v6;

  }
  return v5;
}

- (id)formattedOutputData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEC8];
  -[DKDAAPWriterContainer childData](self, "childData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithCapacity:", objc_msgSend(v4, "length") + 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9[0]) = bswap32(-[DKDAAPWriterContainer code](self, "code"));
  -[DKDAAPWriterContainer childData](self, "childData", v9[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v9[0]) = bswap32(objc_msgSend(v6, "length"));

  objc_msgSend(v5, "appendBytes:length:", v9, 8);
  -[DKDAAPWriterContainer childData](self, "childData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendData:", v7);

  return v5;
}

- (unsigned)code
{
  return self->_code;
}

- (NSMutableData)childData
{
  return self->_childData;
}

- (void)setChildData:(id)a3
{
  objc_storeStrong((id *)&self->_childData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childData, 0);
}

@end
