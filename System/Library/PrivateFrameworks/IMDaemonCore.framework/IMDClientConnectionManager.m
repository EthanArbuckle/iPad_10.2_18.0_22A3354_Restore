@implementation IMDClientConnectionManager

- (IMDaemonListenerCloudSyncProtocol)broadcasterForCloudSyncListeners
{
  uint64_t v3;
  id v4;
  void *v5;
  IMDClientConnectionManager *v6;
  void *v7;
  _QWORD aBlock[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D1684D80;
  v4 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232CE8;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerCloudSyncProtocol *)v7;
}

- (IMDaemonListenerAnyProtocol)broadcasterForAllListeners
{
  _QWORD *v3;
  id v4;
  void *v5;
  IMDClientConnectionManager *v6;
  void *v7;
  _QWORD aBlock[6];

  v3 = (_QWORD *)swift_allocObject();
  v3[2] = 0;
  v3[3] = self;
  v3[4] = 0;
  v3[5] = 0;
  v4 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232D88;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerAnyProtocol *)v7;
}

- (IMDClientConnectionManager)init
{
  IMDClientConnectionManager *result;

  result = (IMDClientConnectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___IMDClientConnectionManager_broadcastingQueue;
  v4 = sub_1D166D868();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (IMDaemonListenerAccountsProtocol)broadcasterForAccountListeners
{
  uint64_t v3;
  id v4;
  void *v5;
  IMDClientConnectionManager *v6;
  void *v7;
  _QWORD aBlock[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D1684D70;
  v4 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232D38;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerAccountsProtocol *)v7;
}

- (IMDaemonListenerFileTransfersProtocol)broadcasterForFileTransferListeners
{
  uint64_t v3;
  id v4;
  void *v5;
  IMDClientConnectionManager *v6;
  void *v7;
  _QWORD aBlock[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D1684D90;
  v4 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232C98;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerFileTransfersProtocol *)v7;
}

- (id)broadcasterForListenersSupportingService:(id)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  IMDClientConnectionManager *v9;
  id v10;
  IMDClientConnectionManager *v11;
  void *v12;
  _QWORD aBlock[6];

  v5 = (_QWORD *)swift_allocObject();
  v5[2] = a3;
  v5[3] = self;
  v5[4] = 0;
  v5[5] = 0;
  v6 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232C48;
  v7 = _Block_copy(aBlock);
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (IMDaemonListenerKeyTransparencyProtocol)broadcasterForKeyTransparencyListeners
{
  return (IMDaemonListenerKeyTransparencyProtocol *)sub_1D165471C(self, (uint64_t)a2, (uint64_t)&unk_1E9232BE0, (uint64_t)sub_1D16575DC, (uint64_t)&unk_1E9232BF8);
}

- (IMDaemonListenerChatProtocol)broadcasterForChatListeners
{
  return (IMDaemonListenerChatProtocol *)sub_1D165471C(self, (uint64_t)a2, (uint64_t)&unk_1E9232B90, (uint64_t)sub_1D16575DC, (uint64_t)&unk_1E9232BA8);
}

- (id)broadcasterForChatListenersSupportingService:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  IMDClientConnectionManager *v9;
  id v10;
  IMDClientConnectionManager *v11;
  void *v12;
  _QWORD aBlock[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  *(_QWORD *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D1684DA0;
  v6 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232B58;
  v7 = _Block_copy(aBlock);
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (id)broadcasterForSentMessageListenersSupportingService:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  IMDClientConnectionManager *v9;
  id v10;
  IMDClientConnectionManager *v11;
  void *v12;
  _QWORD aBlock[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  *(_QWORD *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D1684DB0;
  v6 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232B08;
  v7 = _Block_copy(aBlock);
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (IMDaemonListenerChatProtocol)broadcasterForBlackholeChatListeners
{
  uint64_t v3;
  id v4;
  void *v5;
  IMDClientConnectionManager *v6;
  void *v7;
  _QWORD aBlock[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D1684DC0;
  v4 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232AB8;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerChatProtocol *)v7;
}

- (id)broadcasterForBlackholeChatListenersSupportingService:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  IMDClientConnectionManager *v9;
  id v10;
  IMDClientConnectionManager *v11;
  void *v12;
  _QWORD aBlock[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  *(_QWORD *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D1684DC0;
  v6 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232A68;
  v7 = _Block_copy(aBlock);
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (id)broadcasterForChatListenersUsingBlackholeRegistry:(BOOL)a3
{
  IMDClientConnectionManager *v4;
  void *v5;

  v4 = self;
  v5 = (void *)ClientConnectionManager.broadcasterForChatListeners(usingBlackholeRegistry:)(a3);

  return v5;
}

- (IMDaemonListenerChatDatabaseProtocol)broadcasterForChatDatabaseListeners
{
  IMDClientConnectionManager *v2;
  void *v3;

  v2 = self;
  v3 = (void *)ClientConnectionManager.broadcasterForChatDatabaseListeners.getter();

  return (IMDaemonListenerChatDatabaseProtocol *)v3;
}

- (IMDaemonListenerChatCountsProtocol)broadcasterForChatCountsListeners
{
  IMDClientConnectionManager *v2;
  void *v3;

  v2 = self;
  v3 = (void *)ClientConnectionManager.broadcasterForChatCountsListeners.getter();

  return (IMDaemonListenerChatCountsProtocol *)v3;
}

- (IMDaemonListenerFileProviderProtocol)broadcasterForFileProviderListeners
{
  uint64_t v3;
  id v4;
  void *v5;
  IMDClientConnectionManager *v6;
  void *v7;
  _QWORD aBlock[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D1684DF0;
  v4 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232A18;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerFileProviderProtocol *)v7;
}

- (id)broadcasterForNotificationListenersSupportingService:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  IMDClientConnectionManager *v9;
  id v10;
  IMDClientConnectionManager *v11;
  void *v12;
  _QWORD aBlock[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  *(_QWORD *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D1684D70;
  v6 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E92329C8;
  v7 = _Block_copy(aBlock);
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (id)broadcasterForAVConferenceListenersSupportingService:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  IMDClientConnectionManager *v9;
  id v10;
  IMDClientConnectionManager *v11;
  void *v12;
  _QWORD aBlock[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  *(_QWORD *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D1684E00;
  v6 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232978;
  v7 = _Block_copy(aBlock);
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (id)broadcasterForACConferenceListenersSupportingService:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  IMDClientConnectionManager *v9;
  id v10;
  IMDClientConnectionManager *v11;
  void *v12;
  _QWORD aBlock[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  *(_QWORD *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D1684E10;
  v6 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232928;
  v7 = _Block_copy(aBlock);
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (id)broadcasterForVCConferenceListenersSupportingService:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  IMDClientConnectionManager *v9;
  id v10;
  IMDClientConnectionManager *v11;
  void *v12;
  _QWORD aBlock[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  *(_QWORD *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D1684E20;
  v6 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E92328D8;
  v7 = _Block_copy(aBlock);
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (IMDaemonListenerAVProtocol)broadcasterForAVConferenceListeners
{
  uint64_t v3;
  id v4;
  void *v5;
  IMDClientConnectionManager *v6;
  void *v7;
  _QWORD aBlock[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D1684E00;
  v4 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232888;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerAVProtocol *)v7;
}

- (IMDaemonListenerAVProtocol)broadcasterForACConferenceListeners
{
  uint64_t v3;
  id v4;
  void *v5;
  IMDClientConnectionManager *v6;
  void *v7;
  _QWORD aBlock[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D1684E10;
  v4 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232838;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerAVProtocol *)v7;
}

- (IMDaemonListenerSyncedSettingsProtocol)broadcasterForSyncedSettingsListeners
{
  uint64_t v3;
  id v4;
  void *v5;
  IMDClientConnectionManager *v6;
  void *v7;
  _QWORD aBlock[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D1684E30;
  v4 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E92327E8;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerSyncedSettingsProtocol *)v7;
}

- (id)broadcasterForCollaborationListenersSupportingService:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  IMDClientConnectionManager *v9;
  id v10;
  IMDClientConnectionManager *v11;
  void *v12;
  _QWORD aBlock[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  *(_QWORD *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D1684E40;
  v6 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232798;
  v7 = _Block_copy(aBlock);
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (IMDaemonListenerCollaborationProtocol)broadcasterForCollaborationListeners
{
  uint64_t v3;
  id v4;
  void *v5;
  IMDClientConnectionManager *v6;
  void *v7;
  _QWORD aBlock[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D1684E40;
  v4 = objc_allocWithZone(MEMORY[0x1E0D398B0]);
  aBlock[4] = sub_1D16575DC;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D1416674;
  aBlock[3] = &unk_1E9232748;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1EFCA58A0, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerCollaborationProtocol *)v7;
}

@end
