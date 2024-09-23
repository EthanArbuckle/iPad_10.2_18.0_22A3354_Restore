@implementation CNContactEntityIdentifierProvider

+ (NSString)EntityTypeIdentifier
{
  void *v2;

  if (qword_1EE17E858 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18FA28330();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC8Contacts33CNContactEntityIdentifierProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNContactEntityIdentifierProvider();
  return -[CNContactEntityIdentifierProvider init](&v3, sel_init);
}

@end
