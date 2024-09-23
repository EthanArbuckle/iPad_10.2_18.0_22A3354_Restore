@implementation NSScanner(ECMessageBodyHTMLParserExtras)

- (uint64_t)_rangeOfFirstMatchWithRegularExpression:()ECMessageBodyHTMLParserExtras
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_msgSend(a1, "string");
  v6 = objc_msgSend(a1, "scanLocation");
  return objc_msgSend(a3, "rangeOfFirstMatchInString:options:range:", v5, 0, v6, objc_msgSend(v5, "length") - v6);
}

- (BOOL)ec_scanUpToRegularExpression:()ECMessageBodyHTMLParserExtras
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "_rangeOfFirstMatchWithRegularExpression:");
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "setScanLocation:", v2);
  return v2 != 0x7FFFFFFFFFFFFFFFLL;
}

@end
