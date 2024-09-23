@implementation CPGroupActivityDescription

+ (id)activityContextWithDescriptionIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = specialized static CPGroupActivityDescription.activityContext(with:)(v3);

  return v4;
}

- (CPGroupActivityDescription)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CPGroupActivityDescription();
  return -[CPGroupActivityDescription init](&v3, sel_init);
}

@end
