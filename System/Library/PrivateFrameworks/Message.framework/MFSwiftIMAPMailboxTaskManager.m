@implementation MFSwiftIMAPMailboxTaskManager

- (MFMailMessageLibrary)library
{
  MFSwiftIMAPMailboxTaskManager *v2;
  id v5;

  v2 = self;
  v5 = sub_1A51A0E0C();

  return (MFMailMessageLibrary *)v5;
}

- (void)setLibrary:(id)a3
{
  id v4;
  MFSwiftIMAPMailboxTaskManager *v5;

  v4 = a3;
  v5 = self;
  sub_1A51A0EBC(a3);

}

- (MFSwiftIMAPMailboxTaskManager)initWithMailbox:(id)a3 taskManager:(id)a4
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a4;
  return (MFSwiftIMAPMailboxTaskManager *)sub_1A51A0F78(a3, a4);
}

- (MFSwiftIMAPMailboxTaskManager)init
{
  return (MFSwiftIMAPMailboxTaskManager *)sub_1A51A10DC();
}

- (void).cxx_destruct
{
  sub_1A5138D80((id *)((char *)&self->super.isa + OBJC_IVAR___MFSwiftIMAPMailboxTaskManager_library));

}

- (BOOL)canFetchMessageIDs
{
  MFSwiftIMAPMailboxTaskManager *v2;

  v2 = self;
  sub_1A51A1304();

  return sub_1A594A2B4() & 1;
}

- (void)close
{
  MFSwiftIMAPMailboxTaskManager *v2;

  v2 = self;
  sub_1A51A1320();

}

- (void)compact
{
  MFSwiftIMAPMailboxTaskManager *v2;

  v2 = self;
  sub_1A51A1320();

}

- (void)growFetchWindow
{
  MFSwiftIMAPMailboxTaskManager *v2;

  v2 = self;
  sub_1A51A1320();

}

- (void)reselectMailbox
{
  MFSwiftIMAPMailboxTaskManager *v2;

  v2 = self;
  sub_1A51A1320();

}

- (int64_t)fetchMessagesWithMessageIDs:(id)a3 andSetFlags:(unint64_t)a4
{
  id v5;
  MFSwiftIMAPMailboxTaskManager *v6;
  int64_t v10;

  v5 = a3;
  v6 = self;
  sub_1A594BB8C();
  v10 = sub_1A51A1424();
  swift_bridgeObjectRelease();

  return v10;
}

- (int64_t)fetchNumMessages:(int64_t)a3 preservingUID:(id)a4 options:(unint64_t)a5
{
  id v6;
  MFSwiftIMAPMailboxTaskManager *v7;
  int64_t v11;

  v6 = a4;
  v7 = self;
  sub_1A594B40C();
  v11 = sub_1A51A14D4();
  swift_bridgeObjectRelease();

  return v11;
}

- (id)fetchDataForMessage:(id)a3 partial:(BOOL *)a4
{
  id v5;
  MFSwiftIMAPMailboxTaskManager *v6;
  unint64_t v7;
  uint64_t v9;
  id v10;
  uint64_t v13;
  unint64_t v15;

  v5 = a3;
  v6 = self;
  v13 = sub_1A51A159C(a3, a4);
  v15 = v7;

  if ((v15 & 0xF000000000000000) == 0xF000000000000000)
  {
    v10 = 0;
  }
  else
  {
    v9 = sub_1A5949F78();
    sub_1A51625F0(v13, v15);
    v10 = (id)v9;
  }
  return v10;
}

- (id)fetchHeadersForMessage:(id)a3
{
  id v4;
  MFSwiftIMAPMailboxTaskManager *v5;
  unint64_t v6;
  uint64_t v8;
  id v9;
  uint64_t v11;
  unint64_t v13;

  v4 = a3;
  v5 = self;
  v11 = sub_1A51A17C8(a3);
  v13 = v6;

  if ((v13 & 0xF000000000000000) == 0xF000000000000000)
  {
    v9 = 0;
  }
  else
  {
    v8 = sub_1A5949F78();
    sub_1A51625F0(v11, v13);
    v9 = (id)v8;
  }
  return v9;
}

- (BOOL)fetchDataForMimePart:(id)a3 range:(_NSRange)a4 isComplete:(BOOL *)a5 consumer:(id)a6
{
  id v7;
  id v8;
  MFSwiftIMAPMailboxTaskManager *v9;

  v7 = a3;
  v8 = a6;
  v9 = self;
  sub_1A51A1C50(a3, a4.location, a4.length, (uint64_t)a5, a6);

  return sub_1A594A2B4() & 1;
}

- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5
{
  id v6;
  id v7;
  MFSwiftIMAPMailboxTaskManager *v8;
  uint64_t v9;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v12 = _Block_copy(a5);
  v8 = self;
  v13 = sub_1A594B40C();
  v15 = v9;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  sub_1A51A2344(v13, v15, a4, (uint64_t)sub_1A51A24F8, v14);
  swift_release();
  swift_bridgeObjectRelease();

  return sub_1A594A2B4() & 1;
}

- (id)fetchDataForMessage:(id)a3 didDownload:(BOOL *)a4
{
  id v5;
  MFSwiftIMAPMailboxTaskManager *v6;
  unint64_t v7;
  uint64_t v9;
  id v10;
  uint64_t v13;
  unint64_t v15;

  v5 = a3;
  v6 = self;
  v13 = sub_1A51A2904(a3, a4);
  v15 = v7;

  if ((v15 & 0xF000000000000000) == 0xF000000000000000)
  {
    v10 = 0;
  }
  else
  {
    v9 = sub_1A5949F78();
    sub_1A51625F0(v13, v15);
    v10 = (id)v9;
  }
  return v10;
}

- (id)searchWithCriterion:(id)a3 limit:(unsigned int)a4
{
  id v5;
  MFSwiftIMAPMailboxTaskManager *v6;
  id v10;

  v5 = a3;
  v6 = self;
  v10 = sub_1A51A2B24(a3);

  return v10;
}

- (id)downloadSearchResults:(id)a3
{
  id v4;
  MFSwiftIMAPMailboxTaskManager *v5;
  id v9;

  v4 = a3;
  v5 = self;
  v9 = sub_1A51A2CE0((uint64_t)a3);

  return v9;
}

- (void)deleteMessagesOlderThanNumberOfDays:(int)a3 compact:(BOOL)a4
{
  MFSwiftIMAPMailboxTaskManager *v4;

  v4 = self;
  sub_1A594A2C0();
  sub_1A51A2F1C();

}

- (void)handleFlagsChangedForMessages:(id)a3 flags:(id)a4 oldFlagsByMessage:(id)a5
{
  id v6;
  id v7;
  id v8;
  MFSwiftIMAPMailboxTaskManager *v9;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = self;
  sub_1A594B958();
  sub_1A594AFC8();
  sub_1A594AFC8();
  sub_1A51A2FA4();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)updateServerUnreadCountClosingConnection:(BOOL)a3
{
  MFSwiftIMAPMailboxTaskManager *v3;

  v3 = self;
  sub_1A594A2C0();
  sub_1A51A30D0();

}

- (id)replayAction:(id)a3
{
  id v4;
  MFSwiftIMAPMailboxTaskManager *v5;
  id v9;

  v4 = a3;
  v5 = self;
  v9 = (id)sub_1A51A3144();

  return v9;
}

- (id)messageIdRollCall:(id)a3
{
  id v4;
  MFSwiftIMAPMailboxTaskManager *v5;
  void *v9;

  v4 = a3;
  v5 = self;
  sub_1A594BB8C();
  sub_1A51A3200();
  swift_bridgeObjectRelease();

  v9 = (void *)sub_1A594BB80();
  swift_bridgeObjectRelease();
  return v9;
}

@end
