@implementation NATagActivityItemsConfiguration

- (NATagActivityItemsConfiguration)initWithTag:(id)a3
{
  void *v4;

  swift_getObjectType();
  v4 = (void *)swift_unknownObjectRetain();
  return (NATagActivityItemsConfiguration *)sub_1BB660EA8(v4, self);
}

- (NATagActivityItemsConfiguration)initWithObjects:(id)a3
{
  objc_class *ObjectType;
  void *v5;
  NATagActivityItemsConfiguration *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1BA4EFE00(0, (unint64_t *)&unk_1EF2AE2D0);
  sub_1BB872DB4();
  v5 = (void *)sub_1BB872D9C();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[NATagActivityItemsConfiguration initWithObjects:](&v8, sel_initWithObjects_, v5);

  return v6;
}

- (NATagActivityItemsConfiguration)initWithItemProviders:(id)a3
{
  objc_class *ObjectType;
  void *v5;
  NATagActivityItemsConfiguration *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1BAA5CA20();
  sub_1BB872DB4();
  v5 = (void *)sub_1BB872D9C();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[NATagActivityItemsConfiguration initWithItemProviders:](&v8, sel_initWithItemProviders_, v5);

  return v6;
}

@end
