@implementation TrackedSubjectInternal

- (NSUUID)identifier
{
  return (NSUUID *)sub_23A6871BC((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], &OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_identifier, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE9D0]);
}

- (void)setIdentifier:(id)a3
{
  sub_23A6872D0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], (void (*)(uint64_t))MEMORY[0x24BDCE9F8], &OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_identifier);
}

- (CGRect)rect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_rect);
  v3 = *(double *)&self->type[OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_rect];
  v4 = *(double *)&self->rect[OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_rect + 7];
  v5 = *(double *)&self->rect[OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_rect + 15];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setRect:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore22TrackedSubjectInternal_rect) = a3;
}

@end
