@implementation FamilySuggestionsTapToRadar

- (FamilySuggestionsTapToRadar)initWithSuggestions:(id)a3 screenshot:(id)a4
{
  id v6;
  objc_super v8;

  sub_20DE9432C(0, &qword_2549FCF08);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FamilySuggestionsTapToRadar_suggestions) = (Class)sub_20E07D73C();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FamilySuggestionsTapToRadar_screenshot) = (Class)a4;
  v8.receiver = self;
  v8.super_class = (Class)FamilySuggestionsTapToRadar;
  v6 = a4;
  return -[FamilySuggestionsTapToRadar init](&v8, sel_init);
}

- (void)open
{
  FamilySuggestionsTapToRadar *v2;

  v2 = self;
  sub_20DF61850();

}

- (FamilySuggestionsTapToRadar)init
{
  FamilySuggestionsTapToRadar *result;

  result = (FamilySuggestionsTapToRadar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
