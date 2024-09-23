@implementation NSSQLToMany

- (NSSQLToMany)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  NSSQLToMany *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLToMany;
  result = -[NSSQLRelationship initWithEntity:propertyDescription:](&v5, sel_initWithEntity_propertyDescription_, a3, a4);
  if (result)
    result->super.super._propertyType = 8;
  return result;
}

- (BOOL)isToMany
{
  return 1;
}

@end
