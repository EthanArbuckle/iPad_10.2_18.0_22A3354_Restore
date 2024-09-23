@implementation AttendeeDynamicOptionsProvider.AutocompleterDelegate

- (_TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  v3 = (char *)self
     + OBJC_IVAR____TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate_continuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C6DE0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate_autocompleter) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AttendeeDynamicOptionsProvider.AutocompleterDelegate();
  return -[AttendeeDynamicOptionsProvider.AutocompleterDelegate init](&v6, sel_init);
}

- (void)autcompleterUpdated:(id)a3
{
  id v4;
  _TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_21C9649FC(v4);

}

- (void).cxx_destruct
{
  sub_21C9657E0((uint64_t)self+ OBJC_IVAR____TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate_continuation);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12CalendarLink30AttendeeDynamicOptionsProviderP33_0830E9399702190799299928ED08316E21AutocompleterDelegate_autocompleter));
}

@end
