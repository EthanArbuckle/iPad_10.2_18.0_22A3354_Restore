@implementation HTMLToSuper_S_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  objc_msgSend(a4, "incrementStrikethroughCount", a3);
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  MEMORY[0x1E0DE7D20](a4, sel_decrementStrikethroughCount);
}

@end
