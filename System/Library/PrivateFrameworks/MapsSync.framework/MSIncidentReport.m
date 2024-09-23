@implementation MSIncidentReport

- (MSIncidentReport)initWithCountryCode:(id)a3 positionIndex:(int64_t)a4 type:(signed __int16)a5
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  MSIncidentReport *v12;

  v5 = a5;
  if (a3)
  {
    sub_1A423C14C();
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  if (qword_1ED1AB880 != -1)
    swift_once();
  v10 = qword_1ED1AB9F0;
  if (v9)
  {
    v11 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v12 = -[MSIncidentReport initWithStore:countryCode:positionIndex:type:](self, sel_initWithStore_countryCode_positionIndex_type_, v10, v11, a4, v5);

  return v12;
}

- (MSIncidentReport)initWithStore:(id)a3 countryCode:(id)a4 positionIndex:(int64_t)a5 type:(signed __int16)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  if (a4)
  {
    v9 = sub_1A423C14C();
    v11 = v10;
  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  v12 = sub_1A41AEC98(a3, v9, v11, a5, a6);
  swift_bridgeObjectRelease();
  return (MSIncidentReport *)v12;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedIncidentReport();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6;
  MSIncidentReport *v7;

  v6 = a3;
  v7 = self;
  sub_1A41ADCB0(v6, a4);

}

- (NSString)countryCode
{
  MSIncidentReport *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1A41ADE60();
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

- (void)setCountryCode:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MSIncidentReport *v7;

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
  sub_1A41AEF00(v4, v6);

  swift_bridgeObjectRelease();
}

- (int64_t)positionIndex
{
  void *v2;
  MSIncidentReport *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSIncidentReport__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSIncidentReport *v4;

  v4 = self;
  sub_1A41AE578(a3);

}

- (signed)type
{
  void *v2;
  MSIncidentReport *v3;
  signed __int16 v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(_WORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSIncidentReport__type);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setType:(signed __int16)a3
{
  MSIncidentReport *v4;

  v4 = self;
  sub_1A41AE8E0(a3);

}

- (MSIncidentReport)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  _QWORD *v8;
  id v9;

  v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSIncidentReport__countryCode);
  *v8 = 0;
  v8[1] = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSIncidentReport__positionIndex) = 0;
  *(_WORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSIncidentReport__type) = 0;
  v9 = a3;
  return (MSIncidentReport *)sub_1A4185C24(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
