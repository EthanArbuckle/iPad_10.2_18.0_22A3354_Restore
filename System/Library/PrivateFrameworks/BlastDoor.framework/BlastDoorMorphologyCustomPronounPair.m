@implementation BlastDoorMorphologyCustomPronounPair

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)language
{
  return *((unsigned __int8 *)&self->super.isa
         + OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair);
}

- (BlastDoorMorphologyCustomPronoun)pronoun
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  char *v13;
  uint64_t v15;
  objc_super v16;

  v3 = *(_QWORD *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair];
  v2 = *(_QWORD *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 8];
  v5 = *(_QWORD *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 16];
  v4 = *(_QWORD *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 24];
  v7 = *(_QWORD *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 32];
  v6 = *(_QWORD *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 40];
  v9 = *(_QWORD *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 48];
  v8 = *(_QWORD *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                   + 56];
  v10 = *(_QWORD *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                    + 72];
  v15 = *(_QWORD *)&self->morphologyCustomPronounPair[OBJC_IVAR___BlastDoorMorphologyCustomPronounPair_morphologyCustomPronounPair
                                                    + 64];
  v11 = (objc_class *)type metadata accessor for _ObjCMorphologyCustomPronounWrapper();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = &v12[OBJC_IVAR___BlastDoorMorphologyCustomPronoun_morphologyCustomPronoun];
  *(_QWORD *)v13 = v3;
  *((_QWORD *)v13 + 1) = v2;
  *((_QWORD *)v13 + 2) = v5;
  *((_QWORD *)v13 + 3) = v4;
  *((_QWORD *)v13 + 4) = v7;
  *((_QWORD *)v13 + 5) = v6;
  *((_QWORD *)v13 + 6) = v9;
  *((_QWORD *)v13 + 7) = v8;
  *((_QWORD *)v13 + 8) = v15;
  *((_QWORD *)v13 + 9) = v10;
  v16.receiver = v12;
  v16.super_class = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return (BlastDoorMorphologyCustomPronoun *)-[BlastDoorMorphologyCustomPronounPair init](&v16, sel_init);
}

- (BlastDoorMorphologyCustomPronounPair)init
{
  BlastDoorMorphologyCustomPronounPair *result;

  result = (BlastDoorMorphologyCustomPronounPair *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
