@implementation CNPosterPreviewViewConfiguration

- (BOOL)hasExistingPoster
{
  return *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterConfiguration)
      || *(_QWORD *)&self->posterArchiveData[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData] >> 60 != 15;
}

+ (id)configurationForNewPosterWithPhotoAssetID:(id)a3 backgroundColor:(id)a4 displayName:(id)a5 isEditingSNaP:(BOOL)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;

  if (a3)
  {
    v8 = sub_18AF4FC5C();
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = sub_18AF4FC5C();
  v13 = v12;
  v14 = a4;
  v15 = sub_18AD6167C(v8, v10, a4, v11, v13, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

+ (id)configurationForNewPosterWithPhotoAssetID:(id)a3 backgroundColor:(id)a4 displayName:(id)a5 isEditingSNaP:(BOOL)a6 monogramText:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  if (a3)
  {
    v10 = sub_18AF4FC5C();
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v13 = sub_18AF4FC5C();
  v15 = v14;
  if (a7)
  {
    v16 = sub_18AF4FC5C();
    a7 = v17;
  }
  else
  {
    v16 = 0;
  }
  v18 = a4;
  v19 = sub_18AD6176C(v10, v12, a4, v13, v15, a6, v16, (uint64_t)a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v19;
}

+ (id)configurationForExistingPosterConfiguration:(id)a3 displayName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v4 = sub_18AF4FC5C();
  v6 = v5;
  v7 = objc_allocWithZone((Class)type metadata accessor for CNPosterPreviewViewConfiguration());
  v8 = swift_unknownObjectRetain();
  v9 = sub_18AD614F8(v8, 0, 0xF000000000000000, v4, v6, 0, 0, 0, 0, 0, 0);
  swift_unknownObjectRelease();
  return v9;
}

+ (id)configurationForPosterArchiveData:(id)a3 displayName:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = sub_18AF4E48C();
  v9 = v8;

  v10 = sub_18AF4FC5C();
  v12 = v11;

  v13 = sub_18AD61894(v7, v9, v10, v12);
  swift_bridgeObjectRelease();
  sub_18ACB9CDC(v7, v9);
  return v13;
}

- (_TtC10ContactsUI32CNPosterPreviewViewConfiguration)init
{
  _TtC10ContactsUI32CNPosterPreviewViewConfiguration *result;

  result = (_TtC10ContactsUI32CNPosterPreviewViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18ACB9CC8(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData), *(_QWORD *)&self->posterArchiveData[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterConfiguration));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_backgroundColor));
  swift_bridgeObjectRelease();
}

@end
