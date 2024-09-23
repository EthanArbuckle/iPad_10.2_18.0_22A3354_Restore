@implementation IMAttributedStringParserContext

- (IMAttributedStringParserContext)initWithAttributedString:(id)a3
{
  IMAttributedStringParserContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMAttributedStringParserContext;
  v4 = -[IMAttributedStringParserContext init](&v6, sel_init);
  if (v4)
    v4->_inString = (NSAttributedString *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMAttributedStringParserContext;
  -[IMAttributedStringParserContext dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return (NSString *)CFSTR("Base");
}

- (NSArray)resultsForLogging
{
  return 0;
}

- (BOOL)shouldPreprocess
{
  return 0;
}

- (id)parser:(id)a3 preprocessedAttributesForAttributes:(id)a4 range:(_NSRange)a5
{
  return a4;
}

- (NSAttributedString)inString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8, 1);
}

@end
