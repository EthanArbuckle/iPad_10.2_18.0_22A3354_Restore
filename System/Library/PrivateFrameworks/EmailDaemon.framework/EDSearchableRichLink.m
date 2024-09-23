@implementation EDSearchableRichLink

+ (NSString)idAttributeKey
{
  return (NSString *)(id)sub_1D3124DC4();
}

+ (NSString)titleAttributeKey
{
  return (NSString *)(id)sub_1D3124DC4();
}

+ (NSString)urlAttributeKey
{
  return (NSString *)(id)sub_1D3124DC4();
}

- (EDSearchableRichLink)initWithAccountIdentifier:(id)a3 mailboxIdentifiers:(id)a4 messageID:(id)a5 id:(id)a6 title:(id)a7 url:(id)a8 dateSent:(id)a9 dateReceived:(id)a10 sender:(id)a11 recipients:(id)a12
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  EDSearchableRichLink *v34;
  Swift::String v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  EDSearchableRichLink *v44;

  v43 = a6;
  v44 = self;
  v40 = a10;
  v15 = sub_1D3124CD4();
  v16 = MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v37 - v19;
  if (a3)
  {
    v21 = sub_1D3124DE8();
    v41 = v22;
    v42 = v21;
  }
  else
  {
    v41 = 0;
    v42 = 0;
  }
  v23 = (uint64_t)a11;
  v39 = sub_1D3124EF0();
  if (a7)
  {
    v38 = sub_1D3124DE8();
    v25 = v24;
  }
  else
  {
    v38 = 0;
    v25 = 0;
  }
  v26 = sub_1D3124DE8();
  v28 = v27;
  sub_1D3124CC8();
  sub_1D3124CC8();
  if (a11)
  {
    v23 = sub_1D3124DE8();
    v30 = v29;
  }
  else
  {
    v30 = 0;
  }
  v31 = sub_1D3124EF0();
  v32 = a5;
  v33 = v43;
  v36._object = v30;
  v36._countAndFlagsBits = v23;
  v34 = (EDSearchableRichLink *)sub_1D310DD04(v42, v41, v39, v32, v33, v38, v25, v26, v28, (uint64_t)v20, (uint64_t)v18, v36, v31);

  return v34;
}

- (void)addToAttributes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  id v8;
  EDSearchableRichLink *v9;
  _BYTE v10[32];

  v5 = type metadata accessor for SearchableRichLink();
  MEMORY[0x1E0C80A78](v5);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D3108558((uint64_t)self + OBJC_IVAR___EDSearchableRichLink__underlying, (uint64_t)v10);
  v8 = a3;
  v9 = self;
  swift_dynamicCast();
  sub_1D3119DC8(v8);
  sub_1D310DCC8((uint64_t)v7);

}

- (EDSearchableRichLink)init
{
  EDSearchableRichLink *result;

  result = (EDSearchableRichLink *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___EDSearchableRichLink__underlying);
}

@end
