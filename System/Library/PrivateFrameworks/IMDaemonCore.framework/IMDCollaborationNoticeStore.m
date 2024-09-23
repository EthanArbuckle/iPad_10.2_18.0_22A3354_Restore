@implementation IMDCollaborationNoticeStore

- (void)saveNotice:(id)a3
{
  id v4;
  IMDCollaborationNoticeStore *v5;

  v4 = a3;
  v5 = self;
  sub_1D1659CC0(v4);

}

- (id)noticesForURLs:(id)a3
{
  uint64_t v4;
  IMDCollaborationNoticeStore *v5;
  uint64_t v6;
  void *v7;

  sub_1D166D580();
  v4 = sub_1D166DBEC();
  v5 = self;
  v6 = sub_1D165A618(v4);

  swift_bridgeObjectRelease();
  if (v6)
  {
    sub_1D15FD3C0(0, &qword_1EFC63930);
    v7 = (void *)sub_1D166DBD4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)deleteNotice:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  IMDCollaborationNoticeStore *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;

  v5 = sub_1D141AC58(&qword_1ED9356E0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  v10 = objc_msgSend(v8, sel_guidString);
  v11 = sub_1D166DACC();
  v13 = v12;

  sub_1D165B720(v11, v13, v7);
  swift_bridgeObjectRelease();
  v14 = sub_1D166D580();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14) != 1)
  {
    v16 = (void *)sub_1D166D520();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
  }
  return v16;
}

- (id)deleteNoticeWithGUIDString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  IMDCollaborationNoticeStore *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v4 = sub_1D141AC58(&qword_1ED9356E0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D166DACC();
  v9 = v8;
  v10 = self;
  sub_1D165B720(v7, v9, v6);

  swift_bridgeObjectRelease();
  v11 = sub_1D166D580();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    v13 = (void *)sub_1D166D520();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  return v13;
}

- (id)deleteAllNoticesWithCollaborationIdentifier:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  IMDCollaborationNoticeStore *v7;
  void *v8;

  v4 = sub_1D166DACC();
  v6 = v5;
  v7 = self;
  sub_1D165C3C0(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1D166DBD4();
  swift_bridgeObjectRelease();
  return v8;
}

- (void)deleteNoticesForURLs:(id)a3
{
  uint64_t v4;
  IMDCollaborationNoticeStore *v5;

  sub_1D166D580();
  v4 = sub_1D166DBEC();
  v5 = self;
  sub_1D165CD84(v4);

  swift_bridgeObjectRelease();
}

- (IMDCollaborationNoticeStore)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDCollaborationNoticeStore____lazy_storage___persistenceContainer) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CollaborationNoticeStore();
  return -[IMDCollaborationNoticeStore init](&v3, sel_init);
}

- (void).cxx_destruct
{
  sub_1D165DD9C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR___IMDCollaborationNoticeStore____lazy_storage___persistenceContainer));
}

@end
