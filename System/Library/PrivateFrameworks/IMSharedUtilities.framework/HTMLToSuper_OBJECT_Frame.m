@implementation HTMLToSuper_OBJECT_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  if (objc_msgSend(a8, "objectForKey:", CFSTR("breadcrumbText"), a4, a5, a6, a7))
  {
    objc_msgSend((id)objc_msgSend(a8, "_stringForKey:", CFSTR("breadcrumbOptions")), "unsignedIntValue");
    MEMORY[0x1E0DE7D20](a4, sel_appendBreadcrumbText_withOptions_);
  }
}

@end
