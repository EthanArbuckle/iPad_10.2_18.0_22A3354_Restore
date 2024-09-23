@implementation DOCTagCollectionObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver *v14;
  uint64_t v15;
  id v16;
  _TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver *v17;
  _OWORD v18[2];

  if (a3)
  {
    v10 = sub_21EB02B88();
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v18, 0, sizeof(v18));
    v16 = a5;
    v17 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_21EB031B8();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_21EA59DC8((unint64_t *)&unk_25546BC20, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_21EB08790);
  v15 = sub_21EB02AD4();

LABEL_8:
  sub_21EAD72A8(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21EA5B5B0((uint64_t)v18);
}

- (void)collection:(id)a3 didMoveItemsFromIndexPaths:(id)a4 toIndexPaths:(id)a5
{
  id v6;
  _TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver *v7;

  v6 = a3;
  v7 = self;
  sub_21EAD833C();

}

- (void)collection:(id)a3 didDeleteItemsAtIndexPaths:(id)a4
{
  id v5;
  _TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver *v6;

  v5 = a3;
  v6 = self;
  sub_21EAD833C();

}

- (void)collection:(id)a3 didUpdateItemsAtIndexPaths:(id)a4 changes:(id)a5
{
  id v7;
  _TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver *v8;

  if (a5)
  {
    sub_21EA579D4(0, (unint64_t *)&qword_2540A6EC0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25546ACB0);
    sub_21EAD85E4((unint64_t *)&unk_25546BC10, (unint64_t *)&qword_2540A6EC0, 0x24BDC82D8, MEMORY[0x24BEE5BD8]);
    sub_21EB02AD4();
  }
  v7 = a3;
  v8 = self;
  sub_21EAD833C();

  swift_bridgeObjectRelease();
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4;
  _TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver *v5;

  v4 = a3;
  v5 = self;
  sub_21EAD833C();

}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  void *v6;
  id v7;
  _TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver *v8;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;

  sub_21EAD833C();
  _Block_release(v6);

}

- (_TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver)init
{
  return (_TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver *)sub_21EAD79E8();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver_serialQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver_group));
  v3 = (char *)self
     + OBJC_IVAR____TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver_spotlightQueryTimeout;
  v4 = sub_21EB029FC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver_collection));
}

@end
