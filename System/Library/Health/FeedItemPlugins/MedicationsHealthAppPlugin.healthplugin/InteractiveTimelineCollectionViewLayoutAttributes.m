@implementation InteractiveTimelineCollectionViewLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  _TtC26MedicationsHealthAppPlugin49InteractiveTimelineCollectionViewLayoutAttributes *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  sub_2318C59A8((uint64_t)a3, v7);

  sub_2317D4B08(v7, v7[3]);
  v5 = (void *)sub_2318D62AC();
  sub_2317D4B2C((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC26MedicationsHealthAppPlugin49InteractiveTimelineCollectionViewLayoutAttributes *v4;
  _TtC26MedicationsHealthAppPlugin49InteractiveTimelineCollectionViewLayoutAttributes *v5;
  unsigned __int8 v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2318D5FE8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_2318C5AF0((uint64_t)v8);

  sub_2317E6194((uint64_t)v8);
  return v6 & 1;
}

- (_TtC26MedicationsHealthAppPlugin49InteractiveTimelineCollectionViewLayoutAttributes)init
{
  char *v3;
  uint64_t v4;
  id v5;
  _TtC26MedicationsHealthAppPlugin49InteractiveTimelineCollectionViewLayoutAttributes *v6;
  id v7;
  objc_super v9;

  v3 = (char *)self
     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin49InteractiveTimelineCollectionViewLayoutAttributes_configuration;
  v4 = *MEMORY[0x24BEBE1E0];
  v5 = objc_allocWithZone(MEMORY[0x24BEBD5F0]);
  v6 = self;
  v7 = objc_msgSend(v5, sel_initForTextStyle_, v4);
  *(_OWORD *)v3 = xmmword_2318D8DC0;
  *((_OWORD *)v3 + 1) = xmmword_2318D8DB0;
  *((int64x2_t *)v3 + 2) = vdupq_n_s64(0x4041000000000000uLL);
  *((_QWORD *)v3 + 6) = 0;
  *((_QWORD *)v3 + 7) = v7;
  *((_OWORD *)v3 + 4) = xmmword_2318D8DA0;
  *((_QWORD *)v3 + 10) = 0;
  *((_QWORD *)v3 + 11) = 27;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for InteractiveTimelineCollectionViewLayoutAttributes();
  return -[UICollectionViewLayoutAttributes init](&v9, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._size.height
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin49InteractiveTimelineCollectionViewLayoutAttributes_configuration));
}

@end
