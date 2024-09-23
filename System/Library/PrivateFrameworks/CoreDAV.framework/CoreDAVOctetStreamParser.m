@implementation CoreDAVOctetStreamParser

- (CoreDAVOctetStreamParser)init
{
  CoreDAVOctetStreamParser *v2;
  NSMutableData *v3;
  NSMutableData *octetStreamData;
  NSError *parserError;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CoreDAVOctetStreamParser;
  v2 = -[CoreDAVOctetStreamParser init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    octetStreamData = v2->_octetStreamData;
    v2->_octetStreamData = v3;

    parserError = v2->_parserError;
    v2->_parserError = 0;

  }
  return v2;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CoreDAVOctetStreamParser;
  -[CoreDAVOctetStreamParser description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)processData:(id)a3 forTask:(id)a4
{
  id v5;
  void *v6;

  if (a3)
  {
    v5 = a3;
    -[CoreDAVOctetStreamParser octetStreamData](self, "octetStreamData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendData:", v5);

  }
  return 1;
}

- (NSError)parserError
{
  return self->_parserError;
}

+ (BOOL)canHandleContentType:(id)a3
{
  return 1;
}

- (NSMutableData)octetStreamData
{
  return self->_octetStreamData;
}

- (void)setOctetStreamData:(id)a3
{
  objc_storeStrong((id *)&self->_octetStreamData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parserError, 0);
  objc_storeStrong((id *)&self->_octetStreamData, 0);
}

@end
