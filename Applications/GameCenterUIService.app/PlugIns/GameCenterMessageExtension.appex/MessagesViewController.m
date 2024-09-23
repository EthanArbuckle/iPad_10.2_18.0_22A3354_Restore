@implementation MessagesViewController

- (void)gameCenterViewControllerDidFinish:(id)a3
{
  id v4;
  _TtC26GameCenterMessageExtension22MessagesViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000306C4();

}

- (_TtC26GameCenterMessageExtension22MessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC26GameCenterMessageExtension22MessagesViewController *)sub_100029E1C(v5, v7, a4);
}

- (_TtC26GameCenterMessageExtension22MessagesViewController)initWithCoder:(id)a3
{
  return (_TtC26GameCenterMessageExtension22MessagesViewController *)sub_100029FC0(a3);
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4;
  _TtC26GameCenterMessageExtension22MessagesViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10002A0F0(v4);

}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  void *v4;
  _TtC26GameCenterMessageExtension22MessagesViewController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100031280(v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)updateCard:(id)a3
{
  void *v5;
  id v6;
  _TtC26GameCenterMessageExtension22MessagesViewController *v7;
  NSString v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _TtC26GameCenterMessageExtension22MessagesViewController *v12;
  _QWORD v13[5];
  uint64_t v14;

  v5 = (void *)objc_opt_self(GKActivity);
  v6 = a3;
  v7 = self;
  v8 = String._bridgeToObjectiveC()();
  v9 = swift_allocObject(&unk_1000535D8, 24, 7);
  *(_QWORD *)(v9 + 16) = v7;
  v13[4] = sub_100032F58;
  v14 = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100013AF4;
  v13[3] = &unk_1000535F0;
  v10 = _Block_copy(v13);
  v11 = v14;
  v12 = v7;
  swift_release(v11);
  objc_msgSend(v5, "named:execute:", v8, v10);
  _Block_release(v10);

}

- (BOOL)displaysAfterAppearance
{
  return 0;
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v4 = v5.receiver;
  -[MessagesViewController willTransitionToPresentationStyle:](&v5, "willTransitionToPresentationStyle:", a3);
  sub_10002B94C();

}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  _TtC26GameCenterMessageExtension22MessagesViewController *v4;

  v4 = self;
  sub_10002BB14(a3);

}

- (void)didSelectMessage:(id)a3 conversation:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  _TtC26GameCenterMessageExtension22MessagesViewController *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = (unint64_t)-[MessagesViewController presentationStyle](v11, "presentationStyle");
  if (v8 >= 3)
  {
    v9 = (id)v8;
    type metadata accessor for MSMessagesAppPresentationStyle(0);
    v12 = v9;
    _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(v10, &v12, v10, &type metadata for UInt);
    __break(1u);
  }
  else
  {
    -[MessagesViewController requestPresentationStyle:](v11, "requestPresentationStyle:", qword_100044FD0[v8]);

  }
}

- (void)willResignActiveWithConversation:(id)a3
{
  void *v5;
  id v6;
  _TtC26GameCenterMessageExtension22MessagesViewController *v7;
  id v8;

  v5 = (void *)objc_opt_self(NSNotificationCenter);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "defaultCenter");
  objc_msgSend(v8, "removeObserver:", v7);

}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double width;
  _TtC26GameCenterMessageExtension22MessagesViewController *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_10002BE8C(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4
{
  id v6;
  id v7;
  _TtC26GameCenterMessageExtension22MessagesViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100031444();

}

- (void)didStartSendingMessage:(id)a3 conversation:(id)a4
{
  id v6;
  id v7;
  _TtC26GameCenterMessageExtension22MessagesViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100031978(v7);

}

- (void)_validateMessageForSending:(MSMessage *)a3 conversation:(MSConversation *)a4 associatedText:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  MSMessage *v19;
  MSConversation *v20;
  NSString *v21;
  _TtC26GameCenterMessageExtension22MessagesViewController *v22;
  uint64_t v23;
  uint64_t v24;

  v11 = sub_100005170(&qword_100059D58);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_100053380, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_1000533A8, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100059D68;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_1000533D0, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100059D78;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  v23 = sub_10002F12C((uint64_t)v13, (uint64_t)&unk_100059D88, (uint64_t)v18);
  swift_release(v23);
}

- (void)didDismissFullScreen
{
  -[MessagesViewController dismiss](self, "dismiss");
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC26GameCenterMessageExtension22MessagesViewController *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  objc_msgSend(v6, "removeObserver:", v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[MessagesViewController dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_inviteCardResizingObserver));
  sub_100032D68(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState), *(void **)&self->playerModel[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState], self->inviteCardResizingObserver[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState]);
}

- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC26GameCenterMessageExtension22MessagesViewController *v10;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v9 = v8;
  v10 = self;
  LOBYTE(v7) = sub_10002E3BC(v6, v7, v9);

  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v9);
  return v7 & 1;
}

- (_TtC26GameCenterMessageExtension22MessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  _TtC26GameCenterMessageExtension22MessagesViewController *result;

  result = (_TtC26GameCenterMessageExtension22MessagesViewController *)_swift_stdlib_reportUnimplementedInitializer("GameCenterMessageExtension.MessagesViewController", 49, "init(shouldBeSheetPresentationControllerDelegate:)", 50, 0);
  __break(1u);
  return result;
}

@end
