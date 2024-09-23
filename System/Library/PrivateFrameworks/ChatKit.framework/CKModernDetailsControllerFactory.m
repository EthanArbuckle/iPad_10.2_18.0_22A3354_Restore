@implementation CKModernDetailsControllerFactory

+ (id)detailsControllerWithConversation:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  id v8;
  char *v9;

  v6 = objc_allocWithZone((Class)type metadata accessor for ModernDetailsController());
  v7 = a3;
  swift_unknownObjectRetain_n();
  v8 = v7;
  v9 = sub_18E58208C(v8, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v9;
}

- (CKModernDetailsControllerFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ModernDetailsControllerFactory();
  return -[CKModernDetailsControllerFactory init](&v3, sel_init);
}

@end
