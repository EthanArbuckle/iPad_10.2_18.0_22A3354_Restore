@implementation LocationDescriptionGenerator

- (_TtC13CalendarUIKit28LocationDescriptionGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocationDescriptionGenerator();
  return -[LocationDescriptionGenerator init](&v3, sel_init);
}

+ (id)locationStringFor:(id)a3 options:(unint64_t)a4 incomplete:(BOOL *)a5 leadingImageName:(id *)a6
{
  id v10;
  void *v11;

  swift_getObjCClassMetadata();
  v10 = a3;
  v11 = (void *)static LocationDescriptionGenerator.locationString(for:options:incomplete:leadingImageName:)(a3, a4, a5, a6);

  return v11;
}

+ (id)locationStringFor:(id)a3 locationWithoutPrediction:(id)a4 preferredLocation:(id)a5 conferenceURL:(id)a6 conferenceURLIsBroadcast:(BOOL)a7 options:(unint64_t)a8 incomplete:(BOOL *)a9 leadingImageName:(id *)a10
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;
  unint64_t v25;

  v25 = a8;
  HIDWORD(v24) = a7;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1B3020);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    sub_1B8B9B030();
    v17 = sub_1B8B9B054();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    v18 = sub_1B8B9B054();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  swift_getObjCClassMetadata();
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = (void *)static LocationDescriptionGenerator.locationString(for:locationWithoutPrediction:preferredLocation:conferenceURL:conferenceURLIsBroadcast:options:incomplete:leadingImageName:)(a3, a4, a5, (uint64_t)v16, SHIDWORD(v24), v25, a9, a10);

  sub_1B8ADE894((uint64_t)v16, &qword_1ED1B3020);
  return v22;
}

+ (id)labelFor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)_s13CalendarUIKit28LocationDescriptionGeneratorC5label3forSo8NSStringCSgSo012EKStructuredC0CSg_tFZ_0(a3);

  return v5;
}

+ (id)conferenceStringFor:(id)a3 conferenceURLIsBroadcast:(BOOL)a4 options:(unint64_t)a5 outImageName:(id *)a6 incomplete:(BOOL *)a7
{
  char v9;
  _BOOL4 v10;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;

  v9 = a5;
  v10 = a4;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1B3020);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1B8B9B030();
    v15 = sub_1B8B9B054();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  else
  {
    v16 = sub_1B8B9B054();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v14, 1, 1, v16);
  }
  v17 = (void *)static LocationDescriptionGenerator.conferenceString(for:conferenceURLIsBroadcast:options:outImageName:incomplete:)((uint64_t)v14, v10, v9, a6, a7);
  sub_1B8ADE894((uint64_t)v14, &qword_1ED1B3020);
  return v17;
}

@end
