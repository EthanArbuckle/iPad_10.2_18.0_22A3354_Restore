@implementation MapsSyncServerEvaluationStatus

- (BOOL)arpStatus
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__arpStatus);
}

- (BOOL)rapStatus
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__rapStatus);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync30MapsSyncServerEvaluationStatus *v4;
  _TtC8MapsSync30MapsSyncServerEvaluationStatus *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A41F20E4((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  unsigned __int8 v8;
  _TtC8MapsSync30MapsSyncServerEvaluationStatus *v9;

  v4 = a3;
  v9 = self;
  sub_1A41CF8C8(v4);
  type metadata accessor for MapsSyncManagedServerEvaluationStatus();
  v5 = swift_dynamicCastClass();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = v4;
    v8 = objc_msgSend(v6, sel_arpStatus);
    *((_BYTE *)&v9->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__arpStatus) = v8;
    LOBYTE(v6) = objc_msgSend(v6, sel_rapStatus);

    *((_BYTE *)&v9->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__rapStatus) = (_BYTE)v6;
  }

}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedServerEvaluationStatus();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8MapsSync30MapsSyncServerEvaluationStatus *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1A40E7534;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A41CFDB0((uint64_t)sub_1A41F251C, v6);

  swift_release();
  swift_release();
}

- (NSString)description
{
  _TtC8MapsSync30MapsSyncServerEvaluationStatus *v2;
  void *v3;

  v2 = self;
  sub_1A41F2614();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8MapsSync30MapsSyncServerEvaluationStatus)initWithObject:(id)a3
{
  id v4;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__arpStatus) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync30MapsSyncServerEvaluationStatus__rapStatus) = 0;
  v4 = a3;
  return (_TtC8MapsSync30MapsSyncServerEvaluationStatus *)sub_1A41D033C(a3);
}

@end
