@implementation EKEventEditViewControllerOOPImpl

- (_TtC10EventKitUI32EKEventEditViewControllerOOPImpl)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1AF9F7BF0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC10EventKitUI32EKEventEditViewControllerOOPImpl *)sub_1AF9DCA94(v5, v7, a4);
}

- (_TtC10EventKitUI32EKEventEditViewControllerOOPImpl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AF9DFCF8();
}

- (void)viewDidLoad
{
  _TtC10EventKitUI32EKEventEditViewControllerOOPImpl *v2;

  v2 = self;
  sub_1AF9DCC88();

}

- (CGSize)preferredContentSize
{
  _TtC10EventKitUI32EKEventEditViewControllerOOPImpl *v2;
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  CGSize result;

  v2 = self;
  v3 = EKUIContainedControllerIdealWidth();
  EKUIContainedControllerIdealHeight();

  v5 = CGSizeMake(v4, v3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)sub_1AF9DF310((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore);
}

- (void)setEventStore:(id)a3
{
  _TtC10EventKitUI32EKEventEditViewControllerOOPImpl *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1AF9E01E4(a3, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore, (void (*)(void *))sub_1AF9E2C10);

}

- (EKEvent)event
{
  return (EKEvent *)sub_1AF9DF310((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event);
}

- (void)setEvent:(id)a3
{
  _TtC10EventKitUI32EKEventEditViewControllerOOPImpl *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1AF9E01E4(a3, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event, (void (*)(void *))sub_1AF9D53B0);

}

- (EKEventEditViewDelegateAllOutOfProcess)editViewDelegate
{
  swift_beginAccess();
  return (EKEventEditViewDelegateAllOutOfProcess *)(id)swift_unknownObjectRetain();
}

- (void)setEditViewDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editViewDelegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)cancelEditing
{
  sub_1AF9DFA30((char *)self, (uint64_t)a2, (void (*)(id))sub_1AF9E2C74);
}

- (EKCalendar)defaultCalendar
{
  return (EKCalendar *)sub_1AF9DF310((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar);
}

- (void)setDefaultCalendar:(id)a3
{
  _TtC10EventKitUI32EKEventEditViewControllerOOPImpl *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1AF9E01E4(a3, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar, sub_1AF9E2EB0);

}

- (UIColor)editorBackgroundColor
{
  return (UIColor *)sub_1AF9DF310((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor);
}

- (void)setEditorBackgroundColor:(id)a3
{
  _TtC10EventKitUI32EKEventEditViewControllerOOPImpl *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1AF9E01E4(a3, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor, sub_1AF9E307C);

}

- (BOOL)hasUnsavedChanges
{
  uint64_t *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC10EventKitUI32EKEventEditViewControllerOOPImpl *v15;
  uint64_t v16;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView);
  swift_beginAccess();
  v4 = (void *)v3[1];
  if (v4)
  {
    v5 = (void *)v3[9];
    v6 = (void *)v3[8];
    v16 = v3[7];
    v13 = v3[5];
    v14 = v3[6];
    v11 = v3[3];
    v12 = v3[4];
    v10 = v3[2];
    v7 = *v3;
    v15 = self;
    sub_1AF9DFEA0(v7, v4, v10, v11, v12, v13, v14, v16, v6, v5);
    v8 = sub_1AF9E30C4();
    sub_1AF9DFE0C(v7, v4, v10, v11, v12, v13, v14, v16, v6, v5);

  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

- (void)focusAndSelectTitle
{
  sub_1AF9DFA30((char *)self, (uint64_t)a2, (void (*)(id))sub_1AF9E3118);
}

- (void)focusAndSelectStartDate
{
  sub_1AF9DFA30((char *)self, (uint64_t)a2, (void (*)(id))sub_1AF9E3188);
}

- (void)focusTitle
{
  sub_1AF9DFA30((char *)self, (uint64_t)a2, (void (*)(id))sub_1AF9E31F8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostingController));
  sub_1AF9DFE0C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._view + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tab + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tabElement+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(void **)((char *)&self->super._navigationItem+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView), *(void **)((char *)&self->super._toolbarItems+ OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostViewModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor));
}

@end
