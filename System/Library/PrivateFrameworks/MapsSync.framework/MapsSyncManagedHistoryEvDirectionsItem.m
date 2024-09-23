@implementation MapsSyncManagedHistoryEvDirectionsItem

+ (Class)wrapperClass
{
  return (Class)type metadata accessor for HistoryEvDirectionsItem();
}

- (MapsSyncManagedHistoryEvDirectionsItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryEvDirectionsItem();
  return -[MapsSyncManagedHistoryDirectionsItem initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

@end
