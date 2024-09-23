@implementation APStateDump

- (APStateDump)initWithState:(id)a3 accesses:(id)a4
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APStateDump_clientState) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APStateDump_extantAccesses) = *(Class *)((char *)a4
                                                                                           + OBJC_IVAR____TtCE13AppProtectionCSo11APStateDumpP33_08AD371E34EDC7245D13D99B4228357017AccessListWrapper_accesses);
  v6.receiver = self;
  v6.super_class = (Class)APStateDump;
  v4 = a3;
  swift_bridgeObjectRetain();
  return -[APStateDump init](&v6, sel_init);
}

- (APStateDump)initWithCoder:(id)a3
{
  return (APStateDump *)APStateDump.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  APStateDump *v5;

  v4 = a3;
  v5 = self;
  sub_2362BEC84(v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)writeToFileHandle:(id)a3 error:(id *)a4
{
  id v5;
  APStateDump *v6;

  v5 = a3;
  v6 = self;
  sub_2362BEE88();

  return 1;
}

- (APStateDump)init
{
  APStateDump *result;

  result = (APStateDump *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
