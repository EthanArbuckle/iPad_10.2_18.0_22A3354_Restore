@implementation FBKSubmissionError

- (NSDictionary)serverErrorDetails
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Feedback18FBKSubmissionError_serverErrorDetails);
  swift_beginAccess();
  if (!*v2)
    return (NSDictionary *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_22DE1F238();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)setServerErrorDetails:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = sub_22DE1F244();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Feedback18FBKSubmissionError_serverErrorDetails);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSError)underlyingError
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Feedback18FBKSubmissionError_underlyingError);
  swift_beginAccess();
  return (NSError *)*v2;
}

- (void)setUnderlyingError:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Feedback18FBKSubmissionError_underlyingError);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSString)description
{
  void **v3;
  void *v4;
  _TtC8Feedback18FBKSubmissionError *v5;
  id v6;
  id v7;
  void *v8;

  v3 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Feedback18FBKSubmissionError_underlyingError);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  v6 = v4;
  v7 = objc_msgSend(v6, sel_description);
  sub_22DE1F2B0();

  v8 = (void *)sub_22DE1F28C();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_255DB8DC0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_255DB8DC0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Feedback18FBKSubmissionError *v5;

  v4 = a3;
  v5 = self;
  sub_22DDD1814(v4);

}

- (_TtC8Feedback18FBKSubmissionError)initWithCoder:(id)a3
{
  id v3;
  _TtC8Feedback18FBKSubmissionError *v4;

  v3 = a3;
  v4 = (_TtC8Feedback18FBKSubmissionError *)sub_22DDD1CD4();

  return v4;
}

- (_TtC8Feedback18FBKSubmissionError)init
{
  _TtC8Feedback18FBKSubmissionError *result;

  result = (_TtC8Feedback18FBKSubmissionError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
