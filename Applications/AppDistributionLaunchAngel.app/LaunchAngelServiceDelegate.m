@implementation LaunchAngelServiceDelegate

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  _TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_10001F520(v9);

  swift_unknownObjectRelease(a5);
}

- (_TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate)init
{
  _TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate *result;

  result = (_TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer("AppDistributionLaunchAngel.LaunchAngelServiceDelegate", 53, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate_service));
}

@end
