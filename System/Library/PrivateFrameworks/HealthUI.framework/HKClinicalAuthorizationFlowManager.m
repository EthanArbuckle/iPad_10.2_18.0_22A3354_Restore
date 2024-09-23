@implementation HKClinicalAuthorizationFlowManager

- (HKClinicalAuthorizationFlowManager)initWithHealthStore:(id)a3 healthRecordsStore:(id)a4
{
  return (HKClinicalAuthorizationFlowManager *)sub_1D7ABB13C(a3, a4);
}

+ (id)tableViewHeaderIcon
{
  return 0;
}

- (void)registerIngestionStatusObserver:(id)a3
{
  HKClinicalAuthorizationFlowManager *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1D7ABB7A4((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (void)removeIngestionStatusObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HKClinicalAuthorizationFlowManager_ingestionObserverSet), sel_unregisterObserver_, a3);
}

- (id)createInitialViewControllerWithContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  id v9;
  HKClinicalAuthorizationFlowManager *v10;
  void *v11;
  void *v12;

  v7 = objc_allocWithZone((Class)type metadata accessor for ClinicalAuthorizationAccountsOverviewViewController());
  v8 = a3;
  swift_unknownObjectRetain_n();
  v9 = v8;
  v10 = self;
  sub_1D7B1C338((uint64_t)a4, v9);
  v12 = v11;

  swift_unknownObjectRelease();
  return v12;
}

- (void)healthRecordsStore:(id)a3 observedAccountsEvent:(unint64_t)a4
{
  id v6;
  HKClinicalAuthorizationFlowManager *v7;

  v6 = a3;
  v7 = self;
  sub_1D7ABBB9C(a4);

}

- (HKClinicalAuthorizationFlowManager)init
{
  HKClinicalAuthorizationFlowManager *result;

  result = (HKClinicalAuthorizationFlowManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  swift_release();

}

@end
