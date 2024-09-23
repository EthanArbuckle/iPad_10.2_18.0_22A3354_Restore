@implementation IMXMLParserContext

- (IMXMLParserContext)initWithContent:(id)a3
{
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  return (IMXMLParserContext *)MEMORY[0x1E0DE7D20](self, sel_initWithContentAsData_);
}

- (IMXMLParserContext)initWithContentAsData:(id)a3
{
  IMXMLParserContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMXMLParserContext;
  v4 = -[IMXMLParserContext init](&v6, sel_init);
  if (v4)
  {
    v4->_inContentAsData = (NSData *)a3;
    -[IMXMLParserContext reset](v4, "reset");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMXMLParserContext;
  -[IMXMLParserContext dealloc](&v3, sel_dealloc);
}

- (id)inContent
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_inContentAsData, 4);
}

- (NSString)name
{
  return (NSString *)CFSTR("Base");
}

- (NSArray)resultsForLogging
{
  return 0;
}

- (NSData)inContentAsData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

@end
