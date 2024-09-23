@implementation GDAutonamingViewIdentifierTypeInner

+ (GDAutonamingViewIdentifierTypeInner)phPerson
{
  return (GDAutonamingViewIdentifierTypeInner *)static AutonamingViewIdentifierType.phPerson.getter();
}

- (GDAutonamingViewIdentifierTypeInner)init
{
  AutonamingViewIdentifierType.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
