@implementation TDLayerReference

- (id)cuiLayerReference
{
  id v3;
  void *v4;
  float v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BE28C70]);
  v4 = (void *)objc_msgSend((id)-[TDLayerReference reference](self, "reference"), "baseKeySpec");
  objc_msgSend(v3, "setLayerName:", -[TDLayerReference name](self, "name"));
  -[TDAbstractLayerReference frameRect](self, "frameRect");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend((id)-[TDLayerReference opacity](self, "opacity"), "floatValue");
  objc_msgSend(v3, "setOpacity:", v5);
  objc_msgSend(v3, "setBlendMode:", objc_msgSend((id)-[TDLayerReference blendMode](self, "blendMode"), "intValue"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C68]), "initWithKeyList:", objc_msgSend(v4, "key"));
  objc_msgSend(v3, "setReferenceKey:", v6);

  objc_msgSend((id)objc_msgSend(v3, "referenceKey"), "setThemeScale:", 0);
  return v3;
}

@end
