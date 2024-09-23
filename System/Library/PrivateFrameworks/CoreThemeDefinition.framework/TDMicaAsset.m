@implementation TDMicaAsset

- (id)_productionWithRenditionsInProductions:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  v4 = (void *)objc_msgSend(a3, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("renditions != nil")));
  v5 = objc_msgSend(v4, "count");
  if (!v5)
  {
    v7 = 0;
    v8 = CFSTR("WARNING: No production of %@ has any renditions.");
    goto LABEL_5;
  }
  v6 = v5;
  v7 = (void *)objc_msgSend(v4, "objectAtIndex:", 0);
  if (v6 != 1)
  {
    v8 = CFSTR("WARNING: No active productions for %@, and more than one has renditions");
LABEL_5:
    NSLog(&v8->isa, -[TDAsset sourceRelativePath](self, "sourceRelativePath"));
  }
  return v7;
}

- (BOOL)hasCursorProduction
{
  return 0;
}

- (id)production
{
  void *v3;
  uint64_t v4;
  id result;

  v3 = (void *)objc_msgSend((id)-[TDMicaAsset productions](self, "productions"), "allObjects");
  v4 = objc_msgSend(v3, "count");
  if (v4 <= 1)
    result = 0;
  else
    result = -[TDMicaAsset _productionWithRenditionsInProductions:](self, "_productionWithRenditionsInProductions:", v3);
  if (v4 >= 1 && !result)
    return (id)objc_msgSend(v3, "objectAtIndex:", 0);
  return result;
}

- (BOOL)hasProduction
{
  return -[TDMicaAsset production](self, "production") != 0;
}

- (id)copyDataFromAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v4 = -[TDMicaAsset valueForKey:](self, "valueForKey:", CFSTR("category"));
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("category"));
  v5 = -[TDMicaAsset valueForKey:](self, "valueForKey:", CFSTR("name"));
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("name"));
  v6 = (void *)-[TDMicaAsset valueForKey:](self, "valueForKey:", CFSTR("source"));
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v6, "valueForKey:", CFSTR("path")), CFSTR("source"));
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0), "copy");
}

- (void)setAttributesFromCopyData:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = objc_msgSend(v4, "objectForKey:", CFSTR("category"));
  if (v5)
    -[TDMicaAsset setValue:forKey:](self, "setValue:forKey:", v5, CFSTR("category"));
  v6 = objc_msgSend(v4, "objectForKey:", CFSTR("name"));
  if (v6)
    -[TDMicaAsset setValue:forKey:](self, "setValue:forKey:", v6, CFSTR("name"));
}

@end
