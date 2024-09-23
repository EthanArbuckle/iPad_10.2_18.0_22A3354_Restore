@implementation ICTTAudioDocument

- (ICTTAudioDocument)initWithReplicaID:(id)a3 compatibleDocument:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v10;

  v5 = sub_1BDBFCB40();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDBFCB10();
  v8 = a4;
  return (ICTTAudioDocument *)ICTTAudioDocument.init(replicaID:compatibleDocument:)((uint64_t)v7, (uint64_t)a4);
}

- (id)document
{
  return *(id *)((char *)&self->super.isa + OBJC_IVAR___ICTTAudioDocument_document);
}

- (void)setDocument:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTTAudioDocument_document);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTTAudioDocument_document) = (Class)a3;
  v3 = a3;

}

- (id)archivedData
{
  ICTTAudioDocument *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  v2 = self;
  v3 = -[ICTTAudioDocument document](v2, sel_document);
  v4 = objc_msgSend(v3, sel_archivedData);

  v5 = sub_1BDBFC990();
  v7 = v6;

  v8 = (void *)sub_1BDBFC978();
  sub_1BDAEB7EC(v5, v7);
  return v8;
}

+ (id)unarchiveFromData:(id)a3 replicaID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v17;

  v6 = sub_1BDBFCB40();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = a4;
  v12 = sub_1BDBFC990();
  v14 = v13;

  sub_1BDBFCB10();
  swift_getObjCClassMetadata();
  v15 = sub_1BDAE66D8();
  sub_1BDAEB7EC(v12, v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15;
}

- (unint64_t)mergeWithMergeableData:(id)a3 replicaID:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  ICTTAudioDocument *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v19;

  v7 = sub_1BDBFCB40();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = sub_1BDBFC990();
  v16 = v15;

  sub_1BDBFCB10();
  v17 = ICTTAudioDocument.merge(withMergeableData:replicaID:)();
  sub_1BDAEB7EC(v14, v16);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (unint64_t)v17;
}

- (NSArray)orderedFragmentUUIDs
{
  ICTTAudioDocument *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = ICTTAudioDocument.orderedFragments.getter();
  sub_1BDAE5F44(v3);

  swift_bridgeObjectRelease();
  sub_1BDBFCB40();
  v4 = (void *)sub_1BDBFD9C8();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (void)updateAfterLoadWithSubAttachmentIdentifierMap:(id)a3
{
  uint64_t v4;
  ICTTAudioDocument *v5;

  v4 = sub_1BDBFD5C0();
  v5 = self;
  sub_1BDAE6C3C(v4);

  swift_bridgeObjectRelease();
}

- (NSString)transcriptAsPlainText
{
  ICTTAudioDocument *v2;
  void *v3;

  v2 = self;
  ICTTAudioDocument.transcriptAsPlainText.getter();

  v3 = (void *)sub_1BDBFD6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSNumber)transcriptVersion
{
  ICTTAudioDocument *v2;
  unint64_t v3;
  NSNumber *result;
  id v5;
  void *v6;
  id v7;

  v2 = self;
  v3 = ICTTAudioDocument.orderedFragments.getter();
  if (!(v3 >> 62))
  {
    result = *(NSNumber **)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_3;
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  result = (NSNumber *)sub_1BDBFE574();
  if (!result)
    goto LABEL_8;
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    v5 = (id)MEMORY[0x1C3B79954](0, v3);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v5 = *(id *)(v3 + 32);
LABEL_6:
    v6 = v5;
LABEL_9:
    swift_bridgeObjectRelease();
    v7 = objc_msgSend(v6, sel_transcriptVersion);

    return (NSNumber *)v7;
  }
  __break(1u);
  return result;
}

- (ICTTAudioDocument)init
{
  ICTTAudioDocument *result;

  result = (ICTTAudioDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (BOOL)isCallRecording
{
  ICTTAudioDocument *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = ICTTAudioDocument.isCallRecording.getter();

  return v3 & 1;
}

- (void)setIsCallRecording:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  ICTTAudioDocument *v8;
  ICTTAudioDocument *v9;
  ICTTAudioDocument *v10;

  v3 = a3;
  v10 = self;
  v4 = -[ICTTAudioDocument document](v10, sel_document);
  v5 = objc_msgSend(v4, sel_rootObject);

  if (!v5)
  {
    v8 = v10;
    goto LABEL_5;
  }
  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    v7 = (void *)v6;
    v9 = (ICTTAudioDocument *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithBool_, v3);
    objc_msgSend(v7, sel_setCallRecording_, v9);

    swift_unknownObjectRelease();
    v8 = v9;
LABEL_5:

    return;
  }

  swift_unknownObjectRelease();
}

- (unint64_t)callType
{
  ICTTAudioDocument *v2;
  id v3;

  v2 = self;
  v3 = ICTTAudioDocument.callType.getter();

  return (unint64_t)v3;
}

- (void)setCallType:(unint64_t)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  ICTTAudioDocument *v8;
  ICTTAudioDocument *v9;
  ICTTAudioDocument *v10;

  v10 = self;
  v4 = -[ICTTAudioDocument document](v10, sel_document);
  v5 = objc_msgSend(v4, sel_rootObject);

  if (!v5)
  {
    v8 = v10;
    goto LABEL_5;
  }
  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    v7 = (void *)v6;
    v9 = (ICTTAudioDocument *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithUnsignedInteger_, a3);
    objc_msgSend(v7, sel_setCallType_, v9);

    swift_unknownObjectRelease();
    v8 = v9;
LABEL_5:

    return;
  }

  swift_unknownObjectRelease();
}

+ (void)registerWithICCRCoder
{
  void *v0;
  uint64_t ObjCClassFromMetadata;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v0 = (void *)objc_opt_self();
  type metadata accessor for ICTTAudioRecording((uint64_t)v0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)sub_1BDBFD6C8();
  objc_msgSend(v0, sel_registerClass_forType_, ObjCClassFromMetadata, v2);

  type metadata accessor for ICTTAudioRecording.Fragment();
  v3 = swift_getObjCClassFromMetadata();
  v4 = (void *)sub_1BDBFD6C8();
  objc_msgSend(v0, sel_registerClass_forType_, v3, v4);

  type metadata accessor for ICTTTranscriptSegment();
  v5 = swift_getObjCClassFromMetadata();
  v6 = (id)sub_1BDBFD6C8();
  objc_msgSend(v0, sel_registerClass_forType_, v5, v6);

}

@end
