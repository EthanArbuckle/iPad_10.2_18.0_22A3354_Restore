@implementation GPKInternalHandle

- (GPKInternalHandle)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a4;
  return (GPKInternalHandle *)Handle.init(entity:insertInto:)(a3, a4);
}

@end
