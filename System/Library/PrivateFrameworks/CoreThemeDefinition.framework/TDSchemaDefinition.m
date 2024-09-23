@implementation TDSchemaDefinition

- (id)previewImage
{
  id result;

  result = (id)objc_msgSend((id)-[TDSchemaDefinition parts](self, "parts"), "count");
  if (result)
    return (id)objc_msgSend((id)objc_msgSend((id)-[TDSchemaDefinition parts](self, "parts"), "anyObject"), "previewImage");
  return result;
}

- (id)displayName
{
  int64_t v3;
  id result;

  v3 = +[CoreThemeDocument targetPlatformForMOC:](CoreThemeDocument, "targetPlatformForMOC:", -[TDSchemaDefinition managedObjectContext](self, "managedObjectContext"));
  result = (id)objc_msgSend((id)objc_opt_class(), "elementDefinitionWithName:withSchema:", -[TDSchemaDefinition name](self, "name"), objc_msgSend(MEMORY[0x24BE28C80], "schemaForPlatform:", v3));
  if (result)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)result + 1));
  return result;
}

+ (unint64_t)elementDefinitionCountWithSchema:(id)a3
{
  NSLog(CFSTR("Error: Calling +elementDefinition:withSchema: on abstract TDSchemaDefinition class"), a2, a3);
  return 0;
}

+ (const)sortedElementDefinitionAtIndex:(unint64_t)a3 withSchema:(id)a4
{
  NSLog(CFSTR("Error: Calling +sortedElementDefinitionAtIndex:withSchema: on abstract TDSchemaDefinition class"), a2, a3, a4);
  return 0;
}

+ (const)elementDefinitionWithName:(id)a3 withSchema:(id)a4
{
  NSLog(CFSTR("Error: Calling +elementDefinitionWithName: on abstract TDSchemaDefinition class"), a2, a3, a4);
  return 0;
}

@end
