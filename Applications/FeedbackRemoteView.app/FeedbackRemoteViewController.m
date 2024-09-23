@implementation FeedbackRemoteViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18FeedbackRemoteView28FeedbackRemoteViewController *v4;

  v4 = self;
  sub_100002ED4(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18FeedbackRemoteView28FeedbackRemoteViewController *v4;

  v4 = self;
  sub_100003218(a3);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  _TtC18FeedbackRemoteView28FeedbackRemoteViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10000C7D8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_100007AA4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10000697C(v6);
  sub_1000077A4((uint64_t)v6, v7);

}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  _TtC18FeedbackRemoteView28FeedbackRemoteViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10000C6C0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_1000077D8;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100003BB4(a3, v6, v7);
  sub_1000077A4((uint64_t)v6, v7);

}

- (_TtC18FeedbackRemoteView28FeedbackRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC18FeedbackRemoteView28FeedbackRemoteViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
    *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = 0xF000000000000007;
    *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd] = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = 0xF000000000000007;
    *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd] = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FeedbackRemoteViewController();
  v11 = -[FeedbackRemoteViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC18FeedbackRemoteView28FeedbackRemoteViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state] = 0xF000000000000007;
  *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FeedbackRemoteViewController();
  return -[FeedbackRemoteViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_10000778C(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_state]);
  swift_unknownObjectRelease(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18FeedbackRemoteView28FeedbackRemoteViewController_feedbackd]);
}

- (void)feedbackDraftViewController:(id)a3 didCompleteWithFeedbackID:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC18FeedbackRemoteView28FeedbackRemoteViewController *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_100006B00(v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)feedbackDraftViewController:(id)a3 didFailToStartWithError:(int64_t)a4
{
  id v6;
  _TtC18FeedbackRemoteView28FeedbackRemoteViewController *v7;

  v6 = a3;
  v7 = self;
  sub_100006CB0(a4);

}

- (void)feedbackDraftViewController:(id)a3 didFailToAttachURL:(id)a4 error:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  sub_100006E2C((uint64_t)v10, a5);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)feedbackDraftViewControllerDidCancel:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _TtC18FeedbackRemoteView28FeedbackRemoteViewController *v11;

  v4 = qword_100011DA0;
  v5 = a3;
  v11 = self;
  if (v4 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_10000760C(v6, (uint64_t)qword_100011DA8);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Controller cancelled.", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  sub_1000054F8();
}

- (void)feedbackDraftViewController:(id)a3 didFailToSubmitFeedback:(id)a4
{
  id v6;
  id v7;
  _TtC18FeedbackRemoteView28FeedbackRemoteViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100007080(v7);

}

- (void)feedbackDraftViewControllerDidLoadForm:(id)a3
{
  uint64_t v4;
  _TtC18FeedbackRemoteView28FeedbackRemoteViewController *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;

  v4 = qword_100011DA0;
  v11 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_10000760C(v6, (uint64_t)qword_100011DA8);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Feedback form loaded successfully", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

}

- (void)didInvalidateForRemoteAlert
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  if (qword_100011DA0 != -1)
    swift_once(&qword_100011DA0, sub_100002DC8);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_10000760C(v0, (uint64_t)qword_100011DA8);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(12, -1);
    v5 = swift_slowAlloc(32, -1);
    v12 = v5;
    *(_DWORD *)v4 = 136446210;
    v11 = sub_100005EF4(0xD00000000000001DLL, 0x8000000100008CD0, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v4 + 4, v4 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%{public}s", v4, 0xCu);
    swift_arrayDestroy(v5, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1, -1);
    swift_slowDealloc(v4, -1, -1);
  }

  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Terminating self", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

  v10 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  objc_msgSend(v10, "terminateWithSuccess");

}

@end
