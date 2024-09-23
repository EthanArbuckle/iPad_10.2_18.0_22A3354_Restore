@implementation ShareSheetUISession

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC16SharingUIService19ShareSheetUISession *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  v5 = self;
  if (v4)
    objc_msgSend(v4, "invalidate");
  v6.receiver = self;
  v6.super_class = ObjectType;
  -[ShareSheetUISession dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  sub_100017E40((uint64_t)self + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_identifier]);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_contentView));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_currentConfiguration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_customViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController));
}

- (_TtC16SharingUIService19ShareSheetUISession)init
{
  _TtC16SharingUIService19ShareSheetUISession *result;

  result = (_TtC16SharingUIService19ShareSheetUISession *)_swift_stdlib_reportUnimplementedInitializer("SharingUIService.ShareSheetUISession", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)connectionInterrupted
{
  void *v2;
  _TtC16SharingUIService19ShareSheetUISession *v3;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  v3 = self;
  if (v2)
    objc_msgSend(v2, "invalidate");
  sub_10001A7D4();

}

- (void)dataSourceUpdatedWithSessionConfiguration:(id)a3
{
  id v4;
  _TtC16SharingUIService19ShareSheetUISession *v5;

  v4 = a3;
  v5 = self;
  sub_10001B3F8(v4);

}

- (void)performUserDefaultsWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 orderedUUIDs:(id)a5 activityCategory:(int64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _TtC16SharingUIService19ShareSheetUISession *v16;

  v11 = sub_10000ABC0(0, &qword_1000402E8, _UIUserDefaultsActivityProxy_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v11);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v14 = type metadata accessor for UUID(0);
  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v14);
  v16 = self;
  sub_10001B89C(v12, v13, v15, a6);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v15);
}

- (void)performPeopleSuggestionProxy:(id)a3
{
  sub_10001C6F4(self, (uint64_t)a2, a3, "Perform people suggestion %s", (SEL *)&selRef_activityViewControllerWithSessionID_selectedPersonWithIdentifier_);
}

- (void)removePeopleSuggestionProxy:(id)a3
{
  sub_10001C6F4(self, (uint64_t)a2, a3, "Remove people suggestion %s", (SEL *)&selRef_activityViewControllerWithSessionID_removedPersonWithIdentifier_);
}

- (void)performShareActivityProxy:(id)a3 activityIdentifier:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC16SharingUIService19ShareSheetUISession *v12;
  uint64_t v13;

  v7 = sub_100009344(&qword_10003F2A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v10 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  swift_unknownObjectRetain(a3);
  v12 = self;
  sub_10001C174(a3, (uint64_t)v9);
  swift_unknownObjectRelease(a3);

  sub_100010FD8((uint64_t)v9);
}

- (void)performActionActivityProxy:(id)a3
{
  sub_10001C6F4(self, (uint64_t)a2, a3, "Perform action activity %s", (SEL *)&selRef_activityViewControllerWithSessionID_selectedActionWithIdentifier_);
}

- (void)handleActionsEdit
{
  _TtC16SharingUIService19ShareSheetUISession *v2;

  v2 = self;
  sub_10001C760();

}

- (void)handleOptions
{
  _TtC16SharingUIService19ShareSheetUISession *v2;

  v2 = self;
  sub_10001CCC8("handle options", 1);

}

- (void)handleClose
{
  _TtC16SharingUIService19ShareSheetUISession *v2;

  v2 = self;
  sub_10001CCC8("handle close", 5);

}

- (void)handleNext
{
  _TtC16SharingUIService19ShareSheetUISession *v2;

  v2 = self;
  sub_10001CCC8("handle next button", 7);

}

- (void)handleCollaborationOptions
{
  _TtC16SharingUIService19ShareSheetUISession *v2;

  v2 = self;
  sub_10001CCC8("handle collaboration options", 2);

}

- (void)handleCustomHeaderButton
{
  _TtC16SharingUIService19ShareSheetUISession *v2;

  v2 = self;
  sub_10001CCC8("handle custom header button", 0);

}

- (void)handleInfoSuggestionPress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC16SharingUIService19ShareSheetUISession *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10001CA78(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)didSelectCollaborativeAction
{
  _TtC16SharingUIService19ShareSheetUISession *v2;

  v2 = self;
  sub_10001CCC8("did select collaborative action", 3);

}

- (void)didSelectSendCopyAction
{
  _TtC16SharingUIService19ShareSheetUISession *v2;

  v2 = self;
  sub_10001CCC8("did select send copy action", 4);

}

- (id)customTitleForActivityType:(id)a3
{
  return 0;
}

- (void)userDefaultsViewController:(id)a3 didToggleActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC16SharingUIService19ShareSheetUISession *v14;
  uint64_t v15;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  v14 = self;
  sub_10001D710((uint64_t)v12, a5);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)userDefaultsViewController:(id)a3 didFavoriteActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6
{
  _BOOL4 v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  _TtC16SharingUIService19ShareSheetUISession *v16;
  uint64_t v17;

  v8 = a4;
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = a3;
  v16 = self;
  sub_10001D9A8(v8, (uint64_t)v14, a6);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)userDefaultsViewController:(id)a3 didUpdateFavoritesProxies:(id)a4 activityCategory:(int64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC16SharingUIService19ShareSheetUISession *v12;

  v9 = sub_10000ABC0(0, &qword_1000402E8, _UIUserDefaultsActivityProxy_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v11 = a3;
  v12 = self;
  sub_10001DC4C(v10, a5);

  swift_bridgeObjectRelease(v10);
}

- (void)userDefaultsViewController:(id)a3 didSelectActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5 disabled:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  _TtC16SharingUIService19ShareSheetUISession *v16;
  uint64_t v17;

  v6 = a6;
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = a3;
  v16 = self;
  sub_10001D084(v15, (uint64_t)v14, a5, v6);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

@end
