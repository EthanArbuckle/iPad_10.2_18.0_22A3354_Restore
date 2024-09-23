@implementation TDCursorFacetDefinition

- (void)copyAttributesInto:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TDCursorFacetDefinition;
  -[TDFacetDefinition copyAttributesInto:](&v5, sel_copyAttributesInto_);
  objc_msgSend(a3, "setValue:forKey:", -[TDCursorFacetDefinition valueForKey:](self, "valueForKey:", CFSTR("hotSpotX")), CFSTR("hotSpotX"));
  objc_msgSend(a3, "setValue:forKey:", -[TDCursorFacetDefinition valueForKey:](self, "valueForKey:", CFSTR("hotSpotY")), CFSTR("hotSpotY"));
}

- (id)copyDataFromAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v4 = -[TDCursorFacetDefinition valueForKey:](self, "valueForKey:", CFSTR("hotSpotX"));
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("hotSpotX"));
  v5 = -[TDCursorFacetDefinition valueForKey:](self, "valueForKey:", CFSTR("hotSpotY"));
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("hotSpotY"));
  v6 = -[TDCursorFacetDefinition valueForKey:](self, "valueForKey:", CFSTR("facetName"));
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("facetName"));
  v7 = -[TDFacetDefinition keySpec](self, "keySpec");
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v7, "copyDataFromAttributes"), CFSTR("keySpec"));
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0), "copy");
}

- (void)setAttributesFromCopyData:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = objc_msgSend(v4, "objectForKey:", CFSTR("hotSpotX"));
  if (v5)
    -[TDCursorFacetDefinition setValue:forKey:](self, "setValue:forKey:", v5, CFSTR("hotSpotX"));
  v6 = objc_msgSend(v4, "objectForKey:", CFSTR("hotSpotY"));
  if (v6)
    -[TDCursorFacetDefinition setValue:forKey:](self, "setValue:forKey:", v6, CFSTR("hotSpotY"));
  v7 = objc_msgSend(v4, "objectForKey:", CFSTR("facetName"));
  if (v7)
    -[TDCursorFacetDefinition setValue:forKey:](self, "setValue:forKey:", v7, CFSTR("facetName"));
}

@end
