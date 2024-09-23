@implementation DisplayMainViewController.DisplayUndoManager

- (void)undo
{
  _TtCC17ContinuityDisplay25DisplayMainViewController18DisplayUndoManager *v2;

  v2 = self;
  sub_1000348A4((__n128)xmmword_100058AD0);

}

- (void)redo
{
  _TtCC17ContinuityDisplay25DisplayMainViewController18DisplayUndoManager *v2;

  v2 = self;
  sub_1000348A4((__n128)xmmword_1000593C0);

}

- (BOOL)canUndo
{
  return 1;
}

- (BOOL)canRedo
{
  return 1;
}

- (_TtCC17ContinuityDisplay25DisplayMainViewController18DisplayUndoManager)init
{
  return (_TtCC17ContinuityDisplay25DisplayMainViewController18DisplayUndoManager *)sub_100034944();
}

- (void).cxx_destruct
{
  sub_100037154((uint64_t)self, (uint64_t)a2, OBJC_IVAR____TtCC17ContinuityDisplay25DisplayMainViewController18DisplayUndoManager_delegate);
}

@end
