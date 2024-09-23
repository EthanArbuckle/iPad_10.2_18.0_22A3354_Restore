@implementation InternalOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC15ProximityReader15InternalOptions *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = *((unsigned __int8 *)&self->super.isa
       + OBJC_IVAR____TtC15ProximityReader15InternalOptions_returnReadResultImmediately);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_21C3A7EB4();
  objc_msgSend(v5, sel_encodeBool_forKey_, v4, v7);

  v8 = *((unsigned __int8 *)&v6->super.isa + OBJC_IVAR____TtC15ProximityReader15InternalOptions_includeErrorInReadResult);
  v9 = (id)sub_21C3A7EB4();
  objc_msgSend(v5, sel_encodeBool_forKey_, v8, v9);

}

- (_TtC15ProximityReader15InternalOptions)initWithCoder:(id)a3
{
  id v3;
  _TtC15ProximityReader15InternalOptions *v4;

  v3 = a3;
  v4 = (_TtC15ProximityReader15InternalOptions *)sub_21C2F5530(v3);

  return v4;
}

- (_TtC15ProximityReader15InternalOptions)init
{
  _TtC15ProximityReader15InternalOptions *result;

  result = (_TtC15ProximityReader15InternalOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
