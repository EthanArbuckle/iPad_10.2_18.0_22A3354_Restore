@implementation EmbeddedDataSourceCollectionViewCell

- (_TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_eventHandlerSink) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_collectionViewController) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_item;
  v9 = (objc_class *)type metadata accessor for EmbeddedDataSourceCollectionViewCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[EmbeddedDataSourceCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell *result;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_eventHandlerSink) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_collectionViewController) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = a3;

  result = (_TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  id v2;
  uint64_t v3;
  _BYTE v4[40];
  _OWORD v5[2];
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EmbeddedDataSourceCollectionViewCell();
  v2 = v7.receiver;
  -[EmbeddedDataSourceCollectionViewCell prepareForReuse](&v7, sel_prepareForReuse);
  v6 = 0;
  memset(v5, 0, sizeof(v5));
  v3 = (uint64_t)v2 + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_item;
  swift_beginAccess();
  sub_1A961E0C4(v3, (uint64_t)v4);
  swift_beginAccess();
  sub_1A961E1A4((uint64_t)v5, v3);
  swift_endAccess();
  sub_1A9A4D994((uint64_t)v4);
  sub_1A9618418((uint64_t)v5);
  sub_1A9618418((uint64_t)v4);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1A9A4E278((uint64_t)v4);

  return v6;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_collectionViewController));
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_item);
}

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  sub_1A96185BC();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A94174();
  -[EmbeddedDataSourceCollectionViewCell invalidateIntrinsicContentSize](self, sel_invalidateIntrinsicContentSize);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
