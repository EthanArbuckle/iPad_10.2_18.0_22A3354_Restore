@implementation LPVisionAnalyzer

- (void)dealloc
{
  void *v2;
  _TtC16LinkPresentation16LPVisionAnalyzer *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16LinkPresentation16LPVisionAnalyzer_session);
  v3 = self;
  objc_msgSend(v2, sel_releaseCachedResources);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LPVisionAnalyzer();
  -[LPVisionAnalyzer dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{

}

- (id)computeSimilarityOf:(id)a3 with:(id)a4 error:(id *)a5
{
  unint64_t *v7;
  char *v8;
  _TtC16LinkPresentation16LPVisionAnalyzer *v9;
  void *v10;

  v7 = (unint64_t *)a3;
  v8 = (char *)a4;
  v9 = self;
  v10 = (void *)sub_1A0D1AE54(v7, v8);

  return v10;
}

- (_TtC16LinkPresentation16LPVisionAnalyzer)init
{
  uint64_t v3;
  id v4;
  _TtC16LinkPresentation16LPVisionAnalyzer *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC16LinkPresentation16LPVisionAnalyzer_session;
  v4 = objc_allocWithZone(MEMORY[0x1E0CEE040]);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for LPVisionAnalyzer();
  return -[LPVisionAnalyzer init](&v7, sel_init);
}

@end
