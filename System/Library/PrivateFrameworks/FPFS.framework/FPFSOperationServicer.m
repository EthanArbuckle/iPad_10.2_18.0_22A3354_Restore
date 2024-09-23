@implementation FPFSOperationServicer

- (void)startOperation:(id)a3 toFetchThumbnailsForItemIdentifiers:(id)a4 size:(CGSize)a5 completionHandler:(id)a6
{
  double height;
  double width;
  void *v10;
  unint64_t v11;

  height = a5.height;
  width = a5.width;
  v10 = _Block_copy(a6);
  sub_23AA9F52C(0, (unint64_t *)&unk_2542E2010);
  v11 = sub_23B1C6704();
  _Block_copy(v10);
  swift_unknownObjectRetain();
  swift_retain();
  sub_23AC02CCC((uint64_t)a3, v11, (uint64_t)self, v10, width, height);
  _Block_release(v10);
  _Block_release(v10);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)startOperation:(id)a3 toFetchThumbnailsWithDictionary:(id)a4 size:(CGSize)a5 completionHandler:(id)a6
{
  double height;
  double width;
  void *v10;
  uint64_t v11;

  height = a5.height;
  width = a5.width;
  v10 = _Block_copy(a6);
  sub_23AA9F52C(0, (unint64_t *)&unk_2542E2010);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569E27E0);
  sub_23AC05110();
  v11 = sub_23B1C620C();
  _Block_copy(v10);
  swift_unknownObjectRetain();
  swift_retain();
  sub_23AC02B30((uint64_t)a3, v11, (uint64_t)self, (void (**)(_QWORD, _QWORD))v10, width, height);
  _Block_release(v10);
  _Block_release(v10);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)preflightReparentItemIDs:(id)a3 underParentID:(id)a4 reply:(id)a5
{
  void *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;

  v6 = _Block_copy(a5);
  sub_23AA9F52C(0, (unint64_t *)&unk_2542E2010);
  v7 = sub_23B1C6704();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  v9 = a4;
  swift_retain();
  sub_23ABF8140(v7, v9, (uint64_t)sub_23AC052B8, v8);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)singleItemChange:(id)a3 changedFields:(unint64_t)a4 bounce:(BOOL)a5 completionHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;

  v9 = _Block_copy(a6);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a3;
  swift_retain();
  sub_23ABF868C(v11, a4, a5, (uint64_t)sub_23AC052AC, v10);

  swift_release();
  swift_release();
}

- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];

  v7 = _Block_copy(a5);
  sub_23AA9F52C(0, &qword_2542E7560);
  sub_23B1C6704();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = *(void **)self->backend;
  swift_retain();
  v10 = (void *)sub_23B1C66F8();
  v11 = *(_QWORD *)self->request;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_23AC0542C;
  *(_QWORD *)(v12 + 24) = v8;
  v14[4] = sub_23AC050EC;
  v14[5] = v12;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_23ABF8888;
  v14[3] = &block_descriptor_369;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_bulkItemChanges_changedFields_request_completionHandler_, v10, a4, v11, v13);
  _Block_release(v13);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

}

- (void)fetchHierarchyForItemID:(id)a3 recursively:(BOOL)a4 ignoreAlternateContentURL:(BOOL)a5 reply:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_23AC04B4C;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_23AC04B4C;
  *(_QWORD *)(v13 + 24) = v11;
  *(_QWORD *)(v13 + 32) = a3;
  *(_BYTE *)(v13 + 40) = a4;
  *(_QWORD *)(v13 + 48) = self;
  *(_BYTE *)(v13 + 56) = a5;
  v14 = a3;
  swift_retain_n();
  swift_retain_n();
  v15 = v14;
  sub_23AC62910((uint64_t)"fetchHierarchy(for:recursively:ignoreAlternateContentURL:reply:)", 64, 2, (void (*)(_QWORD *, id))sub_23AB3D8B8, v12, (uint64_t)sub_23AC04B88, v13);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)userCheckedSuppressionCheckboxForUserInteractionIdentifier:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = _Block_copy(a5);
  v8 = sub_23B1C63E0();
  v10 = v9;
  _Block_copy(v7);
  v11 = a4;
  swift_retain();
  sub_23AC02F80(v8, v10, v11, (uint64_t)self, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)fetchDefaultContainerForBundleIdentifier:(id)a3 defaultName:(id)a4 inDomainIdentifier:(id)a5 lookupOnly:(BOOL)a6 reply:(id)a7
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  id v19;
  uint64_t v20;

  v9 = _Block_copy(a7);
  v20 = sub_23B1C63E0();
  v11 = v10;
  v12 = sub_23B1C63E0();
  v14 = v13;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v9;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_23AC052AC;
  *(_QWORD *)(v16 + 24) = v15;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = self;
  v17[3] = v20;
  v17[4] = v11;
  v17[5] = v12;
  v17[6] = v14;
  v17[7] = a5;
  v17[8] = sub_23AC052AC;
  v17[9] = v15;
  v18 = a5;
  swift_retain_n();
  swift_retain_n();
  v19 = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23AC625B8((uint64_t)"fetchDefaultContainer(forBundleIdentifier:defaultName:inDomainIdentifier:lookupOnly:reply:)", 91, 2, (void (*)(_QWORD *, id))sub_23AC05428, v16, (uint64_t)sub_23AC049EC, (uint64_t)v17);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (void)fetchItemID:(id)a3 reply:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a3;
  swift_retain();
  sub_23ABFA960(v7, (uint64_t)sub_23AC049A0, v6);

  swift_release();
  swift_release();
}

- (void)preflightTrashItemIDs:(id)a3 completionHandler:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = _Block_copy(a4);
  sub_23AA9F52C(0, (unint64_t *)&unk_2542E2010);
  v6 = sub_23B1C6704();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_23AC04980;
  v8[3] = v7;
  v8[4] = self;
  swift_retain_n();
  swift_retain();
  sub_23AC6667C(v6, (uint64_t)sub_23AC04994, (uint64_t)v8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)fetchTrashIdentifiersWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_23AC04930;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_23AC04930;
  v7[4] = v5;
  swift_retain_n();
  swift_retain_n();
  sub_23AC62C68((uint64_t)"fetchTrashIdentifiers(completionHandler:)", 41, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v6, (uint64_t)sub_23AC04974, (uint64_t)v7);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (id)fetchPublishingURLForItemID:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  id v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_23AC048D8;
  v8[5] = v7;
  v9 = a3;
  swift_retain_n();
  v10 = v9;
  swift_retain();
  sub_23AC62FC0((uint64_t)"fetchPublishingURL(for:completionHandler:)", 42, 2, (void (*)(char *, id))sub_23AC048D8, v7, (uint64_t)sub_23AC04924, (uint64_t)v8);

  swift_release();
  swift_release();
  swift_release();
  return 0;
}

- (id)disconnectDomainID:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  void *v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  swift_retain();
  v10 = (void *)sub_23AC03378(v9, a4, (uint64_t)self, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
  return v10;
}

- (void)wakeForSessionIdentifier:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = _Block_copy(a4);
  v6 = sub_23B1C63E0();
  v8 = v7;
  _Block_copy(v5);
  swift_retain();
  sub_23AC03760(v6, v8, (uint64_t)self, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = self;
  v10[3] = a3;
  v10[4] = a4;
  v10[5] = sub_23AC04798;
  v10[6] = v9;
  v11 = a3;
  swift_retain_n();
  v12 = v11;
  swift_retain();
  sub_23AC61F48((uint64_t)"attemptRecovery(fromError:optionIndex:completionHandler:)", 57, 2, sub_23AC04798, v9, (uint64_t)sub_23AC04830, (uint64_t)v10);
  swift_release();

  swift_release();
  swift_release();
}

- (void)userInteractionErrorsForPerformingAction:(id)a3 sourceItems:(id)a4 destinationItem:(id)a5 fpProviderDomainId:(id)a6 sourceItemKeysAllowList:(id)a7 destinationItemKeysAllowList:(id)a8 completionHandler:(id)aBlock
{
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v15 = _Block_copy(aBlock);
  if (a4)
  {
    sub_23AA9F52C(0, &qword_2542E7560);
    a4 = (id)sub_23B1C6704();
  }
  if (a7)
    a7 = (id)sub_23B1C689C();
  if (a8)
    a8 = (id)sub_23B1C689C();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v15;
  v17 = a3;
  v18 = a5;
  v19 = a6;
  swift_retain();
  sub_23ABFBE20(v17, a4, a5, a6, a7, a8, (uint64_t)sub_23AC04790, v16);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)deleteItemsWithIDs:(id)a3 baseVersions:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  void *v7;
  unint64_t v8;
  uint64_t v9;

  v7 = _Block_copy(a6);
  sub_23AA9F52C(0, (unint64_t *)&unk_2542E2010);
  v8 = sub_23B1C6704();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  swift_retain();
  sub_23ABFE510(v8, a5, (uint64_t)sub_23AC052B4, v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 domainIdentifier:(id)a5 completionHandler:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  id v16;
  _QWORD *v17;
  id v18;
  id v19;

  v8 = _Block_copy(a6);
  v9 = sub_23B1C63E0();
  v11 = v10;
  type metadata accessor for NSFileProviderItemIdentifier(0);
  v12 = sub_23B1C6704();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v8;
  swift_retain();
  v14 = a5;
  v15 = sub_23AC02A48(v12, (uint64_t)self);
  v16 = objc_msgSend((id)objc_opt_self(), sel_progressWithTotalUnitCount_, 1);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v16;
  v17[3] = sub_23AC04714;
  v17[4] = v13;
  v17[5] = self;
  v17[6] = v9;
  v17[7] = v11;
  v17[8] = v14;
  swift_retain();
  v18 = v14;
  v19 = v16;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23AC6667C(v15, (uint64_t)sub_23AC04760, (uint64_t)v17);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v19;
}

- (void)updateIgnoreStateOfItemWithIdentifiers:(id)a3 ignoreState:(BOOL)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = _Block_copy(a5);
  type metadata accessor for NSFileProviderItemIdentifier(0);
  v8 = sub_23B1C6704();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_23AC03C6C;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = self;
  *(_BYTE *)(v11 + 32) = a4;
  *(_QWORD *)(v11 + 40) = sub_23AC03C6C;
  *(_QWORD *)(v11 + 48) = v9;
  swift_retain_n();
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_23AC65BA4((uint64_t)"updateIgnoreStateOfItem(withIdentifiers:ignoreState:completionHandler:)", 71, 2, (void (*)(_QWORD *, uint64_t *, id))sub_23AC03C74, v10, (uint64_t)sub_23AC03CB0, v11);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

@end
