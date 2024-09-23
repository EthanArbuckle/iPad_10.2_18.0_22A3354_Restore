@implementation AllergyReactionFormatter

- (id)displayItemsFromReaction:(id)a3 country:(id)a4
{
  id v5;
  _TtC15HealthRecordsUI24AllergyReactionFormatter *v6;
  void *v7;
  id result;
  id v9;
  _TtC15HealthRecordsUI24AllergyReactionFormatter *v10;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI24AllergyReactionFormatter_context) >= (Class)2)
  {
    v9 = a3;
    v10 = self;
    result = (id)sub_1BC62D5C8();
    __break(1u);
  }
  else
  {
    v5 = a3;
    v6 = self;
    sub_1BC4E7B4C(v5);

    sub_1BC39CBE4();
    v7 = (void *)sub_1BC62C86C();
    swift_bridgeObjectRelease();
    return v7;
  }
  return result;
}

- (_TtC15HealthRecordsUI24AllergyReactionFormatter)init
{
  _TtC15HealthRecordsUI24AllergyReactionFormatter *result;

  result = (_TtC15HealthRecordsUI24AllergyReactionFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
