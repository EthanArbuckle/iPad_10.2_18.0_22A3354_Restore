@implementation NSString(AXFRExtras)

- (id)stringByTrimmingEmptySpaceEdges
{
  __CFString *v2;
  id v3;

  if (objc_msgSend(a1, "length"))
  {
    v2 = (__CFString *)objc_msgSend(a1, "mutableCopy");
    CFStringTrimWhitespace(v2);
    v3 = (id)-[__CFString copy](v2, "copy");

  }
  else
  {
    v3 = a1;
  }
  return v3;
}

@end
