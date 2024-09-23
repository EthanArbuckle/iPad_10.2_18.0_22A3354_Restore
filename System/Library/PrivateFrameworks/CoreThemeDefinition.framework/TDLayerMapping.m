@implementation TDLayerMapping

- (id)copyDataFromAttributes
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v4 = -[TDLayerMapping valueForKey:](self, "valueForKey:", CFSTR("photoshopLayerIndex"));
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("photoshopLayerIndex"));
  v5 = (void *)-[TDLayerMapping valueForKey:](self, "valueForKey:", CFSTR("themeDrawingLayer"));
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v5, "identifier")), CFSTR("themeDrawingLayer"));
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0), "copy");
}

- (void)setAttributesFromCopyData:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0), "objectForKey:", CFSTR("photoshopLayerIndex"));
  if (v4)
    -[TDLayerMapping setValue:forKey:](self, "setValue:forKey:", v4, CFSTR("photoshopLayerIndex"));
}

@end
