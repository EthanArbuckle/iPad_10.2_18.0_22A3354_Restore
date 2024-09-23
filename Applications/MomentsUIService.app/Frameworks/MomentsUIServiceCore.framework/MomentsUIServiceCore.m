uint64_t one-time initialization function for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t result;
  uint64_t v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  if (one-time initialization token for defaults != -1)
    swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v6 = 0u;
    v7 = 0u;
LABEL_11:
    result = outlined destroy of Date?((uint64_t)&v6, &demangling cache variable for type metadata for Any?);
    goto LABEL_12;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v5, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  outlined init with take of Any?((uint64_t)v5, (uint64_t)&v6);
  if (!*((_QWORD *)&v7 + 1))
    goto LABEL_11;
  result = swift_dynamicCast(v5, &v6, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
  if ((result & 1) == 0)
  {
LABEL_12:
    v4 = 0x4062C00000000000;
    goto LABEL_13;
  }
  v4 = *(_QWORD *)&v5[0];
LABEL_13:
  static MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD = v4;
  return result;
}

uint64_t *MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD.unsafeMutableAddressor()
{
  if (one-time initialization token for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD != -1)
    swift_once(&one-time initialization token for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD, one-time initialization function for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD);
  return &static MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD;
}

double static MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD.getter()
{
  if (one-time initialization token for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD != -1)
    swift_once(&one-time initialization token for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD, one-time initialization function for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD);
  return *(double *)&static MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD;
}

void *MOMapLocation.METERS_TO_DEGREES.unsafeMutableAddressor()
{
  return &static MOMapLocation.METERS_TO_DEGREES;
}

double static MOMapLocation.METERS_TO_DEGREES.getter()
{
  return 111000.0;
}

void *MOMapLocation.MEDIUM_AND_HIGH_CONFIDENCE_THRESHOLD.unsafeMutableAddressor()
{
  return &static MOMapLocation.MEDIUM_AND_HIGH_CONFIDENCE_THRESHOLD;
}

double static MOMapLocation.MEDIUM_AND_HIGH_CONFIDENCE_THRESHOLD.getter()
{
  return 0.9;
}

uint64_t key path getter for MOMapLocation.startDate : MOMapLocation(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 192))();
}

uint64_t key path setter for MOMapLocation.startDate : MOMapLocation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v6);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 200))(v6);
}

uint64_t MOMapLocation.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  return MOMapLocation.startDate.getter(&OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_startDate, a1);
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t MOMapLocation.startDate.setter(uint64_t a1)
{
  return MOMapLocation.startDate.setter(a1, &OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_startDate);
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*MOMapLocation.startDate.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_startDate, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOMapLocation.startDate@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t key path getter for MOMapLocation.endDate : MOMapLocation(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 216))();
}

uint64_t key path setter for MOMapLocation.endDate : MOMapLocation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v6);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 224))(v6);
}

uint64_t MOMapLocation.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  return MOMapLocation.startDate.getter(&OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_endDate, a1);
}

uint64_t MOMapLocation.startDate.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[24];

  v4 = v2 + *a1;
  swift_beginAccess(v4, v6, 0, 0);
  return outlined init with copy of Date?(v4, a2);
}

uint64_t MOMapLocation.endDate.setter(uint64_t a1)
{
  return MOMapLocation.startDate.setter(a1, &OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_endDate);
}

uint64_t MOMapLocation.startDate.setter(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[24];

  v4 = v2 + *a2;
  swift_beginAccess(v4, v6, 33, 0);
  outlined assign with take of Date?(a1, v4);
  return swift_endAccess(v6);
}

uint64_t (*MOMapLocation.endDate.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_endDate, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

void key path getter for MOMapLocation.latitude : MOMapLocation(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(_QWORD **)a1 + 240))();
}

uint64_t key path setter for MOMapLocation.latitude : MOMapLocation(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(_QWORD **)a2 + 248))(*a1);
}

double MOMapLocation.latitude.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_latitude;
  swift_beginAccess(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_latitude, v3, 0, 0);
  return *(double *)v1;
}

uint64_t MOMapLocation.latitude.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (double *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_latitude);
  result = swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_latitude, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.latitude.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_latitude, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

void key path getter for MOMapLocation.longitude : MOMapLocation(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(_QWORD **)a1 + 264))();
}

uint64_t key path setter for MOMapLocation.longitude : MOMapLocation(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(_QWORD **)a2 + 272))(*a1);
}

double MOMapLocation.longitude.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_longitude;
  swift_beginAccess(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_longitude, v3, 0, 0);
  return *(double *)v1;
}

uint64_t MOMapLocation.longitude.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (double *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_longitude);
  result = swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_longitude, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.longitude.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_longitude, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOPOIAnnotationViewConfiguration.geoMapItem()
{
  return 0;
}

uint64_t key path getter for MOMapLocation.mapItem : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 288))();
  *a2 = result;
  return result;
}

uint64_t key path setter for MOMapLocation.mapItem : MOMapLocation(_QWORD *a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 296);
  v3 = swift_unknownObjectRetain(*a1);
  return v2(v3);
}

uint64_t MOMapLocation.mapItem.getter()
{
  uint64_t v0;
  _QWORD *v1;
  _BYTE v3[24];

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_mapItem);
  swift_beginAccess(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_mapItem, v3, 0, 0);
  return swift_unknownObjectRetain(*v1);
}

uint64_t MOMapLocation.mapItem.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_mapItem);
  swift_beginAccess(v3, v6, 1, 0);
  v4 = *v3;
  *v3 = a1;
  return swift_unknownObjectRelease(v4);
}

uint64_t (*MOMapLocation.mapItem.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_mapItem, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOMapLocation.clusterCount()
{
  return 0;
}

uint64_t key path getter for MOMapLocation.clusterCount : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 312))();
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t key path setter for MOMapLocation.clusterCount : MOMapLocation(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)a2 + 320))(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t MOMapLocation.clusterCount.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_clusterCount;
  swift_beginAccess(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_clusterCount, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t MOMapLocation.clusterCount.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  _BYTE v7[24];

  v5 = v2 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_clusterCount;
  result = swift_beginAccess(v5, v7, 1, 0);
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t (*MOMapLocation.clusterCount.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_clusterCount, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

uint64_t key path getter for MOMapLocation.title : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 336))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t key path setter for MOMapLocation.title : MOMapLocation(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 344);
  swift_bridgeObjectRetain(v3);
  return v4(v2, v3);
}

uint64_t MOMapLocation.title.getter()
{
  return MOMapLocation.title.getter(&OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_title);
}

uint64_t MOMapLocation.title.setter(uint64_t a1, uint64_t a2)
{
  return MOMapLocation.title.setter(a1, a2, &OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_title);
}

uint64_t (*MOMapLocation.title.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_title, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

double variable initialization expression of MOSuggestionAssetMapsClusterer.Cluster.horizontalUncertainty()
{
  return 0.0;
}

void key path getter for MOMapLocation.confidenceLevel : MOMapLocation(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(_QWORD **)a1 + 360))();
}

uint64_t key path setter for MOMapLocation.confidenceLevel : MOMapLocation(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(_QWORD **)a2 + 368))(*a1);
}

double MOMapLocation.confidenceLevel.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_confidenceLevel;
  swift_beginAccess(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_confidenceLevel, v3, 0, 0);
  return *(double *)v1;
}

uint64_t MOMapLocation.confidenceLevel.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (double *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_confidenceLevel);
  result = swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_confidenceLevel, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.confidenceLevel.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_confidenceLevel, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOPOIAnnotationViewConfiguration.isMediumToHighConfidence()
{
  return 0;
}

uint64_t key path getter for MOMapLocation.isWork : MOMapLocation@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 384))();
  *a2 = result & 1;
  return result;
}

uint64_t key path setter for MOMapLocation.isWork : MOMapLocation(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 392))(*a1);
}

uint64_t MOMapLocation.isWork.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;
  _BYTE v3[24];

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isWork);
  swift_beginAccess(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isWork, v3, 0, 0);
  return *v1;
}

uint64_t MOMapLocation.isWork.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isWork);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.isWork.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isWork, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOMapLocation.userPlaceType()
{
  return -1;
}

uint64_t key path getter for MOMapLocation.userPlaceType : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 408))();
  *a2 = result;
  return result;
}

uint64_t key path setter for MOMapLocation.userPlaceType : MOMapLocation(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 416))(*a1);
}

uint64_t MOMapLocation.userPlaceType.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_userPlaceType;
  swift_beginAccess(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_userPlaceType, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t MOMapLocation.userPlaceType.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_userPlaceType);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.userPlaceType.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_userPlaceType, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOMapLocation.enclosingArea()
{
  return 0;
}

uint64_t key path getter for MOMapLocation.enclosingArea : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 432))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t key path setter for MOMapLocation.enclosingArea : MOMapLocation(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 440);
  swift_bridgeObjectRetain(v3);
  return v4(v2, v3);
}

uint64_t MOMapLocation.enclosingArea.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _BYTE v4[24];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_enclosingArea);
  swift_beginAccess(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_enclosingArea, v4, 0, 0);
  v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t MOMapLocation.enclosingArea.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v8[24];

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_enclosingArea);
  swift_beginAccess(v5, v8, 1, 0);
  v6 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease(v6);
}

uint64_t (*MOMapLocation.enclosingArea.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_enclosingArea, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

void key path getter for MOMapLocation.horizontalUncertainty : MOMapLocation(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(_QWORD **)a1 + 456))();
}

uint64_t key path setter for MOMapLocation.horizontalUncertainty : MOMapLocation(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(_QWORD **)a2 + 464))(*a1);
}

double MOMapLocation.horizontalUncertainty.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_horizontalUncertainty;
  swift_beginAccess(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_horizontalUncertainty, v3, 0, 0);
  return *(double *)v1;
}

uint64_t MOMapLocation.horizontalUncertainty.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (double *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_horizontalUncertainty);
  result = swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_horizontalUncertainty, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.horizontalUncertainty.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_horizontalUncertainty, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

uint64_t key path getter for MOMapLocation.isScaledDownPOI : MOMapLocation@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 480))();
  *a2 = result & 1;
  return result;
}

uint64_t key path setter for MOMapLocation.isScaledDownPOI : MOMapLocation(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 488))(*a1);
}

uint64_t MOMapLocation.isScaledDownPOI.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;
  _BYTE v3[24];

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isScaledDownPOI);
  swift_beginAccess(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isScaledDownPOI, v3, 0, 0);
  return *v1;
}

uint64_t MOMapLocation.isScaledDownPOI.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isScaledDownPOI);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*MOMapLocation.isScaledDownPOI.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isScaledDownPOI, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

uint64_t variable initialization expression of MOSuggestionAssetMapsClusterer.Cluster.title()
{
  return 0;
}

uint64_t key path getter for MOMapLocation.poiCategory : MOMapLocation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 504))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t key path setter for MOMapLocation.poiCategory : MOMapLocation(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 512);
  swift_bridgeObjectRetain(v3);
  return v4(v2, v3);
}

uint64_t MOMapLocation.poiCategory.getter()
{
  return MOMapLocation.title.getter(&OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_poiCategory);
}

uint64_t MOMapLocation.title.getter(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _BYTE v5[24];

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess(v2, v5, 0, 0);
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t MOMapLocation.poiCategory.setter(uint64_t a1, uint64_t a2)
{
  return MOMapLocation.title.setter(a1, a2, &OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_poiCategory);
}

uint64_t MOMapLocation.title.setter(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  _BYTE v9[24];

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = v6[1];
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease(v7);
}

uint64_t (*MOMapLocation.poiCategory.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_poiCategory, a1, 33, 0);
  return MOMapLocation.poiCategory.modify;
}

uint64_t MOMapLocation.__allocating_init(latitude:longitude:title:clusterCount:geoMapItem:confidenceLevel:isWork:enclosingArea:horizontalUncertainty:isScaledDownPOI:poiCateogory:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  char v25;
  uint64_t v26;

  v25 = a4 & 1;
  v26 = swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  MOMapLocation.init(latitude:longitude:title:clusterCount:geoMapItem:confidenceLevel:isWork:enclosingArea:horizontalUncertainty:isScaledDownPOI:poiCateogory:)(a1, a2, a3, v25, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
  return v26;
}

uint64_t MOMapLocation.init(latitude:longitude:title:clusterCount:geoMapItem:confidenceLevel:isWork:enclosingArea:horizontalUncertainty:isScaledDownPOI:poiCateogory:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t *v24;
  uint64_t v25;
  double *v26;
  _BYTE *v27;
  _QWORD *v28;
  double *v29;
  _BYTE *v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v44[24];
  _BYTE v45[24];
  _BYTE v46[24];
  _BYTE v47[24];
  _BYTE v48[24];
  _BYTE v49[24];
  _BYTE v50[24];
  _BYTE v51[32];

  v21 = v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_startDate;
  v22 = type metadata accessor for Date(0);
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v23(v21, 1, 1, v22);
  v23(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_endDate, 1, 1, v22);
  v24 = (uint64_t *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_mapItem);
  *(_QWORD *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_mapItem) = 0;
  v25 = v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_clusterCount;
  *(_QWORD *)v25 = 0;
  *(_BYTE *)(v25 + 8) = 1;
  v26 = (double *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_confidenceLevel);
  *(_QWORD *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_confidenceLevel) = 0;
  v27 = (_BYTE *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isWork);
  *(_BYTE *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isWork) = 0;
  *(_QWORD *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_userPlaceType) = -1;
  v28 = (_QWORD *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_enclosingArea);
  *v28 = 0;
  v28[1] = 0;
  v29 = (double *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_horizontalUncertainty);
  *(_QWORD *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_horizontalUncertainty) = 0;
  v30 = (_BYTE *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isScaledDownPOI);
  *(_BYTE *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_isScaledDownPOI) = 0;
  v31 = (_QWORD *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_poiCategory);
  *v31 = 0;
  v31[1] = 0xE000000000000000;
  *(double *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_latitude) = a9;
  *(double *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_longitude) = a10;
  v32 = (_QWORD *)(v15 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_title);
  *v32 = a1;
  v32[1] = a2;
  swift_beginAccess(v25, v51, 1, 0);
  *(_QWORD *)v25 = a3;
  *(_BYTE *)(v25 + 8) = a4 & 1;
  swift_beginAccess(v24, v50, 1, 0);
  v33 = *v24;
  *v24 = a5;
  swift_unknownObjectRelease(v33);
  swift_beginAccess(v26, v49, 1, 0);
  *v26 = a11;
  swift_beginAccess(v27, v48, 1, 0);
  *v27 = a6;
  swift_beginAccess(v28, v47, 1, 0);
  v34 = v28[1];
  *v28 = a7;
  v28[1] = a8;
  swift_bridgeObjectRelease(v34);
  swift_beginAccess(v29, v46, 1, 0);
  *v29 = a12;
  swift_beginAccess(v30, v45, 1, 0);
  *v30 = a13;
  swift_beginAccess(v31, v44, 1, 0);
  v35 = v31[1];
  *v31 = a14;
  v31[1] = a15;
  swift_bridgeObjectRelease(v35);
  return v15;
}

uint64_t MOMapLocation.shiftedIfNecessary.getter()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  id v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  double v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;

  v1 = v0;
  v2 = (*(double (**)(void))(*(_QWORD *)v0 + 240))();
  v3 = objc_msgSend(objc_allocWithZone((Class)CLLocation), "initWithLatitude:longitude:", v2, (*(double (**)(void))(*(_QWORD *)v0 + 264))());
  v4 = *(uint64_t (**)(void))(*(_QWORD *)v0 + 288);
  v5 = v4();
  swift_unknownObjectRelease(v5);
  if (v5)
    goto LABEL_6;
  if (one-time initialization token for shared != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  v6 = static MOLocationShifter.shared;
  if (((*(uint64_t (**)(id))(*(_QWORD *)static MOLocationShifter.shared + 96))(v3) & 1) == 0)
  {
LABEL_6:

    swift_retain(v1);
  }
  else
  {
    v7 = (void *)(*(uint64_t (**)(id))(*(_QWORD *)v6 + 104))(v3);
    objc_msgSend(v7, "coordinate");
    v9 = v8;
    v10 = objc_msgSend(v7, "coordinate");
    v12 = v11;
    v13 = (*(uint64_t (**)(id))(*(_QWORD *)v1 + 336))(v10);
    v27 = v14;
    v28 = v13;
    v15 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 312))();
    v17 = v16 & 1;
    v18 = v4();
    v19 = (*(double (**)(void))(*(_QWORD *)v1 + 360))();
    v20 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 384))();
    v21 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 432))();
    v23 = v22;
    v24 = (*(double (**)(void))(*(_QWORD *)v1 + 456))();
    v25 = type metadata accessor for MOMapLocation(0);
    v1 = swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
    MOMapLocation.init(latitude:longitude:title:clusterCount:geoMapItem:confidenceLevel:isWork:enclosingArea:horizontalUncertainty:isScaledDownPOI:poiCateogory:)(v28, v27, v15, v17, v18, v20 & 1, v21, v23, v9, v12, v19, v24, 0, 0, 0xE000000000000000);

  }
  return v1;
}

uint64_t MOMapLocation.deinit()
{
  uint64_t v0;

  outlined destroy of Date?(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_startDate, &demangling cache variable for type metadata for Date?);
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_endDate, &demangling cache variable for type metadata for Date?);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_mapItem));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_title + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_enclosingArea + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_poiCategory + 8));
  return v0;
}

uint64_t MOMapLocation.__deallocating_deinit()
{
  uint64_t v0;

  outlined destroy of Date?(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_startDate, &demangling cache variable for type metadata for Date?);
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_endDate, &demangling cache variable for type metadata for Date?);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_mapItem));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_title + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_enclosingArea + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore13MOMapLocation_poiCategory + 8));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t type metadata accessor for MOMapLocation(uint64_t a1)
{
  uint64_t result;

  result = type metadata singleton initialization cache for MOMapLocation;
  if (!type metadata singleton initialization cache for MOMapLocation)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MOMapLocation);
  return result;
}

id variable initialization expression of MOLocationShifter.shifter()
{
  return objc_msgSend(objc_allocWithZone((Class)GEOLocationShifter), "init");
}

uint64_t variable initialization expression of MOLocationShifter.processingQueue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  void *v15;

  v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue();
  static DispatchQoS.unspecified.getter();
  v15 = &_swiftEmptyArrayStorage;
  v10 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes((unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  v12 = lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v15, v11, v12, v4, v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002BLL, 0x800000000001D3A0, v9, v6, v3, 0);
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  unint64_t result;
  uint64_t v1;

  result = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

double variable initialization expression of MOPOIAnnotationViewConfiguration.pinTopOffset()
{
  return 2.0;
}

id variable initialization expression of MOPOIAnnotationView.basePOICircleView()
{
  return objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");
}

id variable initialization expression of MOPOIAnnotationView.clusterCountLabel()
{
  return objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
}

id variable initialization expression of MOPOIAnnotationView.borderBackgroundView()
{
  return objc_msgSend(objc_allocWithZone((Class)UIView), "init");
}

void *variable initialization expression of MOSuggestionAssetMapsClusterer.skipRows()
{
  return &_swiftEmptySetSingleton;
}

void *variable initialization expression of MOSuggestionAssetMapsClusterer.inputClusters()
{
  return &_swiftEmptyArrayStorage;
}

double default argument 1 of MOSuggestionAssetMapsClusterer.init(mapLocations:separationThreshold:)()
{
  return 0.5;
}

uint64_t default argument 1 of MOSuggestionAssetMapsClusterer.findSmallestEuclideanDistance(distanceMatrix:lowerHalfOnly:)()
{
  return 1;
}

uint64_t default argument 2 of static MOSuggestionAssetMapsClusterer.clusteredPins(locations:targetRegion:numBuckets:)()
{
  return 5;
}

uint64_t ObjC metadata update function for MOMapLocation()
{
  return type metadata accessor for MOMapLocation(0);
}

void type metadata completion function for MOMapLocation(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[14];

  type metadata accessor for Date?(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = v4[0];
    v4[2] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[4] = "\b";
    v4[5] = &unk_18F70;
    v4[6] = &unk_18F88;
    v4[7] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[8] = &unk_18FA0;
    v4[9] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[10] = &unk_18FB8;
    v4[11] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[12] = &unk_18FA0;
    v4[13] = &unk_18F88;
    swift_updateClassMetadata2(a1, 256, 14, v4, a1 + 80);
  }
}

void type metadata accessor for Date?(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!lazy cache variable for type metadata for Date?)
  {
    v2 = type metadata accessor for Date(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&lazy cache variable for type metadata for Date?);
  }
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for GEOLocationCoordinate2D(uint64_t a1)
{
  type metadata accessor for GEOLocationCoordinate2D(a1, &lazy cache variable for type metadata for GEOLocationCoordinate2D, (uint64_t)&unk_20E00);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance GEOPOICategory(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance GEOPOICategory(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance GEOPOICategory(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance GEOPOICategory(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance GEOPOICategory@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GEOPOICategory(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance GEOPOICategory@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance GEOPOICategory@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance GEOPOICategory(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type GEOPOICategory and conformance GEOPOICategory, (uint64_t (*)(uint64_t))type metadata accessor for GEOPOICategory, (uint64_t)&protocol conformance descriptor for GEOPOICategory);
  v3 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type GEOPOICategory and conformance GEOPOICategory, (uint64_t (*)(uint64_t))type metadata accessor for GEOPOICategory, (uint64_t)&protocol conformance descriptor for GEOPOICategory);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GEOPOICategory(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance GEOPOICategory(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance GEOPOICategory(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GEOPOICategory(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GEOPOICategory(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t outlined destroy of Date?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for CLLocationCoordinate2D(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CLLocationCoordinate2D(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
  type metadata accessor for GEOLocationCoordinate2D(a1, &lazy cache variable for type metadata for CLLocationCoordinate2D, (uint64_t)&unk_20E80);
}

void type metadata accessor for GEOPOICategory(uint64_t a1)
{
  type metadata accessor for GEOLocationCoordinate2D(a1, &lazy cache variable for type metadata for GEOPOICategory, (uint64_t)&unk_20EA8);
}

void type metadata accessor for GEOLocationCoordinate2D(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t base witness table accessor for RawRepresentable in GEOPOICategory()
{
  return lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type GEOPOICategory and conformance GEOPOICategory, (uint64_t (*)(uint64_t))type metadata accessor for GEOPOICategory, (uint64_t)&protocol conformance descriptor for GEOPOICategory);
}

uint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in GEOPOICategory()
{
  return lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type GEOPOICategory and conformance GEOPOICategory, (uint64_t (*)(uint64_t))type metadata accessor for GEOPOICategory, (uint64_t)&protocol conformance descriptor for GEOPOICategory);
}

uint64_t base witness table accessor for Equatable in GEOPOICategory()
{
  return lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type GEOPOICategory and conformance GEOPOICategory, (uint64_t (*)(uint64_t))type metadata accessor for GEOPOICategory, (uint64_t)&protocol conformance descriptor for GEOPOICategory);
}

void MOSuggestionAssetMapsClusterer.results.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t Array.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t WitnessTable;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  __int128 v14;
  __int128 v15;

  v8 = type metadata accessor for Array(0, a3);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v8);
  RandomAccessCollection<>.indices.getter(&v15, v8, WitnessTable, &protocol witness table for Int);
  v14 = v15;
  v13 = a1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<Int>);
  if ((Range.contains(_:)(&v13, v10) & 1) != 0)
  {
    Array.subscript.getter(a1, a2, a3);
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a4, v11, 1, a3);
}

uint64_t *MOLocationShifter.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  return &static MOLocationShifter.shared;
}

uint64_t CLLocation.shiftedIfNecessary.getter()
{
  uint64_t v0;

  if (one-time initialization token for shared != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)static MOLocationShifter.shared + 104))(v0);
}

uint64_t one-time initialization function for shared()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for MOLocationShifter();
  v1 = swift_allocObject(v0, 32, 7);
  result = MOLocationShifter.init()();
  static MOLocationShifter.shared = v1;
  return result;
}

uint64_t MOLocationShifter.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_allocObject(v0, 32, 7);
  MOLocationShifter.init()();
  return v1;
}

double static MOLocationShifter.shared.getter()
{
  double result;

  if (one-time initialization token for shared != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  *(_QWORD *)&result = swift_retain(static MOLocationShifter.shared).n128_u64[0];
  return result;
}

Swift::Bool __swiftcall MOLocationShifter.shiftNeeded(_:)(CLLocation a1)
{
  Class isa;
  double v2;
  double v3;
  double v4;

  isa = a1.super.isa;
  -[objc_class coordinate](a1.super.isa, "coordinate");
  v3 = v2;
  -[objc_class coordinate](isa, "coordinate");
  return objc_msgSend((id)objc_opt_self(GEOLocationShifter), "isLocationShiftRequiredForCoordinate:", v3, v4);
}

CLLocation __swiftcall MOLocationShifter.shiftedIfNecessary(_:)(CLLocation a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  id v29;
  Class v30;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  NSObject *v34;
  double v35;
  double v36;
  _QWORD *v37;
  void *v38;
  _QWORD *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD *v44;
  NSObject *v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  id v73;
  id v74;
  Class v75;
  CLLocation result;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  Class isa;
  char v89[24];
  void **aBlock;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  _QWORD *v95;

  isa = a1.super.isa;
  v1 = type metadata accessor for DispatchTime(0, a1._internal);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v77 - v6;
  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  -[objc_class coordinate](isa, "coordinate");
  v13 = v12;
  -[objc_class coordinate](isa, "coordinate");
  v15 = v14;
  if (objc_msgSend((id)objc_opt_self(GEOLocationShifter), "isLocationShiftRequiredForCoordinate:", v13, v14))
  {
    v82 = v7;
    v83 = v2;
    v84 = v1;
    v16 = swift_allocObject(&unk_20F80, 32, 7);
    *(double *)(v16 + 16) = v13;
    *(double *)(v16 + 24) = v15;
    v17 = swift_allocObject(&unk_20FA8, 24, 7);
    -[objc_class horizontalAccuracy](isa, "horizontalAccuracy");
    *(_QWORD *)(v17 + 16) = v18;
    v19 = *(void **)(v87 + 16);
    -[objc_class horizontalAccuracy](isa, "horizontalAccuracy");
    v85 = v17 + 16;
    v86 = v16 + 16;
    if (objc_msgSend(v19, "shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:", v16 + 16, v17 + 16, v13, v15, v20))
    {
      v21 = *(double *)(v16 + 16);
      v22 = *(double *)(v16 + 24);
      -[objc_class altitude](isa, "altitude");
      v24 = v23;
      v25 = *(double *)(v17 + 16);
      -[objc_class verticalAccuracy](isa, "verticalAccuracy");
      v27 = v26;
      v28 = -[objc_class timestamp](isa, "timestamp");
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v29 = objc_allocWithZone((Class)CLLocation);
      v30 = Date._bridgeToObjectiveC()().super.isa;
      v31 = (objc_class *)objc_msgSend(v29, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v30, v21, v22, v24, v25, v27);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      swift_release(v16);
      swift_release(v17);
    }
    else
    {
      v79 = v11;
      v80 = v9;
      v81 = v8;
      v34 = dispatch_group_create();
      dispatch_group_enter(v34);
      -[objc_class horizontalAccuracy](isa, "horizontalAccuracy");
      v36 = v35;
      v37 = (_QWORD *)swift_allocObject(&unk_20FD0, 40, 7);
      v37[2] = v16;
      v37[3] = v17;
      v37[4] = v34;
      v94 = partial apply for closure #1 in MOLocationShifter.shiftedIfNecessary(_:);
      v95 = v37;
      aBlock = _NSConcreteStackBlock;
      v91 = 1107296256;
      v92 = thunk for @escaping @callee_guaranteed (@unowned GEOLocationCoordinate2D, @unowned Double) -> ();
      v93 = &block_descriptor;
      v38 = _Block_copy(&aBlock);
      v39 = v95;
      v78 = v16;
      swift_retain(v16);
      v77 = v17;
      swift_retain(v17);
      v40 = v34;
      swift_release(v39);
      v94 = closure #2 in MOLocationShifter.shiftedIfNecessary(_:);
      v95 = 0;
      aBlock = _NSConcreteStackBlock;
      v91 = 1107296256;
      v92 = thunk for @escaping @callee_guaranteed () -> ();
      v93 = &block_descriptor_9;
      v41 = _Block_copy(&aBlock);
      v42 = swift_allocObject(&unk_21048, 24, 7);
      *(_QWORD *)(v42 + 16) = v40;
      v94 = partial apply for closure #3 in MOLocationShifter.shiftedIfNecessary(_:);
      v95 = (_QWORD *)v42;
      aBlock = _NSConcreteStackBlock;
      v91 = 1107296256;
      v92 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
      v93 = &block_descriptor_15;
      v43 = _Block_copy(&aBlock);
      v44 = v95;
      v45 = v40;
      swift_release(v44);
      objc_msgSend(v19, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v38, v41, v43, *(_QWORD *)(v87 + 24), v13, v15, v36);
      _Block_release(v43);
      _Block_release(v41);
      _Block_release(v38);
      static DispatchTime.now()();
      v46 = v82;
      + infix(_:_:)(v5, 5.0);
      v47 = v84;
      v48 = *(void (**)(char *, uint64_t))(v83 + 8);
      v48(v5, v84);
      v49 = OS_dispatch_group.wait(timeout:)(v46) & 1;
      v48(v46, v47);
      if ((static DispatchTimeoutResult.== infix(_:_:)(v49, 0) & 1) == 0)
      {
        if (one-time initialization token for assets != -1)
          swift_once(&one-time initialization token for assets, one-time initialization function for assets);
        v50 = type metadata accessor for Logger(0);
        v51 = __swift_project_value_buffer(v50, (uint64_t)static MOAngelLogger.assets);
        v52 = Logger.logObject.getter(v51);
        v53 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v52, v53))
        {
          v54 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v54 = 0;
          _os_log_impl(&dword_0, v52, v53, "[LocationShifter] Timed out", v54, 2u);
          swift_slowDealloc(v54, -1, -1);
        }

      }
      if (one-time initialization token for assets != -1)
        swift_once(&one-time initialization token for assets, one-time initialization function for assets);
      v55 = type metadata accessor for Logger(0);
      v56 = __swift_project_value_buffer(v55, (uint64_t)static MOAngelLogger.assets);
      v57 = Logger.logObject.getter(v56);
      v58 = static os_log_type_t.default.getter();
      v59 = os_log_type_enabled(v57, v58);
      v60 = v81;
      v61 = v80;
      v62 = v79;
      v63 = v78;
      v64 = v77;
      if (v59)
      {
        v65 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_0, v57, v58, "[LocationShifter] Returning shifted location", v65, 2u);
        swift_slowDealloc(v65, -1, -1);
      }

      swift_beginAccess(v86, &aBlock, 0, 0);
      v66 = *(double *)(v63 + 16);
      v67 = *(double *)(v63 + 24);
      -[objc_class altitude](isa, "altitude");
      v69 = v68;
      swift_beginAccess(v85, v89, 0, 0);
      v70 = *(double *)(v64 + 16);
      -[objc_class verticalAccuracy](isa, "verticalAccuracy");
      v72 = v71;
      v73 = -[objc_class timestamp](isa, "timestamp");
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v74 = objc_allocWithZone((Class)CLLocation);
      v75 = Date._bridgeToObjectiveC()().super.isa;
      v31 = (objc_class *)objc_msgSend(v74, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v75, v66, v67, v69, v70, v72);

      (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v60);
      swift_release(v63);
      swift_release(v64);

    }
    v33 = v31;
  }
  else
  {
    v33 = isa;
  }
  result._internal = v32;
  result.super.isa = v33;
  return result;
}

void closure #1 in MOLocationShifter.shiftedIfNecessary(_:)(uint64_t a1, uint64_t a2, NSObject *a3, double a4, double a5, double a6)
{
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  _BYTE v17[24];

  if (one-time initialization token for assets != -1)
    swift_once(&one-time initialization token for assets, one-time initialization function for assets);
  v12 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v12, (uint64_t)static MOAngelLogger.assets);
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "[LocationShifter] Shifted location async", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  swift_beginAccess(a1 + 16, v17, 1, 0);
  *(double *)(a1 + 16) = a4;
  *(double *)(a1 + 24) = a5;
  swift_beginAccess(a2 + 16, &v16, 1, 0);
  *(double *)(a2 + 16) = a6;
  dispatch_group_leave(a3);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned GEOLocationCoordinate2D, @unowned Double) -> ()(uint64_t a1, double a2, double a3, double a4)
{
  void (*v7)(double, double, double);
  uint64_t v8;

  v7 = *(void (**)(double, double, double))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  swift_retain(v8);
  v7(a2, a3, a4);
  return swift_release(v8);
}

void closure #2 in MOLocationShifter.shiftedIfNecessary(_:)()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (one-time initialization token for assets != -1)
    swift_once(&one-time initialization token for assets, one-time initialization function for assets);
  v0 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v0, (uint64_t)static MOAngelLogger.assets);
  oslog = Logger.logObject.getter();
  v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_0, oslog, v1, "[LocationShifter] Needs to download shifting function", v2, 2u);
    swift_slowDealloc(v2, -1, -1);
  }

}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  void (*v1)(__n128);
  uint64_t v2;
  __n128 v3;

  v1 = *(void (**)(__n128))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void closure #3 in MOLocationShifter.shiftedIfNecessary(_:)(uint64_t a1, dispatch_group_t group)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  _BYTE v15[8];
  uint64_t v16;

  if (a1)
  {
    ((void (*)(void))swift_errorRetain)();
    if (one-time initialization token for assets != -1)
      swift_once(&one-time initialization token for assets, one-time initialization function for assets);
    v4 = type metadata accessor for Logger(0);
    __swift_project_value_buffer(v4, (uint64_t)static MOAngelLogger.assets);
    swift_errorRetain(a1);
    v5 = swift_errorRetain(a1);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(12, -1);
      v9 = swift_slowAlloc(32, -1);
      v16 = v9;
      *(_DWORD *)v8 = 136315138;
      swift_getErrorValue(a1, v15, v14);
      v10 = Error.localizedDescription.getter(v14[1], v14[2]);
      v12 = v11;
      v13 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, v14, v8 + 4, v8 + 12);
      swift_bridgeObjectRelease(v12);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl(&dword_0, v6, v7, "[LocationShifter] error: %s", v8, 0xCu);
      swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);

      swift_errorRelease(a1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      swift_errorRelease(a1);

    }
  }
  dispatch_group_leave(group);
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

__C::CLLocationCoordinate2D __swiftcall MOLocationShifter.shiftedIfNecessary(_:)(__C::CLLocationCoordinate2D a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __C::CLLocationCoordinate2D result;

  v2 = objc_msgSend(objc_allocWithZone((Class)CLLocation), "initWithLatitude:longitude:", a1.latitude, a1.longitude);
  v3 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 104))();
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

uint64_t MOLocationShifter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t MOLocationShifter.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t MOLocationShifter.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  void *v17;

  v1 = v0;
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v1 + 16) = objc_msgSend(objc_allocWithZone((Class)GEOLocationShifter), "init");
  type metadata accessor for OS_dispatch_queue();
  static DispatchQoS.unspecified.getter();
  v17 = &_swiftEmptyArrayStorage;
  v12 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  v14 = lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v17, v13, v14, v6, v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  *(_QWORD *)(v1 + 24) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002BLL, 0x800000000001D3A0, v11, v8, v5, 0);
  return v1;
}

uint64_t sub_68E4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_68F4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_6904()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

void partial apply for closure #1 in MOLocationShifter.shiftedIfNecessary(_:)(double a1, double a2, double a3)
{
  uint64_t v3;

  closure #1 in MOLocationShifter.shiftedIfNecessary(_:)(*(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(NSObject **)(v3 + 32), a1, a2, a3);
}

double block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  *(_QWORD *)&result = swift_retain(v2).n128_u64[0];
  return result;
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_695C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void partial apply for closure #3 in MOLocationShifter.shiftedIfNecessary(_:)(uint64_t a1)
{
  uint64_t v1;

  closure #3 in MOLocationShifter.shiftedIfNecessary(_:)(a1, *(dispatch_group_t *)(v1 + 16));
}

uint64_t CLLocationCoordinate2D.shiftedIfNecessary.getter(double a1, double a2)
{
  if (one-time initialization token for shared != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  return (*(uint64_t (**)(double, double))(*(_QWORD *)static MOLocationShifter.shared + 112))(a1, a2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

uint64_t type metadata accessor for MOLocationShifter()
{
  return objc_opt_self(_TtC20MomentsUIServiceCore17MOLocationShifter);
}

BOOL static MOSuggestionAssetTransferDelivery.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void MOSuggestionAssetTransferDelivery.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int MOSuggestionAssetTransferDelivery.hashValue.getter(char a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MOSuggestionAssetTransferDelivery(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MOSuggestionAssetTransferDelivery()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance MOSuggestionAssetTransferDelivery()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MOSuggestionAssetTransferDelivery(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t MOSuggestionAssetTileSize.description.getter(unsigned __int8 a1)
{
  int v1;
  unint64_t result;

  v1 = a1 - 2;
  result = 0xD000000000000011;
  switch(v1)
  {
    case 0:
      result = 0x4C4C414D53;
      break;
    case 1:
      result = 1414744396;
      break;
    case 2:
      return result;
    case 3:
      result = 0x454752414CLL;
      break;
    case 4:
      result = 0x414C5F4152545845;
      break;
    case 5:
      result = 0xD000000000000015;
      break;
    case 6:
      result = 0x455243534C4C5546;
      break;
    case 7:
    case 8:
      result = 0xD000000000000016;
      break;
    default:
      result = 0x524546534E415254;
      break;
  }
  return result;
}

Swift::Bool __swiftcall MOSuggestionAssetTileSize.isHighestQualityForTransfer()()
{
  unsigned __int8 v0;

  return v0 - 11 < 0xFFFFFFF7;
}

Swift::Bool __swiftcall MOSuggestionAssetTileSize.isHighestQualityForTransfer3P()()
{
  unsigned __int8 v0;

  return (v0 - 11 < 0xFFFFFFF7) & v0;
}

void MOSuggestionAssetTileSize.hash(into:)(uint64_t a1, char a2)
{
  Swift::UInt v2;

  if ((a2 - 2) >= 9u)
  {
    Hasher._combine(_:)(7uLL);
    v2 = a2 & 1;
  }
  else
  {
    v2 = qword_19368[(char)(a2 - 2)];
  }
  Hasher._combine(_:)(v2);
}

Swift::Int MOSuggestionAssetTileSize.hashValue.getter(char a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  MOSuggestionAssetTileSize.hash(into:)((uint64_t)v3, a1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MOSuggestionAssetTileSize()
{
  char *v0;
  char v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  MOSuggestionAssetTileSize.hash(into:)((uint64_t)v3, v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance MOSuggestionAssetTileSize(uint64_t a1)
{
  char *v1;

  MOSuggestionAssetTileSize.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MOSuggestionAssetTileSize(uint64_t a1)
{
  char *v1;
  char v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  MOSuggestionAssetTileSize.hash(into:)((uint64_t)v4, v2);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MOSuggestionAssetTileSize(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized static MOSuggestionAssetTileSize.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t one-time initialization function for tileSizesByCount()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(Int, [MOSuggestionAssetTileSize])>);
  inited = swift_initStackObject(v0, &v30);
  *(_OWORD *)(inited + 16) = xmmword_19440;
  *(_QWORD *)(inited + 32) = 1;
  if (one-time initialization token for oneAssetsGrid != -1)
    swift_once(&one-time initialization token for oneAssetsGrid, one-time initialization function for oneAssetsGrid);
  v2 = static MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid;
  *(_QWORD *)(inited + 40) = static MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid;
  *(_QWORD *)(inited + 48) = 2;
  v3 = one-time initialization token for twoAssetsGrid;
  swift_bridgeObjectRetain(v2);
  if (v3 != -1)
    swift_once(&one-time initialization token for twoAssetsGrid, one-time initialization function for twoAssetsGrid);
  v4 = static MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid;
  *(_QWORD *)(inited + 56) = static MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid;
  *(_QWORD *)(inited + 64) = 3;
  v5 = one-time initialization token for threeAssetsGrid;
  swift_bridgeObjectRetain(v4);
  if (v5 != -1)
    swift_once(&one-time initialization token for threeAssetsGrid, one-time initialization function for threeAssetsGrid);
  v6 = static MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid;
  *(_QWORD *)(inited + 72) = static MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid;
  *(_QWORD *)(inited + 80) = 4;
  v7 = one-time initialization token for fourAssetsGrid;
  swift_bridgeObjectRetain(v6);
  if (v7 != -1)
    swift_once(&one-time initialization token for fourAssetsGrid, one-time initialization function for fourAssetsGrid);
  v8 = static MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid;
  *(_QWORD *)(inited + 88) = static MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid;
  *(_QWORD *)(inited + 96) = 5;
  v9 = one-time initialization token for fiveAssetsGrid;
  swift_bridgeObjectRetain(v8);
  if (v9 != -1)
    swift_once(&one-time initialization token for fiveAssetsGrid, one-time initialization function for fiveAssetsGrid);
  v10 = static MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid;
  *(_QWORD *)(inited + 104) = static MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid;
  *(_QWORD *)(inited + 112) = 6;
  v11 = one-time initialization token for sixAssetsGrid;
  swift_bridgeObjectRetain(v10);
  if (v11 != -1)
    swift_once(&one-time initialization token for sixAssetsGrid, one-time initialization function for sixAssetsGrid);
  v12 = static MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid;
  *(_QWORD *)(inited + 120) = static MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid;
  *(_QWORD *)(inited + 128) = 7;
  v13 = one-time initialization token for sevenAssetsGrid;
  swift_bridgeObjectRetain(v12);
  if (v13 != -1)
    swift_once(&one-time initialization token for sevenAssetsGrid, one-time initialization function for sevenAssetsGrid);
  v14 = static MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid;
  *(_QWORD *)(inited + 136) = static MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid;
  *(_QWORD *)(inited + 144) = 8;
  v15 = one-time initialization token for eightAssetsGrid;
  swift_bridgeObjectRetain(v14);
  if (v15 != -1)
    swift_once(&one-time initialization token for eightAssetsGrid, one-time initialization function for eightAssetsGrid);
  v16 = static MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid;
  *(_QWORD *)(inited + 152) = static MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid;
  *(_QWORD *)(inited + 160) = 9;
  v17 = one-time initialization token for nineAssetsGrid;
  swift_bridgeObjectRetain(v16);
  if (v17 != -1)
    swift_once(&one-time initialization token for nineAssetsGrid, one-time initialization function for nineAssetsGrid);
  v18 = static MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid;
  *(_QWORD *)(inited + 168) = static MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid;
  *(_QWORD *)(inited + 176) = 10;
  v19 = one-time initialization token for tenAssetsGrid;
  swift_bridgeObjectRetain(v18);
  if (v19 != -1)
    swift_once(&one-time initialization token for tenAssetsGrid, one-time initialization function for tenAssetsGrid);
  v20 = static MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid;
  *(_QWORD *)(inited + 184) = static MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid;
  *(_QWORD *)(inited + 192) = 11;
  v21 = one-time initialization token for elevenAssetsGrid;
  swift_bridgeObjectRetain(v20);
  if (v21 != -1)
    swift_once(&one-time initialization token for elevenAssetsGrid, one-time initialization function for elevenAssetsGrid);
  v22 = static MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid;
  *(_QWORD *)(inited + 200) = static MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid;
  *(_QWORD *)(inited + 208) = 12;
  v23 = one-time initialization token for twelveAssetsGrid;
  swift_bridgeObjectRetain(v22);
  if (v23 != -1)
    swift_once(&one-time initialization token for twelveAssetsGrid, one-time initialization function for twelveAssetsGrid);
  v24 = static MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid;
  *(_QWORD *)(inited + 216) = static MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid;
  *(_QWORD *)(inited + 224) = 13;
  v25 = one-time initialization token for thirteenAssetsGrid;
  swift_bridgeObjectRetain(v24);
  if (v25 != -1)
    swift_once(&one-time initialization token for thirteenAssetsGrid, one-time initialization function for thirteenAssetsGrid);
  v26 = static MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid;
  *(_QWORD *)(inited + 232) = static MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid;
  v27 = specialized Dictionary.init(dictionaryLiteral:)((_QWORD *)inited);
  swift_setDeallocating(inited);
  swift_bridgeObjectRetain(v26);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int, [MOSuggestionAssetTileSize]));
  result = swift_arrayDestroy(inited + 32, 13, v28);
  static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount = v27;
  return result;
}

{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(Int, [MOSuggestionAssetTileSize])>);
  inited = swift_initStackObject(v0, &v12);
  *(_OWORD *)(inited + 16) = xmmword_19450;
  *(_QWORD *)(inited + 32) = 1;
  if (one-time initialization token for oneAssetsGrid != -1)
    swift_once(&one-time initialization token for oneAssetsGrid, one-time initialization function for oneAssetsGrid);
  v2 = static MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid;
  *(_QWORD *)(inited + 40) = static MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid;
  *(_QWORD *)(inited + 48) = 2;
  v3 = one-time initialization token for twoAssetsGrid;
  swift_bridgeObjectRetain(v2);
  if (v3 != -1)
    swift_once(&one-time initialization token for twoAssetsGrid, one-time initialization function for twoAssetsGrid);
  v4 = static MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid;
  *(_QWORD *)(inited + 56) = static MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid;
  *(_QWORD *)(inited + 64) = 3;
  v5 = one-time initialization token for threeAssetsGrid;
  swift_bridgeObjectRetain(v4);
  if (v5 != -1)
    swift_once(&one-time initialization token for threeAssetsGrid, one-time initialization function for threeAssetsGrid);
  v6 = static MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid;
  *(_QWORD *)(inited + 72) = static MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid;
  *(_QWORD *)(inited + 80) = 4;
  v7 = one-time initialization token for fourAssetsGrid;
  swift_bridgeObjectRetain(v6);
  if (v7 != -1)
    swift_once(&one-time initialization token for fourAssetsGrid, one-time initialization function for fourAssetsGrid);
  v8 = static MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid;
  *(_QWORD *)(inited + 88) = static MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid;
  v9 = specialized Dictionary.init(dictionaryLiteral:)((_QWORD *)inited);
  swift_setDeallocating(inited);
  swift_bridgeObjectRetain(v8);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int, [MOSuggestionAssetTileSize]));
  result = swift_arrayDestroy(inited + 32, 4, v10);
  static MOSuggestionLayoutEngine.HalfWidth.tileSizesByCount = v9;
  return result;
}

{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(Int, [MOSuggestionAssetTileSize])>);
  inited = swift_initStackObject(v0, &v6);
  *(_OWORD *)(inited + 16) = xmmword_19460;
  *(_QWORD *)(inited + 32) = 1;
  if (one-time initialization token for oneAssetsGrid != -1)
    swift_once(&one-time initialization token for oneAssetsGrid, one-time initialization function for oneAssetsGrid);
  v2 = static MOSuggestionLayoutEngine.oneAssetsGrid;
  *(_QWORD *)(inited + 40) = static MOSuggestionLayoutEngine.oneAssetsGrid;
  v3 = specialized Dictionary.init(dictionaryLiteral:)((_QWORD *)inited);
  swift_setDeallocating(inited);
  swift_bridgeObjectRetain(v2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Int, [MOSuggestionAssetTileSize]));
  result = swift_arrayDestroy(inited + 32, 1, v4);
  static MOSuggestionLayoutEngine.FullWidthCondensed.tileSizesByCount = v3;
  return result;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for oneAssetsGrid != -1)
    swift_once(&one-time initialization token for oneAssetsGrid, one-time initialization function for oneAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for twoAssetsGrid != -1)
    swift_once(&one-time initialization token for twoAssetsGrid, one-time initialization function for twoAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for threeAssetsGrid != -1)
    swift_once(&one-time initialization token for threeAssetsGrid, one-time initialization function for threeAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for fourAssetsGrid != -1)
    swift_once(&one-time initialization token for fourAssetsGrid, one-time initialization function for fourAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for fiveAssetsGrid != -1)
    swift_once(&one-time initialization token for fiveAssetsGrid, one-time initialization function for fiveAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for sixAssetsGrid != -1)
    swift_once(&one-time initialization token for sixAssetsGrid, one-time initialization function for sixAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for sevenAssetsGrid != -1)
    swift_once(&one-time initialization token for sevenAssetsGrid, one-time initialization function for sevenAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for eightAssetsGrid != -1)
    swift_once(&one-time initialization token for eightAssetsGrid, one-time initialization function for eightAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for nineAssetsGrid != -1)
    swift_once(&one-time initialization token for nineAssetsGrid, one-time initialization function for nineAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for tenAssetsGrid != -1)
    swift_once(&one-time initialization token for tenAssetsGrid, one-time initialization function for tenAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for elevenAssetsGrid != -1)
    swift_once(&one-time initialization token for elevenAssetsGrid, one-time initialization function for elevenAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for twelveAssetsGrid != -1)
    swift_once(&one-time initialization token for twelveAssetsGrid, one-time initialization function for twelveAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for thirteenAssetsGrid != -1)
    swift_once(&one-time initialization token for thirteenAssetsGrid, one-time initialization function for thirteenAssetsGrid);
  return &static MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.unsafeMutableAddressor()
{
  if (one-time initialization token for tileSizesByCount != -1)
    swift_once(&one-time initialization token for tileSizesByCount, one-time initialization function for tileSizesByCount);
  return &static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for tileSizesByCount, &static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount);
}

void one-time initialization function for oneAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for oneAssetsGrid;
}

{
  static MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for oneAssetsGrid;
}

{
  static MOSuggestionLayoutEngine.oneAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for oneAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for oneAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.oneAssetsGrid);
}

void one-time initialization function for twoAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for twoAssetsGrid;
}

{
  static MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for twoAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for twoAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.twoAssetsGrid);
}

void one-time initialization function for threeAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for threeAssetsGrid;
}

{
  static MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for threeAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for threeAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.threeAssetsGrid);
}

void one-time initialization function for fourAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for fourAssetsGrid;
}

{
  static MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for fourAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for fourAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.fourAssetsGrid);
}

void one-time initialization function for fiveAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for fiveAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for fiveAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.fiveAssetsGrid);
}

void one-time initialization function for sixAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for sixAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for sixAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.sixAssetsGrid);
}

void one-time initialization function for sevenAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for sevenAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for sevenAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.sevenAssetsGrid);
}

void one-time initialization function for eightAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for eightAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for eightAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.eightAssetsGrid);
}

void one-time initialization function for nineAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for nineAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for nineAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.nineAssetsGrid);
}

void one-time initialization function for tenAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for tenAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for tenAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.tenAssetsGrid);
}

void one-time initialization function for elevenAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for elevenAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for elevenAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.elevenAssetsGrid);
}

void one-time initialization function for twelveAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for twelveAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for twelveAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.twelveAssetsGrid);
}

void one-time initialization function for thirteenAssetsGrid()
{
  static MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid = (uint64_t)&outlined read-only object #0 of one-time initialization function for thirteenAssetsGrid;
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for thirteenAssetsGrid, &static MOSuggestionLayoutEngine.FullWidth.thirteenAssetsGrid);
}

uint64_t *MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for oneAssetsGrid != -1)
    swift_once(&one-time initialization token for oneAssetsGrid, one-time initialization function for oneAssetsGrid);
  return &static MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for twoAssetsGrid != -1)
    swift_once(&one-time initialization token for twoAssetsGrid, one-time initialization function for twoAssetsGrid);
  return &static MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for threeAssetsGrid != -1)
    swift_once(&one-time initialization token for threeAssetsGrid, one-time initialization function for threeAssetsGrid);
  return &static MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for fourAssetsGrid != -1)
    swift_once(&one-time initialization token for fourAssetsGrid, one-time initialization function for fourAssetsGrid);
  return &static MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.HalfWidth.tileSizesByCount.unsafeMutableAddressor()
{
  if (one-time initialization token for tileSizesByCount != -1)
    swift_once(&one-time initialization token for tileSizesByCount, one-time initialization function for tileSizesByCount);
  return &static MOSuggestionLayoutEngine.HalfWidth.tileSizesByCount;
}

uint64_t static MOSuggestionLayoutEngine.HalfWidth.tileSizesByCount.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for tileSizesByCount, &static MOSuggestionLayoutEngine.HalfWidth.tileSizesByCount);
}

uint64_t static MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for oneAssetsGrid, &static MOSuggestionLayoutEngine.HalfWidth.oneAssetsGrid);
}

uint64_t static MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for twoAssetsGrid, &static MOSuggestionLayoutEngine.HalfWidth.twoAssetsGrid);
}

uint64_t static MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for threeAssetsGrid, &static MOSuggestionLayoutEngine.HalfWidth.threeAssetsGrid);
}

uint64_t static MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for fourAssetsGrid, &static MOSuggestionLayoutEngine.HalfWidth.fourAssetsGrid);
}

uint64_t MOSuggestionLayoutEngine.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t MOSuggestionLayoutEngine.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t MOSuggestionLayoutEngine.__allocating_init()()
{
  uint64_t v0;

  return swift_allocObject(v0, 16, 7);
}

uint64_t *MOSuggestionLayoutEngine.oneAssetsGrid.unsafeMutableAddressor()
{
  if (one-time initialization token for oneAssetsGrid != -1)
    swift_once(&one-time initialization token for oneAssetsGrid, one-time initialization function for oneAssetsGrid);
  return &static MOSuggestionLayoutEngine.oneAssetsGrid;
}

uint64_t *MOSuggestionLayoutEngine.FullWidthCondensed.tileSizesByCount.unsafeMutableAddressor()
{
  if (one-time initialization token for tileSizesByCount != -1)
    swift_once(&one-time initialization token for tileSizesByCount, one-time initialization function for tileSizesByCount);
  return &static MOSuggestionLayoutEngine.FullWidthCondensed.tileSizesByCount;
}

uint64_t static MOSuggestionLayoutEngine.FullWidthCondensed.tileSizesByCount.getter()
{
  return static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(&one-time initialization token for tileSizesByCount, &static MOSuggestionLayoutEngine.FullWidthCondensed.tileSizesByCount);
}

uint64_t static MOSuggestionLayoutEngine.FullWidth.tileSizesByCount.getter(_QWORD *a1, _QWORD *a2)
{
  if (*a1 != -1)
    swift_once();
  return swift_bridgeObjectRetain(*a2);
}

uint64_t static MOSuggestionLayoutEngine.oneAssetsGrid.getter()
{
  if (one-time initialization token for oneAssetsGrid != -1)
    swift_once(&one-time initialization token for oneAssetsGrid, one-time initialization function for oneAssetsGrid);
  return swift_bridgeObjectRetain(static MOSuggestionLayoutEngine.oneAssetsGrid);
}

double static MOSuggestionLayoutEngine.viewportFromTileSize(_:)(char a1)
{
  if ((a1 - 2) > 8u)
    return 300.0;
  else
    return dbl_193B0[(char)(a1 - 2)];
}

double static MOSuggestionLayoutEngine.heightToWidthRatio(_:)(char a1)
{
  double result;

  result = 1.0;
  if ((a1 - 2) <= 8u)
    return dbl_193F8[(char)(a1 - 2)] / dbl_193B0[(char)(a1 - 2)];
  return result;
}

double static MOSuggestionLayoutEngine.widthToHeightRatio(_:)(char a1)
{
  double v1;

  v1 = 1.0;
  if ((a1 - 2) <= 8u)
    v1 = dbl_193F8[(char)(a1 - 2)] / dbl_193B0[(char)(a1 - 2)];
  return 1.0 / v1;
}

BOOL specialized static MOSuggestionAssetTileSize.__derived_enum_equals(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  _BOOL8 result;

  switch(a1)
  {
    case 2u:
      if (a2 != 2)
        goto LABEL_21;
      result = 1;
      break;
    case 3u:
      if (a2 != 3)
        goto LABEL_21;
      result = 1;
      break;
    case 4u:
      if (a2 != 4)
        goto LABEL_21;
      result = 1;
      break;
    case 5u:
      if (a2 != 5)
        goto LABEL_21;
      result = 1;
      break;
    case 6u:
      if (a2 != 6)
        goto LABEL_21;
      result = 1;
      break;
    case 7u:
      if (a2 != 7)
        goto LABEL_21;
      result = 1;
      break;
    case 8u:
      if (a2 != 8)
        goto LABEL_21;
      result = 1;
      break;
    case 9u:
      if (a2 != 9)
        goto LABEL_21;
      result = 1;
      break;
    case 0xAu:
      if (a2 != 10)
        goto LABEL_21;
      result = 1;
      break;
    default:
      if (a2 - 2 >= 9)
        result = ((a2 ^ a1) & 1) == 0;
      else
LABEL_21:
        result = 0;
      break;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MOSuggestionAssetTransferDelivery and conformance MOSuggestionAssetTransferDelivery()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MOSuggestionAssetTransferDelivery and conformance MOSuggestionAssetTransferDelivery;
  if (!lazy protocol witness table cache variable for type MOSuggestionAssetTransferDelivery and conformance MOSuggestionAssetTransferDelivery)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for MOSuggestionAssetTransferDelivery, &type metadata for MOSuggestionAssetTransferDelivery);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetTransferDelivery and conformance MOSuggestionAssetTransferDelivery);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MOSuggestionAssetTileSize and conformance MOSuggestionAssetTileSize()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MOSuggestionAssetTileSize and conformance MOSuggestionAssetTileSize;
  if (!lazy protocol witness table cache variable for type MOSuggestionAssetTileSize and conformance MOSuggestionAssetTileSize)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for MOSuggestionAssetTileSize, &type metadata for MOSuggestionAssetTileSize);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MOSuggestionAssetTileSize and conformance MOSuggestionAssetTileSize);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MOSuggestionAssetTransferDelivery(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MOSuggestionAssetTransferDelivery(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_80B0 + 4 * byte_191E7[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_80E4 + 4 * byte_191E2[v4]))();
}

uint64_t sub_80E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_80EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x80F4);
  return result;
}

uint64_t sub_8100(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x8108);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_810C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_8114(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for MOSuggestionAssetTransferDelivery(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for MOSuggestionAssetTransferDelivery(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MOSuggestionAssetTransferDelivery()
{
  return &type metadata for MOSuggestionAssetTransferDelivery;
}

uint64_t getEnumTagSinglePayload for MOSuggestionAssetTileSize(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
  {
    v6 = *a1;
    if (v6 >= 2)
      v7 = v6 - 1;
    else
      v7 = 0;
    if (v7 >= 0xA)
      return v7 - 9;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 10;
    if (a2 + 10 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_8194 + 4 * byte_191EC[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for MOSuggestionAssetTileSize(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 10;
  if (a3 + 10 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xF6)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_8240 + 4 * byte_191F6[v5]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_8274 + 4 * byte_191F1[v5]))();
}

uint64_t sub_8274(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_827C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x8284);
  return result;
}

uint64_t sub_8290(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x8298);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_829C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_82A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for MOSuggestionAssetTileSize(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 2)
    return v1 - 1;
  else
    return 0;
}

_BYTE *destructiveInjectEnumTag for MOSuggestionAssetTileSize(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for MOSuggestionAssetTileSize()
{
  return &type metadata for MOSuggestionAssetTileSize;
}

uint64_t type metadata accessor for MOSuggestionLayoutEngine()
{
  return objc_opt_self(_TtC20MomentsUIServiceCore24MOSuggestionLayoutEngine);
}

ValueMetadata *type metadata accessor for MOSuggestionLayoutEngine.FullWidth()
{
  return &type metadata for MOSuggestionLayoutEngine.FullWidth;
}

ValueMetadata *type metadata accessor for MOSuggestionLayoutEngine.HalfWidth()
{
  return &type metadata for MOSuggestionLayoutEngine.HalfWidth;
}

ValueMetadata *type metadata accessor for MOSuggestionLayoutEngine.FullWidthCondensed()
{
  return &type metadata for MOSuggestionLayoutEngine.FullWidthCondensed;
}

double MOAngelDefaultsManager.momentsUILowConfidenceHighCertaintyThreshold.getter()
{
  void *v0;
  NSString v1;
  id v2;
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;

  if (one-time initialization token for defaults != -1)
    swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v5 = 0u;
    v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 150.0;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v4, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((_QWORD *)&v6 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast(v4, &v5, (char *)&type metadata for Any + 8, &type metadata for Double, 6) & 1) != 0)
    return *(double *)v4;
  return 150.0;
}

void one-time initialization function for defaults(uint64_t a1)
{
  one-time initialization function for defaults(a1, 0xD000000000000012, 0x800000000001D780, &static MOAngelDefaultsManager.defaults);
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void one-time initialization function for siri(uint64_t a1)
{
  one-time initialization function for defaults(a1, 0xD000000000000015, 0x800000000001D760, &static MOAngelDefaultsManager.siri);
}

void one-time initialization function for defaults(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  id v5;
  NSString v6;
  id v7;

  v5 = objc_allocWithZone((Class)NSUserDefaults);
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v5, "initWithSuiteName:", v6);

  *a4 = v7;
}

uint64_t MOAngelDefaultsManager.momentsUIShouldUpLevelPOI.getter()
{
  void *v0;
  NSString v1;
  id v2;
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;

  if (one-time initialization token for defaults != -1)
    swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v5 = 0u;
    v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v4, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((_QWORD *)&v6 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast(v4, &v5, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) != 0)
    return LOBYTE(v4[0]);
  return 0;
}

uint64_t MOAngelDefaultsManager.momentsUIShouldSkipDendrogram.getter()
{
  void *v0;
  NSString v1;
  id v2;
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;

  if (one-time initialization token for defaults != -1)
    swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v5 = 0u;
    v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v4, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((_QWORD *)&v6 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast(v4, &v5, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) != 0)
    return LOBYTE(v4[0]);
  return 0;
}

uint64_t MOAngelDefaultsManager.momentsUIForceEmbeddedPOI.getter()
{
  void *v0;
  NSString v1;
  id v2;
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;

  if (one-time initialization token for defaults != -1)
    swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v5 = 0u;
    v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v4, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((_QWORD *)&v6 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast(v4, &v5, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) != 0)
    return LOBYTE(v4[0]);
  return 0;
}

uint64_t MOAngelDefaultsManager.momentsUITripDropUninterestingPOI.getter()
{
  void *v0;
  NSString v1;
  id v2;
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;

  if (one-time initialization token for defaults != -1)
    swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v5 = 0u;
    v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v4, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((_QWORD *)&v6 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast(v4, &v5, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) != 0)
    return LOBYTE(v4[0]);
  return 0;
}

double MOAngelDefaultsManager.momentsUIDendrogramPOIPenalty.getter()
{
  void *v0;
  NSString v1;
  id v2;
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;

  if (one-time initialization token for defaults != -1)
    swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v5 = 0u;
    v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0.5;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v4, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((_QWORD *)&v6 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast(v4, &v5, (char *)&type metadata for Any + 8, &type metadata for Double, 6) & 1) != 0)
    return *(double *)v4;
  return 0.5;
}

uint64_t MOAngelDefaultsManager.momentsUIGridBuckets.getter()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t result;
  double v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  if (one-time initialization token for defaults != -1)
    swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v6 = 0u;
    v7 = 0u;
LABEL_14:
    outlined destroy of Any?((uint64_t)&v6);
    return 5;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v5, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  outlined init with take of Any?((uint64_t)v5, (uint64_t)&v6);
  if (!*((_QWORD *)&v7 + 1))
    goto LABEL_14;
  result = swift_dynamicCast(v5, &v6, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
  if ((result & 1) == 0)
    return 5;
  v4 = round(*(double *)v5);
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) != 0)
  {
    if (v4 > -9.22337204e18)
    {
      if (v4 < 9.22337204e18)
        return (uint64_t)v4;
      goto LABEL_18;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t MOAngelDefaultsManager.momentsUIClusterMaxCount.getter()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t result;
  double v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  if (one-time initialization token for defaults != -1)
    swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v6 = 0u;
    v7 = 0u;
LABEL_14:
    outlined destroy of Any?((uint64_t)&v6);
    return 30;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v5, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  outlined init with take of Any?((uint64_t)v5, (uint64_t)&v6);
  if (!*((_QWORD *)&v7 + 1))
    goto LABEL_14;
  result = swift_dynamicCast(v5, &v6, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
  if ((result & 1) == 0)
    return 30;
  v4 = round(*(double *)v5);
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) != 0)
  {
    if (v4 > -9.22337204e18)
    {
      if (v4 < 9.22337204e18)
        return (uint64_t)v4;
      goto LABEL_18;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

double MOAngelDefaultsManager.momentsUITightPOIScale.getter()
{
  void *v0;
  NSString v1;
  id v2;
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;

  if (one-time initialization token for defaults != -1)
    swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v5 = 0u;
    v6 = 0u;
LABEL_11:
    outlined destroy of Any?((uint64_t)&v5);
    return 0.5;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v4, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((_QWORD *)&v6 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast(v4, &v5, (char *)&type metadata for Any + 8, &type metadata for Double, 6) & 1) != 0)
    return *(double *)v4;
  return 0.5;
}

void *MOAngelDefaultsManager.siriCanLearnFromAppDenySet.getter()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;

  if (one-time initialization token for siri != -1)
    swift_once(&one-time initialization token for siri, one-time initialization function for siri);
  v0 = (void *)static MOAngelDefaultsManager.siri;
  if (!static MOAngelDefaultsManager.siri)
  {
    v9 = 0u;
    v10 = 0u;
LABEL_12:
    outlined destroy of Any?((uint64_t)&v9);
    return &_swiftEmptySetSingleton;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v8, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  outlined init with take of Any?((uint64_t)v8, (uint64_t)&v9);
  if (!*((_QWORD *)&v10 + 1))
    goto LABEL_12;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Swift.AnyObject]);
  if ((swift_dynamicCast(v8, &v9, (char *)&type metadata for Any + 8, v3, 6) & 1) == 0)
    return &_swiftEmptySetSingleton;
  v4 = *(_QWORD *)&v8[0];
  v5 = specialized _arrayConditionalCast<A, B>(_:)(*(uint64_t *)&v8[0]);
  swift_bridgeObjectRelease(v4);
  if (!v5)
    return &_swiftEmptySetSingleton;
  v6 = specialized Set.init<A>(_:)((uint64_t)v5);
  swift_bridgeObjectRelease(v5);
  return (void *)v6;
}

_QWORD *specialized _arrayConditionalCast<A, B>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
    goto LABEL_26;
  v3 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
LABEL_3:
  v20 = &_swiftEmptyArrayStorage;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  v4 = v20;
  if (!v2)
  {
    v2 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
    if (!v2)
      return v4;
LABEL_10:
    for (i = 4; ; ++i)
    {
      v7 = i - 4;
      if ((a1 & 0xC000000000000001) != 0)
      {
        v8 = specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, a1);
        v9 = i - 3;
        if (__OFADD__(v7, 1))
          goto LABEL_25;
      }
      else
      {
        v8 = swift_unknownObjectRetain(*(_QWORD *)(a1 + 8 * i));
        v9 = i - 3;
        if (__OFADD__(v7, 1))
        {
LABEL_25:
          __break(1u);
LABEL_26:
          if (a1 < 0)
            v16 = a1;
          else
            v16 = a1 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(a1);
          v3 = _CocoaArrayWrapper.endIndex.getter(v16);
          swift_bridgeObjectRelease(a1);
          goto LABEL_3;
        }
      }
      v19 = v8;
      if (!swift_dynamicCast(&v17, &v19, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for String, 6))
      {
        v17 = 0;
        v18 = 0;
        swift_release(v4);
        swift_bridgeObjectRelease(v18);
        return 0;
      }
      v11 = v17;
      v10 = v18;
      if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4[2] + 1, 1);
        v4 = v20;
      }
      v13 = v4[2];
      v12 = v4[3];
      if (v13 >= v12 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v13 + 1, 1);
        v4 = v20;
      }
      v4[2] = v13 + 1;
      v14 = (char *)&v4[2 * v13];
      *((_QWORD *)v14 + 4) = v11;
      *((_QWORD *)v14 + 5) = v10;
      if (v9 == v2)
        return v4;
    }
  }
  if (a1 < 0)
    v5 = a1;
  else
    v5 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  v2 = _CocoaArrayWrapper.endIndex.getter(v5);
  swift_bridgeObjectRelease(a1);
  if (v2)
    goto LABEL_10;
  return v4;
}

uint64_t specialized static MOAngelDefaultsManager.doubleValueFor(_:)()
{
  void *v0;
  NSString v1;
  id v2;
  _OWORD v4[2];
  __int128 v5;
  __int128 v6;

  if (one-time initialization token for defaults != -1)
    swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
  v0 = (void *)static MOAngelDefaultsManager.defaults;
  if (!static MOAngelDefaultsManager.defaults)
  {
    v5 = 0u;
    v6 = 0u;
LABEL_12:
    outlined destroy of Any?((uint64_t)&v5);
    return 0;
  }
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v4, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  outlined init with take of Any?((uint64_t)v4, (uint64_t)&v5);
  if (!*((_QWORD *)&v6 + 1))
    goto LABEL_12;
  if (swift_dynamicCast(v4, &v5, (char *)&type metadata for Any + 8, &type metadata for Double, 6))
    return *(_QWORD *)&v4[0];
  else
    return 0;
}

uint64_t specialized Set.init<A>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7[2];
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = Set.init(minimumCapacity:)(v2, &type metadata for String, &protocol witness table for String);
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      specialized Set._Variant.insert(_:)(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MOAngelDefaultsManager()
{
  return &type metadata for MOAngelDefaultsManager;
}

uint64_t MOAngelLogger.assets.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for assets, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.assets, (uint64_t)one-time initialization function for assets);
}

uint64_t one-time initialization function for shared(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.shared, 0x4349565245534955, 0xE900000000000045);
}

uint64_t MOAngelLogger.shared.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for shared, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.shared, (uint64_t)one-time initialization function for shared);
}

uint64_t MOAngelLogger.assets.unsafeMutableAddressor(_QWORD *a1, uint64_t (*a2)(_QWORD), uint64_t a3, uint64_t a4)
{
  uint64_t v6;

  if (*a1 != -1)
    swift_once(a1, a4);
  v6 = a2(0);
  return __swift_project_value_buffer(v6, a3);
}

uint64_t static MOAngelLogger.shared.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for shared, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.shared, (uint64_t)one-time initialization function for shared, a1);
}

uint64_t one-time initialization function for assets(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.assets, 0x535445535341, 0xE600000000000000);
}

uint64_t static MOAngelLogger.assets.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for assets, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.assets, (uint64_t)one-time initialization function for assets, a1);
}

uint64_t static MOAngelLogger.shared.getter@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = __swift_project_value_buffer(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t one-time initialization function for ranking(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.ranking, 0x474E494B4E4152, 0xE700000000000000);
}

uint64_t MOAngelLogger.ranking.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for ranking, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.ranking, (uint64_t)one-time initialization function for ranking);
}

uint64_t static MOAngelLogger.ranking.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for ranking, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.ranking, (uint64_t)one-time initialization function for ranking, a1);
}

uint64_t one-time initialization function for memory(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.memory, 0x59524F4D454DLL, 0xE600000000000000);
}

uint64_t MOAngelLogger.memory.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for memory, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.memory, (uint64_t)one-time initialization function for memory);
}

uint64_t static MOAngelLogger.memory.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for memory, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.memory, (uint64_t)one-time initialization function for memory, a1);
}

uint64_t one-time initialization function for sheetController(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.sheetController, 0x4E4F435445454853, 0xEF52454C4C4F5254);
}

uint64_t MOAngelLogger.sheetController.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for sheetController, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.sheetController, (uint64_t)one-time initialization function for sheetController);
}

uint64_t static MOAngelLogger.sheetController.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for sheetController, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.sheetController, (uint64_t)one-time initialization function for sheetController, a1);
}

uint64_t one-time initialization function for filtering(uint64_t a1)
{
  return one-time initialization function for shared(a1, static MOAngelLogger.filtering, 0x4E495245544C4946, 0xE900000000000047);
}

uint64_t one-time initialization function for shared(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD000000000000020, 0x800000000001D800, a3, a4);
}

uint64_t MOAngelLogger.filtering.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for filtering, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.filtering, (uint64_t)one-time initialization function for filtering);
}

uint64_t static MOAngelLogger.filtering.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for filtering, (uint64_t (*)(_QWORD))&type metadata accessor for Logger, (uint64_t)static MOAngelLogger.filtering, (uint64_t)one-time initialization function for filtering, a1);
}

uint64_t one-time initialization function for assets()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OSSignposter(0);
  __swift_allocate_value_buffer(v4, static MOAngelSignposter.assets);
  __swift_project_value_buffer(v4, (uint64_t)static MOAngelSignposter.assets);
  if (one-time initialization token for assets != -1)
    swift_once(&one-time initialization token for assets, one-time initialization function for assets);
  v5 = __swift_project_value_buffer(v0, (uint64_t)static MOAngelLogger.assets);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)(v3);
}

uint64_t MOAngelSignposter.assets.unsafeMutableAddressor()
{
  return MOAngelLogger.assets.unsafeMutableAddressor(&one-time initialization token for assets, (uint64_t (*)(_QWORD))&type metadata accessor for OSSignposter, (uint64_t)static MOAngelSignposter.assets, (uint64_t)one-time initialization function for assets);
}

uint64_t static MOAngelSignposter.assets.getter@<X0>(uint64_t a1@<X8>)
{
  return static MOAngelLogger.shared.getter(&one-time initialization token for assets, (uint64_t (*)(_QWORD))&type metadata accessor for OSSignposter, (uint64_t)static MOAngelSignposter.assets, (uint64_t)one-time initialization function for assets, a1);
}

uint64_t type metadata accessor for MOAngelLogger()
{
  return objc_opt_self(_TtC20MomentsUIServiceCore13MOAngelLogger);
}

uint64_t type metadata accessor for MOAngelSignposter()
{
  return objc_opt_self(_TtC20MomentsUIServiceCore17MOAngelSignposter);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t MOPOIAnnotationViewConfiguration.geoMapItem.getter()
{
  _QWORD *v0;

  return swift_unknownObjectRetain(*v0);
}

uint64_t MOPOIAnnotationViewConfiguration.geoMapItem.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_unknownObjectRelease(*v1);
  *v1 = a1;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.geoMapItem.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.tileSize.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t MOPOIAnnotationViewConfiguration.tileSize.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.tileSize.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.isWork.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 9);
}

uint64_t MOPOIAnnotationViewConfiguration.isWork.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 9) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.isWork.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.numLocations.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t MOPOIAnnotationViewConfiguration.numLocations.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.numLocations.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.forceCircle.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t MOPOIAnnotationViewConfiguration.forceCircle.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.forceCircle.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.isMediumToHighConfidence.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t MOPOIAnnotationViewConfiguration.isMediumToHighConfidence.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 25) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.isMediumToHighConfidence.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.isScaledDownPOI.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 26);
}

uint64_t MOPOIAnnotationViewConfiguration.isScaledDownPOI.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 26) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.isScaledDownPOI.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOPOIAnnotationViewConfiguration.shouldUseCityIcon.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 27);
}

uint64_t MOPOIAnnotationViewConfiguration.shouldUseCityIcon.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 27) = result;
  return result;
}

void (__swiftcall *MOPOIAnnotationViewConfiguration.shouldUseCityIcon.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

int *one-time initialization function for singlePinCanvasSize()
{
  int *result;

  result = (int *)specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&outlined read-only object #0 of one-time initialization function for singlePinCanvasSize);
  static MOPOIAnnotationViewConfiguration.singlePinCanvasSize[0] = result;
  return result;
}

int *one-time initialization function for multiPinCanvasSize()
{
  int *result;

  result = (int *)specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&outlined read-only object #0 of one-time initialization function for multiPinCanvasSize);
  static MOPOIAnnotationViewConfiguration.multiPinCanvasSize[0] = result;
  return result;
}

BOOL MOPOIAnnotationViewConfiguration.shouldAddWhiteCircularBorder.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16) > 1;
}

uint64_t MOPOIAnnotationViewConfiguration.pinSize.getter()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  unint64_t v3;
  char v4;
  uint64_t result;
  double v6;
  double v7;
  char v8;

  v1 = v0;
  if (*(uint64_t *)(v0 + 16) > 1 || (*(_BYTE *)(v0 + 24) & 1) != 0)
  {
    if (one-time initialization token for multiPinCanvasSize != -1)
      swift_once(&one-time initialization token for multiPinCanvasSize, one-time initialization function for multiPinCanvasSize);
    v2 = static MOPOIAnnotationViewConfiguration.multiPinCanvasSize[0];
    if (!*(_QWORD *)((char *)static MOPOIAnnotationViewConfiguration.multiPinCanvasSize[0] + (unint64_t)&dword_10))
      goto LABEL_13;
  }
  else
  {
    if (one-time initialization token for singlePinCanvasSize != -1)
      swift_once(&one-time initialization token for singlePinCanvasSize, one-time initialization function for singlePinCanvasSize);
    v2 = static MOPOIAnnotationViewConfiguration.singlePinCanvasSize[0];
    if (!*(_QWORD *)((char *)static MOPOIAnnotationViewConfiguration.singlePinCanvasSize[0]
                    + (unint64_t)&dword_10))
      goto LABEL_13;
  }
  v3 = specialized __RawDictionaryStorage.find<A>(_:)(*(_BYTE *)(v1 + 8));
  if ((v4 & 1) == 0)
  {
LABEL_13:
    *(double *)&result = 0.0;
    return result;
  }
  result = *(uint64_t *)(*(_QWORD *)&stru_20.segname[(_QWORD)v2 + 16] + 8 * v3);
  if ((*(_BYTE *)(v1 + 26) & 1) != 0)
  {
    v6 = *(double *)&result;
    v7 = COERCE_DOUBLE(specialized static MOAngelDefaultsManager.doubleValueFor(_:)());
    if ((v8 & 1) != 0)
      v7 = 0.5;
    *(double *)&result = v7 * v6;
  }
  return result;
}

uint64_t MOPOIAnnotationViewConfiguration.shouldAddPointedArrow.getter()
{
  uint64_t v0;

  if (*(uint64_t *)(v0 + 16) > 1 || (*(_BYTE *)(v0 + 24) & 1) != 0)
    return 0;
  if ((*(_BYTE *)(v0 + 27) & 1) != 0)
    return *(unsigned __int8 *)(v0 + 9);
  return 1;
}

void MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter()
{
  uint64_t v0;
  char v1;
  char v2;
  char v3;

  MOPOIAnnotationViewConfiguration.pinSize.getter();
  if ((v1 & 1) == 0)
  {
    outlined init with take of MOSuggestionAssetTileSize((_BYTE *)(v0 + 8), &v2);
    outlined init with take of MOSuggestionAssetTileSize(&v2, &v3);
    MOSuggestionLayoutEngine.HalfWidth.init()();
  }
}

void MOPOIAnnotationViewConfiguration.downArrowFrame.getter()
{
  char v0;

  MOPOIAnnotationViewConfiguration.pinSize.getter();
  if ((v0 & 1) == 0)
    MOSuggestionLayoutEngine.HalfWidth.init()();
}

void MOPOIAnnotationViewConfiguration.downArrowListTileFrame.getter()
{
  char v0;

  MOPOIAnnotationViewConfiguration.pinSize.getter();
  if ((v0 & 1) == 0)
    MOSuggestionLayoutEngine.HalfWidth.init()();
}

void MOPOIAnnotationViewConfiguration.whiteCircularBorderFrame.getter()
{
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOSuggestionLayoutEngine.HalfWidth.init()();
}

void MOPOIAnnotationViewConfiguration.whiteCircularBorderCLusterFrame.getter()
{
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOSuggestionLayoutEngine.HalfWidth.init()();
}

void MOPOIAnnotationViewConfiguration.containerViewFrame.getter()
{
  char v0;

  MOPOIAnnotationViewConfiguration.pinSize.getter();
  if ((v0 & 1) == 0)
    MOSuggestionLayoutEngine.HalfWidth.init()();
}

_BYTE *MOPOIAnnotationViewConfiguration.clusterFontSize.getter()
{
  uint64_t v0;
  _BYTE *result;
  char v2;
  char v3;
  char v4;

  result = (_BYTE *)MOPOIAnnotationViewConfiguration.pinSize.getter();
  if ((v2 & 1) == 0)
  {
    outlined init with take of MOSuggestionAssetTileSize((_BYTE *)(v0 + 8), &v3);
    return outlined init with take of MOSuggestionAssetTileSize(&v3, &v4);
  }
  return result;
}

uint64_t static MOPOIAnnotationViewConfiguration.filterGenericRed(category:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;

  if (!a1)
    return 0;
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(GEOPOICategoryReligiousSite);
  v4 = v3;
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  if (v2 == v5 && v4 == v6)
  {
    swift_bridgeObjectRelease_n(v4, 2);
  }
  else
  {
    v8 = v6;
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, v5, v6, 0);
    swift_bridgeObjectRelease(v4);
    swift_bridgeObjectRelease(v8);
    if ((v9 & 1) == 0)
      return 0;
  }
  return 1;
}

uint64_t static MOPOIAnnotationViewConfiguration.hasPOIIconImage(_:)(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t result;
  void *v13;
  id v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  double v24;
  double v25;
  id v26;

  v2 = objc_msgSend(a1, "_poiCategory");
  if (v2)
  {
    v3 = v2;
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(GEOPOICategoryReligiousSite);
    v6 = v5;
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    if (v4 == v7 && v6 == v8)
    {

      swift_bridgeObjectRelease_n(v6, 2);
      return 0;
    }
    v10 = v8;
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v7, v8, 0);

    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v10);
    result = 0;
    if ((v11 & 1) != 0)
      return result;
  }
  v13 = (void *)objc_opt_self(MKIconManager);
  v14 = objc_msgSend(a1, "_styleAttributes");
  v15 = (void *)objc_opt_self(UIScreen);
  v16 = objc_msgSend(v15, "mainScreen");
  objc_msgSend(v16, "scale");
  v18 = v17;

  v19 = objc_msgSend(v13, "newFillColorForStyleAttributes:forScale:", v14, v18);
  v20 = v13;
  if (v19)
  {
    v21 = v20;
    v22 = objc_msgSend(a1, "_styleAttributes");
    v23 = objc_msgSend(v15, "mainScreen");
    objc_msgSend(v23, "scale");
    v25 = v24;

    v26 = objc_msgSend(v21, "imageForStyle:size:forScale:format:", v22, 3, 0, v25);
    if (v26)
    {

      return 1;
    }
  }
  return 0;
}

uint64_t MOPOIAnnotationViewConfiguration.init(geoMapItem:tileSize:isWork:numLocations:forceCircle:isMediumToHighConfidence:isScaledDownPOI:shouldUseCityIcon:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>)
{
  *(_QWORD *)a9 = result;
  *(_BYTE *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + 9) = a3;
  *(_QWORD *)(a9 + 16) = a4;
  *(_BYTE *)(a9 + 24) = a5;
  *(_BYTE *)(a9 + 25) = a6;
  *(_BYTE *)(a9 + 26) = a7;
  *(_BYTE *)(a9 + 27) = a8;
  *(_QWORD *)(a9 + 32) = 0x4000000000000000;
  return result;
}

void one-time initialization function for cityStyleAttributes()
{
  id v0;
  id v1;

  v0 = objc_msgSend(objc_allocWithZone((Class)GEOPlace), "initWithLatitude:longitude:placeType:", 4, 0.0, 0.0);
  v1 = objc_msgSend((id)objc_opt_self(GEOFeatureStyleAttributes), "styleAttributesForPlace:", v0);

  static MOPOIAnnotationView.cityStyleAttributes = (uint64_t)v1;
}

uint64_t *MOPOIAnnotationView.cityStyleAttributes.unsafeMutableAddressor()
{
  if (one-time initialization token for cityStyleAttributes != -1)
    swift_once(&one-time initialization token for cityStyleAttributes, one-time initialization function for cityStyleAttributes);
  return &static MOPOIAnnotationView.cityStyleAttributes;
}

uint64_t static MOPOIAnnotationView.cityStyleAttributes.getter()
{
  uint64_t v0;
  id v1;

  if (one-time initialization token for cityStyleAttributes != -1)
    swift_once(&one-time initialization token for cityStyleAttributes, one-time initialization function for cityStyleAttributes);
  v0 = static MOPOIAnnotationView.cityStyleAttributes;
  v1 = (id)static MOPOIAnnotationView.cityStyleAttributes;
  return v0;
}

id MOPOIAnnotationView.__allocating_init(annotation:configuration:)(uint64_t a1, __int128 *a2)
{
  objc_class *v2;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  v6 = specialized MOPOIAnnotationView.init(annotation:configuration:)(a1, a2);
  outlined release of MOPOIAnnotationViewConfiguration(a2);
  swift_unknownObjectRelease(a1);
  return v6;
}

id MOPOIAnnotationView.init(annotation:configuration:)(uint64_t a1, __int128 *a2)
{
  id v4;

  v4 = specialized MOPOIAnnotationView.init(annotation:configuration:)(a1, a2);
  outlined release of MOPOIAnnotationViewConfiguration(a2);
  swift_unknownObjectRelease(a1);
  return v4;
}

void closure #1 in MOPOIAnnotationView.init(annotation:configuration:)(uint64_t a1)
{
  uint64_t v1;
  char *Strong;
  char *v3;
  __int128 v4;
  char *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  char v10;
  char *v11;
  void *v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  id v22;
  id v23;
  char v24[24];
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v24, 0, 0);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = &Strong[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration];
    v4 = *(_OWORD *)&Strong[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 16];
    v28 = *(_OWORD *)&Strong[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration];
    v29 = v4;
    v30 = *(_QWORD *)&Strong[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 32];
    v5 = Strong;
    MOPOIAnnotationViewConfiguration.pinSize.getter();
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    if ((v10 & 1) == 0)
      MOSuggestionLayoutEngine.HalfWidth.init()();
    objc_msgSend(v5, "setFrame:", v6, v7, v8, v9);

    v11 = &v5[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView];
    v12 = *(void **)&v5[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView];
    v13 = *((_OWORD *)v3 + 1);
    v25 = *(_OWORD *)v3;
    v26 = v13;
    v27 = *((_QWORD *)v3 + 4);
    v14 = v12;
    MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
    objc_msgSend(v14, "setFrame:");

    MOPOIAnnotationView.setupPOIAndColors()();
    if (*((uint64_t *)v3 + 2) < 2)
    {
      if ((v3[24] & 1) != 0)
      {
        specialized MOPOIAnnotationView.setupBorderBackground(cluster:)();
        v15 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView;
      }
      else
      {
        if (v3[27] == 1 && !v3[9])
          goto LABEL_12;
        MOPOIAnnotationView.setupDownArrow()();
        v15 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView;
      }
      objc_msgSend(v5, "addSubview:", *(_QWORD *)&v5[v15]);
    }
    else
    {
      specialized MOPOIAnnotationView.setupBorderBackground(cluster:)();
      MOPOIAnnotationView.setupClusterlabel()();
      objc_msgSend(v5, "addSubview:", *(_QWORD *)&v5[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView]);
      v11 = &v5[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel];
    }
LABEL_12:
    objc_msgSend(v5, "addSubview:", *(_QWORD *)v11);
    v16 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView;
    v17 = objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView], "layer");
    v18 = objc_msgSend((id)objc_opt_self(UIColor), "secondarySystemBackgroundColor");
    v19 = objc_msgSend(v18, "CGColor");

    objc_msgSend(v17, "setShadowColor:", v19);
    v20 = objc_msgSend(*(id *)&v5[v16], "layer");
    LODWORD(v21) = 0.5;
    objc_msgSend(v20, "setShadowOpacity:", v21);

    v22 = objc_msgSend(*(id *)&v5[v16], "layer");
    objc_msgSend(v22, "setShadowRadius:", 5.0);

    v23 = objc_msgSend(*(id *)&v5[v16], "layer");
    objc_msgSend(v23, "setShadowPathIsBounds:", 1);

  }
}

void MOPOIAnnotationView.setupDownArrow()()
{
  uint64_t v0;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  char v8;
  char v9;
  NSString v10;
  id v11;

  if (*(uint64_t *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 16) <= 1
    && *(_BYTE *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 24) == 0
    && (*(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 27) ^ 1 | *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 9)) != 0)
  {
    v3 = *(void **)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView);
    if (*(_BYTE *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 8) == 3)
    {
      MOPOIAnnotationViewConfiguration.pinSize.getter();
      v4 = 0.0;
      v5 = 0.0;
      v6 = 0.0;
      v7 = 0.0;
      if ((v8 & 1) == 0)
        goto LABEL_14;
    }
    else
    {
      MOPOIAnnotationViewConfiguration.pinSize.getter();
      v4 = 0.0;
      v5 = 0.0;
      v6 = 0.0;
      v7 = 0.0;
      if ((v9 & 1) == 0)
LABEL_14:
        MOSuggestionLayoutEngine.HalfWidth.init()();
    }
    objc_msgSend(v3, "setFrame:", v4, v5, v6, v7);
    v10 = String._bridgeToObjectiveC()();
    v11 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v10);

    objc_msgSend(v3, "setImage:", v11);
    objc_msgSend(v3, "setContentMode:", 2);
  }
}

void MOPOIAnnotationView.setupClusterlabel()()
{
  uint64_t v0;
  void *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  id v6;
  double v7;
  double v8;
  char v9;
  id v10;
  id v11;
  CGRect v12;

  if (*(uint64_t *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 16) >= 2)
  {
    v1 = *(void **)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel);
    v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration + 8);
    MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
    objc_msgSend(v1, "setFrame:");
    dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v4 = v3;
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
    objc_msgSend(v1, "setText:", v5);

    objc_msgSend(v1, "setTextAlignment:", 1);
    v6 = objc_msgSend((id)objc_opt_self(UIColor), "whiteColor");
    objc_msgSend(v1, "setTextColor:", v6);

    v7 = COERCE_DOUBLE(MOPOIAnnotationViewConfiguration.pinSize.getter());
    v8 = 15.0;
    if ((v9 & 1) == 0)
    {
      if (v2 == 3)
        v8 = v7 * 0.5;
      else
        v8 = v7 / 6.0;
    }
    v10 = objc_msgSend((id)objc_opt_self(UIFont), "boldSystemFontOfSize:", v8);
    objc_msgSend(v1, "setFont:", v10);

    objc_msgSend(v1, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v1, "setClipsToBounds:", 1);
    v11 = objc_msgSend(v1, "layer");
    objc_msgSend(v1, "frame");
    objc_msgSend(v11, "setCornerRadius:", CGRectGetWidth(v12) * 0.5);

  }
}

void MOPOIAnnotationView.setupPOIAndColors()()
{
  char *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  double v27;
  double v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char *v42;
  id v43;
  void *v44;
  id v45;
  double v46;
  double v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  double v52;
  double v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  double v65;
  double v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  id v71;
  double v72;
  double v73;
  id v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  uint8_t *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char *v84;
  NSObject *v85;
  os_log_type_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  id v106;
  NSString v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  char *v124;
  id v125;
  char *v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;

  v1 = v0;
  v2 = (char *)type metadata accessor for Logger(0);
  v127 = *((_QWORD *)v2 - 1);
  v128 = v2;
  __chkstk_darwin(v2);
  v126 = (char *)&v126 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = &v0[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration];
  v5 = *(void **)&v0[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration];
  if (v5)
  {
    v6 = objc_msgSend((id)swift_unknownObjectRetain(*(_QWORD *)&v0[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration]), "_poiCategory");
    if (v6)
    {
      v7 = v6;
      v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(GEOPOICategoryReligiousSite);
      v10 = v9;
      v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
      if (v8 == v11 && v10 == v12)
      {

        swift_bridgeObjectRelease_n(v10, 2);
      }
      else
      {
        v14 = v12;
        v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v8, v10, v11, v12, 0);

        swift_bridgeObjectRelease(v10);
        swift_bridgeObjectRelease(v14);
        if ((v15 & 1) == 0)
          goto LABEL_8;
      }
LABEL_16:
      swift_unknownObjectRelease(v5);
      goto LABEL_17;
    }
LABEL_8:
    v16 = (void *)objc_opt_self(MKIconManager);
    v17 = objc_msgSend(v5, "_styleAttributes");
    v18 = (void *)objc_opt_self(UIScreen);
    v19 = objc_msgSend(v18, "mainScreen");
    objc_msgSend(v19, "scale");
    v21 = v20;

    v22 = objc_msgSend(v16, "newFillColorForStyleAttributes:forScale:", v17, v21);
    v23 = v16;
    if (v22)
    {
      v24 = v23;
      v25 = objc_msgSend(v5, "_styleAttributes");
      v26 = objc_msgSend(v18, "mainScreen");
      objc_msgSend(v26, "scale");
      v28 = v27;

      v29 = objc_msgSend(v24, "imageForStyle:size:forScale:format:", v25, 3, 0, v28);
      if (v29)
      {
        if (one-time initialization token for assets != -1)
          swift_once(&one-time initialization token for assets, one-time initialization function for assets);
        __swift_project_value_buffer((uint64_t)v128, (uint64_t)static MOAngelLogger.assets);
        v30 = swift_unknownObjectRetain_n(v5, 4);
        v31 = Logger.logObject.getter(v30);
        v32 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v31, (os_log_type_t)v32))
        {
          v128 = v1;
          v33 = swift_slowAlloc(22, -1);
          v126 = (char *)swift_slowAlloc(32, -1);
          v131 = v126;
          *(_DWORD *)v33 = 134218242;
          v34 = objc_msgSend(v5, "name");
          LODWORD(v127) = v32;
          if (v34)
          {
            v35 = v34;
            v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
            v38 = v37;

          }
          else
          {
            v36 = 0;
            v38 = 0;
          }
          v129 = v36;
          v130 = v38;
          v117 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
          v118 = Optional<A>.hashValue.getter(v117, &protocol witness table for String);
          swift_unknownObjectRelease(v5);
          swift_bridgeObjectRelease(v38);
          v129 = v118;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, &v130, v33 + 4, v33 + 12);
          swift_unknownObjectRelease(v5);
          *(_WORD *)(v33 + 12) = 2080;
          v119 = objc_msgSend(v5, "_poiCategory");
          v129 = (uint64_t)v119;
          v120 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GEOPOICategory?);
          v121 = Optional.debugDescription.getter(v120);
          v123 = v122;

          v129 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v121, v123, (uint64_t *)&v131);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, &v130, v33 + 14, v33 + 22);
          swift_unknownObjectRelease_n(v5, 2);
          swift_bridgeObjectRelease(v123);
          _os_log_impl(&dword_0, v31, (os_log_type_t)v127, "[POIClustering] [RENDERING] POI mapItemName=%ld, mapItemPOICategory=%s", (uint8_t *)v33, 0x16u);
          v124 = v126;
          swift_arrayDestroy(v126, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v124, -1, -1);
          swift_slowDealloc(v33, -1, -1);

          v1 = v128;
        }
        else
        {

          swift_unknownObjectRelease_n(v5, 4);
        }
        objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView], "setImage:", v29, v126);
        v125 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithCGColor:", v22);

        objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView], "setTintColor:", v125);
        objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel], "setBackgroundColor:", v125);
        swift_unknownObjectRelease(v5);

        return;
      }
    }
    goto LABEL_16;
  }
LABEL_17:
  if (v4[9] == 1)
  {
    v39 = (void *)objc_opt_self(MKIconManager);
    v40 = (void *)objc_opt_self(GEOFeatureStyleAttributes);
    v41 = v5;
    v42 = v1;
    v43 = objc_msgSend(v40, "workStyleAttributes");
    v44 = (void *)objc_opt_self(UIScreen);
    v45 = objc_msgSend(v44, "mainScreen");
    objc_msgSend(v45, "scale");
    v47 = v46;

    v48 = objc_msgSend(v39, "imageForStyle:size:forScale:format:", v43, 3, 0, v47);
    v1 = v42;
    v5 = v41;
    if (v48)
    {
      v49 = v48;
      v50 = objc_msgSend(v40, "workStyleAttributes");
      v51 = objc_msgSend(v44, "mainScreen");
      objc_msgSend(v51, "scale");
      v53 = v52;

      v54 = objc_msgSend(v39, "newFillColorForStyleAttributes:forScale:", v50, v53);
      v55 = v39;
      if (v54)
      {
        v56 = (uint64_t)v128;
        if (one-time initialization token for assets != -1)
          swift_once(&one-time initialization token for assets, one-time initialization function for assets);
        v57 = __swift_project_value_buffer(v56, (uint64_t)static MOAngelLogger.assets);
        v58 = Logger.logObject.getter(v57);
        v59 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v58, v59))
        {
          v60 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v60 = 0;
          _os_log_impl(&dword_0, v58, v59, "[POIClustering] [RENDERING] Work", v60, 2u);
          swift_slowDealloc(v60, -1, -1);
        }

        objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView], "setImage:", v49);
        v128 = (char *)objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithCGColor:", v54);

        objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView], "setTintColor:", v128);
        objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel], "setBackgroundColor:", v128);

LABEL_37:
        return;
      }

    }
  }
  if ((v4[25] & 1) == 0 && v4[27] == 1)
  {
    v61 = (void *)objc_opt_self(MKIconManager);
    if (one-time initialization token for cityStyleAttributes != -1)
      swift_once(&one-time initialization token for cityStyleAttributes, one-time initialization function for cityStyleAttributes);
    v62 = static MOPOIAnnotationView.cityStyleAttributes;
    v63 = (void *)objc_opt_self(UIScreen);
    v64 = objc_msgSend(v63, "mainScreen");
    objc_msgSend(v64, "scale");
    v66 = v65;

    v67 = objc_msgSend(v61, "newFillColorForStyleAttributes:forScale:", v62, v66);
    v68 = v61;
    if (v67)
    {
      v69 = v68;
      v70 = static MOPOIAnnotationView.cityStyleAttributes;
      v71 = objc_msgSend(v63, "mainScreen");
      objc_msgSend(v71, "scale");
      v73 = v72;

      v74 = objc_msgSend(v69, "imageForStyle:size:forScale:format:", v70, 3, 0, v73);
      if (v74)
      {
        v75 = v74;
        if (one-time initialization token for assets != -1)
          swift_once(&one-time initialization token for assets, one-time initialization function for assets);
        v76 = __swift_project_value_buffer((uint64_t)v128, (uint64_t)static MOAngelLogger.assets);
        v77 = Logger.logObject.getter(v76);
        v78 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v77, v78))
        {
          v79 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v79 = 0;
          _os_log_impl(&dword_0, v77, v78, "[POIClustering] [RENDERING] City", v79, 2u);
          swift_slowDealloc(v79, -1, -1);
        }

        objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView], "setImage:", v75);
        v128 = (char *)objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithCGColor:", v67);

        objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel], "setBackgroundColor:", v128);
        goto LABEL_37;
      }
    }
  }
  if (one-time initialization token for assets != -1)
    swift_once(&one-time initialization token for assets, one-time initialization function for assets);
  v80 = v128;
  v81 = __swift_project_value_buffer((uint64_t)v128, (uint64_t)static MOAngelLogger.assets);
  v82 = v126;
  v83 = v127;
  (*(void (**)(char *, uint64_t, char *))(v127 + 16))(v126, v81, v80);
  v84 = v1;
  v85 = Logger.logObject.getter(v84);
  v86 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v85, v86))
  {
    v87 = swift_slowAlloc(22, -1);
    v88 = swift_slowAlloc(32, -1);
    v131 = (char *)v88;
    *(_DWORD *)v87 = 134218242;
    if (v5)
    {
      v89 = objc_msgSend(v5, "name");
      if (v89)
      {
        v90 = v89;
        v91 = static String._unconditionallyBridgeFromObjectiveC(_:)(v89);
        v93 = v92;

      }
      else
      {
        v91 = 0;
        v93 = 0;
      }
      v129 = v91;
      v130 = v93;
      v95 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
      v94 = Optional<A>.hashValue.getter(v95, &protocol witness table for String);

      swift_bridgeObjectRelease(v93);
    }
    else
    {

      v94 = 0;
    }
    v129 = v94;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, &v130, v87 + 4, v87 + 12);

    *(_WORD *)(v87 + 12) = 2080;
    if (v5)
    {
      v96 = objc_msgSend(v5, "_poiCategory");
      v129 = (uint64_t)v96;
      v97 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GEOPOICategory?);
      v98 = Optional.debugDescription.getter(v97);
      v100 = v99;

    }
    else
    {
      v100 = 0xE300000000000000;
      v98 = 7104878;
    }
    v129 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v98, v100, (uint64_t *)&v131);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, &v130, v87 + 14, v87 + 22);

    swift_bridgeObjectRelease(v100);
    _os_log_impl(&dword_0, v85, v86, "[POIClustering] [RENDERING] Fallback, geoMapItem.name=%ld, geoMapItem.poiCategory=%s", (uint8_t *)v87, 0x16u);
    swift_arrayDestroy(v88, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v88, -1, -1);
    swift_slowDealloc(v87, -1, -1);

    (*(void (**)(char *, char *))(v127 + 8))(v126, v80);
  }
  else
  {

    (*(void (**)(char *, char *))(v83 + 8))(v82, v80);
  }
  v101 = *(void **)&v84[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView];
  objc_msgSend(v101, "frame");
  CGRectGetWidth(v132);
  objc_msgSend(v101, "frame");
  CGRectGetHeight(v133);
  objc_msgSend(v101, "frame");
  CGRectGetWidth(v134);
  objc_msgSend(v101, "frame");
  CGRectGetHeight(v135);
  MOSuggestionLayoutEngine.HalfWidth.init()();
  v106 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithFrame:", v102, v103, v104, v105);
  v107 = String._bridgeToObjectiveC()();
  v108 = objc_msgSend((id)objc_opt_self(UIImage), "_systemImageNamed:", v107);

  objc_msgSend(v106, "setImage:", v108);
  v109 = (void *)objc_opt_self(UIColor);
  v110 = objc_msgSend(v109, "systemWhiteColor");
  objc_msgSend(v106, "setTintColor:", v110);

  v111 = objc_msgSend(v109, "systemIndigoColor");
  objc_msgSend(v101, "setBackgroundColor:", v111);

  v112 = *(void **)&v84[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView];
  v113 = objc_msgSend(v109, "systemIndigoColor");
  objc_msgSend(v112, "setTintColor:", v113);

  v114 = *(void **)&v84[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel];
  v115 = objc_msgSend(v109, "systemIndigoColor");
  objc_msgSend(v114, "setBackgroundColor:", v115);

  v116 = objc_msgSend(v101, "layer");
  objc_msgSend(v101, "frame");
  objc_msgSend(v116, "setCornerRadius:", CGRectGetHeight(v136) * 0.5);

  objc_msgSend(v101, "addSubview:", v106);
}

id MOPOIAnnotationView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id MOPOIAnnotationView.__allocating_init(annotation:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v7;
  id v8;

  v4 = v3;
  if (a3)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_allocWithZone(v4), "initWithAnnotation:reuseIdentifier:", a1, v7);

  swift_unknownObjectRelease(a1);
  return v8;
}

void MOPOIAnnotationView.init(annotation:reuseIdentifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer("MomentsUIServiceCore.MOPOIAnnotationView", 40, "init(annotation:reuseIdentifier:)", 33, 0);
  __break(1u);
}

id MOPOIAnnotationView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MOPOIAnnotationView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:_:)(*(_QWORD *)(v1 + 40), a1);
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v3);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(char a1)
{
  uint64_t v1;
  Swift::Int v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, *(_QWORD *)(v1 + 40));
  MOSuggestionAssetTileSize.hash(into:)((uint64_t)v5, a1);
  v3 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v3);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;

  v4 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v6 = ~v4;
    while (2)
    {
      switch(*(_BYTE *)(*(_QWORD *)(v2 + 48) + result))
      {
        case 2:
          if (a1 != 2)
            goto LABEL_4;
          break;
        case 3:
          if (a1 != 3)
            goto LABEL_4;
          break;
        case 4:
          if (a1 != 4)
            goto LABEL_4;
          break;
        case 5:
          if (a1 != 5)
            goto LABEL_4;
          break;
        case 6:
          if (a1 != 6)
            goto LABEL_4;
          break;
        case 7:
          if (a1 != 7)
            goto LABEL_4;
          break;
        case 8:
          if (a1 != 8)
            goto LABEL_4;
          break;
        case 9:
          if (a1 != 9)
            goto LABEL_4;
          break;
        case 0xA:
          if (a1 != 10)
            goto LABEL_4;
          break;
        default:
          if (a1 - 2 < 9 || ((*(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + result) ^ a1) & 1) != 0)
          {
LABEL_4:
            result = (result + 1) & v6;
            if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
              continue;
          }
          break;
      }
      break;
    }
  }
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v1 = a1[2];
  if (!v1)
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<Int, [MOSuggestionAssetTileSize]>);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
  v5 = a1[4];
  v4 = a1[5];
  result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain(v4);
    return (unint64_t)v3;
  }
  v8 = a1 + 7;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v5;
    *(_QWORD *)(v3[7] + v9) = v4;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v5 = *(v8 - 1);
    v14 = *v8;
    swift_bridgeObjectRetain(v4);
    result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
    v8 = v13;
    v4 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *i;
  char v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<MOSuggestionAssetTileSize, CGFloat>);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
    for (i = (_QWORD *)(a1 + 40); ; i += 2)
    {
      v5 = *((_BYTE *)i - 8);
      v6 = *i;
      result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v3[6] + result) = v5;
      *(_QWORD *)(v3[7] + 8 * result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

_BYTE *outlined init with take of MOSuggestionAssetTileSize(_BYTE *a1, _BYTE *a2)
{
  __swift_memcpy1_1(a2, a1);
  return a2;
}

id specialized MOPOIAnnotationView.init(annotation:configuration:)(uint64_t a1, __int128 *a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  objc_class *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __n128 v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD aBlock[5];
  uint64_t v35;
  objc_super v36;

  v30 = a1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v33 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v31 = *(_QWORD *)(v7 - 8);
  v32 = v7;
  __chkstk_darwin(v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView;
  v11 = objc_allocWithZone((Class)UIImageView);
  v12 = v2;
  *(_QWORD *)&v2[v10] = objc_msgSend(v11, "init");
  v13 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView;
  *(_QWORD *)&v12[v13] = objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");
  v14 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel;
  *(_QWORD *)&v12[v14] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v15 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView;
  *(_QWORD *)&v12[v15] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v16 = &v12[OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_configuration];
  v17 = *a2;
  v18 = a2[1];
  *((_QWORD *)v16 + 4) = *((_QWORD *)a2 + 4);
  *(_OWORD *)v16 = v17;
  *((_OWORD *)v16 + 1) = v18;
  outlined retain of MOPOIAnnotationViewConfiguration(a2);

  v19 = (objc_class *)type metadata accessor for MOPOIAnnotationView();
  v36.receiver = v12;
  v36.super_class = v19;
  v20 = objc_msgSendSuper2(&v36, "initWithAnnotation:reuseIdentifier:", v30, 0);
  type metadata accessor for OS_dispatch_queue();
  v21 = v20;
  v22 = (void *)static OS_dispatch_queue.main.getter();
  v23 = swift_allocObject(&unk_21310, 24, 7);
  swift_unknownObjectWeakInit(v23 + 16, v21);
  aBlock[4] = partial apply for closure #1 in MOPOIAnnotationView.init(annotation:configuration:);
  v35 = v23;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_0;
  v24 = _Block_copy(aBlock);
  v25 = swift_release(v35);
  static DispatchQoS.unspecified.getter(v25);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v26 = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  v28 = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v27, v28, v4, v26);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v6, v24);

  _Block_release(v24);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v32);
  return v21;
}

_QWORD *outlined release of MOPOIAnnotationViewConfiguration(_QWORD *a1)
{
  swift_unknownObjectRelease(*a1);
  return a1;
}

void specialized MOPOIAnnotationView.setupBorderBackground(cluster:)()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  CGRect v6;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView);
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOPOIAnnotationViewConfiguration.clusterCountLabelFrame.getter();
  MOSuggestionLayoutEngine.HalfWidth.init()();
  objc_msgSend(v1, "setFrame:");
  v2 = objc_msgSend(v1, "layer");
  v3 = objc_msgSend((id)objc_opt_self(UIColor), "whiteColor");
  v4 = objc_msgSend(v3, "CGColor");

  objc_msgSend(v2, "setBackgroundColor:", v4);
  objc_msgSend(v1, "setClipsToBounds:", 1);
  v5 = objc_msgSend(v1, "layer");
  objc_msgSend(v1, "frame");
  objc_msgSend(v5, "setCornerRadius:", CGRectGetWidth(v6) * 0.5);

}

void specialized MOPOIAnnotationView.init(coder:)()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_basePOICircleView;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");
  v2 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_downArrowView;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");
  v3 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_clusterCountLabel;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v4 = OBJC_IVAR____TtC20MomentsUIServiceCore19MOPOIAnnotationView_borderBackgroundView;
  *(_QWORD *)&v0[v4] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000000001DA00, "MomentsUIServiceCore/MOSuggestionMapSnapshotAnnotationView.swift", 64, 2, 343, 0);
  __break(1u);
}

uint64_t type metadata accessor for MOPOIAnnotationView()
{
  return objc_opt_self(_TtC20MomentsUIServiceCore19MOPOIAnnotationView);
}

uint64_t initializeBufferWithCopyOfBuffer for MOPOIAnnotationViewConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for MOPOIAnnotationViewConfiguration(_QWORD *a1)
{
  return swift_unknownObjectRelease(*a1);
}

uint64_t initializeWithCopy for MOPOIAnnotationViewConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)a1 = *a2;
  *(_WORD *)(a1 + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_DWORD *)(a1 + 24) = *((_DWORD *)a2 + 6);
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_unknownObjectRetain(v3);
  return a1;
}

uint64_t *assignWithCopy for MOPOIAnnotationViewConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_unknownObjectRetain(v5);
  swift_unknownObjectRelease(v4);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  *((_BYTE *)a1 + 9) = *((_BYTE *)a2 + 9);
  a1[2] = a2[2];
  *((_BYTE *)a1 + 24) = *((_BYTE *)a2 + 24);
  *((_BYTE *)a1 + 25) = *((_BYTE *)a2 + 25);
  *((_BYTE *)a1 + 26) = *((_BYTE *)a2 + 26);
  *((_BYTE *)a1 + 27) = *((_BYTE *)a2 + 27);
  a1[4] = a2[4];
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t *assignWithTake for MOPOIAnnotationViewConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_unknownObjectRelease(v4);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  *((_BYTE *)a1 + 9) = *((_BYTE *)a2 + 9);
  a1[2] = a2[2];
  *((_BYTE *)a1 + 24) = *((_BYTE *)a2 + 24);
  *((_BYTE *)a1 + 25) = *((_BYTE *)a2 + 25);
  *((_BYTE *)a1 + 26) = *((_BYTE *)a2 + 26);
  *((_BYTE *)a1 + 27) = *((_BYTE *)a2 + 27);
  a1[4] = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for MOPOIAnnotationViewConfiguration(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MOPOIAnnotationViewConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MOPOIAnnotationViewConfiguration()
{
  return &type metadata for MOPOIAnnotationViewConfiguration;
}

_QWORD *outlined retain of MOPOIAnnotationViewConfiguration(_QWORD *a1)
{
  swift_unknownObjectRetain(*a1);
  return a1;
}

uint64_t sub_C6F4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void partial apply for closure #1 in MOPOIAnnotationView.init(annotation:configuration:)()
{
  uint64_t v0;

  closure #1 in MOPOIAnnotationView.init(annotation:configuration:)(v0);
}

double block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  *(_QWORD *)&result = swift_retain(v2).n128_u64[0];
  return result;
}

uint64_t block_destroy_helper_0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  }
  return result;
}

uint64_t MOSuggestionAssetMapsClusterer.skipRows.getter()
{
  return MOSuggestionAssetMapsClusterer.skipRows.getter(&OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipRows);
}

uint64_t MOSuggestionAssetMapsClusterer.skipRows.setter(uint64_t a1)
{
  return MOSuggestionAssetMapsClusterer.skipRows.setter(a1, &OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipRows);
}

uint64_t (*MOSuggestionAssetMapsClusterer.skipRows.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipRows, a1, 33, 0);
  return MOMapLocation.startDate.modify;
}

uint64_t MOSuggestionAssetMapsClusterer.skipColumns.getter()
{
  return MOSuggestionAssetMapsClusterer.skipRows.getter(&OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipColumns);
}

uint64_t MOSuggestionAssetMapsClusterer.skipRows.getter(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  _BYTE v4[24];

  v2 = (_QWORD *)(v1 + *a1);
  swift_beginAccess(v2, v4, 0, 0);
  return swift_bridgeObjectRetain(*v2);
}

uint64_t MOSuggestionAssetMapsClusterer.skipColumns.setter(uint64_t a1)
{
  return MOSuggestionAssetMapsClusterer.skipRows.setter(a1, &OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipColumns);
}

uint64_t MOSuggestionAssetMapsClusterer.skipRows.setter(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  _BYTE v7[24];

  v4 = (uint64_t *)(v2 + *a2);
  swift_beginAccess(v4, v7, 1, 0);
  v5 = *v4;
  *v4 = a1;
  return swift_bridgeObjectRelease(v5);
}

uint64_t (*MOSuggestionAssetMapsClusterer.skipColumns.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipColumns, a1, 33, 0);
  return MOMapLocation.poiCategory.modify;
}

void *MOSuggestionAssetMapsClusterer.MAX_SPAN_REGION_DEGREES.unsafeMutableAddressor()
{
  return &static MOSuggestionAssetMapsClusterer.MAX_SPAN_REGION_DEGREES;
}

double static MOSuggestionAssetMapsClusterer.MAX_SPAN_REGION_DEGREES.getter()
{
  return 180.0;
}

double MOSuggestionAssetMapsClusterer.Cluster.coordinates.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void MOSuggestionAssetMapsClusterer.Cluster.coordinates.setter(double a1, double a2)
{
  double *v2;

  *v2 = a1;
  v2[1] = a2;
}

double MOSuggestionAssetMapsClusterer.Cluster.distance.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void MOSuggestionAssetMapsClusterer.Cluster.distance.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.count.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.count.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.chain.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 40));
  return v1;
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.chain.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 40));
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.chain.modify())()
{
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) + 32);
  v4 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1)
{
  uint64_t result;

  result = type metadata singleton initialization cache for MOSuggestionAssetMapsClusterer.Cluster;
  if (!type metadata singleton initialization cache for MOSuggestionAssetMapsClusterer.Cluster)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MOSuggestionAssetMapsClusterer.Cluster);
  return result;
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.id.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) + 32);
  v4 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.id.modify())()
{
  type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.geoMapItem.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  return swift_unknownObjectRetain(*(_QWORD *)(v0 + *(int *)(v1 + 36)));
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.geoMapItem.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) + 36);
  result = swift_unknownObjectRelease(*(_QWORD *)(v1 + v3));
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.geoMapItem.modify())()
{
  type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

double MOSuggestionAssetMapsClusterer.Cluster.confidence.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) + 40));
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.confidence.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  *(double *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.confidence.modify())()
{
  type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.title.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) + 44));
  v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) + 44));
  result = swift_bridgeObjectRelease(v5[1]);
  *v5 = a1;
  v5[1] = a2;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.title.modify())()
{
  type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.isWork.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) + 48));
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.isWork.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  *(_BYTE *)(v1 + *(int *)(result + 48)) = a1;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.isWork.modify())()
{
  type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.isScaledDownPOI.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) + 52));
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.isScaledDownPOI.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  *(_BYTE *)(v1 + *(int *)(result + 52)) = a1;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.isScaledDownPOI.modify())()
{
  type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

double MOSuggestionAssetMapsClusterer.Cluster.horizontalUncertainty.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) + 56));
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.horizontalUncertainty.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  *(double *)(v1 + *(int *)(result + 56)) = a1;
  return result;
}

void (__swiftcall *MOSuggestionAssetMapsClusterer.Cluster.horizontalUncertainty.modify())()
{
  type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  return MOSuggestionLayoutEngine.HalfWidth.init();
}

uint64_t static MOSuggestionAssetMapsClusterer.Cluster.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(int *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) + 32);
  return static UUID.== infix(_:_:)(a1 + v4, a2 + v4);
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.hash(into:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v2 = type metadata accessor for UUID(0);
  v3 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  return dispatch thunk of Hashable.hash(into:)(a1, v2, v3);
}

Swift::Int MOSuggestionAssetMapsClusterer.Cluster.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v0 = type metadata accessor for UUID(0);
  v1 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  dispatch thunk of Hashable.hash(into:)(v3, v0, v1);
  return Hasher._finalize()();
}

uint64_t MOSuggestionAssetMapsClusterer.Cluster.init(coordinates:distance:count:chain:id:geoMapItem:confidence:title:isWork:isScaledDownPOI:horizontalUncertainty:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>, double a12@<D2>, double a13@<D3>, double a14@<D4>, char a15)
{
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  _QWORD *v27;

  *(double *)a9 = a10;
  *(double *)(a9 + 8) = a11;
  *(double *)(a9 + 16) = a12;
  *(_QWORD *)(a9 + 24) = a1;
  *(_QWORD *)(a9 + 32) = a2;
  *(_QWORD *)(a9 + 40) = a3;
  v23 = (int *)type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v24 = a9 + v23[8];
  v25 = type metadata accessor for UUID(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v24, a4, v25);
  *(_QWORD *)(a9 + v23[9]) = a5;
  *(double *)(a9 + v23[10]) = a13;
  v27 = (_QWORD *)(a9 + v23[11]);
  *v27 = a6;
  v27[1] = a7;
  *(_BYTE *)(a9 + v23[12]) = a8;
  *(_BYTE *)(a9 + v23[13]) = a15;
  *(double *)(a9 + v23[14]) = a14;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MOSuggestionAssetMapsClusterer.Cluster()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  v0 = type metadata accessor for UUID(0);
  v1 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  dispatch thunk of Hashable.hash(into:)(v3, v0, v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for UUID(0);
  v3 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  return dispatch thunk of Hashable.hash(into:)(a1, v2, v3);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[9];

  Hasher.init(_seed:)(v4, a1);
  v1 = type metadata accessor for UUID(0);
  v2 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  dispatch thunk of Hashable.hash(into:)(v4, v1, v2);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static UUID.== infix(_:_:)(a1 + *(int *)(a3 + 32), a2 + *(int *)(a3 + 32));
}

uint64_t MOSuggestionAssetMapsClusterer.__allocating_init(mapLocations:separationThreshold:)(uint64_t a1, double a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return MOSuggestionAssetMapsClusterer.init(mapLocations:separationThreshold:)(a1, a2);
}

uint64_t MOSuggestionAssetMapsClusterer.init(mapLocations:separationThreshold:)(uint64_t a1, double a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double *v8;
  void **p_ivar_lyt;
  _QWORD *v10;
  objc_class *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t result;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  char *v23;
  uint64_t v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  objc_super v30;

  v5 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (double *)((char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(_QWORD *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipRows] = &_swiftEmptySetSingleton;
  *(_QWORD *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_skipColumns] = &_swiftEmptySetSingleton;
  p_ivar_lyt = &MOAngelSignposter.ivar_lyt;
  v10 = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_inputClusters] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_results] = &_swiftEmptySetSingleton;
  *(double *)&v2[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_separationThreshold] = a2;
  v11 = (objc_class *)type metadata accessor for MOSuggestionAssetMapsClusterer();
  v30.receiver = v2;
  v30.super_class = v11;
  v12 = objc_msgSendSuper2(&v30, "init");
  v13 = v12;
  v29 = 0;
  if ((unint64_t)a1 >> 62)
    goto LABEL_14;
  v14 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
  v15 = v12;
  if (v14)
  {
    while (1)
    {
      v28 = v10;
      result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14 & ~(v14 >> 63), 0);
      if (v14 < 0)
        break;
      v25 = v13;
      v13 = 0;
      v10 = 0;
      v17 = v28;
      v26 = a1 & 0xC000000000000001;
      p_ivar_lyt = (void **)a1;
      while ((id)v14 != v13)
      {
        if (v26)
        {
          v18 = specialized _ArrayBuffer._getElementSlowPath(_:)(v13, a1);
        }
        else
        {
          v18 = *(_QWORD *)(a1 + 8 * (_QWORD)v13 + 32);
          swift_retain(v18);
        }
        v27 = v18;
        closure #1 in MOSuggestionAssetMapsClusterer.init(mapLocations:separationThreshold:)(&v27, &v29, v8);
        swift_release(v18);
        v28 = v17;
        v20 = v17[2];
        v19 = v17[3];
        if (v20 >= v19 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1);
          v17 = v28;
        }
        v13 = (char *)v13 + 1;
        v17[2] = v20 + 1;
        outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v8, (uint64_t)v17+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v20);
        a1 = (uint64_t)p_ivar_lyt;
        if ((id)v14 == v13)
        {
          swift_bridgeObjectRelease(p_ivar_lyt);
          v13 = v25;

          p_ivar_lyt = (void **)(&MOAngelSignposter + 16);
          goto LABEL_19;
        }
      }
      __break(1u);
LABEL_14:
      if (a1 < 0)
        v21 = a1;
      else
        v21 = a1 & 0xFFFFFFFFFFFFFF8;
      v22 = v13;
      swift_bridgeObjectRetain(a1);
      v14 = _CocoaArrayWrapper.endIndex.getter(v21);
      swift_bridgeObjectRelease(a1);
      if (!v14)
        goto LABEL_18;
    }
    __break(1u);
  }
  else
  {
LABEL_18:
    swift_bridgeObjectRelease(a1);

    v17 = &_swiftEmptyArrayStorage;
LABEL_19:
    v23 = (char *)p_ivar_lyt[487];
    v24 = *(_QWORD *)&v23[(_QWORD)v13];
    *(_QWORD *)&v23[(_QWORD)v13] = v17;
    swift_bridgeObjectRelease(v24);
    return (uint64_t)v13;
  }
  return result;
}

uint64_t type metadata accessor for MOSuggestionAssetMapsClusterer()
{
  return objc_opt_self(_TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer);
}

uint64_t closure #1 in MOSuggestionAssetMapsClusterer.init(mapLocations:separationThreshold:)@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, double *a3@<X8>)
{
  uint64_t v5;
  double v6;
  double v7;
  uint64_t (*v8)(void);
  uint64_t v9;
  char v10;
  uint64_t result;
  char v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  double v21;
  int *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = *a1;
  v6 = (*(double (**)(void))(*(_QWORD *)*a1 + 240))();
  v7 = (*(double (**)(void))(*(_QWORD *)v5 + 264))();
  v8 = *(uint64_t (**)(void))(*(_QWORD *)v5 + 312);
  v9 = v8();
  if ((v10 & 1) != 0)
  {
    v24 = 1;
  }
  else
  {
    result = ((uint64_t (*)(uint64_t))v8)(v9);
    if ((v12 & 1) != 0)
      goto LABEL_8;
    v24 = result;
  }
  v25 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v26 = v13;
  v14._countAndFlagsBits = 95;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  v15 = (*(uint64_t (**)(void))(*(_QWORD *)v5 + 288))();
  v16 = (*(double (**)(void))(*(_QWORD *)v5 + 360))();
  v17 = (*(uint64_t (**)(void))(*(_QWORD *)v5 + 336))();
  v19 = v18;
  v20 = (*(uint64_t (**)(void))(*(_QWORD *)v5 + 384))();
  v21 = (*(double (**)(void))(*(_QWORD *)v5 + 456))();
  v22 = (int *)type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  result = UUID.init()();
  *a3 = v6;
  a3[1] = v7;
  a3[2] = 0.0;
  *((_QWORD *)a3 + 3) = v24;
  *((_QWORD *)a3 + 4) = v25;
  *((_QWORD *)a3 + 5) = v26;
  *(_QWORD *)((char *)a3 + v22[9]) = v15;
  *(double *)((char *)a3 + v22[10]) = v16;
  v23 = (uint64_t *)((char *)a3 + v22[11]);
  *v23 = v17;
  v23[1] = v19;
  *((_BYTE *)a3 + v22[12]) = v20 & 1;
  *((_BYTE *)a3 + v22[13]) = 0;
  *(double *)((char *)a3 + v22[14]) = v21;
  if (!__OFADD__(*a2, 1))
  {
    ++*a2;
    return result;
  }
  __break(1u);
LABEL_8:
  __break(1u);
  return result;
}

Swift::Void __swiftcall MOSuggestionAssetMapsClusterer.buildDendogram()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  double *v50;
  double *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  char *v59;
  char isUniquelyReferenced_nonNull_native;
  double v61;
  char *v62;
  char v63;
  _QWORD *v64;
  uint64_t v65;
  char v66;
  unint64_t v67;
  unint64_t v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  double v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  char v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  unint64_t v109;
  unint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _BYTE v140[24];
  Swift::OpaquePointer distanceMatrix;
  unint64_t v142;
  Swift::tuple_tuple_Int_Int_Double_optional v143;

  v1 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v133 = *(_QWORD *)(v1 - 8);
  v2 = __chkstk_darwin(v1);
  v124 = (uint64_t)&v112 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __chkstk_darwin(v2);
  v123 = (uint64_t)&v112 - v5;
  v6 = __chkstk_darwin(v4);
  v7 = __chkstk_darwin(v6);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v112 - v9;
  v11 = __chkstk_darwin(v8);
  v120 = (uint64_t)&v112 - v12;
  v13 = __chkstk_darwin(v11);
  v119 = (uint64_t)&v112 - v14;
  v15 = __chkstk_darwin(v13);
  v118 = (uint64_t)&v112 - v16;
  v17 = __chkstk_darwin(v15);
  v117 = (uint64_t)&v112 - v18;
  v19 = __chkstk_darwin(v17);
  v116 = (char *)&v112 - v20;
  v21 = __chkstk_darwin(v19);
  v23 = (char *)&v112 - v22;
  v24 = __chkstk_darwin(v21);
  __chkstk_darwin(v24);
  v125 = (uint64_t)&v112 - v28;
  v29 = *(_QWORD *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_inputClusters);
  v142 = v29;
  v30 = *(_QWORD *)(v29 + 16);
  if (!v30)
    goto LABEL_93;
  v31 = v30 - 1;
  if (v30 == 1)
  {
    swift_bridgeObjectRetain(v29);
    goto LABEL_78;
  }
  v131 = v27;
  v127 = v26;
  v128 = v25;
  v115 = OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_separationThreshold;
  v114 = v0 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_results;
  swift_bridgeObjectRetain(v29);
  v32 = 0;
  v122 = v0;
  v130 = v1;
  v113 = v10;
  v129 = v23;
  v121 = v31;
  while (1)
  {
    if (v32 == v31)
    {
LABEL_91:
      __break(1u);
LABEL_92:
      __break(1u);
LABEL_93:
      __break(1u);
LABEL_94:
      __break(1u);
LABEL_95:
      __break(1u);
      goto LABEL_96;
    }
    v126 = v32;
    v33 = *(_QWORD *)(v29 + 16);
    if (!v33)
    {
      v34 = &_swiftEmptyArrayStorage;
LABEL_13:
      swift_bridgeObjectRelease(v34);
      v37 = &_swiftEmptyArrayStorage;
      goto LABEL_14;
    }
    v34 = (_QWORD *)static Array._allocateBufferUninitialized(minimumCapacity:)(*(_QWORD *)(v29 + 16), &type metadata for Double);
    v34[2] = v33;
    memset_pattern16(v34 + 4, &unk_195D0, 8 * v33);
    v35 = *(_QWORD *)(v29 + 16);
    if (!v35)
      goto LABEL_13;
    v36 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
    v37 = (_QWORD *)static Array._allocateBufferUninitialized(minimumCapacity:)(v35, v36);
    v37[2] = v35;
    v37[4] = v34;
    if (v35 != 1)
    {
      v38 = v37;
      v37[5] = v34;
      v39 = v35 - 2;
      if (v35 != 2)
      {
        v40 = v37 + 6;
        do
        {
          *v40++ = v34;
          swift_bridgeObjectRetain(v34);
          --v39;
        }
        while (v39);
      }
      swift_bridgeObjectRetain(v34);
      v37 = v38;
    }
LABEL_14:
    v41 = *(_QWORD *)(v29 + 16);
    if (!v41)
      goto LABEL_92;
    v42 = v41 - 1;
    v137 = v29;
    v43 = v37;
    if (v41 != 1)
      break;
LABEL_35:
    distanceMatrix._rawValue = v37;
    v64 = v37;
    v65 = v122;
    v143 = MOSuggestionAssetMapsClusterer.findSmallestEuclideanDistance(distanceMatrix:lowerHalfOnly:)(&distanceMatrix, 1);
    if ((v66 & 1) == 0)
    {
      if (v143.value._0._0 < 0)
        goto LABEL_95;
      v67 = *(_QWORD *)(v29 + 16);
      if (v143.value._0._0 < v67)
      {
        v68 = v143.value._0._1;
        v69 = *(double *)&v143.is_nil;
        v136 = (*(unsigned __int8 *)(v133 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v133 + 80);
        v70 = v29 + v136;
        v71 = *(_QWORD *)(v133 + 72);
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v29 + v136 + v71 * v143.value._0._0, v125);
        if (v68 >= v67)
          goto LABEL_97;
        v72 = v67;
        v73 = v69;
        v74 = v131;
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v70 + v71 * v68, v131);
        if (*(double *)(v65 + v115) * *(double *)(v65 + v115) <= v73)
        {
          swift_bridgeObjectRelease(v43);
          v86 = v125;
          v87 = v120;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v125, v120);
          swift_beginAccess(v114, v140, 33, 0);
          v88 = v119;
          specialized Set._Variant.insert(_:)(v119, v87);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v88);
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v74, v87);
          specialized Set._Variant.insert(_:)(v88, v87);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v88);
          swift_endAccess(v140);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v74);
          v89 = v86;
LABEL_56:
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v89);
          v31 = v121;
          goto LABEL_57;
        }
        v139 = v125 + *(int *)(v130 + 32);
        swift_bridgeObjectRetain(v29);
        v75 = 0;
        v76 = v71 + v136;
        v77 = 1;
        v78 = (uint64_t)v116;
        v79 = v72;
        while (1)
        {
          v80 = v130;
          v81 = static UUID.== infix(_:_:)(v70 + *(int *)(v130 + 32), v139);
          v82 = (uint64_t)v129;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v70, (uint64_t)v129);
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v131, v78);
          if ((v81 & 1) != 0)
            break;
          v83 = static UUID.== infix(_:_:)(v82 + *(int *)(v80 + 32), v78 + *(int *)(v80 + 32));
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v78);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v82);
          if ((v83 & 1) != 0)
            goto LABEL_48;
          ++v75;
          v70 += v71;
          ++v77;
          v76 += v71;
          if (v79 == v75)
          {
            v84 = v137;
            swift_bridgeObjectRelease(v137);
            v75 = *(_QWORD *)(v84 + 16);
            v85 = v142;
            goto LABEL_50;
          }
        }
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v78);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v82);
LABEL_48:
        v90 = v137;
        swift_bridgeObjectRelease(v137);
        v91 = (uint64_t)v113;
        if (__OFADD__(v75, 1))
        {
LABEL_104:
          __break(1u);
          return;
        }
        v92 = *(_QWORD *)(v90 + 16);
        v85 = v142;
        v93 = v130;
        if (v75 + 1 == v92)
        {
LABEL_50:
          v94 = *(_QWORD *)(v85 + 16);
          if (v94 >= (uint64_t)v75)
          {
            specialized Array.replaceSubrange<A>(_:with:)(v75, v94);
            swift_bridgeObjectRelease(distanceMatrix._rawValue);
            v95 = v117;
            MOSuggestionAssetMapsClusterer.combinedCluster(_:_:distance:)(v125, v131, v117, v73);
            outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v95, v118);
            v29 = v142;
            if ((swift_isUniquelyReferenced_nonNull_native(v142) & 1) == 0)
              v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v29 + 16) + 1, 1, v29);
            v97 = *(_QWORD *)(v29 + 16);
            v96 = *(_QWORD *)(v29 + 24);
            if (v97 >= v96 >> 1)
              v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v96 > 1, v97 + 1, 1, v29);
            *(_QWORD *)(v29 + 16) = v97 + 1;
            outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v118, v29 + v136 + v97 * v71);
            v142 = v29;
            v98 = v117;
            v99 = v120;
            outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v117, v120);
            swift_beginAccess(v114, v140, 33, 0);
            v100 = v119;
            specialized Set._Variant.insert(_:)(v119, v99);
            outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v100);
            swift_endAccess(v140);
            outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v98);
            outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v131);
            v89 = v125;
            goto LABEL_56;
          }
          goto LABEL_103;
        }
        while (1)
        {
          if (v77 >= *(_QWORD *)(v85 + 16))
            goto LABEL_89;
          v101 = v71;
          v138 = v85 + v76;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v85 + v76, v91);
          v102 = v93;
          v103 = static UUID.== infix(_:_:)(v91 + *(int *)(v93 + 32), v139);
          v104 = v91;
          v105 = v91;
          v106 = v127;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v104, v127);
          v107 = v128;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v131, v128);
          if ((v103 & 1) != 0)
            break;
          v108 = static UUID.== infix(_:_:)(v106 + *(int *)(v102 + 32), v107 + *(int *)(v102 + 32));
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v106);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v107);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v105);
          v91 = v105;
          if ((v108 & 1) != 0)
            goto LABEL_63;
          v71 = v101;
          if (v77 != v75)
          {
            if ((v75 & 0x8000000000000000) != 0)
              goto LABEL_98;
            v109 = *(_QWORD *)(v85 + 16);
            if (v75 >= v109)
              goto LABEL_99;
            outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v85 + v136 + v75 * v101, v123);
            if (v77 >= v109)
              goto LABEL_100;
            outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v138, v124);
            if ((swift_isUniquelyReferenced_nonNull_native(v85) & 1) == 0)
            {
              v85 = specialized _ArrayBuffer._consumeAndCreateNew()(v85);
              v142 = v85;
            }
            v91 = (uint64_t)v113;
            if (v75 >= *(_QWORD *)(v85 + 16))
              goto LABEL_101;
            outlined assign with take of MOSuggestionAssetMapsClusterer.Cluster(v124, v85 + v136 + v75 * v101);
            if (v77 >= *(_QWORD *)(v142 + 16))
              goto LABEL_102;
            outlined assign with take of MOSuggestionAssetMapsClusterer.Cluster(v123, v142 + v76);
          }
          if (__OFADD__(v75++, 1))
            goto LABEL_94;
LABEL_74:
          v111 = v77 + 1;
          v93 = v130;
          if (__OFADD__(v77, 1))
            goto LABEL_90;
          v85 = v142;
          ++v77;
          v76 += v71;
          if (v111 == *(_QWORD *)(v142 + 16))
            goto LABEL_50;
        }
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v106);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v107);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v105);
        v91 = v105;
LABEL_63:
        v71 = v101;
        goto LABEL_74;
      }
LABEL_96:
      __break(1u);
LABEL_97:
      __break(1u);
LABEL_98:
      __break(1u);
LABEL_99:
      __break(1u);
LABEL_100:
      __break(1u);
LABEL_101:
      __break(1u);
LABEL_102:
      __break(1u);
LABEL_103:
      __break(1u);
      goto LABEL_104;
    }
    swift_bridgeObjectRelease(v64);
    v31 = v121;
LABEL_57:
    v32 = v126 + 1;
    if (v126 + 1 == v31)
      goto LABEL_85;
  }
  v44 = 0;
  v45 = v37 + 4;
  v46 = v37 + 5;
  v132 = v29 + 8;
  v136 = 1;
  v134 = v41 - 1;
  while (1)
  {
    if (v44 == v42)
    {
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      __break(1u);
      goto LABEL_91;
    }
    v47 = *(_QWORD *)(v29 + 16);
    if (v47 <= v44)
      goto LABEL_87;
    v135 = v44 + 1;
    if (v44 + 1 != v47)
      break;
LABEL_17:
    ++v136;
    v42 = v134;
    v44 = v135;
    if (v135 == v134)
      goto LABEL_35;
  }
  if (v44 + 1 >= v47)
    goto LABEL_88;
  v48 = (*(unsigned __int8 *)(v133 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v133 + 80);
  v49 = *(_QWORD *)(v133 + 72);
  v50 = (double *)(v29 + v48 + v49 * v44);
  v138 = v47 - 1;
  v139 = v49;
  v51 = (double *)(v132 + v48 + v49 * v136);
  v52 = v44;
  while (1)
  {
    v53 = *(_QWORD *)(v29 + 16);
    if (v44 >= v53)
      break;
    v54 = v52 + 1;
    if (v52 + 1 >= v53)
      goto LABEL_80;
    if (v44 >= v37[2])
      goto LABEL_81;
    v55 = *(v51 - 1);
    v56 = *v51;
    v58 = *v50;
    v57 = v50[1];
    v59 = (char *)v45[v44];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v59);
    v45[v44] = v59;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v59 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v59);
      v45[v44] = v59;
    }
    if (v54 >= *((_QWORD *)v59 + 2))
      goto LABEL_82;
    v61 = (v58 - v55) * (v58 - v55) + (v57 - v56) * (v57 - v56);
    *(double *)&v59[8 * v52 + 40] = v61;
    if (v54 >= v43[2])
      goto LABEL_83;
    v62 = (char *)v46[v52];
    v63 = swift_isUniquelyReferenced_nonNull_native(v62);
    v46[v52] = v62;
    if ((v63 & 1) == 0)
    {
      v62 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v62);
      v46[v52] = v62;
    }
    v29 = v137;
    if (v44 >= *((_QWORD *)v62 + 2))
      goto LABEL_84;
    v37 = v43;
    *(double *)&v62[8 * v44 + 32] = v61;
    ++v52;
    v51 = (double *)((char *)v51 + v139);
    if (v138 == v52)
      goto LABEL_17;
  }
  __break(1u);
LABEL_80:
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  v29 = v142;
LABEL_78:
  swift_bridgeObjectRelease(v29);
}

uint64_t MOSuggestionAssetMapsClusterer.distanceMatrix(clusters:)(uint64_t *a1)
{
  uint64_t v1;
  char *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double *v14;
  double *v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v1 = *a1;
  v2 = specialized Array.init(repeating:count:)(*(_QWORD *)(*a1 + 16), 1.79769313e308);
  result = (uint64_t)specialized Array.init(repeating:count:)((uint64_t)v2, *(_QWORD *)(v1 + 16));
  v30 = v1;
  v4 = *(_QWORD *)(v1 + 16);
  if (v4)
  {
    v5 = result;
    v6 = v4 - 1;
    if (v4 == 1)
      return v5;
    v7 = 0;
    v25 = v1 + 8;
    v26 = v4 - 1;
    v8 = 5;
    v9 = 1;
    while (v7 != v6)
    {
      v10 = *(_QWORD *)(v30 + 16);
      if (v10 <= v7)
        goto LABEL_32;
      v28 = v8;
      v27 = v7 + 1;
      if (v7 + 1 != v10)
      {
        if (v7 + 1 >= v10)
          goto LABEL_33;
        result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
        v11 = *(_QWORD *)(result - 8);
        v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
        v13 = *(_QWORD *)(v11 + 72);
        v14 = (double *)(v30 + v12 + v13 * v7);
        v29 = 1 - v10;
        v15 = (double *)(v25 + v12 + v13 * v9);
        while (1)
        {
          v16 = *(_QWORD *)(v30 + 16);
          if (v7 >= v16)
            break;
          v17 = v8 - 4;
          if (v8 - 4 >= v16)
            goto LABEL_26;
          v18 = *(v15 - 1);
          v19 = *v15;
          v21 = *v14;
          v20 = v14[1];
          result = swift_isUniquelyReferenced_nonNull_native(v5);
          if ((result & 1) == 0)
          {
            result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v5);
            v5 = result;
          }
          if (v7 >= *(_QWORD *)(v5 + 16))
            goto LABEL_27;
          v22 = *(_QWORD *)(v5 + 32 + 8 * v7);
          result = swift_isUniquelyReferenced_nonNull_native(v22);
          *(_QWORD *)(v5 + 32 + 8 * v7) = v22;
          if ((result & 1) == 0)
          {
            result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v22);
            v22 = result;
            *(_QWORD *)(v5 + 32 + 8 * v7) = result;
          }
          if (v17 >= *(_QWORD *)(v22 + 16))
            goto LABEL_28;
          v23 = (v21 - v18) * (v21 - v18) + (v20 - v19) * (v20 - v19);
          *(double *)(v22 + 8 * v8) = v23;
          if (v17 >= *(_QWORD *)(v5 + 16))
            goto LABEL_29;
          v24 = *(_QWORD *)(v5 + 8 * v8);
          result = swift_isUniquelyReferenced_nonNull_native(v24);
          *(_QWORD *)(v5 + 8 * v8) = v24;
          if ((result & 1) == 0)
          {
            result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew()(v24);
            v24 = result;
            *(_QWORD *)(v5 + 8 * v8) = result;
          }
          if (v7 >= *(_QWORD *)(v24 + 16))
            goto LABEL_30;
          *(double *)(v24 + 8 * v7 + 32) = v23;
          ++v8;
          v15 = (double *)((char *)v15 + v13);
          if (v29 + v8 == 5)
            goto LABEL_4;
        }
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        break;
      }
LABEL_4:
      v8 = v28 + 1;
      ++v9;
      v6 = v26;
      ++v7;
      if (v27 == v26)
        return v5;
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::tuple_tuple_Int_Int_Double_optional __swiftcall MOSuggestionAssetMapsClusterer.findSmallestEuclideanDistance(distanceMatrix:lowerHalfOnly:)(Swift::OpaquePointer *distanceMatrix, Swift::Bool lowerHalfOnly)
{
  _QWORD *v2;
  _QWORD *rawValue;
  Swift::Int v4;
  Swift::Int v5;
  Swift::Bool v6;
  double v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(Swift::Int);
  uint64_t v15;
  unint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  Swift::Int v36;
  Swift::tuple_tuple_Int_Int_Double_optional result;

  rawValue = distanceMatrix->_rawValue;
  v34 = rawValue[2];
  if (!v34)
  {
LABEL_37:
    v11 = 0;
    v10 = 0;
    v6 = 0;
    goto LABEL_39;
  }
  v33 = (char *)(rawValue + 4);
  v4 = swift_bridgeObjectRetain(rawValue);
  v8 = 0;
  v9 = 1.79769313e308;
  v10 = -1;
  v11 = -1;
  v36 = v4;
  while (1)
  {
    if (v8 >= *(_QWORD *)(v4 + 16))
      goto LABEL_41;
    v12 = *(_QWORD *)&v33[8 * v8];
    v13 = *(_QWORD *)(v12 + 16);
    if (v13)
      break;
LABEL_4:
    if (++v8 == v34)
    {
      swift_bridgeObjectRelease(v4);
      if (v11 == -1 && v10 == -1)
        goto LABEL_37;
      v6 = LOBYTE(v9);
LABEL_39:
      v4 = v11;
      v5 = v10;
      goto LABEL_42;
    }
  }
  v14 = *(uint64_t (**)(Swift::Int))&stru_68.segname[swift_isaMask & *v2];
  if (v8 <= 1)
    v15 = 1;
  else
    v15 = v8;
  v35 = v15;
  v4 = swift_bridgeObjectRetain(v12);
  v16 = 0;
  while (v16 < *(_QWORD *)(v12 + 16))
  {
    v17 = *(double *)(v12 + 32 + 8 * v16);
    v18 = v14(v4);
    v19 = v18;
    if (*(_QWORD *)(v18 + 16))
    {
      v20 = static Hasher._hash(seed:_:)(*(_QWORD *)(v18 + 40), v8);
      v21 = -1 << *(_BYTE *)(v19 + 32);
      v22 = v20 & ~v21;
      if (((*(_QWORD *)(v19 + 56 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) != 0)
      {
        v23 = *(_QWORD *)(v19 + 48);
        if (*(_QWORD *)(v23 + 8 * v22) == v8)
          goto LABEL_11;
        v24 = ~v21;
        while (1)
        {
          v22 = (v22 + 1) & v24;
          if (((*(_QWORD *)(v19 + 56 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
            break;
          if (*(_QWORD *)(v23 + 8 * v22) == v8)
            goto LABEL_11;
        }
      }
    }
    v25 = swift_bridgeObjectRelease(v19);
    v26 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.size + (swift_isaMask & *v2)))(v25);
    v19 = v26;
    if (!*(_QWORD *)(v26 + 16))
      goto LABEL_28;
    v27 = static Hasher._hash(seed:_:)(*(_QWORD *)(v26 + 40), v16);
    v28 = -1 << *(_BYTE *)(v19 + 32);
    v29 = v27 & ~v28;
    if (((*(_QWORD *)(v19 + 56 + ((v29 >> 3) & 0xFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
      goto LABEL_28;
    v30 = *(_QWORD *)(v19 + 48);
    if (*(_QWORD *)(v30 + 8 * v29) != v16)
    {
      v31 = ~v28;
      while (1)
      {
        v29 = (v29 + 1) & v31;
        if (((*(_QWORD *)(v19 + 56 + ((v29 >> 3) & 0xFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
          break;
        if (*(_QWORD *)(v30 + 8 * v29) == v16)
          goto LABEL_11;
      }
LABEL_28:
      v4 = swift_bridgeObjectRelease(v19);
      if (!lowerHalfOnly || v16 < v8 && (v32 = *(_QWORD *)(v36 + 16), v16 < v32) && v32 > v35)
      {
        if (v17 < v9)
        {
          v10 = v16;
          v11 = v8;
          v9 = v17;
        }
      }
      goto LABEL_12;
    }
LABEL_11:
    v4 = swift_bridgeObjectRelease(v19);
LABEL_12:
    if (++v16 == v13)
    {
      swift_bridgeObjectRelease(v12);
      v4 = v36;
      goto LABEL_4;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  result.value._1 = v7;
  result.value._0._1 = v5;
  result.value._0._0 = v4;
  result.is_nil = v6;
  return result;
}

uint64_t MOSuggestionAssetMapsClusterer.combinedCluster(_:_:distance:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t result;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  Swift::String v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v9 = (int *)result;
  v10 = *(int *)(result + 36);
  v11 = *(_QWORD *)(a1 + v10);
  v12 = v11;
  if (!v11)
  {
    v12 = *(_QWORD *)(a2 + v10);
    result = swift_unknownObjectRetain(v12);
  }
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a2 + 24);
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = (*(double *)(a1 + 8) + *(double *)(a2 + 8)) * 0.5;
    v17 = (*(double *)a1 + *(double *)a2) * 0.5;
    v19 = *(_QWORD *)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 40);
    v20 = *(_QWORD *)(a2 + 32);
    v21 = *(void **)(a2 + 40);
    v25 = v19;
    v26 = v18;
    swift_bridgeObjectRetain(v18);
    v22._countAndFlagsBits = v20;
    v22._object = v21;
    String.append(_:)(v22);
    v23 = swift_unknownObjectRetain(v11);
    result = UUID.init()(v23);
    *(double *)a3 = v17;
    *(double *)(a3 + 8) = v16;
    *(double *)(a3 + 16) = a4;
    *(_QWORD *)(a3 + 24) = v15;
    *(_QWORD *)(a3 + 32) = v25;
    *(_QWORD *)(a3 + 40) = v26;
    *(_QWORD *)(a3 + v9[9]) = v12;
    *(_QWORD *)(a3 + v9[10]) = 0;
    v24 = (_QWORD *)(a3 + v9[11]);
    *v24 = 0;
    v24[1] = 0xE000000000000000;
    *(_BYTE *)(a3 + v9[12]) = 0;
    *(_BYTE *)(a3 + v9[13]) = 0;
    *(_QWORD *)(a3 + v9[14]) = 0;
  }
  return result;
}

double static MOSuggestionAssetMapsClusterer.makeRegion(containing:applyBottomPaddingForPlatter:applyBottomPaddingForGradient:horizontalAspectRatio:markerStyle:applyRenderMargin:shouldAdjustMarker:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  unint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  double latitude;
  double v15;
  uint64_t v16;
  char v17;
  char v18;
  int64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  double v25;
  double v26;
  unint64_t v27;
  unint64_t v28;
  double *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double latitudeDelta;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  char v51;
  MKMapRect v52;
  MKCoordinateRegion v53;
  MKMapRect v54;

  v9 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v44 = a1;
    else
      v44 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    if (_CocoaArrayWrapper.endIndex.getter(v44))
      goto LABEL_3;
  }
  else
  {
    v10 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain(a1);
    if (v10)
    {
LABEL_3:
      v51 = a6;
      if ((a1 & 0xC000000000000001) != 0)
      {
        v11 = a2;
        v12 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
LABEL_6:
        v13 = swift_bridgeObjectRelease(a1);
        latitude = (*(double (**)(uint64_t))(*(_QWORD *)v12 + 240))(v13);
        (*(void (**)(void))(*(_QWORD *)v12 + 264))();
        v15 = (*(double (**)(void))(*(_QWORD *)v12 + 456))();
        v16 = (*(uint64_t (**)(void))(*(_QWORD *)v12 + 312))();
        v18 = v17;
        if (v9)
        {
          if (a1 < 0)
            v21 = a1;
          else
            v21 = a1 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(a1);
          v19 = _CocoaArrayWrapper.endIndex.getter(v21);
          swift_bridgeObjectRelease(a1);
          if (v19 < 2)
          {
LABEL_8:
            if ((v18 & 1) != 0 || v16 < 2)
            {
              if (v15 <= 0.0)
              {
                swift_release(v12);
                v20 = 0.04;
              }
              else
              {
                if (one-time initialization token for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD != -1)
                  swift_once(&one-time initialization token for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD, one-time initialization function for LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD);
                v41 = *(double *)&static MOMapLocation.LOW_CONFIDENCE_HIGH_CERTAINTITY_THRESHOLD;
                swift_release(v12);
                v42 = v15 / 111000.0;
                if (v15 >= v41)
                {
                  v43 = v42 * 3.0 + 0.003;
                  if (v43 <= 0.1)
                    v20 = v43;
                  else
                    v20 = 0.1;
                }
                else
                {
                  v20 = v42 + v42 + 0.003;
                }
              }
            }
            else
            {
              swift_release(v12);
              v20 = 0.01;
            }
            latitudeDelta = v20;
            if ((v51 & 1) != 0)
            {
LABEL_34:
              v40 = 1.4;
LABEL_35:
              if ((v11 & 1) != 0)
                return latitude + latitudeDelta * v40 * 1.4 / -12.0;
              return latitude;
            }
LABEL_23:
            v40 = 1.1;
            goto LABEL_35;
          }
        }
        else
        {
          v19 = *(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8));
          if (v19 < 2)
            goto LABEL_8;
        }
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v19, 0);
        v22 = 0;
        do
        {
          if ((a1 & 0xC000000000000001) != 0)
          {
            v23 = specialized _ArrayBuffer._getElementSlowPath(_:)(v22, a1);
          }
          else
          {
            v23 = *(_QWORD *)(a1 + 8 * v22 + 32);
            v24 = swift_retain(v23);
          }
          v25 = (*(double (**)(__n128))(*(_QWORD *)v23 + 240))(v24);
          v26 = (*(double (**)(void))(*(_QWORD *)v23 + 264))();
          swift_release(v23);
          v28 = _swiftEmptyArrayStorage[2];
          v27 = _swiftEmptyArrayStorage[3];
          if (v28 >= v27 >> 1)
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v27 > 1, v28 + 1, 1);
          ++v22;
          _swiftEmptyArrayStorage[2] = v28 + 1;
          v29 = (double *)&_swiftEmptyArrayStorage[2 * v28 + 4];
          *v29 = v25;
          v29[1] = v26;
        }
        while (v19 != v22);
        v30 = objc_msgSend((id)objc_opt_self(MKPolygon), "polygonWithCoordinates:count:", &_swiftEmptyArrayStorage[4], v19);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        objc_msgSend(v30, "boundingMapRect");
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v38 = v37;

        v52.origin.x = v32;
        v52.origin.y = v34;
        v52.size.width = v36;
        v52.size.height = v38;
        v53 = MKCoordinateRegionForMapRect(v52);
        latitude = v53.center.latitude;
        latitudeDelta = v53.span.latitudeDelta;
        swift_release(v12);
        if ((v51 & 1) != 0)
          goto LABEL_34;
        goto LABEL_23;
      }
      if (*(_QWORD *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8)))
      {
        v11 = a2;
        v12 = *(_QWORD *)(a1 + 32);
        swift_retain(v12);
        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_49;
    }
  }
  swift_bridgeObjectRelease(a1);
  if (one-time initialization token for assets != -1)
LABEL_49:
    swift_once(&one-time initialization token for assets, one-time initialization function for assets);
  v45 = type metadata accessor for Logger(0);
  v46 = __swift_project_value_buffer(v45, (uint64_t)static MOAngelLogger.assets);
  v47 = Logger.logObject.getter(v46);
  v48 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v49 = 0;
    _os_log_impl(&dword_0, v47, v48, "[MapSnapshot] makeRegion failed with 0 locations", v49, 2u);
    swift_slowDealloc(v49, -1, -1);
  }

  v54.origin.x = MKMapRectNull.origin.x;
  v54.origin.y = MKMapRectNull.origin.y;
  v54.size.width = MKMapRectNull.size.width;
  v54.size.height = MKMapRectNull.size.height;
  *(_QWORD *)&latitude = (unint64_t)MKCoordinateRegionForMapRect(v54);
  return latitude;
}

char *MOSuggestionAssetMapsClusterer.groupedByAverageHeight()()
{
  int64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  double v25;
  char v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint8_t *v33;
  uint64_t *v34;
  uint64_t v35;
  void **p_ivar_lyt;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  double i;
  unint64_t v41;
  unint64_t v42;
  double v43;
  double v44;
  int64_t v45;
  unint64_t v46;
  int64_t v47;
  __n128 v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  double *v67;
  uint64_t v69;
  unint64_t v70;
  BOOL v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  double *v75;
  double v76;
  double v77;
  void *v78;
  uint64_t v79;
  void *v80;
  NSString v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id v91;
  double v92;
  id v93;
  id v94;
  id v95;
  id v96;
  double v97;
  id v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  int *v102;
  _QWORD *v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  BOOL v114;
  int *v115;
  uint64_t v116;
  uint64_t v117;
  _QWORD *v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t v121;
  void *v122;
  Swift::String v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  id v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  _QWORD *v138;
  char *v139;
  unint64_t v140;
  id v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  int64_t v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  double *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  _OWORD v158[2];
  __int128 v159;
  __int128 v160;
  char v161[8];
  __int128 v162;

  v1 = v0;
  v156 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v157 = *(_QWORD *)(v156 - 8);
  v2 = __chkstk_darwin(v156);
  v155 = (uint64_t)&v134 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v134 - v5;
  v7 = __chkstk_darwin(v4);
  v143 = (uint64_t)&v134 - v8;
  v9 = __chkstk_darwin(v7);
  v11 = (unint64_t)&v134 - v10;
  v12 = __chkstk_darwin(v9);
  v151 = (double *)((char *)&v134 - v13);
  v14 = __chkstk_darwin(v12);
  v16 = (unint64_t)&v134 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v134 - v18;
  v20 = __chkstk_darwin(v17);
  v22 = (unint64_t)&v134 - v21;
  __chkstk_darwin(v20);
  v24 = (char *)&v134 - v23;
  *(_QWORD *)&v162 = 0;
  *((_QWORD *)&v162 + 1) = 0xE000000000000000;
  v25 = COERCE_DOUBLE(specialized static MOAngelDefaultsManager.doubleValueFor(_:)());
  if ((v26 & 1) != 0)
    v27 = 0.5;
  else
    v27 = v25;
  if (one-time initialization token for assets != -1)
    goto LABEL_126;
  while (1)
  {
    v28 = type metadata accessor for Logger(0);
    v29 = __swift_project_value_buffer(v28, (uint64_t)static MOAngelLogger.assets);
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.default.getter();
    v32 = os_log_type_enabled(v30, v31);
    v145 = v16;
    if (v32)
    {
      v33 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v33 = 134217984;
      *(double *)&v159 = v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v159, (char *)&v159 + 8, v33 + 4, v33 + 12);
      _os_log_impl(&dword_0, v30, v31, "[MOSuggestionAssetMapsClusterer] using POI penalty: %f", v33, 0xCu);
      swift_slowDealloc(v33, -1, -1);
    }

    v34 = (uint64_t *)(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_results);
    swift_beginAccess(v1 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_results, v161, 0, 0);
    v35 = *v34;
    p_ivar_lyt = (void **)(&MOAngelSignposter + 16);
    if (!*(_QWORD *)(*v34 + 16))
    {
      v24 = (char *)_swiftEmptyArrayStorage;
      goto LABEL_109;
    }
    v138 = (_QWORD *)v11;
    v146 = v1;
    v16 = v35 + 56;
    v37 = 1 << *(_BYTE *)(v35 + 32);
    v38 = -1;
    if (v37 < 64)
      v38 = ~(-1 << v37);
    v11 = v38 & *(_QWORD *)(v35 + 56);
    v39 = (unint64_t)(v37 + 63) >> 6;
    swift_bridgeObjectRetain(v35);
    v1 = 0;
    for (i = 0.0; ; i = i + v44 * (1.0 - v43))
    {
      if (v11)
      {
        v41 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v42 = v41 | (v1 << 6);
        goto LABEL_12;
      }
      v45 = v1 + 1;
      if (__OFADD__(v1, 1))
      {
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
        goto LABEL_123;
      }
      if (v45 >= v39)
        goto LABEL_31;
      v46 = *(_QWORD *)(v16 + 8 * v45);
      ++v1;
      if (!v46)
      {
        v1 = v45 + 1;
        if (v45 + 1 >= v39)
          goto LABEL_31;
        v46 = *(_QWORD *)(v16 + 8 * v1);
        if (!v46)
        {
          v1 = v45 + 2;
          if (v45 + 2 >= v39)
            goto LABEL_31;
          v46 = *(_QWORD *)(v16 + 8 * v1);
          if (!v46)
            break;
        }
      }
LABEL_30:
      v11 = (v46 - 1) & v46;
      v42 = __clz(__rbit64(v46)) + (v1 << 6);
LABEL_12:
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(_QWORD *)(v35 + 48) + *(_QWORD *)(v157 + 72) * v42, (uint64_t)v24);
      outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v24, v22);
      if (*(_QWORD *)(v22 + *(int *)(v156 + 36)))
        v43 = v27;
      else
        v43 = -v27;
      v44 = *(double *)(v22 + 16);
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v22);
    }
    v47 = v45 + 3;
    if (v47 >= v39)
      break;
    v46 = *(_QWORD *)(v16 + 8 * v47);
    if (v46)
    {
      v1 = v47;
      goto LABEL_30;
    }
    while (1)
    {
      v1 = v47 + 1;
      if (__OFADD__(v47, 1))
        break;
      if (v1 >= v39)
        goto LABEL_31;
      v46 = *(_QWORD *)(v16 + 8 * v1);
      ++v47;
      if (v46)
        goto LABEL_30;
    }
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    swift_once(&one-time initialization token for assets, one-time initialization function for assets);
  }
LABEL_31:
  v48 = swift_release(v35);
  v49 = *v34;
  v27 = *(double *)(*v34 + 16);
  swift_bridgeObjectRetain_n(*v34, 2, v48);
  v50 = specialized _copyCollectionToContiguousArray<A>(_:)(v49);
  swift_bridgeObjectRelease(v49);
  *(_QWORD *)&v159 = v50;
  specialized MutableCollection<>.sort(by:)(&v159, specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
  swift_bridgeObjectRelease(v49);
  v11 = v159;
  v22 = *(_QWORD *)(v159 + 16);
  v1 = v146;
  v51 = v145;
  if (v22)
  {
    v16 = 0;
    v148 = OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_inputClusters;
    v147 = (*(unsigned __int8 *)(v157 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v157 + 80);
    v52 = v159 + v147;
    v137 = GEOPOICategoryReligiousSite;
    v24 = (char *)_swiftEmptyArrayStorage;
    v140 = 0x800000000001D630;
    v139 = (char *)&type metadata for Any + 8;
    v53 = i / (double)*(uint64_t *)&v27;
    v142 = v159;
    v150 = v22;
    v149 = v159 + v147;
    while (1)
    {
      if (v16 >= *(_QWORD *)(v11 + 16))
      {
        __break(1u);
        goto LABEL_121;
      }
      v154 = *(_QWORD *)(v157 + 72);
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v52 + v154 * v16, (uint64_t)v19);
      v27 = *((double *)v19 + 2);
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v19, v51);
      if (v27 >= v53)
      {
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v51);
        goto LABEL_34;
      }
      v159 = v162;
      v54 = *(_QWORD *)(v51 + 40);
      *(_QWORD *)&v158[0] = *(_QWORD *)(v51 + 32);
      *((_QWORD *)&v158[0] + 1) = v54;
      v22 = lazy protocol witness table accessor for type String and conformance String();
      v55 = StringProtocol.contains<A>(_:)(v158, &type metadata for String, &type metadata for String, v22, v22);
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v51);
      if ((v55 & 1) != 0)
      {
        v22 = v150;
        v52 = v149;
        goto LABEL_34;
      }
      v56 = *((_QWORD *)v19 + 5);
      *(_QWORD *)&v159 = *((_QWORD *)v19 + 4);
      *((_QWORD *)&v159 + 1) = v56;
      *(_QWORD *)&v158[0] = 95;
      *((_QWORD *)&v158[0] + 1) = 0xE100000000000000;
      v57 = StringProtocol.components<A>(separatedBy:)(v158, &type metadata for String, &type metadata for String, v22, v22);
      if (!*(_QWORD *)(v57 + 16))
        goto LABEL_124;
      v58 = (_QWORD *)v57;
      if ((swift_isUniquelyReferenced_nonNull_native(v57) & 1) != 0)
      {
        v59 = v58[2];
        if (!v59)
          goto LABEL_125;
      }
      else
      {
        v58 = specialized _ArrayBuffer._consumeAndCreateNew()(v58);
        v59 = v58[2];
        if (!v59)
          goto LABEL_125;
      }
      v60 = v59 - 1;
      v61 = v58[2 * v60 + 5];
      v58[2] = v60;
      swift_bridgeObjectRelease(v61);
      v62 = v58[2];
      if (!v62)
      {
        swift_bridgeObjectRelease(v58);
        v65 = 0;
        v51 = v145;
        goto LABEL_102;
      }
      swift_bridgeObjectRetain(v58);
      v144 = 0;
      v153 = 0;
      v152 = 0;
      v11 = (unint64_t)(v58 + 5);
      v63 = 0.0;
      v64 = 0.0;
      do
      {
        v69 = *(_QWORD *)(v11 - 8);
        v70 = *(_QWORD *)v11;
        if (v69)
          v71 = 0;
        else
          v71 = v70 == 0xE000000000000000;
        if (v71)
          goto LABEL_57;
        if ((_stringCompareWithSmolCheck(_:_:expecting:)(*(_QWORD *)(v11 - 8), *(_QWORD *)v11, 0, 0xE000000000000000, 0) & 1) != 0)goto LABEL_57;
        swift_bridgeObjectRetain(v70);
        v72 = specialized FixedWidthInteger.init(_:)(v69, v70);
        if ((v73 & 1) != 0)
          goto LABEL_57;
        if (v72 < 0)
          goto LABEL_57;
        v74 = *(_QWORD *)(v1 + v148);
        if (v72 >= *(_QWORD *)(v74 + 16))
          goto LABEL_57;
        v75 = v151;
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v74 + v147 + v72 * v154, (uint64_t)v151);
        v77 = *v75;
        v76 = v75[1];
        v22 = *(int *)(v156 + 36);
        v78 = *(void **)((char *)v75 + v22);
        if (!v78)
          goto LABEL_48;
        v66 = v153;
        if (v144 >= 1)
          goto LABEL_49;
        v79 = one-time initialization token for defaults;
        v141 = v78;
        swift_unknownObjectRetain(v78);
        if (v79 != -1)
          swift_once(&one-time initialization token for defaults, one-time initialization function for defaults);
        v80 = (void *)static MOAngelDefaultsManager.defaults;
        if (!static MOAngelDefaultsManager.defaults)
        {
          v159 = 0u;
          v160 = 0u;
LABEL_46:
          outlined destroy of Any?((uint64_t)&v159);
          goto LABEL_47;
        }
        v81 = String._bridgeToObjectiveC()();
        v82 = objc_msgSend(v80, "objectForKey:", v81);

        if (v82)
        {
          _bridgeAnyObjectToAny(_:)(v158, v82);
          swift_unknownObjectRelease(v82);
        }
        else
        {
          memset(v158, 0, sizeof(v158));
        }
        v1 = v146;
        outlined init with take of Any?((uint64_t)v158, (uint64_t)&v159);
        if (!*((_QWORD *)&v160 + 1))
          goto LABEL_46;
        if ((swift_dynamicCast(v158, &v159, v139, &type metadata for Bool, 6) & 1) == 0 || (v158[0] & 1) == 0)
          goto LABEL_47;
        v83 = objc_msgSend(v141, "_poiCategory");
        if (v83)
        {
          v84 = v83;
          v135 = static String._unconditionallyBridgeFromObjectiveC(_:)(v137);
          v136 = v84;
          v85 = v84;
          v87 = v86;
          v89 = static String._unconditionallyBridgeFromObjectiveC(_:)(v85);
          if (v135 == v89 && v87 == v88)
          {

            swift_bridgeObjectRelease_n(v87, 2);
LABEL_47:
            swift_unknownObjectRelease(v141);
LABEL_48:
            v66 = v153;
LABEL_49:
            swift_unknownObjectRelease(v66);
            goto LABEL_50;
          }
          v134 = v88;
          LODWORD(v135) = _stringCompareWithSmolCheck(_:_:expecting:)(v135, v87, v89, v88, 0);

          swift_bridgeObjectRelease(v87);
          swift_bridgeObjectRelease(v134);
          if ((v135 & 1) != 0)
            goto LABEL_47;
        }
        v90 = (void *)objc_opt_self(MKIconManager);
        v136 = objc_msgSend(v141, "_styleAttributes");
        v134 = (id)objc_opt_self(UIScreen);
        v91 = objc_msgSend(v134, "mainScreen");
        objc_msgSend(v91, "scale");
        v27 = v92;

        v93 = v136;
        v135 = (uint64_t)objc_msgSend(v90, "newFillColorForStyleAttributes:forScale:", v136, v27);

        v94 = v90;
        if (v135)
        {
          v136 = v94;
          v95 = objc_msgSend(v141, "_styleAttributes");
          v96 = objc_msgSend(v134, "mainScreen");
          objc_msgSend(v96, "scale");
          v27 = v97;

          v98 = objc_msgSend(v136, "imageForStyle:size:forScale:format:", v95, 3, 0, v27);
          if (v98)
          {

            v99 = *v151;
            v100 = *((_QWORD *)v151 + 1);
            v136 = (id)*((_QWORD *)v19 + 2);
            v101 = *((_QWORD *)v19 + 5);
            v144 = *((_QWORD *)v19 + 4);
            v102 = (int *)v156;
            v103 = v138;
            v135 = (uint64_t)v138 + *(int *)(v156 + 32);
            swift_unknownObjectRetain(v141);
            v104 = swift_bridgeObjectRetain(v101);
            UUID.init()(v104);
            *(double *)v103 = v99;
            v103[1] = v100;
            v103[2] = v136;
            v105 = v144;
            v103[3] = 1;
            v103[4] = v105;
            v103[5] = v101;
            *(_QWORD *)((char *)v103 + v102[9]) = v141;
            *(_QWORD *)((char *)v103 + v102[10]) = 0;
            v106 = (_QWORD *)((char *)v103 + v102[11]);
            *v106 = 0;
            v106[1] = 0xE000000000000000;
            *((_BYTE *)v103 + v102[12]) = 0;
            *((_BYTE *)v103 + v102[13]) = 1;
            *(_QWORD *)((char *)v103 + v102[14]) = 0;
            if ((swift_isUniquelyReferenced_nonNull_native(v24) & 1) == 0)
              v24 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v24 + 2) + 1, 1, (unint64_t)v24);
            v27 = 7.0;
            v108 = *((_QWORD *)v24 + 2);
            v107 = *((_QWORD *)v24 + 3);
            v1 = v146;
            if (v108 >= v107 >> 1)
              v24 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v107 > 1, v108 + 1, 1, (unint64_t)v24);
            *((_QWORD *)v24 + 2) = v108 + 1;
            outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v138, (uint64_t)&v24[v147 + v108 * v154]);
            swift_unknownObjectRelease(v141);
            outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v151);
            if (v64 != 0.0)
              v64 = v64 + (v64 - v77) / 7.0;
            if (v63 != 0.0)
              v63 = v63 + (v63 - v76) / 7.0;
            v144 = 1;
            goto LABEL_57;
          }
        }
        swift_unknownObjectRelease(v141);
        swift_unknownObjectRelease(v153);
        v1 = v146;
LABEL_50:
        if (v64 == 0.0)
          v64 = v77;
        else
          v64 = (v64 + v77) * 0.5;
        if (v63 == 0.0)
          v63 = v76;
        else
          v63 = (v63 + v76) * 0.5;
        v67 = v151;
        v153 = *(_QWORD *)((char *)v151 + v22);
        swift_unknownObjectRetain(v153);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v67);
        if (__OFADD__(v152++, 1))
          goto LABEL_122;
LABEL_57:
        v11 += 16;
        --v62;
      }
      while (v62);
      swift_bridgeObjectRelease(v58);
      v109 = v152;
      if (v152 <= 0)
      {
        swift_bridgeObjectRelease(v58);
        v51 = v145;
        v11 = v142;
      }
      else
      {
        v27 = *((double *)v19 + 2);
        v110 = *((_QWORD *)v19 + 5);
        v144 = *((_QWORD *)v19 + 4);
        v111 = v58[2];
        v112 = v153;
        swift_unknownObjectRetain(v153);
        swift_bridgeObjectRetain(v110);
        v113 = swift_bridgeObjectRelease(v58);
        v114 = v109 != v111;
        v115 = (int *)v156;
        v116 = v143;
        UUID.init()(v113);
        *(double *)v116 = v64;
        *(double *)(v116 + 8) = v63;
        *(double *)(v116 + 16) = v27;
        v117 = v144;
        *(_QWORD *)(v116 + 24) = v109;
        *(_QWORD *)(v116 + 32) = v117;
        *(_QWORD *)(v116 + 40) = v110;
        *(_QWORD *)(v116 + v115[9]) = v112;
        *(_QWORD *)(v116 + v115[10]) = 0;
        v118 = (_QWORD *)(v116 + v115[11]);
        *v118 = 0;
        v118[1] = 0xE000000000000000;
        *(_BYTE *)(v116 + v115[12]) = 0;
        *(_BYTE *)(v116 + v115[13]) = v114;
        *(_QWORD *)(v116 + v115[14]) = 0;
        if ((swift_isUniquelyReferenced_nonNull_native(v24) & 1) == 0)
          v24 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v24 + 2) + 1, 1, (unint64_t)v24);
        v120 = *((_QWORD *)v24 + 2);
        v119 = *((_QWORD *)v24 + 3);
        v51 = v145;
        v11 = v142;
        if (v120 >= v119 >> 1)
          v24 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v119 > 1, v120 + 1, 1, (unint64_t)v24);
        *((_QWORD *)v24 + 2) = v120 + 1;
        outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v143, (uint64_t)&v24[v147 + v120 * v154]);
      }
      v65 = v153;
LABEL_102:
      v121 = *((_QWORD *)v19 + 4);
      v122 = (void *)*((_QWORD *)v19 + 5);
      swift_bridgeObjectRetain(v122);
      v123._countAndFlagsBits = v121;
      v123._object = v122;
      String.append(_:)(v123);
      swift_bridgeObjectRelease(v122);
      swift_unknownObjectRelease(v65);
      v22 = v150;
      v52 = v149;
      v1 = v146;
LABEL_34:
      ++v16;
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v19);
      if (v16 == v22)
      {
        swift_release(v11);
        goto LABEL_108;
      }
    }
  }
  swift_release(v159);
  v24 = (char *)_swiftEmptyArrayStorage;
LABEL_108:
  p_ivar_lyt = &MOAngelSignposter.ivar_lyt;
LABEL_109:
  v124 = *(_QWORD *)((char *)p_ivar_lyt[487] + v1);
  v125 = *(_QWORD *)(v124 + 16);
  if (v125)
  {
    v126 = (*(unsigned __int8 *)(v157 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v157 + 80);
    v127 = v124 + v126;
    v128 = *(_QWORD *)(v157 + 72);
    swift_bridgeObjectRetain(v124);
    do
    {
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v127, (uint64_t)v6);
      v159 = v162;
      v129 = *((_QWORD *)v6 + 5);
      *(_QWORD *)&v158[0] = *((_QWORD *)v6 + 4);
      *((_QWORD *)&v158[0] + 1) = v129;
      v130 = lazy protocol witness table accessor for type String and conformance String();
      if ((StringProtocol.contains<A>(_:)(v158, &type metadata for String, &type metadata for String, v130, v130) & 1) == 0)
      {
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v6, v155);
        if ((swift_isUniquelyReferenced_nonNull_native(v24) & 1) == 0)
          v24 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v24 + 2) + 1, 1, (unint64_t)v24);
        v132 = *((_QWORD *)v24 + 2);
        v131 = *((_QWORD *)v24 + 3);
        if (v132 >= v131 >> 1)
          v24 = (char *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v131 > 1, v132 + 1, 1, (unint64_t)v24);
        *((_QWORD *)v24 + 2) = v132 + 1;
        outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v155, (uint64_t)&v24[v126 + v132 * v128]);
      }
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v6);
      v127 += v128;
      --v125;
    }
    while (v125);
    swift_bridgeObjectRelease(v124);
  }
  swift_bridgeObjectRelease(*((_QWORD *)&v162 + 1));
  return v24;
}

uint64_t specialized FixedWidthInteger.init(_:)(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(result, a2);
      v7 = (uint64_t)specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease(a2);
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

id MOSuggestionAssetMapsClusterer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

void MOSuggestionAssetMapsClusterer.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("MomentsUIServiceCore.MOSuggestionAssetMapsClusterer", 51, "init()", 6, 0);
  __break(1u);
}

id MOSuggestionAssetMapsClusterer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MOSuggestionAssetMapsClusterer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

char *MOSuggestionAssetMapsClusterer.__allocating_init(coordinates:separationThreshold:)(uint64_t a1, double a2)
{
  uint64_t v2;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  char *v10;
  int64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;

  v5 = (int *)type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v6 = *((_QWORD *)v5 - 1);
  __chkstk_darwin(v5);
  v8 = (char **)((char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = (char *)(*(uint64_t (**)(_QWORD *, double))(v2 + 240))(_swiftEmptyArrayStorage, 0.5);
  v10 = v9;
  *(double *)&v9[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_separationThreshold] = a2;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
  {
    v34 = _swiftEmptyArrayStorage;
    v29 = v9;
    v12 = v9;
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v11, 0);
    v13 = 0;
    v14 = v34;
    v30 = a1;
    v15 = (uint64_t *)(a1 + 40);
    do
    {
      v16 = *(v15 - 1);
      v17 = *v15;
      v31 = v13;
      v32 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      v33 = v18;
      v19._countAndFlagsBits = 95;
      v19._object = (void *)0xE100000000000000;
      String.append(_:)(v19);
      v20 = v32;
      v21 = v33;
      UUID.init()(v22);
      *v8 = v16;
      v8[1] = v17;
      v8[2] = 0;
      v8[3] = 1;
      v8[4] = v20;
      v8[5] = v21;
      *(_QWORD *)((char *)v8 + v5[9]) = 0;
      *(_QWORD *)((char *)v8 + v5[10]) = 0;
      v23 = (_QWORD *)((char *)v8 + v5[11]);
      *v23 = 0;
      v23[1] = 0xE000000000000000;
      *((_BYTE *)v8 + v5[12]) = 0;
      *((_BYTE *)v8 + v5[13]) = 0;
      *(_QWORD *)((char *)v8 + v5[14]) = 0;
      v34 = v14;
      v25 = v14[2];
      v24 = v14[3];
      if (v25 >= v24 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v24 > 1, v25 + 1, 1);
        v14 = v34;
      }
      ++v13;
      v14[2] = v25 + 1;
      outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v8, (uint64_t)v14+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v25);
      v15 += 2;
    }
    while (v11 != v13);
    swift_bridgeObjectRelease(v30);
    v10 = v29;
  }
  else
  {
    v26 = v9;
    swift_bridgeObjectRelease(a1);
    v14 = _swiftEmptyArrayStorage;
  }
  v27 = *(_QWORD *)&v10[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_inputClusters];
  *(_QWORD *)&v10[OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_inputClusters] = v14;

  swift_bridgeObjectRelease(v27);
  return v10;
}

uint64_t static MOSuggestionAssetMapsClusterer.clusteredPins(locations:targetRegion:numBuckets:)(unint64_t a1, NSObject *a2, double a3, long double a4, double a5, double a6)
{
  uint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __n128 v20;
  long double v21;
  double v23;
  double v24;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  char v29;
  NSObject *v30;
  void (*v31)(_QWORD *);
  __n128 v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v40;
  unint64_t v41;
  Class v42;
  _BOOL8 v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  Class v48;
  BOOL v49;
  objc_class *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  int64_t v56;
  unint64_t v57;
  unint64_t v58;
  int64_t v59;
  unint64_t isa;
  int64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __n128 v66;
  uint64_t v67;
  os_log_type_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __n128 v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  os_log_type_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  __n128 v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  os_log_type_t v107;
  __n128 v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t result;
  NSObject *v114;
  NSObject *v115;
  int64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  int64_t v120;
  unint64_t v121;
  uint64_t v122;
  NSObject *v123;
  unint64_t v124;
  uint64_t v125;
  _QWORD v126[4];
  uint64_t v127;
  uint64_t v128;
  char v129[24];
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;

  v11 = a1;
  v12 = a1 >> 62;
  if (a1 >> 62)
    goto LABEL_150;
  if (*(uint64_t *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8)) < 2)
  {
LABEL_154:
    swift_bridgeObjectRetain(v11);
    return v11;
  }
LABEL_3:
  if ((~*(_QWORD *)&a4 & 0x7FF0000000000000) != 0 && a4 < 0.0)
    a4 = remainder(a4, 360.0) + 360.0;
  v13 = a6 * 0.5;
  a6 = a4 - a6 * 0.5;
  v14 = a5 * 0.5 + a3;
  a5 = a3 - a5 * 0.5;
  v15 = vabdd_f64(a5, v14) / (double)(uint64_t)a2;
  if (v15 <= 0.0)
    goto LABEL_154;
  v16 = vabdd_f64(a6, a4 + v13) / (double)(uint64_t)a2;
  if (v16 <= 0.0)
    goto LABEL_154;
  v133 = &_swiftEmptyDictionarySingleton;
  if (!v12)
  {
    v17 = *(_QWORD *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain(v11);
    if (v17)
      goto LABEL_10;
LABEL_55:
    swift_bridgeObjectRelease(v11);
    v51 = &_swiftEmptyDictionarySingleton;
LABEL_56:
    v132 = (uint64_t)_swiftEmptyArrayStorage;
    v115 = v51 + 8;
    v53 = 1 << LOBYTE(v51[4].isa);
    v54 = -1;
    if (v53 < 64)
      v54 = ~(-1 << v53);
    v55 = v54 & (uint64_t)v51[8].isa;
    v116 = (unint64_t)(v53 + 63) >> 6;
    swift_bridgeObjectRetain(v51);
    v56 = 0;
    v114 = v51;
    while (1)
    {
      if (v55)
      {
        v57 = __clz(__rbit64(v55));
        v55 &= v55 - 1;
        v58 = v57 | (v56 << 6);
      }
      else
      {
        v59 = v56 + 1;
        if (__OFADD__(v56, 1))
          goto LABEL_145;
        if (v59 >= v116)
        {
LABEL_135:
          swift_release(v51);
          v11 = v132;
          swift_bridgeObjectRelease(v133);
          return v11;
        }
        isa = (unint64_t)v115[v59].isa;
        ++v56;
        if (!isa)
        {
          v56 = v59 + 1;
          if (v59 + 1 >= v116)
            goto LABEL_135;
          isa = (unint64_t)v115[v56].isa;
          if (!isa)
          {
            v56 = v59 + 2;
            if (v59 + 2 >= v116)
              goto LABEL_135;
            isa = (unint64_t)v115[v56].isa;
            if (!isa)
            {
              v61 = v59 + 3;
              if (v61 >= v116)
                goto LABEL_135;
              isa = (unint64_t)v115[v61].isa;
              if (!isa)
              {
                while (1)
                {
                  v56 = v61 + 1;
                  if (__OFADD__(v61, 1))
                    break;
                  if (v56 >= v116)
                    goto LABEL_135;
                  isa = (unint64_t)v115[v56].isa;
                  ++v61;
                  if (isa)
                    goto LABEL_75;
                }
                __break(1u);
LABEL_157:
                __break(1u);
                goto LABEL_158;
              }
              v56 = v61;
            }
          }
        }
LABEL_75:
        v55 = (isa - 1) & isa;
        v58 = __clz(__rbit64(isa)) + (v56 << 6);
      }
      v62 = *((_QWORD *)v51[7].isa + v58);
      v63 = one-time initialization token for assets;
      swift_bridgeObjectRetain(v62);
      if (v63 != -1)
        swift_once(&one-time initialization token for assets, one-time initialization function for assets);
      v64 = type metadata accessor for Logger(0);
      v65 = __swift_project_value_buffer(v64, (uint64_t)static MOAngelLogger.assets);
      v67 = swift_bridgeObjectRetain_n(v62, 2, v66);
      v123 = v65;
      a2 = Logger.logObject.getter(v67);
      v68 = static os_log_type_t.debug.getter();
      v69 = (unint64_t)v62 >> 62;
      if (os_log_type_enabled(a2, v68))
      {
        v12 = swift_slowAlloc(12, -1);
        *(_DWORD *)v12 = 134217984;
        if (v69)
        {
          if (v62 < 0)
            v103 = v62;
          else
            v103 = v62 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v62);
          v70 = _CocoaArrayWrapper.endIndex.getter(v103);
          swift_bridgeObjectRelease(v62);
        }
        else
        {
          v70 = *(_QWORD *)((char *)&dword_10 + (v62 & 0xFFFFFFFFFFFFF8));
        }
        swift_bridgeObjectRelease(v62);
        *(_QWORD *)(v12 + 4) = v70;
        swift_bridgeObjectRelease(v62);
        _os_log_impl(&dword_0, a2, v68, "[ClusterPins] Group Count %ld", (uint8_t *)v12, 0xCu);
        swift_slowDealloc(v12, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v62, 2);
      }
      if (v69)
      {
        if (v62 >= 0)
          a2 = (v62 & 0xFFFFFFFFFFFFFF8);
        else
          a2 = v62;
        swift_bridgeObjectRetain(v62);
        v11 = _CocoaArrayWrapper.endIndex.getter(a2);
        swift_bridgeObjectRelease(v62);
        if (v11 <= 1)
        {
          swift_bridgeObjectRetain(v62);
          v11 = _CocoaArrayWrapper.endIndex.getter(a2);
          swift_bridgeObjectRelease(v62);
LABEL_123:
          if (!v11)
          {
            swift_bridgeObjectRelease(v62);
            continue;
          }
          if ((v62 & 0xC000000000000001) != 0)
          {
            v104 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v62);
            goto LABEL_127;
          }
          if (*(_QWORD *)((char *)&dword_10 + (v62 & 0xFFFFFFFFFFFFFF8)))
          {
            v104 = *(_QWORD *)(v62 + 32);
            swift_retain(v104);
LABEL_127:
            v105 = swift_bridgeObjectRelease(v62);
            v106 = Logger.logObject.getter(v105);
            v107 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v106, v107))
            {
              v11 = swift_slowAlloc(2, -1);
              *(_WORD *)v11 = 0;
              _os_log_impl(&dword_0, v106, v107, "[ClusterPins] Single location pass through", (uint8_t *)v11, 2u);
              swift_slowDealloc(v11, -1, -1);
            }

            v108 = swift_retain(v104);
            a2 = &v132;
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v108);
            v12 = *(_QWORD *)((char *)&dword_10 + (v132 & 0xFFFFFFFFFFFFFF8));
            v109 = *(_QWORD *)((char *)&dword_18 + (v132 & 0xFFFFFFFFFFFFFF8));
            if (v12 >= v109 >> 1)
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v109 > 1, v12 + 1, 1);
            v110 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v12, v104);
            specialized Array._endMutation()(v110);
            swift_release(v104);
            continue;
          }
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          if (v11 < 0)
            v111 = v11;
          else
            v111 = v11 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v11);
          v112 = _CocoaArrayWrapper.endIndex.getter(v111);
          swift_bridgeObjectRelease(v11);
          if (v112 < 2)
            goto LABEL_154;
          goto LABEL_3;
        }
        v121 = v55;
        v130 = 0;
        v131 = 0;
        swift_bridgeObjectRetain(v62);
        v102 = _CocoaArrayWrapper.endIndex.getter(a2);
        if (!v102)
        {
          swift_bridgeObjectRelease_n(v62, 2);
          swift_unknownObjectRelease(0);
          continue;
        }
        v71 = v102;
        if (v102 < 1)
          goto LABEL_146;
        v117 = v62 & 0xFFFFFFFFFFFFFF8;
        v118 = v11;
        v120 = v56;
      }
      else
      {
        v11 = *(_QWORD *)((char *)&dword_10 + (v62 & 0xFFFFFFFFFFFFFF8));
        if ((unint64_t)v11 <= 1)
          goto LABEL_123;
        v117 = v62 & 0xFFFFFFFFFFFFFF8;
        v120 = v56;
        v121 = v55;
        v130 = 0;
        v131 = 0;
        swift_bridgeObjectRetain(v62);
        v118 = v11;
        v71 = v11;
      }
      v72 = v62 & 0xC000000000000001;
      swift_beginAccess(&v130, v126, 1, 0);
      swift_beginAccess(&v131, v129, 1, 0);
      v73 = 0;
      v74 = 0;
      v125 = 0;
      a5 = 0.0;
      a6 = 0.0;
      do
      {
        if (v72)
        {
          v75 = specialized _ArrayBuffer._getElementSlowPath(_:)(v74, v62);
        }
        else
        {
          v75 = *(_QWORD *)(v62 + 8 * v74 + 32);
          v76 = swift_retain(v75);
        }
        a4 = (*(double (**)(__n128))(*(_QWORD *)v75 + 240))(v76);
        a3 = (*(double (**)(void))(*(_QWORD *)v75 + 264))();
        v12 = *(_QWORD *)(*(_QWORD *)v75 + 288);
        v77 = ((uint64_t (*)(void))v12)();
        if (v77)
        {
          v78 = v77;
          v79 = (void *)((uint64_t (*)(void))v12)();
          if (v79
            && (v11 = (uint64_t)v79,
                v80 = objc_msgSend(v79, "_poiCategory"),
                swift_unknownObjectRelease(v11),
                v80))
          {

            v81 = v130;
            v130 = v78;
            v77 = swift_unknownObjectRelease(v81);
            v125 = v78;
          }
          else
          {
            v77 = swift_unknownObjectRelease(v78);
          }
        }
        v82 = ((uint64_t (*)(uint64_t))v12)(v77);
        swift_release(v75);
        swift_unknownObjectRelease(v73);
        a2 = (v131 + 1);
        if (__OFADD__(v131, 1))
        {
          __break(1u);
          goto LABEL_137;
        }
        ++v74;
        a6 = a6 + a4;
        a5 = a5 + a3;
        ++v131;
        v73 = v82;
      }
      while (v71 != v74);
      v83 = swift_bridgeObjectRelease(v62);
      v56 = v120;
      v84 = v125;
      if (v125)
      {
        v55 = v121;
        if ((uint64_t)a2 > 0)
          goto LABEL_101;
LABEL_110:
        v11 = v84;
        swift_bridgeObjectRelease(v62);
        swift_unknownObjectRelease(v82);
        v51 = v114;
        swift_unknownObjectRelease(v11);
        continue;
      }
      v55 = v121;
      if (v82)
      {
        v85 = v130;
        v130 = v82;
        swift_unknownObjectRetain(v82);
        v83 = swift_unknownObjectRelease(v85);
        v84 = v82;
      }
      if ((uint64_t)a2 <= 0)
        goto LABEL_110;
LABEL_101:
      a2 = v123;
      v12 = Logger.logObject.getter(v83);
      v86 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled((os_log_t)v12, v86))
      {
        v87 = swift_slowAlloc(22, -1);
        v88 = swift_slowAlloc(32, -1);
        *(_DWORD *)v87 = 134218242;
        v127 = v131;
        v128 = v88;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v87 + 4, v87 + 12);
        *(_WORD *)(v87 + 12) = 2080;
        v127 = v130;
        v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GEOMapItem?);
        v90 = Optional.debugDescription.getter(v89);
        a2 = v91;
        v127 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v90, v91, &v128);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v87 + 14, v87 + 22);
        swift_bridgeObjectRelease(a2);
        _os_log_impl(&dword_0, (os_log_t)v12, v86, "[ClusterPins] Conslidating %ld locations into a single pin, mapItem:%s", (uint8_t *)v87, 0x16u);
        swift_arrayDestroy(v88, 1, (char *)&type metadata for Any + 8);
        v92 = v88;
        v56 = v120;
        swift_slowDealloc(v92, -1, -1);
        swift_slowDealloc(v87, -1, -1);
      }

      v11 = v130;
      v93 = v131;
      if (v72)
      {
        swift_unknownObjectRetain(v130);
        v94 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v62);
      }
      else
      {
        if (!*(_QWORD *)(v117 + 16))
          goto LABEL_148;
        v94 = *(_QWORD *)(v62 + 32);
        swift_unknownObjectRetain(v130);
        swift_retain(v94);
      }
      v95 = swift_bridgeObjectRelease(v62);
      a4 = a6 / (double)v93;
      a3 = a5 / (double)v118;
      a5 = (*(double (**)(uint64_t))(*(_QWORD *)v94 + 360))(v95);
      swift_release(v94);
      v96 = type metadata accessor for MOMapLocation(0);
      swift_allocObject(v96, *(unsigned int *)(v96 + 48), *(unsigned __int16 *)(v96 + 52));
      v12 = v11;
      v97 = MOMapLocation.init(latitude:longitude:title:clusterCount:geoMapItem:confidenceLevel:isWork:enclosingArea:horizontalUncertainty:isScaledDownPOI:poiCateogory:)(0, 0xE000000000000000, v93, 0, v11, 0, 0, 0, a4, a3, a5, 0.0, 0, 0, 0xE000000000000000);
      a2 = &v132;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v98);
      v100 = *(_QWORD *)((char *)&dword_10 + (v132 & 0xFFFFFFFFFFFFFF8));
      v99 = *(_QWORD *)((char *)&dword_18 + (v132 & 0xFFFFFFFFFFFFFF8));
      if (v100 >= v99 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v99 > 1, v100 + 1, 1);
      v101 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v100, v97);
      specialized Array._endMutation()(v101);
      swift_unknownObjectRelease(v82);
      v51 = v114;
      swift_unknownObjectRelease(v11);
    }
  }
  if (v11 < 0)
    v52 = v11;
  else
    v52 = v11 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v11);
  v17 = _CocoaArrayWrapper.endIndex.getter(v52);
  if (!v17)
    goto LABEL_55;
LABEL_10:
  v122 = (uint64_t)&a2->isa + 1;
  if (__OFADD__(a2, 1))
    goto LABEL_157;
  if (v17 >= 1)
  {
    v12 = 0;
    v124 = v11 & 0xC000000000000001;
    v119 = v17;
    do
    {
      if (v124)
      {
        v19 = specialized _ArrayBuffer._getElementSlowPath(_:)(v12, v11);
      }
      else
      {
        v19 = *(_QWORD *)(v11 + 8 * v12 + 32);
        v20 = swift_retain(v19);
      }
      a2 = v19;
      a4 = (*(double (**)(__n128))(*(_QWORD *)v19 + 240))(v20);
      v21 = (*(double (**)(void))(*(_QWORD *)v19 + 264))();
      if (v21 < 0.0 && (*(_QWORD *)&v21 & 0x7FF0000000000000) != 0x7FF0000000000000)
      {
        a3 = 360.0;
        v21 = remainder(v21, 360.0) + 360.0;
      }
      v23 = (a4 - a5) / v15;
      if (v23 <= -9.22337204e18)
      {
LABEL_137:
        __break(1u);
LABEL_138:
        __break(1u);
LABEL_139:
        __break(1u);
LABEL_140:
        __break(1u);
LABEL_141:
        __break(1u);
LABEL_142:
        __break(1u);
LABEL_143:
        __break(1u);
LABEL_144:
        __break(1u);
LABEL_145:
        __break(1u);
LABEL_146:
        __break(1u);
        goto LABEL_147;
      }
      if (v23 >= 9.22337204e18)
        goto LABEL_138;
      v24 = (v21 - a6) / v16;
      if ((*(_QWORD *)&v23 & 0x7FF0000000000000) == 0x7FF0000000000000
        || (*(_QWORD *)&v24 & 0x7FF0000000000000) == 0x7FF0000000000000)
      {
        goto LABEL_139;
      }
      if (v24 <= -9.22337204e18)
        goto LABEL_140;
      if (v24 >= 9.22337204e18)
        goto LABEL_141;
      v26 = (uint64_t)v24 * v122;
      if ((unsigned __int128)((uint64_t)v24 * (__int128)v122) >> 64 != v26 >> 63)
        goto LABEL_142;
      v27 = (uint64_t)v23 + v26;
      if (__OFADD__((uint64_t)v23, v26))
        goto LABEL_143;
      v28 = v133;
      if (v133[2].isa && (specialized __RawDictionaryStorage.find<A>(_:)(v27), (v29 & 1) != 0))
      {
        a2 = &v133;
        v31 = specialized Dictionary.subscript.modify(v126, v27);
        if (v30->isa)
        {
          a2 = v30;
          v32 = swift_retain(v19);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v32);
          v34 = *(_QWORD *)((char *)&dword_10 + ((uint64_t)a2->isa & 0xFFFFFFFFFFFFFF8));
          v33 = *(_QWORD *)((char *)&dword_18 + ((uint64_t)a2->isa & 0xFFFFFFFFFFFFFF8));
          if (v34 >= v33 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1);
          v35 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v34, v19);
          specialized Array._endMutation()(v35);
          ((void (*)(_QWORD *, _QWORD))v31)(v126, 0);
          swift_release(v19);
        }
        else
        {
          ((void (*)(_QWORD *, _QWORD))v31)(v126, 0);
          swift_release(v19);
        }
      }
      else
      {
        v36 = v11;
        v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
        v38 = swift_allocObject(v37, 40, 7);
        *(_OWORD *)(v38 + 16) = xmmword_195C0;
        *(_QWORD *)(v38 + 32) = v19;
        v126[0] = v38;
        ((void (*)(void))specialized Array._endMutation())();
        v11 = v126[0];
        swift_retain(v19);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v28);
        v126[0] = v28;
        a2 = v28;
        v41 = specialized __RawDictionaryStorage.find<A>(_:)(v27);
        v42 = v28[2].isa;
        v43 = (v40 & 1) == 0;
        v44 = (uint64_t)v42 + v43;
        if (__OFADD__(v42, v43))
          goto LABEL_144;
        v45 = v40;
        if ((uint64_t)v28[3].isa >= v44)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            specialized _NativeDictionary.copy()();
        }
        else
        {
          specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v44, isUniquelyReferenced_nonNull_native);
          v46 = specialized __RawDictionaryStorage.find<A>(_:)(v27);
          if ((v45 & 1) != (v47 & 1))
            goto LABEL_159;
          v41 = v46;
        }
        a2 = v126[0];
        if ((v45 & 1) != 0)
        {
          v18 = *(_QWORD *)(v126[0] + 56);
          swift_bridgeObjectRelease(*(_QWORD *)(v18 + 8 * v41));
          *(_QWORD *)(v18 + 8 * v41) = v11;
        }
        else
        {
          *(_QWORD *)(v126[0] + 8 * (v41 >> 6) + 64) |= 1 << v41;
          *((_QWORD *)a2[6].isa + v41) = v27;
          *((_QWORD *)a2[7].isa + v41) = v11;
          v48 = a2[2].isa;
          v49 = __OFADD__(v48, 1);
          v50 = (Class)((char *)v48 + 1);
          if (v49)
            goto LABEL_149;
          a2[2].isa = v50;
        }
        v133 = a2;
        swift_release(v19);
        swift_bridgeObjectRelease(0x8000000000000000);
        v11 = v36;
        v17 = v119;
      }
      ++v12;
    }
    while (v17 != v12);
    swift_bridgeObjectRelease(v11);
    v51 = v133;
    goto LABEL_56;
  }
LABEL_158:
  __break(1u);
LABEL_159:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Int);
  __break(1u);
  return result;
}

__C::CLLocationCoordinate2D __swiftcall CLLocationCoordinate2D.comparable()()
{
  double v0;
  Swift::Double v1;
  double v2;
  double v4;
  __C::CLLocationCoordinate2D result;

  v2 = v0;
  if (v1 < 0.0 && (*(_QWORD *)&v1 & 0x7FF0000000000000) != 0x7FF0000000000000)
    v1 = remainder(v1, 360.0) + 360.0;
  v4 = v2;
  result.longitude = v1;
  result.latitude = v4;
  return result;
}

void (*specialized Dictionary.subscript.modify(_QWORD *a1, uint64_t a2))(_QWORD *a1)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized Dictionary._Variant.subscript.modify(v4, a2);
  return Dictionary.subscript.modifyspecialized ;
}

void Dictionary.subscript.modifyspecialized (_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

char *specialized Array.init(repeating:count:)(unint64_t a1, double a2)
{
  char *result;
  double *v4;
  unint64_t v5;
  double v6;
  int64x2_t v7;
  int64x2_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a1 & 0x8000000000000000) != 0)
  {
    result = (char *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
    __break(1u);
    return result;
  }
  if (!a1)
    return (char *)&_swiftEmptyArrayStorage;
  result = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)(a1, &type metadata for Double);
  *((_QWORD *)result + 2) = a1;
  v4 = (double *)(result + 32);
  if (a1 < 4)
  {
    v5 = 0;
    v6 = a2;
LABEL_9:
    v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  v6 = a2;
  v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  v8 = (int64x2_t *)(result + 48);
  v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v5 != a1)
    goto LABEL_9;
  return result;
}

_QWORD *specialized Array.init(repeating:count:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;

  if (a2 < 0)
  {
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
    __break(1u);
  }
  else
  {
    if (a2)
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
      v5 = (_QWORD *)static Array._allocateBufferUninitialized(minimumCapacity:)(a2, v4);
      v6 = v5;
      v5[2] = a2;
      v5[4] = a1;
      if (a2 != 1)
      {
        v5[5] = a1;
        v7 = a2 - 2;
        if (v7)
        {
          v8 = v5 + 6;
          do
          {
            *v8++ = a1;
            swift_bridgeObjectRetain(a1);
            --v7;
          }
          while (v7);
        }
        swift_bridgeObjectRetain(a1);
      }
    }
    else
    {
      swift_bridgeObjectRelease(a1);
      return &_swiftEmptyArrayStorage;
    }
    return v6;
  }
  return result;
}

Swift::Bool __swiftcall MOSuggestionAssetMapsClusterer.isInLowerHalf(distanceMatrix:pair:)(Swift::OpaquePointer *distanceMatrix, Swift::tuple_Int_Int pair)
{
  Swift::Int v2;
  BOOL v3;
  Swift::Bool v4;

  v2 = *((_QWORD *)distanceMatrix->_rawValue + 2);
  v3 = (unint64_t)v2 > 1;
  if (pair._0 < 0)
    v3 = 0;
  if (pair._1 < 0)
    v3 = 0;
  if (v2 <= pair._0)
    v3 = 0;
  v4 = v2 > pair._1 && v3;
  if (pair._0 <= 0)
    v4 = 0;
  return pair._1 < pair._0 && v4;
}

Swift::Void __swiftcall MOSuggestionAssetMapsClusterer.printDendogram()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  __n128 v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _BYTE v7[24];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_results);
  swift_beginAccess(v0 + OBJC_IVAR____TtC20MomentsUIServiceCore30MOSuggestionAssetMapsClusterer_results, v7, 0, 0);
  v2 = *v1;
  swift_bridgeObjectRetain_n(v2, 2, v3);
  v4 = specialized _copyCollectionToContiguousArray<A>(_:)(v2);
  swift_bridgeObjectRelease(v2);
  v6 = v4;
  specialized MutableCollection<>.sort(by:)(&v6, specialized UnsafeMutableBufferPointer._stableSortImpl(by:));
  swift_bridgeObjectRelease(v2);
  v5 = (uint64_t)v6;
  specialized MOSuggestionAssetMapsClusterer.printClusters(_:)((uint64_t)v6);
  swift_release(v5);
}

__C::CLLocationCoordinate2D __swiftcall CLLocationCoordinate2D.normalized()()
{
  int8x16_t v0;
  uint64_t v1;
  int8x16_t v2;
  double v3;
  float64x2_t v4;
  double v5;
  double v6;
  __C::CLLocationCoordinate2D result;

  v2.i64[0] = v1;
  v3 = *(double *)v0.i64;
  v0.i64[0] = 0x4076800000000000;
  v4.f64[0] = NAN;
  v4.f64[1] = NAN;
  v5 = remainder(*(long double *)v2.i64, *(long double *)vbslq_s8((int8x16_t)vnegq_f64(v4), v0, v2).i64);
  v6 = v3;
  result.longitude = v5;
  result.latitude = v6;
  return result;
}

uint64_t static FloatingPoint.* infix(_:_:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t AssociatedConformanceWitness;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v20 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) + 8);
  v7 = *(_QWORD *)(v6 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v7, a3, &protocol requirements base descriptor for ExpressibleByIntegerLiteral, &associated type descriptor for ExpressibleByIntegerLiteral.IntegerLiteralType);
  v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v11 = (char *)&v19 - v10;
  v12 = *(_QWORD *)(a3 - 8);
  __chkstk_darwin(v9);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v7, a3, AssociatedTypeWitness, &protocol requirements base descriptor for ExpressibleByIntegerLiteral, &associated conformance descriptor for ExpressibleByIntegerLiteral.ExpressibleByIntegerLiteral.IntegerLiteralType: _ExpressibleByBuiltinIntegerLiteral);
  if ((a1 & 1) != 0)
  {
    v16 = &unk_195B0;
    v17 = 257;
  }
  else
  {
    v16 = &unk_195B8;
    v17 = 512;
  }
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)(v16, v17, AssociatedTypeWitness, AssociatedConformanceWitness);
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)(v11, a3, v7);
  dispatch thunk of static Numeric.* infix(_:_:)(v14, v20, a3, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, a3);
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Double>);
      v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7);
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 25;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[8 * v8 + 32])
          memmove(v14, a4 + 32, 8 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[Double]>);
      v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7);
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 25;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[8 * v8 + 32])
          memmove(v14, a4 + 32, 8 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  v11 = *(_QWORD *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = _swift_stdlib_malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

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
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      v14 = v11 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4])
          memmove(v14, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = _swift_stdlib_malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a1 >> 16;
  v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v13 = String.UTF16View.index(_:offsetBy:)(15, v6, a2);
    v14 = v13 + (v7 << 16);
    v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v16 = v14 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v16 = v15;
    return v16 | 4;
  }
  else
  {
    v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15, v6);
    v9 = v8 + (v7 << 16);
    v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v11 = v9 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v11 = v10;
    return v11 | 8;
  }
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return _swiftEmptyArrayStorage;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  v4 = *(_QWORD *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) - 8);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 32) & ~v6;
  v8 = (_QWORD *)swift_allocObject(v3, v7 + v5 * v1, v6 | 7);
  result = (_QWORD *)_swift_stdlib_malloc_size(v8);
  if (v5)
  {
    if ((_QWORD *)((char *)result - v7) != (_QWORD *)0x8000000000000000 || v5 != -1)
    {
      v8[2] = v1;
      v8[3] = 2 * (((uint64_t)result - v7) / v5);
      v11 = specialized Sequence._copySequenceContents(initializing:)(&v13, (uint64_t)v8 + v7, v1, a1);
      v12 = v13;
      swift_bridgeObjectRetain(a1);
      outlined consume of Set<MOSuggestionAssetMapsClusterer.Cluster>.Iterator._Variant(v12);
      if (v11 == v1)
        return v8;
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  _QWORD v24[9];

  v7 = *v3;
  Hasher.init(_seed:)(v24, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = v12[1];
    v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v19 = (_QWORD *)(v11 + 16 * v10);
      v20 = v19[1];
      v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0) & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t specialized Set._Variant.insert(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD *v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD v26[9];

  v5 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = v2;
  v9 = *v2;
  Hasher.init(_seed:)(v26, *(_QWORD *)(*v2 + 40));
  v10 = a2 + *(int *)(v5 + 32);
  v11 = type metadata accessor for UUID(0);
  v12 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  swift_bridgeObjectRetain(v9);
  dispatch thunk of Hashable.hash(into:)(v26, v11, v12);
  v13 = Hasher._finalize()();
  v14 = -1 << *(_BYTE *)(v9 + 32);
  v15 = v13 & ~v14;
  if (((*(_QWORD *)(v9 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
  {
    v23 = a2;
    v24 = a1;
    v16 = ~v14;
    v17 = *(_QWORD *)(v6 + 72);
    while (1)
    {
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(_QWORD *)(v9 + 48) + v17 * v15, (uint64_t)v8);
      v18 = static UUID.== infix(_:_:)(&v8[*(int *)(v5 + 32)], v10);
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v8);
      if ((v18 & 1) != 0)
        break;
      v15 = (v15 + 1) & v16;
      if (((*(_QWORD *)(v9 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      {
        swift_bridgeObjectRelease(v9);
        a2 = v23;
        a1 = v24;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease(v9);
    outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v23);
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(_QWORD *)(*v25 + 48) + v17 * v15, v24);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease(v9);
LABEL_7:
    v19 = v25;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v25);
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a2, (uint64_t)v8);
    v26[0] = *v19;
    *v19 = 0x8000000000000000;
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    v21 = *v19;
    *v19 = v26[0];
    swift_bridgeObjectRelease(v21);
    outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(a2, a1);
    return 1;
  }
}

void specialized _NativeSet.resize(capacity:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v32 = v2;
    v33 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = v5 + 56;
    swift_retain(v3);
    v12 = 0;
    while (1)
    {
      if (v9)
      {
        v15 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v16 = v15 | (v12 << 6);
      }
      else
      {
        v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return;
        }
        if (v17 >= v10)
          goto LABEL_36;
        v18 = v33[v17];
        ++v12;
        if (!v18)
        {
          v12 = v17 + 1;
          if (v17 + 1 >= v10)
            goto LABEL_36;
          v18 = v33[v12];
          if (!v18)
          {
            v12 = v17 + 2;
            if (v17 + 2 >= v10)
              goto LABEL_36;
            v18 = v33[v12];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v18 = v33[v19];
              if (!v18)
              {
                while (1)
                {
                  v12 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_42;
                  if (v12 >= v10)
                    goto LABEL_36;
                  v18 = v33[v12];
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v12 = v19;
            }
          }
        }
LABEL_26:
        v9 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      v20 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v16);
      v21 = *v20;
      v22 = v20[1];
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      String.hash(into:)(v34, v21, v22);
      v23 = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = v23 & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v13 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      v14 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v13);
      *v14 = v21;
      v14[1] = v22;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  swift_release(v3);
  *v2 = v6;
}

{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  Swift::Int v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[9];

  v2 = v1;
  v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v37 = *(_QWORD *)(v4 - 8);
  v38 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  v8 = static _SetStorage.resize(original:capacity:move:)(v7, a1, 1);
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_39;
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 56);
  v36 = (_QWORD *)(v7 + 56);
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v34 = v2;
  v35 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 56;
  swift_retain(v7);
  v15 = 0;
  while (1)
  {
    if (v13)
    {
      v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_26;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      return;
    }
    if (v19 >= v35)
      goto LABEL_35;
    v20 = v36[v19];
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v35)
        goto LABEL_35;
      v20 = v36[v15];
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v35)
          goto LABEL_35;
        v20 = v36[v15];
        if (!v20)
          break;
      }
    }
LABEL_25:
    v13 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_26:
    v22 = *(_QWORD *)(v37 + 72);
    outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(*(_QWORD *)(v7 + 48) + v22 * v18, (uint64_t)v6);
    Hasher.init(_seed:)(v39, *(_QWORD *)(v9 + 40));
    v23 = type metadata accessor for UUID(0);
    v24 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(v39, v23, v24);
    v25 = Hasher._finalize()();
    v26 = -1 << *(_BYTE *)(v9 + 32);
    v27 = v25 & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v14 + 8 * (v27 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v14 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v14 + 8 * v28);
      }
      while (v32 == -1);
      v16 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v14 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v6, *(_QWORD *)(v9 + 48) + v16 * v22);
    ++*(_QWORD *)(v9 + 16);
  }
  v21 = v19 + 3;
  if (v21 < v35)
  {
    v20 = v36[v21];
    if (!v20)
    {
      while (1)
      {
        v15 = v21 + 1;
        if (__OFADD__(v21, 1))
          goto LABEL_41;
        if (v15 >= v35)
          goto LABEL_35;
        v20 = v36[v15];
        ++v21;
        if (v20)
          goto LABEL_25;
      }
    }
    v15 = v21;
    goto LABEL_25;
  }
LABEL_35:
  swift_release(v7);
  v2 = v34;
  v33 = 1 << *(_BYTE *)(v7 + 32);
  if (v33 > 63)
    bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v36 = -1 << v33;
  *(_QWORD *)(v7 + 16) = 0;
LABEL_39:
  swift_release(v7);
  *v2 = v9;
}

void specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD v29[9];

  v5 = v4;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)(v11);
  }
  else
  {
    if (v10 > v9)
    {
      specialized _NativeSet.copy()();
      goto LABEL_22;
    }
    specialized _NativeSet.copyAndResize(capacity:)(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v29, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v29, a1, a2);
  v13 = Hasher._finalize()();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a3 = v13 & ~v14;
  v15 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v16 = *(_QWORD *)(v12 + 48);
    v17 = (_QWORD *)(v16 + 16 * a3);
    v18 = v17[1];
    v19 = *v17 == a1 && v18 == a2;
    if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0) & 1) != 0)
    {
LABEL_21:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v20 = ~v14;
      while (1)
      {
        a3 = (a3 + 1) & v20;
        if (((*(_QWORD *)(v15 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v21 = (_QWORD *)(v16 + 16 * a3);
        v22 = v21[1];
        v23 = *v21 == a1 && v22 == a2;
        if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v21, v22, a1, a2, 0) & 1) != 0)
          goto LABEL_21;
      }
    }
  }
LABEL_22:
  v24 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v25 = (_QWORD *)(*(_QWORD *)(v24 + 48) + 16 * a3);
  *v25 = a1;
  v25[1] = a2;
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (v27)
    __break(1u);
  else
    *(_QWORD *)(v24 + 16) = v28;
}

uint64_t specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Swift::Int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  _QWORD v33[9];

  v7 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(*v3 + 16);
  v12 = *(_QWORD *)(*v3 + 24);
  v31 = v3;
  v32 = a1;
  if (v12 > v11 && (a3 & 1) != 0)
  {
LABEL_13:
    v14 = v8;
    goto LABEL_14;
  }
  v13 = v11 + 1;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)(v13);
    goto LABEL_8;
  }
  if (v12 <= v11)
  {
    specialized _NativeSet.copyAndResize(capacity:)(v13);
LABEL_8:
    v15 = *v3;
    Hasher.init(_seed:)(v33, *(_QWORD *)(*v3 + 40));
    v16 = a1 + *(int *)(v7 + 32);
    v17 = type metadata accessor for UUID(0);
    v18 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(v33, v17, v18);
    v19 = Hasher._finalize()();
    v20 = -1 << *(_BYTE *)(v15 + 32);
    a2 = v19 & ~v20;
    if (((*(_QWORD *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
    {
      v21 = ~v20;
      v14 = v8;
      v22 = *(_QWORD *)(v8 + 72);
      while (1)
      {
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(_QWORD *)(v15 + 48) + v22 * a2, (uint64_t)v10);
        v23 = static UUID.== infix(_:_:)(&v10[*(int *)(v7 + 32)], v16);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v10);
        if ((v23 & 1) != 0)
          goto LABEL_17;
        a2 = (a2 + 1) & v21;
        if (((*(_QWORD *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          goto LABEL_14;
      }
    }
    goto LABEL_13;
  }
  v14 = v8;
  specialized _NativeSet.copy()();
LABEL_14:
  v24 = v32;
  v25 = *v31;
  *(_QWORD *)(*v31 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v24, *(_QWORD *)(v25 + 48) + *(_QWORD *)(v14 + 72) * a2);
  v27 = *(_QWORD *)(v25 + 16);
  v28 = __OFADD__(v27, 1);
  v29 = v27 + 1;
  if (!v28)
  {
    *(_QWORD *)(v25 + 16) = v29;
    return result;
  }
  __break(1u);
LABEL_17:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v7);
  __break(1u);
  return result;
}

void specialized _NativeSet.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    swift_release(v2);
    *v1 = v4;
    return;
  }
  v5 = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)v5 >= v2 + 56 + 8 * v7)
    memmove(v5, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    swift_bridgeObjectRetain(v18);
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;

  v1 = v0;
  v2 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  v6 = *v0;
  v7 = static _SetStorage.copy(original:)(*v0);
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_28:
    swift_release(v6);
    *v1 = v8;
    return;
  }
  v9 = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)v9 >= v6 + 56 + 8 * v11)
    memmove(v9, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5);
    outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
    goto LABEL_28;
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
}

void specialized _NativeSet.copyAndResize(capacity:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  __n128 v12;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  Swift::Int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  int64_t v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    swift_release(v3);
LABEL_38:
    *v2 = v6;
    return;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v32 = v2;
  v33 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  v12 = swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v33)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v33)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v13);
      if (!v19)
      {
        v13 = v18 + 2;
        if (v18 + 2 >= v33)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v13);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v34, v22, v23);
    v24 = Hasher._finalize()();
    v25 = -1 << *(_BYTE *)(v6 + 32);
    v26 = v24 & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v27);
      }
      while (v31 == -1);
      v14 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    *v15 = v22;
    v15[1] = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v33)
  {
LABEL_36:
    swift_release_n(v3, 2, v12);
    v2 = v32;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v13 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v13 >= v33)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v13);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
}

{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __n128 v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  Swift::Int v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[9];

  v2 = v1;
  v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v37 = *(_QWORD *)(v4 - 8);
  v38 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  v8 = static _SetStorage.resize(original:capacity:move:)(v7, a1, 0);
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    swift_release(v7);
LABEL_37:
    *v2 = v9;
    return;
  }
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 56);
  v34 = v2;
  v35 = v7 + 56;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v36 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 56;
  v15 = swift_retain(v7);
  v16 = 0;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v19 = v18 | (v16 << 6);
      goto LABEL_26;
    }
    v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v20 >= v36)
      goto LABEL_35;
    v21 = *(_QWORD *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      v16 = v20 + 1;
      if (v20 + 1 >= v36)
        goto LABEL_35;
      v21 = *(_QWORD *)(v35 + 8 * v16);
      if (!v21)
      {
        v16 = v20 + 2;
        if (v20 + 2 >= v36)
          goto LABEL_35;
        v21 = *(_QWORD *)(v35 + 8 * v16);
        if (!v21)
          break;
      }
    }
LABEL_25:
    v13 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_26:
    v23 = *(_QWORD *)(v37 + 72);
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(_QWORD *)(v7 + 48) + v23 * v19, (uint64_t)v6);
    Hasher.init(_seed:)(v39, *(_QWORD *)(v9 + 40));
    v24 = type metadata accessor for UUID(0);
    v25 = lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    dispatch thunk of Hashable.hash(into:)(v39, v24, v25);
    v26 = Hasher._finalize()();
    v27 = -1 << *(_BYTE *)(v9 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    if (((-1 << v28) & ~*(_QWORD *)(v14 + 8 * (v28 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v14 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v32 = v29 == v31;
        if (v29 == v31)
          v29 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v14 + 8 * v29);
      }
      while (v33 == -1);
      v17 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v6, *(_QWORD *)(v9 + 48) + v17 * v23);
    ++*(_QWORD *)(v9 + 16);
  }
  v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_35:
    swift_release_n(v7, 2, v15);
    v2 = v34;
    goto LABEL_37;
  }
  v21 = *(_QWORD *)(v35 + 8 * v22);
  if (v21)
  {
    v16 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v16 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v16 >= v36)
      goto LABEL_35;
    v21 = *(_QWORD *)(v35 + 8 * v16);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_39:
  __break(1u);
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CLLocationCoordinate2D>);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    memcpy(v14, v15, 16 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<MOSuggestionAssetMapsClusterer.Cluster>);
  v11 = *(_QWORD *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = _swift_stdlib_malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v8;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew()(unint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew()(_QWORD *a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

uint64_t specialized MutableCollection<>.sort(by:)(_QWORD *a1, uint64_t (*a2)(_QWORD *))
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v4 = *(_QWORD *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) - 8);
  v5 = (_QWORD *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v5 = (_QWORD *)specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v5);
  v6 = v5[2];
  v8[0] = (char *)v5 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v8[1] = v6;
  result = a2(v8);
  *a1 = v5;
  return result;
}

unsigned __int8 *specialized _parseInteger<A, B>(ascii:radix:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 *v12;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v15 = a2;
  swift_bridgeObjectRetain(a2);
  v4 = String.init<A>(_:)(&v14, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  v6 = v4;
  v7 = v5;
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v9 = HIBYTE(v7) & 0xF;
    v14 = v6;
    v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  v6 = static String._copying(_:)(v4, v5);
  v11 = v10;
  swift_bridgeObjectRelease(v7);
  v7 = v11;
  if ((v11 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v6, v7);
  }
LABEL_7:
  v12 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v8, v9, a3);
  swift_bridgeObjectRelease(v7);
  return v12;
}

unsigned __int8 *specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t static String._copying(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1;
  v3 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v3 = 11;
  v4 = String.subscript.getter(15, v3 | (v2 << 16), a1, a2);
  v6 = v5;
  v9 = static String._copying(_:)(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t static String._copying(_:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v5 = a3;
  if ((a4 & 0x1000000000000000) != 0)
  {
    v12 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (v12)
    {
      v9 = v12;
      v8 = (unint64_t)specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v12, 0);
      v5 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
      v13 = v15[3];
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRelease(v13);
      if (v5 != v9)
      {
        __break(1u);
        goto LABEL_11;
      }
    }
    else
    {
      v8 = (unint64_t)_swiftEmptyArrayStorage;
    }
    v14 = static String._uncheckedFromUTF8(_:)(v8 + 32, *(_QWORD *)(v8 + 16));
    swift_release(v8);
    return v14;
  }
  else
  {
    v8 = a1 >> 16;
    v9 = a2 >> 16;
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
LABEL_5:
        v10 += v8;
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }
LABEL_11:
      v10 = _StringObject.sharedUTF8.getter(v5, a4);
      if (!v10)
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      goto LABEL_5;
    }
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return static String._uncheckedFromUTF8(_:)((char *)v15 + v8, v9 - v8);
  }
}

unint64_t specialized Collection.count.getter(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)(v7, a2, a3, a4);
  }
  __break(1u);
  return result;
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = _StringObject.sharedUTF8.getter(a6, a7);
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = String.UTF8View._foreignIndex(after:)(v12, a6, a7);
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  Swift::Int result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  Swift::Int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  Swift::Int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  Swift::Int v46;
  uint64_t v47;
  Swift::Int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  BOOL v87;
  uint64_t v88;
  char v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  unint64_t v119;
  char *v120;
  _QWORD *v121;
  char *v122;
  uint64_t v123;
  _QWORD *v124;
  Swift::Int v125;
  uint64_t v126;
  Swift::Int v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;

  v2 = v1;
  v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v131 = *(_QWORD *)(v4 - 8);
  v132 = v4;
  v5 = __chkstk_darwin(v4);
  v128 = (uint64_t)&v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v137 = (uint64_t)&v122 - v8;
  v9 = __chkstk_darwin(v7);
  v135 = (uint64_t)&v122 - v10;
  __chkstk_darwin(v9);
  v134 = (uint64_t)&v122 - v11;
  v12 = a1[1];
  result = _minimumMergeRunLength(_:)(v12);
  if (result >= v12)
  {
    if (v12 < 0)
      goto LABEL_143;
    if (v12)
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v12, 1, a1);
    return result;
  }
  if (v12 >= 0)
    v14 = v12;
  else
    v14 = v12 + 1;
  if (v12 < -1)
    goto LABEL_151;
  v125 = result;
  if (v12 < 2)
  {
    v18 = _swiftEmptyArrayStorage;
    v130 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v131 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80));
    if (v12 != 1)
    {
      v21 = _swiftEmptyArrayStorage[2];
      v20 = (char *)_swiftEmptyArrayStorage;
LABEL_105:
      v124 = v18;
      if (v21 >= 2)
      {
        v113 = *a1;
        do
        {
          v114 = v21 - 2;
          if (v21 < 2)
            goto LABEL_138;
          if (!v113)
            goto LABEL_150;
          v107 = v20;
          v115 = v20 + 32;
          v116 = *(_QWORD *)&v20[16 * v114 + 32];
          v117 = *(_QWORD *)&v20[16 * v21 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)(v113 + *(_QWORD *)(v131 + 72) * v116, v113 + *(_QWORD *)(v131 + 72) * *(_QWORD *)&v115[16 * v21 - 16], v113 + *(_QWORD *)(v131 + 72) * v117, v130);
          if (v2)
            goto LABEL_117;
          if (v117 < v116)
            goto LABEL_139;
          if ((swift_isUniquelyReferenced_nonNull_native(v107) & 1) == 0)
            v107 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v107);
          if (v114 >= *((_QWORD *)v107 + 2))
            goto LABEL_140;
          v118 = &v107[16 * v114 + 32];
          *(_QWORD *)v118 = v116;
          *((_QWORD *)v118 + 1) = v117;
          v119 = *((_QWORD *)v107 + 2);
          if (v21 > v119)
            goto LABEL_141;
          v20 = v107;
          memmove(&v107[16 * v21 + 16], &v107[16 * v21 + 32], 16 * (v119 - v21));
          *((_QWORD *)v107 + 2) = v119 - 1;
          v21 = v119 - 1;
        }
        while (v119 > 2);
      }
      v120 = v20;
LABEL_119:
      swift_bridgeObjectRelease(v120);
      v121 = v124;
      v124[2] = 0;
      return swift_bridgeObjectRelease(v121);
    }
    v124 = _swiftEmptyArrayStorage;
  }
  else
  {
    v15 = v14 >> 1;
    v16 = static Array._allocateBufferUninitialized(minimumCapacity:)(v14 >> 1, v132);
    *(_QWORD *)(v16 + 16) = v15;
    v17 = *(unsigned __int8 *)(v131 + 80);
    v124 = (_QWORD *)v16;
    v130 = v16 + ((v17 + 32) & ~v17);
  }
  v19 = 0;
  v20 = (char *)_swiftEmptyArrayStorage;
  v136 = a1;
  while (1)
  {
    v22 = v19;
    v23 = v19 + 1;
    if (v19 + 1 >= v12)
    {
      v32 = v19 + 1;
    }
    else
    {
      v24 = *a1;
      v25 = v19;
      v129 = v19;
      v26 = *(_QWORD *)(v131 + 72);
      v27 = v134;
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v24 + v26 * v23, v134);
      v28 = v24 + v26 * v25;
      v29 = v135;
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v28, v135);
      v30 = *(double *)(v27 + 16);
      v31 = *(double *)(v29 + 16);
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v29);
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v27);
      v32 = v129 + 2;
      v126 = v24;
      v138 = v26;
      if (v129 + 2 >= v12)
      {
        v37 = v26;
        v22 = v129;
        if (v31 >= v30)
          goto LABEL_40;
      }
      else
      {
        v123 = v2;
        v133 = v26 * v23;
        v33 = v24;
        v127 = v26 * v32;
        while (1)
        {
          v34 = v134;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v33 + v127, v134);
          v35 = v135;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v33 + v133, v135);
          v36 = *(double *)(v35 + 16) >= *(double *)(v34 + 16);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v35);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v34);
          if (v31 < v30 == v36)
            break;
          v37 = v138;
          v33 += v138;
          if (v12 == ++v32)
          {
            v32 = v12;
            v2 = v123;
            v22 = v129;
            if (v31 < v30)
              goto LABEL_27;
            goto LABEL_40;
          }
        }
        v2 = v123;
        v22 = v129;
        v37 = v138;
        if (v31 >= v30)
          goto LABEL_40;
      }
LABEL_27:
      if (v32 < v22)
        goto LABEL_144;
      if (v22 < v32)
      {
        v127 = v12;
        v122 = v20;
        v38 = 0;
        v39 = v37 * (v32 - 1);
        v40 = v32 * v37;
        v41 = v22 * v37;
        do
        {
          if (v22 != v32 + v38 - 1)
          {
            v44 = v126;
            if (!v126)
              goto LABEL_149;
            v45 = v126 + v41;
            v133 = v126 + v39;
            outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v126 + v41, v128);
            if (v41 < v39 || v45 >= v44 + v40)
            {
              v42 = v44 + v41;
              v43 = v133;
              swift_arrayInitWithTakeFrontToBack(v42, v133, 1, v132);
            }
            else
            {
              v43 = v133;
              if (v41 != v39)
                swift_arrayInitWithTakeBackToFront(v45);
            }
            outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v128, v43);
            a1 = v136;
            v37 = v138;
          }
          ++v22;
          --v38;
          v39 -= v37;
          v40 -= v37;
          v41 += v37;
        }
        while (v22 < v32 + v38);
        v20 = v122;
        v22 = v129;
        v12 = v127;
      }
    }
LABEL_40:
    if (v32 < v12)
    {
      if (__OFSUB__(v32, v22))
        goto LABEL_142;
      if (v32 - v22 < v125)
        break;
    }
LABEL_57:
    if (v32 < v22)
      goto LABEL_137;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v20);
    v138 = v32;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v20 + 2) + 1, 1, v20);
    v62 = *((_QWORD *)v20 + 2);
    v61 = *((_QWORD *)v20 + 3);
    v21 = v62 + 1;
    if (v62 >= v61 >> 1)
      v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v61 > 1), v62 + 1, 1, v20);
    *((_QWORD *)v20 + 2) = v21;
    v63 = v20 + 32;
    v64 = &v20[16 * v62 + 32];
    v65 = v138;
    *(_QWORD *)v64 = v22;
    *((_QWORD *)v64 + 1) = v65;
    if (v62)
    {
      while (1)
      {
        v66 = v21 - 1;
        if (v21 >= 4)
        {
          v71 = &v63[16 * v21];
          v72 = *((_QWORD *)v71 - 8);
          v73 = *((_QWORD *)v71 - 7);
          v77 = __OFSUB__(v73, v72);
          v74 = v73 - v72;
          if (v77)
            goto LABEL_126;
          v76 = *((_QWORD *)v71 - 6);
          v75 = *((_QWORD *)v71 - 5);
          v77 = __OFSUB__(v75, v76);
          v69 = v75 - v76;
          v70 = v77;
          if (v77)
            goto LABEL_127;
          v78 = v21 - 2;
          v79 = &v63[16 * v21 - 32];
          v81 = *(_QWORD *)v79;
          v80 = *((_QWORD *)v79 + 1);
          v77 = __OFSUB__(v80, v81);
          v82 = v80 - v81;
          if (v77)
            goto LABEL_129;
          v77 = __OFADD__(v69, v82);
          v83 = v69 + v82;
          if (v77)
            goto LABEL_132;
          if (v83 >= v74)
          {
            v101 = &v63[16 * v66];
            v103 = *(_QWORD *)v101;
            v102 = *((_QWORD *)v101 + 1);
            v77 = __OFSUB__(v102, v103);
            v104 = v102 - v103;
            if (v77)
              goto LABEL_136;
            v94 = v69 < v104;
            goto LABEL_94;
          }
        }
        else
        {
          if (v21 != 3)
          {
            v95 = *((_QWORD *)v20 + 4);
            v96 = *((_QWORD *)v20 + 5);
            v77 = __OFSUB__(v96, v95);
            v88 = v96 - v95;
            v89 = v77;
            goto LABEL_88;
          }
          v68 = *((_QWORD *)v20 + 4);
          v67 = *((_QWORD *)v20 + 5);
          v77 = __OFSUB__(v67, v68);
          v69 = v67 - v68;
          v70 = v77;
        }
        if ((v70 & 1) != 0)
          goto LABEL_128;
        v78 = v21 - 2;
        v84 = &v63[16 * v21 - 32];
        v86 = *(_QWORD *)v84;
        v85 = *((_QWORD *)v84 + 1);
        v87 = __OFSUB__(v85, v86);
        v88 = v85 - v86;
        v89 = v87;
        if (v87)
          goto LABEL_131;
        v90 = &v63[16 * v66];
        v92 = *(_QWORD *)v90;
        v91 = *((_QWORD *)v90 + 1);
        v77 = __OFSUB__(v91, v92);
        v93 = v91 - v92;
        if (v77)
          goto LABEL_134;
        if (__OFADD__(v88, v93))
          goto LABEL_135;
        if (v88 + v93 >= v69)
        {
          v94 = v69 < v93;
LABEL_94:
          if (v94)
            v66 = v78;
          goto LABEL_96;
        }
LABEL_88:
        if ((v89 & 1) != 0)
          goto LABEL_130;
        v97 = &v63[16 * v66];
        v99 = *(_QWORD *)v97;
        v98 = *((_QWORD *)v97 + 1);
        v77 = __OFSUB__(v98, v99);
        v100 = v98 - v99;
        if (v77)
          goto LABEL_133;
        if (v100 < v88)
          goto LABEL_15;
LABEL_96:
        v105 = v66 - 1;
        if (v66 - 1 >= v21)
        {
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
          goto LABEL_146;
        }
        v106 = *a1;
        if (!*a1)
          goto LABEL_148;
        v107 = v20;
        v108 = &v63[16 * v105];
        v109 = *(_QWORD *)v108;
        v110 = &v63[16 * v66];
        v111 = *((_QWORD *)v110 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)(v106 + *(_QWORD *)(v131 + 72) * *(_QWORD *)v108, v106 + *(_QWORD *)(v131 + 72) * *(_QWORD *)v110, v106 + *(_QWORD *)(v131 + 72) * v111, v130);
        if (v2)
        {
LABEL_117:
          v120 = v107;
          goto LABEL_119;
        }
        if (v111 < v109)
          goto LABEL_123;
        if (v66 > *((_QWORD *)v107 + 2))
          goto LABEL_124;
        *(_QWORD *)v108 = v109;
        *(_QWORD *)&v63[16 * v105 + 8] = v111;
        v112 = *((_QWORD *)v107 + 2);
        if (v66 >= v112)
          goto LABEL_125;
        v20 = v107;
        v21 = v112 - 1;
        memmove(&v63[16 * v66], v110 + 16, 16 * (v112 - 1 - v66));
        *((_QWORD *)v107 + 2) = v112 - 1;
        a1 = v136;
        if (v112 <= 2)
          goto LABEL_15;
      }
    }
    v21 = 1;
LABEL_15:
    v12 = a1[1];
    v19 = v138;
    if (v138 >= v12)
    {
      v18 = v124;
      goto LABEL_105;
    }
  }
  if (__OFADD__(v22, v125))
    goto LABEL_145;
  if (v22 + v125 >= v12)
    v46 = v12;
  else
    v46 = v22 + v125;
  if (v46 >= v22)
  {
    if (v32 != v46)
    {
      v129 = v22;
      v122 = v20;
      v123 = v2;
      v47 = *(_QWORD *)(v131 + 72);
      v138 = v47 * (v32 - 1);
      v133 = v47;
      v48 = v32 * v47;
      v127 = v46;
      do
      {
        v49 = 0;
        v50 = v129;
        do
        {
          v51 = *a1;
          v52 = v134;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v48 + v49 + *a1, v134);
          v53 = v138 + v49 + v51;
          v54 = v135;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v53, v135);
          v55 = *(double *)(v52 + 16);
          v56 = *(double *)(v54 + 16);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v54);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v52);
          if (v56 >= v55)
            break;
          v57 = *a1;
          if (!*a1)
            goto LABEL_147;
          v58 = v57 + v48 + v49;
          v59 = v57 + v138 + v49;
          outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v58, v137);
          swift_arrayInitWithTakeFrontToBack(v58, v59, 1, v132);
          outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v137, v59);
          v49 -= v133;
          ++v50;
          a1 = v136;
        }
        while (v32 != v50);
        ++v32;
        v138 += v133;
        v48 += v133;
      }
      while (v32 != v127);
      v32 = v127;
      v20 = v122;
      v2 = v123;
      v22 = v129;
    }
    goto LABEL_57;
  }
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  __break(1u);
LABEL_150:
  __break(1u);
LABEL_151:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
  return result;
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  Swift::Int result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  Swift::Int v19;
  unint64_t v20;
  Swift::Int v21;
  Swift::Int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  Swift::Int v28;
  uint64_t v29;
  Swift::Int v30;
  uint64_t v31;
  uint64_t v32;
  Swift::Int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  Swift::Int v39;
  Swift::Int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  Swift::Int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  Swift::Int v48;
  uint64_t v49;
  uint64_t v50;
  Swift::Int v51;
  Swift::Int v52;
  uint64_t v53;
  Swift::Int v54;
  uint64_t *v55;
  uint64_t v56;
  Swift::Int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  Swift::Int v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  unint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  uint64_t v95;
  char v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  BOOL v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  unint64_t v124;
  _QWORD *v125;
  uint64_t v126;
  _QWORD *v127;
  Swift::Int v128;
  uint64_t v129;
  char *v130;
  Swift::Int v131;
  uint64_t v132;
  Swift::Int v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  Swift::Int v140;
  _QWORD *v141;
  uint64_t v142;
  Swift::Int v143;
  uint64_t v144;

  v2 = v1;
  v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v135 = *(_QWORD *)(v4 - 8);
  v136 = v4;
  v5 = __chkstk_darwin(v4);
  v132 = (uint64_t)&v126 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v142 = (uint64_t)&v126 - v8;
  v9 = __chkstk_darwin(v7);
  v139 = (uint64_t)&v126 - v10;
  __chkstk_darwin(v9);
  v138 = (uint64_t)&v126 - v11;
  v12 = a1[1];
  result = _minimumMergeRunLength(_:)(v12);
  if (result >= v12)
  {
    if (v12 < 0)
      goto LABEL_140;
    if (v12)
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v12, 1, a1);
    return result;
  }
  if (v12 >= 0)
    v14 = v12;
  else
    v14 = v12 + 1;
  if (v12 < -1)
    goto LABEL_148;
  v128 = result;
  if (v12 < 2)
  {
    v18 = (char *)_swiftEmptyArrayStorage;
    v134 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v135 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80));
    v127 = _swiftEmptyArrayStorage;
    if (v12 != 1)
    {
      v20 = _swiftEmptyArrayStorage[2];
LABEL_106:
      if (v20 >= 2)
      {
        v119 = *a1;
        do
        {
          v120 = v20 - 2;
          if (v20 < 2)
            goto LABEL_135;
          if (!v119)
            goto LABEL_147;
          v121 = *(_QWORD *)&v18[16 * v120 + 32];
          v122 = *(_QWORD *)&v18[16 * v20 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)(v119 + *(_QWORD *)(v135 + 72) * v121, v119 + *(_QWORD *)(v135 + 72) * *(_QWORD *)&v18[16 * v20 + 16], v119 + *(_QWORD *)(v135 + 72) * v122, v134);
          if (v2)
            break;
          if (v122 < v121)
            goto LABEL_136;
          if ((swift_isUniquelyReferenced_nonNull_native(v18) & 1) == 0)
            v18 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v18);
          if (v120 >= *((_QWORD *)v18 + 2))
            goto LABEL_137;
          v123 = &v18[16 * v120 + 32];
          *(_QWORD *)v123 = v121;
          *((_QWORD *)v123 + 1) = v122;
          v124 = *((_QWORD *)v18 + 2);
          if (v20 > v124)
            goto LABEL_138;
          memmove(&v18[16 * v20 + 16], &v18[16 * v20 + 32], 16 * (v124 - v20));
          *((_QWORD *)v18 + 2) = v124 - 1;
          v20 = v124 - 1;
        }
        while (v124 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease(v18);
      v125 = v127;
      v127[2] = 0;
      return swift_bridgeObjectRelease(v125);
    }
  }
  else
  {
    v15 = v14 >> 1;
    v16 = static Array._allocateBufferUninitialized(minimumCapacity:)(v14 >> 1, v136);
    *(_QWORD *)(v16 + 16) = v15;
    v17 = *(unsigned __int8 *)(v135 + 80);
    v127 = (_QWORD *)v16;
    v134 = v16 + ((v17 + 32) & ~v17);
  }
  v19 = 0;
  v18 = (char *)_swiftEmptyArrayStorage;
  v141 = a1;
  while (1)
  {
    v130 = v18;
    v21 = v19;
    v22 = v19 + 1;
    if (v19 + 1 >= v12)
    {
      v39 = v19 + 1;
      v18 = v130;
      v40 = v19;
      goto LABEL_58;
    }
    v129 = v2;
    v23 = *a1;
    v24 = *(_QWORD *)(v135 + 72);
    v25 = *a1 + v24 * v22;
    v143 = v12;
    v26 = v138;
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v25, v138);
    v27 = v139;
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v23 + v24 * v21, v139);
    v140 = *(_QWORD *)(v26 + 24);
    v28 = *(_QWORD *)(v27 + 24);
    outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v27);
    v29 = v26;
    v30 = v143;
    outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v29);
    v133 = v21;
    v137 = v23;
    v144 = v24;
    if (v21 + 2 >= v30)
    {
      v33 = v21 + 2;
    }
    else
    {
      v31 = v24 * v22;
      v32 = v23;
      v33 = v21 + 2;
      v34 = v24 * (v21 + 2);
      while (1)
      {
        v35 = v140 < v28;
        v36 = v138;
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v32 + v34, v138);
        v37 = v139;
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v32 + v31, v139);
        v38 = *(_QWORD *)(v36 + 24) >= *(_QWORD *)(v37 + 24);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v37);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v36);
        if (v35 == v38)
          break;
        v32 += v144;
        if (v143 == ++v33)
        {
          v30 = v143;
          v33 = v143;
          a1 = v141;
          goto LABEL_24;
        }
      }
      a1 = v141;
      v30 = v143;
    }
LABEL_24:
    v18 = v130;
    v40 = v133;
    if (v140 >= v28)
      break;
    if (v33 < v133)
      goto LABEL_141;
    v39 = v33;
    if (v133 >= v33)
      goto LABEL_38;
    v41 = 0;
    v42 = v144;
    v43 = v144 * (v33 - 1);
    v44 = v33 * v144;
    v45 = v133 * v144;
    do
    {
      if (v40 != v39 + v41 - 1)
      {
        v46 = v137;
        if (!v137)
          goto LABEL_146;
        v47 = v137 + v45;
        outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v137 + v45, v132);
        if (v45 < v43 || v47 >= v46 + v44)
        {
          swift_arrayInitWithTakeFrontToBack(v46 + v45, v46 + v43, 1, v136);
        }
        else if (v45 != v43)
        {
          swift_arrayInitWithTakeBackToFront(v46 + v45);
        }
        outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v132, v46 + v43);
        v39 = v33;
        v42 = v144;
      }
      ++v40;
      --v41;
      v43 -= v42;
      v44 -= v42;
      v45 += v42;
    }
    while (v40 < v39 + v41);
    a1 = v141;
    v2 = v129;
    v18 = v130;
    v40 = v133;
    v30 = v143;
    if (v39 < v143)
      goto LABEL_41;
LABEL_58:
    if (v39 < v40)
      goto LABEL_134;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v18);
    v140 = v39;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v18 + 2) + 1, 1, v18);
    v69 = *((_QWORD *)v18 + 2);
    v68 = *((_QWORD *)v18 + 3);
    v20 = v69 + 1;
    if (v69 >= v68 >> 1)
      v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v68 > 1), v69 + 1, 1, v18);
    *((_QWORD *)v18 + 2) = v20;
    v70 = v18 + 32;
    v71 = &v18[16 * v69 + 32];
    v72 = v140;
    *(_QWORD *)v71 = v40;
    *((_QWORD *)v71 + 1) = v72;
    if (v69)
    {
      while (1)
      {
        v73 = v20 - 1;
        if (v20 >= 4)
        {
          v78 = &v70[16 * v20];
          v79 = *((_QWORD *)v78 - 8);
          v80 = *((_QWORD *)v78 - 7);
          v84 = __OFSUB__(v80, v79);
          v81 = v80 - v79;
          if (v84)
            goto LABEL_123;
          v83 = *((_QWORD *)v78 - 6);
          v82 = *((_QWORD *)v78 - 5);
          v84 = __OFSUB__(v82, v83);
          v76 = v82 - v83;
          v77 = v84;
          if (v84)
            goto LABEL_124;
          v85 = v20 - 2;
          v86 = &v70[16 * v20 - 32];
          v88 = *(_QWORD *)v86;
          v87 = *((_QWORD *)v86 + 1);
          v84 = __OFSUB__(v87, v88);
          v89 = v87 - v88;
          if (v84)
            goto LABEL_126;
          v84 = __OFADD__(v76, v89);
          v90 = v76 + v89;
          if (v84)
            goto LABEL_129;
          if (v90 >= v81)
          {
            v108 = &v70[16 * v73];
            v110 = *(_QWORD *)v108;
            v109 = *((_QWORD *)v108 + 1);
            v84 = __OFSUB__(v109, v110);
            v111 = v109 - v110;
            if (v84)
              goto LABEL_133;
            v101 = v76 < v111;
            goto LABEL_95;
          }
        }
        else
        {
          if (v20 != 3)
          {
            v102 = *((_QWORD *)v18 + 4);
            v103 = *((_QWORD *)v18 + 5);
            v84 = __OFSUB__(v103, v102);
            v95 = v103 - v102;
            v96 = v84;
            goto LABEL_89;
          }
          v75 = *((_QWORD *)v18 + 4);
          v74 = *((_QWORD *)v18 + 5);
          v84 = __OFSUB__(v74, v75);
          v76 = v74 - v75;
          v77 = v84;
        }
        if ((v77 & 1) != 0)
          goto LABEL_125;
        v85 = v20 - 2;
        v91 = &v70[16 * v20 - 32];
        v93 = *(_QWORD *)v91;
        v92 = *((_QWORD *)v91 + 1);
        v94 = __OFSUB__(v92, v93);
        v95 = v92 - v93;
        v96 = v94;
        if (v94)
          goto LABEL_128;
        v97 = &v70[16 * v73];
        v99 = *(_QWORD *)v97;
        v98 = *((_QWORD *)v97 + 1);
        v84 = __OFSUB__(v98, v99);
        v100 = v98 - v99;
        if (v84)
          goto LABEL_131;
        if (__OFADD__(v95, v100))
          goto LABEL_132;
        if (v95 + v100 >= v76)
        {
          v101 = v76 < v100;
LABEL_95:
          if (v101)
            v73 = v85;
          goto LABEL_97;
        }
LABEL_89:
        if ((v96 & 1) != 0)
          goto LABEL_127;
        v104 = &v70[16 * v73];
        v106 = *(_QWORD *)v104;
        v105 = *((_QWORD *)v104 + 1);
        v84 = __OFSUB__(v105, v106);
        v107 = v105 - v106;
        if (v84)
          goto LABEL_130;
        if (v107 < v95)
          goto LABEL_14;
LABEL_97:
        v112 = v73 - 1;
        if (v73 - 1 >= v20)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        v113 = *a1;
        if (!*a1)
          goto LABEL_145;
        v114 = &v70[16 * v112];
        v115 = *(_QWORD *)v114;
        v116 = &v70[16 * v73];
        v117 = *((_QWORD *)v116 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)(v113 + *(_QWORD *)(v135 + 72) * *(_QWORD *)v114, v113 + *(_QWORD *)(v135 + 72) * *(_QWORD *)v116, v113 + *(_QWORD *)(v135 + 72) * v117, v134);
        if (v2)
          goto LABEL_117;
        if (v117 < v115)
          goto LABEL_120;
        if (v73 > *((_QWORD *)v18 + 2))
          goto LABEL_121;
        *(_QWORD *)v114 = v115;
        *(_QWORD *)&v70[16 * v112 + 8] = v117;
        v118 = *((_QWORD *)v18 + 2);
        if (v73 >= v118)
          goto LABEL_122;
        v20 = v118 - 1;
        memmove(&v70[16 * v73], v116 + 16, 16 * (v118 - 1 - v73));
        *((_QWORD *)v18 + 2) = v118 - 1;
        a1 = v141;
        if (v118 <= 2)
          goto LABEL_14;
      }
    }
    v20 = 1;
LABEL_14:
    v12 = a1[1];
    v19 = v140;
    if (v140 >= v12)
      goto LABEL_106;
  }
  v39 = v33;
LABEL_38:
  v2 = v129;
  if (v39 >= v30)
    goto LABEL_58;
LABEL_41:
  if (__OFSUB__(v39, v40))
    goto LABEL_139;
  if (v39 - v40 >= v128)
    goto LABEL_58;
  if (__OFADD__(v40, v128))
    goto LABEL_142;
  if (v40 + v128 >= v30)
    v48 = v30;
  else
    v48 = v40 + v128;
  if (v48 >= v40)
  {
    if (v39 != v48)
    {
      v133 = v40;
      v129 = v2;
      v49 = *(_QWORD *)(v135 + 72);
      v50 = v49 * (v39 - 1);
      v137 = v49;
      v51 = v39 * v49;
      v131 = v48;
      do
      {
        v53 = 0;
        v54 = v133;
        v140 = v39;
        while (1)
        {
          v143 = v54;
          v55 = v141;
          v56 = *v141;
          v57 = v51;
          v58 = v51 + v53 + *v141;
          v59 = v138;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v58, v138);
          v60 = v50;
          v61 = v50 + v53 + v56;
          v62 = v139;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v61, v139);
          v144 = *(_QWORD *)(v59 + 24);
          v63 = *(_QWORD *)(v62 + 24);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v62);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v59);
          if (v144 >= v63)
            break;
          v64 = *v55;
          if (!*v55)
            goto LABEL_144;
          v51 = v57;
          v65 = v64 + v57 + v53;
          v50 = v60;
          v66 = v64 + v60 + v53;
          outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v65, v142);
          swift_arrayInitWithTakeFrontToBack(v65, v66, 1, v136);
          outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v142, v66);
          v53 -= v137;
          v54 = v143 + 1;
          v52 = v140;
          if (v140 == v143 + 1)
            goto LABEL_51;
        }
        v52 = v140;
        v50 = v60;
        v51 = v57;
LABEL_51:
        v39 = v52 + 1;
        v50 += v137;
        v51 += v137;
      }
      while (v39 != v131);
      v39 = v131;
      v2 = v129;
      v18 = v130;
      a1 = v141;
      v40 = v133;
    }
    goto LABEL_58;
  }
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
  return result;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v27 = a1;
  v28 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v7 = __chkstk_darwin(v28);
  v31 = (uint64_t)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v11 = (double *)((char *)&v25 - v10);
  result = __chkstk_darwin(v9);
  v15 = (double *)((char *)&v25 - v14);
  v30 = a3;
  v26 = a2;
  if (a3 != a2)
  {
    v16 = *(_QWORD *)(v13 + 72);
    v33 = v16 * (v30 - 1);
    v29 = v16;
    v32 = v16 * v30;
LABEL_5:
    v17 = 0;
    v18 = v27;
    while (1)
    {
      v19 = *a4;
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v32 + v17 + *a4, (uint64_t)v15);
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v33 + v17 + v19, (uint64_t)v11);
      v20 = v15[2];
      v21 = v11[2];
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v11);
      result = outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v15);
      if (v21 >= v20)
      {
LABEL_4:
        v33 += v29;
        v32 += v29;
        if (++v30 == v26)
          return result;
        goto LABEL_5;
      }
      v22 = *a4;
      if (!*a4)
        break;
      v23 = v22 + v32 + v17;
      v24 = v22 + v33 + v17;
      outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v23, v31);
      swift_arrayInitWithTakeFrontToBack(v23, v24, 1, v28);
      result = outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v31, v24);
      v17 -= v29;
      if (v30 == ++v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v29 = a1;
  v30 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v7 = __chkstk_darwin(v30);
  v33 = (uint64_t)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v27 - v10;
  result = __chkstk_darwin(v9);
  v15 = (char *)&v27 - v14;
  v32 = a3;
  v28 = a2;
  if (a3 != a2)
  {
    v16 = *(_QWORD *)(v13 + 72);
    v35 = v16 * (v32 - 1);
    v31 = v16;
    v34 = v16 * v32;
LABEL_5:
    v17 = 0;
    v18 = v29;
    while (1)
    {
      v19 = a4;
      v20 = *a4;
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v34 + v17 + v20, (uint64_t)v15);
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v35 + v17 + v20, (uint64_t)v11);
      v21 = *((_QWORD *)v15 + 3);
      v22 = *((_QWORD *)v11 + 3);
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v11);
      result = outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v15);
      v23 = v21 < v22;
      a4 = v19;
      if (!v23)
      {
LABEL_4:
        v35 += v31;
        v34 += v31;
        if (++v32 == v28)
          return result;
        goto LABEL_5;
      }
      v24 = *v19;
      if (!*v19)
        break;
      v25 = v24 + v34 + v17;
      v26 = v24 + v35 + v17;
      outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v25, v33);
      swift_arrayInitWithTakeFrontToBack(v25, v26, 1, v30);
      result = outlined init with take of MOSuggestionAssetMapsClusterer.Cluster(v33, v26);
      v17 -= v31;
      ++v18;
      a4 = v19;
      if (v32 == v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v27;
  unint64_t v29;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  double v34;
  double v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;

  v41 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v8 = __chkstk_darwin(v41);
  v10 = (double *)((char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  v12 = (double *)((char *)&v40 - v11);
  v14 = *(_QWORD *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1)
    goto LABEL_70;
  v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1)
    goto LABEL_71;
  v16 = (uint64_t)(a2 - a1) / v14;
  v44 = a1;
  v43 = a4;
  v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack(a4, a2, v17, v41);
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront(a4);
      }
      v29 = a4 + v19;
      v42 = a4 + v19;
      v44 = a2;
      if (v19 >= 1 && a1 < a2)
      {
        v31 = -v14;
        do
        {
          v32 = a3 + v31;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v29 + v31, (uint64_t)v12);
          v33 = a2 + v31;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a2 + v31, (uint64_t)v10);
          v34 = v12[2];
          v35 = v10[2];
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v10);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v12);
          if (v35 >= v34)
          {
            v36 = v42;
            v37 = v42 + v31;
            v42 += v31;
            if (a3 < v36 || v32 >= v36)
            {
              swift_arrayInitWithTakeFrontToBack(a3 + v31, v37, 1, v41);
            }
            else if (a3 != v36)
            {
              swift_arrayInitWithTakeBackToFront(a3 + v31);
            }
            v33 = a2;
          }
          else
          {
            if (a3 < a2 || v32 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack(a3 + v31, a2 + v31, 1, v41);
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront(a3 + v31);
            }
            v44 += v31;
          }
          v29 = v42;
          if (v42 <= a4)
            break;
          a2 = v33;
          a3 += v31;
        }
        while (v33 > a1);
      }
      goto LABEL_68;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a1, v16, v41);
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront(a4);
    }
    v20 = a4 + v18;
    v42 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a2, (uint64_t)v12);
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a4, (uint64_t)v10);
        v22 = v12[2];
        v23 = v10[2];
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v10);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v12);
        v24 = v44;
        if (v23 >= v22)
        {
          v27 = v43 + v14;
          if (v44 < v43 || v44 >= v27)
          {
            swift_arrayInitWithTakeFrontToBack(v44, v43, 1, v41);
          }
          else if (v44 != v43)
          {
            swift_arrayInitWithTakeBackToFront(v44);
          }
          v43 = v27;
          v25 = a2;
        }
        else
        {
          v25 = a2 + v14;
          if (v44 < a2 || v44 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack(v44, a2, 1, v41);
          }
          else if (v44 == a2)
          {
            v24 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront(v44);
          }
        }
        v44 = v24 + v14;
        a4 = v43;
        if (v43 >= v20)
          break;
        a2 = v25;
      }
      while (v25 < a3);
    }
LABEL_68:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(&v44, &v43, (uint64_t *)&v42);
    return 1;
  }
LABEL_72:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v27;
  unint64_t v29;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t result;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;

  v50 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v8 = __chkstk_darwin(v50);
  v51 = (uint64_t)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v11 = (char *)&v47 - v10;
  v13 = *(_QWORD *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  if (a2 - a1 == 0x8000000000000000 && v13 == -1)
    goto LABEL_71;
  v14 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1)
    goto LABEL_72;
  v15 = (uint64_t)(a2 - a1) / v13;
  v54 = a1;
  v53 = a4;
  v16 = v14 / v13;
  if (v15 >= v14 / v13)
  {
    if ((v16 & 0x8000000000000000) == 0)
    {
      v18 = v16 * v13;
      if (a4 < a2 || a2 + v18 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack(a4, a2, v16, v50);
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront(a4);
      }
      v29 = a4 + v18;
      v52 = a4 + v18;
      v54 = a2;
      if (v18 >= 1 && a1 < a2)
      {
        v31 = -v13;
        v48 = a4;
        v49 = a1;
        do
        {
          v32 = a3 + v31;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v29 + v31, (uint64_t)v11);
          v33 = a2 + v31;
          v34 = a3;
          v35 = (uint64_t)v11;
          v36 = v51;
          outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a2 + v31, v51);
          v37 = *(_QWORD *)(v35 + 24);
          v38 = *(_QWORD *)(v36 + 24);
          v39 = v36;
          v11 = (char *)v35;
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v39);
          outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v35);
          if (v37 >= v38)
          {
            v43 = v52;
            v44 = v52 + v31;
            v52 += v31;
            if (v34 < v43 || v32 >= v43)
            {
              swift_arrayInitWithTakeFrontToBack(v32, v44, 1, v50);
              v33 = a2;
              v41 = v48;
              v42 = v49;
            }
            else
            {
              v42 = v49;
              if (v34 != v43)
                swift_arrayInitWithTakeBackToFront(v32);
              v33 = a2;
              v41 = v48;
            }
          }
          else
          {
            if (v34 < a2 || v32 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack(v32, a2 + v31, 1, v50);
              v41 = v48;
              v42 = v49;
            }
            else
            {
              v40 = v34 == a2;
              v41 = v48;
              v42 = v49;
              if (!v40)
                swift_arrayInitWithTakeBackToFront(v32);
            }
            v54 += v31;
          }
          v29 = v52;
          if (v52 <= v41)
            break;
          a2 = v33;
          a3 = v32;
        }
        while (v33 > v42);
      }
      goto LABEL_69;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    v17 = v15 * v13;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a1, v15, v50);
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront(a4);
    }
    v19 = a4 + v17;
    v52 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      v21 = v51;
      do
      {
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a2, (uint64_t)v11);
        outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(a4, v21);
        v22 = *((_QWORD *)v11 + 3);
        v23 = *(_QWORD *)(v21 + 24);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster(v21);
        outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v11);
        v24 = v54;
        if (v22 >= v23)
        {
          v27 = v53 + v13;
          if (v54 < v53 || v54 >= v27)
          {
            swift_arrayInitWithTakeFrontToBack(v54, v53, 1, v50);
          }
          else if (v54 != v53)
          {
            swift_arrayInitWithTakeBackToFront(v54);
          }
          v53 = v27;
          v25 = a2;
        }
        else
        {
          v25 = a2 + v13;
          if (v54 < a2 || v54 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack(v54, a2, 1, v50);
          }
          else if (v54 == a2)
          {
            v24 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront(v54);
          }
        }
        v54 = v24 + v13;
        a4 = v53;
        if (v53 >= v19)
          break;
        a2 = v25;
      }
      while (v25 < a3);
    }
LABEL_69:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(&v54, &v53, (uint64_t *)&v52);
    return 1;
  }
LABEL_73:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

uint64_t specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  v10 = v8 / v7;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v10 * v7)
    return swift_arrayInitWithTakeFrontToBack(v3, v4, v10, result);
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront(v3);
  return result;
}

void (*specialized Dictionary._Variant.subscript.modify(_QWORD *a1, uint64_t a2))(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v5;
  char isUniquelyReferenced_nonNull_native;

  v5 = malloc(0x50uLL);
  *a1 = v5;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v5[8] = specialized Dictionary._Variant.asNative.modify(v5);
  v5[9] = specialized _NativeDictionary.subscript.modify(v5 + 4, a2, isUniquelyReferenced_nonNull_native);
  return Dictionary._Variant.subscript.modifyspecialized ;
}

void Dictionary._Variant.subscript.modifyspecialized (uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 64);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 72))(*(_QWORD *)a1 + 32, 0);
  v2(v1, 0);
  free(v1);
}

void specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<Int, [MOMapLocation]>);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 0;
    v10 = (uint64_t *)(v5 + 64);
    v11 = 1 << *(_BYTE *)(v5 + 32);
    v34 = -1 << v11;
    v35 = v11;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v11 + 63) >> 6;
    v14 = v7 + 64;
    while (1)
    {
      if (v13)
      {
        v21 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v22 = v21 | (v9 << 6);
      }
      else
      {
        v23 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return;
        }
        if (v23 >= v36)
          goto LABEL_36;
        v24 = v10[v23];
        ++v9;
        if (!v24)
        {
          v9 = v23 + 1;
          if (v23 + 1 >= v36)
            goto LABEL_36;
          v24 = v10[v9];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v36)
            {
LABEL_36:
              if ((a2 & 1) != 0)
              {
                if (v35 >= 64)
                  bzero((void *)(v5 + 64), 8 * v36);
                else
                  *v10 = v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v24 = v10[v25];
            if (!v24)
            {
              while (1)
              {
                v9 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_44;
                if (v9 >= v36)
                  goto LABEL_36;
                v24 = v10[v9];
                ++v25;
                if (v24)
                  goto LABEL_33;
              }
            }
            v9 = v25;
          }
        }
LABEL_33:
        v13 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v9 << 6);
      }
      v30 = 8 * v22;
      v31 = *(_QWORD *)(v5 + 56);
      v32 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v30);
      v33 = *(_QWORD *)(v31 + v30);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain(*(_QWORD *)(v31 + v30));
      v15 = static Hasher._hash(seed:_:)(*(_QWORD *)(v8 + 40), v32);
      v16 = -1 << *(_BYTE *)(v8 + 32);
      v17 = v15 & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v14 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v14 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }
          v28 = v18 == v27;
          if (v18 == v27)
            v18 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v18);
        }
        while (v29 == -1);
        v19 = __clz(__rbit64(~v29)) + (v18 << 6);
      }
      *(_QWORD *)(v14 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v20 = 8 * v19;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + v20) = v32;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + v20) = v33;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  swift_release(v5);
  *v3 = v8;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = static Hasher._hash(seed:_:)(*(_QWORD *)(a2 + 40), *v10);
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = (_QWORD *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1)
              *v14 = *v10;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void specialized _NativeDictionary.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<Int, [MOMapLocation]>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    swift_release(v2);
    *v1 = v4;
    return;
  }
  v5 = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)v5 >= v2 + 64 + 8 * v7)
    memmove(v5, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    swift_bridgeObjectRetain(v17);
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
}

void (*specialized _NativeDictionary.subscript.modify(_QWORD *a1, uint64_t a2, char a3))(uint64_t **a1, char a2)
{
  uint64_t *v3;
  uint64_t *v4;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  void (*result)(uint64_t **, char);

  v4 = v3;
  v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[1] = a2;
  v8[2] = v4;
  v9 = *v4;
  v11 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  *((_BYTE *)v8 + 32) = v10 & 1;
  v12 = *(_QWORD *)(v9 + 16);
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }
  else
  {
    v15 = v10;
    v16 = *(_QWORD *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[3] = v11;
      if ((v15 & 1) != 0)
      {
LABEL_8:
        v17 = *(_QWORD *)(*(_QWORD *)(*v4 + 56) + 8 * v11);
LABEL_12:
        *v8 = v17;
        return _NativeDictionary.subscript.modifyspecialized ;
      }
LABEL_11:
      v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      specialized _NativeDictionary.copy()();
      goto LABEL_7;
    }
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v14, a3 & 1);
    v18 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      v11 = v18;
      v8[3] = v18;
      if ((v15 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **, char))KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Int);
  __break(1u);
  return result;
}

void _NativeDictionary.subscript.modifyspecialized (uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *a1;
  v3 = **a1;
  LOBYTE(v4) = *((_BYTE *)*a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (!v3)
      goto LABEL_10;
    v5 = v2[3];
    v6 = *(_QWORD **)v2[2];
    if (((*a1)[4] & 1) != 0)
    {
LABEL_9:
      *(_QWORD *)(v6[7] + 8 * v5) = v3;
LABEL_14:
      v14 = *v2;
      swift_bridgeObjectRetain(v3);
      swift_bridgeObjectRelease(v14);
      free(v2);
      return;
    }
    v7 = v2[1];
    v6[(v5 >> 6) + 8] |= 1 << v5;
    v8 = 8 * v5;
    *(_QWORD *)(v6[6] + v8) = v7;
    *(_QWORD *)(v6[7] + v8) = v3;
    v9 = v6[2];
    v10 = __OFADD__(v9, 1);
    v4 = v9 + 1;
    if (!v10)
      goto LABEL_13;
    __break(1u);
  }
  if (!v3)
  {
LABEL_10:
    if ((v4 & 1) != 0)
      specialized _NativeDictionary._delete(at:)(v2[3], *(_QWORD *)v2[2]);
    goto LABEL_14;
  }
  v5 = v2[3];
  v6 = *(_QWORD **)v2[2];
  if ((v4 & 1) != 0)
    goto LABEL_9;
  v11 = v2[1];
  v6[(v5 >> 6) + 8] |= 1 << v5;
  v12 = 8 * v5;
  *(_QWORD *)(v6[6] + v12) = v11;
  *(_QWORD *)(v6[7] + v12) = v3;
  v13 = v6[2];
  v10 = __OFADD__(v13, 1);
  v4 = v13 + 1;
  if (!v10)
  {
LABEL_13:
    v6[2] = v4;
    goto LABEL_14;
  }
  __break(1u);
}

uint64_t (*specialized Dictionary._Variant.asNative.modify(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return Dictionary._Variant.asNative.modifyspecialized ;
}

uint64_t Dictionary._Variant.asNative.modifyspecialized (uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  _QWORD *v33;
  int64_t v34;
  uint64_t v35;

  v8 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = __chkstk_darwin(v10);
  v15 = (char *)&v30 - v14;
  v35 = a4;
  v18 = *(_QWORD *)(a4 + 56);
  v17 = a4 + 56;
  v16 = v18;
  v19 = -1 << *(_BYTE *)(v17 - 24);
  if (-v19 < 64)
    v20 = ~(-1 << -(char)v19);
  else
    v20 = -1;
  v21 = v20 & v16;
  if (!a2)
  {
    v22 = 0;
    a3 = 0;
LABEL_38:
    *a1 = v35;
    a1[1] = v17;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v32 = -1 << *(_BYTE *)(v17 - 24);
  v33 = a1;
  v22 = 0;
  v23 = 0;
  v34 = (unint64_t)(63 - v19) >> 6;
  v31 = v34 - 1;
  if (!v21)
    goto LABEL_9;
LABEL_8:
  v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    v29 = *(_QWORD *)(v9 + 72);
    outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(*(_QWORD *)(v35 + 48) + v29 * v25, (uint64_t)v12);
    outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v12, (uint64_t)v15);
    result = outlined init with take of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v15, a2);
    if (v23 == a3)
      goto LABEL_37;
    a2 += v29;
    if (v21)
      goto LABEL_8;
LABEL_9:
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v34)
      goto LABEL_32;
    v27 = *(_QWORD *)(v17 + 8 * v26);
    if (!v27)
      break;
LABEL_18:
    v21 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v26 << 6);
    v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v34)
  {
    v21 = 0;
    v22 = v26;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v17 + 8 * v22);
  if (v27)
    goto LABEL_14;
  v28 = v26 + 2;
  if (v26 + 2 >= v34)
    goto LABEL_32;
  v27 = *(_QWORD *)(v17 + 8 * v28);
  if (v27)
    goto LABEL_17;
  v22 = v26 + 3;
  if (v26 + 3 >= v34)
  {
    v21 = 0;
    v22 = v26 + 2;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v17 + 8 * v22);
  if (v27)
  {
LABEL_14:
    v26 = v22;
    goto LABEL_18;
  }
  v28 = v26 + 4;
  if (v26 + 4 >= v34)
  {
LABEL_32:
    v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    v19 = v32;
    a1 = v33;
    goto LABEL_38;
  }
  v27 = *(_QWORD *)(v17 + 8 * v28);
  if (v27)
  {
LABEL_17:
    v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    v26 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v26 >= v34)
    {
      v21 = 0;
      v22 = v31;
      goto LABEL_36;
    }
    v27 = *(_QWORD *)(v17 + 8 * v26);
    ++v28;
    if (v27)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew()(_QWORD *a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v6 = a4 + 8 * a1 + 32;
    v7 = a3 + 8 * v4;
    if (v6 >= v7 || v6 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

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
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t specialized Array.replaceSubrange<A>(_:with:)(uint64_t a1, int64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  char v26;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = v4 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  v15 = *(_QWORD *)(v13 + 72);
  v16 = v15 * a1;
  v17 = v14 + v15 * a1;
  result = swift_arrayDestroy(v17, v7, v12);
  if (!v7)
    goto LABEL_25;
  v19 = *(_QWORD *)(v4 + 16);
  v20 = v19 - a2;
  if (__OFSUB__(v19, a2))
    goto LABEL_31;
  if ((v20 & 0x8000000000000000) == 0)
  {
    v21 = v14 + v15 * a2;
    if (v16 < v15 * a2 || v17 >= v21 + v20 * v15)
    {
      result = swift_arrayInitWithTakeFrontToBack(v17, v21, v20, v12);
    }
    else if (v16 != v15 * a2)
    {
      result = swift_arrayInitWithTakeBackToFront(v17);
    }
    v23 = *(_QWORD *)(v4 + 16);
    v24 = __OFADD__(v23, v8);
    v25 = v23 - v7;
    if (!v24)
    {
      *(_QWORD *)(v4 + 16) = v25;
LABEL_25:
      *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  v26 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v26, 1046, 0);
  __break(1u);
  return result;
}

uint64_t outlined assign with take of MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t specialized MOSuggestionAssetMapsClusterer.printClusters(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  void *object;
  Swift::String v18;
  uint64_t v19;
  void *v20;
  Swift::String v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;

  v2 = type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster(0);
  result = __chkstk_darwin(v2);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v8 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v9 = *(_QWORD *)(v4 + 72);
    v25 = a1;
    swift_bridgeObjectRetain(a1);
    v26 = xmmword_19460;
    do
    {
      outlined init with copy of MOSuggestionAssetMapsClusterer.Cluster(v8, (uint64_t)v6);
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
      v11 = swift_allocObject(v10, 64, 7);
      *(_OWORD *)(v11 + 16) = v26;
      v28 = 0;
      v29 = 0xE000000000000000;
      _StringGuts.grow(_:)(51);
      v12._countAndFlagsBits = 0x616E6964726F6F63;
      v12._object = (void *)0xED0000203A736574;
      String.append(_:)(v12);
      v27 = *(_OWORD *)v6;
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Double, Double));
      _print_unlocked<A, B>(_:_:)(&v27, &v28, v13, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
      v14._countAndFlagsBits = 0x6E6174736964202CLL;
      v14._object = (void *)0xEC000000203A6563;
      String.append(_:)(v14);
      Double.write<A>(to:)(&v28, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, *((double *)v6 + 2));
      v15._countAndFlagsBits = 0x3A746E756F63202CLL;
      v15._object = (void *)0xE900000000000020;
      String.append(_:)(v15);
      *(_QWORD *)&v27 = *((_QWORD *)v6 + 3);
      v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      object = v16._object;
      String.append(_:)(v16);
      swift_bridgeObjectRelease(object);
      v18._countAndFlagsBits = 0x3A6E69616863202CLL;
      v18._object = (void *)0xE900000000000020;
      String.append(_:)(v18);
      v19 = *((_QWORD *)v6 + 4);
      v20 = (void *)*((_QWORD *)v6 + 5);
      swift_bridgeObjectRetain(v20);
      v21._countAndFlagsBits = v19;
      v21._object = v20;
      String.append(_:)(v21);
      swift_bridgeObjectRelease(v20);
      v22 = v28;
      v23 = v29;
      *(_QWORD *)(v11 + 56) = &type metadata for String;
      *(_QWORD *)(v11 + 32) = v22;
      *(_QWORD *)(v11 + 40) = v23;
      print(_:separator:terminator:)(v11, 32, 0xE100000000000000, 10, 0xE100000000000000);
      swift_bridgeObjectRelease(v11);
      outlined destroy of MOSuggestionAssetMapsClusterer.Cluster((uint64_t)v6);
      v8 += v9;
      --v7;
    }
    while (v7);
    return swift_bridgeObjectRelease(v25);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in MOSuggestionAssetMapsClusterer.Cluster()
{
  return lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type MOSuggestionAssetMapsClusterer.Cluster and conformance MOSuggestionAssetMapsClusterer.Cluster, type metadata accessor for MOSuggestionAssetMapsClusterer.Cluster, (uint64_t)&protocol conformance descriptor for MOSuggestionAssetMapsClusterer.Cluster);
}

uint64_t sub_17DAC@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))&stru_68.segname[swift_isaMask & **a1])();
  *a2 = result;
  return result;
}

uint64_t sub_17DEC(_QWORD *a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))&stru_68.segname[(swift_isaMask & **a2) + 8];
  v3 = swift_bridgeObjectRetain(*a1);
  return v2(v3);
}

uint64_t sub_17E2C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & **a1)))();
  *a2 = result;
  return result;
}

uint64_t sub_17E6C(_QWORD *a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((char *)&stru_68.offset + (swift_isaMask & **a2));
  v3 = swift_bridgeObjectRetain(*a1);
  return v2(v3);
}

_QWORD *initializeBufferWithCopyOfBuffer for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v23);
  }
  else
  {
    v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    v8 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v8;
    v9 = a3[8];
    v10 = a1 + v9;
    v11 = (uint64_t)a2 + v9;
    v12 = type metadata accessor for UUID(0);
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain(v8);
    v13(v10, v11, v12);
    v14 = a3[9];
    v15 = a3[10];
    v16 = *(uint64_t *)((char *)a2 + v14);
    *(_QWORD *)((char *)v4 + v14) = v16;
    *(_QWORD *)((char *)v4 + v15) = *(uint64_t *)((char *)a2 + v15);
    v17 = a3[11];
    v18 = a3[12];
    v19 = (_QWORD *)((char *)v4 + v17);
    v20 = (uint64_t *)((char *)a2 + v17);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    *((_BYTE *)v4 + v18) = *((_BYTE *)a2 + v18);
    v22 = a3[14];
    *((_BYTE *)v4 + a3[13]) = *((_BYTE *)a2 + a3[13]);
    *(_QWORD *)((char *)v4 + v22) = *(uint64_t *)((char *)a2 + v22);
    swift_unknownObjectRetain(v16);
    swift_bridgeObjectRetain(v21);
  }
  return v4;
}

uint64_t destroy for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
  v4 = a1 + a2[8];
  v5 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_unknownObjectRelease(*(_QWORD *)(a1 + a2[9]));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[11] + 8));
}

uint64_t initializeWithCopy for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = a3[8];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for UUID(0);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain(v7);
  v12(v9, v10, v11);
  v13 = a3[9];
  v14 = a3[10];
  v15 = *(_QWORD *)(a2 + v13);
  *(_QWORD *)(a1 + v13) = v15;
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  v16 = a3[11];
  v17 = a3[12];
  v18 = (_QWORD *)(a1 + v16);
  v19 = (_QWORD *)(a2 + v16);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  *(_BYTE *)(a1 + v17) = *(_BYTE *)(a2 + v17);
  v21 = a3[14];
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  *(_QWORD *)(a1 + v21) = *(_QWORD *)(a2 + v21);
  swift_unknownObjectRetain(v15);
  swift_bridgeObjectRetain(v20);
  return a1;
}

_QWORD *assignWithCopy for MOSuggestionAssetMapsClusterer.Cluster(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  v6 = a2[5];
  v7 = a1[5];
  a1[5] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a3[8];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[9];
  v13 = *(_QWORD *)((char *)a1 + v12);
  v14 = *(_QWORD *)((char *)a2 + v12);
  *(_QWORD *)((char *)a1 + v12) = v14;
  swift_unknownObjectRetain(v14);
  swift_unknownObjectRelease(v13);
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  v15 = a3[11];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  *v16 = *v17;
  v18 = v17[1];
  v19 = v16[1];
  v16[1] = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  *((_BYTE *)a1 + a3[12]) = *((_BYTE *)a2 + a3[12]);
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  *(_QWORD *)((char *)a1 + a3[14]) = *(_QWORD *)((char *)a2 + a3[14]);
  return a1;
}

_OWORD *initializeWithTake for MOSuggestionAssetMapsClusterer.Cluster(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = a3[8];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[10];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  v12 = a3[12];
  *(_OWORD *)((char *)a1 + a3[11]) = *(_OWORD *)((char *)a2 + a3[11]);
  *((_BYTE *)a1 + v12) = *((_BYTE *)a2 + v12);
  v13 = a3[14];
  *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  return a1;
}

uint64_t assignWithTake for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease(v6);
  v7 = a3[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[9];
  v12 = *(_QWORD *)(a1 + v11);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  swift_unknownObjectRelease(v12);
  v13 = a3[11];
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  v18 = v14[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease(v18);
  v19 = a3[13];
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  *(_BYTE *)(a1 + v19) = *(_BYTE *)(a2 + v19);
  *(_QWORD *)(a1 + a3[14]) = *(_QWORD *)(a2 + a3[14]);
  return a1;
}

uint64_t getEnumTagSinglePayload for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_183B0);
}

uint64_t sub_183B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for UUID(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_18438);
}

uint64_t sub_18438(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 40) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for MOSuggestionAssetMapsClusterer.Cluster(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[11];

  v4[0] = &unk_19688;
  v4[1] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[2] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[3] = &unk_196A0;
  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[4] = *(_QWORD *)(result - 8) + 64;
    v4[5] = &unk_196B8;
    v4[6] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[7] = &unk_196A0;
    v4[8] = &unk_196D0;
    v4[9] = &unk_196D0;
    v4[10] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initStructMetadata(a1, 256, 11, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined consume of Set<MOSuggestionAssetMapsClusterer.Cluster>.Iterator._Variant(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}
