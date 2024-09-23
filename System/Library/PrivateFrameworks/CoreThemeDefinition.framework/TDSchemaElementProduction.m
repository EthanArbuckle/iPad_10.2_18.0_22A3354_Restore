@implementation TDSchemaElementProduction

- (id)relativePath
{
  NSLog(CFSTR("-[TDSchemaElementProduction relativePath] DEPRECATED: Is this even used anywhere?"), a2);
  return 0;
}

- (id)associatedFileURLWithDocument:(id)a3
{
  NSLog(CFSTR("-[TDSchemaElementProduction associatedFileURL] DEPRECATED: Is this even used anywhere?"), a2, a3);
  return 0;
}

- (void)generateNewRendition
{
  TDSchemaRenditionSpec *v3;

  v3 = -[TDSchemaRenditionSpec initWithEntity:insertIntoManagedObjectContext:]([TDSchemaRenditionSpec alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDSchemaElementProduction entity](self, "entity"), "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("SchemaRenditionSpec")), -[TDSchemaElementProduction managedObjectContext](self, "managedObjectContext"));
  -[TDSchemaElementProduction addRenditionsObject:](self, "addRenditionsObject:", v3);

  -[TDRenditionSpec resetToBaseKeySpec](v3, "resetToBaseKeySpec");
}

@end
