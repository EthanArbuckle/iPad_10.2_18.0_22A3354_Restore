@implementation FeedItem

- (NSString)description
{
  _TtC14HealthPlatform8FeedItem *v2;
  void *v3;

  v2 = self;
  FeedItem.description.getter();

  v3 = (void *)sub_1BC817AC4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC14HealthPlatform8FeedItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FeedItem();
  return -[FeedItem initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

@end
