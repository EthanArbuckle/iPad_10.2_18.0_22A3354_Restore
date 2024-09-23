@implementation NSHTTPURLResponseInternal

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTTPURLResponseInternal;
  -[NSHTTPURLResponseInternal dealloc](&v3, sel_dealloc);
}

- (NSHTTPURLResponseInternal)initWithCoder:(id)a3
{
  const __CFDictionary *v5;
  char *ResponseNoParser;
  int v8;

  v5 = (const __CFDictionary *)objc_msgSend(a3, "decodeObject");
  v8 = 0;
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v8, 4);
  ResponseNoParser = _CFHTTPMessageCreateResponseNoParser(0, v8, 0, CFSTR("HTTP/1.1"));
  if (v5 && -[__CFDictionary count](v5, "count"))
    _CFHTTPMessageSetMultipleHeaderFields((__CFHTTPMessage *)ResponseNoParser, v5);

  return (NSHTTPURLResponseInternal *)ResponseNoParser;
}

@end
