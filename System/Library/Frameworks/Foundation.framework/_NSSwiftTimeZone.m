@implementation _NSSwiftTimeZone

- (void)encodeWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[NSTimeZone encodeWithCoder:](&v4, sel_encodeWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
}

- (NSData)data
{
  _NSSwiftTimeZone *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  Class isa;

  v2 = self;
  v3 = _NSSwiftTimeZone.data.getter();
  v5 = v4;

  isa = Data._Representation.bridgedReference()().super.isa;
  outlined consume of Data._Representation(v3, v5);
  return (NSData *)isa;
}

- (NSString)name
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftTimeZone *v6;
  void *v7;

  v3 = *(_QWORD *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 32);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);

  swift_unknownObjectRelease();
  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (int64_t)secondsFromGMTForDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t (*v8)(uint64_t *, uint64_t, uint64_t);
  _NSSwiftTimeZone *v9;
  int64_t v10;
  uint64_t v12;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v5 = v4;
  v6 = *(_QWORD *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  ObjectType = swift_getObjectType();
  v12 = v5;
  v8 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v6 + 40);
  v9 = self;
  swift_unknownObjectRetain();
  v10 = v8(&v12, ObjectType, v6);

  swift_unknownObjectRelease();
  return v10;
}

- (int64_t)secondsFromGMT
{
  _NSSwiftTimeZone *v2;
  int64_t v3;

  v2 = self;
  v3 = _NSSwiftTimeZone.secondsFromGMT.getter();

  return v3;
}

- (id)nextDaylightSavingTimeTransitionAfterDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(double *__return_ptr, uint64_t *, uint64_t, uint64_t);
  _NSSwiftTimeZone *v9;
  id v10;
  uint64_t v12;
  double v13;
  char v14;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v5 = v4;
  v6 = *(_QWORD *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  ObjectType = swift_getObjectType();
  v12 = v5;
  v8 = *(void (**)(double *__return_ptr, uint64_t *, uint64_t, uint64_t))(v6 + 80);
  v9 = self;
  swift_unknownObjectRetain();
  v8(&v13, &v12, ObjectType, v6);

  swift_unknownObjectRelease();
  if ((v14 & 1) != 0)
    v10 = 0;
  else
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSinceReferenceDate_, v13);
  return v10;
}

- (Class)classForCoder
{
  type metadata accessor for NSMorphologyPronoun(0, (unint64_t *)&lazy cache variable for type metadata for NSTimeZone);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)replacementObjectForKeyedArchiver:(id)a3
{
  id v4;
  _NSSwiftTimeZone *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD v14[3];
  uint64_t v15;

  v4 = a3;
  v5 = self;
  _NSSwiftTimeZone.replacementObject(for:)(v14);

  v6 = v15;
  if (!v15)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_1(v14, v15);
  v8 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v8 + 16))(v11, v9);
  v12 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v12;
}

- (double)daylightSavingTimeOffset
{
  _NSSwiftTimeZone *v2;
  double v3;

  v2 = self;
  v3 = _NSSwiftTimeZone.daylightSavingTimeOffset.getter();

  return v3;
}

- (NSString)abbreviation
{
  _NSSwiftTimeZone *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  _NSSwiftTimeZone.abbreviation.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)isDaylightSavingTime
{
  _NSSwiftTimeZone *v2;
  char v3;

  v2 = self;
  v3 = _NSSwiftTimeZone.isDaylightSavingTime.getter();

  return v3 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSSwiftTimeZone)initWithCoder:(id)a3
{
  _NSSwiftTimeZone *result;

  result = (_NSSwiftTimeZone *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)abbreviationForDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(uint64_t *, uint64_t, uint64_t);
  _NSSwiftTimeZone *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v5 = v4;
  v6 = *(_QWORD *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  ObjectType = swift_getObjectType();
  v14 = v5;
  v8 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 56);
  v9 = self;
  swift_unknownObjectRetain();
  v8(&v14, ObjectType, v6);
  v11 = v10;

  swift_unknownObjectRelease();
  if (v11)
  {
    v12 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (BOOL)isDaylightSavingTimeForDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t (*v8)(uint64_t *, uint64_t, uint64_t);
  _NSSwiftTimeZone *v9;
  uint64_t v11;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v5 = v4;
  v6 = *(_QWORD *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  ObjectType = swift_getObjectType();
  v11 = v5;
  v8 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v6 + 64);
  v9 = self;
  swift_unknownObjectRetain();
  LOBYTE(v6) = v8(&v11, ObjectType, v6);

  swift_unknownObjectRelease();
  return v6 & 1;
}

- (double)daylightSavingTimeOffsetForDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  double (*v8)(uint64_t *, uint64_t, uint64_t);
  _NSSwiftTimeZone *v9;
  double v10;
  uint64_t v12;

  objc_msgSend(a3, sel_timeIntervalSinceReferenceDate);
  v5 = v4;
  v6 = *(_QWORD *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  ObjectType = swift_getObjectType();
  v12 = v5;
  v8 = *(double (**)(uint64_t *, uint64_t, uint64_t))(v6 + 72);
  v9 = self;
  swift_unknownObjectRetain();
  v10 = v8(&v12, ObjectType, v6);

  swift_unknownObjectRelease();
  return v10;
}

- (NSDate)nextDaylightSavingTimeTransition
{
  _NSSwiftTimeZone *v2;
  id v3;
  double v5;
  char v6;

  v2 = self;
  _NSSwiftTimeZone.nextDaylightSavingTimeTransition.getter();

  if ((v6 & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSinceReferenceDate_, v5);
  return (NSDate *)v3;
}

- (id)localizedName:(int64_t)a3 locale:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t ObjectType;
  void (*v13)(int64_t, _QWORD *, uint64_t, uint64_t);
  _NSSwiftTimeZone *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];

  if (a4)
  {
    type metadata accessor for _NSSwiftLocale();
    v7 = swift_dynamicCastClass();
    if (v7)
    {
      v8 = *(_QWORD *)(v7 + OBJC_IVAR____NSSwiftLocale_locale);
      v9 = *(_QWORD *)(v7 + OBJC_IVAR____NSSwiftLocale_locale + 8);
      swift_unknownObjectRetain();
    }
    else
    {
      type metadata accessor for _LocaleBridged();
      v8 = swift_allocObject();
      *(_QWORD *)(v8 + 16) = a4;
      v9 = lazy protocol witness table accessor for type CFDictionaryRef and conformance CFDictionaryRef((unint64_t *)&lazy protocol witness table cache variable for type _LocaleBridged and conformance _LocaleBridged, (uint64_t (*)(uint64_t))type metadata accessor for _LocaleBridged, (uint64_t)&protocol conformance descriptor for _LocaleBridged);
      v10 = a4;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v11 = *(_QWORD *)&self->timeZone[OBJC_IVAR____NSSwiftTimeZone_timeZone];
  ObjectType = swift_getObjectType();
  v19[0] = v8;
  v19[1] = v9;
  v13 = *(void (**)(int64_t, _QWORD *, uint64_t, uint64_t))(v11 + 88);
  v14 = self;
  swift_unknownObjectRetain();
  v13(a3, v19, ObjectType, v11);
  v16 = v15;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (!v16)
    return 0;
  v17 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return v17;
}

- (_NSSwiftTimeZone)init
{
  _NSSwiftTimeZone *result;

  result = (_NSSwiftTimeZone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_NSSwiftTimeZone)initWithName:(id)a3
{
  _NSSwiftTimeZone *result;

  result = (_NSSwiftTimeZone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_NSSwiftTimeZone)initWithName:(id)a3 data:(id)a4
{
  id v4;
  _NSSwiftTimeZone *result;

  if (a4)
  {
    v4 = a4;
    specialized Data.init(referencing:)(v4);

  }
  result = (_NSSwiftTimeZone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
