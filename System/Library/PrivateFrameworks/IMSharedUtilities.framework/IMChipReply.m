@implementation IMChipReply

- (IMChipSuggestion)suggestion
{
  return (IMChipSuggestion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___IMChipReply_suggestion));
}

- (IMChipReply)initWithSuggestion:(id)a3
{
  id v3;
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChipReply_suggestion) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)IMChipReply;
  v3 = a3;
  return -[IMChipReply init](&v5, sel_init);
}

- (IMChipReply)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMChipReply *)IMChipReply.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  uint64_t inited;
  IMChipReply *v4;
  IMChipSuggestion *v5;
  id v6;
  uint64_t v7;
  void *v8;

  sub_19E247E74(&qword_1EE5019B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19E381BA0;
  *(_QWORD *)(inited + 32) = 0x6974736567677573;
  *(_QWORD *)(inited + 40) = 0xEA00000000006E6FLL;
  v4 = self;
  v5 = -[IMChipReply suggestion](v4, sel_suggestion);
  v6 = -[IMChipSuggestion dictionaryRepresentation](v5, sel_dictionaryRepresentation);

  v7 = sub_19E36F828();
  *(_QWORD *)(inited + 72) = sub_19E247E74(&qword_1EE503490);
  *(_QWORD *)(inited + 48) = v7;
  sub_19E32D864(inited);

  v8 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)suggestedReplyBody
{
  IMChipReply *v2;
  id v3;

  v2 = self;
  v3 = sub_19E35FBEC();

  return v3;
}

- (IMChipReply)init
{
  IMChipReply *result;

  result = (IMChipReply *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
