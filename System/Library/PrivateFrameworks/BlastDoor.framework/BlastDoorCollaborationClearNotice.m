@implementation BlastDoorCollaborationClearNotice

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for CollaborationClearNotice, &OBJC_IVAR___BlastDoorCollaborationClearNotice_collaborationClearNotice);
}

- (int64_t)version
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BlastDoorCollaborationClearNotice_collaborationClearNotice);
}

- (NSString)guidString
{
  return (NSString *)sub_1AD4C918C();
}

- (NSDate)date
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = sub_1AD63B03C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___BlastDoorCollaborationClearNotice_collaborationClearNotice;
  v8 = type metadata accessor for CollaborationClearNotice();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 24)], v3);
  v9 = (void *)sub_1AD63B018();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v9;
}

- (NSString)collaborationId
{
  void *v2;

  type metadata accessor for CollaborationClearNotice();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorCollaborationClearNotice)init
{
  BlastDoorCollaborationClearNotice *result;

  result = (BlastDoorCollaborationClearNotice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorCollaborationClearNotice_collaborationClearNotice, (uint64_t (*)(_QWORD))type metadata accessor for CollaborationClearNotice);
}

@end
