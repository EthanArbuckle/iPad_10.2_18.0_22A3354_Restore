@implementation IntentsClientBroadcaster

- (void)chat:(id)a3 updated:(id)a4
{
  sub_1D161CE68(0xD000000000000010, 0x80000001D1696C70);
}

- (void)chat:(id)a3 propertiesUpdated:(id)a4
{
  sub_1D161CE68(0xD00000000000001ALL, 0x80000001D1696C50);
}

- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v6;

  if (a4)
    sub_1D166DACC();
  v6 = self;
  sub_1D161CE68(0xD00000000000002FLL, 0x80000001D1696C20);

  swift_bridgeObjectRelease();
}

- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5 sender:(id)a6
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v7;

  if (a4)
    sub_1D166DACC();
  v7 = self;
  sub_1D161CE68(0xD000000000000036, 0x80000001D1696BE0);

  swift_bridgeObjectRelease();
}

- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4
{
  sub_1D161CE68(0xD000000000000023, 0x80000001D1696BB0);
}

- (void)chat:(id)a3 lastAddressedSIMIDUpdated:(id)a4
{
  sub_1D161CE68(0xD000000000000022, 0x80000001D1696B80);
}

- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4 lastAddressedSIMIDUpdated:(id)a5
{
  sub_1D161CE68(0xD00000000000003DLL, 0x80000001D1696B40);
}

- (void)chat:(id)a3 isFilteredUpdated:(int64_t)a4
{
  sub_1D161CE68(0xD00000000000001ALL, 0x80000001D1696B20);
}

- (void)chat:(id)a3 isRecoveredUpdated:(BOOL)a4
{
  sub_1D161CE68(0xD00000000000001BLL, 0x80000001D1696B00);
}

- (void)chat:(id)a3 isDeletingIncomingMessagesUpdated:(BOOL)a4
{
  sub_1D161CE68(0xD00000000000002ALL, 0x80000001D1696AD0);
}

- (void)chat:(id)a3 engramIDUpdated:(id)a4
{
  sub_1D161CE68(0xD000000000000018, 0x80000001D1696AB0);
}

- (void)chat:(id)a3 nicknamesUpdated:(id)a4
{
  sub_1D161CE68(0xD000000000000019, 0x80000001D1696A90);
}

- (void)chat:(id)a3 lastMessageTimeStampOnLoadUpdated:(double)a4
{
  sub_1D161CE68(0xD00000000000002ALL, 0x80000001D1696A60);
}

- (void)serviceSwitchRequestReceivedForChatWithIdentifier:(id)a3
{
  sub_1D161CE68(0xD000000000000034, 0x80000001D1696A20);
}

- (void)capabilitiesUpdatedForHandle:(id)a3
{
  sub_1D161CE68(0xD00000000000001FLL, 0x80000001D1696A00);
}

- (void)chat:(id)a3 uncachedAttachmentCountUpdated:(id)a4
{
  sub_1D161CE68(0xD000000000000027, 0x80000001D16969D0);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 updateProperties:(id)a7
{
  sub_1D161B8A4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, 0xD000000000000036, 0x80000001D1696990);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 error:(id)a7
{
  sub_1D161B8A4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, 0xD00000000000002BLL, 0x80000001D1696960);
}

- (void)leftChat:(id)a3
{
  sub_1D161CE68(0x746168437466656CLL, 0xEC000000293A5F28);
}

- (void)engroupParticipantsUpdatedForChat:(id)a3
{
  sub_1D161CE68(0xD000000000000024, 0x80000001D1696930);
}

- (void)loadedChats:(id)a3
{
  sub_1D161CE68(0x6843646564616F6CLL, 0xEF293A5F28737461);
}

- (void)loadedChats:(id)a3 queryID:(id)a4
{
  sub_1D161CE68(0xD000000000000017, 0x80000001D1696910);
}

- (void)markedAsReadForMessageGUID:(id)a3 success:(BOOL)a4 queryID:(id)a5
{
  sub_1D161CE68(0xD00000000000002DLL, 0x80000001D16968E0);
}

- (void)forcedReloadingChatRegistryWithQueryID:(id)a3
{
  sub_1D161CE68(0xD000000000000029, 0x80000001D16968B0);
}

- (void)movedMessagesToRecentlyDeletedWithQueryID:(id)a3
{
  sub_1D161CE68(0xD00000000000002CLL, 0x80000001D1696880);
}

- (void)movedMessagesToRecentlyDeletedForChatsWithGUIDs:(id)a3 queryID:(id)a4
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v5;

  if (a4)
    sub_1D166DACC();
  v5 = self;
  sub_1D161CE68(0xD00000000000003ALL, 0x80000001D1696840);

  swift_bridgeObjectRelease();
}

- (void)recoveredMessagesWithQueryID:(id)a3
{
  sub_1D161CE68(0xD00000000000001FLL, 0x80000001D1696820);
}

- (void)loadedRecoverableMessagesMetadata:(id)a3 queryID:(id)a4
{
  sub_1D161CE68(0xD00000000000002DLL, 0x80000001D16967F0);
}

- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3
{
  sub_1D161CE68(0xD000000000000038, 0x80000001D16967B0);
}

- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3 queryID:(id)a4
{
  sub_1D161CE68(0xD000000000000040, 0x80000001D1696760);
}

- (void)permanentlyDeletedRecoverableMessagesForChatsWithGUIDs:(id)a3 deletedChatGUIDs:(id)a4
{
  sub_1D161CE68(0xD00000000000004ALL, 0x80000001D1696710);
}

- (void)recoveredMessagesFromRecentlyDeletedForChatsWithGUIDs:(id)a3
{
  sub_1D161CE68(0xD000000000000038, 0x80000001D16966D0);
}

- (void)chatsNeedRemerging:(id)a3 groupedChats:(id)a4
{
  sub_1D161CE68(0xD000000000000023, 0x80000001D16966A0);
}

- (void)chatLoadedWithChatIdentifier:(id)a3 chats:(id)a4
{
  sub_1D161CE68(0xD000000000000025, 0x80000001D1696670);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 invitationReceived:(id)a7
{
  id v9;
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v10;

  if (a6)
    sub_1D166DA30();
  v9 = a7;
  v10 = self;
  sub_1D161CE68(0xD000000000000038, 0x80000001D1696630);

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageSent:(id)a9
{
  id v12;
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v13;

  if (a4)
  {
    sub_1D166DACC();
    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a6)
LABEL_3:
    sub_1D166DA30();
LABEL_4:
  if (a8)
    sub_1D166DACC();
  v12 = a9;
  v13 = self;
  sub_1D161CE68(0xD00000000000004DLL, 0x80000001D16965E0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 notifySentMessage:(id)a7 sendTime:(id)a8 isReplicating:(BOOL)a9
{
  id v13;
  id v14;
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v15;

  if (!a4)
  {
    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_1D166DACC();
  if (a6)
LABEL_3:
    sub_1D166DA30();
LABEL_4:
  v13 = a7;
  v14 = a8;
  v15 = self;
  sub_1D161CE68(0xD00000000000004ELL, 0x80000001D1696590);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageReceived:(id)a9
{
  sub_1D161CD08(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, 0xD000000000000051, 0x80000001D1696530);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messagesReceived:(id)a9 removed:(id)a10 messagesComingFromStorage:(BOOL)a11
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v13;

  if (!a6)
  {
    if (!a8)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_1D166DA30();
  if (a8)
LABEL_3:
    sub_1D166DACC();
LABEL_4:
  v13 = self;
  sub_1D161CE68(0xD000000000000074, 0x80000001D16964B0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageUpdated:(id)a7
{
  id v10;
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v11;

  if (!a4)
  {
    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_1D166DACC();
  if (a6)
LABEL_3:
    sub_1D166DA30();
LABEL_4:
  v10 = a7;
  v11 = self;
  sub_1D161CE68(0xD000000000000034, 0x80000001D1696470);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageUpdated:(id)a7 suppressNotification:(BOOL)a8
{
  id v11;
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v12;

  if (!a4)
  {
    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_1D166DACC();
  if (a6)
LABEL_3:
    sub_1D166DA30();
LABEL_4:
  v11 = a7;
  v12 = self;
  sub_1D161CE68(0xD000000000000049, 0x80000001D1696420);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v9;

  if (!a4)
  {
    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_1D166DACC();
  if (a6)
LABEL_3:
    sub_1D166DA30();
LABEL_4:
  v9 = self;
  sub_1D161CE68(0xD000000000000035, 0x80000001D16963E0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 messagesUpdated:(id)a6
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v8;

  if (!a4)
  {
    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_1D166DACC();
  if (a6)
LABEL_3:
    sub_1D166DBEC();
LABEL_4:
  v8 = self;
  sub_1D161CE68(0xD000000000000026, 0x80000001D16963B0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 statusChanged:(int)a9 handleInfo:(id)a10
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v12;

  if (a6)
  {
    sub_1D166DA30();
    if (!a8)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a8)
LABEL_3:
    sub_1D166DACC();
LABEL_4:
  if (a10)
    sub_1D166DBEC();
  v12 = self;
  sub_1D161CE68(0xD00000000000005ALL, 0x80000001D1696350);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 chatPersonCentricID:(id)a7 member:(id)a8 statusChanged:(int)a9
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v11;

  if (!a6)
  {
    if (!a7)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_1D166DA30();
  if (a7)
LABEL_3:
    sub_1D166DACC();
LABEL_4:
  v11 = self;
  sub_1D161CE68(0xD00000000000004ELL, 0x80000001D1696300);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)downloadedPurgedAssetBatchForChatIDs:(id)a3 completedTransferGUIDs:(id)a4
{
  sub_1D161CE68(0xD00000000000003ELL, 0x80000001D16962C0);
}

- (void)finishedDownloadingPurgedAssetsForChatIDs:(id)a3
{
  sub_1D161CE68(0xD00000000000002CLL, 0x80000001D1696290);
}

- (void)historicalMessageGUIDsDeleted:(id)a3 chatGUIDs:(id)a4 queryID:(id)a5
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v8;

  if (a3)
  {
    sub_1D166DBEC();
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a4)
LABEL_3:
    sub_1D166DBEC();
LABEL_4:
  if (a5)
    sub_1D166DACC();
  v8 = self;
  sub_1D161CE68(0xD000000000000033, 0x80000001D1696250);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)previouslyBlackholedChatLoadedWithChatIdentifier:(id)a3 chats:(id)a4
{
  sub_1D161CE68(0xD000000000000039, 0x80000001D1696210);
}

- (void)previouslyBlackholedChatLoadedWithHandleIDs:(id)a3 chat:(id)a4
{
  sub_1D161CE68(0xD000000000000033, 0x80000001D16961D0);
}

- (void)blackholedChatsExist:(BOOL)a3
{
  sub_1D161CE68(0xD000000000000018, 0x80000001D16961B0);
}

- (void)groupPhotoUpdatedForChatIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5 userInfo:(id)a6
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v7;

  if (a6)
    sub_1D166DA30();
  v7 = self;
  sub_1D161CE68(0xD00000000000003CLL, 0x80000001D1696170);

  swift_bridgeObjectRelease();
}

- (void)displayPinCodeForAccount:(id)a3 pinCode:(id)a4 deviceName:(id)a5 deviceType:(id)a6 phoneNumber:(id)a7
{
  sub_1D161CE68(0xD000000000000045, 0x80000001D1696120);
}

- (void)pinCodeAlertCompleted:(id)a3 deviceName:(id)a4 deviceType:(id)a5 phoneNumber:(id)a6 responseFromDevice:(BOOL)a7 wasCancelled:(BOOL)a8
{
  sub_1D161CE68(0xD00000000000005BLL, 0x80000001D16960C0);
}

- (void)screenTimeEnablementChanged:(BOOL)a3
{
  sub_1D161CE68(0xD00000000000001FLL, 0x80000001D16960A0);
}

- (void)collaborationNoticesDidChangeForChatGUIDs:(id)a3
{
  sub_1D161CE68(0xD00000000000002CLL, 0x80000001D1696070);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 initialEmergencyQuestionnaireReceived:(id)a9
{
  sub_1D161CD08(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, 0xD000000000000067, 0x80000001D1696000);
}

- (void)qosClassWhileServicingRequestsResponse:(unsigned int)a3 identifier:(id)a4
{
  sub_1D161CE68(0xD000000000000035, 0x80000001D1695FC0);
}

- (void)updatedSummariesForChatsWithGUIDsAndProperties:(id)a3
{
  sub_1D161CE68(0xD000000000000031, 0x80000001D1695F80);
}

- (void)pendingVCRequestComplete
{
  sub_1D1622B8C(0xD00000000000001ALL, 0x80000001D16982D0);
}

- (void)pendingACRequestComplete
{
  sub_1D1622B8C(0xD00000000000001ALL, 0x80000001D16982B0);
}

- (void)vcCapabilitiesChanged:(unint64_t)a3
{
  sub_1D1622B8C(0xD000000000000019, 0x80000001D1698290);
}

- (void)updateCloudKitState
{
  sub_1D1622B8C(0xD000000000000015, 0x80000001D1698270);
}

- (void)didAttemptToSetEnabledTo:(BOOL)a3 result:(BOOL)a4
{
  sub_1D1622B8C(0xD000000000000022, 0x80000001D1698240);
}

- (void)didPerformAdditionalStorageRequiredCheckWithSuccess:(BOOL)a3 additionalStorageRequired:(unint64_t)a4 forAccountId:(id)a5 error:(id)a6
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v7;

  if (a5)
    sub_1D166DACC();
  v7 = self;
  sub_1D1622B8C(0xD000000000000063, 0x80000001D16981D0);

  swift_bridgeObjectRelease();
}

- (void)didAttemptToDisableAllDevicesResult:(BOOL)a3
{
  sub_1D1622B8C(0xD000000000000026, 0x80000001D16981A0);
}

- (void)nicknameRequestResponse:(id)a3 encodedNicknameData:(id)a4
{
  void *v4;
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v9;

  v4 = a4;
  if (a4)
  {
    v5 = self;
    v6 = v4;
    v4 = (void *)sub_1D166D598();
    v8 = v7;

  }
  else
  {
    v9 = self;
    v8 = 0xF000000000000000;
  }
  sub_1D1622B8C(0xD00000000000002FLL, 0x80000001D1698170);
  sub_1D1622D38((uint64_t)v4, v8);

}

- (void)updatePendingNicknameUpdates:(id)a3 handledNicknames:(id)a4 archivedNicknames:(id)a5
{
  sub_1D1622B8C(0xD000000000000043, 0x80000001D1698120);
}

- (void)updateNicknameHandlesForSharing:(id)a3 blocked:(id)a4
{
  sub_1D1622B8C(0xD00000000000002ALL, 0x80000001D16980F0);
}

- (void)updateTransitionedNicknameHandles:(id)a3
{
  sub_1D1622B8C(0xD000000000000025, 0x80000001D16980C0);
}

- (void)updateActiveNicknameRecords:(id)a3
{
  sub_1D1622B8C(0xD00000000000001FLL, 0x80000001D16980A0);
}

- (void)updateIgnoredNicknameRecords:(id)a3
{
  sub_1D1622B8C(0xD000000000000020, 0x80000001D1698070);
}

- (void)updatePersonalNickname:(id)a3
{
  sub_1D1622B8C(0xD00000000000001ALL, 0x80000001D1698050);
}

- (void)simSubscriptionsDidChange
{
  sub_1D1622B8C(0xD00000000000001BLL, 0x80000001D1698030);
}

- (void)newSetupInfoAvailable
{
  sub_1D1622B8C(0xD000000000000017, 0x80000001D1698010);
}

- (void)networkDataAvailabilityChanged:(BOOL)a3
{
  sub_1D1622B8C(0xD000000000000022, 0x80000001D1697FE0);
}

- (void)property:(id)a3 changedTo:(id)a4 from:(id)a5
{
  sub_1D1620754(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0xD00000000000001BLL, 0x80000001D1697FC0);
}

- (void)persistentProperty:(id)a3 changedTo:(id)a4 from:(id)a5
{
  sub_1D1620754(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0xD000000000000025, 0x80000001D1697F90);
}

- (void)stickerPackUpdated:(id)a3
{
  sub_1D1622B8C(0xD000000000000016, 0x80000001D1697F70);
}

- (void)stickerPackRemoved:(id)a3
{
  sub_1D1622B8C(0xD000000000000016, 0x80000001D1697F50);
}

- (void)oneTimeCodesDidChange:(id)a3
{
  sub_1D1622B8C(0xD000000000000019, 0x80000001D1697F30);
}

- (void)didFetchSyncStateStats:(id)a3
{
  sub_1D1622B8C(0xD00000000000001ALL, 0x80000001D1697F10);
}

- (void)didFetchRampState:(id)a3
{
  sub_1D1622B8C(0xD000000000000015, 0x80000001D1697EF0);
}

- (void)didAttemptToDisableiCloudBackups:(int64_t)a3 error:(id)a4
{
  sub_1D1622B8C(0xD000000000000029, 0x80000001D1697EC0);
}

- (void)didFetchCloudKitSyncDebuggingInfo:(id)a3
{
  sub_1D1622B8C(0xD000000000000025, 0x80000001D1697E90);
}

- (void)account:(id)a3 conference:(id)a4 receivedInvitationFrom:(id)a5 properties:(id)a6
{
  sub_1D1622B8C(0xD000000000000038, 0x80000001D1697E50);
}

- (void)account:(id)a3 conference:(id)a4 receivedResponseToInvitationFrom:(id)a5 properties:(id)a6
{
  sub_1D1622B8C(0xD000000000000042, 0x80000001D1697E00);
}

- (void)account:(id)a3 conference:(id)a4 receivedCancelInvitationFrom:(id)a5 properties:(id)a6
{
  sub_1D1622B8C(0xD00000000000003ELL, 0x80000001D1697DC0);
}

- (void)account:(id)a3 conference:(id)a4 receivedCounterProposalFrom:(id)a5 properties:(id)a6
{
  sub_1D1622B8C(0xD00000000000003DLL, 0x80000001D1697D80);
}

- (void)account:(id)a3 conference:(id)a4 receivedUpdateFrom:(id)a5 data:(id)a6
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v11;

  v7 = a6;
  v11 = self;
  v8 = sub_1D166D598();
  v10 = v9;

  sub_1D1622B8C(0xD00000000000002ELL, 0x80000001D1697D50);
  sub_1D15FF5B8(v8, v10);

}

- (void)account:(id)a3 conference:(id)a4 receivedAVMessage:(unsigned int)a5 from:(id)a6 sessionID:(unsigned int)a7 userInfo:(id)a8
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v9;

  if (a8)
    sub_1D166DA30();
  v9 = self;
  sub_1D1622B8C(0xD000000000000040, 0x80000001D1697D00);

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 conference:(id)a4 changedToNewConferenceID:(id)a5
{
  sub_1D1622B8C(0xD00000000000002FLL, 0x80000001D1697CD0);
}

- (void)account:(id)a3 conference:(id)a4 peerIDChangedFromID:(id)a5 toID:(id)a6
{
  sub_1D1622B8C(0xD00000000000002FLL, 0x80000001D1697CA0);
}

- (void)account:(id)a3 conference:(id)a4 peerID:(id)a5 propertiesUpdated:(id)a6
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v7;

  if (a5)
    sub_1D166DACC();
  v7 = self;
  sub_1D1622B8C(0xD00000000000002FLL, 0x80000001D1697C70);

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 conference:(id)a4 invitationSentSuccessfully:(BOOL)a5
{
  sub_1D1622B8C(0xD000000000000031, 0x80000001D1697C30);
}

- (void)account:(id)a3 avAction:(unsigned int)a4 withArguments:(id)a5 toAVChat:(id)a6 isVideo:(BOOL)a7
{
  sub_1D1622B8C(0xD000000000000033, 0x80000001D1697BF0);
}

- (void)account:(id)a3 relay:(id)a4 handleInitate:(id)a5 fromPerson:(id)a6
{
  sub_1D1622B8C(0xD00000000000002ALL, 0x80000001D1697BC0);
}

- (void)account:(id)a3 relay:(id)a4 handleUpdate:(id)a5 fromPerson:(id)a6
{
  sub_1D1622B8C(0xD000000000000029, 0x80000001D1697B90);
}

- (void)account:(id)a3 relay:(id)a4 handleCancel:(id)a5 fromPerson:(id)a6
{
  sub_1D1622B8C(0xD000000000000029, 0x80000001D1697B60);
}

- (void)unreadCountChanged:(int64_t)a3
{
  sub_1D1622B8C(0xD000000000000016, 0x80000001D1697B40);
}

- (void)lastFailedMessageDateChanged:(int64_t)a3
{
  sub_1D1622B8C(0xD000000000000020, 0x80000001D1697B10);
}

- (void)databaseUpdated
{
  sub_1D1622B8C(0xD000000000000011, 0x80000001D1697AF0);
}

- (void)databaseUpdated:(id)a3
{
  sub_1D1622B8C(0xD000000000000013, 0x80000001D1697AD0);
}

- (void)databaseChatSpamUpdated:(id)a3
{
  sub_1D1622B8C(0xD00000000000001BLL, 0x80000001D1697AB0);
}

- (void)messageQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  sub_1D1622B8C(0xD00000000000002DLL, 0x80000001D1697A80);
}

- (void)messageItemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  sub_1D1622B8C(0xD000000000000031, 0x80000001D1697A40);
}

- (void)itemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  sub_1D1622B8C(0xD00000000000002ALL, 0x80000001D1697A10);
}

- (void)historyQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7
{
  sub_1D16215E4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, MEMORY[0x1E0DEE9B8] + 8, 0xD000000000000039, 0x80000001D16979D0);
}

- (void)pagedHistoryQuery:(id)a3 chatID:(id)a4 services:(id)a5 numberOfMessagesBefore:(int64_t)a6 numberOfMessagesAfter:(int64_t)a7 finishedWithResult:(id)a8 hasMessagesBefore:(BOOL)a9 hasMessagesAfter:(BOOL)a10
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v11;

  if (a8)
    sub_1D166DBEC();
  v11 = self;
  sub_1D1622B8C(0xD000000000000088, 0x80000001D1697940);

  swift_bridgeObjectRelease();
}

- (void)attachmentQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v7;

  if (a6)
    sub_1D166DBEC();
  v7 = self;
  sub_1D1622B8C(0xD000000000000036, 0x80000001D1697900);

  swift_bridgeObjectRelease();
}

- (void)uncachedAttachmentCountQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  sub_1D1622B8C(0xD000000000000043, 0x80000001D16978B0);
}

- (void)isDownloadingQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(BOOL)a6
{
  sub_1D1622B8C(0xD000000000000039, 0x80000001D1697870);
}

- (void)markAsSpamQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  sub_1D1622B8C(0xD000000000000035, 0x80000001D1697830);
}

- (void)frequentRepliesQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7
{
  sub_1D16215E4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, MEMORY[0x1E0DEA968], 0xD000000000000041, 0x80000001D16977E0);
}

- (void)_automation_markAsReadQuery:(id)a3 finishedWithResult:(BOOL)a4
{
  sub_1D1622B8C(0xD000000000000031, 0x80000001D16977A0);
}

- (void)updateCloudKitStateWithDictionary:(id)a3
{
  sub_1D1622B8C(0xD00000000000001ALL, 0x80000001D1697780);
}

- (void)updateCloudKitProgressWithDictionary:(id)a3
{
  sub_1D1622B8C(0xD00000000000001DLL, 0x80000001D1697760);
}

- (void)fileTransfer:(id)a3 highQualityDownloadSucceededWithPath:(id)a4
{
  sub_1D1622B8C(0xD000000000000035, 0x80000001D1697720);
}

- (void)fileTransfer:(id)a3 explicitDownloadSucceededWithPath:(id)a4 livePhotoBundlePath:(id)a5
{
  sub_1D1622B8C(0xD000000000000046, 0x80000001D16976D0);
}

- (void)fileTransferExplicitDownloadFailed:(id)a3 suggestedRetryGUID:(id)a4 error:(id)a5
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v6;

  if (a4)
    sub_1D166DACC();
  v6 = self;
  sub_1D1622B8C(0xD00000000000003FLL, 0x80000001D1697690);

  swift_bridgeObjectRelease();
}

- (void)fileTransferHighQualityDownloadFailed:(id)a3
{
  sub_1D1622B8C(0xD000000000000029, 0x80000001D1697660);
}

- (void)fileTransferDownloadedSucceededWithLocalURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_1D166D580();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D166D550();
  sub_1D1622A00((uint64_t)v6, 0xD00000000000002ELL, 0x80000001D1697630);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)fileTransferDownloadFailedWithLocalURL:(id)a3 error:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_1D166D580();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D166D550();
  sub_1D1622A00((uint64_t)v7, 0xD00000000000002FLL, 0x80000001D1697600);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)fileTransfer:(id)a3 createdWithProperties:(id)a4
{
  sub_1D1622B8C(0xD000000000000026, 0x80000001D16975D0);
}

- (void)fileTransfer:(id)a3 updatedWithProperties:(id)a4
{
  sub_1D1622B8C(0xD000000000000026, 0x80000001D16975A0);
}

- (void)fileTransfers:(id)a3 createdWithLocalPaths:(id)a4
{
  sub_1D1622B8C(0xD000000000000027, 0x80000001D1697570);
}

- (void)fileTransfer:(id)a3 updatedWithCurrentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5 averageTransferRate:(unint64_t)a6
{
  sub_1D1622B8C(0xD000000000000047, 0x80000001D1697520);
}

- (void)receivedUrgentRequestForMessages:(id)a3
{
  sub_1D1622B8C(0xD000000000000023, 0x80000001D16974F0);
}

- (void)defaultsChanged:(id)a3 forService:(id)a4
{
  sub_1D1622B8C(0xD00000000000001ELL, 0x80000001D16974D0);
}

- (void)showInvalidCertNotificationForAccount:(id)a3
{
  sub_1D1622B8C(0xD000000000000028, 0x80000001D16974A0);
}

- (void)showForgotPasswordNotificationForAccount:(id)a3
{
  sub_1D1622B8C(0xD00000000000002BLL, 0x80000001D1697470);
}

- (void)activeAccountsChanged:(id)a3 forService:(id)a4
{
  sub_1D1622B8C(0xD000000000000024, 0x80000001D1697440);
}

- (void)account:(id)a3 defaults:(id)a4 blockList:(id)a5 allowList:(id)a6 blockingMode:(unsigned int)a7 blockIdleStatus:(BOOL)a8 status:(id)a9 capabilities:(unint64_t)a10 serviceLoginStatus:(unint64_t)a11 loginStatusMessage:(id)a12
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v13;

  if (a9)
    sub_1D166DA30();
  v13 = self;
  sub_1D1622B8C(0xD00000000000007FLL, 0x80000001D16973C0);

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 loginStatusChanged:(unint64_t)a4 message:(id)a5 reason:(int)a6 properties:(id)a7
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v8;

  if (a7)
    sub_1D166DA30();
  v8 = self;
  sub_1D1622B8C(0xD000000000000038, 0x80000001D1697380);

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 defaultsChanged:(id)a4
{
  sub_1D1622B8C(0xD00000000000001BLL, 0x80000001D1697360);
}

- (void)account:(id)a3 capabilitiesChanged:(unint64_t)a4
{
  sub_1D1622B8C(0xD00000000000001FLL, 0x80000001D1697340);
}

- (void)accountAdded:(id)a3 defaults:(id)a4 service:(id)a5
{
  sub_1D1622B8C(0xD000000000000021, 0x80000001D1697310);
}

- (void)accountRemoved:(id)a3
{
  sub_1D1622B8C(0xD000000000000012, 0x80000001D16972F0);
}

- (void)account:(id)a3 blockListChanged:(id)a4
{
  sub_1D1622B8C(0xD00000000000001CLL, 0x80000001D16972D0);
}

- (void)account:(id)a3 allowListChanged:(id)a4
{
  sub_1D1622B8C(0xD00000000000001CLL, 0x80000001D16972B0);
}

- (void)account:(id)a3 blockingModeChanged:(unsigned int)a4
{
  sub_1D1622B8C(0xD00000000000001FLL, 0x80000001D1697290);
}

- (void)account:(id)a3 blockIdleStatusChanged:(BOOL)a4
{
  sub_1D1622B8C(0xD000000000000022, 0x80000001D1697260);
}

- (void)account:(id)a3 buddyPropertiesChanged:(id)a4
{
  sub_1D1622B8C(0xD000000000000022, 0x80000001D1697230);
}

- (void)account:(id)a3 buddyPictureChanged:(id)a4 imageData:(id)a5 imageHash:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v13;

  v8 = a5;
  v9 = a6;
  v13 = self;
  v10 = sub_1D166D598();
  v12 = v11;

  sub_1D1622B8C(0xD000000000000033, 0x80000001D16971F0);
  sub_1D15FF5B8(v10, v12);

}

- (void)account:(id)a3 buddyProperties:(id)a4 buddyPictures:(id)a5
{
  sub_1D1622B8C(0xD000000000000029, 0x80000001D16971C0);
}

- (void)account:(id)a3 groupsChanged:(id)a4 error:(id)a5
{
  sub_1D1622B8C(0xD00000000000001FLL, 0x80000001D16971A0);
}

- (void)account:(id)a3 handleSubscriptionRequestFrom:(id)a4 withMessage:(id)a5
{
  sub_1D1622B8C(0xD000000000000035, 0x80000001D1697160);
}

- (void)account:(id)a3 statusChanged:(id)a4
{
  sub_1D1622B8C(0xD000000000000019, 0x80000001D1697140);
}

- (void)account:(id)a3 postedError:(id)a4
{
  sub_1D1622B8C(0xD000000000000017, 0x80000001D1697120);
}

- (void)updateNicknameData:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_1D166D598();
  v7 = v6;

  sub_1D1622B8C(0xD000000000000016, 0x80000001D1697100);
  sub_1D15FF5B8(v5, v7);

}

- (void)didUpdateSettingsKeys:(id)a3
{
  _TtC12IMDaemonCore24IntentsClientBroadcaster *v4;

  if (a3)
    sub_1D166DBEC();
  v4 = self;
  sub_1D1622B8C(0xD000000000000018, 0x80000001D16970E0);

  swift_bridgeObjectRelease();
}

- (void)setupComplete:(BOOL)a3 info:(id)a4
{
  sub_1D1622B8C(0xD000000000000016, 0x80000001D16970C0);
}

- (void)setupComplete
{
  sub_1D1622B8C(0x6D6F437075746573, 0xEF29286574656C70);
}

- (void)didReceiveCollaborationMessage:(id)a3 inChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  sub_1D1622B8C(0xD000000000000037, 0x80000001D1697080);
}

- (void)keyTransparencyOptInStateChanged:(BOOL)a3
{
  sub_1D1622B8C(0xD000000000000024, 0x80000001D1697050);
}

- (void)refreshStatusForKTPeerURI:(id)a3
{
  sub_1D1622B8C(0xD00000000000001CLL, 0x80000001D1697030);
}

- (_TtC12IMDaemonCore24IntentsClientBroadcaster)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12IMDaemonCore24IntentsClientBroadcaster_sentinelString);
  *v4 = 0x736B726F77207449;
  v4[1] = 0xE900000000000021;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[IntentsClientBroadcaster init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
