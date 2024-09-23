BOOL ICCurrentAppearanceType()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BEBDAB0], "_currentTraitCollection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceStyle");

  return v1 == 2;
}

void sub_218DFFE64()
{
  qword_255019990 = 0x746E65636552;
  *(_QWORD *)algn_255019998 = 0xE600000000000000;
}

uint64_t static ThumbnailKey.recentObjectId.getter()
{
  uint64_t v0;

  if (qword_255019988 != -1)
    swift_once();
  v0 = qword_255019990;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t ThumbnailKey.accountId.getter()
{
  return sub_218DFFFD8(&OBJC_IVAR___ICThumbnailKey_accountId);
}

id sub_218DFFF74(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;

  if (*(_QWORD *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_218E0C5B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t ThumbnailKey.objectId.getter()
{
  return sub_218DFFFD8(&OBJC_IVAR___ICThumbnailKey_objectId);
}

uint64_t sub_218DFFFD8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ThumbnailKey.thumbnailId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  swift_bridgeObjectRetain();
  return v1;
}

id ThumbnailKey.__allocating_init(accountId:objectId:thumbnailId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  objc_super v18;

  v13 = (char *)objc_allocWithZone(v6);
  v14 = &v13[OBJC_IVAR___ICThumbnailKey_accountId];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v13[OBJC_IVAR___ICThumbnailKey_objectId];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  v16 = &v13[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(_QWORD *)v16 = a5;
  *((_QWORD *)v16 + 1) = a6;
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ThumbnailKey.init(accountId:objectId:thumbnailId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  objc_class *ObjectType;
  char *v14;
  char *v15;
  char *v16;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v14 = &v6[OBJC_IVAR___ICThumbnailKey_accountId];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v6[OBJC_IVAR___ICThumbnailKey_objectId];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  v16 = &v6[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(_QWORD *)v16 = a5;
  *((_QWORD *)v16 + 1) = a6;
  v18.receiver = v6;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ThumbnailKey.__allocating_init(accountId:objectId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return ThumbnailKey.init(accountId:objectId:)(a1, a2, a3, a4);
}

id ThumbnailKey.init(accountId:objectId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!a2)
  {
    v6 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v7 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
LABEL_6:
  v8 = (void *)sub_218E0C5B4();
  v9 = objc_msgSend(v4, sel_initWithAccountId_objectId_thumbnailId_, v6, v7, v8);

  return v9;
}

id ThumbnailKey.__allocating_init(type:accountId:objectId:preferredSize:scale:appearance:)(uint64_t a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  objc_class *v10;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;

  v10 = v9;
  v18 = objc_allocWithZone(v10);
  if (!a6)
  {
    v19 = 0;
    if (a8)
      goto LABEL_3;
LABEL_5:
    v20 = 0;
    goto LABEL_6;
  }
  v19 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  if (!a8)
    goto LABEL_5;
LABEL_3:
  v20 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
LABEL_6:
  LODWORD(v23) = 0;
  v21 = objc_msgSend(v18, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v19, v20, a9, 0, 0, a2, a3, a4, v23);

  return v21;
}

id ThumbnailKey.init(type:accountId:objectId:preferredSize:scale:appearance:)(uint64_t a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;

  if (!a6)
  {
    v16 = 0;
    if (a8)
      goto LABEL_3;
LABEL_5:
    v17 = 0;
    goto LABEL_6;
  }
  v16 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  if (!a8)
    goto LABEL_5;
LABEL_3:
  v17 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
LABEL_6:
  LODWORD(v20) = 0;
  v18 = objc_msgSend(v9, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v16, v17, a9, 0, 0, a2, a3, a4, v20);

  return v18;
}

id ThumbnailKey.__allocating_init(type:accountId:objectId:preferredSize:traitCollection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, double a7, double a8)
{
  objc_class *v8;
  id v17;

  v17 = objc_allocWithZone(v8);
  return ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(a1, a7, a8, a2, a3, a4, a5, a6);
}

id ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void *v8;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _BOOL8 v18;
  _BOOL8 v19;
  id v20;
  void *v21;
  BOOL v22;
  id v23;
  uint64_t v25;

  if (!a5)
  {
    v14 = 0;
    if (a7)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v14 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  if (!a7)
    goto LABEL_5;
LABEL_3:
  v15 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
LABEL_6:
  objc_msgSend(a8, sel_displayScale);
  v17 = v16;
  v18 = objc_msgSend(a8, sel_userInterfaceStyle) == (id)2;
  v19 = objc_msgSend(a8, sel_layoutDirection) == (id)1;
  v20 = objc_msgSend(a8, sel_preferredContentSizeCategory);
  sub_218E0C5D8();

  v21 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(a8, sel_legibilityWeight) == (id)1;
  BYTE3(v25) = 0;
  BYTE2(v25) = objc_msgSend(a8, sel_accessibilityContrast) == (id)1;
  LOWORD(v25) = v22;
  v23 = objc_msgSend(v8, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v14, v15, v18, v19, v21, a2, a3, v17, v25);

  return v23;
}

uint64_t ThumbnailKey.description.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  v4 = *(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  v5 = v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId;
  v6 = *(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  v7 = *(_QWORD *)(v5 + 8);
  if (!v2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (!v3)
      goto LABEL_12;
    goto LABEL_7;
  }
  v8 = *v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v9 = sub_218E026C4(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v11 = v9[2];
  v10 = v9[3];
  if (v11 >= v10 >> 1)
    v9 = sub_218E026C4((_QWORD *)(v10 > 1), v11 + 1, 1, v9);
  v9[2] = v11 + 1;
  v12 = &v9[2 * v11];
  v12[4] = v8;
  v12[5] = v2;
  if (v3)
  {
LABEL_7:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_218E026C4(0, v9[2] + 1, 1, v9);
    v14 = v9[2];
    v13 = v9[3];
    if (v14 >= v13 >> 1)
      v9 = sub_218E026C4((_QWORD *)(v13 > 1), v14 + 1, 1, v9);
    v9[2] = v14 + 1;
    v15 = &v9[2 * v14];
    v15[4] = v4;
    v15[5] = v3;
  }
LABEL_12:
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v9 = sub_218E026C4(0, v9[2] + 1, 1, v9);
  v17 = v9[2];
  v16 = v9[3];
  if (v17 >= v16 >> 1)
    v9 = sub_218E026C4((_QWORD *)(v16 > 1), v17 + 1, 1, v9);
  v9[2] = v17 + 1;
  v18 = &v9[2 * v17];
  v18[4] = v6;
  v18[5] = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550199E0);
  sub_218E02810();
  v19 = sub_218E0C5A8();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t ThumbnailKey.isEqual(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v12;
  _BYTE v13[24];
  uint64_t v14;

  v2 = v1;
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550199F0);
  v4 = sub_218E0C644();
  swift_unknownObjectRelease();
  if (v4 == v2)
  {
    v8 = 1;
    return v8 & 1;
  }
  sub_218E028A0(a1, (uint64_t)v13);
  if (!v14)
  {
    sub_218E028E8((uint64_t)v13);
    goto LABEL_25;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_25:
    v8 = 0;
    return v8 & 1;
  }
  v5 = *(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  v6 = *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_accountId + 8];
  if (v5)
  {
    if (!v6)
      goto LABEL_24;
    v7 = *(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId) == *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_accountId]
      && v5 == v6;
    if (!v7 && (sub_218E0C788() & 1) == 0)
      goto LABEL_24;
  }
  else if (v6)
  {
    goto LABEL_24;
  }
  v9 = *(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  v10 = *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_objectId + 8];
  if (v9)
  {
    if (v10
      && (*(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId) == *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_objectId]
       && v9 == v10
       || (sub_218E0C788() & 1) != 0))
    {
      goto LABEL_20;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v10)
    goto LABEL_24;
LABEL_20:
  if (*(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_thumbnailId) == *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_thumbnailId]
    && *(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_thumbnailId + 8) == *(_QWORD *)&v12[OBJC_IVAR___ICThumbnailKey_thumbnailId
                                                                                     + 8])
  {

    v8 = 1;
  }
  else
  {
    v8 = sub_218E0C788();

  }
  return v8 & 1;
}

uint64_t ThumbnailKey.hash.getter()
{
  uint64_t v0;

  sub_218E0C824();
  if (*(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId + 8))
  {
    sub_218E0C800();
    swift_bridgeObjectRetain();
    sub_218E0C5F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_218E0C800();
  }
  if (*(_QWORD *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
  {
    sub_218E0C800();
    swift_bridgeObjectRetain();
    sub_218E0C5F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_218E0C800();
  }
  swift_bridgeObjectRetain();
  sub_218E0C5F0();
  swift_bridgeObjectRelease();
  return sub_218E0C80C();
}

id ThumbnailKey.copy(with:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  id result;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_accountId);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_objectId);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  v9 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  v8 = *(_QWORD *)(v1 + OBJC_IVAR___ICThumbnailKey_thumbnailId + 8);
  v10 = (char *)objc_allocWithZone(ObjectType);
  v11 = &v10[OBJC_IVAR___ICThumbnailKey_accountId];
  *(_QWORD *)v11 = v5;
  *((_QWORD *)v11 + 1) = v4;
  v12 = &v10[OBJC_IVAR___ICThumbnailKey_objectId];
  *(_QWORD *)v12 = v7;
  *((_QWORD *)v12 + 1) = v6;
  v13 = &v10[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(_QWORD *)v13 = v9;
  *((_QWORD *)v13 + 1) = v8;
  v15.receiver = v10;
  v15.super_class = ObjectType;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = objc_msgSendSuper2(&v15, sel_init);
  a1[3] = ObjectType;
  *a1 = result;
  return result;
}

uint64_t sub_218E012DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void (*v25)(char *, uint64_t);
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  char *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v2 = v1;
  v36 = a1;
  v3 = sub_218E0C50C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v33 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v33 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v33 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v33 - v17;
  if (*(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId + 8))
  {
    v19 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    v34 = v4;
    v20 = v3;
    v21 = v19;
    v22 = (void *)sub_218E0C5B4();
    v23 = objc_msgSend(v21, sel_applicationDocumentsURLForAccountIdentifier_, v22);
    v35 = v2;
    v24 = v23;

    v3 = v20;
    sub_218E0C500();

    sub_218E0C5D8();
    sub_218E0C4E8();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(char *, uint64_t))(v34 + 8);
    v25(v10, v3);
    sub_218E0C4E8();
    v25(v13, v3);
    sub_218E0C5D8();
    sub_218E0C4E8();
    swift_bridgeObjectRelease();
    v25(v16, v3);
    if (*(_QWORD *)(v35 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
    {
      v26 = (void *)sub_218E0C5B4();
      v27 = objc_msgSend(v26, sel_ic_sanitizedFilenameString);

      sub_218E0C5D8();
    }
    sub_218E0C4E8();
    swift_bridgeObjectRelease();
    v31 = v18;
  }
  else
  {
    v28 = objc_msgSend((id)objc_opt_self(), sel_applicationDocumentsURL);
    sub_218E0C500();

    sub_218E0C5D8();
    sub_218E0C4E8();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(char *, uint64_t))(v4 + 8);
    v25(v16, v3);
    if (*(_QWORD *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
    {
      v29 = (void *)sub_218E0C5B4();
      v30 = objc_msgSend(v29, sel_ic_sanitizedFilenameString);

      sub_218E0C5D8();
    }
    sub_218E0C4E8();
    swift_bridgeObjectRelease();
    v31 = v7;
  }
  return ((uint64_t (*)(char *, uint64_t))v25)(v31, v3);
}

id sub_218E01698(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v12;

  v5 = sub_218E0C50C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1;
  sub_218E01760(a3, (uint64_t)v8);

  v10 = (void *)sub_218E0C4DC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

uint64_t sub_218E0173C@<X0>(uint64_t a1@<X8>)
{
  return sub_218E01760(MEMORY[0x24BEE62E0], a1);
}

uint64_t sub_218E01754@<X0>(uint64_t a1@<X8>)
{
  return sub_218E01760(MEMORY[0x24BEE6278], a1);
}

uint64_t sub_218E01760@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  uint64_t (*v15)(char *, uint64_t);
  uint64_t v16;
  void (*v18)(uint64_t);
  uint64_t v19;

  v18 = a1;
  v19 = a2;
  v2 = sub_218E0C554();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_218E0C50C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v18 - v11;
  sub_218E012DC((uint64_t)v10);
  v13 = (void *)sub_218E0C5B4();
  v14 = objc_msgSend(v13, sel_ic_sanitizedFilenameString, v18, v19);

  sub_218E0C5D8();
  sub_218E0C4E8();
  swift_bridgeObjectRelease();
  v15 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  v16 = v15(v10, v6);
  v18(v16);
  sub_218E0C548();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_218E0C4F4();
  swift_bridgeObjectRelease();
  return v15(v12, v6);
}

id ThumbnailKey.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ThumbnailKey.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_218E0197C(char a1)
{
  return *(_QWORD *)&aAccountiobject[8 * a1];
}

BOOL sub_218E0199C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_218E019B0()
{
  sub_218E0C7E8();
  sub_218E0C7F4();
  return sub_218E0C818();
}

uint64_t sub_218E019F4()
{
  return sub_218E0C7F4();
}

uint64_t sub_218E01A1C()
{
  sub_218E0C7E8();
  sub_218E0C7F4();
  return sub_218E0C818();
}

uint64_t sub_218E01A5C()
{
  char *v0;

  return sub_218E0197C(*v0);
}

uint64_t sub_218E01A64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_218E04204(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_218E01A88()
{
  return 0;
}

void sub_218E01A94(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_218E01AA0()
{
  sub_218E02928();
  return sub_218E0C848();
}

uint64_t sub_218E01AC8()
{
  sub_218E02928();
  return sub_218E0C854();
}

id ThumbnailKey.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ThumbnailKey.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550199F8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_218E02928();
  sub_218E0C83C();
  v8[15] = 0;
  sub_218E0C740();
  if (!v1)
  {
    v8[14] = 1;
    sub_218E0C740();
    v8[13] = 2;
    sub_218E0C74C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

id ThumbnailKey.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ThumbnailKey.init(from:)(a1);
}

id ThumbnailKey.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  objc_class *ObjectType;
  objc_super v23;
  char v24;

  ObjectType = (objc_class *)swift_getObjectType();
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019A08);
  v4 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_218E02928();
  v7 = v1;
  sub_218E0C830();
  if (v2)
  {
    v20 = ObjectType;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);

    swift_deallocPartialClassInstance();
  }
  else
  {
    v8 = v4;
    v24 = 0;
    v9 = v21;
    v10 = sub_218E0C710();
    v12 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_accountId];
    *v12 = v10;
    v12[1] = v13;
    v24 = 1;
    v14 = sub_218E0C710();
    v15 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_objectId];
    *v15 = v14;
    v15[1] = v16;
    v24 = 2;
    v17 = sub_218E0C71C();
    v18 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_thumbnailId];
    *v18 = v17;
    v18[1] = v19;

    v23.receiver = v7;
    v23.super_class = ObjectType;
    v20 = objc_msgSendSuper2(&v23, sel_init);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  return v20;
}

id sub_218E01F7C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  id v6;
  id result;

  v6 = objc_allocWithZone(v2);
  result = ThumbnailKey.init(from:)(a1);
  if (!v3)
    *a2 = result;
  return result;
}

uint64_t sub_218E01FC8(_QWORD *a1)
{
  return ThumbnailKey.encode(to:)(a1);
}

id sub_218E01FE8()
{
  id *v0;

  return *v0;
}

uint64_t sub_218E01FF0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_218E01FF8()
{
  sub_218E02BEC(&qword_255019AB8, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D0B8);
  return sub_218E0C7A0();
}

uint64_t sub_218E02038()
{
  sub_218E02BEC(&qword_255019AB8, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D0B8);
  return sub_218E0C794();
}

uint64_t sub_218E0207C()
{
  sub_218E02BEC(&qword_255019AF0, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D0FC);
  return sub_218E0C488();
}

uint64_t sub_218E020BC(uint64_t a1, uint64_t a2)
{
  return sub_218E02204(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_218E020C8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_218E0C5C0();
  *a2 = 0;
  return result;
}

uint64_t sub_218E0213C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_218E0C5CC();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_218E021B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_218E0C5D8();
  v2 = sub_218E0C5B4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_218E021F8(uint64_t a1, uint64_t a2)
{
  return sub_218E02204(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_218E02204(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_218E0C5D8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_218E02240()
{
  sub_218E0C5D8();
  sub_218E0C5F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_218E02280()
{
  uint64_t v0;

  sub_218E0C5D8();
  sub_218E0C7E8();
  sub_218E0C5F0();
  v0 = sub_218E0C818();
  swift_bridgeObjectRelease();
  return v0;
}

_QWORD *sub_218E022F0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_218E02300(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_218E0230C()
{
  return sub_218E0C5D8();
}

uint64_t sub_218E0231C()
{
  sub_218E02BEC(&qword_255019AF0, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D0FC);
  return sub_218E0C4C4();
}

uint64_t sub_218E0235C()
{
  sub_218E02BEC(&qword_255019AF0, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D0FC);
  return sub_218E0C4A0();
}

uint64_t sub_218E0239C(void *a1)
{
  id v2;

  sub_218E02BEC(&qword_255019AF0, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D0FC);
  v2 = a1;
  return sub_218E0C494();
}

uint64_t sub_218E02400()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_218E0C638();

  return v2;
}

uint64_t sub_218E02434()
{
  sub_218E02BEC(&qword_255019AF0, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D0FC);
  return sub_218E0C4B8();
}

uint64_t sub_218E02484()
{
  sub_218E0C7E8();
  sub_218E0C59C();
  return sub_218E0C818();
}

uint64_t sub_218E024E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_218E0C5D8();
  v2 = v1;
  if (v0 == sub_218E0C5D8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_218E02568()
{
  sub_218E02BEC(&qword_255019AF0, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D0FC);
  return sub_218E0C4AC();
}

BOOL sub_218E025C0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_218E025D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_218E0C5B4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_218E02618@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_218E0C5D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_218E02640()
{
  sub_218E02BEC(&qword_255019B40, (uint64_t (*)(uint64_t))type metadata accessor for __NPNotePreviewKey, (uint64_t)&unk_218E0D43C);
  sub_218E02BEC(&qword_255019B48, (uint64_t (*)(uint64_t))type metadata accessor for __NPNotePreviewKey, (uint64_t)&unk_218E0D390);
  return sub_218E0C704();
}

_QWORD *sub_218E026C4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255019B08);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_218E04114(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A2409C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_218E02810()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2550199E8;
  if (!qword_2550199E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2550199E0);
    result = MEMORY[0x219A240B4](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2550199E8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A240A8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_218E028A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550199F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_218E028E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550199F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_218E02928()
{
  unint64_t result;

  result = qword_255019A00;
  if (!qword_255019A00)
  {
    result = MEMORY[0x219A240B4](&unk_218E0D20C, &type metadata for ThumbnailKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255019A00);
  }
  return result;
}

uint64_t type metadata accessor for ThumbnailKey()
{
  return objc_opt_self();
}

uint64_t method lookup function for ThumbnailKey()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ThumbnailKey.__allocating_init(accountId:objectId:thumbnailId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ThumbnailKey.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void type metadata accessor for NotePreviewProviderErrors(uint64_t a1)
{
  sub_218E043D0(a1, &qword_255019A98);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ThumbnailKey.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailKey.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_218E02AB8 + 4 * byte_218E0CE15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_218E02AEC + 4 * byte_218E0CE10[v4]))();
}

uint64_t sub_218E02AEC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_218E02AF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x218E02AFCLL);
  return result;
}

uint64_t sub_218E02B08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x218E02B10);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_218E02B14(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_218E02B1C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_218E02B28(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_218E02B34(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailKey.CodingKeys()
{
  return &type metadata for ThumbnailKey.CodingKeys;
}

unint64_t sub_218E02B50()
{
  unint64_t result;

  result = qword_255019AA0;
  if (!qword_255019AA0)
  {
    result = MEMORY[0x219A240B4](&unk_218E0CFA8, &type metadata for ThumbnailKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255019AA0);
  }
  return result;
}

uint64_t sub_218E02B94()
{
  return sub_218E02BEC(&qword_255019AA8, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0CFD0);
}

uint64_t sub_218E02BC0()
{
  return sub_218E02BEC(&qword_255019AB0, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0CFFC);
}

uint64_t sub_218E02BEC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x219A240B4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_218E02C2C()
{
  return sub_218E02BEC(&qword_255019AB8, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D0B8);
}

uint64_t sub_218E02C58()
{
  return sub_218E02BEC(&qword_255019AC0, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D084);
}

uint64_t sub_218E02C84()
{
  return sub_218E02BEC(&qword_255019AC8, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D040);
}

uint64_t sub_218E02CB0()
{
  return sub_218E02BEC(&qword_255019AD0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_218E0D1A4);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_218E043D0(a1, &qword_255019B18);
}

uint64_t sub_218E02CF0()
{
  return sub_218E02BEC(&qword_255019AD8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_218E0D168);
}

unint64_t sub_218E02D20()
{
  unint64_t result;

  result = qword_255019AE0;
  if (!qword_255019AE0)
  {
    result = MEMORY[0x219A240B4](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_255019AE0);
  }
  return result;
}

uint64_t sub_218E02D64()
{
  return sub_218E02BEC(&qword_255019AE8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_218E0D1E0);
}

uint64_t sub_218E02D90()
{
  return sub_218E02BEC(&qword_255019AF0, (uint64_t (*)(uint64_t))type metadata accessor for NotePreviewProviderErrors, (uint64_t)&unk_218E0D0FC);
}

unint64_t sub_218E02DC0()
{
  unint64_t result;

  result = qword_255019AF8;
  if (!qword_255019AF8)
  {
    result = MEMORY[0x219A240B4](&unk_218E0CF18, &type metadata for ThumbnailKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255019AF8);
  }
  return result;
}

unint64_t sub_218E02E08()
{
  unint64_t result;

  result = qword_255019B00;
  if (!qword_255019B00)
  {
    result = MEMORY[0x219A240B4](&unk_218E0CF40, &type metadata for ThumbnailKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255019B00);
  }
  return result;
}

uint64_t sub_218E02E4C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_218E02E68(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_218E02E68(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255019B08);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_218E0C6F8();
  __break(1u);
  return result;
}

id sub_218E02FD0(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t *v22;
  objc_super v26;
  uint64_t v27;

  v5 = *(_QWORD *)(a5 + 16);
  if (v5)
  {
    v6 = result;
    v7 = (uint64_t *)(a5 + 40);
    v8 = MEMORY[0x24BEE4AF8];
    do
    {
      v12 = *(v7 - 1);
      v13 = *v7;
      v14 = HIBYTE(*v7) & 0xF;
      if ((*v7 & 0x2000000000000000) == 0)
        v14 = v12 & 0xFFFFFFFFFFFFLL;
      if (v14)
      {
        swift_bridgeObjectRetain();
        v27 = v8;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_218E02E4C(0, *(_QWORD *)(v8 + 16) + 1, 1);
          v8 = v27;
        }
        v10 = *(_QWORD *)(v8 + 16);
        v9 = *(_QWORD *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          sub_218E02E4C(v9 > 1, v10 + 1, 1);
          v8 = v27;
        }
        *(_QWORD *)(v8 + 16) = v10 + 1;
        v11 = v8 + 16 * v10;
        *(_QWORD *)(v11 + 32) = v12;
        *(_QWORD *)(v11 + 40) = v13;
      }
      v7 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    v27 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550199E0);
    sub_218E02810();
    v15 = sub_218E0C5A8();
    v17 = v16;
    swift_release();
    v18 = (objc_class *)type metadata accessor for ThumbnailKey();
    v19 = (char *)objc_allocWithZone(v18);
    v20 = &v19[OBJC_IVAR___ICThumbnailKey_accountId];
    *(_QWORD *)v20 = v6;
    *((_QWORD *)v20 + 1) = a2;
    v21 = &v19[OBJC_IVAR___ICThumbnailKey_objectId];
    *(_QWORD *)v21 = a3;
    *((_QWORD *)v21 + 1) = a4;
    v22 = (uint64_t *)&v19[OBJC_IVAR___ICThumbnailKey_thumbnailId];
    *v22 = v15;
    v22[1] = v17;
    v26.receiver = v19;
    v26.super_class = v18;
    return objc_msgSendSuper2(&v26, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_218E03178(uint64_t a1)
{
  uint64_t result;

  result = 0xD000000000000013;
  switch(a1)
  {
    case 0:
      result = 0x656D686361747441;
      break;
    case 1:
      result = 1702129486;
      break;
    case 2:
      result = 0x6174744165746F4ELL;
      break;
    case 3:
    case 5:
      return result;
    case 4:
      result = 0x7268437265706150;
      break;
    case 6:
      result = 0xD000000000000012;
      break;
    case 7:
      result = 0x6572507265706150;
      break;
    case 8:
      result = 0x726174617641;
      break;
    case 10:
      result = 0xD000000000000014;
      break;
    case 11:
      result = 0xD000000000000014;
      break;
    default:
      result = sub_218E0C6E0();
      __break(1u);
      break;
  }
  return result;
}

void sub_218E032F0(double a1, double a2)
{
  if ((~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_218E0C770();
  sub_218E0C5FC();
  if ((~*(_QWORD *)&a2 & 0x7FF0000000000000) == 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (a2 < 9.22337204e18)
  {
    sub_218E0C770();
    sub_218E0C5FC();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_13:
  __break(1u);
}

uint64_t sub_218E03408(double a1)
{
  uint64_t result;

  if ((~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.22337204e18)
  {
    sub_218E0C770();
    sub_218E0C5FC();
    swift_bridgeObjectRelease();
    sub_218E0C5FC();
    return 64;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_218E034BC(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;

  if (a2)
    v2 = (id)sub_218E0C5B4();
  else
    v2 = (id)*MEMORY[0x24BEBE0D8];
  v3 = v2;
  v4 = sub_218E0C5D8();
  v6 = v5;
  if (v4 == sub_218E0C5D8() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  v9 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
LABEL_18:

    return 21336;
  }
  v10 = sub_218E0C5D8();
  v12 = v11;
  if (v10 == sub_218E0C5D8() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_21;
  }
  v15 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
  {
LABEL_21:

    return 83;
  }
  v16 = sub_218E0C5D8();
  v18 = v17;
  if (v16 == sub_218E0C5D8() && v18 == v19)
    goto LABEL_16;
  v22 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v22 & 1) != 0)
    goto LABEL_23;
  v23 = sub_218E0C5D8();
  v25 = v24;
  if (v23 == sub_218E0C5D8() && v25 == v26)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
LABEL_23:

    return 77;
  }
  v27 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v27 & 1) != 0)
    goto LABEL_23;
  v28 = sub_218E0C5D8();
  v30 = v29;
  if (v28 == sub_218E0C5D8() && v30 == v31)
  {
    swift_bridgeObjectRelease_n();
LABEL_31:

    return 76;
  }
  v32 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
    goto LABEL_31;
  v33 = sub_218E0C5D8();
  v35 = v34;
  if (v33 == sub_218E0C5D8() && v35 == v36)
  {
    swift_bridgeObjectRelease_n();
LABEL_36:

    return 19544;
  }
  v37 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v37 & 1) != 0)
    goto LABEL_36;
  v38 = sub_218E0C5D8();
  v40 = v39;
  if (v38 == sub_218E0C5D8() && v40 == v41)
    goto LABEL_39;
  v42 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v42 & 1) != 0)
    goto LABEL_41;
  v43 = sub_218E0C5D8();
  v45 = v44;
  if (v43 == sub_218E0C5D8() && v45 == v46)
  {
LABEL_39:
    swift_bridgeObjectRelease_n();
LABEL_41:
    v20 = 5003314;

    return v20;
  }
  v47 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v47 & 1) != 0)
    goto LABEL_41;
  v48 = sub_218E0C5D8();
  v50 = v49;
  if (v48 == sub_218E0C5D8() && v50 == v51)
  {
    swift_bridgeObjectRelease_n();
LABEL_49:

    return 19777;
  }
  v52 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v52 & 1) != 0)
    goto LABEL_49;
  v53 = sub_218E0C5D8();
  v55 = v54;
  if (v53 == sub_218E0C5D8() && v55 == v56)
  {
    swift_bridgeObjectRelease_n();
LABEL_54:

    return 19521;
  }
  v57 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v57 & 1) != 0)
    goto LABEL_54;
  v58 = sub_218E0C5D8();
  v60 = v59;
  if (v58 == sub_218E0C5D8() && v60 == v61)
  {
    swift_bridgeObjectRelease_n();
LABEL_59:

    return 5003329;
  }
  v62 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v62 & 1) != 0)
    goto LABEL_59;
  v63 = sub_218E0C5D8();
  v65 = v64;
  if (v63 == sub_218E0C5D8() && v65 == v66)
  {
    swift_bridgeObjectRelease_n();
LABEL_64:
    v20 = 1280848449;

    return v20;
  }
  v67 = sub_218E0C788();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v67 & 1) != 0)
    goto LABEL_64;
  v68 = sub_218E0C5D8();
  v70 = v69;
  if (v68 == sub_218E0C5D8() && v70 == v71)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v72 = sub_218E0C788();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v72 & 1) == 0)
      return 0;
  }
  return 1280848705;
}

id sub_218E03B84(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, char a12, char a13, char a14)
{
  void *v14;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t inited;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;

  switch(a1)
  {
    case 0:
      v25 = a4;
      v24 = a2;
      v60 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      __swift_instantiateConcreteTypeFromMangledName(&qword_255019B08);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_218E0D4C0;
      *(_QWORD *)(inited + 32) = 0x656D686361747441;
      *(_QWORD *)(inited + 40) = 0xEA0000000000746ELL;
      sub_218E032F0(a9, a10);
      *(_QWORD *)(inited + 48) = v61;
      *(_QWORD *)(inited + 56) = v62;
      *(_QWORD *)(inited + 64) = sub_218E03408(a11);
      *(_QWORD *)(inited + 72) = v63;
      goto LABEL_28;
    case 1:
    case 2:
    case 3:
      v24 = a2;
      v25 = a4;
      v26 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      __swift_instantiateConcreteTypeFromMangledName(&qword_255019B08);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_218E0D4E0;
      *(_QWORD *)(inited + 32) = sub_218E03178(a1);
      *(_QWORD *)(inited + 40) = v28;
      sub_218E032F0(a9, a10);
      *(_QWORD *)(inited + 48) = v29;
      *(_QWORD *)(inited + 56) = v30;
      if (!a6)
      {
        v31 = 0xE500000000000000;
        v32 = 0x746867694CLL;
        goto LABEL_21;
      }
      if (a6 == 1)
      {
        v31 = 0xE400000000000000;
        v32 = 1802658116;
LABEL_21:
        *(_QWORD *)(inited + 64) = v32;
        *(_QWORD *)(inited + 72) = v31;
        *(_QWORD *)(inited + 80) = sub_218E03408(a11);
        *(_QWORD *)(inited + 88) = v49;
LABEL_28:
        v57 = v24;
        v58 = a3;
        v59 = v25;
LABEL_29:
        v64 = a5;
        goto LABEL_37;
      }
      goto LABEL_39;
    case 4:
    case 7:
    case 10:
    case 11:
      swift_getObjectType();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255019B08);
      v33 = swift_initStackObject();
      *(_OWORD *)(v33 + 16) = xmmword_218E0D4D0;
      *(_QWORD *)(v33 + 32) = sub_218E03178(a1);
      *(_QWORD *)(v33 + 40) = v34;
      if (a6)
      {
        if (a6 == 1)
        {
          v35 = 0xE400000000000000;
          v36 = 1802658116;
          goto LABEL_8;
        }
        while (1)
        {
LABEL_39:
          sub_218E0C6E0();
          __break(1u);
        }
      }
      v35 = 0xE500000000000000;
      v36 = 0x746867694CLL;
LABEL_8:
      *(_QWORD *)(v33 + 48) = v36;
      *(_QWORD *)(v33 + 56) = v35;
      v37 = sub_218E034BC(a7, a8);
      v39 = v38;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v33 + 64) = v37;
      *(_QWORD *)(v33 + 72) = v39;
      v40 = 0x5472616C75676552;
      if ((a12 & 1) != 0)
        v40 = 0x74786554646C6F42;
      v41 = 0xEB00000000747865;
      if ((a12 & 1) != 0)
        v41 = 0xE800000000000000;
      *(_QWORD *)(v33 + 80) = v40;
      *(_QWORD *)(v33 + 88) = v41;
      v42 = 0x4372616C75676552;
      if ((a13 & 1) != 0)
        v42 = 0x6F4372656B726144;
      v43 = 0xED000073726F6C6FLL;
      if ((a13 & 1) != 0)
        v43 = 0xEC00000073726F6CLL;
      *(_QWORD *)(v33 + 96) = v42;
      *(_QWORD *)(v33 + 104) = v43;
      v44 = sub_218E02FD0(a2, a3, a4, a5, v33);
LABEL_38:
      swift_deallocPartialClassInstance();
      return v44;
    case 5:
    case 6:
      v45 = v14;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_getObjectType();

      __swift_instantiateConcreteTypeFromMangledName(&qword_255019B08);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_218E0D4C0;
      *(_QWORD *)(inited + 32) = sub_218E03178(a1);
      *(_QWORD *)(inited + 40) = v46;
      if (a6)
      {
        if (a6 != 1)
          goto LABEL_39;
        v47 = 0xE400000000000000;
        v48 = 1802658116;
      }
      else
      {
        v47 = 0xE500000000000000;
        v48 = 0x746867694CLL;
      }
      *(_QWORD *)(inited + 48) = v48;
      *(_QWORD *)(inited + 56) = v47;
      v65 = 0x4372616C75676552;
      if ((a13 & 1) != 0)
        v65 = 0x6F4372656B726144;
      v66 = 0xED000073726F6C6FLL;
      if ((a13 & 1) != 0)
        v66 = 0xEC00000073726F6CLL;
      *(_QWORD *)(inited + 64) = v65;
      *(_QWORD *)(inited + 72) = v66;
      v57 = 0;
      v58 = 0;
      v59 = 0;
      v64 = 0;
LABEL_37:
      v44 = sub_218E02FD0(v57, v58, v59, v64, inited);
      goto LABEL_38;
    case 8:
      v52 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      __swift_instantiateConcreteTypeFromMangledName(&qword_255019B08);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_218E0D4C0;
      *(_QWORD *)(inited + 32) = 0x726174617641;
      *(_QWORD *)(inited + 40) = 0xE600000000000000;
      sub_218E032F0(a9, a10);
      *(_QWORD *)(inited + 48) = v53;
      *(_QWORD *)(inited + 56) = v54;
      v55 = 0x726564726F426F4ELL;
      if ((a14 & 1) != 0)
        v55 = 0x726564726F42;
      v56 = 0xE800000000000000;
      if ((a14 & 1) != 0)
        v56 = 0xE600000000000000;
      *(_QWORD *)(inited + 64) = v55;
      *(_QWORD *)(inited + 72) = v56;
      v57 = a2;
      v58 = a3;
      v59 = a4;
      goto LABEL_29;
    default:
      goto LABEL_39;
  }
}

uint64_t sub_218E04114(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_218E0C6F8();
  __break(1u);
  return result;
}

uint64_t sub_218E04204(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x49746E756F636361 && a2 == 0xE900000000000064;
  if (v3 || (sub_218E0C788() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64497463656A626FLL && a2 == 0xE800000000000000 || (sub_218E0C788() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69616E626D756874 && a2 == 0xEB0000000064496CLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_218E0C788();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

_QWORD *__swift_project_boxed_opaque_existential_1Tm(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void type metadata accessor for __NPNotePreviewKey(uint64_t a1)
{
  sub_218E043D0(a1, &qword_255019B10);
}

void type metadata accessor for Appearances(uint64_t a1)
{
  sub_218E043D0(a1, &qword_255019B20);
}

void sub_218E043D0(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_218E04414()
{
  return sub_218E02BEC(&qword_255019B28, (uint64_t (*)(uint64_t))type metadata accessor for __NPNotePreviewKey, (uint64_t)&unk_218E0D354);
}

uint64_t sub_218E04440()
{
  return sub_218E02BEC(&qword_255019B30, (uint64_t (*)(uint64_t))type metadata accessor for __NPNotePreviewKey, (uint64_t)&unk_218E0D328);
}

uint64_t sub_218E0446C()
{
  return sub_218E02BEC(&qword_255019B38, (uint64_t (*)(uint64_t))type metadata accessor for __NPNotePreviewKey, (uint64_t)&unk_218E0D3C4);
}

void **sub_218E044A0(void **a1, void **a2, int *a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_218E0C53C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v13 = v4;
    v12(v9, v10, v11);
    v14 = a3[6];
    v15 = a3[7];
    v16 = (void **)((char *)v7 + v14);
    v17 = (void **)((char *)a2 + v14);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    *(void **)((char *)v7 + v15) = *(void **)((char *)a2 + v15);
    v19 = a3[9];
    *(void **)((char *)v7 + a3[8]) = *(void **)((char *)a2 + a3[8]);
    v20 = (uint64_t *)((char *)v7 + v19);
    v21 = *(uint64_t *)((char *)a2 + v19);
    v22 = *(unint64_t *)((char *)a2 + v19 + 8);
    swift_bridgeObjectRetain();
    sub_218E045AC(v21, v22);
    *v20 = v21;
    v20[1] = v22;
    v23 = a3[10];
    v24 = (uint64_t *)((char *)v7 + v23);
    v25 = (uint64_t *)((char *)a2 + v23);
    v26 = *v25;
    v27 = v25[1];
    sub_218E045AC(*v25, v27);
    *v24 = v26;
    v24[1] = v27;
  }
  return v7;
}

uint64_t sub_218E045AC(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_218E045F0(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + a2[5];
  v5 = sub_218E0C53C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  sub_218E04670(*(uint64_t *)((char *)a1 + a2[9]), *(unint64_t *)((char *)a1 + a2[9] + 8));
  return sub_218E04670(*(uint64_t *)((char *)a1 + a2[10]), *(unint64_t *)((char *)a1 + a2[10] + 8));
}

uint64_t sub_218E04670(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

void **sub_218E046B4(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;

  v6 = *a2;
  *a1 = *a2;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_218E0C53C();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v12 = v6;
  v11(v8, v9, v10);
  v13 = a3[6];
  v14 = a3[7];
  v15 = (void **)((char *)a1 + v13);
  v16 = (void **)((char *)a2 + v13);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  *(void **)((char *)a1 + v14) = *(void **)((char *)a2 + v14);
  v18 = a3[9];
  *(void **)((char *)a1 + a3[8]) = *(void **)((char *)a2 + a3[8]);
  v19 = (uint64_t *)((char *)a1 + v18);
  v20 = *(uint64_t *)((char *)a2 + v18);
  v21 = *(unint64_t *)((char *)a2 + v18 + 8);
  swift_bridgeObjectRetain();
  sub_218E045AC(v20, v21);
  *v19 = v20;
  v19[1] = v21;
  v22 = a3[10];
  v23 = (uint64_t *)((char *)a1 + v22);
  v24 = (uint64_t *)((char *)a2 + v22);
  v25 = *v24;
  v26 = v24[1];
  sub_218E045AC(*v24, v26);
  *v23 = v25;
  v23[1] = v26;
  return a1;
}

void **sub_218E04798(void **a1, void **a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_218E0C53C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = a3[6];
  v14 = (void **)((char *)a1 + v13);
  v15 = (void **)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  *(void **)((char *)a1 + a3[8]) = *(void **)((char *)a2 + a3[8]);
  v16 = a3[9];
  v17 = (uint64_t *)((char *)a1 + v16);
  v18 = (uint64_t *)((char *)a2 + v16);
  v19 = *v18;
  v20 = v18[1];
  sub_218E045AC(*v18, v20);
  v21 = *v17;
  v22 = v17[1];
  *v17 = v19;
  v17[1] = v20;
  sub_218E04670(v21, v22);
  v23 = a3[10];
  v24 = (uint64_t *)((char *)a1 + v23);
  v25 = (uint64_t *)((char *)a2 + v23);
  v26 = *v25;
  v27 = v25[1];
  sub_218E045AC(*v25, v27);
  v28 = *v24;
  v29 = v24[1];
  *v24 = v26;
  v24[1] = v27;
  sub_218E04670(v28, v29);
  return a1;
}

_QWORD *sub_218E048A4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_218E0C53C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  v11 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  return a1;
}

void **sub_218E04944(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v6 = *a1;
  *a1 = *a2;

  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_218E0C53C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (void **)((char *)a1 + v11);
  v13 = (uint64_t *)((char *)a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[8];
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  *(void **)((char *)a1 + v16) = *(void **)((char *)a2 + v16);
  v17 = a3[9];
  v18 = *(uint64_t *)((char *)a1 + v17);
  v19 = *(unint64_t *)((char *)a1 + v17 + 8);
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  sub_218E04670(v18, v19);
  v20 = a3[10];
  v21 = *(uint64_t *)((char *)a1 + v20);
  v22 = *(unint64_t *)((char *)a1 + v20 + 8);
  *(_OWORD *)((char *)a1 + v20) = *(_OWORD *)((char *)a2 + v20);
  sub_218E04670(v21, v22);
  return a1;
}

uint64_t sub_218E04A18()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_218E04A24(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_218E0C53C();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_218E04AA0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_218E04AAC(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_218E0C53C();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PersistedThumbnail()
{
  uint64_t result;

  result = qword_255019BA8;
  if (!qword_255019BA8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_218E04B5C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_218E0C53C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_218E04BFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255019BF8;
  if (!qword_255019BF8)
  {
    v1 = type metadata accessor for ThumbnailKey();
    result = MEMORY[0x219A240B4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_255019BF8);
  }
  return result;
}

uint64_t sub_218E04C44()
{
  uint64_t result;

  sub_218E0C44C();
  swift_allocObject();
  result = sub_218E0C440();
  qword_25501B1A0 = result;
  return result;
}

id sub_218E04C84@<X0>(void **a1@<X8>)
{
  void **v1;
  void *v2;

  v2 = *v1;
  *a1 = *v1;
  return v2;
}

void sub_218E04C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_218E04CF0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x218E04ED4);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_218E04EF8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_218E04F54()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_218E04C90((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_218E04670(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_218E0511C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_218E0C458();
  v11 = result;
  if (result)
  {
    result = sub_218E0C470();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_218E0C464();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_218E04C90(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_218E051D0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_218E05214()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_218E05248 + *((int *)qword_218E05308 + (v0 >> 62))))();
}

uint64_t sub_218E05258@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_218E045AC(v2, v1);
      sub_218E04EF8(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

void sub_218E05318(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  char v11;

  sub_218E0542C();
  if ((sub_218E0C62C() & 1) == 0)
    return;
  v4 = (int *)type metadata accessor for PersistedThumbnail();
  if ((sub_218E0C530() & 1) == 0)
    return;
  v5 = v4[6];
  v6 = (_QWORD *)(a1 + v5);
  v7 = *(_QWORD *)(a1 + v5 + 8);
  v8 = (_QWORD *)(a2 + v5);
  v9 = v8[1];
  if (!v7)
  {
    if (v9)
      return;
    goto LABEL_12;
  }
  if (v9)
  {
    v10 = *v6 == *v8 && v7 == v9;
    if (v10 || (sub_218E0C788() & 1) != 0)
    {
LABEL_12:
      if (*(double *)(a1 + v4[7]) == *(double *)(a2 + v4[7]) && *(_QWORD *)(a1 + v4[8]) == *(_QWORD *)(a2 + v4[8]))
      {
        sub_218E051D0(*(_QWORD *)(a1 + v4[9]), *(_QWORD *)(a1 + v4[9] + 8));
        if ((v11 & 1) != 0)
          sub_218E051D0(*(_QWORD *)(a1 + v4[10]), *(_QWORD *)(a1 + v4[10] + 8));
      }
    }
  }
}

unint64_t sub_218E0542C()
{
  unint64_t result;

  result = qword_255019C00;
  if (!qword_255019C00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255019C00);
  }
  return result;
}

uint64_t sub_218E05468()
{
  uint64_t v0;

  v0 = sub_218E0C578();
  __swift_allocate_value_buffer(v0, qword_255019C08);
  __swift_project_value_buffer(v0, (uint64_t)qword_255019C08);
  type metadata accessor for PersistedThumbnailCache();
  __swift_instantiateConcreteTypeFromMangledName(qword_255019C38);
  sub_218E0C5E4();
  return sub_218E0C56C();
}

uint64_t sub_218E054FC(char a1)
{
  return qword_218E0D7B8[a1];
}

uint64_t sub_218E0551C(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D10);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_218E068D0();
  sub_218E0C83C();
  v12 = *v3;
  HIBYTE(v11) = 0;
  type metadata accessor for ThumbnailKey();
  sub_218E02BEC(&qword_255019D18, (uint64_t (*)(uint64_t))type metadata accessor for ThumbnailKey, (uint64_t)&protocol conformance descriptor for ThumbnailKey);
  sub_218E0C764();
  if (!v2)
  {
    v9 = type metadata accessor for PersistedThumbnailCache.ThumbnailDescription();
    LOBYTE(v12) = 1;
    sub_218E0C53C();
    sub_218E02BEC(&qword_255019D20, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_218E0C764();
    LOBYTE(v12) = 2;
    sub_218E0C740();
    v12 = *(uint64_t *)((char *)v3 + *(int *)(v9 + 28));
    HIBYTE(v11) = 3;
    sub_218E0699C();
    sub_218E0C764();
    LOBYTE(v12) = 4;
    sub_218E0C758();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_218E0574C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v23 = a2;
  v24 = sub_218E0C53C();
  v3 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019CE8);
  v6 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for PersistedThumbnailCache.ThumbnailDescription();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = (_QWORD *)((char *)v12 + *(int *)(v10 + 24));
  *v13 = 0;
  v13[1] = 0;
  v27 = a1;
  v28 = v13;
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_218E068D0();
  v25 = v8;
  v14 = v29;
  sub_218E0C830();
  if (v14)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v29 = v6;
    v15 = (uint64_t)v12;
    v16 = v3;
    v17 = v24;
    type metadata accessor for ThumbnailKey();
    v30 = 0;
    sub_218E02BEC(&qword_255019CF8, (uint64_t (*)(uint64_t))type metadata accessor for ThumbnailKey, (uint64_t)&protocol conformance descriptor for ThumbnailKey);
    v18 = v25;
    sub_218E0C734();
    *v12 = v31;
    LOBYTE(v31) = 1;
    sub_218E02BEC(&qword_255019D00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_218E0C734();
    v19 = v28;
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v15 + v9[5], v5, v17);
    LOBYTE(v31) = 2;
    *v19 = sub_218E0C710();
    v19[1] = v20;
    v30 = 3;
    sub_218E06914();
    sub_218E0C734();
    *(_QWORD *)(v15 + v9[7]) = v31;
    LOBYTE(v31) = 4;
    v21 = sub_218E0C728();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v18, v26);
    *(_QWORD *)(v15 + v9[8]) = v21;
    sub_218E06958(v15, v23);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
    return sub_218E0629C(v15);
  }
}

uint64_t sub_218E05ADC()
{
  char *v0;

  return sub_218E054FC(*v0);
}

uint64_t sub_218E05AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_218E06C14(a1, a2);
  *a3 = result;
  return result;
}

void sub_218E05B08(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_218E05B14()
{
  sub_218E068D0();
  return sub_218E0C848();
}

uint64_t sub_218E05B3C()
{
  sub_218E068D0();
  return sub_218E0C854();
}

uint64_t sub_218E05B64@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_218E0574C(a1, a2);
}

uint64_t sub_218E05B78(_QWORD *a1)
{
  return sub_218E0551C(a1);
}

void sub_218E05B8C(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  void **v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  char *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  _QWORD *v45;
  id v46;
  _QWORD *v47;
  uint64_t v48;
  unint64_t v49;
  os_log_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  char *v65;
  int *v66;
  uint64_t *v67;
  uint64_t *v68;
  unint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  id v78;
  char *v79;
  uint64_t v80;
  os_log_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v77 = a2;
  v3 = sub_218E0C428();
  v4 = *(NSObject **)(v3 - 8);
  v80 = v3;
  v81 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v79 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_218E0C53C();
  v6 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PersistedThumbnailCache.ThumbnailDescription();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (void **)((char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = sub_218E0C50C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v71 - v17;
  v78 = a1;
  sub_218E0173C((uint64_t)&v71 - v17);
  v19 = v82;
  v20 = sub_218E0C518();
  v82 = v19;
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    v22 = (void *)v82;
  }
  else
  {
    v73 = v16;
    v74 = v21;
    v75 = v20;
    v71 = v6;
    v72 = v12;
    v23 = v12;
    v24 = *(void (**)(char *, uint64_t))(v13 + 8);
    v24(v18, v23);
    if (qword_2550199A0 != -1)
      swift_once();
    sub_218E02BEC(&qword_255019C30, (uint64_t (*)(uint64_t))type metadata accessor for PersistedThumbnailCache.ThumbnailDescription, (uint64_t)&unk_218E0D674);
    v25 = v11;
    v26 = v74;
    v27 = v75;
    v28 = (void *)v82;
    sub_218E0C434();
    v22 = v28;
    if (!v28)
    {
      v29 = v8;
      v82 = *(uint64_t *)((char *)v25 + *(int *)(v9 + 32));
      v30 = (uint64_t)v73;
      sub_218E01754((uint64_t)v73);
      v31 = sub_218E0C518();
      v53 = v52;
      v54 = (int *)v9;
      v81 = v31;
      v24((char *)v30, v72);
      v55 = (uint64_t)v25;
      v56 = *v25;
      v57 = v71;
      v58 = v76;
      (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v29, v55 + v54[5], v76);
      v59 = v54[7];
      v60 = (uint64_t *)(v55 + v54[6]);
      v80 = *v60;
      v61 = v29;
      v62 = v60[1];
      v63 = *(_QWORD *)(v55 + v59);
      swift_bridgeObjectRetain();
      v64 = v56;
      sub_218E0629C(v55);
      v65 = v77;
      *(_QWORD *)v77 = v64;
      v66 = (int *)type metadata accessor for PersistedThumbnail();
      (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v65[v66[5]], v61, v58);
      v67 = (uint64_t *)&v65[v66[6]];
      *v67 = v80;
      v67[1] = v62;
      *(_QWORD *)&v65[v66[7]] = v63;
      *(_QWORD *)&v65[v66[8]] = v82;
      v68 = (uint64_t *)&v65[v66[9]];
      v69 = v74;
      *v68 = v75;
      v68[1] = v69;
      v70 = &v65[v66[10]];
      *(_QWORD *)v70 = v81;
      *((_QWORD *)v70 + 1) = v53;
      (*(void (**)(char *, _QWORD, uint64_t, int *))(*((_QWORD *)v66 - 1) + 56))(v65, 0, 1, v66);
      return;
    }
    sub_218E04670(v27, v26);
  }
  v32 = v22;
  v33 = v79;
  sub_218E0C41C();
  sub_218E02BEC(&qword_255019C20, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAEB0], MEMORY[0x24BDCAEA8]);
  v34 = v80;
  v35 = sub_218E0C47C();

  ((void (*)(char *, uint64_t))v81[1].isa)(v33, v34);
  if ((v35 & 1) != 0)
  {
    v36 = type metadata accessor for PersistedThumbnail();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v77, 1, 1, v36);

  }
  else
  {
    if (qword_2550199A8 != -1)
      swift_once();
    v37 = sub_218E0C578();
    __swift_project_value_buffer(v37, (uint64_t)qword_255019C08);
    v38 = v22;
    v39 = v78;
    v40 = v22;
    v41 = v39;
    v42 = sub_218E0C560();
    v43 = sub_218E0C620();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = swift_slowAlloc();
      v45 = (_QWORD *)swift_slowAlloc();
      v82 = swift_slowAlloc();
      v83 = (uint64_t)v41;
      v84 = v82;
      *(_DWORD *)v44 = 138412546;
      v81 = v42;
      v46 = v41;
      sub_218E0C650();
      v47 = v45;
      *v45 = v41;

      *(_WORD *)(v44 + 12) = 2080;
      swift_getErrorValue();
      v48 = sub_218E0C7AC();
      v83 = sub_218E0A294(v48, v49, &v84);
      sub_218E0C650();
      swift_bridgeObjectRelease();

      v50 = v81;
      _os_log_impl(&dword_218DFE000, v81, v43, "Cannot retrieve persisted thumbnail {key: %@, error: %s}", (uint8_t *)v44, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255019C28);
      swift_arrayDestroy();
      MEMORY[0x219A24120](v47, -1, -1);
      v51 = v82;
      swift_arrayDestroy();
      MEMORY[0x219A24120](v51, -1, -1);
      MEMORY[0x219A24120](v44, -1, -1);

    }
    else
    {

    }
    swift_willThrow();
  }
}

uint64_t sub_218E06204()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PersistedThumbnailCache()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PersistedThumbnailCache.ThumbnailDescription()
{
  uint64_t result;

  result = qword_255019C98;
  if (!qword_255019C98)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_218E0629C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PersistedThumbnailCache.ThumbnailDescription();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void **sub_218E06318(void **a1, void **a2, int *a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_218E0C53C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v13 = v4;
    v12(v9, v10, v11);
    v14 = a3[6];
    v15 = a3[7];
    v16 = (void **)((char *)v7 + v14);
    v17 = (void **)((char *)a2 + v14);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    *(void **)((char *)v7 + v15) = *(void **)((char *)a2 + v15);
    *(void **)((char *)v7 + a3[8]) = *(void **)((char *)a2 + a3[8]);
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t sub_218E063E8(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_218E0C53C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

void **sub_218E06448(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v6 = *a2;
  *a1 = *a2;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_218E0C53C();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v12 = v6;
  v11(v8, v9, v10);
  v13 = a3[6];
  v14 = a3[7];
  v15 = (void **)((char *)a1 + v13);
  v16 = (void **)((char *)a2 + v13);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  *(void **)((char *)a1 + v14) = *(void **)((char *)a2 + v14);
  *(void **)((char *)a1 + a3[8]) = *(void **)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  return a1;
}

void **sub_218E064F0(void **a1, void **a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_218E0C53C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = a3[6];
  v14 = (void **)((char *)a1 + v13);
  v15 = (void **)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  *(void **)((char *)a1 + a3[8]) = *(void **)((char *)a2 + a3[8]);
  return a1;
}

_QWORD *sub_218E065AC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_218E0C53C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  return a1;
}

void **sub_218E06638(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *a1;
  *a1 = *a2;

  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_218E0C53C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (void **)((char *)a1 + v11);
  v13 = (uint64_t *)((char *)a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[8];
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  *(void **)((char *)a1 + v16) = *(void **)((char *)a2 + v16);
  return a1;
}

uint64_t sub_218E066DC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_218E066E8(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_218E0C53C();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_218E06764()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_218E06770(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_218E0C53C();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_218E067E4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_218E0C53C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_218E06874(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_218E02BEC(&qword_255019C30, (uint64_t (*)(uint64_t))type metadata accessor for PersistedThumbnailCache.ThumbnailDescription, (uint64_t)&unk_218E0D674);
  result = sub_218E02BEC(&qword_255019CE0, (uint64_t (*)(uint64_t))type metadata accessor for PersistedThumbnailCache.ThumbnailDescription, (uint64_t)&unk_218E0D630);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_218E068D0()
{
  unint64_t result;

  result = qword_255019CF0;
  if (!qword_255019CF0)
  {
    result = MEMORY[0x219A240B4](&unk_218E0D760, &type metadata for PersistedThumbnailCache.ThumbnailDescription.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255019CF0);
  }
  return result;
}

unint64_t sub_218E06914()
{
  unint64_t result;

  result = qword_255019D08;
  if (!qword_255019D08)
  {
    result = MEMORY[0x219A240B4](MEMORY[0x24BEE50E8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_255019D08);
  }
  return result;
}

uint64_t sub_218E06958(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PersistedThumbnailCache.ThumbnailDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_218E0699C()
{
  unint64_t result;

  result = qword_255019D28;
  if (!qword_255019D28)
  {
    result = MEMORY[0x219A240B4](MEMORY[0x24BEE50C0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_255019D28);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PersistedThumbnailCache.ThumbnailDescription.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PersistedThumbnailCache.ThumbnailDescription.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_218E06ABC + 4 * byte_218E0D5C5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_218E06AF0 + 4 * byte_218E0D5C0[v4]))();
}

uint64_t sub_218E06AF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_218E06AF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x218E06B00);
  return result;
}

uint64_t sub_218E06B0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x218E06B14);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_218E06B18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_218E06B20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PersistedThumbnailCache.ThumbnailDescription.CodingKeys()
{
  return &type metadata for PersistedThumbnailCache.ThumbnailDescription.CodingKeys;
}

unint64_t sub_218E06B40()
{
  unint64_t result;

  result = qword_255019D30;
  if (!qword_255019D30)
  {
    result = MEMORY[0x219A240B4](&unk_218E0D738, &type metadata for PersistedThumbnailCache.ThumbnailDescription.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255019D30);
  }
  return result;
}

unint64_t sub_218E06B88()
{
  unint64_t result;

  result = qword_255019D38;
  if (!qword_255019D38)
  {
    result = MEMORY[0x219A240B4](&unk_218E0D6A8, &type metadata for PersistedThumbnailCache.ThumbnailDescription.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255019D38);
  }
  return result;
}

unint64_t sub_218E06BD0()
{
  unint64_t result;

  result = qword_255019D40;
  if (!qword_255019D40)
  {
    result = MEMORY[0x219A240B4](&unk_218E0D6D0, &type metadata for PersistedThumbnailCache.ThumbnailDescription.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255019D40);
  }
  return result;
}

uint64_t sub_218E06C14(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v3 || (sub_218E0C788() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144 || (sub_218E0C788() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_218E0C788() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C616373 && a2 == 0xE500000000000000 || (sub_218E0C788() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E61726165707061 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_218E0C788();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_218E06E08()
{
  uint64_t v0;

  v0 = sub_218E0C578();
  __swift_allocate_value_buffer(v0, qword_255019D48);
  __swift_project_value_buffer(v0, (uint64_t)qword_255019D48);
  type metadata accessor for NotePreviewProvider();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255019E50);
  sub_218E0C5E4();
  return sub_218E0C56C();
}

id sub_218E06E9C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NotePreviewProvider()), sel_init);
  qword_253F1F8A8 = (uint64_t)result;
  return result;
}

id NotePreviewProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static NotePreviewProvider.shared.getter()
{
  if (qword_253F1F8B0 != -1)
    swift_once();
  return (id)qword_253F1F8A8;
}

void sub_218E06F68()
{
  uint64_t inited;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;

  sub_218E0C5D8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255019E40);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_218E0D810;
  *(_QWORD *)(inited + 32) = sub_218E0C5D8();
  *(_QWORD *)(inited + 40) = v1;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0xD00000000000001BLL;
  *(_QWORD *)(inited + 56) = 0x8000000218E0DF30;
  sub_218E0B248(inited);
  v2 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v3 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_218E0C584();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithDomain_code_userInfo_, v3, 1, v4);

  qword_255019D60 = (uint64_t)v5;
}

void sub_218E070A0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v10) = 0;
  v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ThumbnailKey()), sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 4, 0, 0, a1, 0, 0, 0.0, 0.0, 1.0, v10);
  sub_218E05B8C(v8, v7);
  if (v2)
  {
LABEL_6:

    return;
  }
  v9 = type metadata accessor for PersistedThumbnail();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v7, 1, v9) == 1)
  {
    sub_218E0AEC8((uint64_t)v7, &qword_255019D70);
    if (qword_2550199B8 != -1)
      swift_once();
    (id)qword_255019D60;
    swift_willThrow();
    goto LABEL_6;
  }

  sub_218E0B18C((uint64_t)v7, a2);
}

void sub_218E0720C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PersistedThumbnail();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v20 = (uint64_t)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255019988 != -1)
    swift_once();
  v10 = objc_allocWithZone((Class)type metadata accessor for ThumbnailKey());
  swift_bridgeObjectRetain();
  v11 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  LODWORD(v18) = 0;
  v12 = objc_msgSend(v10, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 4, 0, v11, a1, 0, 0, 0.0, 0.0, 1.0, v18);

  sub_218E05B8C(v12, v6);
  if (v2)
    goto LABEL_10;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_218E0AEC8((uint64_t)v6, &qword_255019D70);
    if (qword_2550199B0 != -1)
      swift_once();
    v13 = sub_218E0C578();
    __swift_project_value_buffer(v13, (uint64_t)qword_255019D48);
    v14 = sub_218E0C560();
    v15 = sub_218E0C614();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_218DFE000, v14, v15, "Cannot retrieve recent chrome thumbnail — falling back to default chrome thumbnail", v16, 2u);
      MEMORY[0x219A24120](v16, -1, -1);
    }

    sub_218E070A0(a1, v21);
LABEL_10:

    return;
  }

  v17 = v20;
  sub_218E0B18C((uint64_t)v6, v20);
  sub_218E0B18C(v17, v21);
}

void sub_218E074B8(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v37 = a6;
  v7 = v6;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (_QWORD *)type metadata accessor for PersistedThumbnail();
  v35 = *(v16 - 1);
  v36 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v34 = (char *)v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_allocWithZone((Class)type metadata accessor for ThumbnailKey());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v32 = a1;
  v19 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  v33 = a3;
  v20 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  LODWORD(v30) = 0;
  v21 = objc_msgSend(v18, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 4, v19, v20, a5, 0, 0, 0.0, 0.0, 1.0, v30);

  v22 = v21;
  v23 = v38;
  sub_218E05B8C(v21, v15);
  if (v23)
  {

  }
  else
  {
    v24 = (uint64_t)v34;
    v38 = a5;
    v31[1] = v7;
    if ((*(unsigned int (**)(char *, uint64_t, id))(v35 + 48))(v15, 1, v36) == 1)
    {
      v36 = v22;
      sub_218E0AEC8((uint64_t)v15, &qword_255019D70);
      if (qword_2550199B0 != -1)
        swift_once();
      v25 = sub_218E0C578();
      __swift_project_value_buffer(v25, (uint64_t)qword_255019D48);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v26 = sub_218E0C560();
      v27 = sub_218E0C614();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = swift_slowAlloc();
        v29 = swift_slowAlloc();
        v40 = v29;
        *(_DWORD *)v28 = 136315394;
        swift_bridgeObjectRetain();
        v39 = sub_218E0A294(v32, a2, &v40);
        sub_218E0C650();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v28 + 12) = 2080;
        swift_bridgeObjectRetain();
        v39 = sub_218E0A294(v33, a4, &v40);
        sub_218E0C650();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_218DFE000, v26, v27, "Cannot retrieve chrome thumbnail — falling back to default chrome thumbnail {accountId: %s, noteId: %s}", (uint8_t *)v28, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x219A24120](v29, -1, -1);
        MEMORY[0x219A24120](v28, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      sub_218E070A0(v38, v37);

    }
    else
    {

      sub_218E0B18C((uint64_t)v15, v24);
      sub_218E0B18C(v24, v37);
    }
  }
}

void sub_218E07898(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v10) = 0;
  v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ThumbnailKey()), sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 7, 0, 0, a1, 0, 0, 0.0, 0.0, 1.0, v10);
  sub_218E05B8C(v8, v7);
  if (v2)
  {
LABEL_6:

    return;
  }
  v9 = type metadata accessor for PersistedThumbnail();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v7, 1, v9) == 1)
  {
    sub_218E0AEC8((uint64_t)v7, &qword_255019D70);
    if (qword_2550199B8 != -1)
      swift_once();
    (id)qword_255019D60;
    swift_willThrow();
    goto LABEL_6;
  }

  sub_218E0B18C((uint64_t)v7, a2);
}

void sub_218E07A04(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PersistedThumbnail();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v20 = (uint64_t)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255019988 != -1)
    swift_once();
  v10 = objc_allocWithZone((Class)type metadata accessor for ThumbnailKey());
  swift_bridgeObjectRetain();
  v11 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  LODWORD(v18) = 0;
  v12 = objc_msgSend(v10, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 7, 0, v11, a1, 0, 0, 0.0, 0.0, 1.0, v18);

  sub_218E05B8C(v12, v6);
  if (v2)
    goto LABEL_10;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_218E0AEC8((uint64_t)v6, &qword_255019D70);
    if (qword_2550199B0 != -1)
      swift_once();
    v13 = sub_218E0C578();
    __swift_project_value_buffer(v13, (uint64_t)qword_255019D48);
    v14 = sub_218E0C560();
    v15 = sub_218E0C614();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_218DFE000, v14, v15, "Cannot retrieve recent preview thumbnail — falling back to default preview thumbnail", v16, 2u);
      MEMORY[0x219A24120](v16, -1, -1);
    }

    sub_218E07898(a1, v21);
LABEL_10:

    return;
  }

  v17 = v20;
  sub_218E0B18C((uint64_t)v6, v20);
  sub_218E0B18C(v17, v21);
}

void sub_218E07CB0(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v37 = a6;
  v7 = v6;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (_QWORD *)type metadata accessor for PersistedThumbnail();
  v35 = *(v16 - 1);
  v36 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v34 = (char *)v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_allocWithZone((Class)type metadata accessor for ThumbnailKey());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v32 = a1;
  v19 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  v33 = a3;
  v20 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  LODWORD(v30) = 0;
  v21 = objc_msgSend(v18, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 7, v19, v20, a5, 0, 0, 0.0, 0.0, 1.0, v30);

  v22 = v21;
  v23 = v38;
  sub_218E05B8C(v21, v15);
  if (v23)
  {

  }
  else
  {
    v24 = (uint64_t)v34;
    v38 = a5;
    v31[1] = v7;
    if ((*(unsigned int (**)(char *, uint64_t, id))(v35 + 48))(v15, 1, v36) == 1)
    {
      v36 = v22;
      sub_218E0AEC8((uint64_t)v15, &qword_255019D70);
      if (qword_2550199B0 != -1)
        swift_once();
      v25 = sub_218E0C578();
      __swift_project_value_buffer(v25, (uint64_t)qword_255019D48);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v26 = sub_218E0C560();
      v27 = sub_218E0C614();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = swift_slowAlloc();
        v29 = swift_slowAlloc();
        v40 = v29;
        *(_DWORD *)v28 = 136315394;
        swift_bridgeObjectRetain();
        v39 = sub_218E0A294(v32, a2, &v40);
        sub_218E0C650();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v28 + 12) = 2080;
        swift_bridgeObjectRetain();
        v39 = sub_218E0A294(v33, a4, &v40);
        sub_218E0C650();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_218DFE000, v26, v27, "Cannot retrieve preview thumbnail — falling back to default preview thumbnail {accountId: %s, noteId: %s}", (uint8_t *)v28, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x219A24120](v29, -1, -1);
        MEMORY[0x219A24120](v28, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      sub_218E07898(v38, v37);

    }
    else
    {

      sub_218E0B18C((uint64_t)v15, v24);
      sub_218E0B18C(v24, v37);
    }
  }
}

void NotePreviewProvider.defaultPreview()(_QWORD *a1@<X8>)
{
  sub_218E080E8((void (*)(uint64_t))sub_218E070A0, (void (*)(uint64_t))sub_218E07898, "Cannot retrieve default note preview {error: %s}", a1);
}

void NotePreviewProvider.recentPreview()(_QWORD *a1@<X8>)
{
  sub_218E080E8((void (*)(uint64_t))sub_218E0720C, (void (*)(uint64_t))sub_218E07A04, "Cannot retrieve recent note preview {error: %s}", a1);
}

void sub_218E080E8(void (*a1)(uint64_t)@<X0>, void (*a2)(uint64_t)@<X1>, const char *a3@<X2>, _QWORD *a4@<X8>)
{
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, _QWORD, uint64_t, uint64_t);
  _QWORD *v20;
  void (*v21)(uint64_t);
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  _QWORD *v36;
  void (*v37)(uint64_t);
  const char *v38;
  uint64_t v39;
  id v40;

  v37 = a2;
  v38 = a3;
  v36 = a4;
  v6 = type metadata accessor for PersistedThumbnail();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v34 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v34 - v17;
  a1(0);
  if (v4)
  {
    v40 = v4;
    v23 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255019D78);
    type metadata accessor for NotePreviewProviderErrors(0);
    if (swift_dynamicCast())
    {

      swift_willThrow();
      v24 = v40;
    }
    else
    {

      if (qword_2550199B0 != -1)
        swift_once();
      v25 = sub_218E0C578();
      __swift_project_value_buffer(v25, (uint64_t)qword_255019D48);
      v26 = v4;
      v27 = v4;
      v28 = sub_218E0C560();
      v29 = sub_218E0C620();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        v31 = (void *)swift_slowAlloc();
        v40 = v31;
        *(_DWORD *)v30 = 136315138;
        swift_getErrorValue();
        v32 = sub_218E0C7AC();
        v39 = sub_218E0A294(v32, v33, (uint64_t *)&v40);
        sub_218E0C650();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_218DFE000, v28, v29, v38, v30, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x219A24120](v31, -1, -1);
        MEMORY[0x219A24120](v30, -1, -1);
      }
      else
      {

      }
      sub_218E0AD00();
      swift_willThrow();
      v24 = v4;
    }

  }
  else
  {
    v35 = v13;
    v19 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
    v19(v18, 0, 1, v6);
    a1(1);
    v19(v16, 0, 1, v6);
    v20 = v9;
    v21 = v37;
    v37(0);
    v22 = (uint64_t)v35;
    v21(1);
    v19((char *)v22, 0, 1, v6);
    sub_218E0B4A8((uint64_t)v18, (uint64_t)v16, v20, v22, v36);
  }
}

void NotePreviewProvider.preview(accountId:noteId:prefersDefaultFallback:)(uint64_t a1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char a4@<W4>, _QWORD *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  void (*v41)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  void (*v46)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v47;
  char *v48;
  unint64_t v49;
  id v50;
  int v51;
  uint64_t v52;
  void *v53;
  void (*v54)(_QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  unint64_t v62;
  id v63;
  NSObject *v64;
  os_log_type_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  void (*v74)(_QWORD, _QWORD, _QWORD, _QWORD);
  void (*v75)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  void *v77;
  unint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  void (*v94)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v95;
  _OWORD v96[2];
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v95 = a1;
  v91 = a2;
  v88 = a5;
  v93 = sub_218E0C578();
  v89 = *(_QWORD *)(v93 - 8);
  MEMORY[0x24BDAC7A8](v93);
  v92 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = type metadata accessor for PersistedThumbnail();
  v8 = *(_QWORD *)(v87 - 8);
  v9 = MEMORY[0x24BDAC7A8](v87);
  v86 = (uint64_t *)((char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v82 - v11);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v82 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v82 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v82 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v29 = (char *)&v82 - v28;
  v90 = v25;
  if (!v25)
    goto LABEL_12;
  v30 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000) == 0)
    v30 = v95 & 0xFFFFFFFFFFFFLL;
  if (!v30 || !a3)
    goto LABEL_12;
  v31 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v31 = v91 & 0xFFFFFFFFFFFFLL;
  if (!v31)
  {
LABEL_12:
    v38 = a3;
    if (qword_2550199B0 != -1)
      swift_once();
    v40 = v93;
    __swift_project_value_buffer(v93, (uint64_t)qword_255019D48);
    v43 = sub_218E0C560();
    v44 = sub_218E0C614();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v45 = 67109120;
      LODWORD(v96[0]) = a4 & 1;
      sub_218E0C650();
      _os_log_impl(&dword_218DFE000, v43, v44, "Cannot retrieve identifier — falling back to recent or default preview {prefersDefaultFallback: %{BOOL}d}", v45, 8u);
      MEMORY[0x219A24120](v45, -1, -1);
    }

    if ((a4 & 1) != 0)
    {
      v46 = v94;
      NotePreviewProvider.defaultPreview()(v96);
      v47 = v46;
      if (v46)
      {
LABEL_18:
        v39 = v47;
LABEL_19:
        v48 = v92;
        v49 = v38;
        goto LABEL_20;
      }
    }
    else
    {
      v54 = v94;
      NotePreviewProvider.recentPreview()(v96);
      v47 = v54;
      if (v54)
        goto LABEL_18;
    }
    v55 = v96[1];
    v56 = v97;
    v57 = v98;
    v58 = v88;
    *(_OWORD *)v88 = v96[0];
    *((_OWORD *)v58 + 1) = v55;
    v58[4] = v56;
    v58[5] = v57;
    return;
  }
  v83 = v27;
  v84 = v26;
  v85 = a3;
  v32 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v33 = objc_msgSend(v32, sel_userInterfaceIdiom);

  if (v33)
  {
    v34 = v94;
    v35 = v95;
    v37 = v90;
    v36 = v91;
    v38 = v85;
    sub_218E074B8(v95, v90, v91, v85, 0, (uint64_t)v18);
    v39 = v34;
    v40 = v93;
    if (!v34)
    {
      v41 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v8 + 56);
      v42 = v87;
      v94 = v41;
      v41(v18, 0, 1, v87);
      sub_218E074B8(v35, v37, v36, v38, 1, v84);
      v94(v84, 0, 1, v42);
      v80 = v86;
      sub_218E07CB0(v35, v37, v91, v38, 0, (uint64_t)v86);
      sub_218E07CB0(v35, v37, v91, v38, 1, v83);
      v81 = v83;
      v94(v83, 0, 1, v87);
      sub_218E0B4A8((uint64_t)v18, v84, v80, v81, v88);
      return;
    }
    goto LABEL_19;
  }
  v75 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v76 = v87;
  v75(v29, 1, 1, v87);
  v75(v24, 1, 1, v76);
  v77 = v94;
  v78 = v90;
  v79 = v91;
  sub_218E07CB0(v95, v90, v91, v85, 0, (uint64_t)v12);
  v39 = v77;
  if (!v77)
  {
    sub_218E07CB0(v95, v78, v79, v85, 1, (uint64_t)v21);
    v75(v21, 0, 1, v87);
    sub_218E0B4A8((uint64_t)v29, (uint64_t)v24, v12, (uint64_t)v21, v88);
    return;
  }
  sub_218E0AEC8((uint64_t)v24, &qword_255019D70);
  sub_218E0AEC8((uint64_t)v29, &qword_255019D70);
  v48 = v92;
  v40 = v93;
  v49 = v85;
LABEL_20:
  *(_QWORD *)&v96[0] = v39;
  v50 = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255019D78);
  type metadata accessor for NotePreviewProviderErrors(0);
  v51 = swift_dynamicCast();
  v52 = v95;
  if (v51)
  {

    swift_willThrow();
    v53 = *(void **)&v96[0];
  }
  else
  {

    if (qword_2550199B0 != -1)
      swift_once();
    v59 = __swift_project_value_buffer(v40, (uint64_t)qword_255019D48);
    v60 = v89;
    (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v48, v59, v40);
    v61 = v39;
    swift_bridgeObjectRetain();
    v62 = v90;
    swift_bridgeObjectRetain();
    v63 = v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v64 = sub_218E0C560();
    v65 = sub_218E0C620();
    v66 = v65;
    if (os_log_type_enabled(v64, v65))
    {
      v67 = swift_slowAlloc();
      v94 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD))swift_slowAlloc();
      *(_QWORD *)&v96[0] = v94;
      *(_DWORD *)v67 = 136315650;
      if (v62)
        v68 = v52;
      else
        v68 = 9732322;
      LODWORD(v95) = v66;
      if (v62)
        v69 = v62;
      else
        v69 = 0xA300000000000000;
      swift_bridgeObjectRetain();
      v99 = sub_218E0A294(v68, v69, (uint64_t *)v96);
      sub_218E0C650();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v67 + 12) = 2080;
      if (v49)
        v70 = v91;
      else
        v70 = 9732322;
      if (v49)
        v71 = v49;
      else
        v71 = 0xA300000000000000;
      swift_bridgeObjectRetain();
      v99 = sub_218E0A294(v70, v71, (uint64_t *)v96);
      sub_218E0C650();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v67 + 22) = 2080;
      swift_getErrorValue();
      v72 = sub_218E0C7AC();
      v99 = sub_218E0A294(v72, v73, (uint64_t *)v96);
      sub_218E0C650();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_218DFE000, v64, (os_log_type_t)v95, "Cannot retrieve note preview {accountId: %s, noteId: %s, error: %s}", (uint8_t *)v67, 0x20u);
      v74 = v94;
      swift_arrayDestroy();
      MEMORY[0x219A24120](v74, -1, -1);
      MEMORY[0x219A24120](v67, -1, -1);

      (*(void (**)(char *, uint64_t))(v89 + 8))(v92, v40);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v60 + 8))(v48, v40);
    }
    sub_218E0AD00();
    swift_willThrow();
    v53 = v39;
  }

}

void NotePreviewProvider.preview(for:)(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  int v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  char v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  _QWORD *v42;
  id v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  NSObject *log;
  void *v48;
  void *v49;
  id v50[5];
  char v51;
  __int128 v52;
  __int128 v53;

  v4 = objc_msgSend(a1, sel_userInfo);
  if (!v4)
  {
    v52 = 0u;
    v53 = 0u;
LABEL_14:
    sub_218E0AEC8((uint64_t)&v52, &qword_2550199F0);
    v11 = 0;
    v12 = 0;
    goto LABEL_15;
  }
  v5 = v4;
  v6 = sub_218E0C590();

  *(_QWORD *)&v52 = sub_218E0C5D8();
  *((_QWORD *)&v52 + 1) = v7;
  sub_218E0C68C();
  if (*(_QWORD *)(v6 + 16) && (v8 = sub_218E0A938((uint64_t)v50), (v9 & 1) != 0))
  {
    sub_218E0AF80(*(_QWORD *)(v6 + 56) + 32 * v8, (uint64_t)&v52);
  }
  else
  {
    v52 = 0u;
    v53 = 0u;
  }
  sub_218E0AF4C((uint64_t)v50);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v53 + 1))
    goto LABEL_14;
  v10 = swift_dynamicCast();
  if (v10)
    v11 = v50[0];
  else
    v11 = 0;
  if (v10)
    v12 = v50[1];
  else
    v12 = 0;
LABEL_15:
  v13 = objc_msgSend(a1, sel_userInfo);
  if (!v13)
  {
    v52 = 0u;
    v53 = 0u;
LABEL_25:
    sub_218E0AEC8((uint64_t)&v52, &qword_2550199F0);
    v19 = 0;
    goto LABEL_26;
  }
  v14 = v13;
  v15 = sub_218E0C590();

  *(_QWORD *)&v52 = sub_218E0C5D8();
  *((_QWORD *)&v52 + 1) = v16;
  sub_218E0C68C();
  if (*(_QWORD *)(v15 + 16) && (v17 = sub_218E0A938((uint64_t)v50), (v18 & 1) != 0))
  {
    sub_218E0AF80(*(_QWORD *)(v15 + 56) + 32 * v17, (uint64_t)&v52);
  }
  else
  {
    v52 = 0u;
    v53 = 0u;
  }
  sub_218E0AF4C((uint64_t)v50);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v53 + 1))
    goto LABEL_25;
  if (swift_dynamicCast())
    v19 = v50[0];
  else
    v19 = 0;
LABEL_26:
  v20 = objc_msgSend(a1, sel_userInfo);
  if (!v20)
  {
    v52 = 0u;
    v53 = 0u;
LABEL_35:
    sub_218E0AEC8((uint64_t)&v52, &qword_2550199F0);
    goto LABEL_36;
  }
  v21 = v20;
  v22 = sub_218E0C590();

  *(_QWORD *)&v52 = sub_218E0C5D8();
  *((_QWORD *)&v52 + 1) = v23;
  sub_218E0C68C();
  if (*(_QWORD *)(v22 + 16) && (v24 = sub_218E0A938((uint64_t)v50), (v25 & 1) != 0))
  {
    sub_218E0AF80(*(_QWORD *)(v22 + 56) + 32 * v24, (uint64_t)&v52);
  }
  else
  {
    v52 = 0u;
    v53 = 0u;
  }
  sub_218E0AF4C((uint64_t)v50);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v53 + 1))
    goto LABEL_35;
  if (swift_dynamicCast())
  {
    v26 = (char)v50[0];
    goto LABEL_37;
  }
LABEL_36:
  v26 = 0;
LABEL_37:
  v27 = (void *)objc_opt_self();
  v28 = (void *)sub_218E0C5B4();
  v29 = objc_msgSend(v27, sel_objectForKey_, v28);

  if (v29)
  {
    sub_218E0C668();
    swift_unknownObjectRelease();
  }
  else
  {
    v52 = 0u;
    v53 = 0u;
  }
  sub_218E0AF04((uint64_t)&v52, (uint64_t)v50);
  if (v50[3])
  {
    if (swift_dynamicCast())
    {
      if ((v26 & 1) != 0)
      {
        v30 = 1;
        goto LABEL_49;
      }
      v30 = v51;
      goto LABEL_48;
    }
  }
  else
  {
    sub_218E0AEC8((uint64_t)v50, &qword_2550199F0);
  }
  v30 = 1;
  if ((v26 & 1) == 0)
LABEL_48:
    v30 ^= 1u;
LABEL_49:
  v31 = v48;
  NotePreviewProvider.preview(accountId:noteId:prefersDefaultFallback:)((uint64_t)v19, (uint64_t)v11, (unint64_t)v12, v30, a2);
  v32 = v48;
  if (v48)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50[0] = v48;
    v33 = v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255019D78);
    type metadata accessor for NotePreviewProviderErrors(0);
    if (swift_dynamicCast())
    {

      swift_willThrow();
    }
    else
    {

      if (qword_2550199B0 != -1)
        swift_once();
      v34 = sub_218E0C578();
      __swift_project_value_buffer(v34, (uint64_t)qword_255019D48);
      v35 = v48;
      v36 = a1;
      v37 = v48;
      v38 = v36;
      v39 = sub_218E0C560();
      v40 = sub_218E0C620();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = swift_slowAlloc();
        log = v39;
        v42 = (_QWORD *)swift_slowAlloc();
        v49 = (void *)swift_slowAlloc();
        v50[0] = v49;
        *(_DWORD *)v41 = 138412546;
        *(_QWORD *)&v52 = v38;
        v43 = v38;
        sub_218E0C650();
        v44 = v42;
        *v42 = v38;

        *(_WORD *)(v41 + 12) = 2080;
        swift_getErrorValue();
        v45 = sub_218E0C7AC();
        *(_QWORD *)&v52 = sub_218E0A294(v45, v46, (uint64_t *)v50);
        sub_218E0C650();
        swift_bridgeObjectRelease();

        v39 = log;
        _os_log_impl(&dword_218DFE000, log, v40, "Cannot retrieve note preview {userActivity: %@, error: %s}", (uint8_t *)v41, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255019C28);
        swift_arrayDestroy();
        MEMORY[0x219A24120](v44, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x219A24120](v49, -1, -1);
        MEMORY[0x219A24120](v41, -1, -1);
      }
      else
      {

      }
      sub_218E0AD00();
      swift_willThrow();

    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

unint64_t NotePreviewProvider.__previewDictionary(for:)(void *a1)
{
  unint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  NotePreviewProvider.preview(for:)(a1, v6);
  if (!v2)
  {
    v3 = (void *)v6[4];
    v4 = (void *)v6[5];
    v1 = sub_218E0BC90();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  return v1;
}

id NotePreviewProvider.init()()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  void *v3;
  char *v4;
  id v5;
  uint64_t v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = OBJC_IVAR___NPNotePreviewProviderInternal_cache;
  v3 = (void *)objc_opt_self();
  v4 = v0;
  v5 = objc_msgSend(v3, sel_defaultManager);
  type metadata accessor for PersistedThumbnailCache();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)&v0[v2] = v6;

  v8.receiver = v4;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

id NotePreviewProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_218E09958()
{
  uint64_t v0;
  id v1;
  uint64_t result;

  type metadata accessor for WidgetNotePreviewProvider();
  v0 = swift_allocObject();
  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  type metadata accessor for PersistedThumbnailCache();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v1;
  *(_QWORD *)(v0 + 16) = result;
  qword_255019D68 = v0;
  return result;
}

uint64_t static WidgetNotePreviewProvider.shared.getter()
{
  if (qword_2550199C0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_218E09A0C()
{
  return 1;
}

uint64_t sub_218E09A14()
{
  sub_218E0C7E8();
  sub_218E0C7F4();
  return sub_218E0C818();
}

uint64_t sub_218E09A54()
{
  return sub_218E0C7F4();
}

uint64_t sub_218E09A78()
{
  sub_218E0C7E8();
  sub_218E0C7F4();
  return sub_218E0C818();
}

void sub_218E09AC0(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, NSObject *a7@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  os_log_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  os_log_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  os_log_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;

  v42 = a7;
  v43 = a5;
  v39 = sub_218E0C50C();
  v12 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_allocWithZone((Class)type metadata accessor for ThumbnailKey());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v40 = a1;
  v19 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  v41 = a3;
  v20 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  LODWORD(v38) = 0;
  v21 = objc_msgSend(v18, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a6, v19, v20, v43, 0, 0, 0.0, 0.0, 1.0, v38);

  v22 = (uint64_t)v45;
  sub_218E05B8C(v21, v17);
  if (!v22)
  {
    v23 = v42;
    v45 = v14;
    v24 = type metadata accessor for PersistedThumbnail();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 48))(v17, 1, v24) != 1)
    {

      sub_218E0B18C((uint64_t)v17, (uint64_t)v23);
      return;
    }
    sub_218E0AEC8((uint64_t)v17, &qword_255019D70);
    if (qword_2550199B0 != -1)
      swift_once();
    v25 = sub_218E0C578();
    __swift_project_value_buffer(v25, (uint64_t)qword_255019D48);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v26 = v21;
    v27 = sub_218E0C560();
    v28 = sub_218E0C620();
    LODWORD(v44) = v28;
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v43 = swift_slowAlloc();
      v47 = v43;
      *(_DWORD *)v29 = 136315650;
      v42 = v27;
      swift_bridgeObjectRetain();
      v46 = sub_218E0A294(v40, a2, &v47);
      sub_218E0C650();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v29 + 12) = 2080;
      swift_bridgeObjectRetain();
      v46 = sub_218E0A294(v41, a4, &v47);
      sub_218E0C650();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v29 + 22) = 2080;
      v41 = v29 + 24;
      v30 = v12;
      v31 = (uint64_t)v45;
      sub_218E01754((uint64_t)v45);
      sub_218E02BEC(&qword_255019E38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v32 = v39;
      v33 = sub_218E0C770();
      v35 = v34;
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, v32);
      v46 = sub_218E0A294(v33, v35, &v47);
      sub_218E0C650();

      swift_bridgeObjectRelease();
      v36 = v42;
      _os_log_impl(&dword_218DFE000, v42, (os_log_type_t)v44, "Cannot retrieve widget thumbnail {accountId: %s, noteId: %s, url: %s}", (uint8_t *)v29, 0x20u);
      v37 = v43;
      swift_arrayDestroy();
      MEMORY[0x219A24120](v37, -1, -1);
      MEMORY[0x219A24120](v29, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_218E0AFBC();
    swift_allocError();
    swift_willThrow();
  }

}

uint64_t WidgetNotePreviewProvider.preview(accountId:noteId:type:)@<X0>(unint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v35 = a4;
  v36 = a2;
  v33 = a5;
  v7 = type metadata accessor for PersistedThumbnail();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = ((char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = ((char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v31 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v31 - v18;
  if (!a1)
    goto LABEL_12;
  v21 = HIBYTE(a1) & 0xF;
  if ((a1 & 0x2000000000000000) == 0)
    v21 = v19 & 0xFFFFFFFFFFFFLL;
  if (!v21 || !a3)
    goto LABEL_12;
  v22 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v22 = v36 & 0xFFFFFFFFFFFFLL;
  if (v22)
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v24 = v19;
    v23((char *)&v31 - v18, 1, 1, v7);
    v31 = v23;
    v23(v17, 1, 1, v7);
    v32 = v24;
    v25 = v34;
    sub_218E09AC0(v24, a1, v36, a3, 0, v35, v10);
    if (v25)
    {
      sub_218E0AEC8((uint64_t)v17, &qword_255019D70);
      return sub_218E0AEC8((uint64_t)v20, &qword_255019D70);
    }
    else
    {
      sub_218E09AC0(v32, a1, v36, a3, 1, v35, v14);
      v31((char *)v14, 0, 1, v7);
      return sub_218E0B4A8((uint64_t)v20, (uint64_t)v17, v10, (uint64_t)v14, v33);
    }
  }
  else
  {
LABEL_12:
    if (qword_2550199B0 != -1)
      swift_once();
    v26 = sub_218E0C578();
    __swift_project_value_buffer(v26, (uint64_t)qword_255019D48);
    v27 = sub_218E0C560();
    v28 = sub_218E0C620();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_218DFE000, v27, v28, "Cannot retrieve identifier", v29, 2u);
      MEMORY[0x219A24120](v29, -1, -1);
    }

    sub_218E0AFBC();
    swift_allocError();
    return swift_willThrow();
  }
}

uint64_t WidgetNotePreviewProvider.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t WidgetNotePreviewProvider.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_218E0A294(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_218E0A364(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_218E0AF80((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_218E0AF80((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_218E0A364(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_218E0C65C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_218E0A51C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_218E0C6C8();
  if (!v8)
  {
    sub_218E0C6D4();
    __break(1u);
LABEL_17:
    result = sub_218E0C6F8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_218E0A51C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_218E0A5B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_218E0A788(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_218E0A788(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_218E0A5B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_218E0A724(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_218E0C698();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_218E0C6D4();
      __break(1u);
LABEL_10:
      v2 = sub_218E0C608();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_218E0C6F8();
    __break(1u);
LABEL_14:
    result = sub_218E0C6D4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_218E0A724(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255019E48);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_218E0A788(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255019E48);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_218E0C6F8();
  __break(1u);
  return result;
}

unint64_t sub_218E0A8D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_218E0C7E8();
  sub_218E0C5F0();
  v4 = sub_218E0C818();
  return sub_218E0A9E8(a1, a2, v4);
}

unint64_t sub_218E0A938(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_218E0C674();
  return sub_218E0AAC8(a1, v2);
}

unint64_t sub_218E0A968(uint64_t a1)
{
  uint64_t v2;

  sub_218E0C5D8();
  sub_218E0C7E8();
  sub_218E0C5F0();
  v2 = sub_218E0C818();
  swift_bridgeObjectRelease();
  return sub_218E0AB8C(a1, v2);
}

unint64_t sub_218E0A9E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_218E0C788() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_218E0C788() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_218E0AAC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_218E0B1D0(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x219A23BA4](v9, a1);
      sub_218E0AF4C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_218E0AB8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_218E0C5D8();
    v8 = v7;
    if (v6 == sub_218E0C5D8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_218E0C788();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_218E0C5D8();
          v15 = v14;
          if (v13 == sub_218E0C5D8() && v15 == v16)
            break;
          v18 = sub_218E0C788();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

id sub_218E0AD00()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t *boxed_opaque_existential_0;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;

  sub_218E0C5D8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255019E40);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_218E0D820;
  *(_QWORD *)(inited + 32) = sub_218E0C5D8();
  *(_QWORD *)(inited + 40) = v1;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0xD000000000000019;
  *(_QWORD *)(inited + 56) = 0x8000000218E0E130;
  *(_QWORD *)(inited + 80) = sub_218E0C5D8();
  *(_QWORD *)(inited + 88) = v2;
  swift_getErrorValue();
  *(_QWORD *)(inited + 120) = v9;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 96));
  (*(void (**)(uint64_t *))(*(_QWORD *)(v9 - 8) + 16))(boxed_opaque_existential_0);
  sub_218E0B248(inited);
  v4 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v5 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_218E0C584();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v5, 0, v6);

  return v7;
}

uint64_t sub_218E0AE8C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PersistedThumbnail();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_218E0AEC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_218E0AF04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550199F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_218E0AF4C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_218E0AF80(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_218E0AFBC()
{
  unint64_t result;

  result = qword_255019D88;
  if (!qword_255019D88)
  {
    result = MEMORY[0x219A240B4](&unk_218E0D930, &type metadata for WidgetNotePreviewProvider.Error);
    atomic_store(result, (unint64_t *)&qword_255019D88);
  }
  return result;
}

uint64_t type metadata accessor for NotePreviewProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for WidgetNotePreviewProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for WidgetNotePreviewProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t getEnumTagSinglePayload for WidgetNotePreviewProvider.Error(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for WidgetNotePreviewProvider.Error(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_218E0B0E0 + 4 * byte_218E0D850[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_218E0B100 + 4 * byte_218E0D855[v4]))();
}

_BYTE *sub_218E0B0E0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_218E0B100(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_218E0B108(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_218E0B110(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_218E0B118(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_218E0B120(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_218E0B12C()
{
  return 0;
}

ValueMetadata *type metadata accessor for WidgetNotePreviewProvider.Error()
{
  return &type metadata for WidgetNotePreviewProvider.Error;
}

unint64_t sub_218E0B148()
{
  unint64_t result;

  result = qword_255019E30;
  if (!qword_255019E30)
  {
    result = MEMORY[0x219A240B4](&unk_218E0D908, &type metadata for WidgetNotePreviewProvider.Error);
    atomic_store(result, (unint64_t *)&qword_255019E30);
  }
  return result;
}

uint64_t sub_218E0B18C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PersistedThumbnail();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_218E0B1D0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_218E0B248(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255019E90);
  v2 = sub_218E0C6EC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_218E0C3D8(v6, (uint64_t)&v15, &qword_255019E98);
    v7 = v15;
    v8 = v16;
    result = sub_218E0A8D4(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_218E0C388(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_218E0B37C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255019E80);
  v2 = sub_218E0C6EC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_218E0C3D8(v6, (uint64_t)&v13, &qword_255019E88);
    v7 = v13;
    result = sub_218E0A968(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_218E0C388(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_218E0B4A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  int *v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  double v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  uint64_t *v42;
  uint64_t v43;
  unint64_t v44;
  double v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  unint64_t v62;
  double v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(uint64_t, char *, uint64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t (*v88)(char *, uint64_t, int *);
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  _QWORD *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;

  v84 = a5;
  v95 = a4;
  v96 = a2;
  v87 = sub_218E0C6B0();
  v92 = *(_QWORD *)(v87 - 8);
  MEMORY[0x24BDAC7A8](v87);
  v89 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v86 = (uint64_t)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v85 = (uint64_t)&v82 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v82 - v13;
  v98 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  v93 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  v15 = (uint64_t *)(*a3 + OBJC_IVAR___ICThumbnailKey_objectId);
  v16 = v15[1];
  v83 = *v15;
  v17 = (int *)type metadata accessor for PersistedThumbnail();
  v18 = (_QWORD *)((char *)a3 + v17[6]);
  v19 = v18[1];
  v82 = *v18;
  v91 = a1;
  sub_218E0C3D8(a1, (uint64_t)v14, &qword_255019D70);
  v88 = *(uint64_t (**)(char *, uint64_t, int *))(*((_QWORD *)v17 - 1) + 48);
  v20 = v88(v14, 1, v17);
  v94 = a3;
  v90 = v16;
  v97 = v19;
  if (v20 == 1)
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_218E0C398((uint64_t)v14);
LABEL_7:
    v30 = v92;
    v31 = v89;
    goto LABEL_14;
  }
  v21 = (uint64_t *)&v14[v17[10]];
  v22 = *v21;
  v23 = v21[1];
  v24 = *(double *)&v14[v17[7]];
  v25 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  sub_218E045AC(v22, v23);
  v26 = (void *)sub_218E0C524();
  v27 = objc_msgSend(v25, sel_initWithData_scale_, v26, v24);
  sub_218E04670(v22, v23);

  sub_218E0AE8C((uint64_t)v14);
  if (!v27)
  {
    a3 = v94;
    goto LABEL_7;
  }
  v28 = v27;

  v29 = v85;
  sub_218E0C3D8(v96, v85, &qword_255019D70);
  if (v88((char *)v29, 1, v17) == 1)
  {

    sub_218E0C398(v29);
    v98 = v28;
    a3 = v94;
    v30 = v92;
  }
  else
  {
    v32 = (uint64_t *)(v29 + v17[10]);
    v33 = *v32;
    v34 = v32[1];
    v35 = *(double *)(v29 + v17[7]);
    v36 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    sub_218E045AC(v33, v34);
    v37 = (void *)sub_218E0C524();
    v38 = objc_msgSend(v36, sel_initWithData_scale_, v37, v35);
    sub_218E04670(v33, v34);

    sub_218E0AE8C(v29);
    v30 = v92;
    if (v38)
    {
      v39 = objc_msgSend(v28, sel_imageAsset);
      if (v39)
      {
        v40 = v39;
        v41 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithUserInterfaceStyle_, 2);
        objc_msgSend(v40, sel_registerImage_withTraitCollection_, v38, v41);

      }
    }

    v98 = v28;
    a3 = v94;
  }
  v31 = v89;
LABEL_14:
  v42 = (_QWORD *)((char *)a3 + v17[10]);
  v43 = *v42;
  v44 = v42[1];
  v45 = *(double *)((char *)a3 + v17[7]);
  v46 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  sub_218E045AC(v43, v44);
  v47 = (void *)sub_218E0C524();
  v48 = objc_msgSend(v46, sel_initWithData_scale_, v47, v45);
  sub_218E04670(v43, v44);

  if (!v48)
  {
    v52 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_218E0C6A4();
    v53 = sub_218E0C6BC();
    swift_allocError();
    v55 = v54;
    v56 = v87;
    (*(void (**)(uint64_t, char *, uint64_t))(v30 + 16))(v54, v31, v87);
    v57 = v55;
    v58 = v56;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v53 - 8) + 104))(v57, *MEMORY[0x24BEE26D8], v53);
    swift_willThrow();
    v49 = v93;
    v59 = v91;
    v50 = v95;
LABEL_24:
    sub_218E0C398(v50);
    sub_218E0C398(v96);
    sub_218E0C398(v59);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v31, v58);
    sub_218E0AE8C((uint64_t)v94);

    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v49 = v48;

  v50 = v95;
  v51 = v86;
  sub_218E0C3D8(v95, v86, &qword_255019D70);
  if (v88((char *)v51, 1, v17) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_218E0C398(v51);
LABEL_23:
    sub_218E0C6A4();
    v76 = sub_218E0C6BC();
    swift_allocError();
    v78 = v77;
    v79 = *(void (**)(uint64_t, char *, uint64_t))(v30 + 16);
    v52 = v30;
    v80 = v87;
    v79(v77, v31, v87);
    v81 = v78;
    v58 = v80;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v76 - 8) + 104))(v81, *MEMORY[0x24BEE26D8], v76);
    swift_willThrow();

    v59 = v91;
    goto LABEL_24;
  }
  v60 = (uint64_t *)(v51 + v17[10]);
  v61 = *v60;
  v62 = v60[1];
  v63 = *(double *)(v51 + v17[7]);
  v64 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  sub_218E045AC(v61, v62);
  v65 = (void *)sub_218E0C524();
  v66 = objc_msgSend(v64, sel_initWithData_scale_, v65, v63);
  sub_218E04670(v61, v62);

  sub_218E0AE8C(v51);
  if (!v66)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = v95;
    goto LABEL_23;
  }
  v67 = objc_msgSend(v49, sel_imageAsset);
  if (v67)
  {
    v68 = v67;
    v69 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithUserInterfaceStyle_, 2);
    objc_msgSend(v68, sel_registerImage_withTraitCollection_, v66, v69);

  }
  sub_218E0C398(v95);
  sub_218E0C398(v96);
  sub_218E0C398(v91);
  sub_218E0AE8C((uint64_t)a3);
  v70 = v97;
  swift_bridgeObjectRetain();
  v71 = v98;
  v72 = v98;
  swift_bridgeObjectRelease();
  v73 = v84;
  v74 = v90;
  *v84 = v83;
  v73[1] = v74;
  v73[2] = v82;
  v73[3] = v70;
  v73[4] = v71;
  v73[5] = v49;

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_218E0BC90()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __CFString *v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;

  v2 = *v0;
  v1 = v0[1];
  v4 = v0[2];
  v3 = v0[3];
  v6 = (void *)v0[4];
  v5 = (void *)v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255019E70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_218E0D4E0;
  *(_QWORD *)(inited + 32) = CFSTR("NPNotePreviewKeyID");
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019E60);
  *(_QWORD *)(inited + 40) = v2;
  *(_QWORD *)(inited + 48) = v1;
  *(_QWORD *)(inited + 64) = v8;
  *(_QWORD *)(inited + 72) = CFSTR("NPNotePreviewKeyTitle");
  *(_QWORD *)(inited + 80) = v4;
  *(_QWORD *)(inited + 88) = v3;
  *(_QWORD *)(inited + 104) = v8;
  *(_QWORD *)(inited + 112) = CFSTR("NPNotePreviewKeyChrome");
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019E78);
  *(_QWORD *)(inited + 120) = v6;
  *(_QWORD *)(inited + 144) = v9;
  *(_QWORD *)(inited + 152) = CFSTR("NPNotePreviewKeyPreview");
  *(_QWORD *)(inited + 184) = sub_218E0C350(0, &qword_255019E68);
  *(_QWORD *)(inited + 160) = v5;
  v10 = v6;
  v11 = CFSTR("NPNotePreviewKeyPreview");
  v12 = v5;
  v13 = CFSTR("NPNotePreviewKeyID");
  swift_bridgeObjectRetain();
  v14 = CFSTR("NPNotePreviewKeyTitle");
  swift_bridgeObjectRetain();
  v15 = CFSTR("NPNotePreviewKeyChrome");
  return sub_218E0B37C(inited);
}

uint64_t NotePreview.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NotePreview.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*NotePreview.id.modify())()
{
  return nullsub_1;
}

uint64_t NotePreview.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NotePreview.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*NotePreview.title.modify())()
{
  return nullsub_1;
}

void *NotePreview.chrome.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 32);
  v2 = v1;
  return v1;
}

void NotePreview.chrome.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
}

uint64_t (*NotePreview.chrome.modify())()
{
  return nullsub_1;
}

id NotePreview.preview.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 40);
}

void NotePreview.preview.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
}

uint64_t (*NotePreview.preview.modify())()
{
  return nullsub_1;
}

uint64_t sub_218E0BF38@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t _s15NotesPreviewKit04NoteB0V2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  char v13;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = (void *)a1[4];
  v7 = a2[1];
  v8 = a2[2];
  v9 = a2[3];
  v10 = (void *)a2[4];
  if (v3)
  {
    if (!v7 || (*a1 != *a2 || v3 != v7) && (sub_218E0C788() & 1) == 0)
      return 0;
  }
  else if (v7)
  {
    return 0;
  }
  if (v5)
  {
    if (!v9 || (v4 != v8 || v5 != v9) && (sub_218E0C788() & 1) == 0)
      return 0;
  }
  else if (v9)
  {
    return 0;
  }
  if (v6)
  {
    if (v10)
    {
      sub_218E0C350(0, &qword_255019E68);
      v11 = v10;
      v12 = v6;
      v13 = sub_218E0C62C();

      if ((v13 & 1) != 0)
        goto LABEL_18;
    }
  }
  else if (!v10)
  {
LABEL_18:
    sub_218E0C350(0, (unint64_t *)&qword_255019C00);
    return sub_218E0C62C() & 1;
  }
  return 0;
}

unint64_t sub_218E0C088()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255019E58;
  if (!qword_255019E58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255019E60);
    v2 = MEMORY[0x24BEE0D10];
    result = MEMORY[0x219A240B4](MEMORY[0x24BEE4AB0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255019E58);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for NotePreview(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for NotePreview(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

_QWORD *initializeWithCopy for NotePreview(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = (void *)a2[4];
  v6 = (void *)a2[5];
  a1[4] = v5;
  a1[5] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = v5;
  v8 = v6;
  return a1;
}

_QWORD *assignWithCopy for NotePreview(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[4];
  v5 = (void *)a2[4];
  a1[4] = v5;
  v6 = v5;

  v7 = (void *)a2[5];
  v8 = (void *)a1[5];
  a1[5] = v7;
  v9 = v7;

  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for NotePreview(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  v6 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for NotePreview(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotePreview(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NotePreview()
{
  return &type metadata for NotePreview;
}

uint64_t sub_218E0C350(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

_OWORD *sub_218E0C388(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_218E0C398(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255019D70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_218E0C3D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_218E0C41C()
{
  return MEMORY[0x24BDCADE0]();
}

uint64_t sub_218E0C428()
{
  return MEMORY[0x24BDCAEB0]();
}

uint64_t sub_218E0C434()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_218E0C440()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_218E0C44C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_218E0C458()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_218E0C464()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_218E0C470()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_218E0C47C()
{
  return MEMORY[0x24BDCC930]();
}

uint64_t sub_218E0C488()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_218E0C494()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_218E0C4A0()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_218E0C4AC()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_218E0C4B8()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_218E0C4C4()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_218E0C4D0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_218E0C4DC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_218E0C4E8()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_218E0C4F4()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_218E0C500()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_218E0C50C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_218E0C518()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_218E0C524()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_218E0C530()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_218E0C53C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_218E0C548()
{
  return MEMORY[0x24BEE6250]();
}

uint64_t sub_218E0C554()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_218E0C560()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_218E0C56C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_218E0C578()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_218E0C584()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_218E0C590()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_218E0C59C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_218E0C5A8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_218E0C5B4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_218E0C5C0()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_218E0C5CC()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_218E0C5D8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_218E0C5E4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_218E0C5F0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_218E0C5FC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_218E0C608()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_218E0C614()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_218E0C620()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_218E0C62C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_218E0C638()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_218E0C644()
{
  return MEMORY[0x24BEE1C60]();
}

uint64_t sub_218E0C650()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_218E0C65C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_218E0C668()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_218E0C674()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_218E0C680()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_218E0C68C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_218E0C698()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_218E0C6A4()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_218E0C6B0()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t sub_218E0C6BC()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_218E0C6C8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_218E0C6D4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_218E0C6E0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_218E0C6EC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_218E0C6F8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_218E0C704()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_218E0C710()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_218E0C71C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_218E0C728()
{
  return MEMORY[0x24BEE3378]();
}

uint64_t sub_218E0C734()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_218E0C740()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_218E0C74C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_218E0C758()
{
  return MEMORY[0x24BEE34C8]();
}

uint64_t sub_218E0C764()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_218E0C770()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_218E0C77C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_218E0C788()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_218E0C794()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_218E0C7A0()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_218E0C7AC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_218E0C7B8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_218E0C7C4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_218E0C7D0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_218E0C7DC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_218E0C7E8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_218E0C7F4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_218E0C800()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_218E0C80C()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_218E0C818()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_218E0C824()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t sub_218E0C830()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_218E0C83C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_218E0C848()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_218E0C854()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

