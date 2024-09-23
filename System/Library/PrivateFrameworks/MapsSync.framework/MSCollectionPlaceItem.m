@implementation MSCollectionPlaceItem

- (MSCollectionPlaceItem)initWithCustomName:(id)a3 droppedPinCoordinate:(id)a4 droppedPinFloorOrdinal:(int)a5 latitude:(id)a6 longitude:(id)a7 mapItemAddress:(id)a8 mapItemCategory:(id)a9 mapItemLastRefreshed:(id)a10 mapItemName:(id)a11 muid:(id)a12 origin:(signed __int16)a13 originalIdentifier:(id)a14 placeItemNote:(id)a15 type:(signed __int16)a16
{
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  MSCollectionPlaceItem *v67;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  id v81;
  unsigned int v82;
  MSCollectionPlaceItem *v83;
  id v84;
  id v85;

  v84 = a6;
  v85 = a7;
  v82 = a5;
  v83 = self;
  v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v22);
  v80 = (char *)&v73 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v24 = sub_1A423C14C();
    v78 = v25;
    v79 = v24;
  }
  else
  {
    v78 = 0;
    v79 = 0;
  }
  v81 = a12;
  if (a4)
  {
    v26 = a4;
    v27 = v84;
    v28 = v85;
    v29 = a8;
    v30 = a9;
    v31 = a10;
    v32 = a11;
    v33 = a12;
    v34 = a14;
    v35 = a15;
    v77 = sub_1A423BF54();
    v37 = v36;

    if (a8)
    {
LABEL_6:
      v38 = sub_1A423C14C();
      v75 = v39;
      v76 = v38;

      goto LABEL_9;
    }
  }
  else
  {
    v40 = v84;
    v41 = v85;
    v42 = a8;
    v43 = a9;
    v44 = a10;
    v45 = a11;
    v46 = a12;
    v47 = a14;
    v48 = a15;
    v77 = 0;
    v37 = 0xF000000000000000;
    if (a8)
      goto LABEL_6;
  }
  v75 = 0;
  v76 = 0;
LABEL_9:
  v49 = v21;
  v50 = v80;
  if (a9)
  {
    v51 = sub_1A423C14C();
    v73 = v52;
    v74 = v51;

    if (a10)
    {
LABEL_11:
      sub_1A423BF84();

      v53 = sub_1A423BF9C();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v50, 0, 1, v53);
      goto LABEL_14;
    }
  }
  else
  {
    v73 = 0;
    v74 = 0;
    if (a10)
      goto LABEL_11;
  }
  v54 = sub_1A423BF9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v50, 1, 1, v54);
LABEL_14:
  if (a11)
  {
    v55 = sub_1A423C14C();
    v57 = v56;

    if (a14)
    {
LABEL_16:
      sub_1A423BFCC();

      v58 = sub_1A423BFE4();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v49, 0, 1, v58);
      goto LABEL_19;
    }
  }
  else
  {
    v55 = 0;
    v57 = 0;
    if (a14)
      goto LABEL_16;
  }
  v59 = sub_1A423BFE4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v49, 1, 1, v59);
LABEL_19:
  if (a15)
  {
    v60 = sub_1A423C14C();
    v62 = v61;

  }
  else
  {
    v60 = 0;
    v62 = 0;
  }
  v72 = v62;
  v71 = (uint64_t)v49;
  v63 = v81;
  v70 = v57;
  v69 = (uint64_t)v50;
  v64 = v77;
  v66 = v84;
  v65 = v85;
  v67 = (MSCollectionPlaceItem *)sub_1A41021B0(v79, v78, v77, v37, v82, (uint64_t)v84, (uint64_t)v85, v76, v75, v74, v73, v69, v55, v70, (uint64_t)v81, a13, v71, v60, v72,
                                   a16);

  sub_1A40D7778(v64, v37);
  return v67;
}

- (MSCollectionPlaceItem)initWithStore:(id)a3 customName:(id)a4 droppedPinCoordinate:(id)a5 droppedPinFloorOrdinal:(int)a6 latitude:(id)a7 longitude:(id)a8 mapItemAddress:(id)a9 mapItemCategory:(id)a10 mapItemLastRefreshed:(id)a11 mapItemName:(id)a12 muid:(id)a13 origin:(signed __int16)a14 originalIdentifier:(id)a15 placeItemNote:(id)a16 type:(signed __int16)a17
{
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  MSCollectionPlaceItem *v74;
  int v75;
  id v76;
  id v77;

  v76 = a7;
  v77 = a8;
  v75 = a6;
  v74 = self;
  v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v23);
  v70 = (uint64_t)&v65 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v25 = sub_1A423C14C();
    v72 = v26;
    v73 = v25;
  }
  else
  {
    v72 = 0;
    v73 = 0;
  }
  v69 = a3;
  v71 = a13;
  if (a5)
  {
    v27 = a5;
    v28 = v76;
    v29 = v77;
    v30 = a9;
    v31 = a10;
    v32 = a11;
    v33 = a12;
    v34 = a13;
    v35 = a15;
    v36 = a16;
    v37 = sub_1A423BF54();
    v67 = v38;
    v68 = v37;

    v39 = (uint64_t)v22;
    if (a9)
      goto LABEL_6;
  }
  else
  {
    v46 = v76;
    v47 = v77;
    v48 = a9;
    v49 = a10;
    v50 = a11;
    v51 = a12;
    v52 = a13;
    v53 = a15;
    v54 = a16;
    v67 = 0xF000000000000000;
    v68 = 0;
    v39 = (uint64_t)v22;
    if (a9)
    {
LABEL_6:
      v40 = sub_1A423C14C();
      v65 = v41;
      v66 = v40;

      v42 = v70;
      if (a10)
        goto LABEL_7;
LABEL_11:
      v70 = 0;
      v44 = 0;
      if (a11)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  v65 = 0;
  v66 = 0;
  v42 = v70;
  if (!a10)
    goto LABEL_11;
LABEL_7:
  v70 = sub_1A423C14C();
  v44 = v43;

  if (a11)
  {
LABEL_8:
    sub_1A423BF84();

    v45 = sub_1A423BF9C();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v42, 0, 1, v45);
    goto LABEL_13;
  }
LABEL_12:
  v55 = sub_1A423BF9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v42, 1, 1, v55);
LABEL_13:
  if (a12)
  {
    v56 = sub_1A423C14C();
    v58 = v57;

    if (a15)
    {
LABEL_15:
      sub_1A423BFCC();

      v59 = sub_1A423BFE4();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v39, 0, 1, v59);
      goto LABEL_18;
    }
  }
  else
  {
    v56 = 0;
    v58 = 0;
    if (a15)
      goto LABEL_15;
  }
  v60 = sub_1A423BFE4();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v39, 1, 1, v60);
LABEL_18:
  if (a16)
  {
    v61 = sub_1A423C14C();
    v63 = v62;

  }
  else
  {
    v61 = 0;
    v63 = 0;
  }
  return (MSCollectionPlaceItem *)CollectionPlaceItem.init(store:customName:droppedPinCoordinate:droppedPinFloorOrdinal:latitude:longitude:mapItemAddress:mapItemCategory:mapItemLastRefreshed:mapItemName:muid:origin:originalIdentifier:placeItemNote:type:)(v69, v73, v72, v68, v67, v75, v76, v77, v66, v65, v70, v44, v42, v56, v58, v71, a14, v39, v61,
                                    v63,
                                    a17);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCollectionPlaceItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSCollectionPlaceItem *v7;

  v6 = a3;
  v7 = self;
  sub_1A40FBC58(v6, a4);

}

- (NSString)customName
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A40FC3DC);
}

- (void)setCustomName:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41025B8);
}

- (NSData)droppedPinCoordinate
{
  MSCollectionPlaceItem *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1A40FC7C0();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_1A423BF48();
    sub_1A40D7778(v3, v5);
  }
  return (NSData *)v6;
}

- (void)setDroppedPinCoordinate:(id)a3
{
  void *v3;
  MSCollectionPlaceItem *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  MSCollectionPlaceItem *v8;

  v3 = a3;
  if (a3)
  {
    v4 = self;
    v5 = v3;
    v3 = (void *)sub_1A423BF54();
    v7 = v6;

  }
  else
  {
    v8 = self;
    v7 = 0xF000000000000000;
  }
  sub_1A4102788((uint64_t)v3, v7);
  sub_1A40D7778((uint64_t)v3, v7);

}

- (int)droppedPinFloorOrdinal
{
  void *v2;
  MSCollectionPlaceItem *v3;
  int v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(_DWORD *)((char *)&v3->super.super.super.isa + OBJC_IVAR___MSCollectionPlaceItem__droppedPinFloorOrdinal);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setDroppedPinFloorOrdinal:(int)a3
{
  MSCollectionPlaceItem *v4;

  v4 = self;
  sub_1A40FCF34(a3);

}

- (NSNumber)latitude
{
  MSCollectionPlaceItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40FD1D4();

  return (NSNumber *)v3;
}

- (void)setLatitude:(id)a3
{
  MSCollectionPlaceItem *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4102994(a3);

}

- (NSNumber)longitude
{
  MSCollectionPlaceItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40FD598();

  return (NSNumber *)v3;
}

- (void)setLongitude:(id)a3
{
  MSCollectionPlaceItem *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4102B68(a3);

}

- (NSString)mapItemAddress
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A40FD938);
}

- (void)setMapItemAddress:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A4102D3C);
}

- (NSString)mapItemCategory
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A40FDCB8);
}

- (void)setMapItemCategory:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A4102F24);
}

- (NSDate)mapItemLastRefreshed
{
  return (NSDate *)sub_1A40FF2B8(self, (uint64_t)a2, &qword_1ED1AB5D0, (void (*)(void))sub_1A40FE050, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB06B8]);
}

- (void)setMapItemLastRefreshed:(id)a3
{
  sub_1A40FF7C8(self, (uint64_t)a2, (uint64_t)a3, &qword_1ED1AB5D0, (void (*)(uint64_t))MEMORY[0x1E0CB07E8], (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], (void (*)(char *))sub_1A40FE48C);
}

- (NSString)mapItemName
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A40FE778);
}

- (void)setMapItemName:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A4103190);
}

- (NSNumber)muid
{
  MSCollectionPlaceItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40FEB1C();

  return (NSNumber *)v3;
}

- (void)setMuid:(id)a3
{
  MSCollectionPlaceItem *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4103378(a3);

}

- (signed)origin
{
  return sub_1A40F099C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCollectionPlaceItem__origin);
}

- (void)setOrigin:(signed __int16)a3
{
  MSCollectionPlaceItem *v4;

  v4 = self;
  sub_1A40FF074(a3);

}

- (NSUUID)originalIdentifier
{
  return (NSUUID *)sub_1A40FF2B8(self, (uint64_t)a2, (uint64_t *)&unk_1ED1ABCE0, (void (*)(void))sub_1A40FF38C, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB0930]);
}

- (void)setOriginalIdentifier:(id)a3
{
  sub_1A40FF7C8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t *)&unk_1ED1ABCE0, (void (*)(uint64_t))MEMORY[0x1E0CB0958], (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998], (void (*)(char *))sub_1A40FF8A4);
}

- (NSString)placeItemNote
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A410002C);
}

- (void)setPlaceItemNote:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A41037F4);
}

- (signed)type
{
  return sub_1A40F099C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSCollectionPlaceItem__type);
}

- (void)setType:(signed __int16)a3
{
  MSCollectionPlaceItem *v4;

  v4 = self;
  sub_1A41005C8(a3);

}

- (GEOMapItemStorage)mapItemStorage
{
  MSCollectionPlaceItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A4100874();

  return (GEOMapItemStorage *)v3;
}

- (void)setMapItemStorage:(id)a3
{
  void *v5;
  MSCollectionPlaceItem *v6;
  id v7;

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v7 = a3;
  v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A4101094((uint64_t)v5, a3, (char *)v6);
  objc_msgSend(v5, sel_unlock);

}

- (MSCollectionPlaceItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  v8 = a3;
  return (MSCollectionPlaceItem *)sub_1A4101DA4(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionPlaceItem__droppedPinCoordinate), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSCollectionPlaceItem__droppedPinCoordinate]);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A410251C((uint64_t)self + OBJC_IVAR___MSCollectionPlaceItem__mapItemLastRefreshed, &qword_1ED1AB5D0);
  swift_bridgeObjectRelease();

  sub_1A410251C((uint64_t)self + OBJC_IVAR___MSCollectionPlaceItem__originalIdentifier, (uint64_t *)&unk_1ED1ABCE0);
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionPlaceItem__mapItemStorage), *(_QWORD *)&self->super.super._store[OBJC_IVAR___MSCollectionPlaceItem__mapItemStorage]);
}

+ (id)optionsWith:(id)a3
{
  id v4;
  id PredicateC10withFormatyACSS_s7CVarArg_pdtFZ_0;
  char *v6;

  v4 = a3;
  PredicateC10withFormatyACSS_s7CVarArg_pdtFZ_0 = _s8MapsSync0aB14QueryPredicateC10withFormatyACSS_s7CVarArg_pdtFZ_0(0x206D65744970616DLL, 0xEE006C696E203D21, MEMORY[0x1E0DEE9D8]);
  v6 = sub_1A41D82EC(a3, PredicateC10withFormatyACSS_s7CVarArg_pdtFZ_0, 0);

  return v6;
}

+ (id)strippedMapItemWith:(id)a3
{
  void *v4;
  id v5;
  id result;
  id v7;

  v4 = (void *)objc_opt_self();
  v5 = a3;
  result = objc_msgSend(v4, sel_mapItemStorageForGEOMapItem_forUseType_, v5, 6);
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

@end
