@implementation EKCalendarChooserOOPImpl

- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)initWithEventStore:(id)a3
{
  id v3;
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *v4;

  v3 = a3;
  v4 = (_TtC10EventKitUI24EKCalendarChooserOOPImpl *)sub_1AF9CCA50(v3);

  return v4;
}

- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AF9CCBD4();
}

- (void)viewDidLoad
{
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *v2;

  v2 = self;
  sub_1AF9C7160((uint64_t)v2);

}

- (CGSize)preferredContentSize
{
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *v2;
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

- (int64_t)selectionStyle
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setSelectionStyle:(int64_t)a3
{
  sub_1AF9C9FD0((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle, (void (*)(_QWORD))sub_1AF9F012C);
}

- (int64_t)displayStyle
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setDisplayStyle:(int64_t)a3
{
  sub_1AF9C9FD0((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle, (void (*)(_QWORD))sub_1AF9F02B0);
}

- (unint64_t)entityType
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType);
  swift_beginAccess();
  return *v2;
}

- (void)setEntityType:(unint64_t)a3
{
  sub_1AF9C9FD0((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType, (void (*)(_QWORD))sub_1AF9F0438);
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore));
}

- (BOOL)showIdentityChooser
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser;
  swift_beginAccess();
  return *v2;
}

- (void)setShowIdentityChooser:(BOOL)a3
{
  sub_1AF9CB37C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser, (void (*)(_QWORD))sub_1AF9F05B8);
}

- (BOOL)showDelegateSetupCell
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell;
  swift_beginAccess();
  return *v2;
}

- (void)setShowDelegateSetupCell:(BOOL)a3
{
  sub_1AF9CB37C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell, (void (*)(_QWORD))sub_1AF9F0738);
}

- (EKCalendarChooserDelegate)delegate
{
  swift_beginAccess();
  return (EKCalendarChooserDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (NSSet)selectedCalendars
{
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *v2;
  void *v3;

  v2 = self;
  sub_1AF9C9700();

  sub_1AF9C6B78(0, &qword_1EEE6BB48);
  sub_1AF9CD444();
  v3 = (void *)sub_1AF9F7CB0();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (void)setSelectedCalendars:(id)a3
{
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *v4;
  uint64_t v5;

  sub_1AF9C6B78(0, &qword_1EEE6BB48);
  sub_1AF9CD444();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars) = (Class)sub_1AF9F7CC8();
  v4 = self;
  swift_bridgeObjectRelease();
  v5 = swift_bridgeObjectRetain();
  sub_1AF9C9A44(v5);

  swift_bridgeObjectRelease();
}

- (BOOL)showDetailAccessories
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories;
  swift_beginAccess();
  return *v2;
}

- (void)setShowDetailAccessories:(BOOL)a3
{
  sub_1AF9CB37C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories, (void (*)(_QWORD))sub_1AF9F0A44);
}

- (int64_t)chooserMode
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode);
  swift_beginAccess();
  return *v2;
}

- (void)setChooserMode:(int64_t)a3
{
  sub_1AF9C9FD0((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode, (void (*)(_QWORD))sub_1AF9F0BC4);
}

- (BOOL)disableCalendarsUnselectedByFocus
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus;
  swift_beginAccess();
  return *v2;
}

- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3
{
  sub_1AF9CB37C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus, (void (*)(_QWORD))sub_1AF9F0D44);
}

- (BOOL)allowsPullToRefresh
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsPullToRefresh:(BOOL)a3
{
  sub_1AF9CB37C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh, (void (*)(_QWORD))sub_1AF9F0EC4);
}

- (EKCalendar)selectedCalendar
{
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = swift_bridgeObjectRetain();
  v4 = (void *)sub_1AF9CA7BC(v3);

  swift_bridgeObjectRelease();
  return (EKCalendar *)v4;
}

- (void)setSelectedCalendar:(id)a3
{
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1AF9CD49C(a3);

}

- (BOOL)showsDeclinedEventsSetting
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsDeclinedEventsSetting:(BOOL)a3
{
  sub_1AF9CB37C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting, (void (*)(_QWORD))sub_1AF9F1518);
}

- (EKSource)limitedToSource
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource);
  swift_beginAccess();
  return (EKSource *)*v2;
}

- (void)setLimitedToSource:(id)a3
{
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1AF9CD5B8(a3);

}

- (int)explanatoryTextMode
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode);
  swift_beginAccess();
  return *v2;
}

- (void)setExplanatoryTextMode:(int)a3
{
  int *v5;
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *v6;
  uint64_t (*v7)();
  uint64_t v8;
  _BYTE v9[32];
  _BYTE v10[152];
  _BYTE v11[152];

  v5 = (int *)((char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode);
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  v7 = sub_1AF9C705C();
  sub_1AF9C7014(v8, (uint64_t)v10);
  sub_1AF9C7014((uint64_t)v10, (uint64_t)v11);
  if (sub_1AF9CCE00((uint64_t)v11) != 1)
  {
    swift_beginAccess();
    sub_1AF9F1694(*v5);
  }
  ((void (*)(_BYTE *, _QWORD))v7)(v9, 0);

}

- (BOOL)showAccountStatus
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus;
  swift_beginAccess();
  return *v2;
}

- (void)setShowAccountStatus:(BOOL)a3
{
  sub_1AF9CB37C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus, (void (*)(_QWORD))sub_1AF9F1814);
}

- (BOOL)onlyShowUnmanagedAccounts
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts;
  swift_beginAccess();
  return *v2;
}

- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3
{
  sub_1AF9CB37C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts, (void (*)(_QWORD))sub_1AF9F1994);
}

- (void)toggleAllCalendars
{
  char *v3;
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *v4;
  _OWORD v5[9];
  __int16 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int16 v16;
  _BYTE v17[152];
  _BYTE v18[152];

  v3 = (char *)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView;
  swift_beginAccess();
  sub_1AF9C7014((uint64_t)v3, (uint64_t)v17);
  sub_1AF9C7014((uint64_t)v17, (uint64_t)v18);
  if (sub_1AF9CCE00((uint64_t)v18) != 1)
  {
    sub_1AF9C7014((uint64_t)v17, (uint64_t)v5);
    v13 = v5[6];
    v14 = v5[7];
    v15 = v5[8];
    v16 = v6;
    v9 = v5[2];
    v10 = v5[3];
    v11 = v5[4];
    v12 = v5[5];
    v7 = v5[0];
    v8 = v5[1];
    v4 = self;
    sub_1AF9CCE18((uint64_t)v17, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_1AF9CCE7C);
    sub_1AF9F199C();
    sub_1AF9CCE18((uint64_t)v17, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_1AF9CCD70);

  }
}

- (_TtC10EventKitUI24EKCalendarChooserOOPImpl)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10EventKitUI24EKCalendarChooserOOPImpl *result;

  v4 = a4;
  result = (_TtC10EventKitUI24EKCalendarChooserOOPImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[152];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostingController));
  sub_1AF9C7014((uint64_t)self + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView, (uint64_t)v3);
  sub_1AF9CCE18((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_1AF9CCD70);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource));
}

@end
