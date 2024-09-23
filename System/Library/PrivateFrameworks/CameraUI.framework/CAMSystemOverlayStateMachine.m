@implementation CAMSystemOverlayStateMachine

- (CAMSystemOverlayStateMachine)init
{
  return (CAMSystemOverlayStateMachine *)sub_1DB95C6A0();
}

- (CAMSystemOverlayVisibilityDelegate)delegate
{
  return (CAMSystemOverlayVisibilityDelegate *)(id)MEMORY[0x1DF0B5C48]((char *)self+ OBJC_IVAR___CAMSystemOverlayStateMachine_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (double)delayedHideDuration
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility), sel_delayedHideDuration);
  return result;
}

- (void)setDelayedHideDuration:(double)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility), sel_setDelayedHideDuration_, a3);
}

- (NSString)name
{
  void *v2;
  CAMSystemOverlayStateMachine *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility);
  v3 = self;
  v4 = objc_msgSend(v2, sel_name);
  sub_1DB979FB4();

  v5 = (void *)sub_1DB979FA8();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setName:(id)a3
{
  void *v4;
  CAMSystemOverlayStateMachine *v5;
  id v6;

  sub_1DB979FB4();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility);
  v5 = self;
  v6 = (id)sub_1DB979FA8();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setName_, v6);

}

- (BOOL)wantsOverlayHint
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_wantsOverlayHint);
}

- (void)setWantsOverlayHint:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_wantsOverlayHint) = a3;
}

- (BOOL)halfPressEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_halfPressEnabled);
}

- (void)setHalfPressEnabled:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_halfPressEnabled) = a3;
}

- (void)hideImmediately
{
  void *v2;
  CAMSystemOverlayStateMachine *v3;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility);
  v3 = self;
  objc_msgSend(v2, sel_hideImmediately);
  *((_BYTE *)&v3->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine__wantsOverlayVisible) = 0;

}

- (void)showTransiently
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility), sel_showTransiently);
}

- (BOOL)isVisible
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility), sel_isVisible);
}

- (void)addReason:(int64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility), sel_addReason_, a3);
}

- (void)removeReason:(int64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___CAMSystemOverlayStateMachine_visibility), sel_removeReason_, a3);
}

- (void)systemOverlayVisibility:(id)a3 changedForReason:(int64_t)a4
{
  CAMSystemOverlayStateMachine *v7;

  swift_unknownObjectRetain();
  v7 = self;
  sub_1DB95CAE0(a3, a4);
  swift_unknownObjectRelease();

}

- (void)systemOverlayVisibilityBeganHidingTimer:(id)a3
{
  sub_1DB95CBE0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_systemOverlayVisibilityBeganHidingTimer_);
}

- (void)systemOverlayVisibilityCancelledHidingTimer:(id)a3
{
  sub_1DB95CBE0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_systemOverlayVisibilityCancelledHidingTimer_);
}

- (BOOL)wantsOverlayVisible
{
  CAMSystemOverlayStateMachine *v2;
  char v3;

  v2 = self;
  v3 = sub_1DB95CC94();

  return v3 & 1;
}

- (unint64_t)currentStage
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___CAMSystemOverlayStateMachine_stageStack;
  swift_beginAccess();
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v3)
    return *(_QWORD *)(*(_QWORD *)v2 + 8 * v3 + 24);
  else
    return 0;
}

- (void)endAllStages
{
  CAMSystemOverlayStateMachine *v2;

  v2 = self;
  sub_1DB95CD80();

}

- (void)handleStage:(unint64_t)a3 phase:(unint64_t)a4
{
  CAMSystemOverlayStateMachine *v6;

  v6 = self;
  sub_1DB95CE18(a3, a4);

}

- (void).cxx_destruct
{

  sub_1DB955860((uint64_t)self + OBJC_IVAR___CAMSystemOverlayStateMachine_delegate);
  swift_bridgeObjectRelease();
}

@end
