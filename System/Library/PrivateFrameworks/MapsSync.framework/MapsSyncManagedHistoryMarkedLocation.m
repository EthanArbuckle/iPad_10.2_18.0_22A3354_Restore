@implementation MapsSyncManagedHistoryMarkedLocation

+ (Class)wrapperClass
{
  return (Class)type metadata accessor for HistoryMarkedLocation();
}

- (MapsSyncManagedHistoryMarkedLocation)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryMarkedLocation();
  return -[MapsSyncManagedHistoryItem initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

@end
