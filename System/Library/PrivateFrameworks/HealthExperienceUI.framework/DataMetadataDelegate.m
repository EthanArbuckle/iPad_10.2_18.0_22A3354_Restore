@implementation DataMetadataDelegate

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate_healthStore));
}

- (id)displayTypeController
{
  void *v2;
  _TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate *v3;
  id result;
  id v5;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate_healthStore);
  v3 = self;
  result = objc_msgSend(v2, sel_displayTypeController);
  if (result)
  {
    v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)unitController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate_unitPreferencesController));
}

- (_TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate)init
{
  _TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate *result;

  result = (_TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_32BBCFBB356028961E4520309C3A50C420DataMetadataDelegate_unitPreferencesController));
}

@end
