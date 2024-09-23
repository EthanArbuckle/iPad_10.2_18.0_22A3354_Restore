@implementation MSServerEvaluationStatus

- (MSServerEvaluationStatus)initWithArpStatus:(BOOL)a3 positionIndex:(int64_t)a4 rapStatus:(BOOL)a5 reliabilityStatus:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v9;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  if (qword_1ED1AB880 != -1)
    swift_once();
  return -[MSServerEvaluationStatus initWithStore:arpStatus:positionIndex:rapStatus:reliabilityStatus:](self, sel_initWithStore_arpStatus_positionIndex_rapStatus_reliabilityStatus_, qword_1ED1AB9F0, v9, a4, v7, v6);
}

- (MSServerEvaluationStatus)initWithStore:(id)a3 arpStatus:(BOOL)a4 positionIndex:(int64_t)a5 rapStatus:(BOOL)a6 reliabilityStatus:(BOOL)a7
{
  return (MSServerEvaluationStatus *)ServerEvaluationStatus.init(store:arpStatus:positionIndex:rapStatus:reliabilityStatus:)(a3, a4, a5, a6, a7);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedServerEvaluationStatus();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5;
  MSServerEvaluationStatus *v6;

  v5 = a3;
  v6 = self;
  sub_1A4145BA8(v5);

}

- (BOOL)arpStatus
{
  return sub_1A4145298((char *)self, (uint64_t)a2, &OBJC_IVAR___MSServerEvaluationStatus__arpStatus);
}

- (void)setArpStatus:(BOOL)a3
{
  MSServerEvaluationStatus *v4;

  v4 = self;
  sub_1A4144A8C(a3);

}

- (int64_t)positionIndex
{
  void *v2;
  MSServerEvaluationStatus *v3;
  int64_t v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSServerEvaluationStatus__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  MSServerEvaluationStatus *v4;

  v4 = self;
  sub_1A4144DA8(a3);

}

- (BOOL)rapStatus
{
  return sub_1A4145298((char *)self, (uint64_t)a2, &OBJC_IVAR___MSServerEvaluationStatus__rapStatus);
}

- (void)setRapStatus:(BOOL)a3
{
  MSServerEvaluationStatus *v4;

  v4 = self;
  sub_1A414506C(a3);

}

- (BOOL)reliabilityStatus
{
  return sub_1A4145298((char *)self, (uint64_t)a2, &OBJC_IVAR___MSServerEvaluationStatus__reliabilityStatus);
}

- (void)setReliabilityStatus:(BOOL)a3
{
  MSServerEvaluationStatus *v4;

  v4 = self;
  sub_1A41453A8(a3);

}

- (MSServerEvaluationStatus)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___MSServerEvaluationStatus__arpStatus) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSServerEvaluationStatus__positionIndex) = 0;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___MSServerEvaluationStatus__rapStatus) = 0;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___MSServerEvaluationStatus__reliabilityStatus) = 0;
  v8 = a3;
  return (MSServerEvaluationStatus *)sub_1A4185C24(a3, a4, a5);
}

@end
