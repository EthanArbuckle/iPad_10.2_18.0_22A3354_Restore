@implementation PaperDocumentEngagementData

- (NSString)attachmentIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DD9D2140();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)hasActivity
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasActivity);
}

- (void)setHasActivity:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasActivity) = a3;
}

- (BOOL)hasSmallStateUsage
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasSmallStateUsage);
}

- (void)setHasSmallStateUsage:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasSmallStateUsage) = a3;
}

- (BOOL)hasMediumStateUsage
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasMediumStateUsage);
}

- (void)setHasMediumStateUsage:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasMediumStateUsage) = a3;
}

- (BOOL)hasLargeStateUsage
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasLargeStateUsage);
}

- (void)setHasLargeStateUsage:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasLargeStateUsage) = a3;
}

- (BOOL)hasFullscreenStateUsage
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasFullscreenStateUsage);
}

- (void)setHasFullscreenStateUsage:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasFullscreenStateUsage) = a3;
}

- (int64_t)startPageCount
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_startPageCount);
}

- (void)setStartPageCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_startPageCount) = (Class)a3;
}

- (int64_t)endPageCount
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_endPageCount);
}

- (void)setEndPageCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_endPageCount) = (Class)a3;
}

- (BOOL)hasGestures
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasGestures);
}

- (void)setHasGestures:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasGestures) = a3;
}

- (BOOL)hasScroll
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasScroll);
}

- (void)setHasScroll:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasScroll) = a3;
}

- (BOOL)hasPagination
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasPagination);
}

- (void)setHasPagination:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasPagination) = a3;
}

- (BOOL)hasPinchZoom
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasPinchZoom);
}

- (void)setHasPinchZoom:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasPinchZoom) = a3;
}

- (BOOL)hasPinchToExpandState
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasPinchToExpandState);
}

- (void)setHasPinchToExpandState:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasPinchToExpandState) = a3;
}

- (BOOL)hasCollabView
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasCollabView);
}

- (void)setHasCollabView:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasCollabView) = a3;
}

- (BOOL)hasCollabEdit
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasCollabEdit);
}

- (void)setHasCollabEdit:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_hasCollabEdit) = a3;
}

- (void)reset
{
  sub_1DD9C25F0();
}

- (int64_t)startState
{
  return qword_1DD9EB950[*((char *)&self->super.isa
                         + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_startDisplayMode)];
}

- (int64_t)endState
{
  return qword_1DD9EB950[*((char *)&self->super.isa
                         + OBJC_IVAR____TtC11NotesEditor27PaperDocumentEngagementData_endDisplayMode)];
}

- (_TtC11NotesEditor27PaperDocumentEngagementData)init
{
  _TtC11NotesEditor27PaperDocumentEngagementData *result;

  result = (_TtC11NotesEditor27PaperDocumentEngagementData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
