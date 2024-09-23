@implementation BankConnectMessagesManager

- (_TtC10FinanceKit26BankConnectMessagesManager)init
{
  _TtC10FinanceKit26BankConnectMessagesManager *result;

  result = (_TtC10FinanceKit26BankConnectMessagesManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC10FinanceKit26BankConnectMessagesManager_userDefaults);
}

+ (id)makeManager
{
  void *v2;
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  objc_super v8;
  _QWORD v9[5];

  if (qword_254247678 != -1)
    swift_once();
  v2 = (void *)qword_254247670;
  v3 = (objc_class *)type metadata accessor for BankConnectMessagesManager();
  v4 = objc_allocWithZone(v3);
  v9[3] = sub_23327783C();
  v9[4] = &protocol witness table for NSUserDefaults;
  v9[0] = v2;
  sub_233177068((uint64_t)v9, (uint64_t)v4 + OBJC_IVAR____TtC10FinanceKit26BankConnectMessagesManager_userDefaults);
  v8.receiver = v4;
  v8.super_class = v3;
  v5 = v2;
  v6 = objc_msgSendSuper2(&v8, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v6;
}

- (void)resetMessagesForFPANIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC10FinanceKit26BankConnectMessagesManager *v7;
  Swift::String v8;

  v4 = sub_23361E150();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  BankConnectMessagesManager.resetMessages(for:)(v8);

  swift_bridgeObjectRelease();
}

- (void)setIsDismissed:(BOOL)a3 forPassMessage:(int64_t)a4 withFPANIdentifier:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  _TtC10FinanceKit26BankConnectMessagesManager *v10;
  _QWORD v11[2];
  char v12;

  v8 = sub_23361E150();
  if (a4)
  {
    sub_23361EF24();
    __break(1u);
  }
  else
  {
    v11[0] = v8;
    v11[1] = v9;
    v12 = 0;
    v10 = self;
    sub_233271C68(a3, (uint64_t)v11);

    swift_bridgeObjectRelease();
  }
}

- (void)setIsDismissed:(BOOL)a3 forAccountMessage:(int64_t)a4 withAccountIdentifier:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC10FinanceKit26BankConnectMessagesManager *v11;

  v8 = sub_23361E150();
  v10 = v9;
  v11 = self;
  BankConnectMessagesManager.setIsDismissed(_:for:with:)(a3, a4, v8, v10);

  swift_bridgeObjectRelease();
}

- (BOOL)isPassMessageDismissed:(int64_t)a3 forFPANIdentifier:(id)a4
{
  return sub_233272C4C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))BankConnectMessagesManager.isPassMessageDismissed(_:for:));
}

- (BOOL)isAccountMessageDismissed:(int64_t)a3 forAccountIdentifier:(id)a4
{
  return sub_233272C4C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))BankConnectMessagesManager.isAccountMessageDismissed(_:for:));
}

- (id)shouldDisplayBackgroundRefreshConfirmationMessageWithFullyQualifiedAccountIdentifier:(id)a3 now:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  _TtC10FinanceKit26BankConnectMessagesManager *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[2];

  v6 = sub_23361D634();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23361D5EC();
  v10 = qword_254247048;
  v11 = a3;
  v12 = self;
  if (v10 != -1)
    swift_once();
  v13 = *(void **)(*((_QWORD *)off_254247040 + 2) + 16);
  swift_retain();
  v14 = objc_msgSend(v13, sel_newBackgroundContext);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v18[-4] = v12;
  v18[-3] = v11;
  v18[-2] = v9;
  v18[-1] = v15;
  type metadata accessor for BankConnectMessagesManager.BackgroundRefreshConfirmationPromptDecision();
  sub_23361E960();

  swift_release();
  v16 = (void *)v18[1];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v16;
}

- (void)dismissBackgroundRefreshConfirmationMessageWithToken:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC10FinanceKit26BankConnectMessagesManager *v6;
  void *v7;
  id v8;

  v4 = qword_254247048;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once();
  v7 = *(void **)(*((_QWORD *)off_254247040 + 2) + 16);
  swift_retain();
  v8 = objc_msgSend(v7, sel_newBackgroundContext);
  BankConnectMessagesManager.dismissBackgroundRefreshConfirmationMessage(token:context:)();

  swift_release();
}

@end
