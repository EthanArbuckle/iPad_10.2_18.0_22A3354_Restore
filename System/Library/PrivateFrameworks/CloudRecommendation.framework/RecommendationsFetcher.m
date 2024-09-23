@implementation RecommendationsFetcher

+ (_TtC19CloudRecommendation22RecommendationsFetcher)shared
{
  if (qword_2568DA2D0 != -1)
    swift_once();
  return (_TtC19CloudRecommendation22RecommendationsFetcher *)(id)qword_2568DA738;
}

- (void)refreshCacheFor:(id)a3
{
  _TtC19CloudRecommendation22RecommendationsFetcher *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_2380F338C(v5, 0, 0);

}

- (void)refreshCacheFor:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC19CloudRecommendation22RecommendationsFetcher *v8;
  id v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_2380FC8E0;
  }
  else
  {
    v7 = 0;
  }
  v9 = a3;
  v8 = self;
  sub_2380F338C(v9, (uint64_t)v6, v7);
  sub_2380F22EC((uint64_t)v6);

}

- (void)fetchServerRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  char *v10;
  uint64_t (*v11)();
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC19CloudRecommendation22RecommendationsFetcher *v16;
  id v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA740);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t (*)())_Block_copy(a5);
  if (v11)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v11;
    v11 = sub_2380FCE4C;
  }
  else
  {
    v12 = 0;
  }
  v13 = sub_238102D50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = 0;
  *(_QWORD *)(v14 + 32) = self;
  *(_QWORD *)(v14 + 40) = a3;
  *(_BYTE *)(v14 + 48) = a4;
  *(_QWORD *)(v14 + 56) = v11;
  *(_QWORD *)(v14 + 64) = v12;
  v15 = a3;
  v16 = self;
  v17 = v15;
  sub_2380F2550((uint64_t)v11);
  sub_2380F4460((uint64_t)v10, (uint64_t)&unk_2568DACA0, v14);
  swift_release();
  sub_2380F22EC((uint64_t)v11);

}

- (void)fetchServerRecommendationsAsyncFor:(ACAccount *)a3 shouldIgnoreCache:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  ACAccount *v16;
  _TtC19CloudRecommendation22RecommendationsFetcher *v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA740);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_BYTE *)(v12 + 24) = a4;
  *(_QWORD *)(v12 + 32) = v11;
  *(_QWORD *)(v12 + 40) = self;
  v13 = sub_238102D50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2568DAC88;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2568DAC90;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_2380F9F48((uint64_t)v10, (uint64_t)&unk_2568DAC98, (uint64_t)v15);
  swift_release();
}

- (void)fetchRulesetsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC19CloudRecommendation22RecommendationsFetcher *v16;
  id v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA740);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  if (v11)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v11;
    v11 = sub_2380FC798;
  }
  else
  {
    v12 = 0;
  }
  v13 = sub_238102D50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = 0;
  *(_QWORD *)(v14 + 32) = self;
  *(_QWORD *)(v14 + 40) = a3;
  *(_BYTE *)(v14 + 48) = a4;
  *(_QWORD *)(v14 + 56) = v11;
  *(_QWORD *)(v14 + 64) = v12;
  v15 = a3;
  v16 = self;
  v17 = v15;
  sub_2380F2550((uint64_t)v11);
  sub_2380F4460((uint64_t)v10, (uint64_t)&unk_2568DAC78, v14);
  swift_release();
  sub_2380F22EC((uint64_t)v11);

}

- (void)fetchRulesetsAsyncFor:(ACAccount *)a3 shouldIgnoreCache:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  ACAccount *v16;
  _TtC19CloudRecommendation22RecommendationsFetcher *v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA740);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_BYTE *)(v12 + 24) = a4;
  *(_QWORD *)(v12 + 32) = v11;
  *(_QWORD *)(v12 + 40) = self;
  v13 = sub_238102D50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2568DAC60;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2568DAC68;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_2380F9F48((uint64_t)v10, (uint64_t)&unk_2568DAC70, (uint64_t)v15);
  swift_release();
}

- (void)fetchCompletedRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  char *v10;
  uint64_t (*v11)();
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC19CloudRecommendation22RecommendationsFetcher *v16;
  id v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA740);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t (*)())_Block_copy(a5);
  if (v11)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v11;
    v11 = sub_2380FCE4C;
  }
  else
  {
    v12 = 0;
  }
  v13 = sub_238102D50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = 0;
  *(_QWORD *)(v14 + 32) = self;
  *(_QWORD *)(v14 + 40) = a3;
  *(_BYTE *)(v14 + 48) = a4;
  *(_QWORD *)(v14 + 56) = v11;
  *(_QWORD *)(v14 + 64) = v12;
  v15 = a3;
  v16 = self;
  v17 = v15;
  sub_2380F2550((uint64_t)v11);
  sub_2380F4460((uint64_t)v10, (uint64_t)&unk_2568DAC50, v14);
  swift_release();
  sub_2380F22EC((uint64_t)v11);

}

- (void)fetchClientRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC19CloudRecommendation22RecommendationsFetcher *v16;
  id v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA740);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  if (v11)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v11;
    v11 = sub_2380FC6DC;
  }
  else
  {
    v12 = 0;
  }
  v13 = sub_238102D50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = 0;
  *(_QWORD *)(v14 + 32) = self;
  *(_QWORD *)(v14 + 40) = a3;
  *(_BYTE *)(v14 + 48) = a4;
  *(_QWORD *)(v14 + 56) = v11;
  *(_QWORD *)(v14 + 64) = v12;
  v15 = a3;
  v16 = self;
  v17 = v15;
  sub_2380F2550((uint64_t)v11);
  sub_2380F4460((uint64_t)v10, (uint64_t)&unk_2568DAC48, v14);
  swift_release();
  sub_2380F22EC((uint64_t)v11);

}

- (void)fetchClientRecommendationsAsyncFor:(ACAccount *)a3 shouldIgnoreCache:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  ACAccount *v16;
  _TtC19CloudRecommendation22RecommendationsFetcher *v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568DA740);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_BYTE *)(v12 + 24) = a4;
  *(_QWORD *)(v12 + 32) = v11;
  *(_QWORD *)(v12 + 40) = self;
  v13 = sub_238102D50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2568DAC10;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2568DAC20;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_2380F9F48((uint64_t)v10, (uint64_t)&unk_2568DAC30, (uint64_t)v15);
  swift_release();
}

- (_TtC19CloudRecommendation22RecommendationsFetcher)init
{
  uint64_t v3;
  objc_class *v4;
  _TtC19CloudRecommendation22RecommendationsFetcher *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers;
  type metadata accessor for DataFetchers();
  v4 = (objc_class *)swift_allocObject();
  v5 = self;
  swift_defaultActor_initialize();
  *((_QWORD *)v4 + 14) = sub_2380F2874(MEMORY[0x24BEE4AF8]);
  *(Class *)((char *)&self->super.isa + v3) = v4;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for RecommendationsFetcher();
  return -[RecommendationsFetcher init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
