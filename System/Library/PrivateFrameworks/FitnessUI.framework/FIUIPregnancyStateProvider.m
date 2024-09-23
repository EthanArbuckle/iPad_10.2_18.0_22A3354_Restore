@implementation FIUIPregnancyStateProvider

- (FIUIPregnancyStateProvider)initWithHealthStore:(id)a3
{
  return (FIUIPregnancyStateProvider *)sub_2130D962C(a3);
}

- (void)dealloc
{
  FIUIPregnancyStateProvider *v2;

  v2 = self;
  sub_2130D972C();
}

- (void).cxx_destruct
{

}

- (id)currentModel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___FIUIPregnancyStateProvider_pregnancyModel));
}

- (BOOL)isPregnant
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FIUIPregnancyStateProvider_pregnancyModel);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, sel_state) == (id)1;
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___FIUIPregnancyStateProvider_observers), sel_addObject_, a3);
}

- (void)removeObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___FIUIPregnancyStateProvider_observers), sel_removeObject_, a3);
}

- (void)notifyObservers:(id)a3
{
  id v4;
  FIUIPregnancyStateProvider *v5;

  v4 = a3;
  v5 = self;
  sub_2130D9A28((uint64_t)v4);

}

- (void)activate
{
  FIUIPregnancyStateProvider *v2;

  v2 = self;
  sub_2130D9BF4();

}

- (void)stopQuery
{
  FIUIPregnancyStateProvider *v2;

  v2 = self;
  sub_2130D9E78();

}

- (void)pregnancyModelDidChangeWithModel:(id)a3
{
  id v4;
  FIUIPregnancyStateProvider *v5;

  v4 = a3;
  v5 = self;
  sub_2130DA054(v4);

}

- (FIUIPregnancyStateProvider)init
{
  FIUIPregnancyStateProvider *result;

  result = (FIUIPregnancyStateProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
