@implementation IMChipAction

- (IMChipSuggestion)suggestion
{
  return (IMChipSuggestion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___IMChipAction_suggestion));
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMChipAction_type);
}

- (IMChipActionProtocol)action
{
  return (IMChipActionProtocol *)(id)swift_unknownObjectRetain();
}

- (IMChipAction)initWithSuggestion:(id)a3 type:(int64_t)a4 action:(id)a5
{
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChipAction_suggestion) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChipAction_type) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChipAction_action) = (Class)a5;
  v7.receiver = self;
  v7.super_class = (Class)IMChipAction;
  v5 = a3;
  swift_unknownObjectRetain();
  return -[IMChipAction init](&v7, sel_init);
}

- (IMChipAction)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMChipAction *)IMChipAction.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMChipAction *v2;
  void *v3;

  v2 = self;
  sub_19E329668();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)actionWithType:(int64_t)a3 dictionary:(id)a4
{
  void *v5;
  id v6;

  if (a4)
    v5 = (void *)sub_19E36F828();
  else
    v5 = 0;
  v6 = sub_19E329BF0(a3, v5);
  swift_bridgeObjectRelease();
  return v6;
}

- (id)suggestedActionBody
{
  IMChipAction *v2;
  id v3;

  v2 = self;
  v3 = sub_19E329910();

  return v3;
}

- (IMChipAction)init
{
  IMChipAction *result;

  result = (IMChipAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
