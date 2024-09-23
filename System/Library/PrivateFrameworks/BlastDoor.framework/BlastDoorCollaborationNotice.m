@implementation BlastDoorCollaborationNotice

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, type metadata accessor for CollaborationNotice, &OBJC_IVAR___BlastDoorCollaborationNotice_collaborationNotice);
}

- (int64_t)version
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorCollaborationNotice_collaborationNotice);
}

- (NSString)guidString
{
  return (NSString *)sub_1AD4C918C();
}

- (NSData)highlightEvent
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  BlastDoorCollaborationNotice *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v15;

  v3 = type metadata accessor for CollaborationHighlightEvent(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorCollaborationNotice_collaborationNotice;
  v7 = type metadata accessor for CollaborationNotice(0);
  sub_1AD0D3D2C((uint64_t)&v6[*(int *)(v7 + 24)], (uint64_t)v5, type metadata accessor for CollaborationHighlightEvent);
  v8 = self;
  sub_1AD5F2A98();
  v10 = v9;
  v12 = v11;
  v13 = (void *)sub_1AD63AFA0();
  sub_1AD00412C(v10, v12);
  sub_1AD066230((uint64_t)v5, type metadata accessor for CollaborationHighlightEvent);

  return (NSData *)v13;
}

- (unint64_t)highlightEventType
{
  BlastDoorCollaborationNotice *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  sub_1AD4AEEAC();
  v4 = v3;

  return v4;
}

- (NSDate)noticeDate
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
  v7 = (char *)self + OBJC_IVAR___BlastDoorCollaborationNotice_collaborationNotice;
  v8 = type metadata accessor for CollaborationNotice(0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 28)], v3);
  v9 = (void *)sub_1AD63B018();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v9;
}

- (BlastDoorCollaborationNotice)init
{
  BlastDoorCollaborationNotice *result;

  result = (BlastDoorCollaborationNotice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorCollaborationNotice_collaborationNotice, type metadata accessor for CollaborationNotice);
}

@end
