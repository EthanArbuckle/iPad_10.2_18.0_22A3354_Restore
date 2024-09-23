@implementation ICNotesInvernessClientObjc

- (CKContainer)container
{
  return (CKContainer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR___ICNotesInvernessClientObjc_container));
}

- (int64_t)environment
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___ICNotesInvernessClientObjc_environment);
}

- (NSString)localURLString
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BDBFD6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (ICNotesInvernessClientObjc)initWithContainer:(id)a3 environment:(int64_t)a4 localURLString:(id)a5
{
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  v8 = sub_1BDBFD6F8();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNotesInvernessClientObjc_container) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNotesInvernessClientObjc_environment) = (Class)a4;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___ICNotesInvernessClientObjc_localURLString);
  *v9 = v8;
  v9[1] = v10;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for NotesInvernessClient();
  v11 = a3;
  return -[ICNotesInvernessClientObjc init](&v13, sel_init);
}

- (void)sendMentionNotificationWithRecipientUserId:(id)a3 senderName:(id)a4 noteTitle:(id)a5 mentionSnippet:(id)a6 shareRecordName:(id)a7 shareOwnerUserId:(id)a8 noteRecordName:(id)a9 inlineAttachmentRecordName:(id)a10 callback:(id)a11
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  ICNotesInvernessClientObjc *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  char *v47;
  uint64_t v48;
  ICNotesInvernessClientObjc *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;

  v49 = self;
  v46 = a10;
  v48 = type metadata accessor for MentionNotificationRequestV2(0);
  MEMORY[0x1E0C80A78](v48);
  v47 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = _Block_copy(a11);
  v39 = sub_1BDBFD6F8();
  v13 = v12;
  v42 = v12;
  v38 = sub_1BDBFD6F8();
  v15 = v14;
  v37 = sub_1BDBFD6F8();
  v17 = v16;
  v36 = sub_1BDBFD6F8();
  v19 = v18;
  v35 = sub_1BDBFD6F8();
  v21 = v20;
  v43 = v20;
  v34 = sub_1BDBFD6F8();
  v23 = v22;
  v44 = v22;
  v24 = sub_1BDBFD6F8();
  v26 = v25;
  v45 = v25;
  v27 = sub_1BDBFD6F8();
  v29 = v28;
  v46 = v28;
  v40 = swift_allocObject();
  *(_QWORD *)(v40 + 16) = v41;
  v50 = v39;
  v51 = v13;
  v52 = v38;
  v53 = v15;
  v54 = v37;
  v55 = v17;
  v56 = v36;
  v57 = v19;
  v58 = v35;
  v59 = v21;
  v60 = v34;
  v61 = v23;
  v62 = v24;
  v63 = v26;
  v64 = v27;
  v65 = v29;
  sub_1BDAC31B0(&qword_1EF50DDB0, type metadata accessor for MentionNotificationRequestV2, (uint64_t)&protocol conformance descriptor for MentionNotificationRequestV2);
  v30 = v49;
  v31 = (uint64_t)v47;
  sub_1BDBFCD80();
  sub_1BDB901EC();
  v32 = swift_allocObject();
  v33 = v40;
  *(_QWORD *)(v32 + 16) = sub_1BDB92190;
  *(_QWORD *)(v32 + 24) = v33;
  swift_retain();
  sub_1BDB4E4C4(v31);
  swift_release();
  swift_release();
  sub_1BDAE1658(v31, type metadata accessor for MentionNotificationRequestV2);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)didCompleteInstallOrUpdateWithPreviousBuildNumber:(id)a3 previousVersion:(id)a4 currentBuildNumber:(id)a5 currentVersion:(id)a6 platformName:(id)a7 continuationToken:(id)a8 callback:(id)a9
{
  uint64_t updated;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  ICNotesInvernessClientObjc *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  ICNotesInvernessClientObjc *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;

  v36 = self;
  updated = type metadata accessor for DidCompleteInstallOrUpdateRequest(0);
  MEMORY[0x1E0C80A78](updated);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = _Block_copy(a9);
  v34 = sub_1BDBFD6F8();
  v14 = v13;
  v33 = sub_1BDBFD6F8();
  v16 = v15;
  v38 = v15;
  v32 = sub_1BDBFD6F8();
  v18 = v17;
  v37 = v17;
  v31 = sub_1BDBFD6F8();
  v20 = v19;
  v39 = v19;
  v30 = sub_1BDBFD6F8();
  v22 = v21;
  v23 = a8;
  v36 = v36;
  v24 = sub_1BDBFC990();
  v26 = v25;

  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v35;
  v40 = v34;
  v41 = v14;
  v42 = v33;
  v43 = v16;
  v44 = v31;
  v45 = v20;
  v46 = v32;
  v47 = v18;
  v48 = v30;
  v49 = v22;
  v50 = v24;
  v51 = v26;
  sub_1BDAC31B0(&qword_1ED23A248, type metadata accessor for DidCompleteInstallOrUpdateRequest, (uint64_t)&protocol conformance descriptor for DidCompleteInstallOrUpdateRequest);
  sub_1BDBFCD80();
  v28 = v36;
  sub_1BDB901EC();
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = sub_1BDB92044;
  *(_QWORD *)(v29 + 24) = v27;
  swift_retain();
  sub_1BDB4E630((uint64_t)v12);
  swift_release();
  swift_release();
  sub_1BDAE1658((uint64_t)v12, type metadata accessor for DidCompleteInstallOrUpdateRequest);
  swift_release();
  sub_1BDAEB7EC(v24, v26);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)runGarbageCollectorWithProgress:(id)a3 callback:(id)a4
{
  void *v6;
  id v7;
  ICNotesInvernessClientObjc *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1BDB91D88(a3, 0, 0xF000000000000000, v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (ICNotesInvernessClientObjc)init
{
  ICNotesInvernessClientObjc *result;

  result = (ICNotesInvernessClientObjc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
