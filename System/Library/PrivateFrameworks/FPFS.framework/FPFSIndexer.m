@implementation FPFSIndexer

- (BOOL)learnNeedsAuthenticationFromBatchError
{
  return 0;
}

- (void)signalNeedsReindexFromScratchWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  _QWORD *v6;
  _TtC9libfssync11FPFSIndexer *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_23B0BF090((id)a3, (char *)v7, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)indexOneBatchWithCompletionHandler:(id)a3
{
  void *v4;
  _TtC9libfssync11FPFSIndexer *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_23B0C068C((char *)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)dumpStateTo:(id)a3
{
  id v4;
  char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FPFSIndexer();
  v4 = a3;
  v5 = (char *)v6.receiver;
  -[FPDDomainIndexer dumpStateTo:](&v6, sel_dumpStateTo_, v4);
  objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC9libfssync11FPFSIndexer_spotlightIndexer], sel_dumpStateTo_, v4, v6.receiver, v6.super_class);

}

- (_TtC9libfssync11FPFSIndexer)initWithExtension:(id)a3 domain:(id)a4 enabled:(BOOL)a5
{
  id v6;
  id v7;
  _TtC9libfssync11FPFSIndexer *result;

  v6 = a3;
  v7 = a4;
  result = (_TtC9libfssync11FPFSIndexer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9libfssync11FPFSIndexer)init
{
  _TtC9libfssync11FPFSIndexer *result;

  result = (_TtC9libfssync11FPFSIndexer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_23AA8A05C((uint64_t)self + OBJC_IVAR____TtC9libfssync11FPFSIndexer_lastIndexedAnchor, &qword_2542E13E8);

}

- (void)didDropIndexWithDropReason:(unint64_t)a3
{
  _TtC9libfssync11FPFSIndexer *v4;
  FPDDomainIndexerState *v5;

  v4 = self;
  v5 = -[FPDDomainIndexer state](v4, sel_state);
  -[FPDDomainIndexerState recordIndexDropReason:](v5, sel_recordIndexDropReason_, a3);

}

@end
