@implementation MFSwiftIMAPTaskManager

- (MFSwiftIMAPTaskManager)initWithAccount:(id)a3
{
  id v3;

  v3 = a3;
  return (MFSwiftIMAPTaskManager *)sub_1A54A6CBC(a3);
}

- (void)dealloc
{
  MFSwiftIMAPTaskManager *v2;

  v2 = self;
  sub_1A54A94F4();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  swift_release();

  v3 = OBJC_IVAR___MFSwiftIMAPTaskManager_logger;
  v2 = sub_1A594A764();
  (*(void (**)(char *))(*(_QWORD *)(v2 - 8) + 8))((char *)self + v3);
  sub_1A5139FD8();
  swift_release();
  sub_1A54B94D4((uint64_t)self + OBJC_IVAR___MFSwiftIMAPTaskManager__engineAndAdaptor);
}

- (void)test_tearDown
{
  MFSwiftIMAPTaskManager *v2;

  v2 = self;
  sub_1A54A99A8();

}

- (MFSwiftIMAPTaskManager)init
{
  return (MFSwiftIMAPTaskManager *)sub_1A54A9EF0();
}

- (void)accountDidChange:(id)a3
{
  id v4;
  id v5;
  MFSwiftIMAPTaskManager *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  MFSwiftIMAPTaskManager *v12;

  v12 = self;
  v11 = a3;
  v10 = sub_1A5949B7C();
  v8 = *(_QWORD *)(v10 - 8);
  v7 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v11);
  v9 = (uint64_t)&v7 - v7;
  v5 = v4;
  v6 = self;
  sub_1A5949B64();
  sub_1A54AB768(v9);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);

}

- (void)fetchNow:(int)a3
{
  MFSwiftIMAPTaskManager *v3;

  v3 = self;
  sub_1A54AEB54(a3);

}

- (void)fetchNow:(int)a3 withMailboxes:(id)a4 completion:(id)a5
{
  id v5;
  MFSwiftIMAPTaskManager *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v13;

  v5 = a4;
  v13 = _Block_copy(a5);
  v6 = self;
  if (a4)
  {
    sub_1A521BC28();
    v8 = sub_1A594B958();

    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v13;
  sub_1A54AEB94(a3, v9, (uint64_t)sub_1A54B9E58, v7);
  swift_release();
  swift_bridgeObjectRelease();

}

- (void)startBackFillingMessageBodyDownloadWithRequest:(id)a3
{
  MFSwiftIMAPTaskManager *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A54AFC44((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (void)stopBackFillingMessageBodyDownload
{
  MFSwiftIMAPTaskManager *v2;

  v2 = self;
  sub_1A54AFD90();

}

- (void)closeAllConnections
{
  MFSwiftIMAPTaskManager *v2;

  v2 = self;
  sub_1A54B1C10();

}

- (BOOL)createMailbox:(id)a3
{
  id v3;
  MFSwiftIMAPTaskManager *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v4 = self;
  if (a3)
  {
    v7 = sub_1A594B40C();
    v8 = v5;

    v9 = v7;
    v10 = v8;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  sub_1A54B5E88(v9, v10);
  swift_bridgeObjectRelease();

  return sub_1A594A2B4() & 1;
}

- (BOOL)deleteMailbox:(id)a3
{
  id v3;
  MFSwiftIMAPTaskManager *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v4 = self;
  if (a3)
  {
    v7 = sub_1A594B40C();
    v8 = v5;

    v9 = v7;
    v10 = v8;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  sub_1A54B650C(v9, v10);
  swift_bridgeObjectRelease();

  return sub_1A594A2B4() & 1;
}

- (BOOL)renameMailbox:(id)a3 toMailbox:(id)a4
{
  id v4;
  id v5;
  MFSwiftIMAPTaskManager *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = a4;
  v6 = self;
  if (a3)
  {
    v14 = sub_1A594B40C();
    v15 = v7;

    v16 = v14;
    v17 = v15;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  if (a4)
  {
    v10 = sub_1A594B40C();
    v11 = v8;

    v12 = v10;
    v13 = v11;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  sub_1A54B6B90(v16, v17, v12, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return sub_1A594A2B4() & 1;
}

- (void)localMailboxesDidChange
{
  MFSwiftIMAPTaskManager *v2;

  v2 = self;
  sub_1A54B72E4();

}

- (id)fetchSeparatorChar
{
  MFSwiftIMAPTaskManager *v2;
  uint64_t v3;
  uint64_t v5;
  id v6;
  uint64_t v8;

  v2 = self;
  sub_1A54B73C0();
  v8 = v3;

  if (v8)
  {
    v5 = sub_1A594B3F4();
    swift_bridgeObjectRelease();
    v6 = (id)v5;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)addLocalAction:(id)a3
{
  id v4;
  MFSwiftIMAPTaskManager *v5;

  v4 = a3;
  v5 = self;
  sub_1A54B7C0C((uint64_t)a3);

}

- (void)checkForNewLocalActions
{
  MFSwiftIMAPTaskManager *v2;

  v2 = self;
  sub_1A54A6748();

}

@end
