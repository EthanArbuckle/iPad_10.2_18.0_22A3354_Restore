@implementation HTMLToSuper_A_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  uint64_t v10;
  void *v11;
  id v12;

  v12 = (id)IMCopyNormalizedAttributes(a8, 1, 0);
  v10 = objc_msgSend(v12, "objectForKey:", CFSTR("href"));
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v10);
    if (v11)
    {
      objc_msgSend(a4, "pushLink:", v11);
      self->_shouldPopLink = 1;
    }

  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  if (self->_shouldPopLink)
    MEMORY[0x1E0DE7D20](a4, sel_popLink);
}

@end
