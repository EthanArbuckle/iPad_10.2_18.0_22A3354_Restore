@implementation HTMLToSuper_BR_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  objc_msgSend(a4, "appendString:", CFSTR("\n"));
}

@end
