@implementation SportsSyncManager

- (_TtC7NewsUI217SportsSyncManager)init
{
  _TtC7NewsUI217SportsSyncManager *result;

  result = (_TtC7NewsUI217SportsSyncManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI217SportsSyncManager_syncService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI217SportsSyncManager_tagService);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI217SportsSyncManager____lazy_storage___operationQueue));
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (void)handleSyncCompletionNotification
{
  _TtC7NewsUI217SportsSyncManager *v2;

  v2 = self;
  sub_1D625BB14("Sports sync manager received sync completion notification from watchlist", (uint64_t)sub_1D626838C, (uint64_t)&block_descriptor_145);

}

- (void)handleSyncSettingChangedNotification
{
  _TtC7NewsUI217SportsSyncManager *v2;

  v2 = self;
  sub_1D625BB14("Sports sync manager received sync setting notification from watchlist", (uint64_t)sub_1D6268344, (uint64_t)&block_descriptor_140);

}

- (void)handleiTunesAccountChanged
{
  _TtC7NewsUI217SportsSyncManager *v2;

  v2 = self;
  sub_1D625BB14("Sports sync manager detected apple account changed", (uint64_t)sub_1D62682C0, (uint64_t)&block_descriptor_136);

}

- (void)subscriptionControllerWillStartSyncingRemoteChanges:(id)a3
{
  id v4;
  _TtC7NewsUI217SportsSyncManager *v5;

  v4 = a3;
  v5 = self;
  sub_1D6266B94();

}

- (void)subscriptionControllerDidStopSyncingRemoteChanges:(id)a3
{
  id v4;
  _TtC7NewsUI217SportsSyncManager *v5;

  v4 = a3;
  v5 = self;
  sub_1D6266C98();

}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  uint64_t v14;
  id v15;
  _TtC7NewsUI217SportsSyncManager *v16;

  if (a4)
  {
    v14 = sub_1D6E27038();
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v14 = 0;
  if (a5)
LABEL_3:
    sub_1D6E27038();
LABEL_4:
  if (a6)
    sub_1D6E27038();
  if (a7)
    a7 = (id)sub_1D6E27038();
  v15 = a3;
  v16 = self;
  sub_1D6266D98(v14, (uint64_t)a7, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)userInfoDidChangeSportsSyncState:(id)a3
{
  id v4;
  _TtC7NewsUI217SportsSyncManager *v5;

  v4 = a3;
  v5 = self;
  sub_1D625C734(v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC7NewsUI217SportsSyncManager *v13;
  id v14;
  _TtC7NewsUI217SportsSyncManager *v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[2];

  if (a3)
  {
    v9 = sub_1D6E26978();
    v11 = v10;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain();
      v12 = a5;
      v13 = self;
      sub_1D6E27D04();
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v9 = 0;
    v11 = 0;
    if (a4)
      goto LABEL_3;
  }
  memset(v18, 0, sizeof(v18));
  v14 = a5;
  v15 = self;
LABEL_6:
  v16 = MEMORY[0x1E0DEE9B8];
  if (a5)
  {
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1D5E6D8C0(&qword_1EFFDEEA0, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_1D6E328C4);
    v17 = sub_1D6E267D4();

  }
  else
  {
    v17 = 0;
  }
  sub_1D6267428(v9, v11, (uint64_t)v18, v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D5F377D4((uint64_t)v18, (uint64_t)&qword_1ED5F4F00, v16 + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1D5E76DF0);
}

- (void)appleAccountChanged
{
  _TtC7NewsUI217SportsSyncManager *v2;

  v2 = self;
  sub_1D625CD80();

}

@end
