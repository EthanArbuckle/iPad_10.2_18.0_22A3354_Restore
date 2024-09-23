@implementation CarrySettings.DataModelUpdateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest)initWithCoder:(id)a3
{
  return (_TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest *)sub_22DF888E4(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest *v5;

  v4 = a3;
  v5 = self;
  CarrySettings.DataModelUpdateRequest.encode(with:)((NSCoder)v4);

}

- (BOOL)isEqual:(id)a3
{
  _TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest *v4;
  _TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest *v5;
  char v6;
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
  v6 = CarrySettings.DataModelUpdateRequest.isEqual(_:)((uint64_t)v8);

  sub_22DF3A824((uint64_t)v8);
  return v6 & 1;
}

- (_TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest)init
{
  CarrySettings.DataModelUpdateRequest.init()();
}

- (void).cxx_destruct
{
  sub_22DF32DB0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest_data), *(unint64_t *)((char *)&self->super._networkActivity+ OBJC_IVAR____TtCO15HomePodSettings13CarrySettings22DataModelUpdateRequest_data));
  swift_bridgeObjectRelease();
}

@end
