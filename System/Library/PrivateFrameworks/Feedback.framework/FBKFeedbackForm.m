@implementation FBKFeedbackForm

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Feedback15FBKFeedbackForm *v5;

  v4 = a3;
  v5 = self;
  sub_22DE0916C(v4);

}

- (_TtC8Feedback15FBKFeedbackForm)initWithCoder:(id)a3
{
  return (_TtC8Feedback15FBKFeedbackForm *)FBKFeedbackForm.init(coder:)(a3);
}

- (_TtC8Feedback15FBKFeedbackForm)init
{
  _TtC8Feedback15FBKFeedbackForm *result;

  result = (_TtC8Feedback15FBKFeedbackForm *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Feedback15FBKFeedbackForm_localizedAttributedLegalString));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
