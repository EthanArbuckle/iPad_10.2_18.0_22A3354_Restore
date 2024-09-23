@implementation LocationSearchIntent.SearchModelWrapper

- (id)eventIDForSearchModel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  _TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper *v12;
  void *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2552C7A60);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C9B57A8((uint64_t)self + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_event, (uint64_t)v7, (uint64_t *)&unk_2552C7A60);
  v8 = sub_21C9EB85C();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_21C975D90((uint64_t)v7, (uint64_t *)&unk_2552C7A60);
    return 0;
  }
  else
  {
    sub_21C95B824((unint64_t *)&unk_2552C7B50, (uint64_t (*)(uint64_t))MEMORY[0x24BE14350], MEMORY[0x24BE14348]);
    v11 = a3;
    v12 = self;
    sub_21C9EB784();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);

    v13 = (void *)sub_21C9EBDCC();
    swift_bridgeObjectRelease();
    return v13;
  }
}

- (id)sourceForSearchModel:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_source));
}

- (BOOL)shouldIssueAvailabilityRequestForSearchModel:(id)a3
{
  return 0;
}

- (id)dateIntervalForSearchModel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C8218);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  sub_21C9B2C50((uint64_t)v7);

  v10 = sub_21C9EB5E0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    v12 = (void *)sub_21C9EB5C8();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  return v12;
}

- (BOOL)shouldIncludeConferenceRoom:(id)a3
{
  id v4;
  _TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21C9B2EFC(v4);

  return self & 1;
}

- (void)locationSearchModel:(id)a3 updatedSearchTypes:(unint64_t)a4
{
  id v5;
  _TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper *v6;

  v5 = a3;
  v6 = self;
  if ((objc_msgSend(v5, sel_resultsPending) & 1) == 0)
    sub_21C9B32C4();

}

- (_TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper)init
{
  _TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper *result;

  result = (_TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_store));
  sub_21C975D90((uint64_t)self + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_event, (uint64_t *)&unk_2552C7A60);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_source));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_searchModel));
  sub_21C975D90((uint64_t)self + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_continuation, &qword_2552C81D8);
}

@end
