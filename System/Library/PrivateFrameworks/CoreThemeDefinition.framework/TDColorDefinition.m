@implementation TDColorDefinition

- (void)copyAttributesInto:(id)a3
{
  objc_msgSend(a3, "setValue:forKey:", -[TDColorDefinition valueForKey:](self, "valueForKey:", CFSTR("physicalColor")), CFSTR("physicalColor"));
  objc_msgSend(a3, "setValue:forKey:", -[TDColorDefinition valueForKey:](self, "valueForKey:", CFSTR("name")), CFSTR("name"));
}

- (id)dataFromAttributes
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v4 = (void *)-[TDColorDefinition valueForKey:](self, "valueForKey:", CFSTR("name"));
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("name"));
  objc_msgSend(v3, "setObject:forKey:", -[TDColorDefinition valueForKey:](self, "valueForKey:", CFSTR("physicalColor")), CFSTR("physicalColor"));
  return (id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
}

- (void)setAttributesFromData:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = (void *)-[TDColorDefinition managedObjectContext](self, "managedObjectContext");
  v6 = objc_msgSend(v4, "objectForKey:", CFSTR("name"));
  if (v6)
    -[TDColorDefinition setValue:forKey:](self, "setValue:forKey:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6))), CFSTR("name"));
  v7 = objc_msgSend(v4, "objectForKey:", CFSTR("physicalColor"));
  if (v7)
    -[TDColorDefinition setValue:forKey:](self, "setValue:forKey:", v7, CFSTR("physicalColor"));
}

- (id)copyDataFromAttributes
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v4 = -[TDColorDefinition valueForKey:](self, "valueForKey:", CFSTR("physicalColor"));
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("physicalColor"));
  v5 = (void *)-[TDColorDefinition valueForKey:](self, "valueForKey:", CFSTR("colorStatus"));
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v5, "valueForKey:", CFSTR("identifier")), CFSTR("colorStatus"));
  v6 = (void *)-[TDColorDefinition valueForKey:](self, "valueForKey:", CFSTR("name"));
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v6, "valueForKey:", CFSTR("selector")), CFSTR("selector"));
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0), "copy");
}

- (void)setAttributesFromCopyData:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0), "objectForKey:", CFSTR("physicalColor"));
  if (v4)
    -[TDColorDefinition setValue:forKey:](self, "setValue:forKey:", v4, CFSTR("physicalColor"));
}

@end
