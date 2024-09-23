@implementation UserDomainConceptChangeProvider

- (void)userDomainConceptStore:(id)a3 didAddUserDomainConcepts:(id)a4
{
  sub_1BC0CFDEC(self, (uint64_t)a2, a3);
}

- (void)userDomainConceptStore:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
  sub_1BC0CFDEC(self, (uint64_t)a2, a3);
}

- (void)userDomainConceptStore:(id)a3 didDeleteUserDomainConcepts:(id)a4
{
  sub_1BC0CFDEC(self, (uint64_t)a2, a3);
}

- (_TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider)init
{
  _TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider *result;

  result = (_TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthRecordsConceptsSupport31UserDomainConceptChangeProvider_udcStore));
  swift_release();
}

@end
