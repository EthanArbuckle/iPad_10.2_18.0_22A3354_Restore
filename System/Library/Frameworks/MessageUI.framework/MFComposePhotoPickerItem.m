@implementation MFComposePhotoPickerItem

- (NSString)assetIdentifier
{
  MFComposePhotoPickerItem *v2;
  id v5;

  v2 = self;
  PhotoPickerItem.assetIdentifier.getter();

  v5 = (id)sub_1ABA6533C();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSURL)assetURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MFComposePhotoPickerItem *v7;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  MFComposePhotoPickerItem *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = self;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE00);
  v12 = (*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v3, v4, v5, v6);
  v14 = (char *)&v9 - v12;
  v7 = self;
  PhotoPickerItem.assetURL.getter(v14);

  v15 = sub_1ABA650B4();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v16 + 48))(v14, 1) == 1)
  {
    v11 = 0;
  }
  else
  {
    v10 = (void *)sub_1ABA6509C();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v15);
    v11 = v10;
  }
  return (NSURL *)v11;
}

- (NSData)assetData
{
  MFComposePhotoPickerItem *v2;
  unint64_t v3;
  uint64_t v5;
  id v6;
  uint64_t v8;
  unint64_t v9;

  v2 = self;
  v8 = PhotoPickerItem.assetData.getter();
  v9 = v3;

  if ((v9 & 0xF000000000000000) == 0xF000000000000000)
  {
    v6 = 0;
  }
  else
  {
    v5 = sub_1ABA650C0();
    sub_1ABA5D864(v8, v9);
    v6 = (id)v5;
  }
  return (NSData *)v6;
}

- (UTType)contentType
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  MFComposePhotoPickerItem *v6;
  unint64_t v8;
  MFComposePhotoPickerItem *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v9 = self;
  v11 = sub_1ABA65168();
  v10 = *(_QWORD *)(v11 - 8);
  v8 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v11, v3, v4, v5);
  v12 = (uint64_t)&v8 - v8;
  v6 = self;
  PhotoPickerItem.contentType.getter(v12);

  v13 = (id)sub_1ABA6512C();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v12, v11);
  return (UTType *)v13;
}

- (NSString)contentIdentifier
{
  MFComposePhotoPickerItem *v2;
  id v5;

  v2 = self;
  PhotoPickerItem.contentIdentifier.getter();

  v5 = (id)sub_1ABA6533C();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (BOOL)isVideo
{
  MFComposePhotoPickerItem *v2;

  v2 = self;
  sub_1ABA5DBC4();

  return sub_1ABA650D8() & 1;
}

+ (NSString)contentIdentifierPrefix
{
  id v3;

  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static PhotoPickerItem.contentIdentifierPrefix.getter();
  v3 = (id)sub_1ABA6533C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (MFComposePhotoPickerItem)initWithAssetIdentifier:(id)a3 assetURL:(id)a4 assetData:(id)a5 contentType:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  MFComposePhotoPickerItem *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  id v33;
  id v34;
  MFComposePhotoPickerItem *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  unint64_t v43;
  char *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;

  v35 = self;
  v47 = a3;
  v46 = a6;
  v48 = a4;
  v45 = a5;
  v36 = 0;
  v37 = (*(_QWORD *)(*(_QWORD *)(sub_1ABA65168() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0, v6, v7, v8);
  v38 = (uint64_t)&v23 - v37;
  v39 = sub_1ABA650B4();
  v40 = *(_QWORD *)(v39 - 8);
  v41 = (*(_QWORD *)(v40 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v39, v9, v10, v11);
  v42 = (char *)&v23 - v41;
  v43 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE00) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v15 = (void *)MEMORY[0x1E0C80A78](v47, v12, v13, v14);
  v44 = (char *)&v23 - v43;
  v16 = v15;
  v17 = v48;
  v18 = v45;
  v19 = v46;
  v49 = sub_1ABA65348();
  v50 = v20;
  if (v48)
  {
    v34 = v48;
    v33 = v48;
    sub_1ABA650A8();
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v44, v42, v39);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v44, 0, 1, v39);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56))(v44, 1, 1, v39);
  }
  if (v45)
  {
    v32 = v45;
    v27 = v45;
    v28 = sub_1ABA650CC();
    v29 = v21;

    v30 = v28;
    v31 = v29;
  }
  else
  {
    v30 = 0;
    v31 = 0xF000000000000000;
  }
  v25 = v31;
  v24 = v30;
  sub_1ABA65138();
  v26 = (MFComposePhotoPickerItem *)PhotoPickerItem.init(assetIdentifier:assetURL:assetData:contentType:)(v49, v50, v44, v24, v25, v38);

  return v26;
}

+ (id)bestTypeToLoadFrom:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v12 = a1;
  v14 = a3;
  swift_getObjCClassMetadata();
  v11 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEC3DE08) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v15 = (uint64_t)&v8 - v11;
  v6 = (id)MEMORY[0x1E0C80A78](v14, v3, v4, v5);
  v16 = sub_1ABA65168();
  v13 = sub_1ABA653CC();
  swift_getObjCClassMetadata();
  sub_1ABA5E778(v13, v15);
  swift_bridgeObjectRelease();

  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v17 + 48))(v15, 1) == 1)
  {
    v10 = 0;
  }
  else
  {
    v9 = (void *)sub_1ABA6512C();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
    v10 = v9;
  }
  return v10;
}

+ (id)assetIdentifierFromContentIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  uint64_t v9;

  swift_getObjCClassMetadata();
  v3 = a3;
  sub_1ABA65348();
  swift_getObjCClassMetadata();
  sub_1ABA5F3D0();
  v9 = v4;
  swift_bridgeObjectRelease();

  if (v9)
  {
    v6 = sub_1ABA6533C();
    swift_bridgeObjectRelease();
    v7 = (id)v6;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (MFComposePhotoPickerItem)init
{
  return (MFComposePhotoPickerItem *)PhotoPickerItem.init()();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  sub_1ABA5E3A8();
  sub_1ABA5E47C((uint64_t)self + OBJC_IVAR___MFComposePhotoPickerItem_assetURL);
  sub_1ABA5F8A4((uint64_t)self + OBJC_IVAR___MFComposePhotoPickerItem_assetData);
  v3 = OBJC_IVAR___MFComposePhotoPickerItem_contentType;
  v2 = sub_1ABA65168();
  (*(void (**)(char *))(*(_QWORD *)(v2 - 8) + 8))((char *)self + v3);
  sub_1ABA5E3A8();
}

@end
