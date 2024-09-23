@implementation DebugFormatUploadDiffView

- (_TtC8NewsFeed25DebugFormatUploadDiffView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB345544();
}

- (void)layoutSubviews
{
  _TtC8NewsFeed25DebugFormatUploadDiffView *v2;

  v2 = self;
  sub_1BB3449AC();

}

- (_TtC8NewsFeed25DebugFormatUploadDiffView)initWithFrame:(CGRect)a3
{
  _TtC8NewsFeed25DebugFormatUploadDiffView *result;

  result = (_TtC8NewsFeed25DebugFormatUploadDiffView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_tableView));
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unint64_t *v5;
  unint64_t v6;
  int64_t v7;
  id v9;
  _TtC8NewsFeed25DebugFormatUploadDiffView *v10;

  v5 = (unint64_t *)((char *)self + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_changeSet);
  swift_beginAccess();
  v6 = *v5;
  if (!(v6 >> 62))
    return *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v9 = a3;
  v10 = self;
  swift_bridgeObjectRetain();
  v7 = sub_1BB873F30();

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8NewsFeed25DebugFormatUploadDiffView *v11;
  unint64_t v12;
  int64_t v13;
  id v15;
  _TtC8NewsFeed25DebugFormatUploadDiffView *v16;

  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8NewsFeed25DebugFormatUploadDiffView_changeSet);
  swift_beginAccess();
  v8 = *v7;
  if ((v8 & 0xC000000000000001) == 0)
  {
    if (a4 < 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
    {
      v9 = *(_QWORD *)(v8 + 8 * a4 + 32);
      v10 = a3;
      v11 = self;
      swift_retain();
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_11;
  }
  v15 = a3;
  v16 = self;
  v9 = MEMORY[0x1BCCE4630](a4, v8);
LABEL_5:
  swift_endAccess();
  v12 = *(_QWORD *)(v9 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  if (v12 >> 62)
  {
LABEL_11:
    swift_bridgeObjectRetain();
    v13 = sub_1BB873F30();

    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);

LABEL_7:
  swift_bridgeObjectRelease();

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed25DebugFormatUploadDiffView *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1BB344DD4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC8NewsFeed25DebugFormatUploadDiffView *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = self;
  sub_1BB345660(a4);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end
