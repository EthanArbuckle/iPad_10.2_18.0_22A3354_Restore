@implementation InstallationNSProgress

- (void)pause
{
  _TtC15AppDistribution22InstallationNSProgress *v2;

  v2 = self;
  sub_236080450(1, 1);

}

- (void)resume
{
  _TtC15AppDistribution22InstallationNSProgress *v2;

  v2 = self;
  sub_236080450(0, 1);

}

- (void)cancel
{
  _TtC15AppDistribution22InstallationNSProgress *v2;

  v2 = self;
  sub_236080450(2, 1);

}

- (_TtC15AppDistribution22InstallationNSProgress)initWithParent:(id)a3 userInfo:(id)a4
{
  id v4;
  _TtC15AppDistribution22InstallationNSProgress *result;

  v4 = a3;
  result = (_TtC15AppDistribution22InstallationNSProgress *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
