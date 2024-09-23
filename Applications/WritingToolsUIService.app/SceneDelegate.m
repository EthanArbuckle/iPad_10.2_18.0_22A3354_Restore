@implementation SceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (WTSession)session
{
  return (WTSession *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                              + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_session));
}

- (void)setSession:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_session);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_session) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint8_t *v8;
  id v9;
  id v10;
  _TtC21WritingToolsUIService13SceneDelegate *v11;

  v8 = (uint8_t *)a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10003DED8(v8, (uint64_t)v10);

}

- (void)dealloc
{
  _TtC21WritingToolsUIService13SceneDelegate *v2;

  v2 = self;
  sub_10003BA14();
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_scene);

  sub_10000AE2C((uint64_t)self + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_writingToolsView, &qword_1000C9CB8);
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_commonUIManager), v3);
}

- (void)proofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  _TtC21WritingToolsUIService13SceneDelegate *v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v18 - v14;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = self;
  sub_10003BC98((uint64_t)v16, a4, (uint64_t)v13);

  v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  v17(v15, v9);
}

- (void)proofreadingSessionWithUUID:(id)a3 showDetailsForSuggestionWithUUID:(id)a4 relativeToRect:(CGRect)a5 inView:(id)a6
{
  uint64_t v8;

  type metadata accessor for UUID(0);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  __chkstk_darwin(v8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x6C706D6920746F6ELL, 0xEF6465746E656D65, "WritingToolsUIService/SceneDelegate.swift", 41, 2, 159, 0);
  __break(1u);
}

- (void)textSystemWillBeginEditingDuringSessionWithUUID:(id)a3
{
  uint64_t v4;

  v4 = type metadata accessor for UUID(0);
  __chkstk_darwin(v4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x6C706D6920746F6ELL, 0xEF6465746E656D65, "WritingToolsUIService/SceneDelegate.swift", 41, 2, 163, 0);
  __break(1u);
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC21WritingToolsUIService13SceneDelegate *v9;
  uint64_t v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1000BFB30, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_10003C068(a3, (uint64_t)sub_10003DED0, v7);

  swift_release(v7, v10);
}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _TtC21WritingToolsUIService13SceneDelegate *v11;
  Class isa;
  id v13;
  id v14;
  id v15;

  v7 = sub_100021548(0, (unint64_t *)&qword_1000C9CB0, WTContext_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = (void *)objc_opt_self(WTUIActionClientToHost);
  v10 = a3;
  v11 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v13 = objc_msgSend(v9, "actionForDidBeginWritingToolsSession:contexts:", v10, isa);

  v14 = objc_msgSend(*(id *)((char *)&v11->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_window), "rootViewController");
  v15 = objc_msgSend(v14, "_hostedWindowScene");

  objc_msgSend(v15, "sendAction:", v13);
  swift_bridgeObjectRelease(v8);

}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  void *v7;
  id v8;
  _TtC21WritingToolsUIService13SceneDelegate *v9;
  id v10;
  id v11;
  id v12;

  v7 = (void *)objc_opt_self(WTUIActionClientToHost);
  v8 = a3;
  v9 = self;
  v10 = objc_msgSend(v7, "actionForWritingToolsSession:didReceiveAction:", v8, a4);
  v11 = objc_msgSend(*(id *)((char *)&v9->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_window), "rootViewController");
  v12 = objc_msgSend(v11, "_hostedWindowScene");

  objc_msgSend(v12, "sendAction:", v10);
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _TtC21WritingToolsUIService13SceneDelegate *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_10003C790(v6, v4);

}

- (void)endWritingTools
{
  _TtC21WritingToolsUIService13SceneDelegate *v2;

  v2 = self;
  sub_10003CBB4(0);

}

- (void)endWritingToolsWithError:(id)a3
{
  _TtC21WritingToolsUIService13SceneDelegate *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_10003CBB4(a3);

}

- (void)showContentWarningWithTitle:(id)a3 message:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC21WritingToolsUIService13SceneDelegate *v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v9 = v8;
  v10 = self;
  sub_10003CEE0();

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v9);
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _TtC21WritingToolsUIService13SceneDelegate *v19;
  Class isa;
  id v21;
  id v22;
  id v23;

  v7 = a7;
  length = a5.length;
  location = a5.location;
  v14 = sub_100021548(0, &qword_1000C9CC8, WTTextSuggestion_ptr);
  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v14);
  v16 = (void *)objc_opt_self(WTUIActionClientToHost);
  v17 = a3;
  v18 = a6;
  v19 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v21 = objc_msgSend(v16, "actionForProofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v17, isa, location, length, v18, v7);

  v22 = objc_msgSend(*(id *)((char *)&v19->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_window), "rootViewController");
  v23 = objc_msgSend(v22, "_hostedWindowScene");

  objc_msgSend(v23, "sendAction:", v21);
  swift_bridgeObjectRelease(v15);

}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  id v17;
  _TtC21WritingToolsUIService13SceneDelegate *v18;
  Class isa;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = (void *)objc_opt_self(WTUIActionClientToHost);
  v16 = a3;
  v17 = a6;
  v18 = self;
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v20 = objc_msgSend(v15, "actionForProofreadingSession:didUpdateState:forSuggestionWithUUID:inContext:", v16, a4, isa, v17);

  v21 = objc_msgSend(*(id *)((char *)&v18->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_window), "rootViewController");
  v22 = objc_msgSend(v21, "_hostedWindowScene");

  objc_msgSend(v22, "sendAction:", v20);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  void *v14;
  id v15;
  id v16;
  id v17;
  _TtC21WritingToolsUIService13SceneDelegate *v18;
  id v19;
  id v20;
  id v21;

  v7 = a7;
  length = a5.length;
  location = a5.location;
  v14 = (void *)objc_opt_self(WTUIActionClientToHost);
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = self;
  v19 = objc_msgSend(v14, "actionForCompositionSession:didReceiveText:replacementRange:inContext:finished:", v15, v16, location, length, v17, v7);
  v20 = objc_msgSend(*(id *)((char *)&v18->super.super.isa + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_window), "rootViewController");
  v21 = objc_msgSend(v20, "_hostedWindowScene");

  objc_msgSend(v21, "sendAction:", v19);
}

- (void)replaceSelectionWithText:(id)a3
{
  sub_10003D464(self, (uint64_t)a2, a3, (SEL *)&selRef_actionForReplaceSelectionWithText_);
}

- (void)copyText:(id)a3
{
  sub_10003D464(self, (uint64_t)a2, a3, (SEL *)&selRef_actionForCopyText_);
}

- (void)undo
{
  sub_10003D55C(self, (uint64_t)a2, (SEL *)&selRef_actionForUndo);
}

- (void)redo
{
  sub_10003D55C(self, (uint64_t)a2, (SEL *)&selRef_actionForRedo);
}

- (void)beginTextPlaceholder
{
  sub_10003D55C(self, (uint64_t)a2, (SEL *)&selRef_actionForBeginTextPlaceholder);
}

- (void)endTextPlaceholderAndWillInsertText:(BOOL)a3
{
  sub_10003D640(self, (uint64_t)a2, a3, (SEL *)&selRef_actionForEndTextPlaceholderWillInsertText_);
}

- (void)enableSmallDetent:(BOOL)a3
{
  sub_10003D640(self, (uint64_t)a2, a3, (SEL *)&selRef_actionForEnableSmallDetent_);
}

- (void)enableIntelligentEntryFieldView:(BOOL)a3
{
  sub_10003D640(self, (uint64_t)a2, a3, (SEL *)&selRef_actionForEnableIntelligentEntryFieldView_);
}

- (void)preferredContentSizeChanged:(CGSize)a3
{
  double height;
  uint64_t Strong;
  double v6;
  _TtC21WritingToolsUIService13SceneDelegate *v7;
  id v8;

  height = a3.height;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC21WritingToolsUIService13SceneDelegate_scene);
  if (Strong)
  {
    v8 = (id)Strong;
    v6 = nullsub_1(height);
    v7 = self;
    objc_msgSend(v8, "_setPreferredContentSize:", 0.0, v6);

  }
}

- (void)showSmartReplyQuestionnaireWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC21WritingToolsUIService13SceneDelegate *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_10003D79C(x, y, width, height);

}

- (void)savePresentationStyle:(int64_t)a3
{
  _TtC21WritingToolsUIService13SceneDelegate *v4;

  v4 = self;
  sub_10003DAB0(a3);

}

- (_TtC21WritingToolsUIService13SceneDelegate)init
{
  return (_TtC21WritingToolsUIService13SceneDelegate *)sub_10003DC14();
}

@end
