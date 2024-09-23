@implementation SFTabSnapshotVisibility

- (SFTabSnapshotVisibility)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotVisibility_wrapped);
  *v2 = 0;
  v2[1] = 1;
  v4.receiver = self;
  v4.super_class = (Class)SFTabSnapshotVisibility;
  return -[SFTabSnapshotVisibility init](&v4, sel_init);
}

- (SFTabSnapshotVisibility)initWithPriority:(double)a3 tier:(unint64_t)a4
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR___SFTabSnapshotVisibility_wrapped;
  *(double *)v4 = a3;
  *((_QWORD *)v4 + 1) = a4;
  v6.receiver = self;
  v6.super_class = (Class)SFTabSnapshotVisibility;
  return -[SFTabSnapshotVisibility init](&v6, sel_init);
}

- (double)priority
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotVisibility_wrapped);
}

- (void)setPriority:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotVisibility_wrapped) = a3;
}

- (unint64_t)tier
{
  return *(_QWORD *)&self->wrapped[OBJC_IVAR___SFTabSnapshotVisibility_wrapped];
}

- (void)setTier:(unint64_t)a3
{
  *(_QWORD *)&self->wrapped[OBJC_IVAR___SFTabSnapshotVisibility_wrapped] = a3;
}

@end
