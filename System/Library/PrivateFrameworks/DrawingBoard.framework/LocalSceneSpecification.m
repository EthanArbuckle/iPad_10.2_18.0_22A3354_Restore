@implementation LocalSceneSpecification

- (BOOL)isInternal
{
  return 1;
}

- (NSString)uiSceneSessionRole
{
  _TtC12DrawingBoard23LocalSceneSpecification *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_23A70D438();

  return (NSString *)v3;
}

- (Class)uiSceneMinimumClass
{
  type metadata accessor for LocalWindowScene();
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSArray)defaultExtensions
{
  _TtC12DrawingBoard23LocalSceneSpecification *v2;
  _QWORD *v3;
  void *v4;

  v2 = self;
  v3 = sub_23A6DED58();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569AF548);
    v4 = (void *)sub_23A70D48C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (_TtC12DrawingBoard23LocalSceneSpecification)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocalSceneSpecification();
  return -[LocalSceneSpecification init](&v3, sel_init);
}

@end
