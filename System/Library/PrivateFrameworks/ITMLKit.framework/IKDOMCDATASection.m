@implementation IKDOMCDATASection

- (id)nodeName
{
  return CFSTR("#cdata-section");
}

- (int64_t)nodeType
{
  return 4;
}

@end
