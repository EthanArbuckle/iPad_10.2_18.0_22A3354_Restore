@implementation ATQuestionTopic

- (NSString)rawValue
{
  return (NSString *)sub_236B0B01C();
}

- (ATQuestionTopic)initWithRawValue:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = sub_236B1654C();
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ATQuestionTopic_rawValue);
  *v6 = v5;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[ATQuestionTopic init](&v9, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  return sub_236B0DE4C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))ATQuestion.Topic.isEqual(_:));
}

- (int64_t)hash
{
  ATQuestionTopic *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_236B165AC();

  return v3;
}

- (ATQuestionTopic)init
{
  ATQuestionTopic *result;

  result = (ATQuestionTopic *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
