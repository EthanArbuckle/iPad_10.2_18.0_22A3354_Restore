@implementation RealtimeCollaborationSelectionDocument

- (unint64_t)mergeWithData:(id)a3
{
  id v4;
  _TtC11NotesShared38RealtimeCollaborationSelectionDocument *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a3;
  v5 = self;
  v6 = sub_1BDBFC990();
  v8 = v7;

  v9 = RealtimeCollaborationSelectionDocument.merge(with:)();
  sub_1BDAEB7EC(v6, v8);

  return (unint64_t)v9;
}

- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)initWithReplica:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC11NotesShared38RealtimeCollaborationSelectionDocument *result;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED23AD30);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1BDBFCB10();
    v7 = sub_1BDBFCB40();
    v8 = 0;
  }
  else
  {
    v7 = sub_1BDBFCB40();
    v8 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, v8, 1);
  result = (_TtC11NotesShared38RealtimeCollaborationSelectionDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)initWithVersion:(id)a3 rootObject:(id)a4 replica:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtC11NotesShared38RealtimeCollaborationSelectionDocument *result;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED23AD30);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1BDBFCB10();
    v11 = sub_1BDBFCB40();
    v12 = 0;
  }
  else
  {
    v11 = sub_1BDBFCB40();
    v12 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, v12, 1);
  v13 = a3;
  v14 = a4;
  result = (_TtC11NotesShared38RealtimeCollaborationSelectionDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _TtC11NotesShared38RealtimeCollaborationSelectionDocument *result;
  uint64_t v19;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED23AD30);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    sub_1BDBFCB10();
    v13 = sub_1BDBFCB40();
    v14 = 0;
  }
  else
  {
    v13 = sub_1BDBFCB40();
    v14 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, v14, 1);
  v15 = a3;
  v16 = a4;
  v17 = a5;
  result = (_TtC11NotesShared38RealtimeCollaborationSelectionDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)init
{
  _TtC11NotesShared38RealtimeCollaborationSelectionDocument *result;

  result = (_TtC11NotesShared38RealtimeCollaborationSelectionDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11NotesShared38RealtimeCollaborationSelectionDocument_localParticipantID;
  v3 = sub_1BDBFCB40();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
