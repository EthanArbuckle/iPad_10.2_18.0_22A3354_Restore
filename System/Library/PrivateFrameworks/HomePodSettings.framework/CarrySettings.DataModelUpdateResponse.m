@implementation CarrySettings.DataModelUpdateResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO15HomePodSettings13CarrySettings23DataModelUpdateResponse)initWithCoder:(id)a3
{
  return (_TtCO15HomePodSettings13CarrySettings23DataModelUpdateResponse *)CarrySettings.DataModelUpdateResponse.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtCO15HomePodSettings13CarrySettings23DataModelUpdateResponse *v5;

  v4 = a3;
  v5 = self;
  CarrySettings.DataModelUpdateResponse.encode(with:)((NSCoder)v4);

}

- (BOOL)isEqual:(id)a3
{
  _TtCO15HomePodSettings13CarrySettings23DataModelUpdateResponse *v4;
  _TtCO15HomePodSettings13CarrySettings23DataModelUpdateResponse *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22DFDDBB0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = CarrySettings.DataModelUpdateResponse.isEqual(_:)((uint64_t)v8);

  sub_22DF3A824((uint64_t)v8);
  return v6;
}

- (_TtCO15HomePodSettings13CarrySettings23DataModelUpdateResponse)init
{
  CarrySettings.DataModelUpdateResponse.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCO15HomePodSettings13CarrySettings23DataModelUpdateResponse_error));
}

- (NSString)description
{
  _TtCO15HomePodSettings13CarrySettings23DataModelUpdateResponse *v2;
  void *v3;

  v2 = self;
  CarrySettings.DataModelUpdateResponse.description.getter();

  v3 = (void *)sub_22DFDD4FC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
