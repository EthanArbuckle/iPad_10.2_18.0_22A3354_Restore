@implementation FMR1AvailabilityHelper.FMR1AvailabilityHelperTrampoline

- (void)itemLocalizerChangedState:(unint64_t)a3
{
  void (*v3)(_BOOL8, _QWORD);
  _BOOL8 v4;
  _TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline *v5;

  v3 = *(void (**)(_BOOL8, _QWORD))((char *)&self->super.isa
                                             + OBJC_IVAR____TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline_handler);
  v4 = a3 == 2;
  v5 = self;
  v3(v4, 0);

}

- (void)didFailWithError:(id)a3
{
  void (*v5)(id, uint64_t);
  _TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline *v6;
  id v7;

  v5 = *(void (**)(id, uint64_t))((char *)&self->super.isa
                                          + OBJC_IVAR____TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline_handler);
  v7 = a3;
  v6 = self;
  v5(a3, 1);

}

- (_TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline)init
{
  _TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline *result;

  result = (_TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
