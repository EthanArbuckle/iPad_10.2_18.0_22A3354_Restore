@implementation AXTwiceCompanionPullToDismissManager

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_21EC6732C(v4);

  return v6;
}

- (id)interactionControllerForDismissal:(id)a3
{
  _TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager *v4;
  void *v5;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = sub_21EC67508();
  swift_unknownObjectRelease();

  return v5;
}

- (_TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_isInteractive) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AXTwiceCompanionPullToDismissManager();
  return -[AXTwiceCompanionPullToDismissManager init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI36AXTwiceCompanionPullToDismissManager_percentDrivenInteractive));
}

@end
