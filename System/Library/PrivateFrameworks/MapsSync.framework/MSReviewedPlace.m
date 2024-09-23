@implementation MSReviewedPlace

- (MSReviewedPlace)initWithHasUserReviewed:(BOOL)a3 lastSuggestedReviewDate:(id)a4 latitude:(id)a5 longitude:(id)a6 mapItemIdComparableRepresentation:(id)a7 mapItemLastRefreshed:(id)a8 mapItemStorage:(id)a9 muid:(unint64_t)a10 positionIndex:(int64_t)a11 rating:(id)a12 resultProviderIdentifier:(id)a13 uploadedPhotosCount:(int)a14 version:(signed __int16)a15
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  MSReviewedPlace *v51;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  _BOOL4 v59;
  MSReviewedPlace *v60;

  v59 = a3;
  v60 = self;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v21 = MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v53 - v24;
  if (a4)
  {
    sub_1A423BF84();
    v26 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 0, 1, v26);
  }
  else
  {
    v27 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v25, 1, 1, v27);
  }
  v58 = a5;
  v57 = a6;
  if (a7)
  {
    v28 = a7;
    v29 = a8;
    v30 = a9;
    v31 = a12;
    v32 = a13;
    v33 = sub_1A423BF54();
    v54 = v34;
    v55 = v33;

    v56 = a13;
    if (a8)
    {
LABEL_6:
      sub_1A423BF84();

      v35 = sub_1A423BF9C();
      v36 = (uint64_t)v23;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v23, 0, 1, v35);
      goto LABEL_9;
    }
  }
  else
  {
    v37 = a8;
    v38 = a9;
    v39 = a12;
    v40 = a13;
    v54 = 0xF000000000000000;
    v55 = 0;
    v56 = a13;
    if (a8)
      goto LABEL_6;
  }
  v41 = sub_1A423BF9C();
  v36 = (uint64_t)v23;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v23, 1, 1, v41);
LABEL_9:
  if (a9)
  {
    v42 = sub_1A423BF54();
    v44 = v43;

  }
  else
  {
    v42 = 0;
    v44 = 0xF000000000000000;
  }
  v45 = v56;
  v46 = (uint64_t)v25;
  v48 = v57;
  v47 = v58;
  v50 = v54;
  v49 = v55;
  v51 = (MSReviewedPlace *)sub_1A4196F40(v59, v46, (uint64_t)v58, (uint64_t)v57, v55, v54, v36, v42, v44, a10, a11, (uint64_t)a12, (uint64_t)v56, a14, a15);

  sub_1A40D7778(v42, v44);
  sub_1A40D7778(v49, v50);

  return v51;
}

- (MSReviewedPlace)initWithStore:(id)a3 hasUserReviewed:(BOOL)a4 lastSuggestedReviewDate:(id)a5 latitude:(id)a6 longitude:(id)a7 mapItemIdComparableRepresentation:(id)a8 mapItemLastRefreshed:(id)a9 mapItemStorage:(id)a10 muid:(unint64_t)a11 positionIndex:(int64_t)a12 rating:(id)a13 resultProviderIdentifier:(id)a14 uploadedPhotosCount:(int)a15 version:(signed __int16)a16
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _BOOL4 v52;
  MSReviewedPlace *v53;

  v52 = a4;
  v53 = self;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v22 = MEMORY[0x1E0C80A78](v21);
  v24 = (char *)&v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22);
  v26 = (char *)&v46 - v25;
  if (a5)
  {
    sub_1A423BF84();
    v27 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v26, 0, 1, v27);
  }
  else
  {
    v28 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v26, 1, 1, v28);
  }
  v50 = a3;
  v49 = a6;
  v48 = a7;
  v51 = a14;
  if (a8)
  {
    v29 = a8;
    v30 = a9;
    v31 = a10;
    v32 = a13;
    v33 = a14;
    v34 = sub_1A423BF54();
    v46 = v35;
    v47 = v34;

    if (a9)
    {
LABEL_6:
      sub_1A423BF84();

      v36 = sub_1A423BF9C();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v24, 0, 1, v36);
      goto LABEL_9;
    }
  }
  else
  {
    v37 = a9;
    v38 = a10;
    v39 = a13;
    v40 = a14;
    v46 = 0xF000000000000000;
    v47 = 0;
    if (a9)
      goto LABEL_6;
  }
  v41 = sub_1A423BF9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v24, 1, 1, v41);
LABEL_9:
  if (a10)
  {
    v42 = sub_1A423BF54();
    v44 = v43;

  }
  else
  {
    v42 = 0;
    v44 = 0xF000000000000000;
  }
  return (MSReviewedPlace *)ReviewedPlace.init(store:hasUserReviewed:lastSuggestedReviewDate:latitude:longitude:mapItemIdComparableRepresentation:mapItemLastRefreshed:mapItemStorage:muid:positionIndex:rating:resultProviderIdentifier:uploadedPhotosCount:version:)(v50, v52, (uint64_t)v26, v49, v48, v47, v46, (unint64_t)v24, v42, v44, a11, a12, a13, v51, a15, a16);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedReviewedPlace();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSReviewedPlace *v7;

  v6 = a3;
  v7 = self;
  sub_1A4192350(v6, a4);

}

- (BOOL)hasUserReviewed
{
  void *v2;
  MSReviewedPlace *v3;
  char v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *((_BYTE *)&v3->super.super.isa + OBJC_IVAR___MSReviewedPlace__hasUserReviewed);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setHasUserReviewed:(BOOL)a3
{
  MSReviewedPlace *v4;

  v4 = self;
  sub_1A41929B0(a3);

}

- (NSDate)lastSuggestedReviewDate
{
  return (NSDate *)sub_1A4193E08(self, (uint64_t)a2, (void (*)(void))sub_1A4192C2C);
}

- (void)setLastSuggestedReviewDate:(id)a3
{
  sub_1A411BCA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A419301C);
}

- (NSNumber)latitude
{
  MSReviewedPlace *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A4193300();

  return (NSNumber *)v3;
}

- (void)setLatitude:(id)a3
{
  MSReviewedPlace *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4197290(a3);

}

- (NSNumber)longitude
{
  MSReviewedPlace *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A41936C4();

  return (NSNumber *)v3;
}

- (void)setLongitude:(id)a3
{
  MSReviewedPlace *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4197464(a3);

}

- (NSData)mapItemIdComparableRepresentation
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A4193A64);
}

- (void)setMapItemIdComparableRepresentation:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A4197638);
}

- (NSDate)mapItemLastRefreshed
{
  return (NSDate *)sub_1A4193E08(self, (uint64_t)a2, (void (*)(void))sub_1A4193ED0);
}

- (void)setMapItemLastRefreshed:(id)a3
{
  sub_1A411BCA4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A41942C0);
}

- (NSData)mapItemStorage
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A41949D0);
}

- (void)setMapItemStorage:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A419795C);
}

- (unint64_t)muid
{
  void *v2;
  MSReviewedPlace *v3;
  unint64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(unint64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSReviewedPlace__muid);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setMuid:(unint64_t)a3
{
  MSReviewedPlace *v4;

  v4 = self;
  sub_1A419503C(a3);

}

- (int64_t)positionIndex
{
  void *v2;
  MSReviewedPlace *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSReviewedPlace__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSReviewedPlace *v4;

  v4 = self;
  sub_1A4195354(a3);

}

- (NSNumber)rating
{
  MSReviewedPlace *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A41955FC();

  return (NSNumber *)v3;
}

- (void)setRating:(id)a3
{
  MSReviewedPlace *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4197BB0(a3);

}

- (NSNumber)resultProviderIdentifier
{
  MSReviewedPlace *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A41959C0();

  return (NSNumber *)v3;
}

- (void)setResultProviderIdentifier:(id)a3
{
  MSReviewedPlace *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A4197D84(a3);

}

- (int)uploadedPhotosCount
{
  void *v2;
  MSReviewedPlace *v3;
  int v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(_DWORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSReviewedPlace__uploadedPhotosCount);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setUploadedPhotosCount:(int)a3
{
  MSReviewedPlace *v4;

  v4 = self;
  sub_1A4195F60(a3);

}

- (signed)version
{
  void *v2;
  MSReviewedPlace *v3;
  signed __int16 v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(_WORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSReviewedPlace__version);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setVersion:(signed __int16)a3
{
  MSReviewedPlace *v4;

  v4 = self;
  sub_1A41962CC(a3);

}

- (MSAnonymousCredential)anonymousCredential
{
  MSReviewedPlace *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A419656C();

  return (MSAnonymousCredential *)v3;
}

- (void)setAnonymousCredential:(id)a3
{
  id v5;
  MSReviewedPlace *v6;

  v5 = a3;
  v6 = self;
  sub_1A4196780(a3);

}

- (MSCommunityID)communityID
{
  MSReviewedPlace *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A419682C();

  return (MSCommunityID *)v3;
}

- (void)setCommunityID:(id)a3
{
  id v5;
  MSReviewedPlace *v6;

  v5 = a3;
  v6 = self;
  sub_1A4196ABC(a3);

}

- (MSReviewedPlace)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  v8 = a3;
  return (MSReviewedPlace *)sub_1A4196C50(a3, a4, a5);
}

- (void).cxx_destruct
{
  sub_1A40F1680((uint64_t)self + OBJC_IVAR___MSReviewedPlace__lastSuggestedReviewDate);

  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSReviewedPlace__mapItemIdComparableRepresentation), *(_QWORD *)&self->super._store[OBJC_IVAR___MSReviewedPlace__mapItemIdComparableRepresentation]);
  sub_1A40F1680((uint64_t)self + OBJC_IVAR___MSReviewedPlace__mapItemLastRefreshed);
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSReviewedPlace__mapItemStorage), *(_QWORD *)&self->super._store[OBJC_IVAR___MSReviewedPlace__mapItemStorage]);

}

+ (id)strippedMapItemWith:(id)a3
{
  void *v4;
  id v5;
  id result;
  id v7;

  v4 = (void *)objc_opt_self();
  v5 = a3;
  result = objc_msgSend(v4, sel_mapItemStorageForGEOMapItem_forUseType_, v5, 4);
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
