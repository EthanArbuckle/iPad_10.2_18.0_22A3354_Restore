@implementation XPCTimeWindow

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCTimeWindow)initWithCoder:(id)a3
{
  XPCTimeWindow *v4;

  swift_getObjectType();
  v4 = (XPCTimeWindow *)sub_23316B3D8(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCTimeWindow *v5;

  v4 = a3;
  v5 = self;
  _s10FinanceKit10TimeWindowV3XPCC6encode4withySo7NSCoderC_tF_0(v4);

}

- (XPCTimeWindow)init
{
  XPCTimeWindow *result;

  result = (XPCTimeWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_233168500((uint64_t)self + OBJC_IVAR___XPCTimeWindow_value, type metadata accessor for TimeWindow);
}

@end
