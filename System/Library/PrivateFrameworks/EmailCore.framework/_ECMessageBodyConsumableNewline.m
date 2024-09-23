@implementation _ECMessageBodyConsumableNewline

- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  if ((objc_msgSend(a3, "isFull") & 1) == 0)
    objc_msgSend(a3, "appendNewline");
  return 0;
}

@end
