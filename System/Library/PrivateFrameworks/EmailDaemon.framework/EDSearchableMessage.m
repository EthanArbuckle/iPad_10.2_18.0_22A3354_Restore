@implementation EDSearchableMessage

+ (NSString)userHandle
{
  void *v2;

  if (qword_1ED11B460 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D3124DC4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (id)peopleFromCommentedAddresses:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = sub_1D3124EF0();
  sub_1D310B540(v3);
  swift_bridgeObjectRelease();
  sub_1D30F3388(0, (unint64_t *)&qword_1ED11B550);
  v4 = (void *)sub_1D3124EE4();
  swift_bridgeObjectRelease();
  return v4;
}

- (EDSearchableMessage)initWithSubjectWithoutPrefix:(id)a3 dateSent:(id)a4 dateReceived:(id)a5 isEncrypted:(BOOL)a6 priority:(id)a7 senders:(id)a8 to:(id)a9 cc:(id)a10 bcc:(id)a11 allHeaders:(id)a12 htmlContent:(id)a13 messageID:(id)a14 notificationID:(id)a15 isPartOfExistingThread:(BOOL)a16 hasCompleteData:(BOOL)a17 accountIdentifier:(id)a18 accountIsManaged:(BOOL)a19 accountType:(id)a20 accountEmailAddresses:(id)a21 update:(id)a22 attachments:(id)a23
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  EDSearchableMessage *v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  _BOOL4 v79;
  EDSearchableMessage *v80;

  v79 = a6;
  v80 = self;
  v67 = a23;
  v68 = a22;
  v62 = a20;
  v63 = a21;
  v72 = a18;
  v65 = a7;
  v66 = a15;
  v61 = a14;
  v64 = a13;
  v23 = sub_1D3124CD4();
  v24 = MEMORY[0x1E0C80A78](v23);
  v26 = (char *)&v58 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v24);
  v28 = (char *)&v58 - v27;
  v29 = sub_1D3124DE8();
  v75 = v30;
  v76 = v29;
  v77 = v28;
  sub_1D3124CC8();
  v78 = v26;
  sub_1D3124CC8();
  v74 = sub_1D3124EF0();
  v73 = sub_1D3124EF0();
  v71 = sub_1D3124EF0();
  v70 = sub_1D3124EF0();
  if (a12)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED11B4F0);
    v69 = sub_1D3124D94();
  }
  else
  {
    v69 = 0;
  }
  v31 = v62;
  v63 = v63;
  v68 = v68;
  v67 = v67;
  v32 = v72;
  v33 = v66;
  v34 = v61;
  v65 = v65;
  if (v64)
  {
    v35 = v64;
    v64 = (id)sub_1D3124C74();
    v62 = v36;

    if (v34)
      goto LABEL_6;
LABEL_9:
    v60 = 0;
    v61 = 0;
    if (v33)
      goto LABEL_7;
    goto LABEL_10;
  }
  v64 = 0;
  v62 = (id)0xF000000000000000;
  if (!v34)
    goto LABEL_9;
LABEL_6:
  v37 = (void *)sub_1D3124DE8();
  v60 = v38;
  v61 = v37;

  if (v33)
  {
LABEL_7:
    v66 = (id)sub_1D3124DE8();
    v59 = v39;

    goto LABEL_11;
  }
LABEL_10:
  v66 = 0;
  v59 = 0;
LABEL_11:
  if (v32)
  {
    v40 = sub_1D3124DE8();
    v42 = v41;

  }
  else
  {
    v40 = 0;
    v42 = 0;
  }
  v43 = sub_1D3124DE8();
  v45 = v44;

  v46 = v63;
  v47 = sub_1D3124EF0();

  v48 = v67;
  v49 = v68;
  v57 = v47;
  v55 = v43;
  v56 = v45;
  v50 = (unint64_t)v62;
  v51 = (uint64_t)v64;
  v52 = v65;
  v53 = (EDSearchableMessage *)sub_1D310B724(v76, v75, (uint64_t)v77, (uint64_t)v78, v79, v65, v74, v73, v71, v70, v69, (uint64_t)v64, (unint64_t)v62, (uint64_t)v61, v60, (uint64_t)v66, v59, a16, a17,
                                 v40,
                                 v42,
                                 a19,
                                 v55,
                                 v56,
                                 v57,
                                 (uint64_t)v68,
                                 (uint64_t)v67);

  sub_1D30FE19C(v51, v50);
  return v53;
}

- (void)addToAttributes:(id)a3 forIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  EDSearchableMessage *v13;
  _BYTE v14[32];

  v6 = type metadata accessor for SearchableMessage(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_1D3124DE8();
  v11 = v10;
  sub_1D3108558((uint64_t)self + OBJC_IVAR___EDSearchableMessage__underlying, (uint64_t)v14);
  v12 = a3;
  v13 = self;
  swift_dynamicCast();
  sub_1D3111A1C(v12, v9, v11);
  sub_1D310A768((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (EDSearchableMessage)init
{
  EDSearchableMessage *result;

  result = (EDSearchableMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___EDSearchableMessage__underlying);
}

@end
