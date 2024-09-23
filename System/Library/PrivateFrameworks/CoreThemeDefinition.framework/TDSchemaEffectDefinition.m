@implementation TDSchemaEffectDefinition

+ (unint64_t)elementDefinitionCountWithSchema:(id)a3
{
  return objc_msgSend(a3, "effectDefinitionCount");
}

+ (const)sortedElementDefinitionAtIndex:(unint64_t)a3 withSchema:(id)a4
{
  return (const $A3BFAB32BE8B8144AB428F242CA2D26A *)objc_msgSend(a4, "sortedEffectDefinitionAtIndex:", a3);
}

+ (const)elementDefinitionWithName:(id)a3 withSchema:(id)a4
{
  return (const $A3BFAB32BE8B8144AB428F242CA2D26A *)objc_msgSend(a4, "effectDefinitionWithName:", a3);
}

@end
