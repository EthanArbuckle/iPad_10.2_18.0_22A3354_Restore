@implementation MSFavoriteItem

- (signed)favoriteType
{
  void *v2;
  MSFavoriteItem *v3;
  unsigned __int16 v4;
  int v5;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(_WORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSFavoriteItem__type);
  objc_msgSend(v2, sel_unlock);
  v5 = sub_1A4114E50(v4);

  if ((v5 & 0x10000) != 0)
    return 0;
  else
    return v5;
}

- (void)setFavoriteType:(signed __int16)a3
{
  MSFavoriteItem *v4;

  v4 = self;
  _s8MapsSync12FavoriteItemC12favoriteTypeAA0cdF0Ovs_0(a3);

}

- (signed)sourceType
{
  void *v2;
  MSFavoriteItem *v3;
  unsigned __int16 v4;
  int v5;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(_WORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSFavoriteItem__source);
  objc_msgSend(v2, sel_unlock);
  v5 = sub_1A4114DF4(v4);

  if ((v5 & 0x10000) != 0)
    return -1;
  else
    return v5;
}

- (void)setSourceType:(signed __int16)a3
{
  MSFavoriteItem *v4;

  v4 = self;
  _s8MapsSync12FavoriteItemC10sourceTypeAA0cd6SourceF0Ovs_0(a3);

}

- (MSFavoriteItem)initWithCustomName:(id)a3 hidden:(BOOL)a4 latitude:(id)a5 longitude:(id)a6 mapItemAddress:(id)a7 mapItemCategory:(id)a8 mapItemLastRefreshed:(id)a9 mapItemName:(id)a10 muid:(id)a11 originatingAddressString:(id)a12 positionIndex:(int64_t)a13 shortcutIdentifier:(id)a14 source:(signed __int16)a15 type:(signed __int16)a16 version:(signed __int16)a17
{
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, _QWORD, uint64_t, uint64_t);
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  MSFavoriteItem *v58;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  _BOOL4 v71;
  MSFavoriteItem *v72;
  id v73;

  v71 = a4;
  v72 = self;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v25 = sub_1A423C14C();
    v68 = v26;
    v69 = v25;
    if (a7)
      goto LABEL_3;
LABEL_6:
    v66 = 0;
    v67 = 0;
    v29 = a9;
    if (a8)
      goto LABEL_4;
    goto LABEL_7;
  }
  v68 = 0;
  v69 = 0;
  if (!a7)
    goto LABEL_6;
LABEL_3:
  v27 = sub_1A423C14C();
  v66 = v28;
  v67 = v27;
  v29 = a9;
  if (a8)
  {
LABEL_4:
    v30 = sub_1A423C14C();
    v63 = v31;
    v64 = v30;
    goto LABEL_8;
  }
LABEL_7:
  v63 = 0;
  v64 = 0;
LABEL_8:
  if (v29)
  {
    sub_1A423BF84();
    v32 = sub_1A423BF9C();
    v33 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
    v34 = a5;
    v35 = a6;
    v36 = a10;
    v37 = a11;
    v38 = a12;
    v39 = a14;
    v33(v24, 0, 1, v32);
    if (a10)
    {
LABEL_10:
      v40 = sub_1A423C14C();
      v61 = v41;
      v62 = v40;

      goto LABEL_13;
    }
  }
  else
  {
    v42 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v24, 1, 1, v42);
    v43 = a5;
    v44 = a6;
    v45 = a10;
    v46 = a11;
    v47 = a12;
    v48 = a14;
    if (a10)
      goto LABEL_10;
  }
  v61 = 0;
  v62 = 0;
LABEL_13:
  v65 = a11;
  v73 = a6;
  v70 = a5;
  if (a12)
  {
    v49 = sub_1A423C14C();
    v51 = v50;

  }
  else
  {
    v49 = 0;
    v51 = 0;
  }
  if (a14)
  {
    v52 = sub_1A423C14C();
    v54 = v53;

  }
  else
  {
    v52 = 0;
    v54 = 0;
  }
  HIWORD(v60) = a16;
  LOWORD(v60) = a15;
  v55 = v65;
  v56 = v70;
  v57 = v73;
  v58 = (MSFavoriteItem *)sub_1A4205840(v69, v68, v71, (uint64_t)v70, (uint64_t)v73, v67, v66, v64, v63, (uint64_t)v24, v62, v61, (uint64_t)v65, v49, v51, a13, v52, v54, v60,
                            a17);

  return v58;
}

- (MSFavoriteItem)initWithStore:(id)a3 customName:(id)a4 hidden:(BOOL)a5 latitude:(id)a6 longitude:(id)a7 mapItemAddress:(id)a8 mapItemCategory:(id)a9 mapItemLastRefreshed:(id)a10 mapItemName:(id)a11 muid:(id)a12 originatingAddressString:(id)a13 positionIndex:(int64_t)a14 shortcutIdentifier:(id)a15 source:(signed __int16)a16 type:(signed __int16)a17 version:(signed __int16)a18
{
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, _QWORD, uint64_t, uint64_t);
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  _BOOL4 v72;
  id v73;
  MSFavoriteItem *v74;

  v72 = a5;
  v74 = self;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v23);
  v25 = (char *)&v60 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v26 = sub_1A423C14C();
    v68 = v27;
    v69 = v26;
    v28 = a9;
    if (a8)
      goto LABEL_3;
LABEL_6:
    v66 = 0;
    v67 = 0;
    v31 = a10;
    if (v28)
      goto LABEL_4;
    goto LABEL_7;
  }
  v68 = 0;
  v69 = 0;
  v28 = a9;
  if (!a8)
    goto LABEL_6;
LABEL_3:
  v29 = sub_1A423C14C();
  v66 = v30;
  v67 = v29;
  v31 = a10;
  if (v28)
  {
LABEL_4:
    v32 = sub_1A423C14C();
    v64 = v33;
    v65 = v32;
    goto LABEL_8;
  }
LABEL_7:
  v64 = 0;
  v65 = 0;
LABEL_8:
  if (v31)
  {
    sub_1A423BF84();
    v34 = sub_1A423BF9C();
    v35 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56);
    v36 = a3;
    v37 = a6;
    v38 = a7;
    v39 = a11;
    v40 = a12;
    v41 = a13;
    v42 = a15;
    v35(v25, 0, 1, v34);
    if (a11)
    {
LABEL_10:
      v43 = sub_1A423C14C();
      v61 = v44;
      v62 = v43;

      goto LABEL_13;
    }
  }
  else
  {
    v45 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v25, 1, 1, v45);
    v46 = a3;
    v47 = a6;
    v48 = a7;
    v49 = a11;
    v50 = a12;
    v51 = a13;
    v52 = a15;
    if (a11)
      goto LABEL_10;
  }
  v61 = 0;
  v62 = 0;
LABEL_13:
  v63 = a12;
  v73 = a7;
  v70 = a3;
  v71 = a6;
  if (a13)
  {
    v53 = sub_1A423C14C();
    v55 = v54;

  }
  else
  {
    v53 = 0;
    v55 = 0;
  }
  if (a15)
  {
    v56 = sub_1A423C14C();
    v58 = v57;

  }
  else
  {
    v56 = 0;
    v58 = 0;
  }
  return (MSFavoriteItem *)FavoriteItem.init(store:customName:hidden:latitude:longitude:mapItemAddress:mapItemCategory:mapItemLastRefreshed:mapItemName:muid:originatingAddressString:positionIndex:shortcutIdentifier:source:type:version:)(v70, v69, v68, v72, v71, v73, v67, v66, v65, v64, (uint64_t)v25, v62, v61, v63, v53, v55, a14, v56, v58,
                             a16,
                             a17,
                             a18);
}

- (void)flushChanges
{
  _QWORD *v3;
  uint64_t v4;
  MSFavoriteItem *v5;
  _QWORD *v6;

  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  v4 = MEMORY[0x1E0DEE9D8];
  *v3 = MEMORY[0x1E0DEE9D8];
  v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSFavoriteItem__handleChanges);
  swift_beginAccess();
  *v6 = v4;

  swift_bridgeObjectRelease();
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedFavoriteItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSFavoriteItem *v7;

  v6 = a3;
  v7 = self;
  sub_1A41FE9A0(v6, a4);

}

- (NSString)customName
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41FEFBC);
}

- (void)setCustomName:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A4205B5C);
}

- (BOOL)hidden
{
  void *v2;
  MSFavoriteItem *v3;
  char v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *((_BYTE *)&v3->super.super.isa + OBJC_IVAR___MSFavoriteItem__hidden);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setHidden:(BOOL)a3
{
  MSFavoriteItem *v4;

  v4 = self;
  sub_1A41FF42C(a3);

}

- (NSNumber)latitude
{
  MSFavoriteItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A41FF6DC();

  return (NSNumber *)v3;
}

- (void)setLatitude:(id)a3
{
  MSFavoriteItem *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4205D6C(a3);

}

- (NSNumber)longitude
{
  MSFavoriteItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A41FFAA0();

  return (NSNumber *)v3;
}

- (void)setLongitude:(id)a3
{
  MSFavoriteItem *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4205F50(a3);

}

- (NSString)mapItemAddress
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A41FFE40);
}

- (void)setMapItemAddress:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A4206134);
}

- (NSString)mapItemCategory
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A42001C0);
}

- (void)setMapItemCategory:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A420632C);
}

- (NSDate)mapItemLastRefreshed
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  MSFavoriteItem *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1A42005F8((uint64_t)v5);

  v7 = sub_1A423BF9C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A423BF6C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (void)setMapItemLastRefreshed:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  MSFavoriteItem *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A423BF84();
    v8 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1A4200AD0((uint64_t)v7);

}

- (NSString)mapItemName
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A420122C);
}

- (void)setMapItemName:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A4206618);
}

- (NSNumber)muid
{
  MSFavoriteItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A42015D0();

  return (NSNumber *)v3;
}

- (void)setMuid:(id)a3
{
  MSFavoriteItem *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4206810(a3);

}

- (NSString)originatingAddressString
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A4201ADC);
}

- (void)setOriginatingAddressString:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A42069F4);
}

- (int64_t)positionIndex
{
  void *v2;
  MSFavoriteItem *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSFavoriteItem__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSFavoriteItem *v4;

  v4 = self;
  sub_1A4201F4C(a3);

}

- (NSString)shortcutIdentifier
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A42021D4);
}

- (void)setShortcutIdentifier:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A4206C28);
}

- (signed)source
{
  return sub_1A40F099C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSFavoriteItem__source);
}

- (void)setSource:(signed __int16)a3
{
  MSFavoriteItem *v4;

  v4 = self;
  _s8MapsSync12FavoriteItemC10sourceTypeAA0cd6SourceF0Ovs_0(a3);

}

- (signed)type
{
  return sub_1A40F099C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSFavoriteItem__type);
}

- (void)setType:(signed __int16)a3
{
  MSFavoriteItem *v4;

  v4 = self;
  _s8MapsSync12FavoriteItemC12favoriteTypeAA0cdF0Ovs_0(a3);

}

- (signed)version
{
  return sub_1A40F099C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSFavoriteItem__version);
}

- (void)setVersion:(signed __int16)a3
{
  MSFavoriteItem *v4;

  v4 = self;
  sub_1A4202C80(a3);

}

- (GEOMapItemStorage)mapItemStorage
{
  MSFavoriteItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A4202F3C();

  return (GEOMapItemStorage *)v3;
}

- (void)setMapItemStorage:(id)a3
{
  void *v5;
  MSFavoriteItem *v6;
  id v7;

  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v7 = a3;
  v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A420375C((uint64_t)v5, a3, (char *)v6);
  objc_msgSend(v5, sel_unlock);

}

- (id)fetchContactHandles
{
  MSFavoriteItem *v2;
  void *v3;

  v2 = self;
  sub_1A4204414();

  v3 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)addContactHandle:(id)a3
{
  sub_1A420508C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A42047FC);
}

- (void)removeContactHandle:(id)a3
{
  sub_1A420508C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A4204B64);
}

- (MSFavoriteItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  v8 = a3;
  return (MSFavoriteItem *)sub_1A4205128(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A410251C((uint64_t)self + OBJC_IVAR___MSFavoriteItem__mapItemLastRefreshed, &qword_1ED1AB5D0);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSFavoriteItem__mapItemStorage), *(_QWORD *)&self->super._store[OBJC_IVAR___MSFavoriteItem__mapItemStorage]);
  swift_bridgeObjectRelease();
}

- (void)onFirstSaveWithObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  MSFavoriteItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A42277F0(v6, v7);

}

+ (id)optionsWith:(id)a3
{
  id v4;
  char *v5;

  v4 = a3;
  v5 = sub_1A422BC48(a3);

  return v5;
}

+ (id)strippedMapItemWith:(id)a3
{
  void *v4;
  id v5;
  id result;
  id v7;

  v4 = (void *)objc_opt_self();
  v5 = a3;
  result = objc_msgSend(v4, sel_mapItemStorageForGEOMapItem_forUseType_, v5, 5);
  if (result)
  {
    v7 = result;

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)mergeWithDuplicates:(id)a3
{
  uint64_t v3;
  void *v4;

  sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
  v3 = sub_1A423C1C4();
  v4 = (void *)sub_1A422BD7C(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)findDuplicatesWithContext:(id)a3
{
  id v4;
  void *v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  sub_1A4227EF8((uint64_t)v4);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AB910);
  v5 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)moveToFrontWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t inited;
  MSFavoriteItem *v7;
  id v8;
  unint64_t v9;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A4243670;
  *(_QWORD *)(inited + 32) = self;
  v9 = inited;
  sub_1A423C1DC();
  v7 = self;
  swift_retain();
  v8 = v5;
  sub_1A415DD48(v9, (uint64_t)v7, (void (*)(id))sub_1A422BFA0);

  swift_bridgeObjectRelease();
  swift_release_n();
}

- (void)moveToBackWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t inited;
  MSFavoriteItem *v7;
  id v8;
  unint64_t v9;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A4243670;
  *(_QWORD *)(inited + 32) = self;
  v9 = inited;
  sub_1A423C1DC();
  v7 = self;
  swift_retain();
  v8 = v5;
  sub_1A415E03C(v9, (uint64_t)v7, (void (*)(id))sub_1A422BFA0);

  swift_bridgeObjectRelease();
  swift_release_n();
}

- (void)moveBeforeItem:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  uint64_t inited;
  MSFavoriteItem *v9;
  id v10;
  MSFavoriteItem *v11;
  id v12;
  unint64_t v13;

  v6 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A4243A90;
  *(_QWORD *)(inited + 32) = self;
  *(_QWORD *)(inited + 40) = a3;
  v13 = inited;
  sub_1A423C1DC();
  v9 = self;
  v10 = a3;
  v11 = v9;
  swift_retain();
  v12 = v7;
  sub_1A415E330(v13, (uint64_t)v11, (void (*)(id))sub_1A422BFA0);

  swift_bridgeObjectRelease();
  swift_release_n();

}

- (void)moveAfterItem:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  uint64_t inited;
  MSFavoriteItem *v9;
  id v10;
  MSFavoriteItem *v11;
  id v12;
  unint64_t v13;

  v6 = _Block_copy(a4);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v7 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB920);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A4243A90;
  *(_QWORD *)(inited + 32) = self;
  *(_QWORD *)(inited + 40) = a3;
  v13 = inited;
  sub_1A423C1DC();
  v9 = self;
  v10 = a3;
  v11 = v9;
  swift_retain();
  v12 = v7;
  sub_1A415E624(v13, (uint64_t)v11, (void (*)(id))sub_1A422BF98);

  swift_bridgeObjectRelease();
  swift_release_n();

}

- (NSString)placeItemNote
{
  MSFavoriteItem *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  FavoriteItem.placeItemNote.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setPlaceItemNote:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MSFavoriteItem *v7;

  if (a3)
  {
    v4 = sub_1A423C14C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  FavoriteItem.placeItemNote.setter(v4, v6);

}

@end
