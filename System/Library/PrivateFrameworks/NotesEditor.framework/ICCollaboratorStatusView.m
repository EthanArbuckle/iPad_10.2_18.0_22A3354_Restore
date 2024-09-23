@implementation ICCollaboratorStatusView

- (ICCollaboratorStatusView)initWithCoder:(id)a3
{
  uint64_t v4;
  ICCollaboratorStatusView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorStatusView_hasDisplayedInWindow) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorStatusView_avatarView) = 0;
  v4 = OBJC_IVAR___ICCollaboratorStatusView_selectionViews;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_1DD904868(MEMORY[0x1E0DEE9D8]);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorStatusView_isRemovingFromSuperview) = 0;

  result = (ICCollaboratorStatusView *)sub_1DD9D2CEC();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CollaboratorStatusView();
  v7 = v13.receiver;
  v8 = a4;
  v9 = -[ICCollaboratorStatusView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_1DD7C0C74(0, (unint64_t *)&qword_1EDBFA240);
    v11 = v7;
    v7 = v10;
    LOBYTE(v10) = sub_1DD9D28E4();

    if ((v10 & 1) == 0)
      return v7;
  }
  else
  {

  }
  v7 = 0;
  return v7;
}

- (void)didMoveToWindow
{
  ICCollaboratorStatusView *v2;

  v2 = self;
  sub_1DD93E228();

}

- (ICCollaboratorStatusView)initWithFrame:(CGRect)a3
{
  ICCollaboratorStatusView *result;

  result = (ICCollaboratorStatusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1DD94AC64((uint64_t)self + OBJC_IVAR___ICCollaboratorStatusView_collaboratorStatus);
  swift_bridgeObjectRelease();
}

@end
