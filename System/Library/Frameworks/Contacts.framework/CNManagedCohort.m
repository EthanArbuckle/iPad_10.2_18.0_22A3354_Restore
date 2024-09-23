@implementation CNManagedCohort

- (CNManagedCohort)init
{
  CNManagedCohort *result;

  result = (CNManagedCohort *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_18F9EA890(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CNManagedCohort_imageData), *(_QWORD *)&self->identifier[OBJC_IVAR___CNManagedCohort_imageData]);
  sub_18F9EA890(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CNManagedCohort_posterData), *(_QWORD *)&self->identifier[OBJC_IVAR___CNManagedCohort_posterData]);

  swift_bridgeObjectRelease();
}

@end
