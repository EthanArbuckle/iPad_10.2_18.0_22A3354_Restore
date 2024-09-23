@implementation ReviewContext

+ (BOOL)supportsSecureCoding
{
  return static ReviewContext.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ReviewContext.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC20AppleMediaServicesUI13ReviewContext *v5;

  v4 = a3;
  v5 = self;
  sub_2112223BC(v4);

}

- (_TtC20AppleMediaServicesUI13ReviewContext)initWithCoder:(id)a3
{
  return (_TtC20AppleMediaServicesUI13ReviewContext *)ReviewContext.init(coder:)(a3);
}

- (_TtC20AppleMediaServicesUI13ReviewContext)init
{
  ReviewContext.init()();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_22_14(OBJC_IVAR____TtC20AppleMediaServicesUI13ReviewContext_lockupStyle);
  OUTLINED_FUNCTION_22_14(OBJC_IVAR____TtC20AppleMediaServicesUI13ReviewContext_lockupDetails);
  OUTLINED_FUNCTION_22_14(OBJC_IVAR____TtC20AppleMediaServicesUI13ReviewContext_clientInfo);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
