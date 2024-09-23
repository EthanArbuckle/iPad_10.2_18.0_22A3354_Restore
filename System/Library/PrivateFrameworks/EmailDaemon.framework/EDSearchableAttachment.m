@implementation EDSearchableAttachment

- (EDSearchableAttachment)initWithContentURL:(id)a3 contentType:(id)a4 name:(id)a5 accountIdentifier:(id)a6 mailboxIdentifiers:(id)a7 messageID:(id)a8 messageIDHeader:(id)a9 dateSent:(id)a10 dateReceived:(id)a11 sender:(id)a12 recipients:(id)a13 downloadDate:(id)a14
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  char *v52;
  uint64_t v53;
  void *v54;
  EDSearchableAttachment *v55;
  Swift::String commentedAddress;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  EDSearchableAttachment *v74;
  id v75;

  v68 = a6;
  v74 = self;
  v75 = a14;
  v64 = a11;
  v65 = a13;
  v63 = a10;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED11B448);
  MEMORY[0x1E0C80A78](v18);
  v73 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_1D3124CD4();
  v70 = *(_QWORD *)(v72 - 8);
  v20 = MEMORY[0x1E0C80A78](v72);
  v71 = (char *)&v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v69 = (char *)&v59 - v22;
  v23 = sub_1D3124D28();
  MEMORY[0x1E0C80A78](v23);
  v25 = (char *)&v59 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_1D3124C14();
  MEMORY[0x1E0C80A78](v26);
  v67 = (uint64_t)&v59 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3124BB4();
  v28 = a4;
  v29 = a5;
  v30 = a7;
  v66 = a8;
  v31 = a9;
  v32 = v63;
  v33 = v64;
  v61 = v65;
  v34 = v68;
  v59 = a12;
  v35 = a12;
  v60 = v75;
  v68 = v25;
  sub_1D3124D1C();

  v36 = (void *)sub_1D3124DE8();
  v64 = v37;
  v65 = v36;

  if (v34)
  {
    v38 = (void *)sub_1D3124DE8();
    v62 = v39;
    v63 = v38;

  }
  else
  {
    v62 = 0;
    v63 = 0;
  }
  v40 = sub_1D3124EF0();

  v41 = sub_1D3124DE8();
  v43 = v42;

  v44 = (uint64_t)v69;
  sub_1D3124CC8();

  v45 = (uint64_t)v71;
  sub_1D3124CC8();

  if (v35)
  {
    v46 = sub_1D3124DE8();
    v48 = v47;

  }
  else
  {
    v46 = 0;
    v48 = 0;
  }
  v49 = v61;
  v50 = sub_1D3124EF0();

  v51 = v60;
  if (v60)
  {
    v52 = v73;
    sub_1D3124CC8();

    v53 = 0;
  }
  else
  {
    v53 = 1;
    v52 = v73;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v70 + 56))(v52, v53, 1, v72);
  v58 = (uint64_t)v52;
  commentedAddress._countAndFlagsBits = v46;
  commentedAddress._object = v48;
  v54 = v66;
  v55 = (EDSearchableAttachment *)sub_1D31085D0(v67, (uint64_t)v68, (uint64_t)v65, (uint64_t)v64, (uint64_t)v63, v62, v40, v66, v41, v43, v44, v45, commentedAddress, v50, v58);

  return v55;
}

- (NSURL)contentURL
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  EDSearchableAttachment *v10;
  void *v11;
  _BYTE v13[32];

  v3 = type metadata accessor for SearchableAttachment();
  MEMORY[0x1E0C80A78](v3);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_1D3124C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D3108558((uint64_t)self + OBJC_IVAR___EDSearchableAttachment__underlying, (uint64_t)v13);
  v10 = self;
  swift_dynamicCast();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v9, v5, v6);
  sub_1D3108594((uint64_t)v5);

  v11 = (void *)sub_1D3124B90();
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  return (NSURL *)v11;
}

- (NSString)displayName
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  EDSearchableAttachment *v6;
  void *v7;
  _BYTE v9[32];

  v3 = type metadata accessor for SearchableAttachment();
  MEMORY[0x1E0C80A78](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D3108558((uint64_t)self + OBJC_IVAR___EDSearchableAttachment__underlying, (uint64_t)v9);
  v6 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_1D3108594((uint64_t)v5);

  v7 = (void *)sub_1D3124DC4();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (void)addToAttributes:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  id v8;
  EDSearchableAttachment *v9;
  _BYTE v10[32];

  v5 = type metadata accessor for SearchableAttachment();
  MEMORY[0x1E0C80A78](v5);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D3108558((uint64_t)self + OBJC_IVAR___EDSearchableAttachment__underlying, (uint64_t)v10);
  v8 = a3;
  v9 = self;
  swift_dynamicCast();
  sub_1D310EDE4(v8);
  sub_1D3108594((uint64_t)v7);

}

- (EDSearchableAttachment)init
{
  EDSearchableAttachment *result;

  result = (EDSearchableAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___EDSearchableAttachment__underlying);
}

@end
