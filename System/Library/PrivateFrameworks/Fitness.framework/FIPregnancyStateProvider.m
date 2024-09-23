@implementation FIPregnancyStateProvider

- (FIPregnancyStateProvider)initWithHealthStore:(id)a3
{
  return (FIPregnancyStateProvider *)sub_2116B367C(a3);
}

- (void)dealloc
{
  FIPregnancyStateProvider *v2;

  v2 = self;
  sub_2116B377C();
}

- (void).cxx_destruct
{

}

- (id)currentModel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel));
}

- (BOOL)isPregnant
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, sel_state) == (id)1;
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___FIPregnancyStateProvider_observers), sel_addObject_, a3);
}

- (void)removeObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___FIPregnancyStateProvider_observers), sel_removeObject_, a3);
}

- (void)notifyObservers:(id)a3
{
  id v4;
  FIPregnancyStateProvider *v5;

  v4 = a3;
  v5 = self;
  sub_2116B3A78((uint64_t)v4);

}

- (void)activate
{
  FIPregnancyStateProvider *v2;

  v2 = self;
  sub_2116B3C44();

}

- (void)stopQuery
{
  FIPregnancyStateProvider *v2;

  v2 = self;
  sub_2116B3EC8();

}

- (void)pregnancyModelDidChangeWithModel:(id)a3
{
  id v4;
  FIPregnancyStateProvider *v5;

  v4 = a3;
  v5 = self;
  sub_2116B40A4(v4);

}

- (FIPregnancyStateProvider)init
{
  FIPregnancyStateProvider *result;

  result = (FIPregnancyStateProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
