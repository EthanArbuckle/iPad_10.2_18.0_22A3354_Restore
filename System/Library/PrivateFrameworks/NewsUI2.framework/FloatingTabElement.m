@implementation FloatingTabElement

- (NSString)description
{
  return (NSString *)sub_1D602EE80(self, (uint64_t)a2, (void (*)(void))sub_1D602E718);
}

- (_TtC7NewsUI218FloatingTabElement)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5
{
  objc_class *ObjectType;
  id v8;
  void *v9;
  void *v10;
  _TtC7NewsUI218FloatingTabElement *v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1D6E26978();
  sub_1D6E26978();
  v8 = a5;
  v9 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  v13.receiver = self;
  v13.super_class = ObjectType;
  v11 = -[_UITabElement initWithIdentifier:title:image:](&v13, sel_initWithIdentifier_title_image_, v9, v10, v8);

  return v11;
}

@end
