@implementation EDSearchableMessageUpdate

- (EDSearchableMessageUpdate)initWithConversationIdentifier:(id)a3 mailboxIdentifiers:(id)a4 gmailLabels:(id)a5 isLikelyJunk:(id)a6 dateLastViewed:(id)a7 flags:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  EDSearchableMessageUpdate *v23;
  uint64_t v25;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED11B448);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1D3124DE8();
  v16 = v15;
  v17 = sub_1D3124EF0();
  sub_1D30F3388(0, (unint64_t *)&qword_1ED11B560);
  v18 = sub_1D3124EF0();
  if (a7)
  {
    sub_1D3124CC8();
    v19 = sub_1D3124CD4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v13, 0, 1, v19);
  }
  else
  {
    v20 = sub_1D3124CD4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v13, 1, 1, v20);
  }
  v21 = a8;
  v22 = a6;
  v23 = (EDSearchableMessageUpdate *)sub_1D310C744(v14, v16, v17, v18, a6, (uint64_t)v13, (uint64_t)v21);

  return v23;
}

- (void)addToAttributes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  id v8;
  EDSearchableMessageUpdate *v9;
  _BYTE v10[32];

  v5 = type metadata accessor for SearchableMessageUpdate();
  MEMORY[0x1E0C80A78](v5);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D3108558((uint64_t)self + OBJC_IVAR___EDSearchableMessageUpdate__underlying, (uint64_t)v10);
  v8 = a3;
  v9 = self;
  swift_dynamicCast();
  sub_1D3118548(v8);
  sub_1D310C708((uint64_t)v7);

}

- (EDSearchableMessageUpdate)init
{
  EDSearchableMessageUpdate *result;

  result = (EDSearchableMessageUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___EDSearchableMessageUpdate__underlying);
}

@end
