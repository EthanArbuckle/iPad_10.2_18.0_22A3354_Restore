@implementation MSRAPRecord

- (MSRAPRecord)initWithClientRevision:(signed __int16)a3 contentData:(id)a4 countryCode:(id)a5 positionIndex:(int64_t)a6 rapResponse:(id)a7 reportId:(id)a8 status:(signed __int16)a9 statusLastUpdatedDate:(id)a10 summary:(id)a11 type:(signed __int16)a12
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  MSRAPRecord *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  int v55;
  MSRAPRecord *v56;
  uint64_t v57;

  v56 = self;
  v57 = a6;
  v55 = a3;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v19 = a5;
    v20 = a7;
    v21 = a8;
    v22 = a10;
    v23 = a11;
    v24 = a4;
    v25 = sub_1A423BF54();
    v53 = v26;
    v54 = v25;

    if (a5)
      goto LABEL_3;
  }
  else
  {
    v36 = a5;
    v37 = a7;
    v38 = a8;
    v39 = a10;
    v40 = a11;
    v53 = 0xF000000000000000;
    v54 = 0;
    if (a5)
    {
LABEL_3:
      v27 = sub_1A423C14C();
      v51 = v28;
      v52 = v27;

      if (a7)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  v51 = 0;
  v52 = 0;
  if (a7)
  {
LABEL_4:
    v29 = sub_1A423BF54();
    v31 = v30;

    if (a8)
      goto LABEL_5;
LABEL_10:
    v32 = 0;
    v34 = 0;
    if (a10)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v29 = 0;
  v31 = 0xF000000000000000;
  if (!a8)
    goto LABEL_10;
LABEL_5:
  v32 = sub_1A423C14C();
  v34 = v33;

  if (a10)
  {
LABEL_6:
    sub_1A423BF84();

    v35 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v18, 0, 1, v35);
    goto LABEL_12;
  }
LABEL_11:
  v41 = sub_1A423BF9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v18, 1, 1, v41);
LABEL_12:
  if (a11)
  {
    v42 = sub_1A423C14C();
    v44 = v43;

  }
  else
  {
    v42 = 0;
    v44 = 0;
  }
  v49 = (uint64_t)v18;
  v46 = v53;
  v45 = v54;
  v47 = (MSRAPRecord *)sub_1A40F1400(v55, v54, v53, v52, v51, v57, v29, v31, v32, v34, a9, v49, v42, v44, a12);
  sub_1A40D7778(v29, v31);
  sub_1A40D7778(v45, v46);
  return v47;
}

- (MSRAPRecord)initWithStore:(id)a3 clientRevision:(signed __int16)a4 contentData:(id)a5 countryCode:(id)a6 positionIndex:(int64_t)a7 rapResponse:(id)a8 reportId:(id)a9 status:(signed __int16)a10 statusLastUpdatedDate:(id)a11 summary:(id)a12 type:(signed __int16)a13
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  id v53;
  int v54;
  MSRAPRecord *v55;
  uint64_t v56;

  v55 = self;
  v56 = a7;
  v54 = a4;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = a3;
  if (a5)
  {
    v20 = a3;
    v21 = a6;
    v22 = a8;
    v23 = a9;
    v24 = a11;
    v25 = a12;
    v26 = a5;
    v27 = sub_1A423BF54();
    v51 = v28;
    v52 = v27;

    if (a6)
      goto LABEL_3;
  }
  else
  {
    v38 = a3;
    v39 = a6;
    v40 = a8;
    v41 = a9;
    v42 = a11;
    v43 = a12;
    v51 = 0xF000000000000000;
    v52 = 0;
    if (a6)
    {
LABEL_3:
      v29 = sub_1A423C14C();
      v49 = v30;
      v50 = v29;

      if (a8)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  v49 = 0;
  v50 = 0;
  if (a8)
  {
LABEL_4:
    v31 = sub_1A423BF54();
    v33 = v32;

    if (a9)
      goto LABEL_5;
LABEL_10:
    v34 = 0;
    v36 = 0;
    if (a11)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v31 = 0;
  v33 = 0xF000000000000000;
  if (!a9)
    goto LABEL_10;
LABEL_5:
  v34 = sub_1A423C14C();
  v36 = v35;

  if (a11)
  {
LABEL_6:
    sub_1A423BF84();

    v37 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v19, 0, 1, v37);
    goto LABEL_12;
  }
LABEL_11:
  v44 = sub_1A423BF9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v19, 1, 1, v44);
LABEL_12:
  if (a12)
  {
    v45 = sub_1A423C14C();
    v47 = v46;

  }
  else
  {
    v45 = 0;
    v47 = 0;
  }
  return (MSRAPRecord *)RAPRecord.init(store:clientRevision:contentData:countryCode:positionIndex:rapResponse:reportId:status:statusLastUpdatedDate:summary:type:)(v53, v54, v52, v51, v50, v49, v56, v31, v33, v34, v36, a10, (uint64_t)v19, v45, v47, a13);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedRAPRecord();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSRAPRecord *v7;

  v6 = a3;
  v7 = self;
  sub_1A40EDAF0(v6, a4);

}

- (signed)clientRevision
{
  return sub_1A40F099C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSRAPRecord__clientRevision);
}

- (void)setClientRevision:(signed __int16)a3
{
  MSRAPRecord *v4;

  v4 = self;
  sub_1A40EDFB8(a3);

}

- (NSData)contentData
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A40EE1E4);
}

- (void)setContentData:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A40F1724);
}

- (NSString)countryCode
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A40EE588);
}

- (void)setCountryCode:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A40F1944);
}

- (int64_t)positionIndex
{
  void *v2;
  MSRAPRecord *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSRAPRecord__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSRAPRecord *v4;

  v4 = self;
  sub_1A40EE9F8(a3);

}

- (NSData)rapResponse
{
  return (NSData *)sub_1A40DBC58(self, (uint64_t)a2, sub_1A40EEC70);
}

- (void)setRapResponse:(id)a3
{
  sub_1A40DBFF0(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1A40F1B44);
}

- (NSString)reportId
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A40EF1EC);
}

- (void)setReportId:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A40F1D38);
}

- (signed)status
{
  return sub_1A40F099C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSRAPRecord__status);
}

- (void)setStatus:(signed __int16)a3
{
  MSRAPRecord *v4;

  v4 = self;
  sub_1A40EF5B8(a3);

}

- (NSDate)statusLastUpdatedDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  MSRAPRecord *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1A40EF89C((uint64_t)v5);

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

- (void)setStatusLastUpdatedDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  MSRAPRecord *v10;
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
  sub_1A40EFD50((uint64_t)v7);

}

- (NSString)summary
{
  return (NSString *)sub_1A40D9DDC(self, (uint64_t)a2, (void (*)(void))sub_1A40F044C);
}

- (void)setSummary:(id)a3
{
  sub_1A40DA154(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1A40F211C);
}

- (signed)type
{
  return sub_1A40F099C((char *)self, (uint64_t)a2, &OBJC_IVAR___MSRAPRecord__type);
}

- (void)setType:(signed __int16)a3
{
  MSRAPRecord *v4;

  v4 = self;
  sub_1A40F0AAC(a3);

}

- (MSCommunityID)communityID
{
  MSRAPRecord *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A40F0D58();

  return (MSCommunityID *)v3;
}

- (void)setCommunityID:(id)a3
{
  id v5;
  MSRAPRecord *v6;

  v5 = a3;
  v6 = self;
  sub_1A40F0FD8(a3);

}

- (MSRAPRecord)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  v8 = a3;
  return (MSRAPRecord *)sub_1A40F117C(a3, a4, a5);
}

- (void).cxx_destruct
{
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSRAPRecord__contentData), *(_QWORD *)&self->super._store[OBJC_IVAR___MSRAPRecord__contentData]);
  swift_bridgeObjectRelease();
  sub_1A40D7778(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSRAPRecord__rapResponse), *(_QWORD *)&self->super._store[OBJC_IVAR___MSRAPRecord__rapResponse]);
  swift_bridgeObjectRelease();
  sub_1A40F1680((uint64_t)self + OBJC_IVAR___MSRAPRecord__statusLastUpdatedDate);
  swift_bridgeObjectRelease();
}

@end
