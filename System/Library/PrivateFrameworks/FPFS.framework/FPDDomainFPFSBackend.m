@implementation FPDDomainFPFSBackend

- (void)fetchOperationServiceOrEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _TtC9libfssync20FPDDomainFPFSBackend *v11;
  _TtC9libfssync20FPDDomainFPFSBackend *v12;
  id v13;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_23AAB61D4;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = self;
  v9[3] = a3;
  v9[4] = sub_23AAB61D4;
  v9[5] = v7;
  v10 = a3;
  v11 = self;
  swift_retain_n();
  v12 = v11;
  v13 = v10;
  sub_23AA6B360((uint64_t)"fetchOperationServiceOrEndpoint(with:completionHandler:)", 56, 2, (void (*)(_QWORD *, uint64_t *, id))sub_23ACFF928, v8, (uint64_t)sub_23ACFEAA8, (uint64_t)v9);

  swift_release();
  swift_release();
  swift_release();
}

- (void)URLForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 forBookmarkResolution:(BOOL)a6 request:(id)a7 completionHandler:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  void *v14;
  id v15;
  id v16;
  _TtC9libfssync20FPDDomainFPFSBackend *v17;

  v9 = a6;
  v10 = a5;
  v14 = _Block_copy(a8);
  _Block_copy(v14);
  v15 = a3;
  v16 = a7;
  v17 = self;
  sub_23AA755E0(v15, a4, v10, v9, v16, v17, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v14);
  _Block_release(v14);
  _Block_release(v14);

}

- (void)enumerateWithSettings:(id)a3 lifetimeExtender:(id)a4 observer:(id)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  _TtC9libfssync20FPDDomainFPFSBackend *v12;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  v11 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v12 = self;
  sub_23AA78680(v11, (uint64_t)a4, (uint64_t)a5, (char *)v12, (void (**)(_QWORD, _QWORD, _QWORD))v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)valuesForAttributes:(id)a3 forURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC9libfssync20FPDDomainFPFSBackend *v17;
  uint64_t v18;

  v9 = sub_23B1C5A08();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  type metadata accessor for URLResourceKey(0);
  v14 = sub_23B1C6704();
  sub_23B1C59CC();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  v16 = a5;
  v17 = self;
  sub_23AA7A90C(v14, (uint64_t)v12, v16, sub_23AAB6660, v15);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)rootURLs
{
  id v1;
  void *v2;

  v1 = a1;
  sub_23AA6C170(v1, v1);

  sub_23B1C5A08();
  v2 = (void *)sub_23B1C66F8();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)rootURLsWithTransientState:(BOOL *)a3
{
  _TtC9libfssync20FPDDomainFPFSBackend *v4;
  void *v5;

  v4 = self;
  sub_23AAB86B4(a3);

  sub_23B1C5A08();
  v5 = (void *)sub_23B1C66F8();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)itemForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _TtC9libfssync20FPDDomainFPFSBackend *v15;
  uint64_t v16;

  v8 = sub_23B1C5A08();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_23B1C59CC();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a4;
  v15 = self;
  sub_23AA7B878((uint64_t)v11, v14, sub_23ACFEA1C, v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BOOL)backgroundActivityIsPaused
{
  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___fpfs))
    return 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542E69F0);
  return *(_BYTE *)(swift_dynamicCastClassUnconditional() + 90);
}

- (int64_t)errorGenerationCount
{
  void *v2;
  _TtC9libfssync20FPDDomainFPFSBackend *v3;
  id v4;
  int64_t v6;

  v2 = *(void **)&self->purposeIdentifier[OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_errorGenerationRecord];
  v3 = self;
  v4 = v2;
  sub_23B1C6B48();

  return v6;
}

- (NSData)backingStoreIdentity
{
  uint64_t *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity);
  swift_beginAccess();
  v3 = 0;
  v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    v5 = *v2;
    sub_23AAAE668(v5, v4);
    v3 = (void *)sub_23B1C5AA4();
    sub_23AAA3E18(v5, v4);
  }
  return (NSData *)v3;
}

- (void)setBackingStoreIdentity:(id)a3
{
  void *v3;
  _TtC9libfssync20FPDDomainFPFSBackend *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  _TtC9libfssync20FPDDomainFPFSBackend *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;

  v3 = a3;
  if (a3)
  {
    v5 = self;
    v6 = v3;
    v3 = (void *)sub_23B1C5AD4();
    v8 = v7;

  }
  else
  {
    v9 = self;
    v8 = 0xF000000000000000;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity);
  swift_beginAccess();
  v11 = *v10;
  v12 = v10[1];
  *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_23AAA3E18(v11, v12);

}

- (_TtC9libfssync20FPDDomainFPFSBackend)initWithDomain:(id)a3
{
  return (_TtC9libfssync20FPDDomainFPFSBackend *)sub_23AC4EC74(a3);
}

- (NSArray)coordinationRootURLs
{
  _TtC9libfssync20FPDDomainFPFSBackend *v2;
  void *v3;

  v2 = self;
  sub_23AC5077C();

  sub_23B1C5A08();
  v3 = (void *)sub_23B1C66F8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSFileProviderDomainVersion)domainVersion
{
  void *v3;
  _TtC9libfssync20FPDDomainFPFSBackend *v4;
  void *v5;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___fpfs))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542E69F0);
    v3 = (void *)swift_dynamicCastClassUnconditional();
    swift_retain();
    v4 = self;
    v5 = sub_23B0EA534(v3, (uint64_t)v3);

    swift_release();
  }
  else
  {
    v5 = 0;
  }
  return (NSFileProviderDomainVersion *)v5;
}

- (void)removeEbihilSymlink
{
  _TtC9libfssync20FPDDomainFPFSBackend *v2;

  v2 = self;
  sub_23AC5593C();

}

- (BOOL)updateRootAfterDomainChangeWithError:(id *)a3
{
  _TtC9libfssync20FPDDomainFPFSBackend *v3;

  v3 = self;
  sub_23AC55F4C();

  return 1;
}

- (void)copyDatabaseToURL:(id)a3 completionHandler:(id)a4
{
  sub_23ACB4B40(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, id, void *))sub_23ACE1AA8);
}

- (void)didChangeDomainConfiguration:(id)a3
{
  id v4;
  _TtC9libfssync20FPDDomainFPFSBackend *v5;

  v4 = a3;
  v5 = self;
  sub_23AC68140(v4);

}

- (void)queryDiskImportSchedulerLabelWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC9libfssync20FPDDomainFPFSBackend *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_23ACF2150;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_23ACF2150;
  *(_QWORD *)(v7 + 24) = v5;
  swift_retain_n();
  v8 = self;
  sub_23AC63380((uint64_t)"queryDiskImportSchedulerLabel(completionHandler:)", 49, 2, (void (*)(uint64_t *, id))sub_23ACFF4F4, v6, (uint64_t)sub_23ACFF958, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC9libfssync20FPDDomainFPFSBackend)init
{
  _TtC9libfssync20FPDDomainFPFSBackend *result;

  result = (_TtC9libfssync20FPDDomainFPFSBackend *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  sub_23ACE2278(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___cachedURLs), self->domain[OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend___cachedURLs]);
  swift_release();
  sub_23AAA3E18(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity), *(_QWORD *)&self->domain[OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_backingStoreIdentity]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_pendingSetWatchingQueue));
  sub_23ACF184C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_startStatus));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();

  sub_23AA8A05C((uint64_t)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_pendingSetState, (uint64_t *)&unk_2542DE058);
  swift_unknownObjectRelease();
  sub_23AA8A05C((uint64_t)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_pendingSetStateURL, (uint64_t *)&unk_2542E6740);

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend__signaledErrorGenerationDebouncer;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542E67E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (NSString)watcherLabel
{
  void *v2;

  sub_23B1C63E0();
  v2 = (void *)sub_23B1C63BC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)sharedSchedulerCanRun:(id)a3
{
  id v4;
  _TtC9libfssync20FPDDomainFPFSBackend *v5;

  v4 = a3;
  v5 = self;
  sub_23AC68FC4(v4);

}

- (void)reindexAllItemsWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  void *v6;
  _TtC9libfssync20FPDDomainFPFSBackend *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_23ACE295C(a3, (char *)v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)reindexItemsWithIndexReason:(int64_t)a3 identifiers:(id)a4 completionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  _TtC9libfssync20FPDDomainFPFSBackend *v8;

  v6 = _Block_copy(a5);
  v7 = sub_23B1C6704();
  _Block_copy(v6);
  v8 = self;
  sub_23ACE2D14(v7, (char *)v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (BOOL)startWithReason:(id)a3 userAllowedDBDrop:(BOOL)a4 error:(id *)a5
{
  _TtC9libfssync20FPDDomainFPFSBackend *v6;

  sub_23B1C63E0();
  v6 = self;
  sub_23B1C6B48();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)needsRootsCreation
{
  _TtC9libfssync20FPDDomainFPFSBackend *v2;
  char v3;

  v2 = self;
  if ((sub_23AC6B368() & 1) != 0)
    v3 = 1;
  else
    v3 = sub_23AC6B0A4();

  return v3 & 1;
}

- (BOOL)isDeadEndBackend
{
  return 0;
}

- (id)createRootByImportingURL:(id)a3 knownFolders:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _TtC9libfssync20FPDDomainFPFSBackend *v16;
  void *v17;
  _BYTE v19[16];

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542E6740);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_23B1C5A08();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v19[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a3)
  {
    sub_23B1C59CC();
    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, v14, 1, v10);
  sub_23AA9F52C(0, &qword_2542E1FF8);
  v15 = sub_23B1C6704();
  v16 = self;
  sub_23AC6C3B4((uint64_t)v9, v15, (uint64_t)v13);
  sub_23AA8A05C((uint64_t)v9, (uint64_t *)&unk_2542E6740);
  swift_bridgeObjectRelease();

  v17 = (void *)sub_23B1C5954();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  return v17;
}

- (void)invalidate
{
  _TtC9libfssync20FPDDomainFPFSBackend *v2;

  v2 = self;
  sub_23AC6C908();

}

- (id)cleanupDomainWithMode:(unint64_t)a3 error:(id *)a4
{
  _TtC9libfssync20FPDDomainFPFSBackend *v5;
  char *v6;

  v5 = self;
  v6 = sub_23AC710E4((uint64_t *)a3);

  return v6;
}

- (BOOL)isProviderForRealPathURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9libfssync20FPDDomainFPFSBackend *v8;
  BOOL v9;
  uint64_t v11;

  v4 = sub_23B1C5A08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B1C59CC();
  v8 = self;
  v9 = sub_23AC723BC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (void)dumpStateTo:(id)a3 limitNumberOfItems:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  _TtC9libfssync20FPDDomainFPFSBackend *v13;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  v11 = a3;
  v12 = a5;
  v13 = self;
  sub_23ACE30D4(v11, a4, (char *)v13, (void (**)(_QWORD, _QWORD))v10);
  _Block_release(v10);
  _Block_release(v10);

}

- (void)waitForChangesOnItemsBelowItemWithIdentifier:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC9libfssync20FPDDomainFPFSBackend *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_23ACE3498(v9, v10, v11, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)waitForStabilizationForRequest:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC9libfssync20FPDDomainFPFSBackend *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_23ACE385C(v7, v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)itemIDForURL:(id)a3 requireProviderItemID:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _TtC9libfssync20FPDDomainFPFSBackend *v17;
  uint64_t v18;

  v8 = a4;
  v10 = sub_23B1C5A08();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  sub_23B1C59CC();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  v16 = a5;
  v17 = self;
  sub_23AC75F20((uint64_t)v13, v8, v16, (uint64_t)sub_23ACFEA1C, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)itemForItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 request:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _TtC9libfssync20FPDDomainFPFSBackend *v17;
  uint64_t v18;
  id v19;

  v8 = a5;
  v9 = a4;
  v12 = _Block_copy(a7);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = swift_allocObject();
  v15 = a3;
  v16 = a6;
  v17 = self;
  *(_QWORD *)(v14 + 16) = objc_msgSend(v15, sel_identifier);
  *(_QWORD *)(v14 + 24) = v16;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = sub_23ACFEA1C;
  *(_QWORD *)(v18 + 24) = v13;
  v19 = v16;
  swift_retain();
  sub_23AC76370(v15, v9, v8, v14 | 0x9000000000000000, (uint64_t)sub_23ACFF8C8, v18);

  swift_release();
  swift_release();
  swift_release();
}

- (void)putBackURLForTrashedItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _TtC9libfssync20FPDDomainFPFSBackend *v20;
  void (**v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  _TtC9libfssync20FPDDomainFPFSBackend *v24;
  id v25;
  uint64_t v26;
  _TtC9libfssync20FPDDomainFPFSBackend *v27;
  id v28;
  char *v29;

  v27 = self;
  v28 = a4;
  v6 = sub_23B1C5A08();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - v11;
  v13 = _Block_copy(a5);
  v29 = v12;
  sub_23B1C59CC();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  v15 = v12;
  v16 = v6;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v15, v6);
  v17 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v18 = (v8 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject();
  v20 = v27;
  *(_QWORD *)(v19 + 16) = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v19 + v17, v10, v16);
  v21 = (void (**)(uint64_t, uint64_t))(v19 + v18);
  *v21 = sub_23ACFEA20;
  v21[1] = (void (*)(uint64_t, uint64_t))v14;
  v22 = v28;
  *(_QWORD *)(v19 + ((v18 + 23) & 0xFFFFFFFFFFFFFFF8)) = v28;
  v23 = v22;
  v24 = v20;
  v25 = v23;
  _Block_copy(v13);
  swift_retain();
  sub_23ACE02E8((uint64_t)"putBackURLForTrashedItem(at:request:completionHandler:)", 55, 2, (uint64_t)sub_23ACE24B8, v19, v24, (void (**)(_QWORD, _QWORD, _QWORD))v13);
  _Block_release(v13);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v29, v16);
}

- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4
{
  sub_23ACB4B40(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, id, void *))sub_23ACE3C10);
}

- (id)startProvidingItemAtURL:(id)a3 readerID:(id)a4 readingOptions:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  char *v16;
  _TtC9libfssync20FPDDomainFPFSBackend *v17;
  char *v18;
  _BYTE v20[32];

  v11 = sub_23B1C5A08();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = &v20[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = _Block_copy(a7);
  sub_23B1C59CC();
  swift_unknownObjectRetain();
  v16 = (char *)a6;
  v17 = self;
  sub_23B1C6D7C();
  swift_unknownObjectRelease();
  _Block_copy(v15);
  v18 = sub_23ACE4050(v14, (uint64_t)v20, a5, v16, (char *)v17, (void (**)(const void *, void *))v15);
  _Block_release(v15);
  _Block_release(v15);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v18;
}

- (void)downloadItemWithItemID:(id)a3 request:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC9libfssync20FPDDomainFPFSBackend *v15;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_23AC7F428(v12, v13, v14, (void (*)(char *, id))sub_23ACFEA20, v11);

  swift_release();
}

- (void)downloadVersionWithItemID:(id)a3 version:(id)a4 originalURL:(id)a5 completionHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  _TtC9libfssync20FPDDomainFPFSBackend *v17;
  uint64_t v18;

  v10 = sub_23B1C5A08();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  sub_23B1C59CC();
  _Block_copy(v14);
  v15 = a3;
  v16 = a4;
  v17 = self;
  sub_23ACE50B4(v15, v16, (uint64_t)v13, v17, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v14);
  _Block_release(v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)forceUpdateBlockedProcessNamesFromDomain:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC9libfssync20FPDDomainFPFSBackend *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542DE728);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23B1C6860();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569E30B8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569E30C8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23ACD8744((uint64_t)v9, (uint64_t)&unk_2569E30D8, (uint64_t)v14);
  swift_release();
}

- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  sub_23ACB4044(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (void (*)(char *, id, id, void *))sub_23ACE571C);
}

- (id)evictItemAtURL:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void (*v19)(char *, char *, uint64_t);
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (**v25)(uint64_t, uint64_t);
  void *v26;
  id v27;
  id v28;
  _TtC9libfssync20FPDDomainFPFSBackend *v29;
  char *v31;
  id v32;
  uint64_t v33;
  _TtC9libfssync20FPDDomainFPFSBackend *v34;
  char *v35;
  unsigned int v36;

  v36 = a4;
  v9 = sub_23B1C5A08();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v31 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v31 - v13;
  v15 = _Block_copy(a6);
  v35 = v14;
  sub_23B1C59CC();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v15;
  v17 = objc_allocWithZone(MEMORY[0x24BDD1768]);
  v32 = a5;
  v34 = self;
  v18 = objc_msgSend(v17, sel_init);
  v19 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v33 = v9;
  v19((char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v14, v9);
  v20 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v21 = (v11 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v21 + 19) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v22 + 11) & 0xFFFFFFFFFFFFFFF8;
  v24 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v24 + v20, v31, v9);
  v25 = (void (**)(uint64_t, uint64_t))(v24 + v21);
  *v25 = sub_23ACFEA1C;
  v25[1] = (void (*)(uint64_t, uint64_t))v16;
  *(_DWORD *)(v24 + v22) = v36;
  v26 = v32;
  *(_QWORD *)(v24 + v23) = v32;
  *(_QWORD *)(v24 + ((v23 + 15) & 0xFFFFFFFFFFFFFFF8)) = v18;
  swift_retain_n();
  v27 = v26;
  v28 = v18;
  v29 = v34;
  sub_23ACE0758((uint64_t)"evictItem(at:evictionReason:request:completionHandler:)", 55, 2, (uint64_t)sub_23ACE2650, v24, v34, (void (*)(_QWORD, id))sub_23ACFEA1C, v16);

  swift_release();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v35, v33);
  return v28;
}

- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 request:(id)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  _TtC9libfssync20FPDDomainFPFSBackend *v13;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  v11 = a3;
  v12 = a5;
  v13 = self;
  sub_23ACE5BB8(v11, a4, v12, v13, (void (**)(_QWORD, _QWORD))v10);
  _Block_release(v10);
  _Block_release(v10);

}

- (void)materializeItemWithID:(id)a3 requestedRange:(_NSRange)a4 request:(id)a5 completionHandler:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  void *v11;
  id v12;
  id v13;
  _TtC9libfssync20FPDDomainFPFSBackend *v14;

  length = a4.length;
  location = a4.location;
  v11 = _Block_copy(a6);
  _Block_copy(v11);
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_23ACE5F84(v12, location, length, v13, v14, (void (**)(_QWORD, _QWORD))v11);
  _Block_release(v11);
  _Block_release(v11);

}

- (void)itemChangedAtURL:(id)a3 request:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_23B1C5A08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B1C59CC();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)fakeFSEventAtURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9libfssync20FPDDomainFPFSBackend *v8;
  uint64_t v9;

  v4 = sub_23B1C5A08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B1C59CC();
  v8 = self;
  sub_23AC84580((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)enumerateMaterializedSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
  sub_23AC895B8(self, (int)a2, a3, a4, a5, (void (*)(id, uint64_t, id, void *))sub_23ACE635C);
}

- (void)currentMaterializedSetSyncAnchorWithCompletionHandler:(id)a3
{
  sub_23ACC8AE4(self, (int)a2, a3, (void (*)(void))sub_23ACE6798);
}

- (void)enumeratePendingSetFromSyncAnchor:(id)a3 suggestedBatchSize:(int64_t)a4 completionHandler:(id)a5
{
  sub_23AC895B8(self, (int)a2, a3, a4, a5, (void (*)(id, uint64_t, id, void *))sub_23ACE6B34);
}

- (void)currentPendingSetSyncAnchorWithCompletionHandler:(id)a3
{
  sub_23ACC8AE4(self, (int)a2, a3, (void (*)(void))sub_23ACE7174);
}

- (void)stateWithCompletionHandler:(id)a3
{
  sub_23ACC8AE4(self, (int)a2, a3, (void (*)(void))sub_23ACE7524);
}

- (void)wakeForPushWithCompletionHandler:(id)a3
{
  sub_23ACC8AE4(self, (int)a2, a3, (void (*)(void))sub_23ACE7A74);
}

- (void)didChangeItemID:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  _TtC9libfssync20FPDDomainFPFSBackend *v11;
  id v12;
  _TtC9libfssync20FPDDomainFPFSBackend *v13;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPDDomainFPFSBackend_log);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = self;
  v9[4] = sub_23AAB792C;
  v9[5] = v7;
  v10 = a3;
  v11 = self;
  v12 = v10;
  v13 = v11;
  swift_retain();
  sub_23AA814FC(v8, (uint64_t)"didChange(_:completionHandler:)", 31, 2, (uint64_t)sub_23ACFEA50, (uint64_t)v9);

  swift_release();
  swift_release();
}

- (void)workingSetDidChangeWithCompletionHandler:(id)a3
{
  sub_23ACC8AE4(self, (int)a2, a3, (void (*)(void))sub_23ACE7E28);
}

- (void)fetchFSItemsForItemIdentifiers:(id)a3 materializingIfNeeded:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  _TtC9libfssync20FPDDomainFPFSBackend *v12;

  v9 = _Block_copy(a6);
  type metadata accessor for NSFileProviderItemIdentifier(0);
  v10 = sub_23B1C6704();
  _Block_copy(v9);
  v11 = a5;
  v12 = self;
  sub_23ACE8470(v10, a4, v11, (char *)v12, (void (**)(_QWORD, _QWORD, _QWORD))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)decorateItems:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC9libfssync20FPDDomainFPFSBackend *v7;

  v5 = _Block_copy(a4);
  sub_23AA9F52C(0, &qword_2542E7560);
  v6 = sub_23B1C6704();
  _Block_copy(v5);
  v7 = self;
  sub_23ACE88D0(v6, v7, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (int64_t)nonEvictableSpace
{
  _TtC9libfssync20FPDDomainFPFSBackend *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_23AC914BC();

  return v3;
}

- (int64_t)accumulatedSizeOfPinnedItems
{
  _TtC9libfssync20FPDDomainFPFSBackend *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_23AC91A60();

  return v3;
}

- (id)accumulatedSizeOfItems
{
  _TtC9libfssync20FPDDomainFPFSBackend *v2;
  _QWORD *v3;
  void *v4;

  v2 = self;
  v3 = sub_23AC9212C();

  if (v3)
  {
    sub_23AA9F52C(0, (unint64_t *)&qword_2542E7568);
    v4 = (void *)sub_23B1C61F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)telemetryReportWithCompletionHandler:(id)a3
{
  sub_23ACC8AE4(self, (int)a2, a3, (void (*)(void))sub_23ACE9308);
}

- (id)providerVersion
{
  _TtC9libfssync20FPDDomainFPFSBackend *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_23AC95DB4();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_23B1C63BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)hierarchyForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _TtC9libfssync20FPDDomainFPFSBackend *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  _TtC9libfssync20FPDDomainFPFSBackend *v20;
  _QWORD aBlock[6];

  v8 = sub_23B1C5A08();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_23B1C59CC();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a4;
  v15 = self;
  v16 = (void *)sub_23B1C5954();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = sub_23ACF08F8;
  v17[3] = v13;
  v17[4] = v15;
  v17[5] = v14;
  aBlock[4] = sub_23ACFF4FC;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23AAB5FC8;
  aBlock[3] = &block_descriptor_1341;
  v18 = _Block_copy(aBlock);
  v19 = v14;
  v20 = v15;
  swift_retain();
  swift_release();
  -[FPDDomainFPFSBackend itemForURL:request:completionHandler:](v20, sel_itemForURL_request_completionHandler_, v16, v19, v18);
  _Block_release(v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  _TtC9libfssync20FPDDomainFPFSBackend *v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = self;
  sub_23ACE96C4(v9, a4, (char *)v10, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)importProgressWithCompletionHandler:(id)a3
{
  sub_23ACBC968(self, (int)a2, a3, (uint64_t)&unk_250BEDEB8, (uint64_t)sub_23ACFEA1C, (void (*)(uint64_t, uint64_t))sub_23AC98FE0);
}

- (id)createIndexerWithExtension:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  id v7;
  _TtC9libfssync20FPDDomainFPFSBackend *v8;
  id v9;

  v7 = a3;
  v8 = self;
  v9 = sub_23ACE9A88(a4);

  return v9;
}

- (id)materializedURLForItemID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC9libfssync20FPDDomainFPFSBackend *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542E6740);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  v10 = dispatch_group_create();
  v11 = swift_allocBox();
  v13 = v12;
  v14 = sub_23B1C5A08();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  dispatch_group_enter(v10);
  swift_retain();
  v16 = v10;
  sub_23ACEA044(v8, v9, v11, v16);
  swift_release();

  sub_23B1C6AD0();
  swift_beginAccess();
  sub_23AA8EFC8(v13, (uint64_t)v7, (uint64_t *)&unk_2542E6740);

  swift_release();
  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14) != 1)
  {
    v17 = (void *)sub_23B1C5954();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
  }
  return v17;
}

- (BOOL)isItemDataless:(id)a3
{
  id v4;
  _TtC9libfssync20FPDDomainFPFSBackend *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;

  v4 = a3;
  v5 = self;
  v6 = dispatch_group_create();
  v7 = swift_allocObject();
  *(_BYTE *)(v7 + 16) = 0;
  dispatch_group_enter(v6);
  swift_retain();
  v8 = v6;
  sub_23ACE9C78(v4, v5, v7, v8);
  swift_release();

  sub_23B1C6AD0();
  swift_beginAccess();
  LOBYTE(v8) = *(_BYTE *)(v7 + 16);

  swift_release();
  return (char)v8;
}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 request:(id)a8 completionHandler:(id)aBlock
{
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  _TtC9libfssync20FPDDomainFPFSBackend *v22;
  id v23;
  id v24;
  _TtC9libfssync20FPDDomainFPFSBackend *v25;
  id v26;

  v15 = _Block_copy(aBlock);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v15;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_23ACFEA1C;
  *(_QWORD *)(v17 + 24) = v16;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = sub_23ACFEA1C;
  *(_QWORD *)(v18 + 24) = v16;
  *(_QWORD *)(v18 + 32) = a3;
  *(_BYTE *)(v18 + 40) = a7;
  *(_QWORD *)(v18 + 48) = a8;
  *(_QWORD *)(v18 + 56) = self;
  *(_QWORD *)(v18 + 64) = a4;
  *(_QWORD *)(v18 + 72) = a5;
  v19 = a3;
  v20 = a5;
  v21 = a8;
  v22 = self;
  swift_retain_n();
  v23 = v19;
  v24 = v21;
  v25 = v22;
  v26 = v20;
  sub_23AC625B8((uint64_t)"createItemBased(onTemplate:fields:urlWrapper:options:bounceOnCollision:request:completionHandler:)", 98, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v17, (uint64_t)sub_23ACEA4B4, v18);

  swift_release();
  swift_release();
  swift_release();
}

- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _TtC9libfssync20FPDDomainFPFSBackend *v11;
  id v12;
  _TtC9libfssync20FPDDomainFPFSBackend *v13;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_23ACFEA1C;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = sub_23ACFEA1C;
  v9[3] = v7;
  v9[4] = a3;
  v9[5] = self;
  v10 = a3;
  v11 = self;
  swift_retain_n();
  v12 = v10;
  v13 = v11;
  sub_23AC625B8((uint64_t)"forceIngestion(for:completionHandler:)", 38, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v8, (uint64_t)sub_23ACFEAB4, (uint64_t)v9);

  swift_release();
  swift_release();
  swift_release();
}

- (void)forceFSIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _TtC9libfssync20FPDDomainFPFSBackend *v11;
  id v12;
  _TtC9libfssync20FPDDomainFPFSBackend *v13;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_23ACFEA1C;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = sub_23ACFEA1C;
  v9[3] = v7;
  v9[4] = a3;
  v9[5] = self;
  v10 = a3;
  v11 = self;
  swift_retain_n();
  v12 = v10;
  v13 = v11;
  sub_23AC625B8((uint64_t)"forceFSIngestion(for:completionHandler:)", 40, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v8, (uint64_t)sub_23ACFEAB0, (uint64_t)v9);

  swift_release();
  swift_release();
  swift_release();
}

- (void)forceIngestionAtURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_23B1C5A08();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B1C59CC();
  sub_23ACEA4F0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)pinItemWithID:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  _TtC9libfssync20FPDDomainFPFSBackend *v14;
  id v15;
  id v16;
  _TtC9libfssync20FPDDomainFPFSBackend *v17;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_23ACFEA1C;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = self;
  v11[5] = sub_23ACFEA1C;
  v11[6] = v9;
  v12 = a3;
  v13 = a4;
  v14 = self;
  swift_retain_n();
  v15 = v12;
  v16 = v13;
  v17 = v14;
  sub_23AC625B8((uint64_t)"pinItem(with:request:completionHandler:)", 40, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v10, (uint64_t)sub_23ACEA7AC, (uint64_t)v11);

  swift_release();
  swift_release();
  swift_release();
}

- (void)unpinItemWithID:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  _TtC9libfssync20FPDDomainFPFSBackend *v14;
  id v15;
  id v16;
  _TtC9libfssync20FPDDomainFPFSBackend *v17;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_23ACFEA1C;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = self;
  v11[5] = sub_23ACFEA1C;
  v11[6] = v9;
  v12 = a3;
  v13 = a4;
  v14 = self;
  swift_retain_n();
  v15 = v12;
  v16 = v13;
  v17 = v14;
  sub_23AC625B8((uint64_t)"unpinItem(with:request:completionHandler:)", 42, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v10, (uint64_t)sub_23ACEA7BC, (uint64_t)v11);

  swift_release();
  swift_release();
  swift_release();
}

- (void)detachKnownFolders:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  _TtC9libfssync20FPDDomainFPFSBackend *v10;

  v7 = _Block_copy(a5);
  sub_23AA9F52C(0, &qword_2542E1FF8);
  v8 = sub_23B1C6704();
  _Block_copy(v7);
  v9 = a4;
  v10 = self;
  sub_23ACEC348(v8, v9, (char *)v10, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  _TtC9libfssync20FPDDomainFPFSBackend *v12;

  v9 = _Block_copy(a6);
  sub_23B1C5A08();
  v10 = sub_23B1C6704();
  _Block_copy(v9);
  v11 = a5;
  v12 = self;
  sub_23ACEC760(v10, a4, v11, (char *)v12, (void (**)(_QWORD, _QWORD))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)getKnownFolderLocations:(unint64_t)a3 request:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  _TtC9libfssync20FPDDomainFPFSBackend *v13;
  _TtC9libfssync20FPDDomainFPFSBackend *v14;
  id v15;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_23ACFEA1C;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = self;
  v11[3] = sub_23ACFEA1C;
  v11[4] = v9;
  v11[5] = a3;
  v11[6] = a4;
  v12 = a4;
  v13 = self;
  swift_retain_n();
  v14 = v13;
  v15 = v12;
  sub_23AC63D88((uint64_t)"getKnownFolderLocations(_:request:completionHandler:)", 53, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v10, (uint64_t)sub_23ACEA81C, (uint64_t)v11);

  swift_release();
  swift_release();
  swift_release();
}

- (void)ingestFromCacheItemWithID:(id)a3 requestedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  _TtC9libfssync20FPDDomainFPFSBackend *v13;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  v11 = a3;
  v12 = a5;
  v13 = self;
  sub_23ACECB80(v11, a4, v13, (void (**)(_QWORD, _QWORD))v10);
  _Block_release(v10);
  _Block_release(v10);

}

- (void)bulkItemChanges:(id)a3 changedFields:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  void *v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  _TtC9libfssync20FPDDomainFPFSBackend *v13;

  v9 = _Block_copy(a6);
  sub_23AA9F52C(0, &qword_2542E7560);
  v10 = sub_23B1C6704();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = a5;
  v13 = self;
  sub_23ACB0F10(v10, a4, v12, (uint64_t)sub_23ACF0748, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)trashItemAtURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  sub_23ACB4044(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (void (*)(char *, id, id, void *))sub_23ACECFCC);
}

- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4
{
  sub_23ACB4B40(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, id, void *))sub_23ACED67C);
}

- (void)listRemoteVersionsOfItemAtURL:(id)a3 includeCachedVersions:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void (**v19)(uint64_t, void *, uint64_t);
  unint64_t v20;
  _TtC9libfssync20FPDDomainFPFSBackend *v21;
  _BYTE v22[12];
  _BOOL4 v23;

  v23 = a4;
  v7 = sub_23B1C5A08();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v22[-v12];
  v14 = _Block_copy(a5);
  sub_23B1C59CC();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v11, v13, v7);
  v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v8 + 32))(v18 + v16, v11, v7);
  v19 = (void (**)(uint64_t, void *, uint64_t))(v18 + v17);
  *v19 = sub_23ACF0508;
  v19[1] = (void (*)(uint64_t, void *, uint64_t))v15;
  v20 = v18 + ((v17 + 23) & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)v20 = self;
  *(_BYTE *)(v20 + 8) = v23;
  v21 = self;
  swift_retain();
  sub_23ACE139C((uint64_t)"listRemoteVersionsOfItem(at:includeCachedVersions:completionHandler:)", 69, 2, (uint64_t)sub_23ACEA990, v18, v21, (void (*)(_QWORD, _QWORD, id))sub_23ACF0508, v15);

  swift_release();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)fetchThumbnailsAtURL:(id)a3 versions:(id)a4 size:(CGSize)a5 perThumbnailCompletionHandler:(id)a6 completionHandler:(id)a7
{
  double height;
  double width;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _TtC9libfssync20FPDDomainFPFSBackend *v21;
  uint64_t v22;

  height = a5.height;
  width = a5.width;
  v12 = sub_23B1C5A08();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a6);
  v17 = _Block_copy(a7);
  sub_23B1C59CC();
  sub_23AA9F52C(0, (unint64_t *)&unk_2542E1FD0);
  v18 = sub_23B1C6704();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v16;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v17;
  v21 = self;
  sub_23ACB6928((uint64_t)v15, v18, (uint64_t)sub_23ACF04E4, v19, (void (*)(void))sub_23AC052B4, (void (*)(void))v20, width, height);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)fetchServicesForItemID:(id)a3 allowRestrictedSources:(BOOL)a4 request:(id)a5 completionHandler:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _TtC9libfssync20FPDDomainFPFSBackend *v15;
  id v16;
  id v17;
  _TtC9libfssync20FPDDomainFPFSBackend *v18;
  id v19;
  id v20;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = self;
  *(_QWORD *)(v12 + 24) = sub_23ACF0494;
  *(_QWORD *)(v12 + 32) = v11;
  *(_BYTE *)(v12 + 40) = a4;
  *(_QWORD *)(v12 + 48) = a5;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_23ACEAAF4;
  *(_QWORD *)(v13 + 24) = v12;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = sub_23ACEAAF4;
  v14[4] = v12;
  v14[5] = self;
  v15 = self;
  v16 = a3;
  v17 = a5;
  swift_retain_n();
  v18 = v15;
  v19 = v17;
  v20 = v16;
  swift_retain();
  sub_23AC66320((uint64_t)"resolveProviderItemID(_:completionHandler:)", 43, 2, (void (*)(id *))sub_23AAB5414, v13, (uint64_t)sub_23ACFEAA4, (uint64_t)v14);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)fetchVendorEndpointWithRequest:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _TtC9libfssync20FPDDomainFPFSBackend *v11;
  _TtC9libfssync20FPDDomainFPFSBackend *v12;
  id v13;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_23ACFEA1C;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = self;
  v9[3] = sub_23ACFEA1C;
  v9[4] = v7;
  v9[5] = a3;
  v10 = a3;
  v11 = self;
  swift_retain_n();
  v12 = v11;
  v13 = v10;
  sub_23AC640E0((uint64_t)"fetchVendorEndpoint(with:completionHandler:)", 44, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v8, (uint64_t)sub_23ACFEAA0, (uint64_t)v9);

  swift_release();
  swift_release();
  swift_release();
}

- (void)didChangeNeedsAuthentification:(BOOL)a3
{
  _TtC9libfssync20FPDDomainFPFSBackend *v4;

  v4 = self;
  sub_23ACB81C4(a3);

}

- (void)signalErrorResolved:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _TtC9libfssync20FPDDomainFPFSBackend *v7;
  id v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v8 = a3;
  v7 = self;
  sub_23ACEDD5C(v8, (char *)v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)updateShouldRetryThrottledOperations:(BOOL)a3 completionHandler:(id)a4
{
  void *v6;
  _TtC9libfssync20FPDDomainFPFSBackend *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_23ACEE354(a3, v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)listAvailableTestingOperationsWithRequest:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _TtC9libfssync20FPDDomainFPFSBackend *v11;
  id v12;
  _TtC9libfssync20FPDDomainFPFSBackend *v13;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_23ACF03BC;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = sub_23ACF03BC;
  v9[4] = v7;
  v9[5] = self;
  v10 = a3;
  v11 = self;
  swift_retain_n();
  v12 = v10;
  v13 = v11;
  sub_23AC64438((uint64_t)"listAvailableTestingOperations(with:completionHandler:)", 55, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v8, (uint64_t)sub_23ACFEA9C, (uint64_t)v9);

  swift_release();
  swift_release();
  swift_release();
}

- (void)runTestingOperations:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  _TtC9libfssync20FPDDomainFPFSBackend *v14;

  v7 = _Block_copy(a5);
  sub_23AA9F52C(0, (unint64_t *)&unk_2569E3078);
  v8 = sub_23B1C6704();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_23ACF0364;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v8;
  v11[3] = a4;
  v11[4] = sub_23ACF0364;
  v11[5] = v9;
  v12 = a4;
  swift_retain_n();
  v13 = v12;
  v14 = self;
  swift_bridgeObjectRetain();
  sub_23AC64790((uint64_t)"run(_:request:completionHandler:)", 33, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v10, (uint64_t)sub_23ACFEA98, (uint64_t)v11);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (void)importProgressForItemsPendingReconciliationWithCompletionHandler:(id)a3
{
  sub_23ACBC968(self, (int)a2, a3, (uint64_t)&unk_250BED300, (uint64_t)sub_23ACFEA1C, (void (*)(uint64_t, uint64_t))sub_23ACBC61C);
}

- (void)importProgressForItemsPendingScanningDiskWithCompletionHandler:(id)a3
{
  sub_23ACBC968(self, (int)a2, a3, (uint64_t)&unk_250BED2D8, (uint64_t)sub_23ACFEA1C, (void (*)(uint64_t, uint64_t))sub_23ACBC9E4);
}

- (void)importProgressForItemsPendingScanningProviderWithCompletionHandler:(id)a3
{
  sub_23ACBC968(self, (int)a2, a3, (uint64_t)&unk_250BED2B0, (uint64_t)sub_23ACFEA1C, (void (*)(uint64_t, uint64_t))sub_23ACBCDC4);
}

- (void)subscribeToUploadProgressUpdates:(id)a3 completionHandler:(id)a4
{
  sub_23ACBDD84(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id, void *))sub_23ACEE704);
}

- (void)subscribeToDownloadProgressUpdates:(id)a3 completionHandler:(id)a4
{
  sub_23ACBDD84(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id, void *))sub_23ACEEABC);
}

- (void)getCountersArrayWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC9libfssync20FPDDomainFPFSBackend *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_23ACF02EC;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_23ACF02EC;
  *(_QWORD *)(v7 + 24) = v5;
  swift_retain_n();
  v8 = self;
  sub_23AC64AE8((uint64_t)"getCountersArray(completionHandler:)", 36, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v6, (uint64_t)sub_23ACFF93C, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (void)resetCountersWithCompletionHandler:(id)a3
{
  sub_23ACC8AE4(self, (int)a2, a3, (void (*)(void))sub_23ACEEE74);
}

- (void)hasNonUploadedFilesWithCompletionHandler:(id)a3
{
  sub_23ACC8AE4(self, (int)a2, a3, (void (*)(void))sub_23ACEF21C);
}

- (void)setAlternateContentsURLWrapper:(id)a3 forDocumentWithURL:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _TtC9libfssync20FPDDomainFPFSBackend *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  id v22;
  _TtC9libfssync20FPDDomainFPFSBackend *v23;
  _QWORD aBlock[6];

  v10 = sub_23B1C5A08();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  sub_23B1C59CC();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  v16 = a3;
  v17 = a5;
  v18 = self;
  v19 = (void *)sub_23B1C5954();
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = sub_23ACFEA1C;
  v20[3] = v15;
  v20[4] = v18;
  v20[5] = v16;
  aBlock[4] = sub_23ACFF4F8;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23AAB5FC8;
  aBlock[3] = &block_descriptor_927;
  v21 = _Block_copy(aBlock);
  v22 = v16;
  v23 = v18;
  swift_retain();
  swift_release();
  -[FPDDomainFPFSBackend itemIDForURL:requireProviderItemID:request:completionHandler:](v23, sel_itemIDForURL_requireProviderItemID_request_completionHandler_, v19, 0, v17, v21);
  _Block_release(v21);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)fetchAlternateContentsURLWrapperForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _TtC9libfssync20FPDDomainFPFSBackend *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  _TtC9libfssync20FPDDomainFPFSBackend *v19;
  _QWORD aBlock[6];

  v8 = sub_23B1C5A08();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_23B1C59CC();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a4;
  v15 = self;
  v16 = (void *)sub_23B1C5954();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = sub_23ACFEA1C;
  v17[3] = v13;
  v17[4] = v15;
  aBlock[4] = sub_23ACFF8D4;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23AAB5FC8;
  aBlock[3] = &block_descriptor_916;
  v18 = _Block_copy(aBlock);
  v19 = v15;
  swift_retain();
  swift_release();
  -[FPDDomainFPFSBackend itemIDForURL:requireProviderItemID:request:completionHandler:](v19, sel_itemIDForURL_requireProviderItemID_request_completionHandler_, v16, 0, v14, v18);
  _Block_release(v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)didUpdateAlternateContentsDocumentForDocumentWithURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _TtC9libfssync20FPDDomainFPFSBackend *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  _TtC9libfssync20FPDDomainFPFSBackend *v19;
  _QWORD aBlock[6];

  v8 = sub_23B1C5A08();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_23B1C59CC();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a4;
  v15 = self;
  v16 = (void *)sub_23B1C5954();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = sub_23AC052B4;
  v17[3] = v13;
  v17[4] = v15;
  aBlock[4] = sub_23ACFF8D0;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23AAB5FC8;
  aBlock[3] = &block_descriptor_906;
  v18 = _Block_copy(aBlock);
  v19 = v15;
  swift_retain();
  swift_release();
  -[FPDDomainFPFSBackend itemIDForURL:requireProviderItemID:request:completionHandler:](v19, sel_itemIDForURL_requireProviderItemID_request_completionHandler_, v16, 0, v14, v18);
  _Block_release(v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)getDiagnosticAttributesForItems:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _TtC9libfssync20FPDDomainFPFSBackend *v10;
  _TtC9libfssync20FPDDomainFPFSBackend *v11;

  v5 = _Block_copy(a4);
  sub_23AA9F52C(0, &qword_2569E3070);
  v6 = sub_23B1C6704();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_23ACF0280;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v6;
  v9[3] = self;
  v9[4] = sub_23ACF0280;
  v9[5] = v7;
  v10 = self;
  swift_retain_n();
  v11 = v10;
  swift_bridgeObjectRetain();
  sub_23AC65198((uint64_t)"getDiagnosticAttributes(forItems:completionHandler:)", 52, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v8, (uint64_t)sub_23ACFEA90, (uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (void)pauseSyncForItemAtURL:(id)a3 bundleID:(id)a4 behavior:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, char *, uint64_t);
  void *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  _TtC9libfssync20FPDDomainFPFSBackend *v35;
  unint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  id v39;
  _TtC9libfssync20FPDDomainFPFSBackend *v40;
  id v41;
  _TtC9libfssync20FPDDomainFPFSBackend *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  _TtC9libfssync20FPDDomainFPFSBackend *v54;
  uint64_t v55;

  v51 = a6;
  v44 = a5;
  v54 = self;
  v9 = sub_23B1C5A08();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = v9;
  v12 = *(_QWORD *)(v10 + 64);
  v13 = MEMORY[0x24BDAC7A8](v9);
  v47 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v44 - v14;
  v16 = _Block_copy(a7);
  sub_23B1C59CC();
  v17 = sub_23B1C63E0();
  v52 = v18;
  v53 = v17;
  v46 = swift_allocObject();
  *(_QWORD *)(v46 + 16) = v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569E2FD8);
  v20 = swift_allocBox();
  v48 = v20;
  v49 = v15;
  v22 = v21;
  v23 = *(int *)(v19 + 48);
  v24 = *(int *)(v19 + 64);
  v25 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 16);
  v55 = v11;
  v25(v21, v15, v11);
  *(_QWORD *)(v22 + v23) = a5;
  v26 = v51;
  *(_QWORD *)(v22 + v24) = v51;
  v45 = v20 | 0x9000000000000004;
  v27 = v47;
  v25((uint64_t)v47, v15, v11);
  v28 = *(unsigned __int8 *)(v10 + 80);
  v50 = v10;
  v29 = (v28 + 40) & ~v28;
  v30 = (v12 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF8;
  v32 = (char *)swift_allocObject();
  v33 = v46;
  *((_QWORD *)v32 + 2) = sub_23ACFEA1C;
  *((_QWORD *)v32 + 3) = v33;
  v35 = v54;
  v34 = v55;
  *((_QWORD *)v32 + 4) = v54;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v32[v29], v27, v34);
  v36 = v45;
  *(_QWORD *)&v32[v30] = v44;
  v37 = (uint64_t *)&v32[v31];
  v38 = v52;
  *v37 = v53;
  v37[1] = v38;
  *(_QWORD *)&v32[(v31 + 23) & 0xFFFFFFFFFFFFFFF8] = v36;
  v39 = v26;
  v40 = v35;
  v41 = v39;
  v42 = v40;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v43 = (uint64_t)v49;
  sub_23AC739D8((uint64_t)v49, 1, v36, sub_23ACEACCC, (uint64_t)v32);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v43, v55);
}

- (void)resumeSyncForItemAtURL:(id)a3 bundleID:(id)a4 behavior:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, char *, uint64_t);
  uint64_t v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  _TtC9libfssync20FPDDomainFPFSBackend *v33;
  unint64_t v34;
  id v35;
  _TtC9libfssync20FPDDomainFPFSBackend *v36;
  id v37;
  _TtC9libfssync20FPDDomainFPFSBackend *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _TtC9libfssync20FPDDomainFPFSBackend *v45;
  char *v46;

  v44 = a6;
  v45 = self;
  v39 = a5;
  v41 = sub_23B1C5A08();
  v9 = *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64);
  v10 = *(_QWORD *)(v41 - 8);
  v11 = MEMORY[0x24BDAC7A8](v41);
  v46 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v39 - v12;
  v14 = _Block_copy(a7);
  sub_23B1C59CC();
  v40 = swift_allocObject();
  *(_QWORD *)(v40 + 16) = v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569E2FE0);
  v16 = swift_allocBox();
  v42 = v16;
  v18 = v17;
  v19 = *(int *)(v15 + 48);
  v20 = *(int *)(v15 + 64);
  v21 = v10;
  v22 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 16);
  v23 = v41;
  v22(v17, v13, v41);
  *(_QWORD *)(v18 + v19) = a5;
  v24 = v44;
  *(_QWORD *)(v18 + v20) = v44;
  v25 = v16 | 0x9000000000000006;
  v26 = v23;
  v22((uint64_t)v46, v13, v23);
  v27 = v21;
  v43 = v21;
  v28 = (*(unsigned __int8 *)(v21 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v29 = (v9 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v30 = (char *)swift_allocObject();
  v31 = v40;
  *((_QWORD *)v30 + 2) = sub_23ACFEA1C;
  *((_QWORD *)v30 + 3) = v31;
  v33 = v45;
  v32 = v46;
  v34 = v39;
  *((_QWORD *)v30 + 4) = v45;
  *((_QWORD *)v30 + 5) = v34;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(&v30[v28], v32, v26);
  *(_QWORD *)&v30[v29] = v25;
  v35 = v24;
  v36 = v33;
  v37 = v35;
  v38 = v36;
  swift_retain();
  swift_retain();
  sub_23AC739D8((uint64_t)v13, 1, v25, sub_23ACEACD4, (uint64_t)v30);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v13, v26);
}

- (void)fetchLatestVersionForURL:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, char *, uint64_t);
  void *v20;
  char *v21;
  unint64_t v22;
  char *v23;
  _TtC9libfssync20FPDDomainFPFSBackend *v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  id v28;
  _TtC9libfssync20FPDDomainFPFSBackend *v29;
  id v30;
  _TtC9libfssync20FPDDomainFPFSBackend *v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  _TtC9libfssync20FPDDomainFPFSBackend *v37;

  v35 = a4;
  v37 = self;
  v6 = sub_23B1C5A08();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v33 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v32 - v10;
  v12 = _Block_copy(a5);
  sub_23B1C59CC();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569E2FE8);
  v15 = swift_allocBox();
  v36 = v15;
  v17 = v16;
  v18 = *(int *)(v14 + 48);
  v19 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 16);
  v19(v16, v11, v6);
  v20 = v35;
  *(_QWORD *)(v17 + v18) = v35;
  v34 = v15 | 0xA000000000000000;
  v21 = v33;
  v19((uint64_t)v33, v11, v6);
  v22 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v23 = (char *)swift_allocObject();
  *((_QWORD *)v23 + 2) = sub_23ACF00A0;
  *((_QWORD *)v23 + 3) = v13;
  v24 = v37;
  *((_QWORD *)v23 + 4) = v37;
  v25 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v26 = v7;
  v27 = v6;
  v25(&v23[v22], v21, v6);
  v28 = v20;
  v29 = v24;
  v30 = v28;
  v31 = v29;
  swift_retain();
  sub_23AC739D8((uint64_t)v11, 0, v34, sub_23ACEACDC, (uint64_t)v23);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v27);
}

- (void)disableDBQueryStatisticsWithCompletionHandler:(id)a3
{
  sub_23ACC8AE4(self, (int)a2, a3, (void (*)(void))sub_23ACEF948);
}

- (void)resetDBQueryStatisticsWithCompletionHandler:(id)a3
{
  sub_23ACC8AE4(self, (int)a2, a3, (void (*)(void))sub_23ACEFCF0);
}

- (void)getDBQueryStatisticsWithQueryPlan:(BOOL)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC9libfssync20FPDDomainFPFSBackend *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_23ACEBFB4;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_23ACEBFB4;
  *(_QWORD *)(v9 + 24) = v7;
  *(_BYTE *)(v9 + 32) = a3;
  swift_retain_n();
  v10 = self;
  sub_23AC654F0((uint64_t)"getDBQueryStatistics(withQueryPlan:completionHandler:)", 54, 2, (void (*)(_QWORD *, id))sub_23AAB64DC, v8, (uint64_t)sub_23ACFEA5C, v9);

  swift_release();
  swift_release();
  swift_release();
}

+ (id)registerXPCActivities
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_23B1C5E4C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (id)fpfs_current_or_default_log();
  sub_23B1C5E58();
  v5 = sub_23B1C5E40();
  v6 = sub_23B1C6A88();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23AA66000, v5, v6, "registering xpc activities", v7, 2u);
    MEMORY[0x23B8614BC](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_2542E4C20 != -1)
    swift_once();
  objc_msgSend((id)qword_2542EDD60, sel_ping);
  if (qword_2542E4FC0 != -1)
    swift_once();
  objc_msgSend((id)qword_2542EDE10, sel_ping);
  if (qword_2542DE1A8 != -1)
    swift_once();
  objc_msgSend((id)qword_2542EDC40, sel_ping);
  if (qword_2542E6EE0 != -1)
    swift_once();
  objc_msgSend((id)qword_2542EDE00, sel_ping);
  if (qword_2542E7160 != -1)
    swift_once();
  objc_msgSend((id)qword_2542EDE30, sel_ping);
  if (qword_2542E5068 != -1)
    swift_once();
  objc_msgSend((id)qword_2542EDE20, sel_ping);
  if (qword_2542E12D0 != -1)
    swift_once();
  objc_msgSend((id)qword_2542EDC38, sel_ping);
  if (qword_2542E6C40 != -1)
    swift_once();
  objc_msgSend((id)qword_2542EDD50, sel_ping);
  if (qword_2542E6EC8 != -1)
    swift_once();
  objc_msgSend((id)qword_2542EDD70, sel_ping);
  if (qword_2569E12A8 != -1)
    swift_once();
  return objc_msgSend((id)qword_256A079A0, sel_ping);
}

@end
