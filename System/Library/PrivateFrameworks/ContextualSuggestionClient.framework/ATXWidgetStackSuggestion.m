@implementation ATXWidgetStackSuggestion

- (NSString)stackIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (ATXWidget)topWidget
{
  return (ATXWidget *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR___ATXWidgetStackSuggestion_topWidget));
}

- (NSSet)suggestedWidgets
{
  void *v2;

  sub_2384B97C8(0, (unint64_t *)&qword_256912A30);
  sub_2384C2DE8();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2384DFAFC();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (ATXWidgetStackSuggestion)initWithStackIdentifier:(id)a3 topWidget:(id)a4 suggestedWidgets:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t *v11;
  id v12;
  objc_super v14;

  v7 = sub_2384DFA30();
  v9 = v8;
  sub_2384B97C8(0, (unint64_t *)&qword_256912A30);
  sub_2384C2DE8();
  v10 = (objc_class *)sub_2384DFB14();
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___ATXWidgetStackSuggestion_stackIdentifier);
  *v11 = v7;
  v11[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXWidgetStackSuggestion_topWidget) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXWidgetStackSuggestion_suggestedWidgets) = v10;
  v14.receiver = self;
  v14.super_class = (Class)ATXWidgetStackSuggestion;
  v12 = a4;
  return -[ATXWidgetStackSuggestion init](&v14, sel_init);
}

- (NSString)description
{
  ATXWidgetStackSuggestion *v2;
  void *v3;

  v2 = self;
  ATXWidgetStackSuggestion.description.getter();

  v3 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)topWidgetIdentifier
{
  ATXWidgetStackSuggestion *v2;
  ATXWidget *v3;
  ATXWidget *v4;
  NSString *v5;
  void *v6;

  v2 = self;
  v3 = -[ATXWidgetStackSuggestion topWidget](v2, sel_topWidget);
  if (v3)
  {
    v4 = v3;
    v5 = -[ATXWidget identifier](v3, sel_identifier);

    sub_2384DFA30();
    v6 = (void *)sub_2384DFA18();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (ATXWidgetStackSuggestion)init
{
  ATXWidgetStackSuggestion *result;

  result = (ATXWidgetStackSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
