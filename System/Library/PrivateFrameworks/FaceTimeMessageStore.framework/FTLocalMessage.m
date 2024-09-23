@implementation FTLocalMessage

- (NSString)description
{
  FTLocalMessage *v2;
  void *v3;

  v2 = self;
  FTLocalMessage.description.getter();

  v3 = (void *)sub_23B3D5228();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (FTLocalMessage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (FTLocalMessage *)FTLocalMessage.init(entity:insertInto:)(v5, a4);
}

@end
