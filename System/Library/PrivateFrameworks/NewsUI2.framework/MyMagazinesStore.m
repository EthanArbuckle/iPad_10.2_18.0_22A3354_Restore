@implementation MyMagazinesStore

- (_TtC7NewsUI216MyMagazinesStore)init
{
  _TtC7NewsUI216MyMagazinesStore *result;

  result = (_TtC7NewsUI216MyMagazinesStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216MyMagazinesStore_issueService);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216MyMagazinesStore_paidBundleConfigManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216MyMagazinesStore_myMagazinesPersonalizationService);
  swift_release();

  swift_release();
  swift_release();
}

- (void)issueReadingHistoryDidChange:(id)a3 forIssueIDs:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC7NewsUI216MyMagazinesStore *v8;

  v6 = sub_1D6E26D80();
  v7 = a3;
  v8 = self;
  sub_1D698720C(v6);

  swift_bridgeObjectRelease();
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  uint64_t v13;
  id v14;
  _TtC7NewsUI216MyMagazinesStore *v15;

  if (a4)
  {
    v13 = sub_1D6E27038();
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v13 = 0;
  if (a5)
LABEL_3:
    sub_1D6E27038();
LABEL_4:
  if (a6)
    sub_1D6E27038();
  if (a7)
    a7 = (id)sub_1D6E27038();
  v14 = a3;
  v15 = self;
  sub_1D69875A0(v13, (uint64_t)a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)offlineIssueList:(id)a3 didAddIssues:(id)a4 removeIssues:(id)a5
{
  uint64_t v7;
  id v8;
  _TtC7NewsUI216MyMagazinesStore *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC7NewsUI216MyMagazinesStore *v12;
  void *v13;

  v7 = sub_1D666F4F4((uint64_t)&unk_1E9AB1260);
  v8 = a3;
  v9 = self;
  sub_1D6E1AE1C();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = v7;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_1D6987B3C;
  *(_QWORD *)(v11 + 24) = v10;
  v12 = v9;
  swift_bridgeObjectRetain();
  v13 = (void *)sub_1D6E1AB4C();
  sub_1D6E1AC18();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

}

@end
