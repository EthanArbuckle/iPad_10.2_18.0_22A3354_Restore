@implementation CarrySettings.InstallProfileRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCO15HomePodSettings13CarrySettings21InstallProfileRequest)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtCO15HomePodSettings13CarrySettings21InstallProfileRequest *)sub_22DF5FFAC();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtCO15HomePodSettings13CarrySettings21InstallProfileRequest *v5;

  v4 = a3;
  v5 = self;
  CarrySettings.InstallProfileRequest.encode(with:)((NSCoder)v4);

}

- (BOOL)isEqual:(id)a3
{
  _TtCO15HomePodSettings13CarrySettings21InstallProfileRequest *v4;
  _TtCO15HomePodSettings13CarrySettings21InstallProfileRequest *v5;
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
  v6 = CarrySettings.InstallProfileRequest.isEqual(_:)((uint64_t)v8);

  sub_22DF3A824((uint64_t)v8);
  return v6;
}

- (_TtCO15HomePodSettings13CarrySettings21InstallProfileRequest)init
{
  CarrySettings.InstallProfileRequest.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_22DF32DB0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtCO15HomePodSettings13CarrySettings21InstallProfileRequest_profileData), *(unint64_t *)((char *)&self->super._networkActivity+ OBJC_IVAR____TtCO15HomePodSettings13CarrySettings21InstallProfileRequest_profileData));
}

@end
