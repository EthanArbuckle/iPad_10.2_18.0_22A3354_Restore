@implementation _ECMessageBodyHTMLElement

- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  return (id)-[NSArray copy](-[ECMessageBodyElement nodes](self, "nodes", a3), "copy");
}

@end
