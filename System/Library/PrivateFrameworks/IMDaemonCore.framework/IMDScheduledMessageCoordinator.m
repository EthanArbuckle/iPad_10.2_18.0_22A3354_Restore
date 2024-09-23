@implementation IMDScheduledMessageCoordinator

- (IMDScheduledMessageCoordinator)initWithServiceSession:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  IMDScheduledMessageCoordinator *v10;

  v4 = (void *)objc_opt_self();
  v5 = a3;
  v6 = objc_msgSend(v4, sel_sharedInstance);
  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v9 = objc_allocWithZone((Class)IMDScheduledMessageCoordinator);
  v10 = (IMDScheduledMessageCoordinator *)sub_1D1633F54(v5, v6, v7, v8);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

- (void)dealloc
{
  IMDScheduledMessageCoordinator *v2;

  v2 = self;
  sub_1D1634564();
}

- (void).cxx_destruct
{

  swift_release();
}

- (void)updateTimerForTimeInterval:(double)a3
{
  IMDScheduledMessageCoordinator *v4;

  v4 = self;
  sub_1D16347D0(a3);

}

- (void)informOfCancelledMessageWithMessageGUID:(id)a3 success:(BOOL)a4 cancelType:(unint64_t)a5 error:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IMDScheduledMessageCoordinator *v13;
  id v14;

  v10 = sub_1D166DACC();
  v12 = v11;
  v14 = a6;
  v13 = self;
  sub_1D163BA84(v10, v12, a4, a5);

  swift_bridgeObjectRelease();
}

- (void)removeFailedEditsFrom:(id)a3
{
  id v4;
  IMDScheduledMessageCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1D163CA1C(v4);

}

- (void)timerDidFire
{
  IMDScheduledMessageCoordinator *v2;

  v2 = self;
  sub_1D1636C70();

}

- (id)description
{
  IMDScheduledMessageCoordinator *v2;
  void *v3;

  v2 = self;
  sub_1D1638400();

  v3 = (void *)sub_1D166DAA8();
  swift_bridgeObjectRelease();
  return v3;
}

- (IMDScheduledMessageCoordinator)init
{
  IMDScheduledMessageCoordinator *result;

  result = (IMDScheduledMessageCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)handleMessageDidReplace:(id)a3 newMessage:(id)a4
{
  id v6;
  id v7;
  IMDScheduledMessageCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D163A138(v6, v7);

}

+ (void)notifyPeersWithScheduledMessageUpdate:(id)a3 scheduleState:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1D166DACC();
  sub_1D163D048(v5, v6, a4);
  swift_bridgeObjectRelease();
}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7 itemIsComingFromStorage:(BOOL)a8
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  IMDScheduledMessageCoordinator *v23;
  uint64_t v24;

  v13 = sub_1D141AC58(&qword_1ED9354E8);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1D166DACC();
  v18 = v17;
  if (a7)
  {
    sub_1D166D604();
    v19 = sub_1D166D628();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v15, 0, 1, v19);
  }
  else
  {
    v20 = sub_1D166D628();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v15, 1, 1, v20);
  }
  v21 = a3;
  v22 = a6;
  v23 = self;
  sub_1D163DAA4(v21, v16, v18, a5);

  swift_bridgeObjectRelease();
  sub_1D141BA80((uint64_t)v15, &qword_1ED9354E8);
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 category:(int64_t)a12 spamExtensionName:(id)a13 isBlackholed:(BOOL)a14
{
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  IMDScheduledMessageCoordinator *v21;

  v17 = sub_1D166DACC();
  v19 = v18;
  v20 = a11;
  v21 = self;
  sub_1D163DFB0(a3, v17, v19, a5);

  swift_bridgeObjectRelease();
}

- (id)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7
{
  int v8;
  NSObject *v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);
  unsigned int (*v13)(uint64_t, uint64_t, uint64_t);
  id v14;
  id v15;
  IMDScheduledMessageCoordinator *v16;
  void *v17;
  void *v18;

  v8 = a5;
  v11 = sub_1D166DACC();
  v13 = v12;
  v14 = a3;
  v15 = a7;
  v16 = self;
  sub_1D163E300(v14, v11, v13, v8);
  v18 = v17;

  swift_bridgeObjectRelease();
  return v18;
}

- (void)serviceSession:(id)a3 willRemoveChat:(id)a4
{
  id v6;
  id v7;
  IMDScheduledMessageCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D163F6FC(v7, "%@ Handling chat %@ being removed.");

}

- (void)serviceSession:(id)a3 willMoveChatToRecentlyDeleted:(id)a4
{
  id v6;
  id v7;
  IMDScheduledMessageCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D163F6FC(v7, "%@ Handling chat %@ being moved to recently deleted.");

}

- (void)systemDidLeaveFirstDataProtectionLock
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  IMDScheduledMessageCoordinator *v7;

  v2 = qword_1ED935578;
  v7 = self;
  if (v2 != -1)
    swift_once();
  v3 = sub_1D166D964();
  sub_1D141AC1C(v3, (uint64_t)qword_1ED9364E8);
  v4 = sub_1D166D94C();
  v5 = sub_1D166DD9C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D1413000, v4, v5, "Notified about leaving dataProtection lock", v6, 2u);
    MEMORY[0x1D17EB0AC](v6, -1, -1);
  }

  -[IMDScheduledMessageCoordinator updateTimerForTimeInterval:](v7, sel_updateTimerForTimeInterval_, 120.0);
}

@end
