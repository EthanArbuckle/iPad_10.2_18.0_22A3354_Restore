@implementation HRProgressHUD

- (void)willMoveToSuperview:(id)a3
{
  id v5;
  _TtC15HealthRecordsUI13HRProgressHUD *v6;

  v5 = a3;
  v6 = self;
  sub_1BC53B080(a3);

}

- (void)didMoveToSuperview
{
  _TtC15HealthRecordsUI13HRProgressHUD *v2;

  v2 = self;
  sub_1BC53B1E0();

}

- (_TtC15HealthRecordsUI13HRProgressHUD)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HRProgressHUD();
  return -[ProgressHUD initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
