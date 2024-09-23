@implementation EKUICalendarResolutionResult

+ (id)successWithResolvedEKUICalendar:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_1D2BCE130((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithEKUICalendarsToDisambiguate:(id)a3
{
  unint64_t v3;
  id v4;

  type metadata accessor for EKUICalendar();
  v3 = sub_1D2BCFC1C();
  swift_getObjCClassMetadata();
  v4 = sub_1D2BCE1BC(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithEKUICalendarToConfirm:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_1D2BCE344((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result;

  result = (id)sub_1D2BCFED4();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result;

  result = (id)sub_1D2BCFED4();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result;

  result = (id)sub_1D2BCFED4();
  __break(1u);
  return result;
}

- (EKUICalendarResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v6;
  void *v7;
  EKUICalendarResolutionResult *v8;
  EKUICalendarResolutionResult *v9;
  objc_super v11;

  sub_1D2BCFA90();
  v6 = a4;
  v7 = (void *)sub_1D2BCFA84();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for EKUICalendarResolutionResult();
  v8 = -[EKUICalendarResolutionResult initWithJSONDictionary:forIntent:](&v11, sel_initWithJSONDictionary_forIntent_, v7, v6);

  v9 = v8;
  if (v9)

  return v9;
}

@end
