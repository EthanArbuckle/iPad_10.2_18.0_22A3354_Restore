@implementation EKEventViewControllerOOPImpl

- (BOOL)hasInProcessNavBar
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar;
  swift_beginAccess();
  return *v2;
}

- (void)setHasInProcessNavBar:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar;
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC10EventKitUI28EKEventViewControllerOOPImpl)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10EventKitUI28EKEventViewControllerOOPImpl *)sub_1AF9E8328(v5, v7, a4);
}

- (_TtC10EventKitUI28EKEventViewControllerOOPImpl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AF9ED5BC();
}

- (void)viewDidLoad
{
  _TtC10EventKitUI28EKEventViewControllerOOPImpl *v2;

  v2 = self;
  sub_1AF9E85B8();

}

- (CGSize)preferredContentSize
{
  _TtC10EventKitUI28EKEventViewControllerOOPImpl *v2;
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

- (void)doneButtonTapped
{
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC10EventKitUI28EKEventViewControllerOOPImpl *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  swift_beginAccess();
  v4 = (void *)v3[1];
  if (v4)
  {
    v5 = *v3;
    v8 = *v3;
    v11 = v3[3];
    v9 = v3[2];
    v6 = v3[4];
    v7 = v3[5];
    v12 = v3[6];
    v10 = self;
    sub_1AF9ED7D8(v5, v4, v9, v11, v6, v7, v12);
    sub_1AF9D5124();
    sub_1AF9ED76C(v8, v4, v9, v11, v6, v7, v12);

  }
}

- (void)eventEditViewCompletedWith:(int64_t)a3 eventID:(id)a4 waitUntil:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _TtC10EventKitUI28EKEventViewControllerOOPImpl *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v8 = sub_1AF9F7BF0();
  v22 = v9;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  swift_beginAccess();
  v11 = (void *)v10[1];
  if (v11)
  {
    v12 = v10[6];
    v20 = v10[5];
    v21 = v8;
    v19 = v10[2];
    v13 = *v10;
    v15 = *v10;
    v16 = v10[4];
    v14 = v10[3];
    v18 = a5;
    v17 = self;
    sub_1AF9ED7D8(v13, v11, v19, v14, v16, v20, v12);
    sub_1AF9D5240(a3, v21, v22, (uint64_t)a5);
    sub_1AF9ED76C(v15, v11, v19, v14, v16, v20, v12);

  }
  swift_bridgeObjectRelease();
}

- (void)eventEditViewPresented:(BOOL)a3
{
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC10EventKitUI28EKEventViewControllerOOPImpl *v12;
  uint64_t v13;
  _BOOL4 v14;

  v14 = a3;
  v4 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  swift_beginAccess();
  v5 = (void *)v4[1];
  if (v5)
  {
    v13 = v4[2];
    v6 = *v4;
    v10 = *v4;
    v11 = v4[3];
    v7 = v4[4];
    v8 = v4[5];
    v9 = v4[6];
    v12 = self;
    sub_1AF9ED7D8(v6, v5, v13, v11, v7, v8, v9);
    sub_1AF9D5330(v14);
    sub_1AF9ED76C(v10, v5, v13, v11, v7, v8, v9);

  }
}

- (EKEvent)event
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event);
  swift_beginAccess();
  return (EKEvent *)*v2;
}

- (void)setEvent:(id)a3
{
  _TtC10EventKitUI28EKEventViewControllerOOPImpl *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1AF9EDA38(a3);

}

- (BOOL)allowsEditing
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsEditing:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing, (void (*)(_QWORD))sub_1AF9D5594);
}

- (EKEventViewDelegate)delegate
{
  swift_beginAccess();
  return (EKEventViewDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)allowsCalendarPreview
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsCalendarPreview:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview, (void (*)(_QWORD))sub_1AF9D5714);
}

- (BOOL)showsDoneButton
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)calendarPreviewIsInlineDayView
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView;
  swift_beginAccess();
  return *v2;
}

- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView, (void (*)(_QWORD))sub_1AF9D5894);
}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  BOOL *v2;

  v2 = (BOOL *)self
     + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter;
  swift_beginAccess();
  return *v2;
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter, (void (*)(_QWORD))sub_1AF9D5A14);
}

- (BOOL)ICSPreview
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview;
  swift_beginAccess();
  return *v2;
}

- (void)setICSPreview:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview, (void (*)(_QWORD))sub_1AF9D5B94);
}

- (BOOL)allowsInviteResponses
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsInviteResponses:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses, (void (*)(_QWORD))sub_1AF9D5D14);
}

- (BOOL)showsAddToCalendarForICSPreview
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview, (void (*)(_QWORD))sub_1AF9D5E94);
}

- (BOOL)showsUpdateCalendarForICSPreview
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview, (void (*)(_QWORD))sub_1AF9D6014);
}

- (BOOL)showsDeleteForICSPreview
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDeleteForICSPreview:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview, (void (*)(_QWORD))sub_1AF9D6194);
}

- (BOOL)allowsSubitems
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsSubitems:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems, (void (*)(_QWORD))sub_1AF9D631C);
}

- (BOOL)showsOutOfDateMessage
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsOutOfDateMessage:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage, (void (*)(_QWORD))sub_1AF9D649C);
}

- (BOOL)showsDelegatorMessage
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDelegatorMessage:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage, (void (*)(_QWORD))sub_1AF9D661C);
}

- (BOOL)showsDelegateMessage
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDelegateMessage:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage, (void (*)(_QWORD))sub_1AF9D679C);
}

- (BOOL)showsDetectedConferenceItem
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDetectedConferenceItem:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem, (void (*)(_QWORD))sub_1AF9D691C);
}

- (BOOL)minimalMode
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode;
  swift_beginAccess();
  return *v2;
}

- (void)setMinimalMode:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode, (void (*)(_QWORD))sub_1AF9D6AA0);
}

- (BOOL)noninteractivePlatterMode
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode;
  swift_beginAccess();
  return *v2;
}

- (void)setNoninteractivePlatterMode:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode, (void (*)(_QWORD))sub_1AF9D6C20);
}

- (BOOL)isLargeDayView
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLargeDayView:(BOOL)a3
{
  sub_1AF9ED238((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView, (void (*)(_QWORD))sub_1AF9D6DA8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostingController));
  sub_1AF9ED76C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._view + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tabBarItem + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tab + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event));
  swift_unknownObjectRelease();
}

@end
