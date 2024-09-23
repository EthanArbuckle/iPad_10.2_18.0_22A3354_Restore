@implementation CKConversationListTipManagerSwift

- (int64_t)presentedTip
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKConversationListTipManagerSwift_presentedTip);
  swift_beginAccess();
  return *v2;
}

- (void)conversationListControllerDidAppear
{
  CKConversationListTipManagerSwift *v2;

  v2 = self;
  sub_18E0110B8();

}

- (CKConversationListTipManagerSwift)initWithConversationListController:(id)a3
{
  id v3;
  CKConversationListTipManagerSwift *v4;

  v3 = a3;
  v4 = (CKConversationListTipManagerSwift *)sub_18E01123C();

  return v4;
}

- (UIView)miniTipUIView
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CKConversationListTipManagerSwift_miniTipUIView);
  swift_beginAccess();
  return (UIView *)*v2;
}

- (void)setMiniTipUIView:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___CKConversationListTipManagerSwift_miniTipUIView);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)setPresentedTip:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___CKConversationListTipManagerSwift_presentedTip);
  swift_beginAccess();
  *v4 = a3;
}

- (void)updateKtTipRules
{
  CKConversationListTipManagerSwift *v2;
  uint64_t v3;

  v2 = self;
  CKIsWaitingForCloud();
  if (qword_1EE0FAF98 != -1)
    swift_once();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0FAED0);
  __swift_project_value_buffer(v3, (uint64_t)qword_1EE12DD88);
  swift_beginAccess();
  sub_18E766B18();
  swift_endAccess();
  CKIsAppleIDNotUpdated();
  if (qword_1EE0FAF70 != -1)
    swift_once();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EE12DD70);
  swift_beginAccess();
  sub_18E766B18();
  swift_endAccess();

}

- (void)updateCloudTipRulesFor:(id)a3
{
  id v4;
  CKConversationListTipManagerSwift *v5;

  v4 = a3;
  v5 = self;
  sub_18E533D24((uint64_t)v4);

}

- (void)conversationListControllerDidDisappear
{
  uint64_t v3;
  CKConversationListTipManagerSwift *v4;
  CKConversationListTipManagerSwift *v5;

  v3 = OBJC_IVAR___CKConversationListTipManagerSwift_tipObservationTask;
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___CKConversationListTipManagerSwift_tipObservationTask))
  {
    v4 = self;
    swift_retain();
    sub_18E768BAC();
    swift_release();
  }
  else
  {
    v5 = self;
  }
  *(Class *)((char *)&self->super.isa + v3) = 0;

  swift_release();
}

- (void)userDidPinConversation
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  CKConversationListTipManagerSwift *v7;
  uint64_t v8;
  _QWORD v9[2];

  v3 = sub_18E766A28();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v9[0] = sub_18E010EF0();
  v9[1] = v8;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CE9610], v3);
  sub_18E535614();
  sub_18E766908();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  swift_bridgeObjectRelease();
}

- (CKConversationListTipManagerSwift)init
{
  CKConversationListTipManagerSwift *result;

  result = (CKConversationListTipManagerSwift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18E0117EC(*(void **)((char *)&self->super.isa
                         + OBJC_IVAR___CKConversationListTipManagerSwift____lazy_storage___ktWaitingForCloudTip));
  sub_18E0117EC(*(void **)((char *)&self->super.isa
                         + OBJC_IVAR___CKConversationListTipManagerSwift____lazy_storage___ktUpdateAppleIDTip));
  swift_release();
}

@end
