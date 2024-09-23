@implementation CoreThemeConstantMigrationPolicy

- (BOOL)beginEntityMapping:(id)a3 manager:(id)a4 error:(id *)a5
{
  return objc_msgSend(a3, "mappingType") != 2
      || +[TDThemeSchema loadThemeConstantsForEntity:inContext:](TDThemeSchema, "loadThemeConstantsForEntity:inContext:", objc_msgSend(a4, "destinationEntityForEntityMapping:", a3), objc_msgSend(a4, "destinationContext"));
}

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CoreThemeConstantMigrationPolicy;
  return -[NSEntityMigrationPolicy createDestinationInstancesForSourceInstance:entityMapping:manager:error:](&v7, sel_createDestinationInstancesForSourceInstance_entityMapping_manager_error_, a3, a4, a5, a6);
}

@end
