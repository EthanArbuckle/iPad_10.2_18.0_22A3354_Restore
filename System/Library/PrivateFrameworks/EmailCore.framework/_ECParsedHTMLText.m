@implementation _ECParsedHTMLText

- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  unint64_t v5;

  v5 = -[_ECParsedHTMLNode startLocation](self, "startLocation");
  objc_msgSend(a3, "appendRange:ofString:", v5, -[_ECParsedHTMLNode endLocation](self, "endLocation") - v5, -[_ECParsedHTMLNode htmlString](self, "htmlString"));
  return 0;
}

- (id)description
{
  ECMessageBodyStringAccumulator *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;

  v3 = -[ECMessageBodyStringAccumulator initWithOptions:lengthLimit:]([ECMessageBodyStringAccumulator alloc], "initWithOptions:lengthLimit:", 0, 81);
  -[ECMessageBodyStringAccumulator appendInnerTextWithConsumableNode:](v3, "appendInnerTextWithConsumableNode:", self);
  v4 = -[ECMessageBodyStringAccumulator accumulatedString](v3, "accumulatedString");
  if (-[NSString length](v4, "length") > 0x50)
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@...\"), -[NSString substringToIndex:](v4, "substringToIndex:", 80));
  else
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), v4);
  v6 = (void *)v5;

  return v6;
}

@end
