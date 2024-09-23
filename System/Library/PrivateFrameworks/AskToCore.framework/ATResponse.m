@implementation ATResponse

- (_TtC5AskTo10ATQuestion)originalQuestion
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  return (_TtC5AskTo10ATQuestion *)*v2;
}

- (void)setOriginalQuestion:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSString)responderHandle
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setResponderHandle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_236B1654C();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC5AskTo14ATAnswerChoice)chosenAnswer
{
  return (_TtC5AskTo14ATAnswerChoice *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9AskToCore10ATResponse)initWithCoder:(id)a3
{
  return (_TtC9AskToCore10ATResponse *)ATResponse.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9AskToCore10ATResponse *v5;

  v4 = a3;
  v5 = self;
  ATResponse.encode(with:)((NSCoder)v4);

}

- (id)copyWithZone:(void *)a3
{
  id v4;
  _TtC9AskToCore10ATResponse *v5;
  id v6;
  void *v7;

  v4 = objc_allocWithZone((Class)swift_getObjectType());
  v5 = self;
  v6 = sub_236B15AC0((uint64_t)v5);

  v7 = (void *)sub_236B168A0();
  return v7;
}

- (NSString)description
{
  _TtC9AskToCore10ATResponse *v2;
  void *v3;

  v2 = self;
  ATResponse.description.getter();

  v3 = (void *)sub_236B16540();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC9AskToCore10ATResponse)init
{
  _TtC9AskToCore10ATResponse *result;

  result = (_TtC9AskToCore10ATResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
