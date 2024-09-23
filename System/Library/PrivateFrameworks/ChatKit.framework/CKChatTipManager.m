@implementation CKChatTipManager

- (CKCheckInTipsViewDelegate)checkInDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC7ChatKit16CKChatTipManager_checkInDelegate;
  swift_beginAccess();
  return (CKCheckInTipsViewDelegate *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setCheckInDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC7ChatKit16CKChatTipManager)initWithChatController:(id)a3
{
  id v3;
  _TtC7ChatKit16CKChatTipManager *v4;

  v3 = a3;
  v4 = (_TtC7ChatKit16CKChatTipManager *)sub_18E5B08CC(v3);

  return v4;
}

- (void)chatControllerDidAppear
{
  sub_18E5AFBB8(self, (uint64_t)a2, (uint64_t)&unk_1E2761A38, (uint64_t)&unk_1EE10B298, &OBJC_IVAR____TtC7ChatKit16CKChatTipManager_tipObservation);
}

- (void)chatControllerDidDisappear
{
  _TtC7ChatKit16CKChatTipManager *v2;

  v2 = self;
  sub_18E5ADFB0();

}

- (void)undoOrEditMessageUsed
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC7ChatKit16CKChatTipManager *v7;
  uint64_t v8;
  _QWORD v9[2];

  v3 = sub_18E766A28();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v9[0] = sub_18E5AD648();
  v9[1] = v8;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CE9610], v3);
  sub_18E5B0A40();
  sub_18E766908();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  swift_bridgeObjectRelease();
}

- (void)dismissTipIfPresented
{
  _TtC7ChatKit16CKChatTipManager *v2;

  v2 = self;
  sub_18E5AEA44();

}

- (BOOL)presentingTip
{
  _TtC7ChatKit16CKChatTipManager *v2;
  char v3;

  v2 = self;
  v3 = sub_18E5AEB74();

  return v3 & 1;
}

- (void)presentCheckInTip
{
  sub_18E5AFBB8(self, (uint64_t)a2, (uint64_t)&unk_1E2761A10, (uint64_t)&unk_1EE10B290, &OBJC_IVAR____TtC7ChatKit16CKChatTipManager_checkInTipObservation);
}

- (_TtC7ChatKit16CKChatTipManager)init
{
  _TtC7ChatKit16CKChatTipManager *result;

  result = (_TtC7ChatKit16CKChatTipManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit16CKChatTipManager_checkInDelegate);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end
