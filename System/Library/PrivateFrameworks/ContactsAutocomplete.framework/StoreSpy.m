@implementation StoreSpy

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  _TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy *v5;
  unint64_t v6;

  sub_1B99928C4();
  sub_1B9997150();
  swift_beginAccess();
  swift_unknownObjectRetain();
  v5 = self;
  v6 = swift_bridgeObjectRetain();
  sub_1B9990DF8(v6);
  swift_endAccess();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  void *v4;
  id v5;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy_error);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy_error) = (Class)a4;
  v5 = a4;

}

- (void)autocompleteFetchDidFinish:(id)a3
{
  _TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B99971F8();
  swift_unknownObjectRelease();

}

- (_TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy)init
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy_results) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy_error) = 0;
  v4 = OBJC_IVAR____TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy_semaphore;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)dispatch_semaphore_create(0);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return -[StoreSpy init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy_error));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ContactsAutocompleteP33_CAEFE0EFD438E7DDA3F863704B47CA3F8StoreSpy_semaphore));
}

@end
