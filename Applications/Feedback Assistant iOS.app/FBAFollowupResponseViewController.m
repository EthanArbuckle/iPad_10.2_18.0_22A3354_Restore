@implementation FBAFollowupResponseViewController

- (FBKFeedbackFollowup)followup
{
  return (FBKFeedbackFollowup *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                        + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_followup));
}

- (void)setFollowup:(id)a3
{
  id v5;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100064628(a3);

}

- (FBKContentItem)contentItem
{
  return (FBKContentItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                   + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_contentItem));
}

- (void)setContentItem:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_contentItem);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_contentItem) = (Class)a3;
  v3 = a3;

}

- (BOOL)isUnsolicited
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_isUnsolicited);
}

- (void)setIsUnsolicited:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_isUnsolicited) = a3;
}

- (void)awakeFromNib
{
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v2;

  v2 = self;
  sub_100064B8C();

}

- (void)viewDidLoad
{
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v2;

  v2 = self;
  sub_100064C80();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v4;

  v4 = self;
  sub_100064FD0(a3);

}

- (void)dealloc
{
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v2;
  uint64_t v3;
  id v4;
  objc_super v5;

  v2 = self;
  v3 = static os_log_type_t.info.getter();
  os_log(_:dso:log:_:_:)(v3, &_mh_execute_header);
  v4 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v4, "removeObserver:", v2);

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for FBAFollowupResponseViewController();
  -[FBAFollowupResponseViewController dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_followup));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_contentItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_devicesController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController____lazy_storage___addAttachmentsController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_dataSource));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_modelSnapshot));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_log));
  swift_bridgeObjectRelease(*(_QWORD *)&self->readinessState[OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController____lazy_storage___displayText]);
  sub_10005565C(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_createFollowupSavedHandler), *(_QWORD *)&self->readinessState[OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_createFollowupSavedHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_bigSendButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_sendButtonInItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController____lazy_storage___cachedFollowupDisplayTextCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController____lazy_storage___cachedCommentsCell));
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1000652E8(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v7;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v8;
  uint64_t v9;
  id v10;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v11;
  _OWORD v12[2];

  if (a4)
  {
    v7 = a3;
    v8 = self;
    v9 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v9);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v10 = a3;
    v11 = self;
  }
  sub_1000654F8(a3);

  sub_10004F588((uint64_t)v12, (uint64_t *)&unk_100116D70);
}

- (void)userDidTapSend
{
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v2;

  v2 = self;
  sub_100065874();

}

- (void)userDidCancel
{
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v2;

  v2 = self;
  sub_100066FC8((uint64_t)v2);

}

- (void)cancelAndDismissFollowupResponseController
{
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v2;

  v2 = self;
  sub_100067258((uint64_t)v2);

}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_10006EAC0((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10006EBF0((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v12;
  double v13;
  double v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10006F3DC((uint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)keyboardWillShowWithNotification:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v8;
  _BYTE v9[72];
  objc_class *v10;

  v4 = a3;
  v8 = self;
  v5 = static os_log_type_t.debug.getter(v8);
  v6 = sub_10004BB9C((uint64_t *)&unk_100116860);
  v7 = swift_allocObject(v6, 72, 7);
  *(_OWORD *)(v7 + 16) = xmmword_1000CC730;
  *(_QWORD *)(v7 + 56) = &type metadata for String;
  *(_QWORD *)(v7 + 64) = sub_100051284();
  *(_QWORD *)(v7 + 32) = 0xD00000000000001FLL;
  *(_QWORD *)(v7 + 40) = 0x80000001000D7180;
  os_log(_:dso:log:_:_:)(v5, &_mh_execute_header);
  swift_bridgeObjectRelease(v7);
  NSNotification.keyboardAttributes.getter((uint64_t)v9);
  *(Class *)((char *)&v8->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_keyboardHeight) = v10;

}

- (void)keyboardWillHideWithNotification:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = self;
  v6 = static os_log_type_t.debug.getter(v5);
  v7 = sub_10004BB9C((uint64_t *)&unk_100116860);
  v8 = swift_allocObject(v7, 72, 7);
  *(_OWORD *)(v8 + 16) = xmmword_1000CC730;
  *(_QWORD *)(v8 + 56) = &type metadata for String;
  *(_QWORD *)(v8 + 64) = sub_100051284();
  *(_QWORD *)(v8 + 32) = 0xD00000000000001FLL;
  *(_QWORD *)(v8 + 40) = 0x80000001000D7160;
  os_log(_:dso:log:_:_:)(v6, &_mh_execute_header);

  swift_bridgeObjectRelease(v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10006F4D8();

}

- (_TtC18Feedback_Assistant33FBAFollowupResponseViewController)initWithStyle:(int64_t)a3
{
  return (_TtC18Feedback_Assistant33FBAFollowupResponseViewController *)sub_10006BE98(a3);
}

- (_TtC18Feedback_Assistant33FBAFollowupResponseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18Feedback_Assistant33FBAFollowupResponseViewController *)sub_10006C134(v5, v7, a4);
}

- (_TtC18Feedback_Assistant33FBAFollowupResponseViewController)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant33FBAFollowupResponseViewController *)sub_10006C450(a3);
}

- (void)deviceDiagnosticsController:(id)a3 didFailToAttach:(id)a4 toDevice:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v14;
  id v15;

  type metadata accessor for FBAAddAttachmentsController(0);
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v15 = a6;
  v14 = self;
  sub_100059460(v12, v14, v11, (uint64_t)v15);

}

- (void)deviceDiagnosticsController:(id)a3 needsSelectionFromDevices:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v14;

  v8 = _Block_copy(a5);
  v9 = sub_100053458(0, (unint64_t *)&unk_100116F70, FBKGroupedDevice_ptr);
  v10 = sub_10005BE04();
  v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v9, v10);
  v12 = swift_allocObject(&unk_1000E9250, 24, 7);
  *(_QWORD *)(v12 + 16) = v8;
  v13 = a3;
  v14 = self;
  sub_10008F400(v11, v14, (uint64_t)sub_10006FBEC, v12);

  swift_bridgeObjectRelease(v11);
  swift_release(v12);
}

- (void)deviceDiagnosticsController:(id)a3 didAddDevices:(id)a4
{
  id v5;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v6;
  uint64_t v7;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v8;

  v5 = a3;
  v6 = self;
  sub_100064390();
  v7 = swift_allocObject(&unk_1000E9228, 32, 7);
  *(_BYTE *)(v7 + 16) = 1;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = v6;
  sub_100069BF0(1, 0, 0, 0, (uint64_t)sub_10006FB98, v7);

  swift_release(v7);
}

- (void)deviceDiagnosticsController:(id)a3 didFailToConnectToDevice:(id)a4
{
  id v6;
  id v7;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100055A8C(v8);

}

- (void)deviceDiagnosticsController:(id)a3 didRemoveDevice:(id)a4
{
  id v6;
  id v7;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v8;
  uint64_t v9;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100064390();
  v9 = swift_allocObject(&unk_1000E9200, 32, 7);
  *(_BYTE *)(v9 + 16) = 1;
  *(_QWORD *)(v9 + 24) = v8;
  v10 = v8;
  sub_100069BF0(1, 0, 0, 0, (uint64_t)sub_10006FB98, v9);

  swift_release(v9);
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateDevice:(id)a4
{
  id v6;
  id v7;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v8;
  uint64_t v9;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100064390();
  v9 = swift_allocObject(&unk_1000E91D8, 32, 7);
  *(_BYTE *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = v8;
  v10 = v8;
  sub_100069BF0(0, 0, 0, 0, (uint64_t)sub_10006FB98, v9);

  swift_release(v9);
}

- (void)deviceDiagnosticsController:(id)a3 didAddAttachment:(id)a4 toDevice:(id)a5
{
  sub_10006CABC(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_1000E91B0, (uint64_t)sub_10006FB98);
}

- (void)deviceDiagnosticsController:(id)a3 didRemoveAttachment:(id)a4 fromDevice:(id)a5
{
  sub_10006CABC(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_1000E9188, (uint64_t)sub_10006FB98);
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateAttachment:(id)a4 onDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v11;
  uint64_t v12;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100064390();
  v12 = swift_allocObject(&unk_1000E9160, 32, 7);
  *(_BYTE *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = v11;
  sub_100069BF0(0, 0, 0, 0, (uint64_t)sub_10006FB98, v12);

  swift_release(v12);
}

- (void)deviceDiagnosticsController:(id)a3 didChangeState:(int64_t)a4
{
  id v6;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v7;

  v6 = a3;
  v7 = self;
  sub_10006CC30(v6, a4);

}

- (BOOL)isReadyForDropSessionFromController:(id)a3 tableView:(id)a4 dropSessionDidUpdate:(id)a5 withDestinationIndexPath:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v15;

  v8 = sub_10004BB9C(&qword_100116880);
  __chkstk_darwin(v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
    v11 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = *((_BYTE *)&self->super.super.super.super.isa
        + OBJC_IVAR____TtC18Feedback_Assistant33FBAFollowupResponseViewController_readinessState) != 5;
  sub_10004F588((uint64_t)v10, &qword_100116880);
  return v13;
}

- (void)attachmentsAlert:(id)a3 needsDeviceDiagnosticsController:(id)a4
{
  void *v6;
  id v7;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10006F620(v8, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)attachmentsAlertDidSelectOption:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10006F970();

}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant33FBAFollowupResponseViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10006FA30();

}

@end
