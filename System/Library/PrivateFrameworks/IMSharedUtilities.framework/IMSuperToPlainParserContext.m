@implementation IMSuperToPlainParserContext

- (IMSuperToPlainParserContext)initWithAttributedString:(id)a3
{
  return (IMSuperToPlainParserContext *)MEMORY[0x1E0DE7D20](self, sel_initWithAttributedString_extractLinks_);
}

- (IMSuperToPlainParserContext)initWithAttributedString:(id)a3 extractLinks:(BOOL)a4
{
  IMSuperToPlainParserContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMSuperToPlainParserContext;
  v6 = -[IMFromSuperParserContext initWithAttributedString:](&v8, sel_initWithAttributedString_);
  if (v6)
  {
    v6->_mutablePlainString = (NSMutableString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(a3, "length"));
    v6->_extractLinks = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMSuperToPlainParserContext;
  -[IMFromSuperParserContext dealloc](&v3, sel_dealloc);
}

- (id)name
{
  return CFSTR("SuperToPlain");
}

- (id)resultsForLogging
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("plainString"), 0);
}

- (NSString)plainString
{
  return (NSString *)MEMORY[0x1E0DE7D20](self->_mutablePlainString, sel___stringByStrippingAttachmentAndControlCharacters);
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6
{
  void *v8;
  BOOL v9;
  void *v10;

  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0D365F0]), "absoluteString");
  v9 = !self->_extractLinks || v8 == 0;
  if (v9 || (v10 = v8, (objc_msgSend(v8, "isEqualToString:", a6) & 1) != 0))
    -[NSMutableString appendString:](self->_mutablePlainString, "appendString:", a6);
  else
    -[NSMutableString appendFormat:](self->_mutablePlainString, "appendFormat:", CFSTR("%@ <%@>"), a6, v10);
}

- (NSMutableString)mutablePlainString
{
  return self->_mutablePlainString;
}

@end
