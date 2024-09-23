@implementation IMDSpotlightDaemonClient

- (IMDSpotlightDaemonClient)init
{
  IMDSpotlightDaemonClient *result;

  sub_1D1649568();
  return result;
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  IMDSpotlightDaemonClient *v14;

  v6 = _Block_copy(a5);
  v7 = sub_1D166DACC();
  v9 = v8;
  v10 = sub_1D166DACC();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v6;
  v14 = self;
  sub_1D1649A1C(v7, v9, v10, v12, (uint64_t)sub_1D164F11C, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  IMDSpotlightDaemonClient *v16;

  v7 = _Block_copy(a6);
  v8 = sub_1D166DBEC();
  v9 = sub_1D166DACC();
  v11 = v10;
  v12 = sub_1D166DACC();
  v14 = v13;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v7;
  v16 = self;
  sub_1D1649E74(v8, v9, v11, v12, v14, (uint64_t)sub_1D164F0CC, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  sub_1D164A3D4(self, (int)a2, (int)a3, (int)a4, (int)a5, (int)a6, a7, a8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, void *))sub_1D164D85C);
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  sub_1D164A3D4(self, (int)a2, (int)a3, (int)a4, (int)a5, (int)a6, a7, a8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, void *))sub_1D164DD34);
}

- (void)provideFileURLsForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifiers:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  IMDSpotlightDaemonClient *v21;

  v10 = _Block_copy(a8);
  v11 = sub_1D166DACC();
  v13 = v12;
  v14 = sub_1D166DACC();
  v16 = v15;
  v17 = sub_1D166DBEC();
  v18 = sub_1D166DACC();
  v20 = v19;
  _Block_copy(v10);
  v21 = self;
  sub_1D164E3F0(v11, v13, v14, v16, v17, v18, v20, a7, (uint64_t)v21, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4
{
  unint64_t v6;
  IMDSpotlightDaemonClient *v7;

  sub_1D15FD3C0(0, &qword_1EFC637B8);
  v6 = sub_1D166DBEC();
  v7 = self;
  sub_1D164A604(v6, a4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3
{
  void *v4;
  IMDSpotlightDaemonClient *v5;
  id v6;
  id v7;

  sub_1D15FD3C0(0, &qword_1EFC61E10);
  sub_1D166DA30();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_sharedInstance);
  v7 = (id)sub_1D166DA18();
  objc_msgSend(v6, sel_updateChatsUsingMessageGUIDsAndSummaries_, v7);

  swift_bridgeObjectRelease();
}

- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  IMDSpotlightDaemonClient *v10;

  v7 = _Block_copy(a5);
  v8 = sub_1D166DBEC();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  sub_1D164ABC0(v8, a4, (uint64_t)sub_1D164B6D0, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

@end
