@implementation MIUIMedicalIDNavigationBarView

- (MIUIMedicalIDNavigationBarView)initWithHealthStore:(id)a3 medicalIDData:(id)a4 showDateUpdated:(BOOL)a5 locale:(id)a6
{
  _BOOL4 v6;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v15;

  v6 = a5;
  v9 = sub_2416B9C10();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416B9BF8();
  v12 = a3;
  v13 = a4;
  return (MIUIMedicalIDNavigationBarView *)MIUIMedicalIDNavigationBarView.init(healthStore:medicalIDData:showDateUpdated:locale:)(v12, a4, v6, (uint64_t)v11);
}

- (MIUIMedicalIDNavigationBarView)initWithCoder:(id)a3
{
  MIUIMedicalIDNavigationBarView *result;

  result = (MIUIMedicalIDNavigationBarView *)sub_2416BB5A8();
  __break(1u);
  return result;
}

- (MIUIMedicalIDNavigationBarView)initWithFrame:(CGRect)a3
{
  MIUIMedicalIDNavigationBarView *result;

  result = (MIUIMedicalIDNavigationBarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

}

@end
